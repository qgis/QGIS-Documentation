|updatedisclaimer|

Grid calculus
=============

Function
--------

Description
...........

<put algorithm description here>

Parameters
..........

``xmin`` [number]
  <put parameter description here>

  Default: *0.0*

``xmax`` [number]
  <put parameter description here>

  Default: *0.0*

``ymin`` [number]
  <put parameter description here>

  Default: *0.0*

``ymax`` [number]
  <put parameter description here>

  Default: *0.0*

``Formula`` [string]
  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Function`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:function', xmin, xmax, ymin, ymax, formul, result)

See also
........

Fuzzify
-------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``A`` [number]
  <put parameter description here>

  Default: *0.0*

``B`` [number]
  <put parameter description here>

  Default: *0.0*

``C`` [number]
  <put parameter description here>

  Default: *0.0*

``D`` [number]
  <put parameter description here>

  Default: *0.0*

``Membership Function Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] linear
  * 1 --- [1] sigmoidal
  * 2 --- [2] j-shaped

  Default: *0*

``Adjust to Grid`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Fuzzified Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fuzzify', input, a, b, c, d, type, autofit, output)

See also
........

Fuzzy intersection (and)
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Operator Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] min(a, b) (non-interactive)
  * 1 --- [1] a * b
  * 2 --- [2] max(0, a + b - 1)

  Default: *0*

Outputs
.......

``Intersection`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fuzzyintersectionand', grids, type, and)

See also
........

Fuzzy union (or)
----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Operator Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] max(a, b) (non-interactive)
  * 1 --- [1] a + b - a * b
  * 2 --- [2] min(1, a + b)

  Default: *0*

Outputs
.......

``Union`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fuzzyunionor', grids, type, or)

See also
........

Geometric figures
-----------------

Description
...........

Draws simple geometric figures.

Parameters
..........

``Cell Count`` [number]
  Number of cells to use.

  Default: *0*

``Cell Size`` [number]
  Size of the single cell.

  Default: *0*

``Figure`` [selection]
  Type of the figure.

  Options:

  * 0 --- [0] Cone (up)
  * 1 --- [1] Cone (down)
  * 2 --- [2] Plane

  Default: *0*

``Direction of Plane [Degree]`` [number]
  Rotation factor in degrees.

  Default: *0*

Outputs
.......

``Result`` [raster]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:geometricfigures', cell_count, cell_size, figure, plane, result)

See also
........

Gradient vector from cartesian to polar coordinates
---------------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``X Component`` [raster]
  <put parameter description here>

``Y Component`` [raster]
  <put parameter description here>

``Polar Angle Units`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] radians
  * 1 --- [1] degree

  Default: *0*

``Polar Coordinate System`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] mathematical
  * 1 --- [1] geographical
  * 2 --- [2] user defined

  Default: *0*

``User defined Zero Direction`` [number]
  <put parameter description here>

  Default: *0.0*

``User defined Orientation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] clockwise
  * 1 --- [1] counterclockwise

  Default: *0*

Outputs
.......

``Direction`` [raster]
  <put output description here>

``Length`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gradientvectorfromcartesiantopolarcoordinates', dx, dy, units, system, system_zero, system_orient, dir, len)

See also
........

Gradient vector from polar to cartesian coordinates
---------------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Direction`` [raster]
  <put parameter description here>

``Length`` [raster]
  <put parameter description here>

``Polar Angle Units`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] radians
  * 1 --- [1] degree

  Default: *0*

``Polar Coordinate System`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] mathematical
  * 1 --- [1] geographical
  * 2 --- [2] user defined

  Default: *0*

``User defined Zero Direction`` [number]
  <put parameter description here>

  Default: *0.0*

``User defined Orientation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] clockwise
  * 1 --- [1] counterclockwise

  Default: *0*

Outputs
.......

``X Component`` [raster]
  <put output description here>

``Y Component`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gradientvectorfrompolartocartesiancoordinates', dir, len, units, system, system_zero, system_orient, dx, dy)

See also
........

Grid difference
---------------

Description
...........

Creates a new grid layer as the result of the difference between two other grid
layers.

Parameters
..........

``A`` [raster]
  First layer.

``B`` [raster]
  Second layer.

Outputs
.......

``Difference (A - B)`` [raster]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:griddifference', a, b, c)

See also
........

Grid division
-------------

Description
...........

Creates a new grid layer as the result of the division between two other grid
layers.

Parameters
..........

``Dividend`` [raster]
  First layer.

``Divisor`` [raster]
  Second layer.

Outputs
.......

``Quotient`` [raster]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:griddivision', a, b, c)

See also
........

Grid normalisation
------------------

Description
...........

Normalises the grid values according to minimum and maximum values chosen.

Parameters
..........

``Grid`` [raster]
  Grid to normalize.

