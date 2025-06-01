from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from .models import Contract, MaintenanceSchedule, InvoiceSchedule
from Clients.models import Site, Company, SubCompany
from dateutil.relativedelta import relativedelta
from datetime import timedelta
import datetime

@receiver(post_save, sender=Contract)
def generate_maintenance_schedule(sender, instance, created, **kwargs):
    if created:
        start_date = instance.start_date
        end_date = instance.end_date
        
        maintenance_mapping = {
            "Every Week": timedelta(weeks=1),
            "Every 2 Weeks": timedelta(weeks=2),
            "Every Month": relativedelta(months=1),
            "Every 2 Months": relativedelta(months=2),
            "Every 3 Months": relativedelta(months=3),
            "Every 4 Months": relativedelta(months=4),
            "Every 6 Months": relativedelta(months=6),
        }
        
        visit_interval = maintenance_mapping.get(instance.maintenance_frequency, relativedelta(months=1))
        current_date = start_date
        next_date = start_date + visit_interval
        
        sites = Site.objects.filter(company=instance.company)
        
        while current_date < end_date:  # Ensure the current date is strictly before the end date
            for site in sites:
                MaintenanceSchedule.objects.create(
                    contract=instance,
                    site=site,
                    visit_date=current_date,
                    due_date=min(next_date, end_date)
                )
            current_date = next_date
            next_date = current_date + visit_interval

        # Avoid generating a visit if the last `current_date` equals the `end_date`
        if current_date == end_date:
            return
  
@receiver(post_save, sender=Contract)
def generate_invoice_schedule(sender, instance, created, **kwargs):
    if created:
        start_date = instance.start_date
        end_date = instance.end_date
        invoice_frequency = instance.invoice_frequency
        invoice_date_calculation = instance.invoice_date_calculation
        contract_price_value = instance.contract_price_value
        is_taxed = instance.is_taxed
        tax_percentage = instance.tax_percentage
        
        # Map invoice frequency to intervals
        frequency_map = {
            "Every Month": 1,
            "Every 2 Months": 2,
            "Every 3 Months": 3,
            "Every 4 Months": 4,
            "Every 6 Months": 6,
        }
        visit_interval = frequency_map.get(invoice_frequency, 1)
        total_invoices = ((end_date.year - start_date.year) * 12 + end_date.month - start_date.month) // visit_interval + 1

        sub_companies = instance.company.sub_companies.all()
        sites = Site.objects.filter(company=instance.company)
        
        if sub_companies.exists():
            # Calculate the total number of sites across all sub-companies
            total_sites = sites.count()

            # Invoice date calculation logic
            current_date = start_date if invoice_date_calculation == 'start' else start_date + relativedelta(months=visit_interval) - timedelta(days=1)

            while current_date <= end_date:
                for sub_company in sub_companies:
                    # Get count of sites for this sub-company
                    sub_company_sites = sites.filter(sub_company=sub_company).count()

                    # Calculate the amount for this sub-company
                    sub_company_amount = (contract_price_value / total_sites) * sub_company_sites
                    invoice_amount_with_tax = sub_company_amount * (1 + (tax_percentage / 100)) if is_taxed else sub_company_amount

                    # Create the invoice for the sub-company
                    InvoiceSchedule.objects.create(
                        contract=instance,
                        company=instance.company,  # Parent company reference
                        sub_company=sub_company,  # Sub-company reference
                        invoice_date=current_date,
                        amount=round(invoice_amount_with_tax / total_invoices, 2)  # Divide by number of invoices and round
                    )

                # Move to the next invoice date
                current_date += relativedelta(months=visit_interval)
                if invoice_date_calculation == 'end':
                    current_date -= timedelta(days=1)
        else:
            # If no sub-companies exist, proceed with regular invoice generation
            num_companies = 1
            invoice_amount_per_invoice = contract_price_value / (total_invoices * num_companies)
            invoice_amount_with_tax = invoice_amount_per_invoice * (1 + (tax_percentage / 100)) if is_taxed else invoice_amount_per_invoice

            current_date = start_date if invoice_date_calculation == 'start' else start_date + relativedelta(months=visit_interval) - timedelta(days=1)

            while current_date <= end_date:
                InvoiceSchedule.objects.create(
                    contract=instance,
                    company=instance.company,
                    invoice_date=current_date,
                    amount=round(invoice_amount_with_tax, 2)
                )
                current_date += relativedelta(months=visit_interval)
                if invoice_date_calculation == 'end':
                    current_date -= timedelta(days=1)


