from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import ContractViewSet, MaintenanceScheduleViewSet, InvoiceScheduleViewSet, contract_table_view, edit_contract_view, maintenence_schedule_table_view, edit_visit_view, edit_invoice_view, invoice_schedule_table_view

router = DefaultRouter()
router.register(r'contracts', ContractViewSet)
router.register(r'maintenance/schedule', MaintenanceScheduleViewSet)
router.register(r'invoice/schedule', InvoiceScheduleViewSet)

urlpatterns = [
    path('', include(router.urls)),  # API paths
    path('table/', contract_table_view, name='contract-table'),  # URL for rendering table
    path('contracts/edit/<uuid:pk>/', edit_contract_view, name='edit-contract'),
    path('maintenence-schedule/', maintenence_schedule_table_view, name='maintenence-schedule'),
    path('maintenence-schedule/edit/<int:pk>/', edit_visit_view, name='edit-visit'),
    path('invoice-schedule/', invoice_schedule_table_view, name='invoice-schedule'),
    path('invoice-schedule/edit/<int:pk>/', edit_invoice_view, name='edit-invoice'),

]
