ColorMapping (optimal)
======================

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

  * 0 --- optimal

  Default: *0*

``Background label`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:colormappingoptimal', -in, -ram, -op, -method, -method.optimal.background, -out)

See also
--------

