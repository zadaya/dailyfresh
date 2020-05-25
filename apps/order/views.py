from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.generic.base import View
from django.http import JsonResponse
from django.db import transaction
from django.conf import settings

from apps.goods.models import GoodsSKU
from apps.user.models import Address
from utils.mixin import LoginRequiredMixin
from apps.order.models import OrderInfo, OrderGoods

import os
import json
from datetime import datetime
from django_redis import get_redis_connection
from alipay import AliPay, ISVAliPay


# /order/place
class OrderPlaceView(LoginRequiredMixin, View):
    '''提交订单'''

    def post(self, request):
        '''提交订单的处理'''

        # 获取参数sku_ids
        sku_ids = request.POST.getlist('sku_ids')
        # 校验参数
        if not sku_ids:
            errmsg = {'msg': '请至少选择一件商品'}
            return render(request, 'cart.html', {'errmsg': json.dumps('请至少选择一件商品')})
        user = request.user
        conn = get_redis_connection('default')
        cart_key = 'cart_%d' % user.id
        skus = []
        total_count = 0
        total_price = 0
        # 遍历获取sku_id获取用户要购买的商品信息
        for sku_id in sku_ids:
            # 根据sku_id获取商品信息
            sku = GoodsSKU.objects.get(id=sku_id)
            # 获取要购买的数量
            count = conn.hget(cart_key, sku_id)
            # 计算本商品的小计费用
            amount = sku.price * int(count)
            # sku添加单品数量属性
            sku.count = int(count)
            # sku添加小计费用属性
            sku.amount = amount
            # 对该商品的购买信息添加到skus中
            skus.append(sku)
            # 累加当前订单的商品数量和总金额
            total_count += int(count)
            total_price += amount
        # 运费:实际开发中属于一个子系统
        transit_price = 10  # 本系统中直接定位10元
        # 实付款
        total_pay = total_price + transit_price
        # 获取用户收获地址
        address_list = user.address_set.all()
        # 将商品ID信息以字符串形式传递之页面供提交订单使用
        sku_ids = ','.join(sku_ids)
        # 组织上下文
        context = {'skus': skus,
                   'total_count': total_count,
                   'total_price': total_price,
                   'transit_price': transit_price,
                   'total_pay': total_pay,
                   'address_list': address_list,
                   'sku_ids': sku_ids}
        # 返回应答
        return render(request, 'place_order.html', context)


