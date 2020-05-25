from django.contrib.auth.decorators import login_required


# 定义一个类用于需要验证登陆状态的视图函数  使用方式直接继承即可
class LoginRequiredMixin(object):
    '''验证登陆状态基类'''
    @classmethod
    def as_view(cls, **initkwargs):
        # 调用父类的as_view
        view = super(LoginRequiredMixin, cls).as_view(**initkwargs)
        return login_required(view)
