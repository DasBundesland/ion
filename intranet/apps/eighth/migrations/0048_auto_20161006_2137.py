# -*- coding: utf-8 -*-
# Generated by Django 1.10.2 on 2016-10-07 01:37
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [('eighth', '0047_auto_20161005_0655')]

    operations = [
        migrations.AlterField(
            model_name='eighthactivity',
            name='fri_a',
            field=models.BooleanField(default=False, verbose_name='Meets Friday A'),
        ),
        migrations.AlterField(
            model_name='eighthactivity',
            name='fri_b',
            field=models.BooleanField(default=False, verbose_name='Meets Friday B'),
        ),
        migrations.AlterField(
            model_name='eighthactivity',
            name='wed_a',
            field=models.BooleanField(default=False, verbose_name='Meets Wednesday A'),
        ),
        migrations.AlterField(
            model_name='eighthactivity',
            name='wed_b',
            field=models.BooleanField(default=False, verbose_name='Meets Wednesday B'),
        ),
        migrations.AlterField(
            model_name='historicaleighthactivity',
            name='fri_a',
            field=models.BooleanField(default=False, verbose_name='Meets Friday A'),
        ),
        migrations.AlterField(
            model_name='historicaleighthactivity',
            name='fri_b',
            field=models.BooleanField(default=False, verbose_name='Meets Friday B'),
        ),
        migrations.AlterField(
            model_name='historicaleighthactivity',
            name='wed_a',
            field=models.BooleanField(default=False, verbose_name='Meets Wednesday A'),
        ),
        migrations.AlterField(
            model_name='historicaleighthactivity',
            name='wed_b',
            field=models.BooleanField(default=False, verbose_name='Meets Wednesday B'),
        ),
    ]