# /order/commit
class OrderCommitView(LoginRequiredMixin, View):
    '''创建订单'''

    @transaction.atomic
    def post(self, request):
        '''创建订单处理'''
        # 接收参数
        user = request.user
        address_id = request.POST.get('address_id')
        pay_method = request.POST.get('pay_method')
        sku_ids = request.POST.get('sku_ids')

        # 校验参数完整性
        if not all([address_id, pay_method, sku_ids]):
            return JsonResponse({'res': -1, 'errmsg': '参数不完整'})
        # 校验支付方式
        if pay_method not in OrderInfo.PAY_METHODS.keys():
            return JsonResponse({'res': -2, 'errmsg': '支付方式不合法'})
        # 校验收货地址
        try:
            addr = Address.objects.get(id=address_id)
        except Address.DoesNotExist:
            # 地址不存在
            return JsonResponse({'res': -3, 'errmsg': '收货地址不存在'})

        # 业务处理：创建订单
        # 生成订单id: 时间(年月日时分秒毫秒)+用户id
        order_id = datetime.now().strftime('%Y%m%d%H%M%S%f') + str(user.id)
        # 运费
        transit_price = 10
        # 总数目和总金额
        total_count = 0
        total_price = 0

        # 设置事务保存点
        save_id = transaction.savepoint()
        try:
            # todo:创建一条订单信息记录
            order = OrderInfo.objects.create(order_id=order_id,
                                             user=user,
                                             addr=addr,
                                             pay_method=pay_method,
                                             total_count=total_count,
                                             total_price=total_price,
                                             transit_price=transit_price)
            # todo:创建N条订单商品记录
            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id

            sku_ids = sku_ids.split(',')
            for sku_id in sku_ids:
                for i in range(3):
                    # 获取商品信息
                    try:
                        sku = GoodsSKU.objects.get(id=sku_id)
                    except GoodsSKU.DoesNotExist:
                        transaction.savepoint_rollback(save_id)
                        return JsonResponse({'res': -4, 'errmsg': '商品不存在'})
                    # 获取商品要购买的数量
                    count = conn.hget(cart_key, sku_id)

                    # todo:判断商品的库存
                    if int(count) > sku.stock:
                        transaction.savepoint_rollback(save_id)
                        return JsonResponse({'res': -5, 'errmsg': '商品库存不足'})

                    # todo:更新对应商品的库存和销量
                    orgin_stock = sku.stock
                    new_stock = orgin_stock - int(count)
                    new_sales = sku.sales + int(count)

                    print('订单处理: user:%d count:%d stock:%d' % (user.id, int(count), sku.stock))
                    # import time
                    # time.sleep(10)
                    # todo: 更新商品的库存和销量（使用乐观锁方式处理并发）
                    # 返回受影响的行数
                    res = GoodsSKU.objects.filter(id=sku_id, stock=orgin_stock).update(stock=new_stock, sales=new_sales)
                    if res == 0:
                        if i == 2:
                            # 尝试第3次失败后
                            transaction.savepoint_rollback(save_id)
                            return JsonResponse({'res': -7, 'errmsg': '下单失败(2)'})
                        continue
                    # todo:添加一条订单商品表的记录
                    OrderGoods.objects.create(order=order,
                                              sku=sku,
                                              count=count,
                                              amount=sku.price * int(count))
                    # 累加计算得到订单的商品总数和总金额
                    amount = sku.price * int(count)
                    total_count += int(count)
                    total_price += amount

                    # 并发处理时若执行到此处认为订单创建成功，跳出循环
                    break

            # todo: 更新计算好的商品总数目和总金额到订单信息中
            order.total_count = total_count
            order.total_price = total_price
            order.save()
        except Exception as e:
            transaction.savepoint_rollback(save_id)
            return JsonResponse({'res': -6, 'errmsg': '下单失败'})
        # 提交事务
        transaction.savepoint_commit(save_id)
        # todo: 将对应的商品信息从购物车中删除
        conn.hdel(cart_key, *sku_ids)  # *sku_ids相当与[sku_id1,sku_id2,......,sku_idn]

        # 返回应答
        return JsonResponse({'res': 1, 'message': '创建成功'})


# ajax post
# /order/pay
class OrderPayView(View):
    '''订单支付'''

    def post(self, request):
        '''处理支付请求'''
        # 用户是否登录
        user = request.user
        if not user.is_authenticated:
            return JsonResponse({'res': -1, 'errmsg': '用户未登录'})

        # 接收参数
        order_id = request.POST.get('order_id')
        # 校验参数
        if not order_id:
            return JsonResponse({'res': -2, 'errmsg': '无效的订单ID'})
        try:
            order = OrderInfo.objects.get(order_id=order_id,
                                          user=user,
                                          pay_method=3,
                                          order_status=1)
        except OrderInfo.DoesNotExist:
            return JsonResponse({'res': -3, 'errmsg': '订单错误'})
        total_pay = order.total_price + order.transit_price  # 计算得到订单应付总金额

        # 业务处理:使用Python SDK调用支付宝的电脑网站支付接口
        # 初始化
        app_private_key_string = open(os.path.join(settings.BASE_DIR, 'apps/order/app_private_key.pem')).read()
        alipay_public_key_string = open(os.path.join(settings.BASE_DIR, 'apps/order/alipay_public_key.pem')).read()
        alipay = AliPay(
            appid="2016102100732704",  # 应用ID
            app_notify_url=None,  # 默认回调url
            app_private_key_string=app_private_key_string,
            # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥
            alipay_public_key_string=alipay_public_key_string,
            sign_type="RSA2",  # RSA 或者 RSA2
            debug=True  # 默认False
        )
        # 调用支付接口
        # 电脑网站支付，需要跳转到https://openapi.alipaydev.com/gateway.do? + order_string
        order_string = alipay.api_alipay_trade_page_pay(
            out_trade_no=order_id,  # 订单ID
            total_amount=str(total_pay),
            subject='每日生鲜%s' % order_id,
            return_url=None,
            notify_url=None  # 可选, 不填则使用默认notify url
        )

        # 返回应答
        pay_url = "https://openapi.alipaydev.com/gateway.do?" + order_string
        return JsonResponse({'res': 1, 'pay_url': pay_url})


