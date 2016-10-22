from datetime import datetime

from django.contrib.gis.db import models
from django.utils import timezone
import hashlib


class Shelter(models.Model):
    address = models.CharField(max_length=512, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    phone = models.CharField(max_length=24, blank=True, null=True)
    point = models.PointField(blank=True, null=True)
    all_beds = models.IntegerField(blank=True, null=True)
    male_only = models.BooleanField(default=False)
    female_only = models.BooleanField(default=False)
    youth_only = models.BooleanField(default=False)


class HomelessPerson(models.Model):
    firstname = models.CharField(max_length=32, blank=True, null=True)
    lastname = models.CharField(max_length=32, blank=True, null=True)
    picture_url = models.CharField(max_length=50, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    ssn = models.CharField(max_length=9, blank=True, null=True)
    GENDER_CHOICES = (
        ('M', 'Male'),
        ('F', 'Female')
    )
    gender = models.CharField(
        max_length=1,
        choices=GENDER_CHOICES,
        default='M',
    )
    background = models.TextField(blank=True, null=True)

    created = models.DateTimeField(editable=False)
    modified = models.DateTimeField()

    def save(self, *args, **kwargs):
        ''' On save, update timestamps '''
        if not self.id:
            self.created = timezone.now()
        self.modified = timezone.now()
        return super(HomelessPerson, self).save(*args, **kwargs)


class Record(models.Model):
    shelter = models.ForeignKey(Shelter)
    homelessPerson = models.ForeignKey(HomelessPerson)
    point = models.PointField(blank=True, null=True)
    created = models.DateTimeField(editable=False)
    modified = models.DateTimeField()

    STATUS_CHOICES = (
        ('RE', 'reserved'),
        ('IN', 'living'),
        ('LE', 'leave'),
    )
    status = models.CharField(
        max_length=2,
        choices=STATUS_CHOICES,
        default='RE',
    )

    def save(self, *args, **kwargs):
        ''' On save, update timestamps '''
        if not self.id:
            self.created = timezone.now()
        self.modified = timezone.now()
        return super(Record, self).save(*args, **kwargs)
