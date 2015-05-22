|updatedisclaimer|

Shapes lines
============

Convert points to line(s)
-------------------------

Description
...........

Converts points to lines.

Parameters
..........

``Points`` [vector: point]
  Points to convert.

``Order by...`` [tablefield: any]
  Lines will be ordered following this field.

``Separate by...`` [tablefield: any]
  Lines will be grouped according to this field.

Outputs
.......

``Lines`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:convertpointstolines', points, order, separate, lines)

See also
........

Convert polygons to lines
-------------------------

Description
...........

Creates lines from polygons.

Parameters
..........

``Polygons`` [vector: polygon]
  Layer to process.

Outputs
.......

``Lines`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:convertpolygonstolines', polygons, lines)

See also
........

Line dissolve
-------------

Description
...........

<put algortithm description here>

Parameters
..........

``Lines`` [vector: any]
  <put parameter description here>

``1. Attribute`` [tablefield: any]
  <put parameter description here>

``2. Attribute`` [tablefield: any]
  <put parameter description here>

``3. Attribute`` [tablefield: any]
  <put parameter description here>

``Dissolve...`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] lines with same attribute value(s)
  * 1 --- [1] all lines

  Default: *0*

Outputs
.......

``Dissolved Lines`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:linedissolve', lines, field_1, field_2, field_3, all, dissolved)

See also
........

Line-polygon intersection
-------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Lines`` [vector: line]
  <put parameter description here>

``Polygons`` [vector: polygon]
  <put parameter description here>

``Output`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] one multi-line per polygon
  * 1 --- [1] keep original line attributes

  Default: *0*

Outputs
.......

``Intersection`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:linepolygonintersection', lines, polygons, method, intersect)

See also
........

Line properties
---------------

Description
...........

Calculates some information on each line of the layer.

Parameters
..........

``Lines`` [vector: line]
  Layer to analyze.

``Number of Parts`` [boolean]
  Determines whether to calculate number of segments in line.

  Default: *True*

``Number of Vertices`` [boolean]
  Determines whether to calculate number of vertices in line.

  Default: *True*

``Length`` [boolean]
  Determines whether to calculate total line lenght.

  Default: *True*

Outputs
.......

``Lines with Property Attributes`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:lineproperties', lines, bparts, bpoints, blength, output)

See also
........

Line simplification
-------------------

Description
...........

Simplyfies the geometry of a lines layer.

Parameters
..........

``Lines`` [vector: line]
  Layer to process.

``Tolerance`` [number]
  Simplification tolerance.

  Default: *1.0*

Outputs
.......

``Simplified Lines`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:linesimplification', lines, tolerance, output)

See also
........

