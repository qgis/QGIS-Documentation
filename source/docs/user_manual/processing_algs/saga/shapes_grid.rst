|updatedisclaimer|

Shapes grid
===========

Add grid values to points
-------------------------

Description
...........

Creates a new vector layer as a result of the union of a points layer with the
interpolated value of one or more base background grid layer(s). This way, the
new layer created will have a new column in the attribute table that reflects
the interpolated value of the background grid.

Parameters
..........

``Points`` [vector: point]
  Input layer.

``Grids`` [multipleinput: rasters]
  Background grid layer(s)

``Interpolation`` [selection]
  interpolation method to use.

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

Outputs
.......

``Result`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:addgridvaluestopoints', shapes, grids, interpol, result)

See also
........

Add grid values to shapes
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Shapes`` [vector: any]
  <put parameter description here>

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

Outputs
.......

``Result`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:addgridvaluestoshapes', shapes, grids, interpol, result)

See also
........

Clip grid with polygon
----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input`` [raster]
  <put parameter description here>

``Polygons`` [vector: polygon]
  <put parameter description here>

Outputs
.......

``Output`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:clipgridwithpolygon', input, polygons, output)

See also
........

Contour lines from grid
-----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Minimum Contour Value`` [number]
  <put parameter description here>

  Default: *0.0*

``Maximum Contour Value`` [number]
  <put parameter description here>

  Default: *10000.0*

``Equidistance`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
.......

``Contour Lines`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:contourlinesfromgrid', input, zmin, zmax, zstep, contour)

See also
........

Gradient vectors from directional components
--------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``X Component`` [raster]
  <put parameter description here>

``Y Component`` [raster]
  <put parameter description here>

``Step`` [number]
  <put parameter description here>

  Default: *1*

``Size Range Min`` [number]
  <put parameter description here>

  Default: *25.0*

``Size Range Max`` [number]
  <put parameter description here>

  Default: *100.0*

``Aggregation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] nearest neighbour
  * 1 --- [1] mean value

  Default: *0*

``Style`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] simple line
  * 1 --- [1] arrow
  * 2 --- [2] arrow (centered to cell)

  Default: *0*

Outputs
.......

``Gradient Vectors`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gradientvectorsfromdirectionalcomponents', x, y, step, size_min, size_max, aggr, style, vectors)

See also
........

Gradient vectors from direction and length
------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Direction`` [raster]
  <put parameter description here>

``Length`` [raster]
  <put parameter description here>

``Step`` [number]
  <put parameter description here>

  Default: *1*

``Size Range Min`` [number]
  <put parameter description here>

  Default: *25.0*

``Size Range Max`` [number]
  <put parameter description here>

  Default: *100.0*

``Aggregation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] nearest neighbour
  * 1 --- [1] mean value

  Default: *0*

``Style`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] simple line
  * 1 --- [1] arrow
  * 2 --- [2] arrow (centered to cell)

  Default: *0*

Outputs
.......

``Gradient Vectors`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gradientvectorsfromdirectionandlength', dir, len, step, size_min, size_max, aggr, style, vectors)

See also
........

Gradient vectors from surface
-----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Surface`` [raster]
  <put parameter description here>

``Step`` [number]
  <put parameter description here>

  Default: *1*

``Size Range Min`` [number]
  <put parameter description here>

  Default: *25.0*

``Size Range Max`` [number]
  <put parameter description here>

  Default: *100.0*

``Aggregation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] nearest neighbour
  * 1 --- [1] mean value

  Default: *0*

``Style`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] simple line
  * 1 --- [1] arrow
  * 2 --- [2] arrow (centered to cell)

  Default: *0*

Outputs
.......

``Gradient Vectors`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gradientvectorsfromsurface', surface, step, size_min, size_max, aggr, style, vectors)

See also
........

Grid statistics for polygons
----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Polygons`` [vector: polygon]
  <put parameter description here>

``Number of Cells`` [boolean]
  <put parameter description here>

  Default: *True*

``Minimum`` [boolean]
  <put parameter description here>

  Default: *True*

``Maximum`` [boolean]
  <put parameter description here>

  Default: *True*

``Range`` [boolean]
  <put parameter description here>

  Default: *True*

``Sum`` [boolean]
  <put parameter description here>

  Default: *True*

``Mean`` [boolean]
  <put parameter description here>

  Default: *True*

``Variance`` [boolean]
  <put parameter description here>

  Default: *True*

``Standard Deviation`` [boolean]
  <put parameter description here>

  Default: *True*

``Quantiles`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Statistics`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gridstatisticsforpolygons', grids, polygons, count, min, max, range, sum, mean, var, stddev, quantile, result)

See also
........

Grid values to points (randomly)
--------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Frequency`` [number]
  <put parameter description here>

  Default: *100*

Outputs
.......

``Points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gridvaluestopointsrandomly', grid, freq, points)

See also
........

Grid values to points
---------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Polygons`` [vector: any]
  Optional.

  <put parameter description here>

``Exclude NoData Cells`` [boolean]
  <put parameter description here>

  Default: *True*

``Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] nodes
  * 1 --- [1] cells

  Default: *0*

Outputs
.......

``Shapes`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gridvaluestopoints', grids, polygons, nodata, type, shapes)

See also
........

Local minima and maxima
-----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

Outputs
.......

``Minima`` [vector]
  <put output description here>

``Maxima`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:localminimaandmaxima', grid, minima, maxima)

See also
........

Vectorising grid classes
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Class Selection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] one single class specified by class identifier
  * 1 --- [1] all classes

  Default: *0*

``Class Identifier`` [number]
  <put parameter description here>

  Default: *0*

``Vectorised class as...`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] one single (multi-)polygon object
  * 1 --- [1] each island as separated polygon

  Default: *0*

Outputs
.......

``Polygons`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:vectorisinggridclasses', grid, class_all, class_id, split, polygons)

See also
........

