from django.shortcuts import render
from django.db.models import Count
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.utils import timezone
from datetime import timedelta
import calendar
from django.db.models import Sum, Count
from django.shortcuts import render, get_object_or_404, redirect
from .models import Contract, MaintenanceSchedule, InvoiceSchedule, Engineers, EmergencyVisits, Vehicles
from Clients.models import Company, Site
from .forms import ContractForm, MaintenanceScheduleForm, InvoiceceScheduleForm, EmergencyForm
from .decorators import allowed_users
from django.utils.translation import gettext_lazy as _   
from django.core.management import call_command
from io import StringIO

def generate_schedule(request):
    """View to trigger schedule generation"""
    try:
        # Capture the output of the management command
        out = StringIO()
        call_command('schedule_maintenance', stdout=out)  # Run your management command
        schedule_output = out.getvalue()  # Get the command's output as a string

        return JsonResponse({'status': 'success', 'schedule': schedule_output})
    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})
   
def schedule_page(request):
    """View to render the schedule page."""
    return render(request, 'pages/locations.html')  # Path to your template

@login_required(login_url='login')
@allowed_users(allowed_roles=['admin','alex','cairo'])
def dashboard_view(request):
    if request.user.groups.exists():
        group = request.user.groups.all()[0].name

    contracts = Contract.objects.all()
    engineers= Engineers.objects.all()
    total_companies = Company.objects.aggregate(total_count=Count('id'))['total_count'] 
    emergencyvisits = EmergencyVisits.objects.filter(done=False)
    emergencyvisitscount = EmergencyVisits.objects.filter(done=False).count()
    
    current_date = timezone.now().date()
    month_number = current_date.month
    month_name = calendar.month_name[month_number]
    invoices_done = []
    invoices_not_done = []
    
    visits = MaintenanceSchedule.objects.filter(
        done=False,
        visit_date__year=current_date.year,
        visit_date__month=current_date.month
    )
    
    valid_visits = MaintenanceSchedule.objects.filter(
        done=False,
        visit_date__lte=current_date,
        due_date__gte=current_date   
    )
    
    expired_visits = MaintenanceSchedule.objects.filter(
        done=False,
        visit_date__lt=current_date,
        due_date__lte=current_date   
    )
    
    visits_count = MaintenanceSchedule.objects.filter(
        visit_date__year=current_date.year,
        visit_date__month=current_date.month
    ).count()
    
    done_count = MaintenanceSchedule.objects.filter(
        done=True,
        visit_date__year=current_date.year,
        visit_date__month=current_date.month
    ).count()

    not_done_count = MaintenanceSchedule.objects.filter(
        done=False,
        visit_date__year=current_date.year,
        visit_date__month=current_date.month
    ).count()
    
    getinvoices_done = InvoiceSchedule.objects.filter(
        invoice_date__month=current_date.month,
        is_paid=True
    ).count()
    
    getinvoices_not_done = InvoiceSchedule.objects.filter(
        invoice_date__month=current_date.month,
        is_paid=False
    ).count()

    total_invoice_amount_done = InvoiceSchedule.objects.filter(
        is_paid=True,
        invoice_date__month=current_date.month,
    ).aggregate(total=Sum('amount'))['total'] or 0
    
    total_invoice_amount_not_done = InvoiceSchedule.objects.filter(
        is_paid=False,
        invoice_date__month=current_date.month,
    ).aggregate(total=Sum('amount'))['total'] or 0

    getinvoices = InvoiceSchedule.objects.filter(invoice_date__month=current_date.month,is_paid=False) 
    
    if group == "admin":
        total_contracts = contracts.aggregate(total_count=Count('id'))['total_count']
        total_value = contracts.aggregate(total_sum=Sum('contract_price_value'))['total_sum'] or 0 

    elif group == "alex":
        contracts = contracts.filter(branch_site='Alexandria')
        total_contracts = contracts.aggregate(total_count=Count('id'))['total_count']
        total_value = contracts.aggregate(total_sum=Sum('contract_price_value'))['total_sum'] or 0 
        emergencyvisits = emergencyvisits.filter(contract__branch_site='Alexandria')
        emergencyvisitscount = EmergencyVisits.objects.filter(done=False, contract__branch_site='Alexandria').count()
        visits = visits.filter(contract__branch_site='Alexandria')
        valid_visits = valid_visits.filter(contract__branch_site='Alexandria')
        expired_visits = expired_visits.filter(contract__branch_site='Alexandria')
        visits_count = MaintenanceSchedule.objects.filter(
            contract__branch_site='Alexandria',
            visit_date__year=current_date.year,
            visit_date__month=current_date.month
        ).count()

        done_count = MaintenanceSchedule.objects.filter(
            contract__branch_site='Alexandria',
            done=True,
            visit_date__year=current_date.year,
            visit_date__month=current_date.month
        ).count()

        not_done_count = MaintenanceSchedule.objects.filter(
            contract__branch_site='Alexandria',
            done=False,
            visit_date__year=current_date.year,
            visit_date__month=current_date.month
        ).count()

        getinvoices_done = InvoiceSchedule.objects.filter(
            contract__branch_site='Alexandria',
            invoice_date__month=current_date.month,
            is_paid=True
        ).count()

        getinvoices_not_done = InvoiceSchedule.objects.filter(
            contract__branch_site='Alexandria',
            invoice_date__month=current_date.month,
            is_paid=False
        ).count()

        total_invoice_amount_done = InvoiceSchedule.objects.filter(
            contract__branch_site='Alexandria',
            is_paid=True,
            invoice_date__month=current_date.month,
        ).aggregate(total=Sum('amount'))['total'] or 0

        total_invoice_amount_not_done = InvoiceSchedule.objects.filter(
            contract__branch_site='Alexandria',
            is_paid=False,
            invoice_date__month=current_date.month,
        ).aggregate(total=Sum('amount'))['total'] or 0

        getinvoices = getinvoices.filter(contract__branch_site='Alexandria')
        
    elif group == "cairo":
        contracts = contracts.filter(branch_site='Cairo')
        total_contracts = contracts.aggregate(total_count=Count('id'))['total_count']
        total_value = contracts.aggregate(total_sum=Sum('contract_price_value'))['total_sum'] or 0 
        emergencyvisits = emergencyvisits.filter(contract__branch_site='Cairo')
        emergencyvisitscount = EmergencyVisits.objects.filter(done=False, contract__branch_site='Cairo').count()
        visits = visits.filter(contract__branch_site='Cairo')
        valid_visits = valid_visits.filter(contract__branch_site='Cairo')
        expired_visits = expired_visits.filter(contract__branch_site='Cairo')
        visits_count = MaintenanceSchedule.objects.filter(
            contract__branch_site='Cairo',
            visit_date__year=current_date.year,
            visit_date__month=current_date.month
        ).count()

        done_count = MaintenanceSchedule.objects.filter(
            contract__branch_site='Cairo',
            done=True,
            visit_date__year=current_date.year,
            visit_date__month=current_date.month
        ).count()

        not_done_count = MaintenanceSchedule.objects.filter(
            contract__branch_site='Cairo',
            done=False,
            visit_date__year=current_date.year,
            visit_date__month=current_date.month
        ).count()

        getinvoices_done = InvoiceSchedule.objects.filter(
            contract__branch_site='Cairo',
            invoice_date__month=current_date.month,
            is_paid=True
        ).count()

        getinvoices_not_done = InvoiceSchedule.objects.filter(
            contract__branch_site='Cairo',
            invoice_date__month=current_date.month,
            is_paid=False
        ).count()

        total_invoice_amount_done = InvoiceSchedule.objects.filter(
            contract__branch_site='Cairo',
            is_paid=True,
            invoice_date__month=current_date.month,
        ).aggregate(total=Sum('amount'))['total'] or 0

        total_invoice_amount_not_done = InvoiceSchedule.objects.filter(
            contract__branch_site='Cairo',
            is_paid=False,
            invoice_date__month=current_date.month,
        ).aggregate(total=Sum('amount'))['total'] or 0

        getinvoices = getinvoices.filter(contract__branch_site='Cairo')

        
    for invoice in getinvoices:
        if invoice.sub_company is None:
            # Get all maintenance visits related to the parent company
            maintenance_visits_done = MaintenanceSchedule.objects.filter(
                site__company=invoice.company,
                visit_date__lt=invoice.invoice_date,
                done=True
            )
            maintenance_visits_not_done = MaintenanceSchedule.objects.filter(
                site__company=invoice.company,
                visit_date__lt=invoice.invoice_date,
                done=False
            )
        else:
            # Get all maintenance visits related to the sub-company
            maintenance_visits_done = MaintenanceSchedule.objects.filter(
                site__sub_company=invoice.sub_company,
                visit_date__lt=invoice.invoice_date,
                done=True
            )
            maintenance_visits_not_done = MaintenanceSchedule.objects.filter(
                site__sub_company=invoice.sub_company,
                visit_date__lt=invoice.invoice_date,
                done=False
            )
            # Check the conditions for appending the invoice
        if maintenance_visits_done.exists() and not maintenance_visits_not_done.exists():
            # Only "done" maintenance visits exist, so add to invoices_done
            invoices_done.append(invoice)
        elif maintenance_visits_not_done.exists():
            # "Not done" maintenance visits exist (with or without "done" visits), so add to invoices_not_done
            invoices_not_done.append(invoice)




        
    return render(request, 'pages/dashboard.html', {'segment':'dashboard',
                                                    'total_contracts': total_contracts,
                                                    'total_value': total_value,
                                                    'total_companies': total_companies,
                                                    'done_count': done_count,
                                                    'not_done_count': not_done_count,
                                                    'getinvoices_done':getinvoices_done,
                                                    'getinvoices_not_done':getinvoices_not_done,
                                                    'total_invoice_amount_done':total_invoice_amount_done,
                                                    'total_invoice_amount_not_done':total_invoice_amount_not_done,
                                                    'this_month': month_name,
                                                    'visits_count':visits_count,
                                                    'visits': visits,
                                                    'valid_visits':valid_visits,
                                                    'expired_visits':expired_visits,
                                                    'engineers': engineers,
                                                    'emergencyvisits':emergencyvisits,
                                                    'emergencyvisitscount':emergencyvisitscount,
                                                    'invoices_done': invoices_done,
                                                    'invoices_not_done':invoices_not_done,
                                                    'current_date':current_date})    

