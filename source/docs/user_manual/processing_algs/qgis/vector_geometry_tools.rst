|updatedisclaimer|

Vector geometry
===============

Concave hull
------------

Description
...........

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

Parameters
..........

``Input layer`` [vector: polygon, line]
  <put parameter description here>

``Dissolve all (do not use field)`` [boolean]
  <put parameter description here>

  Default: *True*

``Unique ID field`` [tablefield: any]
  Optional.

  <put parameter description here>

Outputs
.......

``Dissolved`` [vector]
  <put output description here>

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

<put algortithm description here>

Parameters
..........

``Input layer`` [vector: polygon]
  <put parameter description here>

``Use current selection in input layer (works only if called from toolbox)`` [boolean]
  <put parameter description here>

  Default: *False*

``Selection attribute`` [tablefield: any]
  <put parameter description here>

``Comparison`` [selection]
  <put parameter description here>

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
  <put parameter description here>

  Default: *0*

``Merge selection with the neighbouring polygon with the`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Largest area
  * 1 --- Smallest Area
  * 2 --- Largest common boundary

  Default: *0*

Outputs
.......

``Cleaned layer`` [vector]
  <put output description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

Multipart to singleparts
------------------------

Description
...........

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

<put algortithm description here>

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

