from django.urls import path, re_path
from apps.goods.views import IndexView, ListView, DetailView, static_index

urlpatterns = [
    path('', static_index, name='static_index'),  # 网站首页
    path('index', IndexView.as_view(), name='index'),  # 登录用户访问网站首页
    re_path(r'^list/(?P<type_id>\d*)/(?P<page>\d*)$', ListView.as_view(), name='list'),  # 商品分类列表页
    re_path(r'^detail/(?P<goods_id>\d*)$', DetailView.as_view(), name='detail'),  # 商品详情页
]
