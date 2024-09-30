from django.shortcuts import render
from rest_framework import viewsets
from django.shortcuts import render, get_object_or_404, redirect
from .models import Contract, MaintenanceSchedule, InvoiceSchedule
from .serializers import ContractSerializer, MaintenanceScheduleSerializer, InvoiceScheduleSerializer
from .forms import ContractForm, MaintenanceScheduleForm, InvoiceceScheduleForm
# Create your views here.


class ContractViewSet(viewsets.ModelViewSet):
    queryset = Contract.objects.all()
    serializer_class = ContractSerializer

class MaintenanceScheduleViewSet(viewsets.ModelViewSet):
    queryset = MaintenanceSchedule.objects.all()
    serializer_class = MaintenanceScheduleSerializer
    
class InvoiceScheduleViewSet(viewsets.ModelViewSet):
    queryset = InvoiceSchedule.objects.all()
    serializer_class = InvoiceScheduleSerializer


# New view for displaying contracts in an HTML table
def contract_table_view(request):
    contracts = Contract.objects.all()  # Get all contract data
    return render(request, 'pages/tables.html', {'contracts': contracts})


def edit_contract_view(request, pk):
    contract = get_object_or_404(Contract, pk=pk)

    if request.method == 'POST':
        form = ContractForm(request.POST, request.FILES, instance=contract)  # request.FILES for handling files
        if form.is_valid():
            form.save()
            return redirect('contract-table')
    else:
        form = ContractForm(instance=contract)

    return render(request, 'pages/edit_contract.html', {'form': form, 'contract': contract})

#view for displaying maintenance scheduled visits 
def maintenence_schedule_table_view(request):
    visits = MaintenanceSchedule.objects.all()
    # Get filter parameters from request
    month = request.GET.get('month')  # Expecting '1' for January, '10' for October, etc.
    done_filter = request.GET.get('done')  # Expecting 'true' or 'false'
    
    # Filter by month if specified
    if month:
        month = int(month)  # Convert to an integer
        visits = visits.filter(visit_date__month=month)

    # Filter by done status if specified
    if done_filter is not None:
        if done_filter.lower() == 'true':
            visits = visits.filter(done=True)
        elif done_filter.lower() == 'false':
            visits = visits.filter(done=False)

    return render(request, 'pages/maintenance_schedule.html', {'visits': visits})

def edit_visit_view(request, pk):
    visit = get_object_or_404(MaintenanceSchedule, pk=pk)

    if request.method == 'POST':
        form = MaintenanceScheduleForm(request.POST, request.FILES, instance=visit)  # request.FILES for handling files
        if form.is_valid():
            form.save()
            return redirect('maintenence-schedule')
    else:
        form = MaintenanceScheduleForm(instance=visit)

    return render(request, 'pages/edit_visit.html', {'form': form, 'visit': visit})



#view for displaying invoices
def invoice_schedule_table_view(request):
    invoices = InvoiceSchedule.objects.all()
    month = request.GET.get('month')  
    done_filter = request.GET.get('done') 
    
    # Filter by month if specified
    if month:
        month = int(month)  # Convert to an integer
        invoices = invoices.filter(invoice_date__month=month)

    # Filter by done status if specified
    if done_filter is not None:
        if done_filter.lower() == 'true':
            invoices = invoices.filter(is_paid=True)
        elif done_filter.lower() == 'false':
            invoices = invoices.filter(is_paid=False)

    return render(request, 'pages/invoice_schedule.html', {'invoices': invoices})

def edit_invoice_view(request, pk):
    invoice = get_object_or_404(InvoiceSchedule, pk=pk)

    if request.method == 'POST':
        form = InvoiceceScheduleForm(request.POST, request.FILES, instance=invoice)  # request.FILES for handling files
        if form.is_valid():
            form.save()
            return redirect('maintenence-schedule')
    else:
        form = InvoiceceScheduleForm(instance=invoice)

    return render(request, 'pages/edit_invoice.html', {'form': form, 'invoice': invoice})
