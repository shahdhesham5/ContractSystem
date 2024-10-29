from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404, redirect
from django.db.models import Sum, Count
from .models import City, Area, Company, SubCompany, Site
from .forms import CompanyForm, SubCompanyForm, SiteForm
from contracts.models import Contract, MaintenanceSchedule, InvoiceSchedule, EmergencyVisits
import uuid
from django.core.exceptions import ValidationError
from contracts.decorators import allowed_users

import logging

logger = logging.getLogger(__name__)  # Configure this in your settings if not already

def load_subcompanies(request):
    company_id = request.GET.get('company_id')

    try:
        # Validate and parse the UUID
        company_id = uuid.UUID(company_id)
    except (ValueError, TypeError, ValidationError) as e:
        logger.error(f"UUID parsing error: {e}")
        return JsonResponse({'error': 'Invalid company ID format'}, status=400)

    try:
        # Perform the query for sub-companies based on the UUID
        sub_companies = SubCompany.objects.filter(parent_company_id=company_id).values('id', 'sub_company_name')
        return JsonResponse(list(sub_companies), safe=False)
    except Exception as e:
        logger.error(f"Database query error: {e}")
        return JsonResponse({'error': 'Server error while retrieving sub-companies'}, status=500)

def load_areas(request):
    city_id = request.GET.get('city_id')
    areas = Area.objects.filter(city_id=city_id).values('id', 'name')
    return JsonResponse(list(areas), safe=False)

@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def company_list_view(request):
    companies = Company.objects.all()
    return render(request, 'pages/companies.html', {'companies': companies, 'segment': 'company'})


@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def company_delete_view(request, pk):
    company = get_object_or_404(Company, pk=pk)
    
    if request.method == 'POST':
        company.delete()
        messages.success(request, 'Company deleted successfully.')
        return redirect('companies-list')


@login_required(login_url='accounts/login/')  
@allowed_users(allowed_roles=['admin'])     
def company_edit_view(request, pk):
    company = get_object_or_404(Company, pk=pk)

    if request.method == 'POST':
        form = CompanyForm(request.POST, instance=company) 
        if form.is_valid():
            form.save()
            return redirect('companies-list')
    else:
        form = CompanyForm(instance=company)

    return render(request, 'pages/edit_company.html', {'form': form, 'company': company})


@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def create_company_view(request):
    if request.method == 'POST':
        form = CompanyForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('companies-list') 
    else:
        form = CompanyForm()

    return render(request, 'pages/create_company.html', {'form': form})


@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def company_profile_view(request, pk):
    company = get_object_or_404(Company, id=pk)
    subcompanies = SubCompany.objects.filter(parent_company=company)
    company_sites = Site.objects.filter(company=company)
    subcompany_sites = Site.objects.filter(sub_company__parent_company=company)
    all_sites = company_sites.union(subcompany_sites)
    
    contracts = Contract.objects.filter(company=company)  
    invoices_done = InvoiceSchedule.objects.filter(company=company, is_paid=True)  
    emergency = EmergencyVisits.objects.filter(contract__company=company, done=True)
    
    context = {
        'company': company,
        'subcompanies':subcompanies,
        'all_sites':all_sites,
        'contracts': contracts,
        'invoices_done':invoices_done,
        'emergency':emergency,
    }
    return render(request, 'pages/company_profile.html', context)



@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def subcompany_list_view(request):
    subcompanies = SubCompany.objects.all()
    return render(request, 'pages/subcompanies.html', {'subcompanies': subcompanies, 'segment': 'subcompany'})


@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def subcompany_delete_view(request, pk):
    subcompany = get_object_or_404(SubCompany, pk=pk)
    
    if request.method == 'POST':
        subcompany.delete()
        messages.success(request, 'SubCompany deleted successfully.')
        return redirect('subcompanies-list')


@login_required(login_url='accounts/login/')  
@allowed_users(allowed_roles=['admin'])      
def subcompany_edit_view(request, pk):
    subcompany = get_object_or_404(SubCompany, pk=pk)

    if request.method == 'POST':
        form = SubCompanyForm(request.POST, instance=subcompany) 
        if form.is_valid():
            form.save()
            return redirect('subcompanies-list')
    else:
        form = SubCompanyForm(instance=subcompany)

    return render(request, 'pages/edit_subcompany.html', {'form': form, 'subcompany': subcompany})


@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def create_subcompany_view(request):
    if request.method == 'POST':
        form = SubCompanyForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('subcompanies-list') 
    else:
        form = SubCompanyForm()

    return render(request, 'pages/create_subcompany.html', {'form': form})




@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def site_list_view(request):
    sites = Site.objects.all()
    return render(request, 'pages/sites.html', {'sites': sites, 'segment': 'site'})


@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def site_delete_view(request, pk):
    site = get_object_or_404(Site, pk=pk)
    
    if request.method == 'POST':
        site.delete()
        messages.success(request, 'Site deleted successfully.')
        return redirect('site-list')


@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def site_edit_view(request, pk):
    site = get_object_or_404(Site, pk=pk)

    if request.method == 'POST':
        form = SiteForm(request.POST, instance=site) 
        if form.is_valid():
            form.save()
            return redirect('site-list')
    else:
        form = SiteForm(instance=site)

    return render(request, 'pages/edit_site.html', {'form': form, 'site': site})


@login_required(login_url='accounts/login/')
@allowed_users(allowed_roles=['admin'])
def create_site_view(request):
    if request.method == 'POST':
        form = SiteForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('site-list') 
    else:
        form = SiteForm()

    return render(request, 'pages/create_site.html', {'form': form})

