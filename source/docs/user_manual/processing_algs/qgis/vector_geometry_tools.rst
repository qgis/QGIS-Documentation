.. only:: html

   |updatedisclaimer|

Vector geometry
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1

Boundary
---------

Description
...........

Returns the closure of the combinatorial boundary of the input geometries (ie
the topological boundary of the geometry). For instance, a polygon geometry
will have a boundary consisting of the linestrings for each ring in the
polygon. Only valid for polygon or line layers.

Parameters
..........

``Input layer`` [vector: line, polygon]
  Source layer to use.

Output
......

``Output layer`` [vector: point, line]
  Boundary from the input layer (point for line, and line for polygon).

Console usage
.............

::

  processing.runalg('qgis:boundary', input_layer, output_layer)

See also
........


Bounding boxes
---------------

Description
............

This algorithm calculates the bounding box (envelope) of each feature in an
input layer.

Parameters
-----------

``Input layer`` [vector: any]
  Source layer to check.

Outputs
--------

``output_layer`` [vector: polygon]
  Output bounding boxes from input layer.

Console usage
.............

::

  processing.runalg('qgis:boundingboxes', input_layer, output_layer)

See also
........


Check validity
--------------

Description
...........

Check features geometry validity.

Parameters
..........

``Input layer`` [vector: any]
  Source layer to check.

``Method`` [selection]
  Check validity method.

  Options:

  * 0 --- The one selected in digitizing settings
  * 1 --- QGIS
  * 2 --- GEOS

  Default: *0*

Outputs
.......

``Valid output`` [vector]
  Output valid features, unchanged.

``Invalid output`` [vector]
  Output invalid features, with an additional *_errors* field describing the validity problems.

``Error output`` [vector]
  Output exact position on the validity problems as a point layer with a *message* field.

Console usage
.............

::

  processing.runalg('qgis:checkvalidity', input_layer, method, valid_output, invalid_output, error_output)

See also
........

Concave hull
------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input point layer`` [vector: point]
  <put parameter description here>

``Threshold (0-1, where 1 is equivalent with Convex Hull)`` [number]
  <put parameter description here>

  Default: *0.3*

``Allow holes`` [boolean]
  <put parameter description here>

  Default: *True*

``Split multipart geometry into singleparts geometries`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
.......

``Concave hull`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:concavehull', input, alpha, holes, no_multigeometry, output)

See also
........

Convert geometry type
---------------------

Description
...........

Converts a geometry type to another one.

Parameters
..........

``Input layer`` [vector: any]
  Layer in input.

``New geometry type`` [selection]
  Type of conversion to perform.

  Options:

  * 0 --- Centroids
  * 1 --- Nodes
  * 2 --- Linestrings
  * 3 --- Multilinestrings
  * 4 --- Polygons

  Default: *0*

Outputs
.......

``Output`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('qgis:convertgeometrytype', input, type, output)

See also
........

Convex hull
-----------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Field (optional, only used if creating convex hulls by classes)`` [tablefield: any]
  Optional.

  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Create single minimum convex hull
  * 1 --- Create convex hulls based on field

  Default: *0*

Outputs
.......

``Convex hull`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:convexhull', input, field, method, output)

See also
........

Create points along lines
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``lines`` [vector: any]
  <put parameter description here>

``distance`` [number]
  <put parameter description here>

  Default: *1*

``startpoint`` [number]
  <put parameter description here>

  Default: *0*

``endpoint`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:createpointsalonglines', lines, distance, startpoint, endpoint, output)

See also
........

Delaunay triangulation
----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: point]
  <put parameter description here>

Outputs
.......

``Delaunay triangulation`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:delaunaytriangulation', input, output)

See also
........

Densify geometries given an interval
------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: polygon, line]
  <put parameter description here>

