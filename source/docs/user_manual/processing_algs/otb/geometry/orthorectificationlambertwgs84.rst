OrthoRectification (lambert-WGS84)
==================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Output Cartographic Map Projection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- lambert2
  * 1 --- lambert93
  * 2 --- wgs

  Default: *0*

``Parameters estimation modes`` [selection]
  <put parameter description here>

  Options:

  * 0 --- autosize
  * 1 --- autospacing

  Default: *0*

``Default pixel value`` [number]
  <put parameter description here>

  Default: *0*

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

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

``Resampling grid spacing`` [number]
  <put parameter description here>

  Default: *4*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:orthorectificationlambertwgs84', -io.in, -map, -outputs.mode, -outputs.default, -elev.default, -interpolator, -interpolator.bco.radius, -opt.ram, -opt.gridspacing, -io.out)

See also
--------

