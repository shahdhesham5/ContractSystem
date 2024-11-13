from ortools.constraint_solver import routing_enums_pb2
from ortools.constraint_solver import pywrapcp
import numpy as np
from geopy.distance import geodesic
import datetime

# Coordinates for depot and clients (example data)
depot = (25.276987, 55.296249)  # Example: Dubai
clients = [(25.197525 + i*0.001, 55.274288 + i*0.001) for i in range(80)]  # 80 generated locations

num_vehicles = 5  # Adjusted number of vehicles
max_deliveries = 10  # Each vehicle can make 10 deliveries per day

# Define a subset of client indices as the designated end locations
valid_end_locations = [10, 20, 30, 40, 50]  # Example indices for designated end points

def create_distance_matrix(depot, clients):
    """Creates a distance matrix using geodesic distance (GPS coordinates)"""
    locations = [depot] + clients
    num_locations = len(locations)
    distance_matrix = np.zeros((num_locations, num_locations))

    for i in range(num_locations):
        for j in range(num_locations):
            if i != j:
                distance_matrix[i][j] = geodesic(locations[i], locations[j]).km
            else:
                distance_matrix[i][j] = 0  # No distance to itself
    return distance_matrix

distance_matrix = create_distance_matrix(depot, clients)

def create_data_model(start_location):
    """Stores the data for the problem with custom starting points."""
    data = {}
    data['distance_matrix'] = distance_matrix
    data['num_vehicles'] = num_vehicles
    data['depot'] = start_location  # Start from a specified starting point
    return data

def main():
    """Solving the vehicle routing problem with restricted end locations."""
    global last_stops
    
    current_day = datetime.date.today()
    visit_days = 0  # Counter for client visits

    while visit_days < len(clients) / max_deliveries:
        # Assign the last stop as the new start for each vehicle
        for vehicle_id in range(num_vehicles):
            data = create_data_model(last_stops[vehicle_id])

            # Create the routing index manager.
            manager = pywrapcp.RoutingIndexManager(len(data['distance_matrix']),
                                                   data['num_vehicles'], data['depot'])

            # Create Routing Model.
            routing = pywrapcp.RoutingModel(manager)

            def distance_callback(from_index, to_index):
                """Returns the distance between the two nodes."""
                from_node = manager.IndexToNode(from_index)
                to_node = manager.IndexToNode(to_index)
                return int(data['distance_matrix'][from_node][to_node] * 1000)

            transit_callback_index = routing.RegisterTransitCallback(distance_callback)

            # Define cost of each arc (distance cost).
            routing.SetArcCostEvaluatorOfAllVehicles(transit_callback_index)

            # Add Capacity constraints for the number of deliveries
            demand = [0] + [1] * len(clients)  # Depot has no demand, each client has 1 delivery

            def demand_callback(from_index):
                """Returns the demand of each node."""
                from_node = manager.IndexToNode(from_index)
                return demand[from_node]

            demand_callback_index = routing.RegisterUnaryTransitCallback(demand_callback)

            vehicle_capacity = max_deliveries
            routing.AddDimensionWithVehicleCapacity(
                demand_callback_index,
                0,  # No slack (fixed number of deliveries)
                [vehicle_capacity] * data['num_vehicles'],
                True,  # Start cumul at zero
                'Capacity')

            # Restrict each vehicle to end only at designated end locations
            end_indices = [manager.NodeToIndex(location) for location in valid_end_locations]
            for vehicle_id in range(num_vehicles):
                routing.AddDisjunction(end_indices, 10000)  # Allows the route to end only at designated locations

            # Setting first solution heuristic
            search_parameters = pywrapcp.DefaultRoutingSearchParameters()
            search_parameters.first_solution_strategy = (
                routing_enums_pb2.FirstSolutionStrategy.PATH_CHEAPEST_ARC)

            # Solve the problem
            solution = routing.SolveWithParameters(search_parameters)

            # Print and save last stop if solution found
            if solution:
                last_stops[vehicle_id] = print_solution(manager, routing, solution, current_day, vehicle_id)
        
        # Schedule the next day's delivery, skipping Fridays and Saturdays
        current_day += datetime.timedelta(days=1)
        while current_day.weekday() >= 5:  # Friday=4, Saturday=5
            current_day += datetime.timedelta(days=1)
        
        visit_days += 1

def print_solution(manager, routing, solution, current_day, vehicle_id):
    """Prints solution on console and returns the last stop for each route."""
    print(f"Route for vehicle {vehicle_id} on {current_day}:\n")
    index = routing.Start(vehicle_id)
    route_distance = 0
    last_stop = 0
    
    while not routing.IsEnd(index):
        node_index = manager.IndexToNode(index)
        next_index = solution.Value(routing.NextVar(index))
        route_distance += routing.GetArcCostForVehicle(index, next_index, vehicle_id)
        print(f' {node_index} -> ', end='')
        last_stop = node_index  # Update the last stop for this vehicle
        index = next_index
    
    print(f'{last_stop}\n')
    print(f'Distance of the route: {route_distance / 1000} km\n')
    return last_stop  # Return last node as the starting point for the next day

if __name__ == '__main__':
    main()