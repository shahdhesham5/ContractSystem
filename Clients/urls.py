from django.urls import path
from .views import company_list_view, company_edit_view, company_delete_view, subcompany_list_view, subcompany_delete_view, subcompany_edit_view, site_list_view, site_delete_view, site_edit_view, create_company_view, create_subcompany_view, create_site_view,company_profile_view


urlpatterns = [

    path('companies',company_list_view, name="companies-list"),
    path('company-create',create_company_view, name="company-create"),
    path('company-edit/<uuid:pk>/',company_edit_view, name="company-edit"),
    path('company-delete/<uuid:pk>/',company_delete_view, name="company-delete"),
    path('company-profile/<uuid:pk>/',company_profile_view, name="company-profile"),
    
    
    path('subcompanies',subcompany_list_view, name="subcompanies-list"),
    path('subcompany-create',create_subcompany_view, name="subcompany-create"),
    path('subcompany-edit/<uuid:pk>/',subcompany_edit_view, name="subcompany-edit"),
    path('subcompany-delete/<uuid:pk>/',subcompany_delete_view, name="subcompany-delete"),
    
    
    path('sites',site_list_view,name='site-list'),
    path('site-create',create_site_view, name="site-create"),
    path('site-edit/<uuid:pk>/',site_edit_view,name='site-edit'),
    path('site-delete/<uuid:pk>/',site_delete_view,name='site-delete'),
]
