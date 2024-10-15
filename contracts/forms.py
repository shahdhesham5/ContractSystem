from django import forms
from .models import Contract, MaintenanceSchedule, InvoiceSchedule, EmergencyVisits

class MaintenanceScheduleForm(forms.ModelForm):
    class Meta:
        model = MaintenanceSchedule
        fields = ['contract', 'site', 'visit_date', 'due_date','completed_date', 'done', 'eng', 'image', 'pdf']
        widgets = {
            'visit_date': forms.DateInput(attrs={'type': 'date'}),
            'due_date': forms.DateInput(attrs={'type': 'date'}),
            'completed_date': forms.DateInput(attrs={'type': 'date'}),
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
        fields = ['company','start_date','end_date', 'contract_price_value', 'invoice_frequency','invoice_date_calculation','maintenance_frequency','emergency_visit_price','emergency_within_period','branch','branch_site','annual_increase','auto_renew','damgh_date','damgh_price', 'image', 'pdf']
        widgets = {
            'start_date': forms.DateInput(attrs={'type': 'date'}),
            'end_date': forms.DateInput(attrs={'type': 'date'}),
            'damgh_date': forms.DateInput(attrs={'type': 'date'}),
            
        }


class EmergencyForm(forms.ModelForm):
    class Meta:
        model = EmergencyVisits
        fields = ['contract', 'site', 'request_visit_date', 'actual_visit_date','price','done', 'eng', 'image', 'pdf', 'comment']
        widgets = {
            'request_visit_date': forms.DateInput(attrs={'type': 'date'}),
            'actual_visit_date': forms.DateInput(attrs={'type': 'date'}),
        }
        def clean(self):
            cleaned_data = super().clean()
            price = cleaned_data.get('price')
            contract = cleaned_data.get('contract')

            # Custom validation
            if price is None and contract and contract.emergency_visit_price is None:
                raise forms.ValidationError("Price is required when the contract's emergency_visit_price is null.")

            return cleaned_data
    

