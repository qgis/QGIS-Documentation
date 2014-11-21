Multiple regression analysis (points/grids)
===========================================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

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
-------------

::

  processing.runalg('saga:multipleregressionanalysispointsgrids', grids, shapes, attribute, interpol, coord_x, coord_y, method, p_in, p_out, info_coeff, info_model, info_steps, residuals, regression)

See also
--------

