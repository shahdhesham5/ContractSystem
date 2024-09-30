from rest_framework import serializers
from .models import City, Area, Company, SubCompany, Site

class CitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = '__all__'


class AreaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Area
        fields = '__all__'


class CompanySerializer(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = '__all__'


class SubCompanySerializer(serializers.ModelSerializer):
    class Meta:
        model = SubCompany
        fields = '__all__'


class SiteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Site
        fields = '__all__'
