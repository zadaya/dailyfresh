from django.urls import path, re_path

from apps.user.views import RegisterView, ActiveView, ReActiveView, LoginView, LogoutView, UserInfoView, \
    UserOrderView, UserAddressView

urlpatterns = [
    path('register/', RegisterView.as_view(), name='register'),  # 新用户注册
    re_path(r'^active/(?P<token>.*)$', ActiveView.as_view(), name='active'),  # 进行用户激活
    path('re_active/', ReActiveView.as_view(), name='re_active'),  # 重新发送激活邮件
    path('login/', LoginView.as_view(), name='login'),  # 用户登录
    path('logout/', LogoutView.as_view(), name='logout'),  # 用户登出
    path('', UserInfoView.as_view(), name='info'),  # 用户中心——信息页
    re_path(r'^order/(?P<page>\d+)$', UserOrderView.as_view(), name='order'),  # 用户中心——订单页
    path('address/', UserAddressView.as_view(), name='address'),  # 用户中心——地址页
]
