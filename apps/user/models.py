from django.db import models
from django.contrib.auth.models import AbstractUser
from db.base_model import BaseModel


# Create your models here.


class User(AbstractUser, BaseModel):
    '''用户模型类'''

    class Meta:
        db_table = 'df_user'
        verbose_name = '用户'
        verbose_name_plural = verbose_name


class AddressManager(models.Manager):
    '''地址模型管理器类'''

    # 1.改变原有查询的结果集：all()
    # 2.封装方法：用于操作模型类对应的数据表
    def get_defaule_address(self, user):
        '''获取用户的默认收货地址'''
        try:
            def_addr = self.get(user=user, is_default=True)
        except self.model.DoesNotExist:
            # 不存在默认地址
            def_addr = None
        return def_addr

    def add_address(self, user):
        '''添加收货地址'''
        pass


class Address(BaseModel):
    '''地址模型类'''
    user = models.ForeignKey('User', verbose_name='所属账户', on_delete=models.CASCADE)
    receiver = models.CharField(max_length=20, verbose_name='收件人')
    addr = models.CharField(max_length=256, verbose_name='收件地址')
    zip_code = models.CharField(max_length=6, null=True, verbose_name='邮政编码')
    phone = models.CharField(max_length=11, verbose_name='联系电话')
    is_default = models.BooleanField(default=False, verbose_name='是否默认')
    # 自定义的模型管理器对象
    objects = AddressManager()

    class Meta:
        db_table = 'df_address'
        verbose_name = '地址'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.user.username + '  :  ' + self.addr
