# Generated by Django 2.1.1 on 2018-09-09 17:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0002_auto_20180908_2105'),
    ]

    operations = [
        migrations.AlterField(
            model_name='instrument',
            name='instructions',
            field=models.CharField(max_length=250),
        ),
        migrations.AlterField(
            model_name='question',
            name='description',
            field=models.CharField(max_length=150),
        ),
    ]