from django.contrib import admin
from .models import Company, SubCompany, Site


@admin.register(Company)
class CompanyAdmin(admin.ModelAdmin):
    list_display = ('id', 'company_name', 'company_address','phone_number')
    search_fields = ('company_name',)

@admin.register(SubCompany)
class SubCompanyAdmin(admin.ModelAdmin):
    list_display = ('id', 'sub_company_name', 'parent_company','sub_company_address','phone_number')
    search_fields = ('sub_company_name',)
    list_filter = ('parent_company',)

@admin.register(Site)
class SiteAdmin(admin.ModelAdmin):
    list_display = ('id', 'site_name', 'company', 'sub_company', 'location_url','phone_number')
    search_fields = ('site_name',)
    list_filter = ('company', 'sub_company')
