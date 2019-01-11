.. only:: html

   |updatedisclaimer|

Vector creation
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisarrayoffsetlines:

Array of offset (parallel) lines |34|
-------------------------------------
Creates copies of line features in a layer, by creating multiple offset versions
of each feature. Each new version is incrementally offset by a specified distance.

Positive distance will offset lines to the left, and negative distances will offset
them to the right.

.. figure:: img/offset_lines_array.png
   :align: center

   In blue the source layer, in red the offset one

|checkbox| Allows :ref:`features in-place modification <processing_inplace_edit>`

Parameters
..........

``Input layer`` [vector: line]
  Line vector layer in input to elaborate the offset on.

``Number of features to create`` [number |dataDefined|]
  Number of offset copies to generate for each feature.

  Default: *10*

``Offset step distance`` [number |dataDefined|]
  Distance between two consecutive offset copies.

  Default: *1.0*

``Segments`` [number]
  Number of line segments to use to approximate a quarter circle when creating
  rounded offsets.

  Default: *8*

``Join style`` [enumeration]
  Specify whether round, miter or beveled joins should be used when offsetting
  corners in a line.

  Options:

  * 0 --- Round
  * 1 --- Miter
  * 2 --- Bevel

  Default: *0*

``Miter limit`` [number]
  Only applicable for mitered join styles, and controls the maximum distance from
  the offset curve to use when creating a mitered join.

  Default: *2.0*

Outputs
.......

``Offset lines`` [vector: line]
  Output line layer with offset features.
  The original features are also copied.

See also
........
:ref:`qgisoffsetline`, :ref:`qgisarraytranslatedfeatures`


.. _qgisarraytranslatedfeatures:

Array of translated features |34|
---------------------------------
Creates copies of features in a layer, by creating multiple translated versions of each.
Each copy is incrementally displaced by a preset amount in the X, Y and/or Z axis.

M values present in the geometry can also be translated.

.. figure:: img/translate_array.png
   :align: center

   Input layers in blue tones, output layers with translated features in red tones

|checkbox| Allows :ref:`features in-place modification <processing_inplace_edit>`

Parameters
..........

``Input layer`` [vector: any]
  Vector layer to translate features.

``Number of features to create`` [number |dataDefined|]
  Number of copies to generate for each feature.

  Default: *10*

``Step distance (x-axis)`` [number |dataDefined|]
  Displacement to apply on the X axis.

  Default: *0.0*

``Step distance (y-axis)`` [number |dataDefined|]
  Displacement to apply on the Y axis.

  Default: *0.0*

``Step distance (z-axis)`` [number |dataDefined|]
  Displacement to apply on the Z axis.

  Default: *0.0*

``Step distance (m values)`` [number |dataDefined|]
  Offset value to apply on M.

  Default: *0.0*

Outputs
.......

``Translated`` [vector: any]
  Output vector layer with translated (moved) copies of the features.
  The original features are also copied.

See also
........
:ref:`qgistranslategeometry`, :ref:`qgisarrayoffsetlines`


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

``Default menu``: :menuselection:`Vector --> Research Tools`

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
  Extent of the grid.

``Horizontal spacing`` [number]
  Size of a grid cell on the X-axis.

  Default: *1.0*

``Vertical spacing`` [number]
  Size of a grid cell on the Y-axis.

  Default: *1.0*

``Horizontal overlay`` [number]
  Overlay distance between two consecutive grid cells on the X-axis.

  Default: *0.0*

``Vertical overlay`` [number]
  Overlay distance between two consecutive grid cells on the Y-axis.

  Default: *0.0*

``Grid CRS`` [crs]
  Coordinate reference system to apply to the grid.

  Default: *Project CRS*

Outputs
.......

``Grid`` [vector: any]
  Resulting vector grid layer.


.. _qgiscreatepointslayerfromtable:

Create points layer from table
------------------------------
Creates points layer from a table with columns that contain coordinates
fields.

Besides X and Y coordinates you can also specify Z and M fields.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer or geometryless table.

