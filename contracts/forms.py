from django.utils.translation import gettext_lazy as _
from django import forms
from .models import Contract, MaintenanceSchedule, InvoiceSchedule, EmergencyVisits

class MaintenanceScheduleForm(forms.ModelForm):
    class Meta:
        model = MaintenanceSchedule
        fields = ['contract', 'site', 'visit_date', 'due_date','completed_date', 'done', 'eng', 'image', 'pdf']
        widgets = {
            'visit_date': forms.DateInput(attrs={'type': 'date', 'placeholder': 'DD/MM/YYYY'}),
            'due_date': forms.DateInput(attrs={'type': 'date', 'placeholder': 'DD/MM/YYYY'}),
            'completed_date': forms.DateInput(attrs={'type': 'date', 'placeholder': 'DD/MM/YYYY'}),
        }



class InvoiceceScheduleForm(forms.ModelForm):
    class Meta:
        model = InvoiceSchedule
        fields = ['company', 'sub_company', 'invoice_date', 'amount', 'is_paid', 'image', 'pdf']
        widgets = {
            'invoice_date': forms.DateInput(attrs={'type': 'date', 'placeholder': 'DD/MM/YYYY'}),
        }


class ContractForm(forms.ModelForm):
    class Meta:
        model = Contract
        fields = [
            'company', 'start_date', 'end_date', 
            'contract_price_value', 'invoice_frequency', 
            'invoice_date_calculation', 'maintenance_frequency', 
            'emergency_visit_price', 'emergency_within_period', 
            'branch', 'branch_site', 'annual_increase', 
            'auto_renew', 'damgh_date', 'damgh_price', 
            'image', 'pdf'
        ]
        widgets = {
            'start_date': forms.DateInput(attrs={'type': 'date', 'placeholder': 'DD/MM/YYYY'}),
            'end_date': forms.DateInput(attrs={'type': 'date', 'placeholder': 'DD/MM/YYYY'}),
            'damgh_date': forms.DateInput(attrs={'type': 'date', 'placeholder': 'DD/MM/YYYY'}),
            'pdf_file': forms.ClearableFileInput(attrs={'accept': 'application/pdf'}),
        }
        labels = {
            'company_name': _("Company Name"),
            'start_date': _("Start Date"),
            'end_date': _("End Date"),
            'contract_price_value': _("Contract Price Value"),
            'annual_increase': _("Annual Percentage"),
            'auto_renew': _("Auto Renew"),
            'emergency_visit_price': _("Emergency Visit Price"),
            'emergency_within_period': _("Emergency Visit within"),
            'invoice_frequency': _("Invoice Frequency"),
            'invoice_date_calculation': _("Invoice Calculated Date"),
            'maintenance_frequency': _("Maintenance Frequency"),
            'branch': _("Company Branch"),
            'damgh_date': _("Damgh Date"),
            'damgh_price': _("Damgh Price"),
            'image': _("Contract Image"),
            'pdf': _("Contract PDF"),
        }

class EmergencyForm(forms.ModelForm):
    class Meta:
        model = EmergencyVisits
        fields = ['contract', 'site','eng', 'request_visit_date', 'actual_visit_date', 'price','done','comment','image','pdf']
        widgets = {
            'request_visit_date': forms.DateInput(attrs={'type': 'date', 'placeholder': 'DD/MM/YYYY'}),
            'actual_visit_date': forms.DateInput(attrs={'type': 'date', 'placeholder': 'DD/MM/YYYY'}),
        }
        def clean(self):
            cleaned_data = super().clean()
            price = cleaned_data.get('price')
            contract = cleaned_data.get('contract')

            # Custom validation
            if price is None and contract and contract.emergency_visit_price is None:
                raise forms.ValidationError("Price is required when the contract's emergency_visit_price is null.")

            return cleaned_data



