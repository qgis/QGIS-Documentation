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

   Boundary layer for lines. In yellow one selected features

.. figure:: /static/user_manual/processing_algs/qgis/boundary_polygon.png
   :align: center

   Black dash lines the polygon boundary



.. _qgis_bounding_boxes:

Bounding boxes
---------------
Calculates the bounding box (envelope) of each feature in an input layer.
Polygon and line geometries are supported.


.. figure:: /static/user_manual/processing_algs/qgis/bounding_box.png
   :align: center

   In green with light red strokes the features of the polygon, the black strokes
   represent the bounding boxes of each feature

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
for points, lines and polygons;

.. figure:: /static/user_manual/processing_algs/qgis/buffer.png
   :align: center

   Points, lines and polygons buffer

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

   Left the input layer. Right: in green the valid layer, in red the invalid layer:
   black refer to the invalid points

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


  .. figure:: /static/user_manual/processing_algs/qgis/concave_hull_threshold.png
     :align: center

     Different thresholds used (0.3, 0.6, 0.9)

  Default: *0.3*

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

See the "Polygonize" or "Lines to polygons" algorithm for alternative options.

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
    it is not possible to convert a point to a line

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


.. _qgis_extract_nodes:

Extract nodes
-------------
Takes a line or polygon layer and generates a point layer with points representing
the nodes in the input lines or polygons.

The attributes associated to each point are the same ones associated to the line
or polygon that the point belongs to.

Additional fields are added to the nodes indicating the node index (beginning at 0),
the node’s part and its index within the part (as well as its ring for polygons),
distance along original geometry and bisector angle of node for original geometry.

.. figure:: /static/user_manual/processing_algs/qgis/extract_nodes.png
   :align: center

   Nodes extracted for line and polygon layer

Parameters
..........

``Input layer`` [vector: any]
  Vector layer in input to extract the nodes from

Output
......

``Nodes`` [vector: point]
  Extracted nodes


.. _qgis_extract_specific_nodes:

Extract specific nodes
----------------------
Takes a line or polygon layer and generates a point layer with points representing
specific nodes in the input lines or polygons.

For instance, this algorithm can be used to extract the first or last nodes in
the geometry. The attributes associated to each point are the same ones associated
to the line or polygon that the point belongs to.

The node indices parameter accepts a comma separated string specifying the indices
of the nodes to extract. The first node corresponds to an index of 0, the second
node has an index of 1, etc. Negative indices can be used to find nodes at the
end of the geometry, e.g., an index of -1 corresponds to the last node, -2
corresponds to the second last node, etc.

Additional fields are added to the nodes indicating the specific node position
(e.g., 0, -1, etc), the original node index, the node’s part and its index within
the part (as well as its ring for polygons), distance along the original geometry
and bisector angle of node for the original geometry.

Parameters
..........
``Input layer`` [vector]
  Vector layer in input to extract the nodes from

``Node indices`` [number]
  Type the indices of the nodes to extract. The algorithm accepts comma separated
  values for many nodes to extract (e.g. ``-2, 3, 5, 7``)

  Default: *0*

Output
......

``Nodes`` [vector: point]
  Extracted nodes of input layer


.. _qgis_fix_geometry:

Fix geometry
------------
This algorithm attempts to create a valid representation of a given invalid geometry
without losing any of the input vertices. Already-valid geometries are returned
without further intervention. Always outputs multi-geometry layer.

.. note:: M values will be dropped from the output.

Parameters
..........

``Input layer`` [vector: polygon, line]
  Polygon or vector layer in input.


Outputs
.......

``Fixed geometries`` [vector: polygon, line]
  Layer with fixed geometries.


.. _qgis_geometry_by_expression:

Geometry by expression
----------------------
Updates existing geometries (or creates new geometries) for input features by use
of a QGIS expression.

This allows complex geometry modifications which can utilize all the flexibility
of the QGIS expression engine to manipulate and create geometries for output features.

For help with QGIS expression functions, see the inbuilt help for specific functions
which is available in the expression builder.

Parameters
..........
``Input layer`` [vector: any]
  Vector input layer

``Output geometry type`` [selection]
  The output geometry strongly depends on the expression you will choose: for
  instance, if you want to create a buffer than the geometry type has to be
  a polygon

  * Polygon
  * Line
  * Point

``Output geometry has z dimension`` [boolean]
  Choose if the output geometry should have the z dimension

  Default: *False*

