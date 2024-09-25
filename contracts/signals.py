from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Contract, MaintenanceSchedule
from Clients.models import Site
from dateutil.relativedelta import relativedelta

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
