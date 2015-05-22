|updatedisclaimer|

Vector analysis
===============

Count points in polygon
-----------------------

Description
...........

Counts the number of points present in each feature of a polygon layer.

Parameters
..........

``Polygons`` [vector: polygon]
  Polygons layer.

``Points`` [vector: point]
  Points layer.

``Count field name`` [string]
  The name of the attribute table column containing the points number.

  Default: *NUMPOINTS*

Outputs
.......

``Result`` [vector]
  Resulting layer with the attribute table containing the new column of the
  points count.

Console usage
.............

::

  processing.runalg('qgis:countpointsinpolygon', polygons, points, field, output)

See also
........

Count points in polygon (weighted)
----------------------------------

Description
...........

Counts the number of points in each feature of a polygon layer and calculates
the mean of the selected field for each feature of the polygon layer. These
values will be added to the attribute table of the resulting polygon layer.

Parameters
..........

``Polygons`` [vector: polygon]
  Polygons layer.

``Points`` [vector: point]
  Points layer.

``Weight field`` [tablefield: any]
  Weight field of the points attribute table.

``Count field name`` [string]
  Name of the column for the new weighted field.

  Default: *NUMPOINTS*

Outputs
.......

``Result`` [vector]
  The resulting polygons layer.

Console usage
.............

::

  processing.runalg('qgis:countpointsinpolygonweighted', polygons, points, weight, field, output)

See also
........

Count unique points in polygon
------------------------------

Description
...........

Counts the number of unique values of a points in a polygons layer. Creates
a new polygons layer with an extra column in the attribute table containing
the count of unique values for each feature.

Parameters
..........

``Polygons`` [vector: polygon]
  Polygons layer.

``Points`` [vector: point]
  Points layer.

``Class field`` [tablefield: any]
  Points layer column name of the unique value chosen.

``Count field name`` [string]
  Column name containing the count of unique values in the resulting polygons
  layer.

  Default: *NUMPOINTS*

Outputs
.......

``Result`` [vector]
  The resulting polygons layer.

Console usage
.............

::

  processing.runalg('qgis:countuniquepointsinpolygon', polygons, points, classfield, field, output)

See also
........

Distance matrix
---------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input point layer`` [vector: point]
  <put parameter description here>

``Input unique ID field`` [tablefield: any]
  <put parameter description here>

``Target point layer`` [vector: point]
  <put parameter description here>

``Target unique ID field`` [tablefield: any]
  <put parameter description here>

``Output matrix type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Linear (N*k x 3) distance matrix
  * 1 --- Standard (N x T) distance matrix
  * 2 --- Summary distance matrix (mean, std. dev., min, max)

  Default: *0*

``Use only the nearest (k) target points`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Distance matrix`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:distancematrix', input_layer, input_field, target_layer, target_field, matrix_type, nearest_points, distance_matrix)

See also
........

Distance to nearest hub
-----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Source points layer`` [vector: any]
  <put parameter description here>

``Destination hubs layer`` [vector: any]
  <put parameter description here>

``Hub layer name attribute`` [tablefield: any]
  <put parameter description here>

``Output shape type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Point
  * 1 --- Line to hub

  Default: *0*

``Measurement unit`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Meters
  * 1 --- Feet
  * 2 --- Miles
  * 3 --- Kilometers
  * 4 --- Layer units

  Default: *0*

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:distancetonearesthub', points, hubs, field, geometry, unit, output)

See also
........

Generate points (pixel centroids) along line
--------------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Raster layer`` [raster]
  <put parameter description here>

``Vector layer`` [vector: line]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:generatepointspixelcentroidsalongline', input_raster, input_vector, output_layer)

See also
........

Generate points (pixel centroids) inside polygons
-------------------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Raster layer`` [raster]
  <put parameter description here>

``Vector layer`` [vector: polygon]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:generatepointspixelcentroidsinsidepolygons', input_raster, input_vector, output_layer)

See also
........

Hub lines
---------

Description
...........

Creates hub and spoke diagrams with lines drawn from points on the ``Spoke Point``
layer to matching points in the ``Hub Point`` layer. Determination of which
hub goes with each point is based on a match between the ``Hub ID field``
on the hub points and the ``Spoke ID field`` on the spoke points.

Parameters
..........

``Hub point layer`` [vector: any]
  <put parameter description here>

``Hub ID field`` [tablefield: any]
  <put parameter description here>

``Spoke point layer`` [vector: any]
  <put parameter description here>

``Spoke ID field`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Output`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('qgis:hublines', hubs, hub_field, spokes, spoke_field, output)

See also
........

Mean coordinate(s)
------------------

Description
...........

Calculates the mean of the coordinates of a layer starting from a field of the
attribute table.

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Weight field`` [tablefield: numeric]
  Optional.

  Field to use if you want to perform a weighted mean.

``Unique ID field`` [tablefield: numeric]
  Optional.

  Unique field on which the calculation of the mean will be made.

Outputs
.......

``Result`` [vector]
  The resulting points layer.

Console usage
.............

::

  processing.runalg('qgis:meancoordinates', points, weight, uid, output)

See also
........

Nearest neighbour analysis
--------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

Outputs
.......

``Result`` [html]
  <put output description here>

``Observed mean distance`` [number]
  <put output description here>

``Expected mean distance`` [number]
  <put output description here>

``Nearest neighbour index`` [number]
  <put output description here>

``Number of points`` [number]
  <put output description here>

``Z-Score`` [number]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:nearestneighbouranalysis', points, output)

See also
........

Sum line lengths
----------------

Description
...........

<put algortithm description here>

Parameters
..........

``Lines`` [vector: line]
  <put parameter description here>

``Polygons`` [vector: polygon]
  <put parameter description here>

``Lines length field name`` [string]
  <put parameter description here>

  Default: *LENGTH*

``Lines count field name`` [string]
  <put parameter description here>

  Default: *COUNT*

Outputs
.......

``Result`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:sumlinelengths', lines, polygons, len_field, count_field, output)

See also
........

