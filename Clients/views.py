from django.shortcuts import render
from rest_framework import viewsets
from django.contrib import messages
from django.shortcuts import render, get_object_or_404, redirect
from django.db.models import Sum, Count
from .models import City, Area, Company, SubCompany, Site
from .forms import CompanyForm, SubCompanyForm, SiteForm
from .serializers import CitySerializer, AreaSerializer, CompanySerializer, SubCompanySerializer, SiteSerializer
from contracts.models import Contract, MaintenanceSchedule, InvoiceSchedule, EmergencyVisits

def company_list_view(request):
    companies = Company.objects.all()
    return render(request, 'pages/companies.html', {'companies': companies, 'segment': 'company'})

def company_delete_view(request, pk):
    company = get_object_or_404(Company, pk=pk)
    
    if request.method == 'POST':
        company.delete()
        messages.success(request, 'Company deleted successfully.')
        return redirect('companies-list')
      
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

def create_company_view(request):
    if request.method == 'POST':
        form = CompanyForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('companies-list') 
    else:
        form = CompanyForm()

    return render(request, 'pages/create_company.html', {'form': form})

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




def subcompany_list_view(request):
    subcompanies = SubCompany.objects.all()
    return render(request, 'pages/subcompanies.html', {'subcompanies': subcompanies, 'segment': 'subcompany'})

def subcompany_delete_view(request, pk):
    subcompany = get_object_or_404(SubCompany, pk=pk)
    
    if request.method == 'POST':
        subcompany.delete()
        messages.success(request, 'SubCompany deleted successfully.')
        return redirect('subcompanies-list')
      
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

def create_subcompany_view(request):
    if request.method == 'POST':
        form = SubCompanyForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('subcompanies-list') 
    else:
        form = SubCompanyForm()

    return render(request, 'pages/create_subcompany.html', {'form': form})





def site_list_view(request):
    sites = Site.objects.all()
    return render(request, 'pages/sites.html', {'sites': sites, 'segment': 'site'})

def site_delete_view(request, pk):
    site = get_object_or_404(Site, pk=pk)
    
    if request.method == 'POST':
        site.delete()
        messages.success(request, 'Site deleted successfully.')
        return redirect('site-list')
      
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

def create_site_view(request):
    if request.method == 'POST':
        form = SiteForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('site-list') 
    else:
        form = SiteForm()

    return render(request, 'pages/create_site.html', {'form': form})





class CityViewSet(viewsets.ModelViewSet):
    queryset = City.objects.all()
    serializer_class = CitySerializer


class AreaViewSet(viewsets.ModelViewSet):
    queryset = Area.objects.all()
    serializer_class = AreaSerializer


class CompanyViewSet(viewsets.ModelViewSet):
    queryset = Company.objects.all()
    serializer_class = CompanySerializer


class SubCompanyViewSet(viewsets.ModelViewSet):
    queryset = SubCompany.objects.all()
    serializer_class = SubCompanySerializer


class SiteViewSet(viewsets.ModelViewSet):
    queryset = Site.objects.all()
    serializer_class = SiteSerializer
