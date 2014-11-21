ColorMapping (image)
====================

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

  * 0 --- image

  Default: *0*

``Support Image`` [raster]
  <put parameter description here>

``NoData value`` [number]
  <put parameter description here>

  Default: *0*

``lower quantile`` [number]
  <put parameter description here>

  Default: *2*

``upper quantile`` [number]
  <put parameter description here>

  Default: *2*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:colormappingimage', -in, -ram, -op, -method, -method.image.in, -method.image.nodatavalue, -method.image.low, -method.image.up, -out)

See also
--------

