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

.. _qgis_polygons_to_lines:

Polygons to lines
-----------------
Takes a polygon layer and creates a line layer, with lines representing the rings
of the polygons in the input layer.

.. figure:: /static/user_manual/processing_algs/qgis/polygon_to_lines.png
   :align: center

   Black lines as the result of the algorithm

Parameters
..........

``Input layer`` [vector: polygon]
  Input polygon vector layer

Output
......

``Lines`` [vector: line]
  Lines from the polygon layer


.. _qgis_promote_to_multipart:

Promote to multipart
--------------------
Takes a vector layer with singlepart geometries and generates a new one in which
all geometries are multipart.

Input features which are already multipart features will remain unchanged.

This algorithm can be used to force geometries to multipart types in order to be
compatibility with data providers with strict singlepart/multipart compatibility
checks.

Parameters
..........

``Input layer`` [vector]
  Input vector layer

Output
......

``Multiparts`` [vector]
  Multiparts vector layer

See also
........
:ref:`qgis_aggregate` and :ref:`qgis_collect_geometries`


.. _qgis_rectangels_ovals_diamonds_fixed:

Rectangles, ovals, diamonds (fixed)
-----------------------------------
Creates a buffer area for all the features in an input layer with different shape
choice.

Parameters can vary depending on the shape chosen.

.. figure:: /static/user_manual/processing_algs/qgis/rectangles_ovals_diamond.png
   :align: center

   Different buffer shapes

Parameters
..........

``Input layer`` [vector: point]
  Input point vector layer

``Buffer shape`` [selection]
  Different shape available:

  * Rectangles
  * Ovals
  * Diamonds

  Default: *Rectangles*

``Width`` [number]
  Width of the buffer shape

  Default: *1.0*

``Height`` [number]
  Height of the buffer shape

  Default: *1.0*

``Rotation`` [number]
  Optional

  Rotation of the buffer shape

  Default: *0.0*

``Number of segment`` [number]
  How many segment should have the buffer shape

  Default: *36*

Outputs
.......

``Output`` [vector: polygon]
  Buffer shape in output

See also
........
:ref:`qgis_rectangels_ovals_diamonds_variable`


.. _qgis_rectangels_ovals_diamonds_variable:

Rectangles, ovals, diamonds (variable)
--------------------------------------
Creates a buffer area for all the features in an input layer with different shape
choice.

Buffer shape parameters are specified through attribute of the input layer.

.. figure:: /static/user_manual/processing_algs/qgis/rectangles_ovals_diamond_variable.png
   :align: center

   Different buffer shapes with different parameters

Parameters
..........

``Input layer`` [vector: point]
  Input point vector layer

``Buffer shape`` [selection]
  Different shape available:

  * Rectangles
  * Ovals
  * Diamonds

  Default: *Rectangles*

``Width`` [tablefield: numeric]
  Width of the buffer shape

  Default: *1.0*

``Height`` [tablefield: numeric]
  Height of the buffer shape

  Default: *1.0*

``Rotation`` [tablefield: numeric]
  Optional

  Rotation of the buffer shape

  Default: *0.0*

``Number of segment`` [number]
  How many segment should have the buffer shape

  Default: *36*

Outputs
.......

``Output`` [vector: polygon]
  Buffer shape in output

See also
........
:ref:`qgis_rectangels_ovals_diamonds_fixed`


.. _qgis_reverse_line:

Reverse line
------------
Inverts the direction of a line layer.

.. figure:: /static/user_manual/processing_algs/qgis/reverse_line.png
   :align: center

   Before and after the direction inversion

Parameters
..........

``Input layer`` [vector: line]
  Input line vector layer to invert the direction

Output
......

``Reversed`` [vector: line]
  Inverted line vector layer


.. _qgis_set_m_value:

Set M value
-----------
Sets the M value for geometries in a layer.

If M values already exist in the layer, they will be overwritten with the new value.
If no M values exist, the geometry will be upgraded to include M values and the
specified value used as the initial M value for all geometries.

Use the |identify|:sup:`Identify Features` button to check the added M value: the
results are available in the :guilabel:`Identify Results` dialog.


Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

Output
......

``M Added`` [vector]
  Vector layer in output with M value


.. _qgis_set_z_value:

Set Z value
-----------
Sets the Z value for geometries in a layer.

If Z values already exist in the layer, they will be overwritten with the new value.
If no Z values exist, the geometry will be upgraded to include Z values and the
specified value used as the initial Z value for all geometries.

Use the |identify|:sup:`Identify Features` button to check the added Z value: the
results are available in the :guilabel:`Identify Results` dialog.


Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

Output
......

``Z Added`` [vector]
  Vector layer in output with Z value


.. _qgis_simplify_geometries:

Simplify geometries
-------------------
Simplifies the geometries in a line or polygon layer. It creates a new layer with
the same features as the ones in the input layer, but with geometries containing
a lower number of vertices.

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


.. _qgis_single_side_buffer:

Single side buffer
------------------
Computes a buffer on lines by a specified distance on one side of the line only.


Buffer always results in a polygon layer.

.. figure:: /static/user_manual/processing_algs/qgis/single_side_buffer.png
   :align: center

   Left versus right side buffer on the same vector line layer

Parameters
..........

``Input layer`` [vector: line]
  Input line vector layer

``Distance`` [number]
  Distance radius of the buffer

  Default: *10.0*

``Side`` [selection]
  Choose which side the buffer should be created

  * Left
  * Right

  Default: *Left*

``Segments`` [number]
  Controls the number of line segments to use to approximate a quarter circle when
  creating rounded offsets

  Default: *5*

``Join style`` [selection]
  Specifies whether round, miter or beveled joins should be used when offsetting
  corners in a line.

  * Round
  * Miter
  * Bevel

  Default: *Round*