# View Contracts
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin','alex','cairo'])
def contract_table_view(request):
    is_admin = request.user.groups.filter(name='admin').exists()
    if request.user.groups.exists():
        group = request.user.groups.all()[0].name

    contracts = Contract.objects.all()

    if group == 'admin':
        branch = request.GET.get('branch')
        branch_site = request.GET.get('branch_site')
        company_id = request.GET.get('company_name') 
        contracts = Contract.objects.all()
        
        if branch:
            contracts = contracts.filter(branch=branch)
        if branch_site:
            contracts = contracts.filter(branch_site=branch_site)
        if company_id:
            contracts = contracts.filter(company__id=company_id)  

            
        branches = Contract.objects.values_list('branch', flat=True).distinct()
        branch_sites = Contract.objects.values_list('branch_site', flat=True).distinct()
        company_names = Company.objects.values('id', 'company_name').distinct() 
    
        return render(request, 'pages/contracts.html', {
            'contracts': contracts,
            'branches': branches,
            'branch_sites': branch_sites,
            'company_names': company_names, 
            'selected_branch': branch,
            'selected_branch_site': branch_site,
            'selected_company_name': company_id,
            'segment':'contracts',
            'is_admin': is_admin,
        })
        
    elif group == 'alex':
           contracts = Contract.objects.filter(branch_site="Alexandria")
           return render(request, 'pages/contracts.html', {'contracts': contracts, 'segment':'contracts', 'is_admin': is_admin,})
       
    elif group == 'cairo':
           contracts = Contract.objects.filter(branch_site="Cairo")
           return render(request, 'pages/contracts.html', {'contracts': contracts, 'segment':'contracts', 'is_admin': is_admin,})
    

