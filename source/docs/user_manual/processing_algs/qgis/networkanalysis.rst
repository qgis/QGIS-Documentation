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
Returns all the edges or parts of edges of a network that can be reached within a distance
or a time, starting from a point layer. This allows evaluation of accessibility within
a network, eg what are the places I can navigate to on a road network without spending
cost greater than a given value (the cost can be distance or time).

Parameters
..........

``Vector layer representing the network`` [vector: line]
  Line vector layer representing the network to be covered.

``Vector layer with start points`` [vector: point]
  Point vector layer whose features are used as start points to generate the service areas.

``Path type to calculate`` [enumeration]
  The type of path to calculate.

  Options are:

  * 0 --- Shortest
  * 1 --- Fastest

  Default: *0*

``Travel cost`` [number]
  The value is estimated as a distance (in the network layer units) when looking for
  the *Shortest* path and as time (in seconds) for the *Fastest* path.

  Default: *0.0*

``Advanced parameters``
  .. include:: qgis_algs_include.rst
     :start-after: **network_advanced_parameters**
     :end-before: **end_network_advanced_parameters**

  ``Include upper/lower bound points`` [boolean]
    Creates a point layer output with two points for each edge at the boundaries of the
    service area.
    One point is the start of that edge, the other is the end.

    Default: *False*

Outputs
.......

``Service area (lines)`` [vector: line]
  Line layer representing the parts of the network that can be serviced by the start points.

``Service area (boundary nodes)`` [vector: point]
  Point layer representing the furthest points on the network from the start points,
  for the given cost.


.. _qgisserviceareafrompoint:

Service area (from point)
-------------------------
Returns all the edges or parts of edges of a network that can be reached within a given distance
or time, starting from a point feature. This allows the evaluation of accessibility within
a network, eg what are the places I can navigate to on a road network without spending
a cost greater than a given value (the cost can be distance or time).

Parameters
..........

``Vector layer representing the network`` [vector: line]
  Line vector layer representing the network to be covered.

``Start point (x, y)`` [coordinates]
  Coordinate of the point to calculate the service area around.

``Path type to calculate`` [enumeration]
  The type of path to calculate.

  Options are:

  * 0 --- Shortest
  * 1 --- Fastest

  Default: *0*

``Travel cost`` [number]
  The value is estimated as a distance (in the network layer units) when looking for
  the *Shortest* path and as time (in seconds) for the *Fastest* path.

  Default: *0.0*

``Advanced parameters``
  .. include:: qgis_algs_include.rst
     :start-after: **network_advanced_parameters**
     :end-before: **end_network_advanced_parameters**

  ``Include upper/lower bound points`` [boolean]
    Creates a point layer output with two points for each edge at the boundaries of the
    service area.
    One point is the start of that edge, the other is the end.

    Default: *False*

Outputs
.......

``Service area (lines)`` [vector: line]
  Line layer representing the parts of the network that can be serviced by the start point.

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
  Line vector layer representing the network to be covered.

``Path type to calculate`` [enumeration]
  The type of path to calculate.

  Options are:

  * 0 --- Shortest
  * 1 --- Fastest

  Default: *0*

``Vector layer with start points`` [vector: point]
  Point vector layer whose features are used as start points of the routes.

``End point (x, y)`` [coordinates]
  Point feature representing the end point of the routes.

``Advanced parameters``
  .. include:: qgis_algs_include.rst
     :start-after: **network_advanced_parameters**
     :end-before: **end_network_advanced_parameters**

Outputs
.......

``Shortest path`` [vector: line]
  Line layer of the shortest or fastest path from each of the start points to the end point.


.. _qgisshortestpathpointtolayer:

Shortest path (point to layer)
------------------------------
Computes the optimal (shortest or fastest) routes between a given start point and multiple
end points defined by a point vector layer.

Parameters
..........

``Vector layer representing the network`` [vector: line]
  Line vector layer representing the network to be covered.

``Path type to calculate`` [enumeration]
  The type of path to calculate.

  Options are:

  * 0 --- Shortest
  * 1 --- Fastest

  Default: *0*

``Start point (x, y)`` [coordinates]
  Point feature representing the start point of the routes.

``Vector layer with end points`` [vector: point]
  Point vector layer whose features are used as end points of the routes.

``Advanced parameters``
  .. include:: qgis_algs_include.rst
     :start-after: **network_advanced_parameters**
     :end-before: **end_network_advanced_parameters**

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

``Vector layer representing the network`` [vector: line]
  Line vector layer representing the network to be covered.

``Path type to calculate`` [enumeration]
  The type of path to calculate.

  Options are:

  * 0 --- Shortest
  * 1 --- Fastest

  Default: *0*

``Start point (x, y)`` [coordinates]
  Point feature representing the start point of the route.

``End point (x, y)`` [coordinates]
  Point feature representing the end point of the route.

``Advanced parameters``
  .. include:: qgis_algs_include.rst
     :start-after: **network_advanced_parameters**
     :end-before: **end_network_advanced_parameters**

Outputs
.......

``Shortest path`` [vector: line]
  Line layer of the shortest or fastest path from the start point to the end point.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
