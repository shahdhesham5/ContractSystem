from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import CityViewSet, AreaViewSet, CompanyViewSet, SubCompanyViewSet, SiteViewSet

router = DefaultRouter()
router.register(r'cities', CityViewSet)
router.register(r'areas', AreaViewSet)
router.register(r'companies', CompanyViewSet)
router.register(r'sub-companies', SubCompanyViewSet)
router.register(r'sites', SiteViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
