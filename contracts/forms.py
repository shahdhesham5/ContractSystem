from django import forms
from .models import Contract, MaintenanceSchedule, InvoiceSchedule, Contract

class ContractForm(forms.ModelForm):
    class Meta:
        model = Contract
        fields = ['company', 'start_date', 'end_date', 'contract_price_value', 'invoice_frequency', 'invoice_date_calculation', 'maintenance_frequency', 'emergency_visit_price', 'branch', 'branch_site', 'annual_increase', 'auto_renew', 'damgh_date', 'damgh_price', 'image', 'pdf']

class MaintenanceScheduleForm(forms.ModelForm):
    class Meta:
        model = MaintenanceSchedule
        fields = ['contract', 'site', 'visit_date', 'actual_visit_date', 'done', 'image', 'pdf']
        widgets = {
            'visit_date': forms.DateInput(attrs={'type': 'date'}),
            'actual_visit_date': forms.DateInput(attrs={'type': 'date'}),
        }


class InvoiceceScheduleForm(forms.ModelForm):
    class Meta:
        model = InvoiceSchedule
        fields = ['contract','company', 'sub_company', 'invoice_date', 'amount', 'is_paid', 'image', 'pdf']
        widgets = {
            'invoice_date': forms.DateInput(attrs={'type': 'date'}),
        }


class ContractForm(forms.ModelForm):
    class Meta:
        model = Contract
        fields = ['company','start_date','end_date', 'contract_price_value', 'invoice_frequency','invoice_date_calculation','maintenance_frequency','emergency_visit_price','branch','branch_site','annual_increase','auto_renew','damgh_date','damgh_price', 'image', 'pdf']
        widgets = {
            'start_date': forms.DateInput(attrs={'type': 'date'}),
            'end_date': forms.DateInput(attrs={'type': 'date'}),
            'damgh_date': forms.DateInput(attrs={'type': 'date'}),
            
        }



