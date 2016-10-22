DATABASES = {
        'default': {
                    'ENGINE': 'django.contrib.gis.db.backends.postgis',
                    'NAME': 'homesort',
                    'USER': 'postgres',
                    'PASSWORD': 'postgres',
                    'HOST': '127.0.0.1',
                    'PORT': '5433'
        }
}

DEBUG = True
