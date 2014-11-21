Analytical hillshading
======================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Shading Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Standard
  * 1 --- [1] Standard (max. 90Degree)
  * 2 --- [2] Combined Shading
  * 3 --- [3] Ray Tracing

  Default: *0*

``Azimuth [Degree]`` [number]
  <put parameter description here>

  Default: *315.0*

``Declination [Degree]`` [number]
  <put parameter description here>

  Default: *45.0*

``Exaggeration`` [number]
  <put parameter description here>

  Default: *4.0*

Outputs
-------

``Analytical Hillshading`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:analyticalhillshading', elevation, method, azimuth, declination, exaggeration, shade)

See also
--------

