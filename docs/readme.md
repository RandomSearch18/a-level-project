# Pedestrian routing using open map data

A-level Computer Science programming project

## Problem definition

A routing engine is a piece of software that calculates a route between two points in the world, following a pre-defined network of paths or roads. Routing engines first became commonly used with satnavs that provide live directions for driving. Nowadays, mobile apps perform the same task, and can be used for driving as well as walking or cycling.

Modern routing engines use geographic data of roads to 
<!-- TODO -->

## Justification of computational approach

### Initial situation

The routing engine is provided with coordinates for a starting point, and coordinates for the ending point. The initial situation for the program will be a graph that represents the map data for the area that will be covered by the routing engine.

### Clear goal

Its goal is to provide the user with a safe and efficient route to get from the start point to the end point, on foot.

### Clear inputs and outputs

Its outputs would be a list of directions that the user can follow to navigate from the start to the end.

### Clearly defined logic

It will use this graph to find the optimal route between the two points using a pathfinding algorithm such as A*.
