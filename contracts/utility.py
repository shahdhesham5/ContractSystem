import numpy as np
from geopy.distance import geodesic
from ortools.constraint_solver import pywrapcp, routing_enums_pb2
from urllib.parse import urlparse, parse_qs

def parse_location_url(url):
    """Parses latitude and longitude from a location URL."""
    try:
        query_params = parse_qs(urlparse(url).query)
        lat, lng = query_params['ll'][0].split(',')
        return float(lat), float(lng)
    except (KeyError, ValueError, IndexError):
        return None


def create_distance_matrix(depot, clients):
    """Creates a distance matrix using geodesic distances."""
    locations = [depot] + clients
    num_locations = len(locations)
    distance_matrix = np.zeros((num_locations, num_locations))

    for i in range(num_locations):
        for j in range(num_locations):
            if i != j:
                distance_matrix[i][j] = geodesic(locations[i], locations[j]).km
    return distance_matrix

def solve_vrp(distance_matrix, num_vehicles, depot=0, max_deliveries=10):
    """Solves the VRP problem using OR-Tools."""
    data = {
        'distance_matrix': distance_matrix,
        'num_vehicles': num_vehicles,
        'depot': depot,
    }

    # Create the routing index manager.
    manager = pywrapcp.RoutingIndexManager(len(data['distance_matrix']), num_vehicles, depot)

    # Create Routing Model.
    routing = pywrapcp.RoutingModel(manager)

    def distance_callback(from_index, to_index):
        """Returns the distance between the two nodes."""
        from_node = manager.IndexToNode(from_index)
        to_node = manager.IndexToNode(to_index)
        return int(data['distance_matrix'][from_node][to_node] * 1000)

    transit_callback_index = routing.RegisterTransitCallback(distance_callback)
    routing.SetArcCostEvaluatorOfAllVehicles(transit_callback_index)

    # Add capacity constraints for deliveries
    demand = [0] + [1] * (len(data['distance_matrix']) - 1)  # Depot has 0 demand

    demand_callback_index = routing.RegisterUnaryTransitCallback(lambda idx: demand[manager.IndexToNode(idx)])
    routing.AddDimensionWithVehicleCapacity(demand_callback_index, 0, [max_deliveries] * num_vehicles, True, 'Capacity')

    # Solve
    search_parameters = pywrapcp.DefaultRoutingSearchParameters()
    search_parameters.first_solution_strategy = routing_enums_pb2.FirstSolutionStrategy.PATH_CHEAPEST_ARC
    solution = routing.SolveWithParameters(search_parameters)


    if solution:
        routes = []
        for vehicle_id in range(num_vehicles):
            route = []
            index = routing.Start(vehicle_id)
            while not routing.IsEnd(index):
                node_index = manager.IndexToNode(index)
                route.append(node_index)
                index = solution.Value(routing.NextVar(index))
            print(f"Debug: Vehicle {vehicle_id + 1} route: {route}")  # Debug print
            routes.append(route)
        # print("Debug: routes generated in solve_vrp:", routes)  # Debug statement
        return routes
    print("Debug: No solution found in solve_vrp")
    return None