``Output geometry has m dimension`` [boolean]
  Choose if the output geometry should have the z dimension

  Default: *False*

``Geometry expression`` [expression]
  Add the geometry expression you want to use. You can use the button to open
  the Expression Dialog: the dialog has a lists of all the usable expression
  together with their help and guide

  Default: *$geometry*

``Modified geometry`` [vector]
  Vector layer resulting from the expression added



.. _qgis_keep_n_biggest:

Keep n biggest parts
--------------------
Cuts the n biggest parts of the input layer.

This algorithm is particularly useful if a single layer is very complicated and
made of many different parts.

.. figure:: /static/user_manual/processing_algs/qgis/n_biggest.png
   :align: center

   Clockwise from left-up: source layer, one, tow and three biggest parts to keep

Parameters
..........

``Polygons`` [vector: polygon]
  Input polygon layer.

``To keep`` [number]
  Choose how many biggest parts have to be kept. If 1 is selected, only the
  biggest part of the whole layer will be saved.

  Default: *1*

Outputs
.......

``Biggest parts`` [vector: polygon]
  Resulting polygon layer with the biggest parts chosen.


.. _qgis_lines_to_polygon:

Lines to polygon
----------------
Generates a polygon layer using as polygon rings the lines from an input line layer.

The attribute table of the output layer is the same as the one from of the input
line layer.

Parameters
..........

``Input layer`` [vector: line]
  Line vector layer to convert

Output
......

``Polygons`` [vector: polygon]
  Polygon vector layer from the line input vector layer


.. _qgis_merge_lines:

Merge lines
-----------
Joins all connected parts of MultiLineString geometries into single LineString
geometries.

If any parts of the input MultiLineString geometries are not connected, the
resultant geometry will be a MultiLineString containing any lines which could be
merged and any non-connected line parts.

Parameters
..........

``Input layer`` [vector: line]
  MultiLineString vector layer

Output
......

``Merged`` [vector: lines]
  Single Linestring vector layer


.. _qgis_minimum_bounding_geometry:

Minimum bounding geometry
-------------------------
Creates geometries which enclose the features from an input layer.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

``Field`` [tablefield: any]
  Optional

  Features can be grouped by a field. If set, this causes the output
  layer to contain one feature per grouped value with a minimal geometry covering
  just the features with matching values

``Geometry type`` [selection]
  Numerous enclosing geometry types are supported:

  * Envelopes (bounding boxes)
  * Minimum oriented rectangle
  * Minimum enclosing circles
  * Convex hulls

  .. figure:: /static/user_manual/processing_algs/qgis/minimum_bounding.png
     :align: center

     Clockwise from left-up: envelopes, oriented rectangle, circle, convex hull

Output
......

``Bounding geometry`` [vector: polygon]
  Bounding polygon layer



.. _qgis_minimum_enclosing_circles:

Minimum enclosing circles
-------------------------
Calculates the minimum enclosing circle which covers each feature in an input layer.

.. figure:: /static/user_manual/processing_algs/qgis/minimum_enclosing_circles.png
   :align: center

   Enclosing circles for each feature

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

``Number of segment in circles`` [number]
  Choose the number of segment for each circle

  Default: *72*

Output
......

``Minimum enclosing circles`` [vector: polygon]
  Enclosing circles for each polygon feature

See also
........
:ref:`qgis_minimum_bounding_geometry`


.. _qgis_multipart_to_single:

Multipart to singleparts
------------------------
Splits the multipart input layers into single features.

The attributes of the output layers are the same of the original ones but divided
into single features.

.. figure:: /static/user_manual/processing_algs/qgis/multipart.png
   :align: center

   Left the multipart source layer and right the single part output result

Parameters
..........

``Input layer`` [vector: any]
  Multipart input layer.

Outputs
.......

``Single parts`` [vector: any]
  Singlepart layer in output with updated attribute table.

See also
........
:ref:`qgis_collect_geometries` and :ref:`qgis_promote_to_multipart`


.. _qgis_offset_line:

Offset line
-----------
Offsets lines by a specified distance. Positive distances will offset lines to
the left, and negative distances will offset to the right of lines.

.. figure:: /static/user_manual/processing_algs/qgis/offset_lines.png
   :align: center

   In blue the source layer, in red the offset one

Parameters
..........

``Input layer`` [vector: line]
  Line vector layer in input to elaborate the offset on

