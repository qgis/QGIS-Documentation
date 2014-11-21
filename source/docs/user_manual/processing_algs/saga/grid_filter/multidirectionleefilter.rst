Multi direction lee filter
==========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Estimated Noise (absolute)`` [number]
  <put parameter description here>

  Default: *1.0*

``Estimated Noise (relative)`` [number]
  <put parameter description here>

  Default: *1.0*

``Weighted`` [boolean]
  <put parameter description here>

  Default: *True*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] noise variance given as absolute value
  * 1 --- [1] noise variance given relative to mean standard deviation
  * 2 --- [2] original calculation (Ringeler)

  Default: *0*

Outputs
-------

``Filtered Grid`` [raster]
  <put output description here>

``Minimum Standard Deviation`` [raster]
  <put output description here>

``Direction of Minimum Standard Deviation`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:multidirectionleefilter', input, noise_abs, noise_rel, weighted, method, result, stddev, dir)

See also
--------

