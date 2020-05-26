"""
Django settings for dailyfresh project.

Generated by 'django-admin startproject' using Django 3.0.5.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.0/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'ven(nzkigrzsiyfsr=5+%(bvm6k0)bqo-wnpe63)qx&2(t$6ee'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'tinymce',  # 富文本编辑器
    'haystack',  # 注册全文检索框架
    'apps.user',
    'apps.goods',
    'apps.cart',
    'apps.order',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'dailyfresh.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'dailyfresh.wsgi.application'

# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'dailyfresh',
        'USRE': 'zdy',
        'PASSWORD': '123456',
        'HOST': '127.0.0.1',
        'PORT': 3306,
    }
}
# Django 缓存配置  redis 作为 cache backend 使用配置
CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": "redis://127.0.0.1:6379/0",
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    }
}
# 配置 Session 使用默认的缓存
SESSION_ENGINE = "django.contrib.sessions.backends.cache"
SESSION_CACHE_ALIAS = "default"
# 抛弃之前使用的 django-redis-sessions 改用 django-redis
# # 设置session使用redis_sessions.session
# SESSION_ENGINE  =  'redis_sessions.session'
# # django-redis-sessions 配置信息
# SESSION_REDIS = {
#     'host': '127.0.0.1',
#     'port': 6379,
#     'db': 0,
#     'password': '',
#     'prefix': 'session',
#     'socket_timeout': 1
# }

# Password validation
# https://docs.djangoproject.com/en/3.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# django认证系统使用的模型类
AUTH_USER_MODEL = 'user.User'
# django 2.0 后User.is_active如果是false则视为密码错误，该配置可是使未激活用户正常验证身份信息
AUTHENTICATION_BACKENDS = ['django.contrib.auth.backends.AllowAllUsersModelBackend']

# 配置登陆url地址，login_required不通过则自动跳转至登陆页面
LOGIN_URL = '/user/login/'

# Internationalization
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True
# 设置时区后要将此项设为False
USE_TZ = False

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.0/howto/static-files/

# 网站地址(uwsgi托管时)
# SITE_ADDRESS = 'http://192.168.1.196/'
# 网站地址(runserver托管时)
SITE_ADDRESS = 'http://192.168.1.196:8800/'

# 静态文件地址
STATIC_URL = '/static/'
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static')]
# 指定收集静态文件的目录
STATIC_ROOT = '/var/www/dailyfresh/static/'

# 设置上传文件的保存目录
# MEDIA_ROOT = os.path.join(BASE_DIR, 'static/')
MEDIA_ROOT = '/var/www/media_file/'

# 设置Django的文件存储类
DEFAULT_FILE_STORAGE = 'utils.storage.MyStorage'

# 设置默认文件服务器的IP和端口号及目录 本项目中文件服务器在web服务器上
STORAGE_ADDRESS = 'http://192.168.1.196/media_file/'

# 富文本编辑器配置
TINYMCE_DEFAULT_CONFIG = {
    'theme': 'advanced',
    'width': 600,
    'height': 400,
    'relative_urls': False,
    'remove_script_host': False
}
# django-haystack 全文搜索框架配置
HAYSTACK_CONNECTIONS = {
    'default': {
        # 设置使用whoosh引擎
        # 'ENGINE': 'haystack.backends.whoosh_backend.WhooshEngine',
        'ENGINE': 'haystack.backends.whoosh_cn_backend.WhooshEngine',
        # 生成的索引文件路径
        'PATH': os.path.join(BASE_DIR, 'whoosh_index'),
    },
}
# Haystack-当添加—修改—删除数据时，自动生成索引
HAYSTACK_SIGNAL_PROCESSOR = 'haystack.signals.RealtimeSignalProcessor'
# Haystack-设置每页显示的数目，默认为20，可以自己修改
HAYSTACK_SEARCH_RESULTS_PER_PAGE = 15

# 使用邮件模块的配置
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.163.com'
EMAIL_PORT = 25
# 发送邮件的邮箱
EMAIL_HOST_USER = 'zhadaiyan@163.com'
# 邮箱的客户端授权密码
EMAIL_HOST_PASSWORD = 'FMHFHZZVUIHDHGNM'
# 收件人看到的发件人+<发件邮箱地址>
EMAIL_FROM = '每日生鲜<zhadaiyan@163.com>'

# Celery 服务启动命令
# celery -A celery_tasks.tasks_worker worker -l info
