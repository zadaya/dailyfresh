# Generated by Django 3.0.5 on 2020-05-04 15:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0005_indexgoodsbanner_url'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='indexgoodsbanner',
            name='url',
        ),
        migrations.AddField(
            model_name='goodssku',
            name='url',
            field=models.CharField(default='#', max_length=256, verbose_name='商品链接'),
        ),
        migrations.AlterField(
            model_name='goodstype',
            name='logo',
            field=models.CharField(choices=[('fruit', 'fruit'), ('seafood', 'seafood'), ('meet', 'meet'), ('egg', 'egg'), ('vegetables', 'vegetables'), ('ice', 'ice')], max_length=20, verbose_name='标识'),
        ),
    ]