``Distance`` [number]
  Distance of the offset. Negative distances are also supported: for instance a
  negative distance will create the offset to the other part of the layer

  Default: *10.0*

``Segment`` [number]
  Number of line segments to use to approximate a quarter circle when creating
  rounded offsets

  Default: *8*

``Join style`` [selection]
  Specify whether round, miter or beveled joins should be used when offsetting
  corners in a line

  Default: *Round*

``Miter limit`` [number]
  Only applicable for miter join styles, and controls the maximum distance from
  the offset curve to use when creating a mitered join

  Default: *2.0*

Output
......

``Offset`` [vector: line]
  Offset line layer


.. _qgis_oriented_minimum_bounding_box:

Oriented minimum bounding box
-----------------------------
Calculates the minimum area rotated rectangle which covers each feature in an input layer.

.. figure:: /static/user_manual/processing_algs/qgis/oriented_minimum_bounding_box.png
   :align: center

   Oriented minimum bounding box

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

Output
......

``Bounding boxes`` [vector: polygon]
  Oriented minimum bounding boxes for each polygon feature

See also
........
:ref:`qgis_minimum_bounding_geometry`


.. _qgis_orthogonalize:

Orthogonalize
-------------
Takes a line or polygon layer and attempts to orthogonalize all the geometries
in the layer. This process shifts the nodes in the geometries to try to make every
angle in the geometry either a right angle or a straight line.


.. figure:: /static/user_manual/processing_algs/qgis/orthogonize.png
   :align: center

   In blue the source layer while the red line is the orthogonalized result

Parameters
..........

``Input layer`` [vector: polygon, line]
  Input vector layer

``Maximum angle tolerance (degrees)`` [number]
  Specify the maximum deviation from a right angle or straight line a node can
  have for it to be adjusted. Smaller tolerances mean that only nodes which are
  already closer to right angles will be adjusted, and larger tolerances mean
  that nodes which deviate further from right angles will also be adjusted.

``Maximum algorithm iterations`` [number]
  Setting a larger number for the maximum iterations will result in a more
  orthogonal geometry at the cost of extra processing time

Output
......

``Orthogonalized`` [vector]
  Final layer with angles adjusted depending on the parameters chosen


.. _qgis_point_on_surface:

Point on surface
----------------
Returns a point guaranteed to lie on the surface of a geometry.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

Output
......

``Point`` [vector: point]
  Point vector layer


.. _qgis_points_along_lines:

Points along lines
------------------
Creates points at regular intervals along line or polygon geometries. Created
points will have new attributes added for the distance along the geometry and the
angle of the line at the point.

An optional start and end offset can be specified, which controls how far from
the start and end of the geometry the points should be created.

.. figure:: /static/user_manual/processing_algs/qgis/points_along_line.png
   :align: center

   Points created along the source line layer

Parameters
..........

``Input layer`` [vector: line, polygon]
  Input vector layer

``Distance`` [number]
  Set the distance between each point

  Default: *100*

``Start offset`` [number]
  Specify an eventual offset where the first point should start

  Default: *0*

``End offset`` [number]
  Specify an eventual offset where the last point should end

  Default: *0*

Output
......

``Points`` [vector: point]
  Point vector layer


.. _qgis_points_displacement:

Points displacement
-------------------
Offsets nearby point features by moving nearby points by a preset amount to minimize
overlapping features.


Parameters
..........

``Input layer`` [vector: point]
  Input point vector layer

``Minimum distance to other points`` [number]
  Set the distance between each point

  Default: *0,000150*

``Displacement distance`` [number]
  Specify an eventual offset where the first point should start

  Default: *0,000150*

``Horizontal distribution for two point case`` [boolean]
  Specify an eventual offset where the last point should end

  Default: *False*

Output
......

``Displaced`` [vector: point]
  Point vector layer


.. _qgis_pole_of_inaccessibility:

Pole of inaccessibility
-----------------------
Calculates the pole of inaccessibility for a polygon layer, which is the most
distant internal point from the boundary of the surface.

This algorithm uses the 'polylabel' algorithm (Vladimir Agafonkin, 2016), which
is an iterative approach guaranteed to find the true pole of inaccessibility within
a specified tolerance (in layer units). More precise tolerances require more iterations
and will take longer to calculate.

The distance from the calculated pole to the polygon boundary will be stored as
a new attribute in the output layer.

.. figure:: /static/user_manual/processing_algs/qgis/pole_inaccessibility.png
   :align: center

   Pole of inaccessibility

