# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-10-22 19:27
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homesort_app', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='shelter',
            name='name',
            field=models.CharField(blank=True, max_length=128, null=True),
        ),
    ]
