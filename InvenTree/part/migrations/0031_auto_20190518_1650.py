# Generated by Django 2.2 on 2019-05-18 06:50

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('part', '0030_auto_20190518_1641'),
    ]

    operations = [
        migrations.AlterField(
            model_name='supplierpricebreak',
            name='quantity',
            field=models.PositiveIntegerField(default=1, validators=[django.core.validators.MinValueValidator(1)]),
        ),
    ]
