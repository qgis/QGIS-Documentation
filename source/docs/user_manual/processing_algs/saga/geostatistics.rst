|updatedisclaimer|

Geostatistics
=============

Directional statistics for single grid
--------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Points`` [vector: any]
  Optional.

  <put parameter description here>

``Direction [Degree]`` [number]
  <put parameter description here>

  Default: *0.0*

``Tolerance [Degree]`` [number]
  <put parameter description here>

  Default: *0.0*

``Maximum Distance [Cells]`` [number]
  <put parameter description here>

  Default: *0*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Arithmetic Mean`` [raster]
  <put output description here>

``Difference from Arithmetic Mean`` [raster]
  <put output description here>

``Minimum`` [raster]
  <put output description here>

``Maximum`` [raster]
  <put output description here>

``Range`` [raster]
  <put output description here>

``Variance`` [raster]
  <put output description here>

``Standard Deviation`` [raster]
  <put output description here>

``Mean less Standard Deviation`` [raster]
  <put output description here>

``Mean plus Standard Deviation`` [raster]
  <put output description here>

``Deviation from Arithmetic Mean`` [raster]
  <put output description here>

``Percentile`` [raster]
  <put output description here>

``Directional Statistics for Points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:directionalstatisticsforsinglegrid', grid, points, direction, tolerance, maxdistance, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, mean, difmean, min, max, range, var, stddev, stddevlo, stddevhi, devmean, percent, points_out)

See also
........

Fast representativeness
-----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input`` [raster]
  <put parameter description here>

``Level of Generalisation`` [number]
  <put parameter description here>

  Default: *16*

Outputs
.......

``Output`` [raster]
  <put output description here>

``Output Lod`` [raster]
  <put output description here>

``Output Seeds`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fastrepresentativeness', input, lod, result, result_lod, seeds)

See also
........

Geographically weighted multiple regression (points/grids)
----------------------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Predictors`` [multipleinput: rasters]
  <put parameter description here>

``Output of Regression Parameters`` [boolean]
  <put parameter description here>

  Default: *True*

``Points`` [vector: point]
  <put parameter description here>

``Dependent Variable`` [tablefield: any]
  <put parameter description here>

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1.0*

``Search Range`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] search radius (local)
  * 1 --- [1] no search radius (global)

  Default: *0*

``Search Radius`` [number]
  <put parameter description here>

  Default: *100*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all directions
  * 1 --- [1] quadrants

  Default: *0*

``Number of Points`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] maximum number of observations
  * 1 --- [1] all points

  Default: *0*

``Maximum Number of Observations`` [number]
  <put parameter description here>

  Default: *10*

``Minimum Number of Observations`` [number]
  <put parameter description here>

  Default: *4*

Outputs
.......

``Regression`` [raster]
  <put output description here>

``Coefficient of Determination`` [raster]
  <put output description here>

``Regression Parameters`` [raster]
  <put output description here>

``Residuals`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:geographicallyweightedmultipleregressionpointsgrids', predictors, parameters, points, dependent, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, range, radius, mode, npoints, maxpoints, minpoints, regression, quality, slopes, residuals)

See also
........

Geographically weighted multiple regression (points)
----------------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: any]
  <put parameter description here>

``Dependent Variable`` [tablefield: any]
  <put parameter description here>

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1.0*

``Search Range`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] search radius (local)
  * 1 --- [1] no search radius (global)

  Default: *0*

``Search Radius`` [number]
  <put parameter description here>

  Default: *100*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all directions
  * 1 --- [1] quadrants

  Default: *0*

``Number of Points`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] maximum number of observations
  * 1 --- [1] all points

  Default: *0*

``Maximum Number of Observations`` [number]
  <put parameter description here>

  Default: *10*

``Minimum Number of Observations`` [number]
  <put parameter description here>

  Default: *4*

Outputs
.......

``Regression`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:geographicallyweightedmultipleregressionpoints', points, dependent, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, range, radius, mode, npoints, maxpoints, minpoints, regression)

See also
........

Geographically weighted multiple regression
-------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Dependent Variable`` [tablefield: any]
  <put parameter description here>

``Target Grids`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1*

``Search Range`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] search radius (local)
  * 1 --- [1] no search radius (global)

  Default: *0*

``Search Radius`` [number]
  <put parameter description here>

  Default: *100*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all directions
  * 1 --- [1] quadrants

  Default: *0*

``Number of Points`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] maximum number of observations
  * 1 --- [1] all points

  Default: *0*

``Maximum Number of Observations`` [number]
  <put parameter description here>

  Default: *10*

``Minimum Number of Observations`` [number]
  <put parameter description here>

  Default: *4*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Cellsize`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
.......

``Quality`` [raster]
  <put output description here>

``Intercept`` [raster]
  <put output description here>

``Quality`` [raster]
  <put output description here>

``Intercept`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:geographicallyweightedmultipleregression', points, dependent, target, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, range, radius, mode, npoints, maxpoints, minpoints, output_extent, user_size, user_quality, user_intercept, grid_quality, grid_intercept)

See also
........