``Target Range (min)`` [number]
  Minimum value.

  Default: *0*

``Target Range (max)`` [number]
  Maximum value.

  Default: *1*

Outputs
.......

``Normalised Grid`` [raster]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:gridnormalisation', input, range_min, range_max, output)

See also
........

Grids product
-------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

Outputs
.......

``Product`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gridsproduct', grids, result)

See also
........

Grids sum
---------

Description
...........

Creates a new grid layer as the result of the sum of two or more grid layers.

Parameters
..........

``Grids`` [multipleinput: rasters]
  Grid layers to sum

Outputs
.......

``Sum`` [raster]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:gridssum', grids, result)

See also
........

Grid standardisation
--------------------

Description
...........

Standardises the grid layer values.

Parameters
..........

``Grid`` [raster]
  Grid to process.

``Stretch Factor`` [number]
  stretching factor.

  Default: *1.0*

Outputs
.......

``Standardised Grid`` [raster]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:gridstandardisation', input, stretch, output)

See also
........

Grid volume
-----------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Count Only Above Base Level
  * 1 --- [1] Count Only Below Base Level
  * 2 --- [2] Subtract Volumes Below Base Level
  * 3 --- [3] Add Volumes Below Base Level

  Default: *0*

``Base Level`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

Console usage
.............

::

  processing.runalg('saga:gridvolume', grid, method, level)

See also
........

Metric conversions
------------------

Description
...........

Performs numerical conversions of the grid values.

Parameters
..........

``Grid`` [raster]
  Grid to process.

``Conversion`` [selection]
  Conversion type.

  Options:

  * 0 --- [0] radians to degree
  * 1 --- [1] degree to radians
  * 2 --- [2] Celsius to Fahrenheit
  * 3 --- [3] Fahrenheit to Celsius

  Default: *0*

Outputs
.......

``Converted Grid`` [raster]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:metricconversions', grid, conversion, conv)

See also
........

Polynomial trend from grids
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Dependent Variables`` [multipleinput: rasters]
  <put parameter description here>

``Independent Variable (per Grid and Cell)`` [multipleinput: rasters]
  Optional.

  <put parameter description here>

``Independent Variable (per Grid)`` [fixedtable]
  <put parameter description here>

``Type of Approximated Function`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] first order polynom (linear regression)
  * 1 --- [1] second order polynom
  * 2 --- [2] third order polynom
  * 3 --- [3] fourth order polynom
  * 4 --- [4] fifth order polynom

  Default: *0*

Outputs
.......

``Polynomial Coefficients`` [raster]
  <put output description here>

``Coefficient of Determination`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:polynomialtrendfromgrids', grids, y_grids, y_table, polynom, parms, quality)

See also
........

Random field
------------

Description
...........

Generates a random grid layer.

Parameters
..........

``Width (Cells)`` [number]
  Width of the layer in cells.

  Default: *100*

``Height (Cells)`` [number]
  Height of the layer in cells.

  Default: *100*

``Cellsize`` [number]
  Cell size to use.

  Default: *100.0*

``West`` [number]
  West coordinate of the bottom-left corner of the grid.

  Default: *0.0*

``South`` [number]
  South coordinate of the bottom-left corner of the grid.

  Default: *0.0*

``Method`` [selection]
  Statistical method used for the calculation.

  Options:

  * 0 --- [0] Uniform
  * 1 --- [1] Gaussian

  Default: *0*

``Range Min`` [number]
  Minimum cell value to use.

  Default: *0.0*

``Range Max`` [number]
  Maximum cell value to use.

  Default: *1.0*

``Arithmetic Mean`` [number]
  Mean of all the cell values to use.

  Default: *0.0*

``Standard Deviation`` [number]
  Standard deviation of all the cell values to use.

  Default: *1.0*

Outputs
.......

``Random Field`` [raster]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:randomfield', nx, ny, cellsize, xmin, ymin, method, range_min, range_max, mean, stddev, output)

See also
........

Random terrain generation
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Radius (cells)`` [number]
  <put parameter description here>

  Default: *10*

``Iterations`` [number]
  <put parameter description here>

  Default: *10*

``Target Dimensions`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] User defined

  Default: *0*

``Grid Size`` [number]
  <put parameter description here>

  Default: *1.0*

``Cols`` [number]
  <put parameter description here>

  Default: *100*

``Rows`` [number]
  <put parameter description here>

  Default: *100*

Outputs
.......

``Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:randomterraingeneration', radius, iterations, target_type, user_cell_size, user_cols, user_rows, target_grid)

See also
........

Raster calculator
-----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Main input layer`` [raster]
  <put parameter description here>

``Additional layers`` [multipleinput: rasters]
  Optional.

  <put parameter description here>

``Formula`` [string]
  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Result`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:rastercalculator', grids, xgrids, formula, result)

See also
........

