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
        
        # Convert the maintenance_frequency string into an integer value
        visit_interval = maintenance_mapping.get(instance.maintenance_frequency, 1)
        
        # Calculate the number of months between start and end date
        number_of_months = (end_date.year - start_date.year) * 12 + end_date.month - start_date.month
        total_visits = number_of_months // visit_interval

        current_date = start_date

        # Get all the sites related to this company or sub-company
        sites = Site.objects.filter(company=instance.company)

        # Generate maintenance schedules for each site
        for _ in range(total_visits + 1):  # To include the end date maintenance visit
            for site in sites:
                MaintenanceSchedule.objects.create(
                    contract=instance,
                    site=site,
                    visit_date=current_date  # Auto-generated visit date
                )
            current_date += relativedelta(months=visit_interval)


@receiver(post_save, sender=Contract)
def generate_invoice_schedule(sender, instance, created, **kwargs):
    if created:
        start_date = instance.start_date
        end_date = instance.end_date
        invoice_frequency = instance.invoice_frequency
        invoice_date_calculation = instance.invoice_date_calculation
        contract_price_value = instance.contract_price_value
        
        # Map the frequency string to the actual months count
        frequency_map = {
            "Every Month": 1,
            "Every 2 Months": 2,
            "Every 3 Months": 3,
            "Every 4 Months": 4,
            "Every 6 Months": 6,
        }

        # Calculate the number of months between each invoice
        visit_interval = frequency_map[invoice_frequency]

        # Determine the total number of invoices to be generated
        total_invoices = (end_date.year - start_date.year) * 12 // visit_interval + (end_date.month - start_date.month) // visit_interval + 1

        # Determine invoice dates based on the chosen calculation method
        if invoice_date_calculation == 'start':
            current_date = start_date
        else:
            # Calculate the first invoice date based on the end of the period
            current_date = start_date + relativedelta(months=visit_interval) - timedelta(days=1)

        # Determine the companies to generate invoices for
        sub_companies = instance.company.sub_companies.all()  # Get all sub-companies of the parent company

        if sub_companies.exists():
            companies_to_invoice = sub_companies  # Invoices for each sub-company
        else:
            companies_to_invoice = [instance.company]  # Invoices for the company itself

        # Calculate the amount for each invoice (split between the invoices)
        invoice_amount_per_invoice = contract_price_value / (total_invoices * len(companies_to_invoice))

        # Generate invoices until the end date of the contract
        while current_date <= end_date:
            for company in companies_to_invoice:
                if isinstance(company, SubCompany):
                    InvoiceSchedule.objects.create(
                        contract=instance,
                        sub_company=company,  # Assign the sub-company
                        invoice_date=current_date,
                        amount=invoice_amount_per_invoice  # Use the calculated amount
                    )
                else:
                    InvoiceSchedule.objects.create(
                        contract=instance,
                        company=company,  # Assign the parent company
                        invoice_date=current_date,
                        amount=invoice_amount_per_invoice  # Use the calculated amount
                    )

            # Move to the next invoice date based on the interval
            current_date += relativedelta(months=visit_interval)
            if invoice_date_calculation == 'end':
                current_date -= timedelta(days=1)  # Adjust to the end of the next period
