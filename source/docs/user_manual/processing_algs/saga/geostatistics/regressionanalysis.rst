Regression analysis
===================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Regression`` [raster]
  <put output description here>

``Residuals`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:regressionanalysis', grid, shapes, attribute, interpol, method, regression, residual)

See also
--------

