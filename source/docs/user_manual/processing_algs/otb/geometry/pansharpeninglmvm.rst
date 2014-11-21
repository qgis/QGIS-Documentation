Pansharpening (lmvm)
====================

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

  * 0 --- lmvm

  Default: *0*

``X radius`` [number]
  <put parameter description here>

  Default: *3*

``Y radius`` [number]
  <put parameter description here>

  Default: *3*

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

  processing.runalg('otb:pansharpeninglmvm', -inp, -inxs, -method, -method.lmvm.radiusx, -method.lmvm.radiusy, -ram, -out)

See also
--------