Geographically weighted regression (points/grid)
------------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Predictor`` [raster]
  <put parameter description here>

``Points`` [vector: point]
  <put parameter description here>

``Dependent Variable`` [tablefield: any]
  <put parameter description here>

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1.0*

``Search Range`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] search radius (local)
  * 1 --- [1] no search radius (global)

  Default: *0*

``Search Radius`` [number]
  <put parameter description here>

  Default: *0*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all directions
  * 1 --- [1] quadrants

  Default: *0*

``Number of Points`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] maximum number of observations
  * 1 --- [1] all points

  Default: *0*

``Maximum Number of Observations`` [number]
  <put parameter description here>

  Default: *10*

``Minimum Number of Observations`` [number]
  <put parameter description here>

  Default: *4*

Outputs
.......

``Regression`` [raster]
  <put output description here>

``Coefficient of Determination`` [raster]
  <put output description here>

``Intercept`` [raster]
  <put output description here>

``Slope`` [raster]
  <put output description here>

``Residuals`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:geographicallyweightedregressionpointsgrid', predictor, points, dependent, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, range, radius, mode, npoints, maxpoints, minpoints, regression, quality, intercept, slope, residuals)

See also
........

Geographically weighted regression
----------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Dependent Variable`` [tablefield: any]
  <put parameter description here>

``Predictor`` [tablefield: any]
  <put parameter description here>

``Target Grids`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *0*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *0.0*

``Search Range`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] search radius (local)
  * 1 --- [1] no search radius (global)

  Default: *0*

``Search Radius`` [number]
  <put parameter description here>

  Default: *100*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all directions
  * 1 --- [1] quadrants

  Default: *0*

``Number of Points`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] maximum number of observations
  * 1 --- [1] all points

  Default: *0*

``Maximum Number of Observations`` [number]
  <put parameter description here>

  Default: *10*

``Minimum Number of Observations`` [number]
  <put parameter description here>

  Default: *4*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Cellsize`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
.......

``Grid`` [raster]
  <put output description here>

``Quality`` [raster]
  <put output description here>

``Intercept`` [raster]
  <put output description here>

``Slope`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:geographicallyweightedregression', points, dependent, predictor, target, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, range, radius, mode, npoints, maxpoints, minpoints, output_extent, user_size, user_grid, user_quality, user_intercept, user_slope)

See also
........

Global moran's i for grids
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Case of contiguity`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Rook
  * 1 --- [1] Queen

  Default: *0*

Outputs
.......

``Result`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:globalmoransiforgrids', grid, contiguity, result)

See also
........

Minimum distance analysis
-------------------------

Description
...........

Performs a complete distance analysis of a point layer:

* minimum distance of points
* maximum distance of points
* average distance of all the points
* standard deviation of the distance
* duplicated points

Parameters
..........

``Points`` [vector: point]
  Layer to analyze.

Outputs
.......

``Minimum Distance Analysis`` [table]
  The resulting table.

Console usage
.............

::

  processing.runalg('saga:minimumdistanceanalysis', points, table)

See also
........

Multi-band variation
--------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Radius [Cells]`` [number]
  <put parameter description here>

  Default: *1*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Mean Distance`` [raster]
  <put output description here>

``Standard Deviation`` [raster]
  <put output description here>

``Distance`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:multibandvariation', bands, radius, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, mean, stddev, diff)

See also
........

Multiple regression analysis (grid/grids)
-----------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Dependent`` [raster]
  <put parameter description here>

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Grid Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

``Include X Coordinate`` [boolean]
  <put parameter description here>

  Default: *True*

``Include Y Coordinate`` [boolean]
  <put parameter description here>

  Default: *True*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] include all
  * 1 --- [1] forward
  * 2 --- [2] backward
  * 3 --- [3] stepwise

  Default: *0*

``P in`` [number]
  <put parameter description here>

  Default: *5*

``P out`` [number]
  <put parameter description here>

  Default: *5*

Outputs
.......

``Regression`` [raster]
  <put output description here>

``Residuals`` [raster]
  <put output description here>

``Details: Coefficients`` [table]
  <put output description here>

``Details: Model`` [table]
  <put output description here>

``Details: Steps`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:multipleregressionanalysisgridgrids', dependent, grids, interpol, coord_x, coord_y, method, p_in, p_out, regression, residuals, info_coeff, info_model, info_steps)

See also
........

Multiple regression analysis (points/grids)
-------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Shapes`` [vector: any]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Grid Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

``Include X Coordinate`` [boolean]
  <put parameter description here>

  Default: *True*

``Include Y Coordinate`` [boolean]
  <put parameter description here>

  Default: *True*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] include all
  * 1 --- [1] forward
  * 2 --- [2] backward
  * 3 --- [3] stepwise

  Default: *0*

``P in`` [number]
  <put parameter description here>

  Default: *5*

``P out`` [number]
  <put parameter description here>

  Default: *5*

Outputs
.......

``Details: Coefficients`` [table]
  <put output description here>

``Details: Model`` [table]
  <put output description here>

``Details: Steps`` [table]
  <put output description here>

