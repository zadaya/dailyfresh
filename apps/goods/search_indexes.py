# 定义索引类
from haystack import indexes
# 导入要索引的模型类
from apps.goods.models import GoodsSKU


# 制定对于某个类的某些数据建立索引
# 索引类名自定义，一般格式：模型类名+Index
class GoodsSKUIndex(indexes.SearchIndex, indexes.Indexable):
    # 索引字段 use_template=True 指定根据模型类中那些字段建立索引文件的说明放在一个文件中
    text = indexes.CharField(document=True, use_template=True)

    # 返回模型类
    def get_model(self):
        return GoodsSKU

    # 建立索引数据
    def index_queryset(self, using=None):
        return self.get_model().objects.all()

    # text = CharField(document=True, use_template=True)
    # author = CharField(model_attr='user')
    # pub_date = DateTimeField(model_attr='pub_date')
    # # Define the additional field.
    # rendered = CharField(use_template=True, indexed=False)
