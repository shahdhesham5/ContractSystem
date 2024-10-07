from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Contract, MaintenanceSchedule, InvoiceSchedule
from Clients.models import Site, Company, SubCompany
from dateutil.relativedelta import relativedelta
from datetime import timedelta

@receiver(post_save, sender=Contract)
def generate_maintenance_schedule(sender, instance, created, **kwargs):
    if created:
        start_date = instance.start_date
        end_date = instance.end_date
        maintenance_mapping = {
            "Every Month": 1,
            "Every 2 Months": 2,
            "Every 3 Months": 3,
            "Every 4 Months": 4,
            "Every 6 Months": 6,
        }
        
        visit_interval = maintenance_mapping.get(instance.maintenance_frequency, 1)

        current_date = start_date
        next_date = current_date + relativedelta(months=visit_interval)
        
        sites = Site.objects.filter(company=instance.company)

        while current_date <= end_date:
            for site in sites:
                MaintenanceSchedule.objects.create(
                    contract=instance,
                    site=site,
                    visit_date=current_date,
                    due_date=min(next_date, end_date)
                )
            current_date = next_date
            next_date = current_date + relativedelta(months=visit_interval)

        # Ensure no extra visits are generated past the end date
        if current_date > end_date:
            current_date = end_date

@receiver(post_save, sender=Contract)
def generate_invoice_schedule(sender, instance, created, **kwargs):
    if created:
        start_date = instance.start_date
        end_date = instance.end_date
        invoice_frequency = instance.invoice_frequency
        invoice_date_calculation = instance.invoice_date_calculation
        contract_price_value = instance.contract_price_value
        
        frequency_map = {
            "Every Month": 1,
            "Every 2 Months": 2,
            "Every 3 Months": 3,
            "Every 4 Months": 4,
            "Every 6 Months": 6,
        }

        visit_interval = frequency_map[invoice_frequency]

        sub_companies = instance.company.sub_companies.all() 

        if sub_companies.exists():
            companies_to_invoice = sub_companies  
            total_invoices = ((end_date.year - start_date.year) * 12 + end_date.month - start_date.month) // visit_interval + 1
        else:
            companies_to_invoice = [instance.company] 
            total_invoices = ((end_date.year - start_date.year) * 12 + end_date.month - start_date.month) // visit_interval

        num_companies = len(companies_to_invoice)
        invoice_amount_per_invoice = contract_price_value / (total_invoices * num_companies)

        if invoice_date_calculation == 'start':
            current_date = start_date
        else:
            current_date = start_date + relativedelta(months=visit_interval) - timedelta(days=1)

        while current_date <= end_date:
            for company in companies_to_invoice:
                if isinstance(company, SubCompany):
                    InvoiceSchedule.objects.create(
                        contract=instance,
                        sub_company=company,  
                        invoice_date=current_date,
                        amount=invoice_amount_per_invoice  
                    )
                else:
                    InvoiceSchedule.objects.create(
                        contract=instance,
                        company=company,  
                        invoice_date=current_date,
                        amount=invoice_amount_per_invoice  
                    )

            # Move to the next invoice date based on the interval
            current_date += relativedelta(months=visit_interval)
            if invoice_date_calculation == 'end':
                current_date -= timedelta(days=1)  # Adjust to the end of the next period
