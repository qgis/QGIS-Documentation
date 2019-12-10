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
.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Vector layer representing network**
     - ``INPUT``
     - [vector: line]
     - Line vector layer representing the network to be covered
   * - **Vector layer with start points**
     - ``START_POINT``
     - [vector: point]
     - Point vector layer whose features are used as start points
       to generate the service areas
   * - **Path type to calculate**
     - ``STRATEGY``
     - [enumeration]

       Default: 0
     - The type of path to calculate. One of:

       * 0 --- Shortest
       * 1 --- Fastest

   * - **Travel cost (distance for "Shortest", time for "Fastest"**
     - ``TRAVEL_COST``
     - [number]

       Default: *0.0*
     - The value is estimated as a distance (in the network
       layer units) when looking for the *Shortest* path and
       as time (in seconds) for the *Fastest* path.
   * - **Direction field**

       Optional
     - ``DIRECTION_FIELD``
     - [tablefield: string]

       Default: *0.0*
     - The field used to specify directions for the network edges.
       
       The values used in this field are specified with the three
       parameters ``Value for forward direction``,
       ``Value for backward direction`` and
       ``Value for both directions``.
       Forward and reverse directions correspond to a one-way edge,
       "both directions" indicates a two-way edge.
       If a feature does not have a value in this field, or no field
       is set then the   default direction setting (provided with
       the ``Default direction`` parameter) is used.
   * - **Value for forward direction**

       Optional
     - ``VALUE_FORWARD``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify edges with a
       forward direction
   * - **Value for backward direction**

       Optional
     - ``VALUE_BACKWARD``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify edges with a
       backward direction
   * - **Value for both directions**

       Optional
     - ``VALUE_BOTH``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify
       bidirectional edges
   * - **Default direction**

       Optional
     - ``DEFAULT_DIRECTION``
     - [enumeration]

       Default: 2
     - If a feature has no value set in the direction field or
       if no direction field is set, then this direction value
       is used. One of:

       * 0 --- Forward direction
       * 1 --- Backward direction
       * 2 --- Both directions

   * - **Speed field**

       Optional
     - ``SPEED_FIELD``
     - [tablefield: string]
     - Field providing the speed value (in ``km/h``) for the
       edges of the network when looking for the fastest path.
       
       If a feature does not have a value in this field, or
       no field is set then the default speed value (provided
       with the ``Default speed`` parameter) is used.
   * - **Default speed (km/h)**

       Optional
     - ``DEFAULT_SPEED``
     - [number]

       Default: 50.0
     - Value to use to calculate the travel time if no speed
       field is provided for an edge
   * - **Topology tolerance**

       Optional
     - ``TOLERANCE``
     - [number]

       Default: 0.0
     - Two lines with nodes closer than the specified
       tolerance are considered connected
   * - **Include upper/lower bound points**
     - ``INCLUDE_BOUNDS``
     - [boolean]

       Default: False
     - Creates a point layer output with two points for each
       edge at the boundaries of the service area.
       One point is the start of that edge, the other is the end.
   * - **Service area (lines)**
     - ``OUTPUT_LINES``
     - [vector: line]

       Default: ``[Create temporary layer]``
     - Specify the output line layer for the service area.
       One of:

       * Skip output
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table

       The file encoding can also be changed here.
   * - **Service area (boundary nodes)**
     - ``OUTPUT``
     - [vector: point]

       Default: ``[Skip output]``
     - Specify the output point layer for the service area
       boundary nodes. One of:

       * Skip output
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table

       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description

   * - **Service area (boundary nodes)**
     - ``OUTPUT``
     - [vector: point]
     - The output point layer with the service area boundary
       nodes.
       Can only be generated if
       :guilabel:`Include upper/lower bound points` is set /
       True.
       .. include:: qgis_algs_include.rst
          :start-after: **network_advanced_parameters**
          :end-before: **end_network_advanced_parameters**
         
   * - **Service area (lines)**
     - ``OUTPUT_LINES``
     - [vector: line]
     - Line layer representing the parts of the network
       that can be serviced by the start points, for the
       given cost.


.. _qgisserviceareafrompoint:

Service area (from point)
-------------------------
Returns all the edges or parts of edges of a network that can be reached within a given distance
or time, starting from a point feature. This allows the evaluation of accessibility within
a network, eg what are the places I can navigate to on a road network without spending
a cost greater than a given value (the cost can be distance or time).

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Vector layer representing the network**
     - ``INPUT``
     - [vector: line]
     - Line vector layer representing the network to be covered
   * - **Start point (x, y)**
     - ``START_POINTS``
     - [coordinates]
     - Coordinate of the point to calculate the service
       area around.
   * - **Path type to calculate**
     - ``STRATEGY``
     - [enumeration]

       Default: 0
     - The type of path to calculate. One of:

       * 0 --- Shortest
       * 1 --- Fastest

   * - **Travel cost**
     - ``TRAVEL_COST``
     - [number]

       Default: *0.0*
     - The value is estimated as a distance (in the network
       layer units) when looking for the *Shortest* path and
       as time (in seconds) for the *Fastest* path.
   * - **Direction field**

       Optional
     - ``DIRECTION_FIELD``
     - [tablefield: string]

       Default: *0.0*
     - The field used to specify directions for the network edges.
       
       The values used in this field are specified with the three
       parameters ``Value for forward direction``,
       ``Value for backward direction`` and
       ``Value for both directions``.
       Forward and reverse directions correspond to a one-way edge,
       "both directions" indicates a two-way edge.
       If a feature does not have a value in this field, or no field
       is set then the   default direction setting (provided with
       the ``Default direction`` parameter) is used.
   * - **Value for forward direction**

       Optional
     - ``VALUE_FORWARD``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify edges with a
       forward direction
   * - **Value for backward direction**

       Optional
     - ``VALUE_BACKWARD``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify edges with a
       backward direction
   * - **Value for both directions**

       Optional
     - ``VALUE_BOTH``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify
       bidirectional edges
   * - **Default direction**

       Optional
     - ``DEFAULT_DIRECTION``
     - [enumeration]

       Default: 2
     - If a feature has no value set in the direction field or
       if no direction field is set, then this direction value
       is used. One of:

       * 0 --- Forward direction
       * 1 --- Backward direction
       * 2 --- Both directions

   * - **Speed field**

       Optional
     - ``SPEED_FIELD``
     - [tablefield: string]
     - Field providing the speed value (in ``km/h``) for the
       edges of the network when looking for the fastest path.
       
       If a feature does not have a value in this field, or
       no field is set then the default speed value (provided
       with the ``Default speed`` parameter) is used.
   * - **Default speed (km/h)**

       Optional
     - ``DEFAULT_SPEED``
     - [number]

       Default: 50.0
     - Value to use to calculate the travel time if no speed
       field is provided for an edge
   * - **Topology tolerance**

       Optional
     - ``TOLERANCE``
     - [number]

       Default: 0.0
     - Two lines with nodes closer than the specified
       tolerance are considered connected
   * - **Include upper/lower bound points**
     - ``INCLUDE_BOUNDS``
     - [boolean]

       Default: False
     - Creates a point layer output with two points for each
       edge at the boundaries of the service area.
       One point is the start of that edge, the other is the end.
   * - **Service area (lines)**
     - ``OUTPUT``
     - [vector: line]

       Default: ``[Create temporary layer]``
     - Specify the output line layer for the service area.
       One of:

       * Skip output
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table

       The file encoding can also be changed here.
   * - **Service area (boundary nodes)**
     - ``OUTPUT``
     - [vector: point]

       Default: ``[Skip output]``
     - Specify the output point layer for the service area
       boundary nodes. One of:

       * Skip output
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table

       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description

   * - **Service area (boundary nodes)**
     - ``OUTPUT``
     - [vector: point]
     - The output point layer with the service area boundary
       nodes.
       Can only be generated if
       :guilabel:`Include upper/lower bound points` is set /
       True.
   * - **Service area (lines)**
     - ``OUTPUT_LINES``
     - [vector: line]
     - Line layer representing the parts of the network
       that can be serviced by the start point, for the
       given cost.


.. _qgisshortestpathlayertopoint:

Shortest path (layer to point)
------------------------------
Computes the optimal (shortest or fastest) routes from multiple start points defined
by a vector layer and a given end point.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Vector layer representing network**
     - ``INPUT``
     - [vector: line]
     - Line vector layer representing the network to be covered
   * - **Path type to calculate**
     - ``STRATEGY``
     - [enumeration]

       Default: 0
     - The type of path to calculate. One of:

       * 0 --- Shortest
       * 1 --- Fastest

   * - **Vector layer with start points**
     - ``START_POINTS``
     - [vector: point]
     - Point vector layer whose features are used as start
       points of the routes
   * - **End point (x, y)**
     - ``END_POINT``
     - [coordinates]
     - Point feature representing the end point of the routes
   * - **Direction field**

       Optional
     - ``DIRECTION_FIELD``
     - [tablefield: string]

       Default: *0.0*
     - The field used to specify directions for the network edges.
       
       The values used in this field are specified with the three
       parameters ``Value for forward direction``,
       ``Value for backward direction`` and
       ``Value for both directions``.
       Forward and reverse directions correspond to a one-way edge,
       "both directions" indicates a two-way edge.
       If a feature does not have a value in this field, or no field
       is set then the   default direction setting (provided with
       the ``Default direction`` parameter) is used.
   * - **Value for forward direction**

       Optional
     - ``VALUE_FORWARD``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify edges with a
       forward direction
   * - **Value for backward direction**

       Optional
     - ``VALUE_BACKWARD``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify edges with a
       backward direction
   * - **Value for both directions**

       Optional
     - ``VALUE_BOTH``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify
       bidirectional edges
   * - **Default direction**

       Optional
     - ``DEFAULT_DIRECTION``
     - [enumeration]

       Default: 2
     - If a feature has no value set in the direction field or
       if no direction field is set, then this direction value
       is used. One of:

       * 0 --- Forward direction
       * 1 --- Backward direction
       * 2 --- Both directions

   * - **Speed field**

       Optional
     - ``SPEED_FIELD``
     - [tablefield: string]
     - Field providing the speed value (in ``km/h``) for the
       edges of the network when looking for the fastest path.
       
       If a feature does not have a value in this field, or
       no field is set then the default speed value (provided
       with the ``Default speed`` parameter) is used.
   * - **Default speed (km/h)**

       Optional
     - ``DEFAULT_SPEED``
     - [number]

       Default: 50.0
     - Value to use to calculate the travel time if no speed
       field is provided for an edge
   * - **Topology tolerance**

       Optional
     - ``TOLERANCE``
     - [number]

       Default: 0.0
     - Two lines with nodes closer than the specified
       tolerance are considered connected
   * - **Include upper/lower bound points**
     - ``INCLUDE_BOUNDS``
     - [boolean]

       Default: False
     - Creates a point layer output with two points for each
       edge at the boundaries of the service area.
       One point is the start of that edge, the other is the end.
   * - **Shortest path**
     - ``OUTPUT``
     - [vector: line]
     - Specify the output line layer for the shortest paths.
       One of:

       * Skip output
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table

       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description

   * - **Shortest path**
     - ``OUTPUT``
     - [vector: line]
     - Line layer of the shortest or fastest path
       from each of the start points to the end point


.. _qgisshortestpathpointtolayer:

Shortest path (point to layer)
------------------------------
Computes the optimal (shortest or fastest) routes between a given start point and multiple
end points defined by a point vector layer.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Vector layer representing network**
     - ``INPUT``
     - [vector: line]
     - Line vector layer representing the network to be covered
   * - **Path type to calculate**
     - ``STRATEGY``
     - [enumeration]

       Default: 0
     - The type of path to calculate. One of:

       * 0 --- Shortest
       * 1 --- Fastest

   * - **Start point (x, y)**
     - ``START_POINT``
     - [coordinates]
     - Point feature representing the start point of the routes
   * - **Vector layer with end points**
     - ``END_POINTS``
     - [vector: point]
     - Point vector layer whose features are used as end
       points of the routes
   * - **Direction field**

       Optional
     - ``DIRECTION_FIELD``
     - [tablefield: string]

       Default: *0.0*
     - The field used to specify directions for the network edges.
       
       The values used in this field are specified with the three
       parameters ``Value for forward direction``,
       ``Value for backward direction`` and
       ``Value for both directions``.
       Forward and reverse directions correspond to a one-way edge,
       "both directions" indicates a two-way edge.
       If a feature does not have a value in this field, or no field
       is set then the   default direction setting (provided with
       the ``Default direction`` parameter) is used.
   * - **Value for forward direction**

       Optional
     - ``VALUE_FORWARD``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify edges with a
       forward direction
   * - **Value for backward direction**

       Optional
     - ``VALUE_BACKWARD``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify edges with a
       backward direction
   * - **Value for both directions**

       Optional
     - ``VALUE_BOTH``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify
       bidirectional edges
   * - **Default direction**

       Optional
     - ``DEFAULT_DIRECTION``
     - [enumeration]

       Default: 2
     - If a feature has no value set in the direction field or
       if no direction field is set, then this direction value
       is used. One of:

       * 0 --- Forward direction
       * 1 --- Backward direction
       * 2 --- Both directions

   * - **Speed field**

       Optional
     - ``SPEED_FIELD``
     - [tablefield: string]
     - Field providing the speed value (in ``km/h``) for the
       edges of the network when looking for the fastest path.
       
       If a feature does not have a value in this field, or
       no field is set then the default speed value (provided
       with the ``Default speed`` parameter) is used.
   * - **Default speed (km/h)**

       Optional
     - ``DEFAULT_SPEED``
     - [number]

       Default: 50.0
     - Value to use to calculate the travel time if no speed
       field is provided for an edge
   * - **Topology tolerance**

       Optional
     - ``TOLERANCE``
     - [number]

       Default: 0.0
     - Two lines with nodes closer than the specified
       tolerance are considered connected
   * - **Include upper/lower bound points**
     - ``INCLUDE_BOUNDS``
     - [boolean]

       Default: False
     - Creates a point layer output with two points for each
       edge at the boundaries of the service area.
       One point is the start of that edge, the other is the end.
   * - **Shortest path**
     - ``OUTPUT``
     - [vector: line]
     - Specify the output line layer for the shortest paths.
       One of:

       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table

       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description

   * - **Shortest path**
     - ``OUTPUT``
     - [vector: line]
     - Line layer of the shortest or fastest path
       from each of the start points to the end point


.. _qgisshortestpathpointtopoint:

Shortest path (point to point)
------------------------------
Computes the optimal (shortest or fastest) route between a given start point and a given end point.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Vector layer representing network**
     - ``INPUT``
     - [vector: line]
     - Line vector layer representing the network to be covered
   * - **Path type to calculate**
     - ``STRATEGY``
     - [enumeration]

       Default: 0
     - The type of path to calculate. One of:

       * 0 --- Shortest
       * 1 --- Fastest

   * - **Start point (x, y)**
     - ``START_POINT``
     - [coordinates]
     - Point feature representing the start point of the routes
   * - **End point (x, y)**
     - ``END_POINT``
     - [coordinates]
     - Point feature representing the end point of the routes
   * - **Direction field**

       Optional
     - ``DIRECTION_FIELD``
     - [tablefield: string]

       Default: *0.0*
     - The field used to specify directions for the network edges.
       
       The values used in this field are specified with the three
       parameters ``Value for forward direction``,
       ``Value for backward direction`` and
       ``Value for both directions``.
       Forward and reverse directions correspond to a one-way edge,
       "both directions" indicates a two-way edge.
       If a feature does not have a value in this field, or no field
       is set then the   default direction setting (provided with
       the ``Default direction`` parameter) is used.
   * - **Value for forward direction**

       Optional
     - ``VALUE_FORWARD``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify edges with a
       forward direction
   * - **Value for backward direction**

       Optional
     - ``VALUE_BACKWARD``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify edges with a
       backward direction
   * - **Value for both directions**

       Optional
     - ``VALUE_BOTH``
     - [string]

       Default: '' (empty string)
     - Value set in the direction field to identify
       bidirectional edges
   * - **Default direction**

       Optional
     - ``DEFAULT_DIRECTION``
     - [enumeration]

       Default: 2
     - If a feature has no value set in the direction field or
       if no direction field is set, then this direction value
       is used. One of:

       * 0 --- Forward direction
       * 1 --- Backward direction
       * 2 --- Both directions

   * - **Speed field**

       Optional
     - ``SPEED_FIELD``
     - [tablefield: string]
     - Field providing the speed value (in ``km/h``) for the
       edges of the network when looking for the fastest path.
       
       If a feature does not have a value in this field, or
       no field is set then the default speed value (provided
       with the ``Default speed`` parameter) is used.
   * - **Default speed (km/h)**

       Optional
     - ``DEFAULT_SPEED``
     - [number]

       Default: 50.0
     - Value to use to calculate the travel time if no speed
       field is provided for an edge
   * - **Topology tolerance**

       Optional
     - ``TOLERANCE``
     - [number]

       Default: 0.0
     - Two lines with nodes closer than the specified
       tolerance are considered connected
   * - **Include upper/lower bound points**
     - ``INCLUDE_BOUNDS``
     - [boolean]

       Default: False
     - Creates a point layer output with two points for each
       edge at the boundaries of the service area.
       One point is the start of that edge, the other is the end.
   * - **Shortest path**
     - ``OUTPUT``
     - [vector: line]
     - Specify the output line layer for the shortest paths.
       One of:

       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table

       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description

   * - **Shortest path**
     - ``OUTPUT``
     - [vector: line]
     - Line layer of the shortest or fastest path
       from each of the start point to the end point