# ajax post
# /order/checkpay
class OrderCheckPay(View):
    '''查询订单支付的结果'''

    def post(self, request):
        '''处理浏览器支付结果查询请求'''
        # 用户是否登录
        user = request.user
        if not user.is_authenticated:
            return JsonResponse({'res': -1, 'errmsg': '用户未登录'})

        # 接收参数
        order_id = request.POST.get('order_id')
        # 校验参数
        if not order_id:
            return JsonResponse({'res': -2, 'errmsg': '无效的订单ID'})
        try:
            order = OrderInfo.objects.get(order_id=order_id,
                                          user=user,
                                          pay_method=3,
                                          order_status=1)
        except OrderInfo.DoesNotExist:
            return JsonResponse({'res': -3, 'errmsg': '订单错误'})
        total_pay = order.total_price + order.transit_price  # 计算得到订单应付总金额

        # 业务处理:使用Python SDK调用支付宝的交易查询接口
        # 初始化
        app_private_key_string = open(os.path.join(settings.BASE_DIR, 'apps/order/app_private_key.pem')).read()
        alipay_public_key_string = open(os.path.join(settings.BASE_DIR, 'apps/order/alipay_public_key.pem')).read()
        alipay = AliPay(
            appid="2016102100732704",  # 应用ID
            app_notify_url=None,  # 默认回调url
            app_private_key_string=app_private_key_string,
            # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥
            alipay_public_key_string=alipay_public_key_string,
            sign_type="RSA2",  # RSA 或者 RSA2
            debug=True  # 默认False
        )
        while True:
            # 调用支付宝交易查询接口, https://openapi.alipaydev.com/gateway.do? + order_string
            response = alipay.api_alipay_trade_query(order_id)
            code = response.get('code')
            if code == '10000' and (response.get('trade_status') == 'TRADE_SUCCESS'):
                # 支付成功
                # 获取支付宝交易号
                trade_no = response.get('trade_no')
                # 更新订单状态
                order.trade_no = trade_no
                order.order_status = 4
                order.save()
                # 返回结果
                return JsonResponse({'res': 1, 'message': '支付成功'})
            elif code == '40004' or (code == '10000' and response.get('trade_status') == 'WAIT_BUYER_PAY'):
                # 等待买家付款
                import time
                time.sleep(5)
                continue
            else:
                # 支付出错
                print(code)
                print(response.get('trade_status'))
                return JsonResponse({'res': -4, 'errmsg': '支付错误'})


# /order/checkpay
class CommentView(LoginRequiredMixin, View):
    """订单评论"""

    def get(self, request, order_id):
        """提供评论页面"""
        user = request.user

        # 校验数据
        if not order_id:
            return redirect(reverse('user:order'))

        try:
            order = OrderInfo.objects.get(order_id=order_id, user=user)
        except OrderInfo.DoesNotExist:
            return redirect(reverse('user:order'))

        # 根据订单的状态获取订单的状态标题
        order.status_name = OrderInfo.ORDER_STATUS[order.order_status]

        # 获取订单商品信息
        order_skus = OrderGoods.objects.filter(order_id=order_id)
        # 动态给order增加属性order_skus, 保存订单商品信息
        order.order_skus = order_skus

        # 使用模板
        return render(request, 'order_comment.html', {'order': order})

    def post(self, request, order_id):
        """处理评论内容"""
        user = request.user
        # 校验数据
        if not order_id:
            return redirect(reverse('user:order'))

        try:
            order = OrderInfo.objects.get(order_id=order_id, user=user)
        except OrderInfo.DoesNotExist:
            return redirect(reverse("user:order"))

        # 获取评论条数
        total_count = request.POST.get("total_count")
        total_count = int(total_count)

        # 循环获取订单中商品的评论内容
        for i in range(1, total_count + 1):
            # 获取评论的商品的id
            sku_id = request.POST.get("sku_%d" % i)  # sku_1 sku_2
            # 获取评论的商品的内容
            content = request.POST.get('content_%d' % i, '')  # cotent_1 content_2 content_3
            try:
                order_goods = OrderGoods.objects.get(order=order, sku_id=sku_id)
            except OrderGoods.DoesNotExist:
                continue

            order_goods.comment = content
            order_goods.save()

        order.order_status = 5  # 已完成
        order.save()

        return redirect(reverse("user:order", kwargs={"page": 1}))