Parameters
..........

``Input layer`` [vector: polygon]
  Input polygon vector layer

``Tolerance (layer units)`` [number]
  Set the tolerance for the calculation

  Default: *1.0*

Output
......

``Point`` [vector: point]
  Point as pole of inaccessibility for the source polygon vector layer


.. _qgis_simplify_geometries:

Simplify geometries
-------------------
This algorithm simplifies the geometries in a line or polygon layer. It creates
a new layer with the same features as the ones in the input layer, but with
geometries containing a lower number of vertices.

The algorithm gives a choice of simplification methods, including distance based
(the "Douglas-Peucker" algorithm), area based ("Visvalingam" algorithm) and
snapping geometries to grid.

.. figure:: /static/user_manual/processing_algs/qgis/simplify_geometries.png
   :align: center

   Clockwise from left-up: source layer and different simplification tolerances

Parameters
..........

``Input layer`` [vector: polygon, line]
  Polygon or line vector to simplify.

``Simplification method`` [selection]
  Method of the simplification.

  Options:

  * Distance (Douglas-Peucker)
  * Snap to grid
  * Area (Visvalingam)

  Default: *Distance (Douglas-Peucker)*

``Tolerance`` [number]
  Threshold tolerance: if the distance between two nodes is smaller than the
  tolerance value, the segment will be simplified and vetices will be removed.

  **Value in map unit of the layer**

  Default: *1.0*

Outputs
.......

``Simplified`` [vector: polygon, line]
  Simplified vector layers in output.

Console usage
.............

::

  processing.runalg('qgis:simplifygeometries', input, tolerance, output)


.. _qgis_smooth_geometry:

Smooth geometry
---------------
This algorithm smooths the geometries in a line or polygon layer. It creates a
new layer with the same features as the ones in the input layer, but with geometries
containing a **higher number of vertices and corners** in the geometries smoothed
out.

The iterations parameter dictates how many smoothing iterations will be applied
to each geometry. A higher number of iterations results in smoother geometries
with the cost of greater number of nodes in the geometries.

The offset parameter controls how "tightly" the smoothed geometries follow the
original geometries. Smaller values results in a tighter fit, and larger values
will create a looser fit.

The maximum angle parameter can be used to prevent smoothing of nodes with large
angles. Any node where the angle of the segments to either side is larger than
this will not be smoothed. For example, setting the maximum angle to 90 degrees
or lower would preserve right angles in the geometry.

Parameters
..........

``Input layer`` [vector: polygon, line]
  Polygon or line vector to smooth.

``Iterations`` [number]
  With many iterations the resulting layer will have many nodes.

  Default: *1*

  .. figure:: /static/user_manual/processing_algs/qgis/smooth_geometry_1.png
     :align: center

     Different number of iterations cause smoother geometries

``Offset`` [number]
  Larger values will *move* the resulting layer borders from the input layer ones.

  Default: *0.25*

  .. figure:: /static/user_manual/processing_algs/qgis/smooth_geometry_2.png
     :align: center

     In blue the input layer. Offset value of 0.25 results in the red line while
     offset value of 0.50 results in the green line

``Maximum angle to smooth`` [number]
  Every node below this value will be smoothed.

  Default: *180*

Outputs
.......

``Smoothed`` [vector: polygon or line]
  The smoothed vector layer.

Console usage
.............

::

  processing.runalg('qgis:simplifygeometries', input, tolerance, output)


.. _qgis_subdivide:

Subdivide
---------
Subdivides the geometry. The returned geometry will be a collection containing
subdivided parts from the original geometry, where no part has more then the
specified maximum number of nodes.

This is useful for dividing a complex geometry into less complex parts, which are
better able to be spatially indexed and faster to perform further operations such
as intersects on. The returned geometry parts may not be valid and may contain
self-intersections.

Curved geometries will be segmentized before subdivision.

.. figure:: /static/user_manual/processing_algs/qgis/subdivide.png
   :align: center

   Left the input layer, middle maximum nodes value is 100 and right maximum value
   is 200


Parameters
..........

``Input layer`` [vector: any]

``Maximum nodes in parts`` [number]
  Less *sub-parts* for higher values

  Default: *256*

Outputs
.......

``Subdivided`` [vector: any]
  Output vector with *sub-parts*.

Console usage
.............

::

  processing.runalg('qgis:simplifygeometries', input, tolerance, output)
