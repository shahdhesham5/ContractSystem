from django.contrib import admin
from .models import Contract

@admin.register(Contract)
class ContractAdmin(admin.ModelAdmin):
    # Display all fields in the list view (you can customize the order)
    list_display = [
        'company',
        'start_date',
        'end_date',
        'contract_price_value',
        'emergency_visit_price',
        'annual_increase',
        'invoice_frequency',
        'maintenance_frequency',
        'branch',
        'branch_site',
        'auto_renew',
        'damgh_date',
        'damgh_price',
        'image',
        'pdf',
    ]
    
    # Search fields to allow searching by company name or contract ID
    search_fields = ['company__company_name']
    
    # Optional: Filters in the admin panel
    list_filter = ['company', 'branch','branch_site', 'start_date', 'end_date', 'auto_renew']
    
    # Fields to display when editing/creating a new contract
    fieldsets = (
        (None, {
            'fields': (
                'company',
                'start_date',
                'end_date',
                'contract_price_value',
                'emergency_visit_price',
                'annual_increase',
                'invoice_frequency',
                'maintenance_frequency',
                'branch',
                'branch_site',
                'auto_renew',
                'damgh_date',
                'damgh_price',
                'image',
                'pdf',
            )
        }),
    )