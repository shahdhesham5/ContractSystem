from django.core.management.base import BaseCommand
from django.utils import timezone
from datetime import timedelta

from contracts.models import MaintenanceSchedule, Vehicles
from Clients.models import Site
from contracts.utility import create_distance_matrix, solve_vrp, parse_location_url


class Command(BaseCommand):
    help = 'Schedules maintenance visits using vehicle routing optimization'

    def handle(self, *args, **kwargs):
        # Get current vehicles and their settings
        vehicle_info = Vehicles.objects.first()
        
        if not vehicle_info or not vehicle_info.depot:
            self.stdout.write(self.style.ERROR('Depot location is not set in Vehicles model.'))
            return
        
        self.stdout.write(f"Debug: Number of vehicles: {vehicle_info.num_vehicles}, Vehicle capacity: {vehicle_info.vehicle_capacity}")

        # Parse depot coordinates from the depot URL
        depot_coords = parse_location_url(vehicle_info.depot)
        if depot_coords is None:
            self.stdout.write(self.style.ERROR('Invalid depot URL format.'))
            return
        depot_lat, depot_lng = depot_coords

        # Retrieve pending schedules for the current month
        current_month = timezone.now().month
        current_year = timezone.now().year
        pending_schedules = MaintenanceSchedule.objects.filter(done=False, visit_date__month=current_month, visit_date__year=current_year).select_related('site')

        if not pending_schedules.exists():
            self.stdout.write(self.style.WARNING('No pending schedules for the current month.'))
            return

        self.stdout.write(f"Debug: Generated clients: {pending_schedules}")
        # Client locations (sites needing maintenance)
        clients = []
        for schedule in pending_schedules:
            site_coords = parse_location_url(schedule.site.location_url)  # Replace location_url with the actual field name
            if site_coords:
                clients.append(site_coords)
            else:
                self.stdout.write(self.style.WARNING(f"Invalid location URL for site {schedule.site}. Skipping..."))
        
        # Create distance matrix and solve VRP
        distance_matrix = create_distance_matrix((depot_lat, depot_lng), clients)
        routes = solve_vrp(distance_matrix, num_vehicles=vehicle_info.num_vehicles, max_deliveries=vehicle_info.vehicle_capacity)

        if not routes:
            self.stdout.write(self.style.WARNING("No routes found or an unexpected format."))
            return  # Stop execution if no routes are generated

        # Debug print the routes
        self.stdout.write(f"Debug: Generated routes: {routes}")
        
        # Remove depot (index 0) from each route to display only the client stops
        filtered_routes = [[stop for stop in route if stop != 0] for route in routes]
        self.stdout.write(f"Debug: Generated filtered routes: {filtered_routes}")

        # Use the first available working day in the current month for scheduling
        current_date = timezone.now().replace(day=1)
        while current_date.weekday() in (4, 5):  # Move to the first working day (Sunday to Thursday)
            current_date += timedelta(days=1)
        
        # Output routes for each vehicle on the designated day
        self.stdout.write(f"\nSchedule for {current_date.strftime('%A, %B %d')}:")
        for vehicle_id, route in enumerate(filtered_routes[:vehicle_info.num_vehicles]):
            if not route:  # Skip vehicles with no assigned clients
                self.stdout.write(f"  Vehicle {vehicle_id + 1}: No scheduled stops.")
                continue

            self.stdout.write(f"  Vehicle {vehicle_id + 1} route: {route}")

            # Display the actual route details
            for stop in route:
                if 1 <= stop <= len(pending_schedules):
                    site = pending_schedules[stop - 1].site  # Access the site object, adjusting index
                    self.stdout.write(f"    Stop at {site.site_name} ({site.location_url})")
                else:
                    self.stdout.write(f"    Invalid stop index: {stop}")