# editing the contract 
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
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


#adding new contract view
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def create_contract_view(request):
    if request.method == 'POST':
        form = ContractForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('contract-table') 
    else:
        form = ContractForm()

    return render(request, 'pages/create_contract.html', {'form': form})


# Deleting contract
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def delete_contract_view(request, pk):
    contract = get_object_or_404(Contract, pk=pk)
    
    if request.method == 'POST':
        contract.delete()
        messages.success(request, 'Contract deleted successfully.')
        return redirect('contract-table')



# listing the contract almost expired 
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin','alex','cairo'])
def contracts_expiring_soon_view(request):
    
    today = timezone.now().date()  
    one_month_later = today + timedelta(days=30) 
    
    if request.user.groups.exists():
        group = request.user.groups.all()[0].name

    if group == 'alex':
        contracts_expiring_soon = Contract.objects.filter(end_date__lte=one_month_later, end_date__gte=today, branch_site="Alexandria")   
        return render(request, 'pages/expiring_soon.html', {'contracts_expiring_soon': contracts_expiring_soon, 'segment':'expire'})
       
    elif group == 'cairo':
        contracts_expiring_soon = Contract.objects.filter(end_date__lte=one_month_later, end_date__gte=today, branch_site="Cairo")
        return render(request, 'pages/expiring_soon.html', {'contracts_expiring_soon': contracts_expiring_soon, 'segment':'expire'})
    
    else:
        contracts_expiring_soon = Contract.objects.filter(end_date__lte=one_month_later, end_date__gte=today)
        context = {
            'contracts_expiring_soon': contracts_expiring_soon,
            'segment':'expire'
        }
        return render(request, 'pages/expiring_soon.html', context)


