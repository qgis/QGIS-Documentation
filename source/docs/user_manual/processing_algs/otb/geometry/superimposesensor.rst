Superimpose sensor
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``Reference input`` [raster]
  <put parameter description here>

``The image to reproject`` [raster]
  <put parameter description here>

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

``Spacing of the deformation field`` [number]
  <put parameter description here>

  Default: *4*

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- bco
  * 1 --- nn
  * 2 --- linear

  Default: *0*

``Radius for bicubic interpolation`` [number]
  <put parameter description here>

  Default: *2*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
-------

``Output image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:superimposesensor', -inr, -inm, -elev.default, -lms, -interpolator, -interpolator.bco.radius, -ram, -out)

See also
--------

