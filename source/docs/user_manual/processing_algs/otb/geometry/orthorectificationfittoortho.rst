OrthoRectification (fit-to-ortho)
=================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Parameters estimation modes`` [selection]
  <put parameter description here>

  Options:

  * 0 --- orthofit

  Default: *0*

``Model ortho-image`` [raster]
  Optional.

  <put parameter description here>

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

  processing.runalg('otb:orthorectificationfittoortho', -io.in, -outputs.mode, -outputs.ortho, -outputs.default, -elev.default, -interpolator, -interpolator.bco.radius, -opt.ram, -opt.gridspacing, -io.out)

See also
--------

