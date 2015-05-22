|updatedisclaimer|

Shapes points
=============

Add coordinates to points
-------------------------

Description
...........

Adds the X and Y coordinates of feature in the attribute table of input layer.

Parameters
..........

``Points`` [vector: point]
  Input layer.

Outputs
.......

``Output`` [vector]
  Resulting layer with the updated attribute table.

Console usage
.............

::

  processing.runalg('saga:addcoordinatestopoints', input, output)

See also
........

Add polygon attributes to points
--------------------------------

Description
...........

Adds the specified field of the polygons layer to the attribute table of the
points layer. The new attributes added for each point depend on the value of
the background polygon layer.

Parameters
..........

``Points`` [vector: point]
  Points layer.

``Polygons`` [vector: polygon]
  Background polygons layer.

``Attribute`` [tablefield: any]
  Attribute of the polygons layer that will be added to the points layer.

Outputs
.......

``Result`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:addpolygonattributestopoints', input, polygons, field, output)

See also
........

Aggregate point observations
----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Reference Points`` [vector: any]
  <put parameter description here>

``ID`` [tablefield: any]
  <put parameter description here>

``Observations`` [table]
  <put parameter description here>

``X`` [tablefield: any]
  <put parameter description here>

``Y`` [tablefield: any]
  <put parameter description here>

``Track`` [tablefield: any]
  <put parameter description here>

``Date`` [tablefield: any]
  <put parameter description here>

``Time`` [tablefield: any]
  <put parameter description here>

``Parameter`` [tablefield: any]
  <put parameter description here>

``Maximum Time Span (Seconds)`` [number]
  <put parameter description here>

  Default: *60.0*

``Maximum Distance`` [number]
  <put parameter description here>

  Default: *0.002*

Outputs
.......

``Aggregated`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:aggregatepointobservations', reference, reference_id, observations, x, y, track, date, time, parameter, eps_time, eps_space, aggregated)

See also
........

Clip points with polygons
-------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Polygons`` [vector: polygon]
  <put parameter description here>

``Add Attribute to Clipped Points`` [tablefield: any]
  <put parameter description here>

``Clipping Options`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] one layer for all points
  * 1 --- [1] separate layer for each polygon

  Default: *0*

Outputs
.......

``Clipped Points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:clippointswithpolygons', points, polygons, field, method, clips)

See also
........

Convert lines to points
-----------------------

Description
...........

Converts lines layer into a points.

Parameters
..........

``Lines`` [vector: line]
  Lines layer to convert.

``Insert Additional Points`` [boolean]
  Determines whether to add additional nodes or not.

  Default: *True*

``Insert Distance`` [number]
  Distance between the additional points.

  Default: *1.0*

Outputs
.......

``Points`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:convertlinestopoints', lines, add, dist, points)

See also
........

Convert multipoints to points
-----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Multipoints`` [vector: point]
  <put parameter description here>

Outputs
.......

``Points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:convertmultipointstopoints', multipoints, points)

See also
........

Convex hull
-----------

Description
...........

<put algortithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Hull Construction`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] one hull for all shapes
  * 1 --- [1] one hull per shape
  * 2 --- [2] one hull per shape part

  Default: *0*

Outputs
.......

``Convex Hull`` [vector]
  <put output description here>

``Minimum Bounding Box`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:convexhull', shapes, polypoints, hulls, boxes)

See also
........

Distance matrix
---------------

Description
...........

Generates a distance matrix between each point of the input layer. A unique ID
will be created in the first row of the resulting matrix (symmetric matrix),
while every other cell reflects the distance between the points.

Parameters
..........

``Points`` [vector: point]
  Input layer.

Outputs
.......

``Distance Matrix Table`` [table]
  The resulting table.

Console usage
.............

::

  processing.runalg('saga:distancematrix', points, table)

See also
........

Fit n points to shape
---------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Shapes`` [vector: polygon]
  <put parameter description here>

``Number of points`` [number]
  <put parameter description here>

  Default: *10*

Outputs
.......

``Points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fitnpointstoshape', shapes, numpoints, points)

See also
........

Points filter
-------------

Description
...........

<put algortithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Radius`` [number]
  <put parameter description here>

  Default: *1*

``Minimum Number of Points`` [number]
  <put parameter description here>

  Default: *0*

``Maximum Number of Points`` [number]
  <put parameter description here>

  Default: *0*

``Quadrants`` [boolean]
  <put parameter description here>

  Default: *True*

``Filter Criterion`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] keep maxima (with tolerance)
  * 1 --- [1] keep minima (with tolerance)
  * 2 --- [2] remove maxima (with tolerance)
  * 3 --- [3] remove minima (with tolerance)
  * 4 --- [4] remove below percentile
  * 5 --- [5] remove above percentile

  Default: *0*

``Tolerance`` [number]
  <put parameter description here>

  Default: *0.0*

``Percentile`` [number]
  <put parameter description here>

  Default: *50*

Outputs
.......

``Filtered Points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:pointsfilter', points, field, radius, minnum, maxnum, quadrants, method, tolerance, percent, filter)

See also
........

Points thinning
---------------

Description
...........

<put algortithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Resolution`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Thinned Points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:pointsthinning', points, field, resolution, thinned)

See also
........

Remove duplicate points
-----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Points`` [vector: any]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Point to Keep`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] first point
  * 1 --- [1] last point
  * 2 --- [2] point with minimum attribute value
  * 3 --- [3] point with maximum attribute value

  Default: *0*

``Numeric Attribute Values`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] take value from the point to be kept
  * 1 --- [1] minimum value of all duplicates
  * 2 --- [2] maximum value of all duplicates
  * 3 --- [3] mean value of all duplicates

  Default: *0*

Outputs
.......

``Result`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:removeduplicatepoints', points, field, method, numeric, result)

See also
........

Separate points by direction
----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Number of Directions`` [number]
  <put parameter description here>

  Default: *4*

``Tolerance (Degree)`` [number]
  <put parameter description here>

  Default: *5*

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:separatepointsbydirection', points, directions, tolerance, output)

See also
........

