# Generated by Django 2.1.1 on 2018-09-11 19:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('principal', '0010_instrumentresult_caregiver'),
    ]

    operations = [
        migrations.AlterField(
            model_name='instrumentresult',
            name='caregiver',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='principal.Caregiver'),
        ),
    ]