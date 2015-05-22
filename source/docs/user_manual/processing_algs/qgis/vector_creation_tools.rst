|updatedisclaimer|

Vector creation
===============

Create grid
-----------

Description
...........

Creates a grid.

Parameters
..........

``Grid type`` [selection]
  Grid type.

  Options:

  * 0 --- Rectangle (line)
  * 1 --- Rectangle (polygon)
  * 2 --- Diamond (polygon)
  * 3 --- Hexagon (polygon)

  Default: *0*

``Width`` [number]
  Horizontal extent of the grid.

  Default: *360.0*

``Height`` [number]
  Vertical extent of the grid.

  Default: *180.0*

``Horizontal spacing`` [number]
  X-axes spacing between the lines.

  Default: *10.0*

``Vertical spacing`` [number]
  Y-axes spacing between the lines.

  Default: *10.0*

``Center X`` [number]
  X-coordinate of the grid center.

  Default: *0.0*

``Center Y`` [number]
  Y-coordinate of the grid center.

  Default: *0.0*

``Output CRS`` [crs]
  Coordinate reference system for grid.

  Default: *EPSG:4326*

Outputs
.......

``Output`` [vector]
  The resulting grid layer (lines or polygons).

Console usage
.............

::

  processing.runalg('qgis:creategrid', type, width, height, hspacing, vspacing, centerx, centery, crs, output)

See also
........

Points layer from table
-----------------------

Description
...........

Creates points layer from geometryless table with columns that contain point
coordinates.

Parameters
..........

``Input layer`` [table]
  Input table

``X field`` [tablefield: any]
  Table column containing the X coordinate.

``Y field`` [tablefield: any]
  Table column containing the Y coordinate.

``Target CRS`` [crs]
  Coordinate reference system to use for layer.

  Default: *EPSG:4326*

Outputs
.......

``Output layer`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('qgis:pointslayerfromtable', input, xfield, yfield, target_crs, output)

See also
........

Points to path
--------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input point layer`` [vector: point]
  <put parameter description here>

``Group field`` [tablefield: any]
  <put parameter description here>

``Order field`` [tablefield: any]
  <put parameter description here>

``Date format (if order field is DateTime)`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Paths`` [vector]
  <put output description here>

``Directory`` [directory]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:pointstopath', vector, group_field, order_field, date_format, output_lines, output_text)

See also
........

Random points along line
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: line]
  <put parameter description here>

``Number of points`` [number]
  <put parameter description here>

  Default: *1*

``Minimum distance`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Random points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:randompointsalongline', vector, point_number, min_distance, output)

See also
........

Random points in extent
-----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Points number`` [number]
  <put parameter description here>

  Default: *1*

``Minimum distance`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Random points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:randompointsinextent', extent, point_number, min_distance, output)

See also
........

Random points in layer bounds
-----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: polygon]
  <put parameter description here>

``Points number`` [number]
  <put parameter description here>

  Default: *1*

``Minimum distance`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Random points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:randompointsinlayerbounds', vector, point_number, min_distance, output)

See also
........

Random points inside polygons (fixed)
-------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: polygon]
  <put parameter description here>

``Sampling strategy`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Points count
  * 1 --- Points density

  Default: *0*

``Number or density of points`` [number]
  <put parameter description here>

  Default: *1.0*

``Minimum distance`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Random points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:randompointsinsidepolygonsfixed', vector, strategy, value, min_distance, output)

See also
........

Random points inside polygons (variable)
----------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: polygon]
  <put parameter description here>

``Sampling strategy`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Points count
  * 1 --- Points density

  Default: *0*

``Number field`` [tablefield: numeric]
  <put parameter description here>

``Minimum distance`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Random points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:randompointsinsidepolygonsvariable', vector, strategy, field, min_distance, output)

See also
........

Regular points
--------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Point spacing/count`` [number]
  <put parameter description here>

  Default: *0.0001*

``Initial inset from corner (LH side)`` [number]
  <put parameter description here>

  Default: *0.0*

``Apply random offset to point spacing`` [boolean]
  <put parameter description here>

  Default: *False*

``Use point spacing`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Regular points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:regularpoints', extent, spacing, inset, randomize, is_spacing, output)

See also
........

Vector grid
-----------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``X spacing`` [number]
  <put parameter description here>

  Default: *0.0001*

``Y spacing`` [number]
  <put parameter description here>

  Default: *0.0001*

``Grid type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Output grid as polygons
  * 1 --- Output grid as lines

  Default: *0*

Outputs
.......

``Grid`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:vectorgrid', extent, step_x, step_y, type, output)

See also
........

