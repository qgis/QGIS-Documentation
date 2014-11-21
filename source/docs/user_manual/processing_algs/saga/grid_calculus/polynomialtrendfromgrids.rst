Polynomial trend from grids
===========================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Polynomial Coefficients`` [raster]
  <put output description here>

``Coefficient of Determination`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:polynomialtrendfromgrids', grids, y_grids, y_table, polynom, parms, quality)

See also
--------