@receiver(pre_save, sender=Contract)
def handle_contract_update(sender, instance, **kwargs):
    if getattr(instance, "skip_update", False):
        return

    if not instance.pk:
        return  # Skip creation

    try:
        original = Contract.objects.get(pk=instance.pk)

        # Set custom flags on instance to detect changes
        instance._recalculate_invoices = any([
            instance.contract_price_value != original.contract_price_value,
            instance.is_taxed != original.is_taxed,
            instance.tax_percentage != original.tax_percentage,
            instance.invoice_frequency != original.invoice_frequency,
            instance.start_date != original.start_date,
            instance.end_date != original.end_date,
        ])

        instance._recalculate_visits = any([
            instance.maintenance_frequency != original.maintenance_frequency,
            instance.start_date != original.start_date,
            instance.end_date != original.end_date,
        ])

    except Contract.DoesNotExist:
        # No previous data
        instance._recalculate_invoices = False
        instance._recalculate_visits = False

@receiver(post_save, sender=Contract)
def perform_contract_update(sender, instance, created, **kwargs):
    if created:
        return  # Already handled by your `generate_*` signals

    if getattr(instance, "_recalculate_invoices", False):
        recalculate_invoices(instance)

    if getattr(instance, "_recalculate_visits", False):
        recalculate_maintenance_schedule(instance)

def recalculate_invoices(contract):
    # Remove all unpaid invoices
    InvoiceSchedule.objects.filter(contract=contract, is_paid=False).delete()

    # Re-generate invoices using the same logic as `generate_invoice_schedule`
    start_date = contract.start_date
    end_date = contract.end_date
    invoice_frequency = contract.invoice_frequency
    invoice_date_calculation = contract.invoice_date_calculation
    contract_price_value = contract.contract_price_value
    is_taxed = contract.is_taxed
    tax_percentage = contract.tax_percentage

    # Map invoice frequency to intervals
    frequency_map = {
        "Every Month": 1,
        "Every 2 Months": 2,
        "Every 3 Months": 3,
        "Every 4 Months": 4,
        "Every 6 Months": 6,
    }
    visit_interval = frequency_map.get(invoice_frequency, 1)
    total_invoices = ((end_date.year - start_date.year) * 12 + end_date.month - start_date.month) // visit_interval + 1

    sub_companies = contract.company.sub_companies.all()
    sites = Site.objects.filter(company=contract.company)

    if sub_companies.exists():
        # Calculate the total number of sites across all sub-companies
        total_sites = sites.count()
        current_date = start_date if invoice_date_calculation == 'start' else start_date + relativedelta(months=visit_interval) - timedelta(days=1)

        while current_date <= end_date:
            for sub_company in sub_companies:
                sub_company_sites = sites.filter(sub_company=sub_company).count()
                sub_company_amount = (contract_price_value / total_sites) * sub_company_sites
                invoice_amount_with_tax = sub_company_amount * (1 + (tax_percentage / 100)) if is_taxed else sub_company_amount

                InvoiceSchedule.objects.create(
                    contract=contract,
                    company=contract.company,
                    sub_company=sub_company,
                    invoice_date=current_date,
                    amount=round(invoice_amount_with_tax / total_invoices, 2),
                )
            current_date += relativedelta(months=visit_interval)
            if invoice_date_calculation == 'end':
                current_date -= timedelta(days=1)
    else:
        # No sub-companies: Regular invoice generation
        current_date = start_date if invoice_date_calculation == 'start' else start_date + relativedelta(months=visit_interval) - timedelta(days=1)
        invoice_amount_per_invoice = contract_price_value / total_invoices
        invoice_amount_with_tax = invoice_amount_per_invoice * (1 + (tax_percentage / 100)) if is_taxed else invoice_amount_per_invoice

        while current_date <= end_date:
            InvoiceSchedule.objects.create(
                contract=contract,
                company=contract.company,
                invoice_date=current_date,
                amount=round(invoice_amount_with_tax, 2),
            )
            current_date += relativedelta(months=visit_interval)
            if invoice_date_calculation == 'end':
                current_date -= timedelta(days=1)

