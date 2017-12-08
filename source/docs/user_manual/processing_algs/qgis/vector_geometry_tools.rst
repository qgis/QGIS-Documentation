.. only:: html

   |updatedisclaimer|

Vector geometry
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1




.. _qgis_aggregate:

Aggregate
---------
Takes a vector or table layer and aggregate features based on a group by expression.

Features for which group by expression return the same value are grouped together.

It is possible to group all source features together using constant value in group
by parameter, example: NULL.

It is also possible to group features using multiple fields using Array function,
example: Array("Field1", "Field2").

Geometries (if present) are combined into one multipart geometry for each group.
Output attributes are computed depending on each given aggregate definition.

This algorithm allows to use the default aggregation functions of the QGIS field
calculator.

Parameters
..........

``Input layer`` [vector: any]
  Vector layer in input

``Group by expression`` [tablefield: any]
  Choose the grouping field. In *NULL* all features will be grouped

  Default: *NULL*

``Aggregates`` [fieldsmapping]
  Summary of all fields of the source layer, aggregation function available,
  delimiter and output field name

``Load fields from layer`` [vector: any]
  You can load the fields from another layer

Output
......

``Aggregated`` [vector]
  Multigeometry vector layer with the aggregated values


.. _qgis_boundary:

Boundary
---------
Returns the closure of the combinatorial boundary of the input geometries (i.e.
the topological boundary of the geometry).

For **polygon geometries** , the boundary consists of all the line strings for
each ring of the polygon.

For **lines geometries**, the boundaries are the nodes between each features.

Only valid for polygon or line layers.

Parameters
..........

``Input layer`` [vector: line, polygon]
  Input vector layer

Output
......

``Boundary`` [vector: point, line]
  Boundary from the input layer (point for line, and line for polygon).

.. figure:: /static/user_manual/processing_algs/qgis/boundary_lines.png
   :align: center

   Boundary layer for lines. In yellow a selected features

.. figure:: /static/user_manual/processing_algs/qgis/boundary_polygon.png
   :align: center

   Black dash boundary lines of the source polygon layer



.. _qgis_bounding_boxes:

Bounding boxes
---------------
Calculates the bounding box (envelope) of each feature in an input layer.
Polygon and line geometries are supported.


.. figure:: /static/user_manual/processing_algs/qgis/bounding_box.png
   :align: center

   Black lines represent the bounding boxes of each polygon feature

Parameters
..........

``Input layer`` [vector: polygon, line]
  Input vector layer

Outputs
.......

``Bounds`` [vector: poylgon]
  Bounding boxes of input layer.


.. _qgis_buffer:

Buffer
------
Computes a buffer area for all the features in an input layer, using a fixed distance.

It is possible to define also a negative distance for polygon input layers: in this
case the buffer will result in a smaller polygon.

Buffer always results in a polygon layer: in the following picture the buffer
for points, lines and polygons:

.. figure:: /static/user_manual/processing_algs/qgis/buffer.png
   :align: center

   In yellow the buffer of point, line and polygon layer

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

``Distance`` [number]
  Distance radius of the buffer

  Default: *10.0*

``Segments`` [number]
  Controls the number of line segments to use to approximate a quarter circle when
  creating rounded offsets

  Default: *5*

``End cap style`` [selection]
  Controls how line endings are handled in the buffer.

  .. figure:: /static/user_manual/processing_algs/qgis/buffer_cap_style.png
     :align: center

     Round, flat and square cap styles

``Join style`` [selection]
  Specifies whether round, miter or beveled joins should be used when offsetting
  corners in a line.

``Miter limit`` [number]
  Only applicable for miter join styles, and controls the maximum distance from
  the offset curve to use when creating a mitered join

  Default: *2.0*

``Dissolve result`` [boolean]
  Choose to dissolve the final buffer

  Default: *False*

  .. figure:: /static/user_manual/processing_algs/qgis/buffer_dissolve.png
     :align: center

     Normal and dissolved buffer


Outputs
.......

``Buffer`` [vector: polygon]
  Buffer polygon vector layer


.. _qgis_centroids:

Centroids
---------
Creates a new point layer, with points representing the centroid of the geometries
of the input layer.

The attributes associated to each point in the output layer are the same ones
associated to the original features.

