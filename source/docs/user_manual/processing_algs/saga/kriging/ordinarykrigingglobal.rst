Ordinary kriging (global)
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Create Variance Grid`` [boolean]
  <put parameter description here>

  Default: *True*

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Variogram Model`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Spherical Model
  * 1 --- [1] Exponential Model
  * 2 --- [2] Gaussian Model
  * 3 --- [3] Linear Regression
  * 4 --- [4] Exponential Regression
  * 5 --- [5] Power Function Regression

  Default: *0*

``Block Kriging`` [boolean]
  <put parameter description here>

  Default: *True*

``Block Size`` [number]
  <put parameter description here>

  Default: *100*

``Logarithmic Transformation`` [boolean]
  <put parameter description here>

  Default: *True*

``Nugget`` [number]
  <put parameter description here>

  Default: *0.0*

``Sill`` [number]
  <put parameter description here>

  Default: *0.0*

``Range`` [number]
  <put parameter description here>

  Default: *0.0*

``Linear Regression`` [number]
  <put parameter description here>

  Default: *1.0*

``Exponential Regression`` [number]
  <put parameter description here>

  Default: *0.1*

``Power Function - A`` [number]
  <put parameter description here>

  Default: *1.0*

``Power Function - B`` [number]
  <put parameter description here>

  Default: *0.5*

``Grid Size`` [number]
  <put parameter description here>

  Default: *1.0*

``Fit Extent`` [boolean]
  <put parameter description here>

  Default: *True*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

Outputs
-------

``Grid`` [raster]
  <put output description here>

``Variance`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:ordinarykrigingglobal', shapes, field, bvariance, target, model, block, dblock, blog, nugget, sill, range, lin_b, exp_b, pow_a, pow_b, user_cell_size, user_fit_extent, output_extent, grid, variance)

See also
--------

