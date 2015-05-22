|updatedisclaimer|

Shapes polygons
===============

Convert lines to polygons
-------------------------

Description
...........

Converts lines to polygons.

Parameters
..........

``Lines`` [vector: line]
  Lines to convert.

Outputs
.......

``Polygons`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:convertlinestopolygons', lines, polygons)

See also
........

Convert polygon/line vertices to points
---------------------------------------

Description
...........

Converts the line or polygon vertices into points.

Parameters
..........

``Shapes`` [vector: any]
  Layer to process.

Outputs
.......

``Points`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:convertpolygonlineverticestopoints', shapes, points)

See also
........

Polygon centroids
-----------------

Description
...........

Calculates the centroids of polygons.

Parameters
..........

``Polygons`` [vector: polygon]
  Input layer.

``Centroids for each part`` [boolean]
  Determites whether centroids should be calculated for each part of multipart
  polygon or not.

  Default: *True*

Outputs
.......

``Centroids`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:polygoncentroids', polygons, method, centroids)

See also
........

Polygon dissolve
----------------

Description
...........

<put algortithm description here>

Parameters
..........

``Polygons`` [vector: polygon]
  <put parameter description here>

``1. Attribute`` [tablefield: any]
  Optional.

  <put parameter description here>

``2. Attribute`` [tablefield: any]
  Optional.

  <put parameter description here>

``3. Attribute`` [tablefield: any]
  Optional.

  <put parameter description here>

``Dissolve...`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] polygons with same attribute value
  * 1 --- [1] all polygons
  * 2 --- [2] polygons with same attribute value (keep inner boundaries)
  * 3 --- [3] all polygons (keep inner boundaries)

  Default: *0*

Outputs
.......

``Dissolved Polygons`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:polygondissolve', polygons, field_1, field_2, field_3, dissolve, dissolved)

See also
........

Polygon-line intersection
-------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Polygons`` [vector: polygon]
  <put parameter description here>

``Lines`` [vector: line]
  <put parameter description here>

Outputs
.......

``Intersection`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:polygonlineintersection', polygons, lines, intersect)

See also
........

Polygon parts to separate polygons
----------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Polygons`` [vector: polygon]
  <put parameter description here>

``Ignore Lakes`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Polygon Parts`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:polygonpartstoseparatepolygons', polygons, lakes, parts)

See also
........

Polygon properties
------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Polygons`` [vector: polygon]
  <put parameter description here>

``Number of Parts`` [boolean]
  <put parameter description here>

  Default: *True*

``Number of Vertices`` [boolean]
  <put parameter description here>

  Default: *True*

``Perimeter`` [boolean]
  <put parameter description here>

  Default: *True*

``Area`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Polygons with Property Attributes`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:polygonproperties', polygons, bparts, bpoints, blength, barea, output)

See also
........

Polygon shape indices
---------------------

Description
...........

Calculates spatial statistics for polygons. This includes:

* area
* perimeter
* perimeter / area
* perimeter / square root of the area
* maximum distance
* maximum distance / area
* maximum distance / square root of the area
* shape index

Parameters
..........

``Shapes`` [vector: polygon]
  Layer to analyze.

Outputs
.......

``Shape Index`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:polygonshapeindices', shapes, index)

See also
........

Polygons to edges and nodes
---------------------------

Description
...........

Extracts boundaries and nodes of polygons in separate files.

Parameters
..........

``Polygons`` [vector: polygon]
  Input layer.

Outputs
.......

``Edges`` [vector]
  Resulting line layer with polygons boundaries.

``Nodes`` [vector]
  Resulting line layer with polygons nodes.

Console usage
.............

::

  processing.runalg('saga:polygonstoedgesandnodes', polygons, edges, nodes)

See also
........