``X field`` [tablefield: any]
  Field containing the X coordinate.

``Y field`` [tablefield: any]
  Field containing the Y coordinate.

``Z field`` [tablefield: any]
  Optional

  Field containing the Z coordinate.

``M field`` [tablefield: any]
  Optional

  Field containing the M coordinate.

``Target CRS`` [crs]
  Coordinate reference system to use for layer.
  Provided coordinates are assumed to be compliant.

  Default: *EPSG:4326*

Outputs
.......

``Points from table`` [vector: point]
  The resulting point layer.


.. _qgisgeneratepointspixelcentroidsalongline:

Generate points (pixel centroids) along line
--------------------------------------------
Generates a point vector layer from an input raster and line layer.

The points correspond to the pixel centroids that intersect the line layer.


.. figure:: img/points_centroids.png
  :align: center

  Points of the pixel centroids

Parameters
..........

``Raster layer`` [raster]
  Raster layer in input.

``Vector layer`` [vector: line]
  Line vector layer to follow.

Outputs
.......

``Points from polygons`` [vector: point]
  Resulting point layer of pixel centroid.


.. _qgisgeneratepointspixelcentroidsinsidepolygons:

Generate points (pixel centroids) inside polygon
------------------------------------------------
Generates a point vector layer from an input raster and polygon layer.

The points correspond to the pixel centroids that intersect the polygon layer.


.. figure:: img/points_centroids_polygon.png
  :align: center

  Points of the pixel centroids

Parameters
..........

``Raster layer`` [raster]
  Raster layer in input.

``Vector layer`` [vector: polygon]
  Polygon vector layer.

Outputs
.......

``Points from polygons`` [vector: point]
  Resulting point layer of pixel centroid.


.. _qgisimportphotos:

Import geotagged photos |32|
----------------------------
Creates a point layer corresponding to the geotagged locations from JPEG images
from a source folder.

The point layer will contain a single PointZ feature per input file from which
the geotags could be read. Any altitude information from the geotags will be used
to set the point's Z value.

Besides longitude and latitude also altitude, direction and timestamp information,
if present in the photo, will be added to the point as attributes.

Parameters
..........

``Input folder`` [folder]
  Path to the source folder containing the geotagged photos.

``Scan recursively`` [boolean]
  If checked, the folder and its subfolders will be scanned.

Outputs
.......

``Photos`` [vector: point]
  Point vector layer with geotagged photos. The form of the layer is automatically
  filled with paths and photo previews settings.

``Invalid photos table`` [table]
  Optional

  Table of unreadable or non-geotagged photos can also be created.


.. _qgispointstopath:

Points to path
--------------
Converts a point layer to a line layer, by joining points in a defined order.

Points can be grouped by a field to output individual line features per group.

Parameters
..........

``Input point layer`` [vector: point]
  point vector layer to be converted.

``Order field`` [tablefield: any]
  Field containing the order to connect the points in the path.

``Group field`` [tablefield: any]
  Optional

  Point features of the same value in the field will be grouped in the same line.
  If not set, a single path is drawn with all the input points.

``Date format (if order field is DateTime)`` [string]
  Optional

  Indicates the format to use for the ``order field`` parameter.
  Fill this option only if the ``order field`` is of a Date/Time format.

  Default: *(not set)*

Outputs
.......

``Paths`` [vector: line]
  Line vector layer of the path.

``Directory for text output`` [folder]
  Directory containing description files of points and paths.


.. _qgisrandompointsalongline:

Random points along line
------------------------
Creates a new point layer, with points placed in the lines of another layer.

For each line in the input layer, a given number of points is added to the resulting
layer.

A minimum distance can be specified, to avoid points being too close to each other.

Parameters
..........

``Input layer`` [vector: line]
  Line vector layer in input.

``Number of points`` [number]
  Number of point to create.

  Default: *1*

``Minimum distance`` [number]
  A minimum distance that points must respect.

  Default: *0.0*

