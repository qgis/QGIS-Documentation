Pansharpening (rcs)
===================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input PAN Image`` [raster]
  <put parameter description here>

``Input XS Image`` [raster]
  <put parameter description here>

``Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- rcs

  Default: *0*

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

  processing.runalg('otb:pansharpeningrcs', -inp, -inxs, -method, -ram, -out)

See also
--------

