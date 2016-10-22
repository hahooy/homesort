# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-10-22 18:14
from __future__ import unicode_literals

import django.contrib.gis.db.models.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='HomelessPerson',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('firstname', models.CharField(blank=True, max_length=32, null=True)),
                ('lastname', models.CharField(blank=True, max_length=32, null=True)),
                ('picture_url', models.CharField(blank=True, max_length=50, null=True)),
                ('date_of_birth', models.DateField(blank=True, null=True)),
                ('ssn', models.CharField(blank=True, max_length=9, null=True)),
                ('gender', models.CharField(choices=[('M', 'Male'), ('F', 'Female')], default='M', max_length=1)),
                ('background', models.TextField(blank=True, null=True)),
                ('created', models.DateTimeField(editable=False)),
                ('modified', models.DateTimeField()),
            ],
        ),
        migrations.CreateModel(
            name='Record',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('point', django.contrib.gis.db.models.fields.PointField(blank=True, null=True, srid=4326)),
                ('created', models.DateTimeField(editable=False)),
                ('modified', models.DateTimeField()),
                ('status', models.CharField(choices=[('RE', 'reserved'), ('IN', 'living'), ('LE', 'leave')], default='RE', max_length=2)),
                ('homelessPerson', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='homesort_app.HomelessPerson')),
            ],
        ),
        migrations.CreateModel(
            name='Shelter',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('address', models.CharField(blank=True, max_length=512, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('phone', models.CharField(blank=True, max_length=24, null=True)),
                ('point', django.contrib.gis.db.models.fields.PointField(blank=True, null=True, srid=4326)),
                ('all_beds', models.IntegerField(blank=True, null=True)),
                ('male_only', models.BooleanField(default=False)),
                ('female_only', models.BooleanField(default=False)),
                ('youth_only', models.BooleanField(default=False)),
            ],
        ),
        migrations.AddField(
            model_name='record',
            name='shelter',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='homesort_app.Shelter'),
        ),
    ]