from django import forms
from .models import Company, SubCompany, Site

class CompanyForm(forms.ModelForm):
    class Meta:
        model = Company
        fields = ['company_name','manager','company_address','phone_number','city','area']
            
class SubCompanyForm(forms.ModelForm):
    class Meta:
        model = SubCompany
        fields = ['parent_company','sub_company_name','manager','sub_company_address','phone_number','city','area']

class SiteForm(forms.ModelForm):
    class Meta:
        model = Site
        fields = ['company','sub_company','site_name','manager','site_address','phone_number','city','area','location_url','comment']
