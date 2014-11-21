Laplacian filter
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] standard kernel 1
  * 1 --- [1] standard kernel 2
  * 2 --- [2] Standard kernel 3
  * 3 --- [3] user defined kernel

  Default: *0*

``Standard Deviation (Percent of Radius)`` [number]
  <put parameter description here>

  Default: *0*

``Radius`` [number]
  <put parameter description here>

  Default: *1*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] square
  * 1 --- [1] circle

  Default: *0*

Outputs
-------

``Filtered Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:laplacianfilter', input, method, sigma, radius, mode, result)

See also
--------

