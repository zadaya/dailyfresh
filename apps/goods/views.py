from django.http import HttpResponse
from django.views import View
from django.shortcuts import render, redirect
from django.urls import reverse
from django.core.cache import cache
from django.core.paginator import Paginator
from django_redis import get_redis_connection
from apps.goods.models import GoodsType, IndexGoodsBanner, IndexPromotionBanner, IndexTypeGoodsBanner, GoodsSKU
from apps.order.models import OrderGoods


# Create your views here.


# /
def static_index(request):
    '''首页静态页面'''
    import os
    from django.conf import settings
    static_index_path = os.path.join(settings.STATIC_ROOT, 'index.html')
    with open(static_index_path, 'r') as f:
        static_index_html = f.read()
    return HttpResponse(static_index_html)


# /index
class IndexView(View):
    '''首页'''

    def get(self, request):
        '''显示首页'''
        # if request.user == None:
        #     reverse('user:index')
        # 尝试从缓存中获取数据
        context = cache.get('index_page_data')

        if context is None:
            # 缓存中没有数据
            print('设置缓存')
            # 获取商品的种类信息
            types = GoodsType.objects.all().order_by('index')
            # 获取首页轮播商品信息(按照index值排序，默认升序)
            goods_banners = IndexGoodsBanner.objects.all().order_by('index')
            # 获取首页促销活动信息(按照index值排序，默认升序)
            promotion_banners = IndexPromotionBanner.objects.all().order_by('index')
            # 获取首页分类商品展示信息(分别按照文字信息和图片信息查询，按照index值排序，默认升序)
            for type in types:  # GoodsType
                # 获取type种类首页分类商品的文字展示信息
                title_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=0).order_by('index')
                # 获取type种类首页分类商品的图片展示信息
                image_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=1).order_by('index')
                # "动态(python特有)"地给type增加属性，分别保存首页分类商品的文字展示信息和图片展示信息
                type.title_banners = title_banners
                type.image_banners = image_banners
            context = {'types': types,
                       'goods_banners': goods_banners,
                       'promotion_banners': promotion_banners}
            # 设置缓存
            # key  value timeout
            cache.set('index_page_data', context, 3600)

        # 获取用户购物车中商品的数目
        user = request.user
        cart_count = 0
        if user.is_authenticated:
            # 用户已登录
            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            cart_count = conn.hlen(cart_key)

        # 组织模板上下文
        context.update(cart_count=cart_count)

        # 使用模板
        return render(request, 'index.html', context)


# /goods/商品id
class DetailView(View):
    '''商品详情页'''

    # def get(self, request, goods_id):
    #     '''显示详情页'''
    #     return render(request, 'detail.html')

    def get(self, request, goods_id):
        '''显示详情页'''
        try:
            sku = GoodsSKU.objects.get(id=goods_id)
        except GoodsSKU.DoesNotExist:
            # 商品不存在
            return redirect(reverse('goods:index'))

        # 获取商品的分类信息
        types = GoodsType.objects.all().order_by('index')

        # 获取商品的评论信息 使用exclude筛选不满足条件的信息
        sku_orders = OrderGoods.objects.filter(sku=sku).exclude(comment='')

        # 获取同一Type的新品信息
        new_type_skus = GoodsSKU.objects.filter(type=sku.type).order_by('-create_time')[:3]

        # 获取同一个SPU的其他规格商品
        same_spu_skus = GoodsSKU.objects.filter(goods=sku.goods).exclude(id=goods_id)

        # 获取用户购物车中商品的数目
        user = request.user
        cart_count = 0
        if user.is_authenticated:
            # 用户已登录
            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            cart_count = conn.hlen(cart_key)

            # 添加用户的历史记录
            conn = get_redis_connection('default')
            history_key = 'history_%d' % user.id
            # 移除列表中的goods_id
            conn.lrem(history_key, 0, goods_id)
            # 把goods_id插入到列表的左侧
            conn.lpush(history_key, goods_id)
            # 只保存用户最新浏览的5条信息
            conn.ltrim(history_key, 0, 4)

        # 组织模板上下文
        context = {'sku': sku,
                   'types': types,
                   'sku_orders': sku_orders,
                   'new_type_skus': new_type_skus,
                   'same_spu_skus': same_spu_skus,
                   'cart_count': cart_count}

        # 使用模板
        return render(request, 'detail.html', context)


# /list/种类id/页码?sort=排序方式
class ListView(View):
    '''商品列表页'''

    def get(self, request, type_id, page):
        '''显示列表页'''
        # 获取种类信息
        try:
            type = GoodsType.objects.get(id=type_id)
        except GoodsType.DoesNotExist:
            # 种类不存在
            return redirect(reverse('goods:index'))

        # 获取商品的所有分类信息
        types = GoodsType.objects.all().order_by('index')

        # 获取排序的方式 # 获取分类商品的信息
        # sort=default 默认按照id排序
        # sort=price 按照商品价格排序
        # sort=hot 按照商品销量排序
        sort = request.GET.get('sort')

        if sort == 'price':
            skus = type.goodssku_set.all().order_by('price')
        elif sort == 'hot':
            skus = type.goodssku_set.all().order_by('-sales')
        else:
            sort = 'default'
            skus = type.goodssku_set.all().order_by('-id')

        # 对数据进行分页 (list数据, 每页的个数)
        paginator = Paginator(skus, 10)

        # 获取第page页的内容
        try:
            page = int(page)
        except Exception as e:
            page = 1  # 页码不存在或错误默认返回第一页
        # 如果页码超出当前分页范围则返回第一页
        if page > paginator.num_pages:
            page = 1

        # 获取第page页的Page实例对象
        skus_page = paginator.page(page)

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

        # 获取新品信息
        new_skus = GoodsSKU.objects.filter(type=type).order_by('-create_time')[:3]

        # 获取用户购物车中商品的数目
        user = request.user
        cart_count = 0
        if user.is_authenticated:
            # 用户已登录
            conn = get_redis_connection('default')
            cart_key = 'cart_%d' % user.id
            cart_count = conn.hlen(cart_key)

        # 组织模板上下文
        context = {'type': type,
                   'types': types,
                   'skus_page': skus_page,
                   'new_skus': new_skus,
                   'cart_count': cart_count,
                   'sort': sort,
                   'pages': pages}

        # 使用模板
        return render(request, 'list.html', context)
