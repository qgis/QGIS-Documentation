Multiple regression analysis (grid/grids)
=========================================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

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
-------------

::

  processing.runalg('saga:multipleregressionanalysisgridgrids', dependent, grids, interpol, coord_x, coord_y, method, p_in, p_out, regression, residuals, info_coeff, info_model, info_steps)

See also
--------

