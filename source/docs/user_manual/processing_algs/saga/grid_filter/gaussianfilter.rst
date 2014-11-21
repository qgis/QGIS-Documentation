Gaussian filter
===============

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Standard Deviation`` [number]
  <put parameter description here>

  Default: *1*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Square
  * 1 --- [1] Circle

  Default: *0*

``Search Radius`` [number]
  <put parameter description here>

  Default: *3*

Outputs
-------

``Filtered Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:gaussianfilter', input, sigma, mode, radius, result)

See also
--------