``Interval between Vertices to add`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Densified layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:densifygeometriesgivenaninterval', input, interval, output)

See also
........

Densify geometries
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: polygon, line]
  <put parameter description here>

``Vertices to add`` [number]
  <put parameter description here>

  Default: *1*

Outputs
.......

``Densified layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:densifygeometries', input, vertices, output)

See also
........

Dissolve
--------

Description
...........

This algorithm takes a polygon or line vector layer and combines their geometries
into new geometries. One or more attributes can be specified to dissolve only
geometries belonging to the same class (having the same value for the specified
attributes), alternatively all geometries can be dissolved.

If the geometries to be dissolved are spatially separated from each other the output
will be multi geometries. In case the input is a polygon layer, common boundaries
of adjacent polygons being dissolved will get erased.

Parameters
..........

``Input layer`` [vector: polygon, line]
  Line or polygon layer to be dissolved.

``Dissolve all (do not use field)`` [boolean]
  Dissolve all geometries; values in the output layer's fields are the ones of
  the first input feature that happens to be processed. Returns one feature whose geometry
  represents all geometries of the input layer.

  Default: *True*

``Unique ID fields`` [tablefield: any]
  Optional.

  If features share a common value in all selected field(s) their geometries will be combined.
  Values in the output layer's fields are the ones of the first input feature that happens to be processed.
  Returns one feature for each unique value in the field. The feature's
  geometry represents all input geometries with this value.

Outputs
.......

``Dissolved`` [vector]
  output layer, either (multi) line or (multi) polygon

Console usage
.............

::

  processing.runalg('qgis:dissolve', input, dissolve_all, field, output)

See also
........

Eliminate sliver polygons
-------------------------

Description
...........

This algorithm combines selected polygons of the input layer with certain adjacent polygons
by erasing their common boundary. Eliminate can either use an
existing selection or a logical query based on one of the layer's fields to make the selection itself.
The adjacent polygon can be either the one with the largest or smallest area or the one sharing the
largest common boundary with the polygon to be eliminated.
Eliminate is normally used to get rid of sliver polygons, i.e. tiny
polygons that are a result of polygon intersection processes where boundaries of the inputs
are similar but not identical.

Parameters
..........

``Input layer`` [vector: polygon]
  Polygon layer in which polygons should be eliminated.

``Use current selection in input layer (works only if called from toolbox)`` [boolean]
  Check this if you want the currently selected polygons to be eliminated.

  Default: *False*

``Selection attribute`` [tablefield: any]
  Field to be used for the logical selection.

``Comparison`` [selection]
  Comparison parameter to be used for the logical selection.

  Options:

  * 0 --- ==
  * 1 --- !=
  * 2 --- >
  * 3 --- >=
  * 4 --- <
  * 5 --- <=
  * 6 --- begins with
  * 7 --- contains

  Default: *0*

``Value`` [string]
  Value to be used for the logical selection.

  Default: *0*

``Merge selection with the neighbouring polygon with the`` [selection]
  Determines which adjacent polygon the polygon to be eliminated will be combined with.

  Options:

  * 0 --- Largest area
  * 1 --- Smallest Area
  * 2 --- Largest common boundary

  Default: *0*

Outputs
.......

``Cleaned layer`` [vector]
  output layer

Console usage
.............

::

  processing.runalg('qgis:eliminatesliverpolygons', input, keepselection, attribute, comparison, comparisonvalue, mode, output)

See also
........

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


.. _qgis_polygonize:

Polygonize
----------
Takes a lines layer and creates a polygon layer, with polygons generated from the
lines in the input layer.

.. note:: the line layer must have closed shapes in order to be transformed into
  a polygon

.. figure:: /static/user_manual/processing_algs/qgis/polygonize.png
   :align: center

   The yellow polygons generated from the closed lines

Parameters
..........

``Input layer`` [vector: line]
  Input line vector layer

``Keep table structure of line layer`` [boolean]
  Optional

  Check to copy the original attribute of the line layer

  Default: *False*

Output
......

``Polygons from lines`` [vector: polygon]
  Polygons from the source line layer
  

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