# List Maintenance Visits
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin', 'alex', 'cairo'])
def maintenence_schedule_table_view(request):
    is_admin = request.user.groups.filter(name='admin').exists()
    if request.user.groups.exists():
        group = request.user.groups.all()[0].name

    visits = MaintenanceSchedule.objects.all()
    site_names = Site.objects.values('id', 'site_name').distinct() 
   
    month = request.GET.get('month')  
    done_filter = request.GET.get('done')
    site_id = request.GET.get('site_name') 
    branch = request.GET.get('branch')
    branch_site = request.GET.get('branch_site')

    if group == 'admin':
        if branch:
            visits = visits.filter(contract__branch=branch)
        if branch_site:
            visits = visits.filter(contract__branch_site=branch_site)
        if site_id:
            visits = visits.filter(site__id=site_id)

    else:
        if group == 'alex':
            visits = visits.filter(contract__branch_site='Alexandria')
            # Filter Site based on companies that have contracts in Alexandria
            alex_company_ids = Contract.objects.filter(branch_site='Alexandria').values_list('company_id', flat=True)
            site_names = Site.objects.filter(company_id__in=alex_company_ids).values('id', 'site_name').distinct()
            if site_id:
                visits = visits.filter(site__id=site_id)

          
          
        elif group == 'cairo':
            visits = visits.filter(contract__branch_site='Cairo')
            # Filter Site based on companies that have contracts in Cairo
            cairo_company_ids = Contract.objects.filter(branch_site='Cairo').values_list('company_id', flat=True)
            site_names = Site.objects.filter(company_id__in=cairo_company_ids).values('id', 'site_name').distinct()
            if site_id:
                visits = visits.filter(site__id=site_id)

            

    if month:
        month = int(month)  
        visits = visits.filter(visit_date__month=month)

    if done_filter is not None:
        if done_filter.lower() == 'true':
            visits = visits.filter(done=True)
        elif done_filter.lower() == 'false':
            visits = visits.filter(done=False)

    # Fetch branches and branch sites for the filters
    branches = Contract.objects.values_list('branch', flat=True).distinct()
    branch_sites = Contract.objects.values_list('branch_site', flat=True).distinct()

    return render(request, 'pages/maintenance_schedule.html', {
        'visits': visits,
        'segment': 'visits',
        'branches': branches,
        'branch_sites': branch_sites,
        'site_names': site_names, 
        'selected_branch': branch,
        'selected_branch_site': branch_site,
        'selected_site_name': site_id,
        'is_admin': is_admin,
    })


# editing maintenance schedule
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
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


@login_required(login_url='login')
def maintenance_visits_chart(request):
    done_count = MaintenanceSchedule.objects.filter(done=True).count()
    not_done_count = MaintenanceSchedule.objects.filter(done=False).count()
    return render(request, 'pages/dashboard.html', {'done_count': done_count,'not_done_count': not_done_count,})


