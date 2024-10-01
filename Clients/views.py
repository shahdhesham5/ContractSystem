from django.shortcuts import render
from rest_framework import viewsets
from django.db.models import Sum, Count
from .models import City, Area, Company, SubCompany, Site
from .serializers import CitySerializer, AreaSerializer, CompanySerializer, SubCompanySerializer, SiteSerializer

class CityViewSet(viewsets.ModelViewSet):
    queryset = City.objects.all()
    serializer_class = CitySerializer


class AreaViewSet(viewsets.ModelViewSet):
    queryset = Area.objects.all()
    serializer_class = AreaSerializer


class CompanyViewSet(viewsets.ModelViewSet):
    queryset = Company.objects.all()
    serializer_class = CompanySerializer


class SubCompanyViewSet(viewsets.ModelViewSet):
    queryset = SubCompany.objects.all()
    serializer_class = SubCompanySerializer


class SiteViewSet(viewsets.ModelViewSet):
    queryset = Site.objects.all()
    serializer_class = SiteSerializer
