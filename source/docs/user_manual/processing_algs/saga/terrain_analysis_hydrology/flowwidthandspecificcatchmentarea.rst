Flow width and specific catchment area
======================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Total Catchment Area (TCA)`` [raster]
  Optional.

  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8
  * 1 --- [1] Multiple Flow Direction (Quinn et al. 1991)
  * 2 --- [2] Aspect

  Default: *0*

Outputs
-------

``Flow Width`` [raster]
  <put output description here>

``Specific Catchment Area (SCA)`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:flowwidthandspecificcatchmentarea', dem, tca, method, width, sca)

See also
--------

