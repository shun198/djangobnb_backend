#!/bin/sh
set -eu

poetry run python manage.py migrate

if [ $DJANGO_SETTINGS_MODULE = "djangobnb_backend.settings" ]
then
    poetry run python manage.py runserver 0.0.0.0:8000
else
    poetry run gunicorn djangobnb_backend.wsgi:application --bind 0.0.0.0:8000
fi
