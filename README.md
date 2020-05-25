# dailyfresh
基于Django的社区生鲜商品交易平台(每日生鲜项目)

## 依赖环境 pip list
celery==4.4.2

Django==3.0.5

django-celery==3.3.1

django-haystack==2.8.1

django-redis==4.11.0

django-tinymce==2.9.0

itsdangerous==1.1.0

mysqlclient==1.4.6

Pillow==7.1.2

python-alipay-sdk==2.0.1

Whoosh==2.7.4

redis==3.5.0

jieba==0.42.1  # Whoosh全文搜索引擎并不支持中文，故需安装jieba 配置教程：https://www.yht7.com/news/60168

six==1.14.0  # 因django3.0以后弃用six，但haystack(全文搜索)依赖于six，解决方法:https://blog.csdn.net/weixin_44485643/article/details/104243048

uWSGI==2.0.18

## 启动项
mysql 一般自启动

redis 启动命令: redis-server （可选参数：配置文件路径）

celery-worker 启动命令:（在项目目录下）celery -A celery_tasks.tasks_worker worker -l info

django-haystack 生成索引数据命令:（在项目目录下） python manage.py rebuild_index


uwsgi启动与停止命令：uwsgi --ini uwsgi.ini
                  uwsgi --stop uwsgi.pid

nginx启动与停止命令：./nginx
                  ./nginx -s stop
                  ./nginx -s quit
                  ./nginx -s reload

## 部署项目:
    设置网站的地址：
        settings.py中SITE_ADDRESS = 'http://(此处填写ip:port)/'

    设置uWSGI的监听Nginx连接的地址：
        uwsgi.ini中socket = 127.0.0.1:8080

    设置Nginx的转发地址：
        转发动态请求
        location / {
                # 包含uwsgi的请求参数
                include uwsgi_params;
                # 转交请求给uwsgi
                uwsgi_pass 127.0.0.1:8080;  (对应uwsgi.ini中socket配置的地址)
        }

        处理静态请求
        location /static {
                # 指定静态文件存放的目录
                alias /var/www/dailyfresh/static/;
        }

    迁移静态文件到nginx制定的静态目录
        如：在Django的 settings.py 中配置 STATIC_ROOT = '/var/www/dailyfresh/static'
        并执行命令 python manage.py collectstatic
