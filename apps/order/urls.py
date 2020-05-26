from django.urls import path, re_path

from apps.order.views import OrderPlaceView, OrderNowView, OrderCommitView, OrderPayView, OrderCheckPay, OrderConfirmReceive, CommentView

urlpatterns = [
    path('place/', OrderPlaceView.as_view(), name='place'),  # 创建订单(购物车下单)
    path('now/', OrderNowView.as_view(), name='now'),  # 创建订单(立即购买直接下单)
    path('commit/', OrderCommitView.as_view(), name='commit'),  # 提交订单
    path('pay/', OrderPayView.as_view(), name='pay'),  # 订单支付
    path('checkpay/', OrderCheckPay.as_view(), name='checkpay'),  # 订单支付结果检查
    path('confirmreceive/', OrderConfirmReceive.as_view(), name='confirmreceive'),  # 订单确认收货
    re_path(r'^comment/(?P<order_id>.+)$', CommentView.as_view(), name='comment'),  # 订单评论
]
