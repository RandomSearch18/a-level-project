# Pedestrian routing using open map data

A-level Computer Science programming project

## Problem definition

Modern routing engines use geographic data of roads to 
<!-- TODO -->

## Justification of computational approach

The routing engine is provided with coordinates for a starting point, and coordinates for the ending point. Its goal is to provide the user with a safe and efficient route to get from the start point to the end point, on foot. Its outputs would be a list of directions that the user can follow to navigate from the start to the end.

The initial situation for the program will be a graph that represents the map data for the area that will be covered by the routing engine. It will use this graph to find the optimal route between the two points using a pathfinding algorithm such as A*.