def recalculate_maintenance_schedule(contract):
    MaintenanceSchedule.objects.filter(contract=contract, done=False).delete()

    start_date = contract.start_date
    end_date = contract.end_date

    maintenance_mapping = {
        "Every Week": timedelta(weeks=1),
        "Every 2 Weeks": timedelta(weeks=2),
        "Every Month": relativedelta(months=1),
        "Every 2 Months": relativedelta(months=2),
        "Every 3 Months": relativedelta(months=3),
        "Every 4 Months": relativedelta(months=4),
        "Every 6 Months": relativedelta(months=6),
    }

    visit_interval = maintenance_mapping.get(contract.maintenance_frequency, relativedelta(months=1))
    current_date = start_date
    next_date = start_date + visit_interval

    sites = Site.objects.filter(company=contract.company)

    while current_date < end_date:
        for site in sites:
            MaintenanceSchedule.objects.create(
                contract=contract,
                site=site,
                visit_date=current_date,
                due_date=min(next_date, end_date)
            )
        current_date = next_date
        next_date = current_date + visit_interval


@receiver(post_save, sender=Site)
def generate_maintenance_for_new_site(sender, instance, created, **kwargs):
    if created and instance.company:  # Ensure the site is new and belongs to a company
        contracts = Contract.objects.filter(company=instance.company)
        for contract in contracts:
            start_date = max(contract.start_date, datetime.date.today())  # Avoid creating schedules in the past
            end_date = contract.end_date

            maintenance_mapping = {
                "Every Week": timedelta(weeks=1),
                "Every 2 Weeks": timedelta(weeks=2),
                "Every Month": relativedelta(months=1),
                "Every 2 Months": relativedelta(months=2),
                "Every 3 Months": relativedelta(months=3),
                "Every 4 Months": relativedelta(months=4),
                "Every 6 Months": relativedelta(months=6),
            }

            visit_interval = maintenance_mapping.get(contract.maintenance_frequency, relativedelta(months=1))
            current_date = start_date
            next_date = start_date + visit_interval

            while current_date < end_date:  # Generate schedules only within the contract's period
                MaintenanceSchedule.objects.create(
                    contract=contract,
                    site=instance,
                    visit_date=current_date,
                    due_date=min(next_date, end_date)
                )
                current_date = next_date
                next_date = current_date + visit_interval
                
            # Update invoices when a new site is added
            update_invoices_on_new_site(contract, instance)
            
def update_invoices_on_new_site(contract, new_site):
    """
    Updates the invoice amounts for the sub-company related to the newly added site.
    Also, updates the contract value to include the new site's contribution.
    """
    # Determine the invoice frequency and total invoices per year
    frequency_map = {
        "Every Month": 12,
        "Every 2 Months": 6,
        "Every 3 Months": 4,
        "Every 4 Months": 3,
        "Every 6 Months": 2,
    }
    total_invoices_per_year = frequency_map.get(contract.invoice_frequency)

    # Filter sites excluding the new site
    sites = Site.objects.filter(company=contract.company).exclude(id=new_site.id)

    # Calculate the total number of sites excluding the new site
    total_sites = sites.count()
    if total_sites == 0:
        raise ValueError("No existing sites to calculate the site value.")

    # Calculate the site value (contract value divided by the total sites before the new site)
    site_value = contract.contract_price_value / total_sites

    # Adjust for the sub-company related to the new site
    related_sub_company = new_site.sub_company

    if related_sub_company:
        # Get the number of sites for the sub-company before the new site
        sub_company_sites = sites.filter(sub_company=related_sub_company).count()

        # Calculate the additional value for the new site
        new_site_value = site_value

        # Update invoices for the related sub-company
        invoices = InvoiceSchedule.objects.filter(contract=contract, sub_company=related_sub_company, is_paid=False)
        for invoice in invoices:
            # Add the new site's contribution to the invoice amount
            invoice.amount += round(new_site_value / total_invoices_per_year, 2)
            invoice.save()

        # Update the contract value to include the new site's contribution
        contract.skip_update = True  # Set flag to skip pre_save logic
        contract.contract_price_value += new_site_value
        contract.save()
        contract.skip_update = False  # Reset the flag

    else:
        # Handle parent company level if no sub-companies exist
        total_sites = sites.count()
        new_site_value = site_value

        # Update existing invoices
        invoices = InvoiceSchedule.objects.filter(contract=contract, company=contract.company, is_paid=False)
        for invoice in invoices:
            # Add the new site's contribution to the invoice amount
            invoice.amount += round(new_site_value / total_invoices_per_year, 2)
            invoice.save()

        # Update the contract value to include the new site's contribution
        contract.skip_update = True  # Set flag to skip pre_save logic
        contract.contract_price_value += new_site_value
        contract.save()
        contract.skip_update = False  # Reset the flag
