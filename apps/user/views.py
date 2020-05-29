import re
import time

from django.core.paginator import Paginator
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from django.contrib.auth import authenticate, login, logout
from django.views.generic import View
from django_redis import get_redis_connection
from itsdangerous import TimedJSONWebSignatureSerializer as Serializer, SignatureExpired

from celery_tasks.tasks import send_register_active_email, send_reset_pwd_email
from dailyfresh import settings
from apps.user.models import User, Address
from apps.goods.models import GoodsSKU
from apps.order.models import OrderInfo, OrderGoods
from utils.mixin import LoginRequiredMixin


# /user/register
class RegisterView(View):
    '''注册'''

    def get(self, request):
        '''显示注册界面'''
        return render(request, 'register.html')

    def post(self, request):
        '''进行注册处理'''
        # 1.接受数据
        username = request.POST.get('user_name')
        password = request.POST.get('pwd')
        email = request.POST.get('email')
        allow = request.POST.get('allow')

        # 2.进行数据校验
        if not all([username, password, email]):
            # 若数据不完整
            return render(request, 'register.html', {'errmsg': '数据不完整'})
        if len(username) < 5 or len(username) > 20:
            # 若用户名长度不足5或超过20
            return render(request, 'register.html', {'errmsg': '请输入5-20个字符的用户名'})
        if len(password) < 6 or len(password) > 20:
            # 若密码长度不足6或超过20
            return render(request, 'register.html', {'errmsg': '密码最少6位，最长20位'})
        if password != request.POST.get('cpwd'):
            # 若两次输入的密码不一致
            return render(request, 'register.html', {'errmsg': '两次输入的密码不一致'})
        if not re.match(r'^[a-zA-Z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$', email):
            # 若邮箱地址不合法
            return render(request, 'register.html', {'errmsg': '邮箱地址不合法'})
        if allow != 'on':
            return render(request, 'register.html', {'errmsg': '请先同意协议'})
        try:
            # 检查用户是否存在
            user = User.objects.get(username__exact=username)
        except User.DoesNotExist:
            user = None
        if user:
            return render(request, 'register.html', {'errmsg': '用户名已存在'})

        # 3.进行业务处理:  进行用户注册
        user = User.objects.create_user(username, email, password)
        user.is_active = 0  # 设置激活状态为未激活
        user.save()

        # 4.发送激活邮件，包含激活链接:http://127.0.0.1:8000/user/active/+用户id加密信息
        # 激活链接中需要包含用户的身份信息，并且要进行加密
        serializer = Serializer(settings.SECRET_KEY, 3600)
        info = {'confirm': user.id}
        token = serializer.dumps(info)  # 返回的为字节码但解密过程接受参数为字符串
        token = token.decode('utf8')  # 将字节码转为字符串
        print('发送激活邮件: username:' + username + '\nemail:' + email)
        # 发邮件 使用经过Celery.task()装饰后的delay()启用异步处理，避免等待
        send_register_active_email.delay(email, username, token)
        time.sleep(1)

        # 5.返回应答
        return redirect(reverse('user:login'))


# /user/active/*
class ActiveView(View):
    '''激活'''

    def get(self, request, token):
        '''进行用户激活'''
        # 进行解密,获取用户ID
        serializer = Serializer(settings.SECRET_KEY, 3600)
        try:
            info = serializer.loads(token)
            user_id = info['confirm']
            # 根据ID获取用户信息
            user = User.objects.get(id=user_id)
            user.is_active = 1
            user.save()

            # 跳转到登陆页面
            return redirect(reverse('user:login'))
        except SignatureExpired as e:
            # 激活链接已过期
            return HttpResponse('激活链接已过期')


# /user/re_active
class ReActiveView(View):
    '''申请重新激活'''

    def post(self, request):
        userid = request.POST.get('userid')
        print(userid)
        user = User.objects.get(id=userid)
        serializer = Serializer(settings.SECRET_KEY, 3600)
        info = {'confirm': user.id}
        token = serializer.dumps(info)  # 返回的为字节码但解密过程接受参数为字符串
        token = token.decode('utf8')  # 将字节码转为字符串
        print('重新发送激活邮件: username:' + user.username + '\nemail:' + user.email)

        # 发邮件 使用经过Celery.task()装饰后的delay()启用异步处理，避免等待
        send_register_active_email.delay(user.email, user.username, token)

        message = '尊敬的' + user.username + '，您的激活链接已发送，请及时查看并激活'
        return JsonResponse({'res': 1, 'message': message})


