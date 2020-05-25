from django.http import JsonResponse
from django.shortcuts import render
from django.views.generic import View
from django_redis import get_redis_connection
from apps.user.views import LoginRequiredMixin
from apps.goods.models import GoodsSKU


# /cart
class CartView(LoginRequiredMixin, View):
    '''购物车页面'''

    def get(self, request):
        '''显示用户购物车页面'''
        # 获取登录的用户信息
        user = request.user
        # 获取redis中相应的sku_id及数量
        conn = get_redis_connection()
        cart_key = 'cart_%d' % user.id
        cart_dict = conn.hgetall(cart_key)

        skus = []
        total_count = 0
        total_price = 0
        # 遍历得到商品id和对应的商品数量
        for sku_id, count in cart_dict.items():
            # 根据sku_id获取商品信息
            sku = GoodsSKU.objects.get(id=sku_id)
            # 将商品数量动态保存到sku对象中
            sku.count = int(count)
            # 计算商品的小计金额并动态添加给sku对象
            amount = sku.price * int(count)
            sku.amount = amount
            # 添加到列表方便返回数据
            skus.append(sku)
            # 累加计算总数目及总价格
            total_count += int(count)
            total_price += amount

        # 组装数据并返回
        context = {'res': 1,
                   'message': '获取购物车信息成功',
                   'skus': skus,
                   'total_count': total_count,
                   'total_price': total_price}

        return render(request, 'cart.html', context)


# /cart/add
class CartAddView(View):
    '''购物车记录添加'''

    def post(self, request):
        '''购物车记录添加'''
        user = request.user
        if not user.is_authenticated:
            return JsonResponse({'res': -1, 'errmsg': '请登录后操作'})
        # 接受数据
        sku_id = request.POST.get('sku_id')
        count = request.POST.get('count')

        # 数据校验
        # 校验数据是否完整
        if not all([sku_id, count]):
            return JsonResponse({'res': -2, 'errmsg': '数据不完整'})
        # 校验添加的商品数量
        try:
            count = int(count)
        except Exception as e:
            # 数目出错
            return JsonResponse({'res': -3, 'errmsg': '商品数目出错'})
        # 校验商品是否存在
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return JsonResponse({'res': -4, 'errmsg': '商品不存在'})

        # 业务处理：添加购物车记录
        # 获取redis链接
        conn = get_redis_connection('default')
        cart_key = 'cart_%d' % user.id
        # 尝试获取购物车中同一商品的数目 -> hget cart_key sku_id
        # 如果不存在相同商品，hget返回None
        same_sku_count = conn.hget(cart_key, sku_id)

        if same_sku_count:
            # 累加购物车中同一商品的数量 hget()返回值为bytes，需转换一下
            count += int(same_sku_count)
        # 校验库存是否满足添加后的累计商品数量
        if count > sku.stock:
            return JsonResponse({'res': -5, 'errmsg': '库存不足'})

        # 进行购物车信息更新，若存在即更新，若不存在则为插入
        conn.hset(cart_key, sku_id, count)

        # 重新计算用户购物车中的商品条目数
        cart_count = conn.hlen(cart_key)

        # 返回应答
        return JsonResponse({'res': 1, 'message': '添加成功', 'cart_count': cart_count})


# /cart/update
class CartUpdateView(LoginRequiredMixin, View):
    '''由购物车页面更新购物车'''

    def post(self, request):
        '''处理购物车更新请求'''

        user = request.user
        if not user.is_authenticated:
            return JsonResponse({'res': -1, 'errmsg': '请登录后操作'})
        # 接受数据
        sku_id = request.POST.get('sku_id')
        count = request.POST.get('count')

        # 数据校验
        # 校验数据是否完整
        if not all([sku_id, count]):
            return JsonResponse({'res': -2, 'errmsg': '数据不完整'})
        # 校验添加的商品数量
        try:
            count = int(count)
        except Exception as e:
            # 数目出错
            return JsonResponse({'res': -3, 'errmsg': '商品数目出错'})
        # 校验商品是否存在
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return JsonResponse({'res': -4, 'errmsg': '商品不存在'})

        # 业务处理：更新购物车记录
        # 获取redis链接
        conn = get_redis_connection('default')
        cart_key = 'cart_%d' % user.id

        if count > sku.stock:
            return JsonResponse({'res': -5, 'errmsg': '库存不足', 'sku_stock': sku.stock})

        print("库存：%d\n预购：%d" % (sku.stock, count))
        # 进行购物车信息更新，若存在即更新
        conn.hset(cart_key, sku_id, count)

        # 计算用户购物车中商品的总件数
        total_count = 0
        vals = conn.hvals(cart_key)
        for val in vals:
            total_count += int(val)
        # 返回应答
        return JsonResponse({'res': 1, 'message': '更新成功', 'total_count': total_count})


# /cart/delete
class CartDeleteView(LoginRequiredMixin, View):
    '''购物车记录删除'''

    def post(self, request):
        '''购物车删除记录请求的处理'''
        # 接收数据
        user = request.user
        sku_id = request.POST.get('sku_id')

        # 数据校验
        if not sku_id:
            return JsonResponse({'res': -1, 'errmsg': '无效的商品'})
        # 检查商品是否存在
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            # 商品不存在
            return JsonResponse({'res': -2, 'errmsg': '商品不存在'})

        # 业务处理：删除购物车记录
        conn = get_redis_connection('default')
        cart_key = 'cart_%d' % user.id

        # 删除该用户对应的购物车商品
        conn.hdel(cart_key, sku_id)

        # 计算用户购物车中商品的总件数
        total_count = 0
        vals = conn.hvals(cart_key)
        for val in vals:
            total_count += int(val)

        # 返回应答
        return JsonResponse({'res': 1, 'message': '删除成功', 'total_count': total_count})