#Modal update
@login_required(login_url='login')
def update_maintenance_visit(request):
    if request.method == 'POST':
        visit_id = request.POST.get('visit_id')
        completed_date = request.POST.get('actual_visit_date')  # Get the completed visit date
        image = request.FILES.get('image')
        pdf = request.FILES.get('pdf')
        done_by = request.POST.get('done_by')
        
        visit = get_object_or_404(MaintenanceSchedule, id=visit_id)

        # Update the fields
        visit.completed_date = completed_date  # Assign the completed visit date
        visit.image = image
        visit.pdf = pdf
        
        # Retrieve the Engineer instance
        engineer_instance = get_object_or_404(Engineers, id=done_by)
        visit.eng = engineer_instance  # Assign the instance, not the ID
        
        visit.done = True  # Mark the visit as done
        visit.save()

        return JsonResponse({'success': True})

    return JsonResponse({'success': False, 'error': 'Invalid request'})


# Deleting Visit
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def delete_Visit_view(request, pk):
    visit = get_object_or_404(MaintenanceSchedule, pk=pk)
    
    if request.method == 'POST':
        visit.delete()
        messages.success(request, 'Maintenance Visit deleted successfully.')
        return redirect('maintenence-schedule')



#view for displaying invoices
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin', 'alex', 'cairo'])
def invoice_schedule_table_view(request):
    is_admin = request.user.groups.filter(name='admin').exists()
    if request.user.groups.exists():
        group = request.user.groups.all()[0].name

    invoices = InvoiceSchedule.objects.all()
    company_names = Company.objects.values('id', 'company_name').distinct() 
    
    month = request.GET.get('month')  
    done_filter = request.GET.get('done')
    company_id = request.GET.get('company_name')  
    branch = request.GET.get('branch')
    branch_site = request.GET.get('branch_site')
    
    if group == 'admin':
        if branch:
            invoices = invoices.filter(contract__branch=branch)
        if branch_site:
            invoices = invoices.filter(contract__branch_site=branch_site)
        if company_id:
            invoices = invoices.filter(company__id=company_id)  
    else:
        if group == 'alex':
            invoices = invoices.filter(contract__branch_site='Alexandria')
            # Filter companies that have contracts in Alexandria
            alex_company_ids = Contract.objects.filter(branch_site='Alexandria').values_list('company_id', flat=True)
            company_names = Company.objects.filter(id__in=alex_company_ids).values('id', 'company_name').distinct()
            if company_id:
                invoices = invoices.filter(company__id=company_id)  
                

        elif group == 'cairo':
            invoices = invoices.filter(contract__branch_site='Cairo')
            # Filter companies that have contracts in Cairo
            cairo_company_ids = Contract.objects.filter(branch_site='Cairo').values_list('company_id', flat=True)
            company_names = Company.objects.filter(id__in=cairo_company_ids).values('id', 'company_name').distinct()
            if company_id:
                invoices = invoices.filter(company__id=company_id)  
                
                

    
    if month:
        month = int(month) 
        invoices = invoices.filter(invoice_date__month=month)
        
    if done_filter is not None:
        if done_filter.lower() == 'true':
            invoices = invoices.filter(is_paid=True)
        elif done_filter.lower() == 'false':
            invoices = invoices.filter(is_paid=False)


    branches = Contract.objects.values_list('branch', flat=True).distinct()
    branch_sites = Contract.objects.values_list('branch_site', flat=True).distinct()


    return render(request, 'pages/invoice_schedule.html', {'invoices': invoices, 
        'segment':'invoices',
        'branches': branches,
        'branch_sites': branch_sites,
        'company_names': company_names, 
        'selected_branch': branch,
        'selected_branch_site': branch_site,
        'selected_company_name': company_id,
        'is_admin': is_admin,
        })


# editing invoice schedule
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def edit_invoice_view(request, pk):
    invoice = get_object_or_404(InvoiceSchedule, pk=pk)

    if request.method == 'POST':
        form = InvoiceceScheduleForm(request.POST, request.FILES, instance=invoice) 
        if form.is_valid():
            form.save()
            return redirect('maintenence-schedule')
    else:
        form = InvoiceceScheduleForm(instance=invoice)

    return render(request, 'pages/edit_invoice.html', {'form': form, 'invoice': invoice})


