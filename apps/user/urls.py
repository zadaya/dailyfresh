from django.urls import path, re_path

from apps.user.views import RegisterView, ActiveView, LoginView, LogoutView, UserInfoView, UserOrderView, \
    UserAddressView

urlpatterns = [
    path('register/', RegisterView.as_view(), name='register'),
    re_path(r'^active/(?P<token>.*)$', ActiveView.as_view(), name='active'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('', UserInfoView.as_view(), name='info'),  # 用户中心——信息页
    re_path(r'^order/(?P<page>\d+)$', UserOrderView.as_view(), name='order'),  # 用户中心——订单页
    path('address/', UserAddressView.as_view(), name='address'),  # 用户中心——地址页
]
