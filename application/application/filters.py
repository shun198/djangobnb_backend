import django_filters

from application.models import User


class UserFilter(django_filters.FilterSet):
    """システムユーザのfilter"""

    created_at = django_filters.DateTimeFromToRangeFilter()

    class Meta:
        model = User
        fields = {
            "username": ["contains"],
            "email": ["contains"],
        }