.. figure:: /static/user_manual/processing_algs/qgis/centroids.png
   :align: center

   The red stars represent the centroids of each feature of the input layer.
   In yellow a single feature of the input layer is highlighted.

Parameters
..........

``Input layer`` [vector: any]
  Vector layer in input.

Outputs
.......

``Centroids`` [vector: point]
  Points vector layer in output.


.. _qgis_check_validity:

Check validity
--------------
Performs a validity check on the geometries of a vector layer.

The geometries are classified in three groups (valid, invalid and error) and a
vector layer is generated with the features in each of these categories.

The attribute table of each generated vector layer will contain some additional
information:

.. figure:: /static/user_manual/processing_algs/qgis/check_validity.png
   :align: center

   Left the input layer. Right: in green the valid layer, in orange the invalid layer

Parameters
..........

``Input layer`` [vector: any]
  Source layer to check.

``Method`` [selection]
  Check validity method.

  Options:

  * The one selected in digitizing settings
  * QGIS
  * GEOS

  Default: *The one selected in digitizing settings*

Outputs
.......

``Valid output`` [vector: any]
  An exact copy of the valid feature of the source layer.

``Invalid output`` [vector: any]
  Layer with a copy of the attributes of the source layer plus the field ``_errors``
  with a summary of the error founded.

``Error output`` [vector: point]
  Point layer of the exact position of the validity problems detected with the
  ``message`` field describing the errors founded.


.. _qgis_collect_geometries:

Collect geometries
------------------
Takes a vector layer and collects its geometries into new multipart geometries.

One or more attributes can be specified to collect only geometries belonging to
the same class (having the same value for the specified attributes), alternatively
all geometries can be collected.

All output geometries will be converted to multi geometries, even those with just
a single part. This algorithm does not dissolve overlapping geometries - they will
be collected together without modifying the shape of each geometry part.

See the 'Promote to multipart' or 'Aggregate' algorithms for alternative options.

Parameters
..........

``Input layer`` [vector: any]
  Vector layer to be transformed

``Unique ID fields`` [multipleinput]
  Optional

  Choose one or more attributes to collect the geometries


Output
......

``Collected`` [vector]


See also
........
:ref:`qgis_aggregate` and :ref:`qgis_promote_to_multipart`



.. _qgis_concave_hull:

Concave hull
------------
Computes the concave hull of the features in an input point layer.


Parameters
..........
``Input point layer`` [vector: point]
  Point vector layer to calculate the concave hull

``Threshold`` [number]
  Number from 0 (maximum concave hull) to 1 (convex hull)

  Default: *0.3*


  .. figure:: /static/user_manual/processing_algs/qgis/concave_hull_threshold.png
     :align: center

     Different thresholds used (0.3, 0.6, 0.9)



``Allow holes`` [boolean]
  Choose whether to allow holes in the final concave hull

  Default: *True*

``Split multipart geometry into singlepart geometries`` [boolean]
  Check if you want to have singlepart geometries instead of multipart ones

  Default: *False*

Output
......
``Concave hull`` [vector: polygon]
  Output concave hull

See also
........
:ref:`qgis_convex_hull`



.. _qgis_convert_geometry_type:

Convert geometry type
---------------------
Generates a new layer based on an existing one, with a different type of geometry.

Not all conversions are possible. For instance, a line layer can be converted to
a point layer, but a point layer cannot be converted to a line layer.

Parameters
..........
``Input layer`` [vector: any]
  Input vector layer to transform

``New geometry type`` [selection]
  List of all the conversions supported:

  * Centroids
  * Nodes
  * Linestrings
  * Multilinestrings
  * Polygons

  .. note:: conversion types depends on the input layer and the conversion chosen:
    e.g. it is not possible to convert a point to a line

Output
......

``Converted`` [vector]
  Converted vector layer depending on the parameters chosen

See also
........
:ref:`qgis_polygonize`, :ref:`qgis_lines_to_polygon`


.. _qgis_convex_hull:

Convex hull
-----------
Calculates the convex hull for each feature in an input layer.

See the 'Minimum bounding geometry' algorithm for a convex hull calculation which
covers the whole layer or grouped subsets of features.

.. figure:: /static/user_manual/processing_algs/qgis/convex_hull.png
   :align: center

   Black lines identify the convex hull for each layer feature

