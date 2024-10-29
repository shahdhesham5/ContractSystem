from django.utils.translation import gettext_lazy as _
from django import forms
from .models import Company, SubCompany, Site,  Area

class CompanyForm(forms.ModelForm):
    class Meta:
        model = Company
        fields = ['company_name','manager','phone_number','city','area','company_address']
        labels = {
            'company_name': _("Company Name"),
            'manager': _("Manager"),
            'phone_number': _("Phone Number"),
            'city': _("City"),
            'area': _("Area"),
            'company_address': _("Company Address"),
        }
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['area'].queryset = Area.objects.none()

        if 'city' in self.data:
            try:
                city_id = int(self.data.get('city'))
                self.fields['area'].queryset = Area.objects.filter(city_id=city_id)
            except (ValueError, TypeError):
                pass

        elif self.instance.pk and self.instance.city:
            self.fields['area'].queryset = self.instance.city.areas.all()

class SubCompanyForm(forms.ModelForm):
    class Meta:
        model = SubCompany
        fields = ['parent_company','sub_company_name','manager','phone_number','city','area','sub_company_address']
        labels = {
            'company_name': _("Company Name"),
            'sub_company_name': _("Sub Company Name"),
            'manager': _("Manager"),
            'phone_number': _("Phone Number"),
            'city': _("City"),
            'area': _("Area"),
            'sub_company_address': _("Sub Company Address"),
        }
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['area'].queryset = Area.objects.none()

        if 'city' in self.data:
            try:
                city_id = int(self.data.get('city'))
                self.fields['area'].queryset = Area.objects.filter(city_id=city_id)
            except (ValueError, TypeError):
                pass

        elif self.instance.pk and self.instance.city:
            self.fields['area'].queryset = self.instance.city.areas.all()

     
class SiteForm(forms.ModelForm):
    class Meta:
        model = Site
        fields = ['company','sub_company','site_name','manager','phone_number','city','area','location_url','site_address','comment']
        labels = {
            'company_name': _("Company Name"),
            'sub_company_name': _("Sub Company Name"),
            'site_name': _("Site"),
            'manager': _("Manager"),
            'phone_number': _("Phone Number"),
            'city': _("City"),
            'area': _("Area"),
            'location_url': _("Location URL"),
            'site_address': _("Site Address"),
            'comment': _("Comment"),
        }
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['area'].queryset = Area.objects.none()

        if 'city' in self.data:
            try:
                city_id = int(self.data.get('city'))
                self.fields['area'].queryset = Area.objects.filter(city_id=city_id)
            except (ValueError, TypeError):
                pass

        elif self.instance.pk and self.instance.city:
            self.fields['area'].queryset = self.instance.city.areas.all()

        if 'company' in self.data:
            try:
                company_id = int(self.data.get('company'))
                self.fields['sub_company'].queryset = SubCompany.objects.filter(company_id=company_id)
            except (ValueError, TypeError):
                pass
        elif self.instance.pk and self.instance.company:
            self.fields['sub_company'].queryset = self.instance.company.sub_companies.all()
