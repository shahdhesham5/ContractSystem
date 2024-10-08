from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import ContractViewSet, MaintenanceScheduleViewSet, InvoiceScheduleViewSet, contract_table_view, edit_contract_view, maintenence_schedule_table_view, edit_visit_view, edit_invoice_view, invoice_schedule_table_view, create_contract_view, contracts_expiring_soon_view, dashboard_view,update_maintenance_visit, emergency_visits_view, create_emergency_visit_request_view, update_invoice_view, delete_contract_view,delete_Invoice_view, delete_Visit_view

router = DefaultRouter()
router.register(r'contracts', ContractViewSet)
router.register(r'maintenance/schedule', MaintenanceScheduleViewSet)
router.register(r'invoice/schedule', InvoiceScheduleViewSet)

urlpatterns = [
    path('', include(router.urls)),  # API paths
    path('dashboard', dashboard_view, name='dashboard'),
    path('contracts-list/', contract_table_view, name='contract-table'), 
    path('contracts-expire-list/', contracts_expiring_soon_view, name='contract-expire-table'), 
    path('contract/create', create_contract_view, name='create-contract'),
    path('contract/edit/<uuid:pk>/', edit_contract_view, name='edit-contract'),
    path('contract/delete/<uuid:pk>/',delete_contract_view, name='delete-contract'),
    
    path('maintenence-schedule/', maintenence_schedule_table_view, name='maintenence-schedule'),
    path('maintenence-schedule/edit/<int:pk>/', edit_visit_view, name='edit-visit'),
    path('update-visit/', update_maintenance_visit, name='update_maintenance_visit'),
    path('delete-visit/<int:pk>/', delete_Visit_view, name='delete_visit'),
    
    path('update-invoice/', update_invoice_view, name='update_invoice'),
    path('invoice-schedule/', invoice_schedule_table_view, name='invoice-schedule'),
    path('invoice-schedule/edit/<int:pk>/', edit_invoice_view, name='edit-invoice'),
    path('delete-invoice/<int:pk>/', delete_Invoice_view, name='delete-invoice'),

    path('emergency-visits/', emergency_visits_view, name='emergency-visits'),
    path('emergency-visits/create', create_emergency_visit_request_view, name='create-emergency-visits'),
]
