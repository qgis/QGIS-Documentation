ColorMapping (custom)
=====================

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

  * 0 --- custom

  Default: *0*

``Look-up table file`` [file]
  <put parameter description here>

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:colormappingcustom', -in, -ram, -op, -method, -method.custom.lut, -out)

See also
--------

