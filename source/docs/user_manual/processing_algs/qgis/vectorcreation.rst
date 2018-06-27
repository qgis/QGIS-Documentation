.. only:: html

   |updatedisclaimer|

Vector creation
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgiscreategrid:

Create grid
-----------
Creates a vector layer with a grid covering a given extent. Grid cells can have
different shapes:

.. figure:: img/create_grid.png
  :align: center

  Different grid cell shapes

The size of each element in the grid is defined using a horizontal and vertical
spacing.

The CRS of the output layer must be defined.

The grid extent and the spacing values must be expressed in the coordinates and
units of this CRS.

``Default menu``: :menuselection:`Vector --> Analysis Tools`

Parameters
..........

``Grid type`` [enumeration]
  Shape of the grid. Many options available:

  * Point
  * Line
  * Rectangle (polygon)
  * Diamond (polygon)
  * Hexagon (polygon)

``Grid extent`` [extent]
  Extent of the grid

``Horizontal spacing`` [number]
  X-axis spacing between the lines.

  Default: *0.000100*

``Vertical spacing`` [number]
  Y-axis spacing between the lines.

  Default: *0.000100*

``Horizontal overlay`` [number]
  X-axis overlay

  Default: *0.0*

``Vertical overlay`` [number]
  Y-axis overlay

  Default: *0.0*

``Grid CRS`` [crs]
  Coordinate reference system for grid

  Default: *Project CRS*

Outputs
.......

``Grid`` [vector]
  Resulting grid layer


.. _qgiscreatepointslayerfromtable:

Create points layer from table
------------------------------
Creates points layer from geometryless table with columns that contain coordinates
fields.

Besides X and Y coordinates you can also specify Z and M field.

Parameters
..........

``Input layer`` [table]
  Input table

``X field`` [tablefield: any]
  Table field containing the X coordinate.

``Y field`` [tablefield: any]
  Table field containing the Y coordinate.

``Z field`` [tablefield: any]
  Optional
  Table field containing the Z coordinate.

``M field`` [tablefield: any]
  Optional

  Table field containing the M coordinate.

``Target CRS`` [crs]
  Coordinate reference system to use for layer.

  Default: *EPSG:4326*

Outputs
.......

``Points from table`` [vector: points]
  The resulting layer.


.. _qgisgeneratepointspixelcentroidsalongline:

Generate points (pixel centroids) along line
--------------------------------------------
Generates a point vector layer from an input raster and line layer.

The points correspond to the pixel centroids that intersect the line layer


.. figure:: img/points_centroids.png
  :align: center

  Points of the pixel centroids

Parameters
..........

``Raster layer`` [raster]
  Raster layer in input

``Vector layer`` [vector: line]
  Line vector layer

Outputs
.......

``Points from polygons`` [vector: points]
  Resulting point layer of pixel centroid



.. _qgisgeneratepointspixelcentroidsinsidepolygons:

Generate points (pixel centroids) inside polygon
------------------------------------------------
Generates a point vector layer from an input raster and polygon layer.

The points correspond to the pixel centroids that intersect the polygon layer


.. figure:: img/points_centroids_polygon.png
  :align: center

  Points of the pixel centroids

Parameters
..........

``Raster layer`` [raster]
  Raster layer in input

``Vector layer`` [vector: polygon]
  Polygon vector layer

Outputs
.......

``Points from polygons`` [vector: points]
  Resulting point layer of pixel centroid


.. _qgispointstopath:

Points to path
--------------
Converts a point layer to a line layer, by joining points in a defined order.

Points can be grouped by a field to output individual line features per group.

Parameters
..........

``Input point layer`` [vector: point]
  point vector layer to be converted

``Order field`` [tablefield: any]
  Table field containing the order of the points

``Group field`` [tablefield: any]
  Optional

  Table field containing the group field of the points

``Date format (if order field is DateTime)`` [string]
  Optional.

  Choose this option if the points are ordered in a DateTime field

  Default: *(not set)*

Outputs
.......

``Paths`` [vector: line]
  Line vector layer of the path

``Directory for text output`` [directory]
  Directory containing description files of points and paths


.. _qgisrandompointsalongline:

Random points along line
------------------------
Creates a new point layer, with points placed in the lines of another layer.

For each line in the input layer, a given number of points is added to the resulting
layer.

A minimum distance can be specified to avoid point being too close to each other.

Parameters
..........

``Input layer`` [vector: line]
  Line vector layer in input

``Number of points`` [number]
  Number of point to create

  Default: *1*

``Minimum distance`` [number]
  A minimum distance that points must respect

  Default: *0.0*

Outputs
.......

``Random points`` [vector: point]
  Final random point layer along line


.. _qgisrandompointsinextent:

Random points in extent
-----------------------
Creates a new point layer with a given number of random points, all of them within
a given extent.

A distance factor can be specified, to avoid points being too close to each other.

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Input extent`` [extent]
  Map extent for the random points

``Points number`` [number]
  Number of point to create

  Default: *1*

``Minimum distance`` [number]
  A minimum distance that points must respect

  Default: *0.0*

``Target CRS`` [crs]
  CRS of the random points layer

Outputs
.......

``Random points`` [vector: point]
  Final random point layer in extent


.. _qgisrandompointsinlayerbounds:

Random points in layer bounds
-----------------------------
Creates a new point layer with a given number of random points, all of them within
the extent of a given layer.

A distance factor can be specified, to avoid points being too close to each other.

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Input layer`` [vector: polygon]
  Input polygon layer for the extent

``Points number`` [number]
  Number of point to create

  Default: *1*

``Minimum distance`` [number]
  A minimum distance that points must respect

  default: *0.0*


Outputs
.......

``Random points`` [vector: point]
  Final random point layer in layer bounds


.. _qgisrandompointsinsidepolygons:

Random points inside polygons
-----------------------------
Creates a new point layer with a given number of random points, all of them within
a given layer.

Together with the point number. two different sampling strategies can be chosen.

A distance factor can be specified, to avoid points being too close to each other.

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Input layer`` [vector: polygon]
  Polygon vector layer in input. All the points will be created withing each
  feature of this layer.

``Sampling strategy`` [enumeration]
  Choose between:

  * Points count: number of points for each feature
  * points density: density of points for each feature

  Options:

  * 0 --- Points count
  * 1 --- Points density

  Default: *0*

``Number or density of points`` [expression]
  You can choose the points number also with an expression

  Default: *1.0*

``Minimum distance`` [number]
  A minimum distance that points must respect

  default: *0.0*

Outputs
.......

``Random points`` [vector: point]
  Final random point layer inside polygon


.. _qgisregularpoints:

Regular points
--------------
Creates a new point layer with a given number of regular points, all of them within
a given extent.

Together with the point number. two different sampling strategies can be chosen.

A distance factor can be specified, to avoid points being too close to each other.

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Input extent`` [extent]
  Map extent for the random points

``Point spacing/count`` [number]
  Spacing between the points

  Default: *100*

``Initial inset from corner (LH side)`` [number]
  Choose to move the initial points coordinate from the left upper corner

  Default: *0.0*

``Apply random offset to point spacing`` [boolean]
  If checked the points will have a random spacing

  Default: *False*

``Use point spacing`` [boolean]
  In unchecked the point spacing is not taken inot account

  Default: *True*

Outputs
.......

``Regular points`` [vector: point]
  Regular point layer in output


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
