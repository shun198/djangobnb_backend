"""DEV環境用の設定"""
from .base import *
from .environment import aws_settings

DEBUG = False
ROOT_URLCONF = "project.urls.base"

INSTALLED_APPS += [
    "django_ses",
]


# SESの設定
EMAIL_BACKEND = "django_ses.SESBackend"
AWS_DEFAULT_REGION_NAME = aws_settings.AWS_DEFAULT_REGION_NAME
AWS_SES_REGION_ENDPOINT = aws_settings.AWS_SES_REGION_ENDPOINT
DEFAULT_FROM_EMAIL = aws_settings.DEFAULT_FROM_EMAIL
