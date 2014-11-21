ColorMapping (continuous)
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- labeltocolor

  Default: *0*

``Color mapping method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- continuous

  Default: *0*

``Look-up tables`` [selection]
  <put parameter description here>

  Options:

  * 0 --- red
  * 1 --- green
  * 2 --- blue
  * 3 --- grey
  * 4 --- hot
  * 5 --- cool
  * 6 --- spring
  * 7 --- summer
  * 8 --- autumn
  * 9 --- winter
  * 10 --- copper
  * 11 --- jet
  * 12 --- hsv
  * 13 --- overunder
  * 14 --- relief

  Default: *0*

``Mapping range lower value`` [number]
  <put parameter description here>

  Default: *0*

``Mapping range higher value`` [number]
  <put parameter description here>

  Default: *255*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:colormappingcontinuous', -in, -ram, -op, -method, -method.continuous.lut, -method.continuous.min, -method.continuous.max, -out)

See also
--------

