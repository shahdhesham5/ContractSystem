from django.contrib import admin
from .models import Company, SubCompany, Site, City, Area


@admin.register(Company)
class CompanyAdmin(admin.ModelAdmin):
    list_display = ('company_name','manager', 'company_address','phone_number','city','area','tax_registration_number','ERP_code')
    search_fields = ('company_name','city','area',)

@admin.register(SubCompany)
class SubCompanyAdmin(admin.ModelAdmin):
    list_display = ('sub_company_name', 'parent_company','manager','sub_company_address','phone_number','city','area','tax_registration_number','ERP_code')
    search_fields = ('sub_company_name',)
    list_filter = ('parent_company',)

@admin.register(Site)
class SiteAdmin(admin.ModelAdmin):
    list_display = ('site_name', 'company', 'sub_company','manager', 'location_url','phone_number','city','area')
    search_fields = ('site_name',)
    list_filter = ('company', 'sub_company')

admin.site.register(City)
admin.site.register(Area)