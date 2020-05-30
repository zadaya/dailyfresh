from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .models import User, Address

# Register your models here.

admin.site.register(User)
admin.site.register(Address)

admin.site.site_header = '生鲜商品交易系统'  # 后台显示
admin.site.site_title = '每日生鲜'  # 网站名称
