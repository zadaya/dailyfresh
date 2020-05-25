from django.core.files.storage import FileSystemStorage
from dailyfresh import settings


class MyStorage(FileSystemStorage):
    '''自定义文件存储类'''

    def url(self, name):
        '''根据文件相对路径返回url链接'''
        print(settings.STORAGE_ADDRESS + name)
        return settings.STORAGE_ADDRESS + name