# todo: 悲观锁方式处理并发
# # /order/commit
# class OrderCommitView1(LoginRequiredMixin, View):
#     '''创建订单'''
#
#     @transaction.atomic
#     def post(self, request):
#         '''创建订单处理'''
#         # 接收参数
#         user = request.user
#         address_id = request.POST.get('address_id')
#         pay_method = request.POST.get('pay_method')
#         sku_ids = request.POST.get('sku_ids')
#
#         # 校验参数完整性
#         if not all([address_id, pay_method, sku_ids]):
#             return JsonResponse({'res': -1, 'errmsg': '参数不完整'})
#         # 校验支付方式
#         if pay_method not in OrderInfo.PAY_METHODS.keys():
#             return JsonResponse({'res': -2, 'errmsg': '支付方式不合法'})
#         # 校验收货地址
#         try:
#             addr = Address.objects.get(id=address_id)
#         except Address.DoesNotExist:
#             # 地址不存在
#             return JsonResponse({'res': -3, 'errmsg': '收货地址不存在'})
#
#         # 业务处理：创建订单
#         # 生成订单id: 时间(年月日时分秒毫秒)+用户id
#         order_id = datetime.now().strftime('%Y%m%d%H%M%S%f') + str(user.id)
#         # 运费
#         transit_price = 10
#         # 总数目和总金额
#         total_count = 0
#         total_price = 0
#
#         # 设置事务保存点
#         save_id = transaction.savepoint()
#         try:
#             # todo:创建一条订单信息记录
#             order = OrderInfo.objects.create(order_id=order_id,
#                                              user=user,
#                                              addr=addr,
#                                              pay_method=pay_method,
#                                              total_count=total_count,
#                                              total_price=total_price,
#                                              transit_price=transit_price)
#             # todo:创建N条订单商品记录
#             conn = get_redis_connection('default')
#             cart_key = 'cart_%d' % user.id
#
#             sku_ids = sku_ids.split(',')
#             for sku_id in sku_ids:
#                 import time
#                 time.sleep(10)
#                 # 获取商品信息
#                 try:
#                     # 数据库查询加悲观锁（select_for_update()）
#                     sku = GoodsSKU.objects.select_for_update().get(id=sku_id)
#                 except GoodsSKU.DoesNotExist:
#                     transaction.savepoint_rollback(save_id)
#                     return JsonResponse({'res': -4, 'errmsg': '商品不存在'})
#                 # 获取商品要购买的数量
#                 count = conn.hget(cart_key, sku_id)
#
#                 # todo:判断商品的库存
#                 if int(count) > sku.stock:
#                     transaction.savepoint_rollback(save_id)
#                     return JsonResponse({'res': -5, 'errmsg': '商品库存不足'})
#
#                 # todo:添加一条订单商品表的记录
#                 OrderGoods.objects.create(order=order,
#                                           sku=sku,
#                                           count=count,
#                                           price=sku.price)
#                 # todo:更新对应商品的库存和销量
#                 sku.stock -= int(count)
#                 sku.sales += int(count)
#                 sku.save()
#                 # 累加计算得到订单的商品总数和总金额
#                 amount = sku.price * int(count)
#                 total_count += int(count)
#                 total_price += amount
#
#             # todo: 更新计算好的商品总数目和总金额到订单信息中
#             order.total_count = total_count
#             order.total_price = total_price
#             order.save()
#         except Exception as e:
#             transaction.savepoint_rollback(save_id)
#             return JsonResponse({'res': -6, 'message': '下单失败'})
#         # 提交事务
#         transaction.savepoint_commit(save_id)
#         # todo: 将对应的商品信息从购物车中删除
#         conn.hdel(cart_key, *sku_ids)  # *sku_ids相当与[sku_id1,sku_id2,......,sku_idn]
#
#         # 返回应答
#         return JsonResponse({'res': 1, 'message': '创建成功'})