# /user/login
class LoginView(View):
    '''登陆'''

    def get(self, request):
        '''显示登陆页面'''
        # 判断是否记住了用户名

        if 'username' in request.COOKIES:
            username = request.COOKIES.get('username')
            checked = 'checked'
        else:
            username = ''
            checked = ''

        return render(request, 'login.html', {'username': username, 'checked': checked})

    def post(self, request):
        '''进行登陆操作'''
        # 接收数据
        username = request.POST.get('username')
        password = request.POST.get('pwd')
        # 校验数据完整性
        if not all([username, password]):
            return render(request, 'login.html', {'errmsg': '数据不完整'})
        # 业务处理:登陆校验
        # user = User.objects.get(username__exact=username, password__exact=password)
        user = authenticate(username=username, password=password)
        print(user)
        if user is not None:
            # 用户名和密码正确
            print('用户名和密码正确')
            if user.is_active:
                # 用户已激活
                print('用户已激活')
                # 记录用户的登陆状态
                login(request, user)
                # 获取登陆前的地址进行跳转
                next_url = request.GET.get('next', reverse('goods:index'))  # 若GET.get获取不到next的值则默认为主页地址
                # 重定向到next_url
                response = redirect(next_url)
                # 是否记住用户名
                if request.POST.get('remember') == 'on':
                    response.set_cookie('username', username, max_age=7 * 24 * 3600)
                else:
                    response.delete_cookie('username')
                return response

            else:
                # 用户未激活
                print('error：账户未激活')
                go_active = '<a href="javascript:;" class="re_active" userid="' + str(user.id) + '">重新发送该用户的激活邮件</a>'
                return render(request, 'login.html', {'errmsg': '账户未激活', 'go_active': go_active})

        else:
            return render(request, 'login.html', {'errmsg': '用户名或密码错误'})


# /user/logout
class LogoutView(View):
    '''退出'''

    def get(self, request):
        '''退出登陆'''
        logout(request)

        # 跳转到首页
        return redirect(reverse('goods:index'))


# /user
class UserInfoView(LoginRequiredMixin, View):
    '''用户中心——信息页'''

    def get(self, request):
        # 获取用户的个人信息
        user = request.user
        username = user.username
        def_addr = Address.objects.get_defaule_address(user)
        # 获取用户的历史浏览记录
        con = get_redis_connection('default')
        history_key = 'history_%d' % user.id
        sku_ids = con.lrange(history_key, 0, 4)
        # 按照缓存的id顺序遍历的从数据库中查询用户浏览商品的信息
        goods_li = []
        for id in sku_ids:
            goods_li.append(GoodsSKU.objects.get(id=id))
        # 组织上下文
        context = {'page': 'info',
                   'username': username,
                   'def_addr': def_addr,
                   'goods_li': goods_li}
        return render(request, 'user_center_info.html', context)


# /user/order
class UserOrderView(LoginRequiredMixin, View):
    '''用户中心——订单页'''

    def get(self, request, page):
        '''获取用户的订单信息'''
        user = request.user
        orders = OrderInfo.objects.filter(user=user).order_by('order_status', '-create_time')
        # 对数据进行分页 (list数据, 每页的个数)
        paginator = Paginator(orders, 2)
        # 获取第page页的内容
        try:
            page = int(page)
        except Exception as e:
            page = 1  # 页码不存在或错误默认返回第一页
        # 如果页码超出当前分页范围则返回第一页
        if page > paginator.num_pages:
            page = 1
        # 获取第page页的Page实例对象
        orders_page = paginator.page(page)
        for order in orders_page:
            order.order_goods_list = order.ordergoods_set.all()
            order.order_status_name = OrderInfo.ORDER_STATUS[order.order_status]
            order.total_cost = order.total_price + order.transit_price
            print(order.total_cost)
        is_have_order = True
        if len(orders_page.object_list) == 0:
            is_have_order = False

        # todo: 进行页码的控制，页面上最多显示5个页码
        # a.如果总页数小于5页，则显示所有页码
        # b.如果当前页是总页数前3页，则显示1-5页
        # c.如果当前页是总页数后3页，则显示后5页
        # d.其他情况，显示当前页的前2页，当前页，后2页
        num_pages = paginator.num_pages
        if num_pages < 5:
            pages = range(1, num_pages + 1)
        elif page <= 3:
            pages = range(1, 6)
        elif page >= num_pages - 2:
            pages = range(num_pages - 4, num_pages + 1)
        else:
            pages = range(page - 2, page + 3)
        context = {'page': 'order',
                   'orders_page': orders_page,
                   'pages': pages,
                   'is_have_order': is_have_order}
        return render(request, 'user_center_order.html', context)


