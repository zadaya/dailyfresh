# 使用celery
import os

from celery import Celery
from django.template import loader
from django.core.mail import send_mail
from django.conf import settings
import time

from apps.goods.models import GoodsType, IndexGoodsBanner, IndexPromotionBanner, IndexTypeGoodsBanner, GoodsSKU

print('\n\n This is User')
# 创建一个Celery类的实例对象
app = Celery('celery_tasks.tasks', broker='redis://127.0.0.1:6379/0')


# 定义任务函数
@app.task
def send_register_active_email(to_mail, username, token):
    '''发送激活邮件'''
    print('正在发送中……')
    subject = '每日生鲜用户激活'
    message = ''
    html_message = '<h1>尊敬的%s您好，欢迎您注册成为&nbsp;每日生鲜&nbsp;的会员！请点击下方链接以激活您的账户：</h1><br /><a ' \
                   'href="%suser/active/%s">%suser/active/%s</a>' % (
                       username, settings.SITE_ADDRESS, token, settings.SITE_ADDRESS, token)
    sender = settings.EMAIL_FROM
    receiver = [to_mail]
    send_mail(subject, message, sender, receiver, html_message=html_message)
    time.sleep(3)


@app.task
def send_reset_pwd_email(to_mail, username, token):
    '''发送密码重置邮件'''
    print('正在发送中……')
    subject = '每日生鲜用户密码重置'
    message = ''
    html_message = '<h1>尊敬的%s您好，您正在申请重置密码服务，如确认是您本人所为，请在30分钟内点击下方链接以重置您的账户密码：</h1><br /><a ' \
                   'href="%suser/reset_pwd/?token=%s">%suser/reset_pwd/?token=%s</a>' % (
                       username, settings.SITE_ADDRESS, token, settings.SITE_ADDRESS, token)
    sender = settings.EMAIL_FROM
    receiver = [to_mail]
    send_mail(subject, message, sender, receiver, html_message=html_message)
    time.sleep(3)


@app.task
def generate_static_index_html():
    '''产生首页的静态页面'''
    # 获取商品的种类信息
    types = GoodsType.objects.all().order_by('index')
    # 获取首页轮播商品信息
    goods_banners = IndexGoodsBanner.objects.all().order_by('index')
    # 获取首页促销活动信息
    promotion_banners = IndexPromotionBanner.objects.all().order_by('index')
    # 获取首页分类商品展示信息
    for type in types:  # GoodsType
        # 获取type种类首页分类商品的图片展示信息
        image_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=1).order_by('index')
        # 获取type种类首页分类商品的文字展示信息
        title_banners = IndexTypeGoodsBanner.objects.filter(type=type, display_type=0).order_by('index')

        # 动态给type增加属性，分别保存首页分类商品的图片展示信息和文字展示信息
        type.image_banners = image_banners
        type.title_banners = title_banners
    # 使用模板获取HttpResponse对象
    # 1.加载模板文件
    print("\n**********\n重新生成静态主页\n**********\n")
    temp = loader.get_template('static_index.html')
    # 2.组织模板上下文
    context = {'types': types,
               'goods_banners': goods_banners,
               'promotion_banners': promotion_banners}
    # 3.模板渲染
    static_index_html = temp.render(context)
    # 生成首页对应的静态文件
    save_path = os.path.join(settings.STATIC_HTML_ROOT, 'index.html')
    with open(save_path, 'w') as f:
        f.write(static_index_html)
