Smoothing (mean)
================

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

``Smoothing Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- mean

  Default: *2*

``Radius`` [number]
  <put parameter description here>

  Default: *2*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:smoothingmean', -in, -ram, -type, -type.mean.radius, -out)

See also
--------

