from django.shortcuts import render
from rest_framework import viewsets
from django.shortcuts import render, get_object_or_404, redirect
from .models import Contract, MaintenanceSchedule, InvoiceSchedule
from .serializers import ContractSerializer, MaintenanceScheduleSerializer, InvoiceScheduleSerializer
from .forms import ContractForm 
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
    visits = MaintenanceSchedule.objects.all()  # Get all contract data
    return render(request, 'pages/maintenance_schedule.html', {'visits': visits})
