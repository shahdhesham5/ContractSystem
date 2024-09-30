from django.contrib import admin
from .models import Contract, MaintenanceSchedule, InvoiceSchedule

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
        'invoice_date_calculation',
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
                'invoice_date_calculation',
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

@admin.register(MaintenanceSchedule)
class MaintenanceScheduleAdmin(admin.ModelAdmin):
    list_display = ('contract', 'site', 'visit_date', 'done')
    list_filter = ('visit_date', 'contract', 'site')
    search_fields = ('contract__company__company_name', 'site__site_name')
    
@admin.register(InvoiceSchedule)
class InvoiceSchedule(admin.ModelAdmin):
    list_display = ('contract','company','sub_company', 'amount', 'invoice_date', 'is_paid')
    list_filter = ('invoice_date', 'contract')
    search_fields = ('contract__company__company_name',)