Parameters
..........
``Input point layer`` [vector: any]
  Point vector layer to calculate the convex hull

Output
......
``Convex hull`` [vector: polygon]
  Output convex hull

See also
........
:ref:`qgis_minimum_bounding_geometry`, :ref:`qgis_concave_hull`


.. _qgis_create_layer_from_extent:

Create layer from extent
------------------------
Creates a new vector layer that contains a single feature with geometry matching
an extent parameter.

It can be used in models to convert an extent into a layer which can be used for
other algorithms which require a layer based input.

Parameters
..........

``Extent`` [extent]
  Choose the extent of the layer

Output
......

``Extent``
  Final extent of the layer


.. _qgis_dalaunay_triangulation:

Delaunay triangulation
----------------------
Creates a polygon layer with the delaunay triangulation corresponding to a points
layer.

.. figure:: /static/user_manual/processing_algs/qgis/delaunay.png
   :align: center

   Delaunay triangulation on points

Parameters
..........

``Input layer`` [vector: point]
  Point vector layer to compute the triangulation on

Output
......
``Delaunay triangulation`` [vector: polygon]
  Resulting polygon layer of delaunay triangulation




.. _qgis_delete_holes:

Delete holes
------------
Takes a polygon layer and removes holes in polygons. It creates a new vector layer
in which polygons with holes have been replaced by polygons with only their external
ring. Attributes are not modified.

An optional minimum area parameter allows removing only holes which are smaller
than a specified area threshold. Leaving this parameter as 0.0 results in all
holes being removed.

.. figure:: /static/user_manual/processing_algs/qgis/delete_holes.png
   :align: center

   Before and after the cleaning

Parameters
..........
``Input layer`` [vector: polygon]
  Polygon layer with holes.

``Remove holes with area less than`` [number]
  Optional.

  Only holes with an area less than this threshold will be deleted. If ``0.0`` is
  added, **all** the holes will be deleted.

  Defalut: *0.0*

Outputs
.......

``Cleaned`` [vector: polygon]
  Vector layer without holes.


.. _qgis_densify_geometries:

Densify geometries
------------------
Takes a polygon or line layer and generates a new one in which the geometries have
a larger number of vertices than the original one.

Vertices will be added to each segment of the layer.

If the geometries have z or m values present then these will be linearly interpolated
at the added nodes.

The number of new vertices to add to each feature geometry is specified as an
input parameter.

.. figure:: /static/user_manual/processing_algs/qgis/densify_geometry.png
   :align: center

   Red points show the vertices before and after the densify

Parameters
..........

``Input layer`` [vector: polygon, line]
  Polygon or line vector layer.

``Vertices to add`` [number]
  Number of vertices to add.

  Default: *1*

Outputs
.......

``Densified`` [vector: polygon, line]
  Densified layer with vertices added.


See also
........
To add vertices at specific intervals look at :ref:`qgis_densify_geometry_interval`.


.. _qgis_densify_geometry_interval:

Densify geometries given an interval
------------------------------------
Takes a polygon or line layer and generates a new one in which the geometries have
a larger number of vertices than the original one.

The geometries are densified by adding regularly placed extra nodes inside each
segment so that the maximum distance between any two nodes does not exceed the
specified distance.

If the geometries have z or m values present then these will be linearly interpolated
at the added nodes.

The distance is expressed in the same units used by the layer CRS.

Example
.......
Specifying a distance 3 would cause the segment ``[0 0] -> [10 0]`` to be converted
to ``[0 0] -> [2.5 0] -> [5 0] -> [7.5 0] -> [10 0]``, since 3 extra nodes are required
on the segment and spacing these at 2.5 increments allows them to be evenly spaced
over the segment.

.. figure:: /static/user_manual/processing_algs/qgis/densify_geometry_interval.png
   :align: center

   Densify geometry at a given interval

Parameters
..........

``Input layer`` [vector: polygon, line]
  Polygon or line vector layer.

``Interval between vertices to add`` [number]
  Distance between the nodes. Units are taken from the layer CRS.

  Default: *1.0*

Outputs
.......

``Densified`` [vector: plygon, line]
  Densified layer with vertices added at specified intervals


See also
........
To add a specific number of vertices, look at :ref:`qgis_densify_geometries`.


