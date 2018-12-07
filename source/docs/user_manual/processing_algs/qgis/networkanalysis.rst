.. only:: html

   |updatedisclaimer|

Network analysis
================

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgisserviceareafromlayer:

Service area (from layer)
-------------------------
Returns all the substrings of streets on a network that can be reached within a distance or
a time starting from any point of a layer. This allows evaluation of accessibility within
a network, eg what are the places I can navigate to on a road network without spending
cost greater than a given value (the cost can be distance or time).

Parameters
..........

``Vector layer representing the network`` [vector: line]
  Line vector layer representing the network to be covered.

``Vector layer with start points`` [vector: point]
  Point vector layer whose features are used as start points to generate the service areas.

``Path type to calculate`` [enumeration]
  <put parameter description here>
  
  Options are:
  
  * 0 --- Shortest
  * 1 --- Fastest
  
  Default: *0*

``Travel cost`` [number]
  The value is estimated as a distance (in the project map units) when looking for the *Shortest*
  path and as time (in hours) for the *Fastest* path.

  Default: *0.0*

``Advanced parameters``
  ``Direction field`` [tablefield: string]
    Optional
    
    The field used to specify directions for the network edges.  The values used in this field are specified with the three parameters
    ``Value for forward direction``, ``Value for backward direction`` and ``Value for both directions``.

    Forward and reverse directions correspond to a one-way road, both directions indicate a two-way road.
    If some features don’t have any value set, the default direction setting is applied.

  ``Value for forward direction`` [string]
    Optional

    Value set in the direction field to identify edges with a forward direction.

  ``Value for backward direction`` [string]
    Optional

    Value set in the direction field to identify edges with a backward direction.

  ``Value for both directions`` [string]
    Optional

    Value set in the direction field to identify bidirectional edges.

  ``Default direction`` [enumeration]
    If a feature has no value set in the direction field or if no direction field is set,
    then this direction value is used.

    Available options are:

    * 0 --- Forward direction
    * 1 --- Backward direction
    * 2 --- Both directions

    Default: *2*

  ``Speed field`` [tablefield: string]
    Optional

    Field providing the speed value for the edges of the network when looking for the fastest path.
    If not available, a default speed value is used.

  ``Default speed`` [number]
    Value to use to calculate the travel time if no speed field is provided for an edge.

    Default: *5.0*

  ``Topology tolerance`` [number]
    Two lines with nodes closer than the specified tolerance are considered connected.

    Default: *0.0*

  ``Include upper/lower bound points`` [boolean]
    Creates a point layer output with two points for each edge at the boundaries of the
    service area.
    One point is the start of that edge, the other is the end.

    Default: *False*

Outputs
.......

``Service area (lines)`` [vector: line]
  Line layer representing the parts of the network that can be serviced by the input points.

``Service area (boundary nodes)`` [vector: point]
  Point layer representing the furthest points on the network from the start points,
  for the given cost.
 

.. _qgisserviceareafrompoint:

Service area (from point)
-------------------------
Starting from a point, returns all the substrings of lines on a network that can be
reached within a given distance or time. This allows the evaluation of accessibility within
a network, eg what are the places I can navigate to on a road network without spending
a cost greater than a given value (the cost can be distance or time).

Parameters
..........

``Start point (x, y)`` [coordinates]
  Coordinate of the point to calculate the service area around.

Outputs
.......

``Service area (lines)`` [vector: line]
  Line layer representing the part of the network that can be serviced by the start point.

``Service area (boundary nodes)`` [vector: point]
  Point layer representing the furthest points on the network from the start point,
  for the given cost.


.. _qgisshortestpathlayertopoint:

Shortest path (layer to point)
------------------------------
Computes the optimal (shortest or fastest) routes from multiple start points defined
by a vector layer and a given end point.

Parameters
..........

``Vector layer representing the network`` [vector: line]
  <put parameter description here>

``Path type to calculate`` [enumeration]
  <put parameter description here>

``Vector layer with start points`` [vector: point]
  <put parameter description here>

``End point (x, y)`` [coordinates]
  <put parameter description here>

Outputs
.......

``Shortest path`` [vector: line]
  Line layer of the shortest or fastest path from each of the start points to the end point.


.. _qgisshortestpathpointtolayer:

Shortest path (point to layer)
------------------------------
Computes optimal (shortest or fastest) route between a given start point and multiple
end points defined by a point vector layer.

Parameters
..........

``Start point (x, y)`` [coordinates]
  <put parameter description here>

``Vector layer with end points`` [vector: point]
  <put parameter description here>

Outputs
.......

``Shortest path`` [vector: line]
  Line layer of the shortest or fastest path from the start point to each of the end points.


.. _qgisshortestpathpointtopoint:

Shortest path (point to point)
------------------------------
Computes the optimal (shortest or fastest) route between a given start point and a given end point.

Parameters
..........

``Start point (x, y)`` [coordinates]
  <put parameter description here>

``End point (x, y)`` [coordinates]
  <put parameter description here>

Outputs
.......

``Shortest path`` [vector: line]
  Line layer of the shortest or fastest path from the start point to the end point.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