Outputs
.......

``Random points`` [vector: point]
  Final random point layer along line.


.. _qgisrandompointsinextent:

Random points in extent
-----------------------
Creates a new point layer with a given number of random points, all of them within
a given extent.

A minimum distance can be specified, to avoid points being too close to each other.

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Input extent`` [extent]
  Map extent for the random points.

``Points number`` [number]
  Number of point to create.

  Default: *1*

``Minimum distance`` [number]
  A minimum distance that points must respect.

  Default: *0.0*

``Target CRS`` [crs]
  CRS of the random points layer.

Outputs
.......

``Random points`` [vector: point]
  Final random point layer in extent.


.. _qgisrandompointsinlayerbounds:

Random points in layer bounds
-----------------------------
Creates a new point layer with a given number of random points, all of them within
the extent of a given layer.

A minimum distance can be specified, to avoid points being too close to each other.

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Input layer`` [vector: polygon]
  Input polygon layer for the extent.

``Points number`` [number]
  Number of point to create.

  Default: *1*

``Minimum distance`` [number]
  A minimum distance that points must respect.

  default: *0.0*


Outputs
.......

``Random points`` [vector: point]
  Final random point layer in layer bounds.


.. _qgisrandompointsinsidepolygons:

Random points inside polygons
-----------------------------
Creates a new point layer with a given number of random points, all of them within
a given layer.

Together with the point number. two different sampling strategies can be chosen.

A minimum distance can be specified, to avoid points being too close to each other.

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Input layer`` [vector: polygon]
  Polygon vector layer in input. All the points will be created withing each
  feature of this layer.

``Sampling strategy`` [enumeration]
  Choose between:

  * 0 --- Points count: number of points for each feature
  * 1 --- points density: density of points for each feature

  Default: *0*

``Number or density of points`` [expression]
  You can choose the points number also with an expression.

  Default: *1.0*

``Minimum distance`` [number]
  A minimum distance that points must respect.

  default: *0.0*

Outputs
.......

``Random points`` [vector: point]
  Final random point layer inside polygon.


.. _qgispixelstopoints:

Raster pixels to points |34|
----------------------------
Creates a vector layer of points corresponding to each pixel in a raster layer.

Converts a raster layer to a vector layer, by creating point features
for each individual pixel's center in the raster layer.
Any nodata pixels are skipped in the output.

Parameters
..........

``Raster layer`` [raster]
  Raster layer in input.

``Band number`` [raster band]
  Raster band to extract data from.

``Field name`` [string]
  Name of the field to store the raster band value.

  Default: *VALUE*

Outputs
.......

``Vector points`` [vector: point]
  Resulting point layer of pixels centroid.


.. _qgispixelstopolygons:

Raster pixels to polygons |34|
------------------------------
Creates a vector layer of polygons corresponding to each pixel in a raster layer.

Converts a raster layer to a vector layer, by creating polygon features
for each individual pixel's extent in the raster layer.
Any nodata pixels are skipped in the output.

Parameters
..........

``Raster layer`` [raster]
  Raster layer in input.

``Band number`` [raster band]
  Raster band to extract data from.

``Field name`` [string]
  Name of the field to store the raster band value.

  Default: *VALUE*

Outputs
.......

``Vector polygons`` [vector: polygon]
  Resulting polygon layer of pixels extent.


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
  Map extent for the random points.

``Point spacing/count`` [number]
  Spacing between the points.

  Default: *100*

``Initial inset from corner (LH side)`` [number]
  Choose to move the initial points coordinate from the left upper corner.

  Default: *0.0*

``Apply random offset to point spacing`` [boolean]
  If checked the points will have a random spacing.

  Default: *False*

``Use point spacing`` [boolean]
  If unchecked the point spacing is not taken into account.

  Default: *True*

Outputs
.......

``Regular points`` [vector: point]
  Regular point layer in output.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |32| replace:: ``NEW in 3.2``
.. |34| replace:: ``NEW in 3.4``
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |dataDefined| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
