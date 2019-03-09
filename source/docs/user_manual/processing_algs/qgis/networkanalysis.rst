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
  The value is estimated as a distance (in the project map units) when looking for
  the *Shortest* path and as time (in hours) for the *Fastest* path.

  Default: *0.0*

``Advanced parameters``
  ``Direction field`` [tablefield: string]
    Optional

    The field used to specify directions for the network edges.

    The values used in this field are specified with the three parameters ``Value for
    forward direction``, ``Value for backward direction`` and ``Value for both directions``.
    Forward and reverse directions correspond to a one-way edge, "both directions"
    indicates a two-way edge.

    If a feature does not have a value in this field, or no field is set then the
    default direction setting (provided with the ``Default direction`` parameter)
    is used.

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

    Field providing the speed value (in ``km/h``) for the edges of the network when
    looking for the fastest path.

    If a feature does not have a value in this field, or no field is set then the
    default speed value (provided with the ``Default speed`` parameter) is used.

  ``Default speed (km/h)`` [number]
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
  The value is estimated as a distance (in the project map units) when looking for
  the *Shortest* path and as time (in hours) for the *Fastest* path.

  Default: *0.0*

``Advanced parameters``
  ``Direction field`` [tablefield: string]
    Optional

    The field used to specify directions for the network edges.

    The values used in this field are specified with the three parameters ``Value for
    forward direction``, ``Value for backward direction`` and ``Value for both directions``.
    Forward and reverse directions correspond to a one-way edge, "both directions"
    indicates a two-way edge.

    If a feature does not have a value in this field, or no field is set then the
    default direction setting (provided with the ``Default direction`` parameter)
    is used.

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

    Field providing the speed value (in ``km/h``) for the edges of the network
    when looking for the fastest path.

    If a feature does not have a value in this field, or no field is set then the
    default speed value (provided with the ``Default speed`` parameter) is used.

  ``Default speed (km/h)`` [number]
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
  ``Direction field`` [tablefield: string]
    Optional

    The field used to specify directions for the network edges.

    The values used in this field are specified with the three parameters ``Value for
    forward direction``, ``Value for backward direction`` and ``Value for both directions``.
    Forward and reverse directions correspond to a one-way edge, "both directions"
    indicates a two-way edge.

    If a feature does not have a value in this field, or no field is set then the
    default direction setting (provided with the ``Default direction`` parameter)
    is used.

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

    Field providing the speed value (in ``km/h``) for the edges of the network
    when looking for the fastest path.

    If a feature does not have a value in this field, or no field is set then the
    default speed value (provided with the ``Default speed`` parameter) is used.

  ``Default speed (km/h)`` [number]
    Value to use to calculate the travel time if no speed field is provided for an edge.

    Default: *50.0*

  ``Topology tolerance`` [number]
    Two lines with nodes closer than the specified tolerance are considered connected.

    Default: *0.0*

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
  ``Direction field`` [tablefield: string]
    Optional

    The field used to specify directions for the network edges.

    The values used in this field are specified with the three parameters ``Value for
    forward direction``, ``Value for backward direction`` and ``Value for both directions``.
    Forward and reverse directions correspond to a one-way edge, "both directions"
    indicates a two-way edge.

    If a feature does not have a value in this field, or no field is set then the
    default direction setting (provided with the ``Default direction`` parameter)
    is used.

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

    Field providing the speed value (in ``km/h``) for the edges of the network
    when looking for the fastest path.

    If a feature does not have a value in this field, or no field is set then the
    default speed value (provided with the ``Default speed`` parameter) is used.

  ``Default speed (km/h)`` [number]
    Value to use to calculate the travel time if no speed field is provided for an edge.

    Default: *50.0*

  ``Topology tolerance`` [number]
    Two lines with nodes closer than the specified tolerance are considered connected.

    Default: *0.0*

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
  ``Direction field`` [tablefield: string]
    Optional

    The field used to specify directions for the network edges.

    The values used in this field are specified with the three parameters ``Value for
    forward direction``, ``Value for backward direction`` and ``Value for both directions``.
    Forward and reverse directions correspond to a one-way edge, "both directions"
    indicates a two-way edge.

    If a feature does not have a value in this field, or no field is set then the
    default direction setting (provided with the ``Default direction`` parameter)
    is used.

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

    Field providing the speed value (in ``km/h``) for the edges of the network
    when looking for the fastest path.

    If a feature does not have a value in this field, or no field is set then the
    default speed value (provided with the ``Default speed`` parameter) is used.

  ``Default speed (km/h)`` [number]
    Value to use to calculate the travel time if no speed field is provided for an edge.

    Default: *50.0*

  ``Topology tolerance`` [number]
    Two lines with nodes closer than the specified tolerance are considered connected.

    Default: *0.0*

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
