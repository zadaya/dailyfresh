from django.contrib import admin
from django.core.cache import cache
from apps.goods.models import GoodsType, Goods, GoodsSKU, IndexGoodsBanner, IndexTypeGoodsBanner, IndexPromotionBanner


# Register your models here.
class BaseModelAdmin(admin.ModelAdmin):
    '''模型管理基类'''

    def save_model(self, request, obj, form, change):
        '''新增或者更新表中数据时调用'''
        print('updataing\n')
        super().save_model(request, obj, form, change)
        # 发出任务，让celery发出生成首页的静态页面的任务
        from celery_tasks.tasks import generate_static_index_html
        generate_static_index_html.delay()
        # 清除redis缓存，当有访问请求时重新缓存首页数据
        cache.delete('index_page_data')

    def delete_model(self, request, obj):
        '''删除表中数据时调用'''
        print('deleteing\n')
        super().delete_model(request, obj)
        # 发出任务，让celery发出生成首页的静态页面的任务
        from celery_tasks.tasks import generate_static_index_html
        generate_static_index_html.delay()
        # 清除redis缓存，当有访问请求时重新缓存首页数据
        cache.delete('index_page_data')


class GoodsTypeAdmin(BaseModelAdmin):
    pass


class GoodsAdmin(BaseModelAdmin):
    pass


class GoodsSKUAdmin(BaseModelAdmin):
    pass


class IndexGoodsBannerAdmin(BaseModelAdmin):
    pass


class IndexTypeGoodsBannerAdmin(BaseModelAdmin):
    pass


class IndexPromotionBannerAdmin(BaseModelAdmin):
    pass


admin.site.register(GoodsType, GoodsTypeAdmin)
admin.site.register(Goods, GoodsAdmin)
admin.site.register(GoodsSKU, GoodsSKUAdmin)
admin.site.register(IndexGoodsBanner, IndexGoodsBannerAdmin)
admin.site.register(IndexTypeGoodsBanner, IndexTypeGoodsBannerAdmin)
admin.site.register(IndexPromotionBanner, IndexPromotionBannerAdmin)
