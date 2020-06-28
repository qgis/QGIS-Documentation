:orphan:

**network_advanced_parameters**

.. The following section is included in network analysis algorithms, ie
 qgisserviceareafrompoint, qgisserviceareafromlayer, qgisshortestpathlayertopoint,
 qgisshortestpathpointtolayer and qgisshortestpathpointtopoint

Advanced parameters
...................

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Direction field**

       Optional
     - ``DIRECTION_FIELD``
     - [tablefield: string]

       Default: 0.0
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

**end_network_advanced_parameters**

**network_advanced_parameters_table**

.. The following section is included in network analysis algorithms, ie
 qgisserviceareafrompoint, qgisserviceareafromlayer, qgisshortestpathlayertopoint,
 qgisshortestpathpointtolayer and qgisshortestpathpointtopoint

.. list-table::
   :header-rows: 0
   :widths: 20 20 20 40
   :stub-columns: 0

   * - **Direction field**

       Optional
     - ``DIRECTION_FIELD``
     - [tablefield: string]

       Default: 0.0
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

**end_network_advanced_parameters_table**

**network_advanced_parameters_service_area**

.. The following section is included in network analysis algorithms, ie
 qgisserviceareafrompoint, qgisserviceareafromlayer, qgisshortestpathlayertopoint,
 qgisshortestpathpointtolayer and qgisshortestpathpointtopoint

Advanced parameters
...................

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Direction field**

       Optional
     - ``DIRECTION_FIELD``
     - [tablefield: string]

       Default: 0.0
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

**end_network_advanced_parameters_service_area**

**geometric_predicates**

.. The following section is included in vector selection algorithms such as
 qgisselectbylocation, qgisextractbylocation
 
.. figure:: img/selectbylocation.png
   :align: center
       
   In this example, the dataset from which we want to select (the *source
   vector layer*) consists of the green circles, the orange rectangle is the
   dataset that it is being compared to (the *intersection vector layer*).

Available geometric predicates are:

*Intersect*
  Tests whether a geometry intersects another. Returns 1 (true) if the
  geometries spatially intersect (share any portion of space - overlap or touch) and 0 if they
  don’t. In the picture above, this will select circles 1, 2 and 3.

*Contain*
  Returns 1 (true) if and only if no points of b lie in the exterior of a,
  and at least one point of the interior of b lies in the interior of a.
  In the picture, no circle is selected, but the rectangle would be if you
  would select it the other way around, as it contains a circle completely.
  This is the opposite of *are within*.

*Disjoint*
  Returns 1 (true) if the geometries do not share any portion of space (no overlap, not touching).
  Only circle 4 is selected.

*Equal*
  Returns 1 (true) if and only if geometries are exactly the same.
  No circles will be selected.

*Touch*
  Tests whether a geometry touches another. Returns 1 (true) if the geometries
  have at least one point in common, but their interiors do not intersect.
  Only circle 3 is selected.

*Overlap*
  Tests whether a geometry overlaps another. Returns 1 (true) if the geometries
  share space, are of the same dimension, but are not completely contained by
  each other. Only circle 2 is selected.

*Are within*
  Tests whether a geometry is within another. Returns 1 (true) if geometry a
  is completely inside geometry b. Only circle 1 is selected.

*Cross*
  Returns 1 (true) if the supplied geometries have some, but not all, interior
  points in common and the actual crossing is of a lower dimension than the
  highest supplied geometry. For example, a line crossing a polygon will cross
  as a line (selected). Two lines crossing will cross as a point (selected).
  Two polygons cross as a polygon (not selected).

**end_geometric_predicates**

**postgisexecutesqlexample**

.. The following section is included in database algorithms such as
 qgispostgisexecutesql, qgispostgisexecuteandloadsql
 
**Example**

#. Set all the values of an existing field to a fixed value. The SQL query string
   will be:

   .. code-block:: sql

    UPDATE your_table SET field_to_update=20;

   In the example above, the values of the field ``field_to_update`` of the table
   ``your_table`` will be all set to ``20``.

#. Create a new ``area`` column and calculate the area of each feature with the
   ``ST_AREA`` PostGIS function.

   .. code-block:: sql

    -- Create the new column "area" on the table your_table"
    ALTER TABLE your_table ADD COLUMN area double precision;
    -- Update the "area" column and calculate the area of each feature:
    UPDATE your_table SET area=ST_AREA(geom);

**end_postgisexecutesqlexample**

**algorithm_code_section**

.. The following section is used to load python code sample in algs help

.. code-block:: python

    import processing
    processing.run("algorithm_id", {parameter_dictionary})

The *algorithm id* is displayed when you hover over the algorithm in
the Processing Toolbox.
The *parameter dictionary* provides the parameter NAMEs and values.
See :ref:`processing_console` for details on how to run processing algorithms
from the Python console.

**end_algorithm_code_section**
