from django import forms
from .models import Contract

class ContractForm(forms.ModelForm):
    class Meta:
        model = Contract
        fields = ['company', 'start_date', 'end_date', 'contract_price_value', 'invoice_frequency', 'invoice_date_calculation', 'maintenance_frequency', 'emergency_visit_price', 'branch', 'branch_site', 'annual_increase', 'auto_renew', 'damgh_date', 'damgh_price', 'image', 'pdf']