``Residuals`` [vector]
  <put output description here>

``Regression`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:multipleregressionanalysispointsgrids', grids, shapes, attribute, interpol, coord_x, coord_y, method, p_in, p_out, info_coeff, info_model, info_steps, residuals, regression)

See also
........

Polynomial regression
---------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: any]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Polynom`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] simple planar surface
  * 1 --- [1] bi-linear saddle
  * 2 --- [2] quadratic surface
  * 3 --- [3] cubic surface
  * 4 --- [4] user defined

  Default: *0*

``Maximum X Order`` [number]
  <put parameter description here>

  Default: *4*

``Maximum Y Order`` [number]
  <put parameter description here>

  Default: *4*

``Maximum Total Order`` [number]
  <put parameter description here>

  Default: *4*

``Trend Surface`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Cellsize`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
.......

``Residuals`` [vector]
  <put output description here>

``Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:polynomialregression', points, attribute, polynom, xorder, yorder, torder, target, output_extent, user_size, residuals, user_grid)

See also
........

Radius of variance (grid)
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Standard Deviation`` [number]
  <put parameter description here>

  Default: *1.0*

``Maximum Search Radius (cells)`` [number]
  <put parameter description here>

  Default: *20*

``Type of Output`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Cells
  * 1 --- [1] Map Units

  Default: *0*

Outputs
.......

``Variance Radius`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:radiusofvariancegrid', input, variance, radius, output, result)

See also
........

Regression analysis
-------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Shapes`` [vector: any]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Grid Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

``Regression Function`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Y = a + b * X (linear)
  * 1 --- [1] Y = a + b / X
  * 2 --- [2] Y = a / (b - X)
  * 3 --- [3] Y = a * X^b (power)
  * 4 --- [4] Y = a e^(b * X) (exponential)
  * 5 --- [5] Y = a + b * ln(X) (logarithmic)

  Default: *0*

Outputs
.......

``Regression`` [raster]
  <put output description here>

``Residuals`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:regressionanalysis', grid, shapes, attribute, interpol, method, regression, residual)

See also
........

Representativeness
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Radius (Cells)`` [number]
  <put parameter description here>

  Default: *10*

``Exponent`` [number]
  <put parameter description here>

  Default: *1*

Outputs
.......

``Representativeness`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:representativeness', input, radius, exponent, result)

See also
........

Residual analysis
-----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Radius (Cells)`` [number]
  <put parameter description here>

  Default: *7*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Mean Value`` [raster]
  <put output description here>

``Difference from Mean Value`` [raster]
  <put output description here>

``Standard Deviation`` [raster]
  <put output description here>

``Value Range`` [raster]
  <put output description here>

``Minimum Value`` [raster]
  <put output description here>

``Maximum Value`` [raster]
  <put output description here>

``Deviation from Mean Value`` [raster]
  <put output description here>

``Percentile`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:residualanalysis', grid, radius, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, mean, diff, stddev, range, min, max, devmean, percent)

See also
........

Spatial point pattern analysis
------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Vertex Distance [Degree]`` [number]
  <put parameter description here>

  Default: *5*

Outputs
.......

``Mean Centre`` [vector]
  <put output description here>

``Standard Distance`` [vector]
  <put output description here>

``Bounding Box`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:spatialpointpatternanalysis', points, step, centre, stddist, bbox)

See also
........

Statistics for grids
--------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

Outputs
.......

``Arithmetic Mean`` [raster]
  <put output description here>

``Minimum`` [raster]
  <put output description here>

``Maximum`` [raster]
  <put output description here>

``Variance`` [raster]
  <put output description here>

``Standard Deviation`` [raster]
  <put output description here>

``Mean less Standard Deviation`` [raster]
  <put output description here>

``Mean plus Standard Deviation`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:statisticsforgrids', grids, mean, min, max, var, stddev, stddevlo, stddevhi)

See also
........

Variogram cloud
---------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Maximum Distance`` [number]
  <put parameter description here>

  Default: *0.0*

``Skip Number`` [number]
  <put parameter description here>

  Default: *1*

Outputs
.......

``Variogram Cloud`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:variogramcloud', points, field, distmax, nskip, result)

See also
........

Variogram surface
-----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Number of Distance Classes`` [number]
  <put parameter description here>

  Default: *10*

``Skip Number`` [number]
  <put parameter description here>

  Default: *1*

Outputs
.......

``Number of Pairs`` [raster]
  <put output description here>

``Variogram Surface`` [raster]
  <put output description here>

``Covariance Surface`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:variogramsurface', points, field, distcount, nskip, count, variance, covariance)

See also
........

Zonal grid statistics
---------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Zone Grid`` [raster]
  <put parameter description here>

``Categorial Grids`` [multipleinput: rasters]
  Optional.

  <put parameter description here>

``Grids to analyse`` [multipleinput: rasters]
  Optional.

  <put parameter description here>

``Aspect`` [raster]
  Optional.

  <put parameter description here>

``Short Field Names`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Zonal Statistics`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:zonalgridstatistics', zones, catlist, statlist, aspect, shortnames, outtab)

See also
........

