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
Returns the closure of the combinatorial boundary of the input geometries (ie
the topological boundary of the geometry).

For **polygon geometries** , the boundary consists of all the line strings for
each ring of the polygon.

For **lines geometries**, the boundaries are the nodes between each features.

Only valid for polygon or line layers.

Parameters
..........

``Input layer`` [vector: line, polygon]
  Source layer to use.

Output
......

``Boundary`` [vector: point, line]
  Boundary from the input layer (point for line, and line for polygon).

.. figure:: /static/user_manual/processing_algs/qgis/boundary_lines.png
   :align: center

   Boundary layer for lines. In yellow one selected features

.. figure:: /static/user_manual/processing_algs/qgis/boundary_polygon.png
   :align: center

   Boundary for polygon. In light blue the polygon and in dark blue the boundary


Console usage
.............

::

  processing.runalg('qgis:boundary', input_layer, output_layer)


.. _qgis_bounding_boxes:

Bounding boxes
---------------

This algorithm calculates the bounding box (envelope) of each feature in an
input layer. Polygon and line geometries are supported.


.. figure:: /static/user_manual/processing_algs/qgis/bounding_box.png
   :align: center

   In green with light red strokes the features of the polygon, the black strokes
   represent the bounding boxes of each feature

Parameters
..........

``Input layer`` [vector: polygon, line]
  Vector layer

Outputs
.......

``Bounds`` [vector: poylgon]
  Bounding boxes of input layer.

Console usage
.............

::

  processing.runalg('qgis:boundingboxes', input_layer, output_layer)


.. _qgis_buffer:

Buffer
------
This algorithm computes a buffer area for all the features in an input layer,
using a fixed or dynamic distance.

The segments parameter controls the number of line segments to use to approximate
 a quarter circle when creating rounded offsets.

The end cap style parameter controls how line endings are handled in the buffer.
The join style parameter specifies whether round, mitre or beveled joins should
be used when offsetting corners in a line.

The mitre limit parameter is only applicable for mitre join styles, and controls
the maximum distance from the offset curve to use when creating a mitred join.

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


.. _qgis_centroids:

Centroids
---------
This algorithm creates a new point layer, with points representing the centroid
of the geometries of the inpu layer.

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

Console usage
.............

::

  processing.runalg('qgis:fixeddistancebuffer', input, distance, segments, dissolve, output)



.. _qgis_check_validity:

Check validity
--------------
This algorithm performs a validity check on the geometries of a vector layer.

The geometries are classified in three groups (valid, invalid and error) and a
vector layer is generated with the features in each of these categories.

The attribute table of each generated vector layer will contain some additional
information:

.. figure:: /static/user_manual/processing_algs/qgis/check_validity.png
   :align: center

   Left the input layer. Right: in blue the valid layer, in green the invalid layer
   and the red point identifies the exact error coordinates.

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

Console usage
.............

::

  processing.runalg('qgis:checkvalidity', input_layer, method, valid_output, invalid_output, error_output)




.. _qgis_delete_holes:

Delete holes
------------
This algorithm takes a polygon layer and removes holes in polygons. It creates a
new vector layer in which polygons with holes have been replaced by polygons with
only their external ring. Attributes are not modified.

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

Console usage
.............

::

  processing.runalg('qgis:densifygeometriesgivenaninterval', input, interval, output)


.. _qgis_densify_geometry_interval:

Densify geometries given an interval
------------------------------------
This algorithm takes a polygon or line layer and generates a new one in which the
geometries have a larger number of vertices than the original one.

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

Console usage
.............

::

  processing.runalg('qgis:densifygeometriesgivenaninterval', input, interval, output)

See also
........
To add a specific number of vertices, look at :ref:`qgis_densify_geometries`.


.. _qgis_densify_geometries:

Densify geometries
------------------
This algorithm takes a polygon or line layer and generates a new one in which the
geometries have a larger number of vertices than the original one.

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

Console usage
.............

::

  processing.runalg('qgis:densifygeometries', input, vertices, output)

See also
........
To add vertices at specific intervals look at :ref:`qgis_densify_geometry_interval`.


Dissolve
--------
This algorithm takes a polygon or line vector layer and combines their geometries
into new geometries. One or more attributes can be specified to dissolve only
geometries belonging to the same class (having the same value for the specified
attributes), alternatively all geometries can be dissolved.

If the geometries to be dissolved are spatially separated from each other the output
will be multi geometries. In case the input is a polygon layer, common boundaries
of adjacent polygons being dissolved will get erased.

The resulting attribute table will have the same fields of the input layer while
the features are truncated.

.. figure:: /static/user_manual/processing_algs/qgis/dissolve.png
   :align: center

   Dissolve the whole polygon layer

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

Console usage
.............

::

  processing.runalg('qgis:dissolve', input, dissolve_all, field, output)


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

Console usage
.............

::

  processing.runalg('qgis:keepnbiggestparts', polygons, to_keep, results)


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

Console usage
.............

::

  processing.runalg('qgis:keepnbiggestparts', polygons, to_keep, results)



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
  Multiparts input layer.

Outputs
.......

``Single parts`` [vector: any]
  Singlepart layer in output with updated attribute table.

Console usage
.............

::

  processing.runalg('qgis:multiparttosingleparts', input, output)



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
