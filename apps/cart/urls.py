from django.urls import path
from apps.cart.views import CartView, CartAddView, CartUpdateView, CartDeleteView

urlpatterns = [
    path('', CartView.as_view(), name='show'),  # 显示用户购物车页
    path('add/', CartAddView.as_view(), name='add'),  # 添加商品到购物车
    path('update/', CartUpdateView.as_view(), name='update'),  # 添加商品到购物车
    path('delete/', CartDeleteView.as_view(), name='delete'),  # 从购物车删除商品
]
