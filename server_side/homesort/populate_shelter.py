import csv

import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'homesort.settings')

import django
django.setup()


from homesort_app.models import Shelter
from django.contrib.gis.geos import Point

shelters = []

with open('shelters.csv', 'r') as csvfile:
    spamreader = csv.reader(csvfile)
    for row in spamreader:
        attr = row[0].strip()
        if attr == 'lat' or attr =='lon':
            row[1:] = [float(i) for i in row[1:]]
        if attr == 'Service Capacity (distinguish if by bed/person or if by households that could be served total':
            row[1:] = [int(i) for i in row[1:]]
        for i in range(1, len(row)):
            if len(shelters) < i:
                shelters.append({})
            if str(row[i]).lower() == 'no':
                shelters[i - 1][attr] = False
            elif str(row[i]).lower() == 'yes':
                shelters[i - 1][attr] = True
            else:
                shelters[i-1][attr] = row[i]



for shelter in shelters:
    s = Shelter()
    s.name = shelter['Agency/Program Name']
    s.address = shelter['Address']
    s.phone = shelter['Contact Info']
    s.point = Point(shelter['lat'], shelter['lon'])
    s.all_beds = shelter['Service Capacity (distinguish if by bed/person or if by households that could be served total']
    s.male_only = not shelter["Do they serve Single Women (18+)"]
    s.female_only = not shelter['Do they serve Single Men (18+)']
    s.save()

