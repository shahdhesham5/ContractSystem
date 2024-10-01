from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import ContractViewSet, MaintenanceScheduleViewSet, InvoiceScheduleViewSet, contract_table_view, edit_contract_view, maintenence_schedule_table_view, edit_visit_view, edit_invoice_view, invoice_schedule_table_view, create_contract_view, contracts_expiring_soon_view, dashboard_view

router = DefaultRouter()
router.register(r'contracts', ContractViewSet)
router.register(r'maintenance/schedule', MaintenanceScheduleViewSet)
router.register(r'invoice/schedule', InvoiceScheduleViewSet)

urlpatterns = [
    path('', include(router.urls)),  # API paths
    path('contracts-list/', contract_table_view, name='contract-table'), 
    path('contracts-expire-list/', contracts_expiring_soon_view, name='contract-expire-table'), 
    path('dashboard', dashboard_view, name='dashboard'),
    path('contracts/edit/<uuid:pk>/', edit_contract_view, name='edit-contract'),
    path('contract/create', create_contract_view, name='create-contract'),
    path('maintenence-schedule/', maintenence_schedule_table_view, name='maintenence-schedule'),
    path('maintenence-schedule/edit/<int:pk>/', edit_visit_view, name='edit-visit'),
    path('invoice-schedule/', invoice_schedule_table_view, name='invoice-schedule'),
    path('invoice-schedule/edit/<int:pk>/', edit_invoice_view, name='edit-invoice'),

]