.. _qgis_dissolve:

Dissolve
--------
Takes a polygon or line vector layer and combines their geometries into new
geometries.

One or more attributes can be specified to dissolve only geometries belonging to
the same class (having the same value for the specified attributes), alternatively
all geometries can be dissolved.

If the geometries to be dissolved are spatially separated from each other the output
will be multi geometries. In case the input is a polygon layer, common boundaries
of adjacent polygons being dissolved will get erased.

The resulting attribute table will have the same fields of the input layer while
the features are truncated.

.. figure:: /static/user_manual/processing_algs/qgis/dissolve.png
   :align: center

   Dissolve the polygon layer on a common attribute

Parameters
..........

``Input layer`` [vector: polygon, line]
  Line or polygon layer to be dissolved.

``Unique ID fields`` [tablefield: any]
  Optional.

  If features share a common value in all selected field(s) their geometries will
  be combined.

  Values in the output layer's fields are the ones of the first input feature
  that happens to be processed.
  Returns one feature for each unique value in the field. The feature's
  geometry represents all input geometries with this value.

Outputs
.......

``Dissolved`` [vector: polygon, line]
  Output layer, either (multi) line or (multi) polygon


.. _qgis_drop_mz_values:

Drop m/z values
---------------
Removes any measure (M) or Z values from input geometries.

Parameters
..........
``Input layer`` [vector: any]
  Input vector layer to clean

``Drop M Values`` [boolean]
  Check to remove the M values

  Default: *False*

``Drop Z Values`` [boolean]
  Check to remove the Z values

  Default: *False*

Output
......
``Z/M Dropped`` [vector]
  Cleaned vector laye without M or Z values


.. _qgis_eliminate_selected_polygons:

Eliminate selected polygons
---------------------------
Combines selected polygons of the input layer with certain adjacent polygons by
erasing their common boundary. The adjacent polygon can be either the one with
the largest or smallest area or the one sharing the largest common boundary with
the polygon to be eliminated.

The selected features will always be eliminated whether the option "Use only selected features"
is set or not. Eliminate is normally used to get rid of sliver polygons, i.e.
tiny polygons that are a result of polygon intersection processes where boundaries
of the inputs are similar but not identical.

Parameters
..........
``Input layer`` [vector: polygon]
  Input polygon vector layer to clean

``Merge selection with the neighboring polygon with the`` [selection]
  Choose the parameter to use in order to get rid of the selected polygons:

  * Largest Area
  * Smallest Area
  * Largest Common Boundary

Output
......
``Eliminated`` [vector: polygon]
  Cleaned vector layer as result of the parameters chosen



.. _qgis_explode_lines:

Explode lines
-------------
Takes a lines layer and creates a new one in which each line is replaced by a set
of lines representing the segments in the original line.

Each line in the resulting layer contains only a start and an end point, with no
intermediate nodes between them.


.. figure:: /static/user_manual/processing_algs/qgis/explode_lines.png
   :align: center

   The original line layer and the exploded one

Parameters
..........
``Input layer`` [vector: line]
  Line vector layer in input to explode

Output
......

``Exploded`` [vector: line]



.. _qgis_export_geometry_columns:

Export geometry columns
-----------------------
Computes geometric properties of the features in a vector layer.

It generates a new vector layer with the same content as the input one, but with
additional attributes in its attributes table, containing geometric measurements.

Depending on the geometry type of the vector layer, the attributes added to the
table will be different:

* for point layers: x and y coordinates
* for line layers: length
* for polygon layers: perimeter and area

Parameters
..........
``Input layer`` [vector: any]
  Vector layer in input

``Calculate using`` [selection]
  Choose different calculation type for the coordinates:

  * Layer CRS
  * Project CRS
  * Ellipsoidal

Output
......

``Added gom info`` [vector]
  Copy of the input vector layer with the addition of the coordinates fields



.. _qgis_extend_lines:

Extend lines
------------
Extends line geometries by a specified amount at the start and end of the line.

Lines are extended using the bearing of the first and last segment in the line.

.. figure:: /static/user_manual/processing_algs/qgis/extend_lines.png
   :align: center

   The red dashes represent the initial and final extension of the original layer

Parameters
..........

``Input layer`` [vector: line]
  Line vector layer to extend