#Modal update
@login_required(login_url='login')
def update_invoice_view(request):
    if request.method == 'POST':
        invoice_id = request.POST.get('invoice_id')
        image = request.FILES.get('image')
        pdf = request.FILES.get('pdf')
        
        invoice = get_object_or_404(InvoiceSchedule, id=invoice_id)

        # Update the fields
        invoice.image = image
        invoice.pdf = pdf
        
        invoice.is_paid = True  # Mark the invoice as paid
        invoice.save()

        return JsonResponse({'success': True})

    return JsonResponse({'success': False, 'error': 'Invalid request'})


# Deleting Invoice
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def delete_Invoice_view(request, pk):
    invoice = get_object_or_404(InvoiceSchedule, pk=pk)
    
    if request.method == 'POST':
        invoice.delete()
        messages.success(request, 'Invoice deleted successfully.')
        return redirect('invoice-schedule')


#emergency visits
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin', 'alex', 'cairo'])
def emergency_visits_view(request):
    if request.user.groups.exists():
        group = request.user.groups.all()[0].name
    
    visits = EmergencyVisits.objects.all()

    if group == 'alex':
        visits = visits.filter(contract__branch_site='Alexandria')
    elif group == 'cairo':
        visits = visits.filter(contract__branch_site='Cairo')
    
    return render(request, 'pages/emergency_visits.html', {'visits': visits, 'segment':'emergency'})


# Deleting emergency visit
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def delete_emergency_visit_view(request, pk):
    visit = get_object_or_404(EmergencyVisits, pk=pk)
    
    if request.method == 'POST':
        visit.delete()
        messages.success(request, 'Emergency Visit deleted successfully.')
        return redirect('emergency-visits')


# Create emergency form
@login_required(login_url='login')
def create_emergency_visit_request_view(request):
    if request.method == 'POST':
        form = EmergencyForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('emergency-visits') 
    else:
        form = EmergencyForm()

    return render(request, 'pages/create_emergency_visit.html', {'form': form})


#Modal update
@login_required(login_url='login')
def update_emergency_visit_view(request):
    if request.method == 'POST':
        visit_id = request.POST.get('emergencyVisit_id')
        completed_date = request.POST.get('actual_emergencyVisit_date')  # Get the completed visit date
        image = request.FILES.get('emergencyVisit_image')
        pdf = request.FILES.get('emergencyVisit_pdf')
        done_by = request.POST.get('done_by')
        
        visit = get_object_or_404(EmergencyVisits, id=visit_id)

        # Update the fields
        visit.actual_visit_date = completed_date  # Assign the completed visit date
        visit.image = image
        visit.pdf = pdf
        
        # Retrieve the Engineer instance
        engineer_instance = get_object_or_404(Engineers, id=done_by)
        visit.eng = engineer_instance  # Assign the instance, not the ID
        
        visit.done = True  # Mark the visit as done
        visit.save()

        return JsonResponse({'success': True})

    return JsonResponse({'success': False, 'error': 'Invalid request'})

# editing maintenance schedule
@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def edit_emergency_visit_request_view(request, pk):
    visit = get_object_or_404(EmergencyVisits, pk=pk)

    if request.method == 'POST':
        form = EmergencyForm(request.POST, request.FILES, instance=visit)  # request.FILES for handling files
        if form.is_valid():
            form.save()
            return redirect('emergency-visits')
    else:
        form = EmergencyForm(instance=visit)

    return render(request, 'pages/edit_emergency_visit.html', {'form': form, 'visit': visit})


@login_required(login_url='login')
def load_sites(request):
    contract_id = request.GET.get('contract_id')
    if contract_id:
        # Get the company ID associated with the contract
        company_id = Contract.objects.filter(id=contract_id).values_list('company_id', flat=True).first()
        # Get sites related to this company
        sites = Site.objects.filter(company_id=company_id).values('id', 'site_name')
        return JsonResponse(list(sites), safe=False)
    return JsonResponse({'error': 'Invalid contract ID'}, status=400)