# /user/address
class UserAddressView(LoginRequiredMixin, View):
    '''用户中心——地址页'''

    def get(self, request):
        '''显示页面'''
        # 获取登陆用户对应的User对象
        user = request.user
        # try:
        #     def_addr = Address.objects.get(user=user, is_default=True)
        # except Address.DoesNotExist:
        #     # 不存在默认地址
        #     def_addr = None
        def_addr = Address.objects.get_defaule_address(user)
        # 返回应答：地址对象
        return render(request, 'user_center_site.html', {'page': 'address', 'def_addr': def_addr})

    def post(self, request):
        '''地址的添加'''
        # 接收数据
        receiver = request.POST.get('receiver')
        address = request.POST.get('address')
        zip_code = request.POST.get('zip_code')
        phone = request.POST.get('phone')

        # 校验数据
        if not all([receiver, address, phone]):
            return render(request, 'user_center_site.html', {'error': '数据不完整'})
        # 校验手机号
        if not re.match(r'^1[3|4|5|7|8][0-9]{9}$', phone):
            return render(request, 'user_center_site.html', {'error': '手机格式错误'})
        # 业务处理：地址添加
        # 如果用户已存在默认地址，添加的新地址不作默认，否则设为默认收货地址
        # 获取登陆用户对应的User对象
        user = request.user
        def_addr = Address.objects.get_defaule_address(user)
        if def_addr:
            # 默认地址存在，则新添加地址不为默认
            is_default = False
        else:
            is_default = True
        Address.objects.create(user=user, receiver=receiver, addr=address, zip_code=zip_code, phone=phone,
                               is_default=is_default)
        # 返回应答，刷新页面信息
        return redirect(reverse('user:address'))  # 重定向使用get该地址即可


# /user/reset_pwd
class UserResetPwdView(View):
    '''用户重置密码'''

    def post(self, request):
        '''发送用户的重置密码邮件'''
        username = request.POST.get('username')
        password = request.POST.get('password')
        if not all([username, password]):
            return JsonResponse({'res': -1, 'errmsg': '数据不完整'})
        try:
            user = User.objects.get(username__exact=username)
        except User.DoesNotExist:
            return JsonResponse({'res': -2, 'errmsg': '用户不存在，请重新输入'})

        # 发送重置密码邮件，包含激活链接:http://127.0.0.1:8000/user/reset_pwd/+用户id加密信息
        # 激活链接中需要包含用户的身份信息，并且要进行加密
        serializer = Serializer(settings.SECRET_KEY, 1800)
        info = {'confirm': user.id, 'password': password}
        token = serializer.dumps(info)  # 返回的为字节码但解密过程接受参数为字符串
        token = token.decode('utf8')  # 将字节码转为字符串

        print('发送重置密码邮件: username:' + user.username + '\nemail:' + user.email)
        send_reset_pwd_email(user.email, user.username, token)
        time.sleep(1)
        return JsonResponse({'res': 1, 'message': user.email})

    def get(self, request):
        '''进行用户密码重置'''
        # 进行解密,获取用户ID
        token = request.GET.get('token')
        print(token)
        serializer = Serializer(settings.SECRET_KEY, 1800)
        try:
            info = serializer.loads(token)
            user_id = info['confirm']
            new_password = info['password']
            user = User.objects.get(id=user_id)
            user.set_password(new_password)
            user.save()
        except SignatureExpired as e:
            # 重置密码链接已过期
            return HttpResponse('重置密码链接已过期')
        except User.DoesNotExist:
            return HttpResponse('用户信息错误，密码重置失败')
        # 跳转到登陆页面
        return redirect(reverse('user:login'))

# session 测试
# class SessionTestView:
#     # /set_session
#     def set_session(request):
#         request.session['username'] = 'zdy'
#         request.session['password'] = '123456'
#
#         return HttpResponse('session 设置成功～！')
#
#     # /get_session
#     def get_session(request):
#         username = request.session['username']
#         password = request.session['password']
#
#         return HttpResponse('username = %s<br />password = %s' % (username, password))
