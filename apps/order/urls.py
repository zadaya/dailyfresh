from django.urls import path, re_path

from apps.order.views import OrderPlaceView, OrderCommitView, OrderPayView, OrderCheckPay, CommentView

urlpatterns = [
    path('place/', OrderPlaceView.as_view(), name='place'),  # 创建订单(下单)
    path('commit/', OrderCommitView.as_view(), name='commit'),  # 提交订单
    path('pay/', OrderPayView.as_view(), name='pay'),  # 订单支付
    path('checkpay/', OrderCheckPay.as_view(), name='checkpay'),  # 订单支付
    re_path(r'^comment/(?P<order_id>.+)$', CommentView.as_view(), name='comment'),  # 订单评论
]