``Miter limit`` [number]
  Only applicable for miter join styles, and controls the maximum distance from
  the offset curve to use when creating a mitered join

  Default: *2.0*

Outputs
.......

``Buffer`` [vector: polygon]
  One side buffer polygon vector layer


.. _qgis_smooth_geometry:

Smooth geometry
---------------
Smooths the geometries in a line or polygon layer. It creates a new layer with
the same features as the ones in the input layer, but with geometries containing
a **higher number of vertices and corners** in the geometries smoothed out.

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

``Smoothed`` [vector]
  The smoothed vector layer.


.. _qgis_snap_geometry:

Snap geometry
-------------
Snaps the geometries in a layer.

Snapping can be done either to the geometries from another layer, or to geometries
within the same layer.

Vertices will be inserted or removed as required to make the geometries match the
reference geometries.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer to snap

``Reference layer`` [vector: any]
  Input vector layer to snap

``Tolerance`` [number]
  Control how close vertices need to be to the reference layer geometries before
  they are snapped

  Default: *10.0*

``Behavior`` [selection]
  Choose between different snapping options:

  * Prefer aligning nodes
  * Prefer closest point
  * Move end points only, prefer aligning nodes
  * Move end points only, prefer closest point
  * Snap end points to end points only

  Default: *Prefer aligning nodes*

Outputs
.......

``Snapped geometry`` [vector]
  Snapped geometry in output


.. _qgis_snap_points_to_grid:

Snap points to grid
-------------------
Modifies the coordinates of geometries in a vector layer, so that all points or
vertices are snapped to the closest point of the grid.

If the snapped geometry cannot be calculated (or is totally collapsed) the feature's
geometry will be cleared.

Note that snapping to grid may generate an invalid geometry in some corner cases.

Snapping can be performed on the X, Y, Z or M axis. A grid spacing of 0 for any
axis will disable snapping for that axis.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer to snap

``X Grid Spacing`` [number]
  X snapping parameter

  Default: *1.0*

``Y Grid Spacing`` [number]
  Y snapping parameter

  Default: *1.0*

``Z Grid Spacing`` [number]
  Z snapping parameter

  Default: *0.0*

``M Grid Spacing`` [number]
  M snapping parameter

  Default: *0.0*

Outputs
.......

``Snapped`` [vector]
  Snapped geometry in output


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


.. _qgis_transect:

Transect
--------
Creates transects on vertices for (multi)linestring.

A transect is a line oriented from an angle (by default perpendicular) to the
input polylines (at vertices).

Field(s) from feature(s) are returned in the transect with these new fields:

* TR_FID: ID of the original feature
* TR_ID: ID of the transect. Each transect have an unique ID
* TR_SEGMENT: ID of the segment of the linestring
* TR_ANGLE: Angle in degrees from the original line at the vertex
* TR_LENGTH: Total length of the transect returned
* TR_ORIENT: Side of the transect (only on the left or right of the line, or both side)

.. figure:: /static/user_manual/processing_algs/qgis/transect.png
   :align: center

   Dashed red lines represent the transect of the input line layer

Parameters
..........

``Input layer`` [vector: line]
  Input line vector layer

``Length of the transect`` [number]
  Length in map unit of the transect

  Default: *5.0*

``Angle in degrees from the original line at the vertices`` [number]
  Change the angle of the transect

  Default: *90.0*

``Side to create the transect`` [selection]
  Choose the side of the transect. Three different options available:

  * Left
  * Right
  * Both

  Default: *Left*

Outputs
.......

``Transect`` [vector: line]
  Transect of the source line vector layer


.. _qgis_translate_geometry:

Translate geometry
------------------
Creates an offset of the source layer depending on the parameters chosen.

.. figure:: /static/user_manual/processing_algs/qgis/translate_geometry.png
   :align: center

   Dashed lines represent the translated geometry of the input layer

Parameters
..........

``Input layer`` [vector: any]
  Vector layer in input

``Offset distance (x-axis)`` [number]
  X axis offset distance

  Default: *0.0*

``Offset distance (y-axis)`` [number]
  Y axis offset distance

  Default: *0.0*

Outputs
.......

``Translated`` [vector]
  Translated (offset) vector layer


.. _qgis_variable_distance_buffer:

Variable distance buffer
------------------------
Computes a buffer area for all the features in an input layer.

The size of the buffer for a given feature is defined by an attribute, so it allows
different features to have different buffer sizes.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

``Distance field`` [tablefield: numeric]
  Attribute for the distance radius of the buffer

``Segments`` [number]
  Controls the number of line segments to use to approximate a quarter circle when
  creating rounded offsets

  Default: *5*

``Dissolve result`` [boolean]
  Choose to dissolve the final buffer

  Default: *False*

  .. figure:: /static/user_manual/processing_algs/qgis/buffer_dissolve.png
     :align: center

     Normal and dissolved buffer

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


Outputs
.......

``Buffer`` [vector: polygon]
  Buffer polygon vector layer

See also
........
:ref:`qgis_buffer`


.. _qgis_voronoi_polygons:

Voronoi polygons
----------------
Takes a points layer and generates a polygon layer containing the Voronoi polygons
(known also as Thiessen polygons) corresponding to those input points.

Any location within a Voronoi polygon is closer to the associated point than to
any other point.

.. figure:: /static/user_manual/processing_algs/qgis/voronoi.png
   :align: center

   Voronoi polygons

Parameters
..........

``Input layer`` [vector: point]
  Input point vector layer

``Buffer region`` [number]
  Allow to extend the area of the Voronoi polygons

Outputs
.......

``Voronoi polygons`` [vector: polygon]
  Voronoi polygons of the input point vector layer