``Start distance`` [number]
  Starting distance of the extension

``End distance`` [number]
  Ending distance of the extension

Output
......

``Extended`` [vector: line]
  Extended vector line layer

Explode lines
-------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: line]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:explodelines', input, output)

See also
........

Extract nodes
-------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: polygon, line]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:extractnodes', input, output)

See also
........

Fill holes
----------

Description
...........

<put algorithm description here>

Parameters
..........

``Polygons`` [vector: any]
  <put parameter description here>

``Max area`` [number]
  <put parameter description here>

  Default: *100000*

Outputs
.......

``Results`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:fillholes', polygons, max_area, results)

See also
........

Fixed distance buffer
---------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Distance`` [number]
  <put parameter description here>

  Default: *10.0*

``Segments`` [number]
  <put parameter description here>

  Default: *5*

``Dissolve result`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
.......

``Buffer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:fixeddistancebuffer', input, distance, segments, dissolve, output)

See also
........

Keep n biggest parts
--------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Polygons`` [vector: polygon]
  <put parameter description here>

``To keep`` [number]
  <put parameter description here>

  Default: *1*

Outputs
.......

``Results`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:keepnbiggestparts', polygons, to_keep, results)

See also
........

Lines to polygons
-----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: line]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:linestopolygons', input, output)

See also
........

Merge lines
------------

Description
............

This algorithm joins all connected parts of MultiLineString geometries into
single LineString geometries.

If any parts of the input MultiLineString geometries are not connected, the
resultant geometry will be a MultiLineString containing any lines which could
be merged and any non-connected line parts.

Parameters
..........

``Input layer`` [vector: line]
  input layer (line) to merge

Outputs
.......

``Output layer`` [vector: line]
  Resultant layer with merged line

Console usage
..............

::

   processing.runalg('qgis:mergelines', input, output)

See also
........


Multipart to singleparts
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:multiparttosingleparts', input, output)

See also
........

Point on surface
-----------------

Description
............

Returns a point guaranteed to lay on the surface of a polygon geometry.

Parameters
...........

``Input layer`` [vector: polygon]
  Layer with polygon

Outputs
........

``Output layer`` [vector: point]
  The resulting layer with point on surface

Console usage
..............

::

   processing.runalg('qgis:pointonsurface', input, output)

See also
........


Points displacement
-------------------

Description
...........

Moves overlapped points at small distance, that they all become visible. The result
is very similar to the output of the "Point displacement" renderer but it is permanent.

Parameters
..........

``Input layer`` [vector: point]
  Layer with overlapped points.

``Displacement distance`` [number]
  Desired displacement distance **NOTE**: displacement distance should be in
  same units as layer.

  Default: *0.00015*

``Horizontal distribution for two point case`` [boolean]
  Controls distribution direction in case of two overlapped points. If *True*
  points will be distributed horizontally, otherwise they will be distributed
  vertically.

  Default: *True*

Outputs
.......

``Output layer`` [vector]
  The resulting layer with shifted overlapped points.

Console usage
.............

::

  processing.runalg('qgis:pointsdisplacement', input_layer, distance, horizontal, output_layer)

See also
........

Polygon centroids
-----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: polygon]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:polygoncentroids', input_layer, output_layer)

See also
........

Polygonize
----------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: line]
  <put parameter description here>

``Keep table structure of line layer`` [boolean]
  <put parameter description here>

  Default: *False*

``Create geometry columns`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:polygonize', input, fields, geometry, output)

See also
........

Polygons to lines
-----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: polygon]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:polygonstolines', input, output)

See also
........

Simplify geometries
-------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: polygon, line]
  <put parameter description here>

``Tolerance`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Simplified layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:simplifygeometries', input, tolerance, output)

See also
........

Singleparts to multipart
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Unique ID field`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:singlepartstomultipart', input, field, output)

See also
........

Variable distance buffer
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Distance field`` [tablefield: any]
  <put parameter description here>

``Segments`` [number]
  <put parameter description here>

  Default: *5*

``Dissolve result`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
.......

``Buffer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:variabledistancebuffer', input, field, segments, dissolve, output)

See also
........

Voronoi polygons
----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: point]
  <put parameter description here>

``Buffer region`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Voronoi polygons`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:voronoipolygons', input, buffer, output)

See also
........
