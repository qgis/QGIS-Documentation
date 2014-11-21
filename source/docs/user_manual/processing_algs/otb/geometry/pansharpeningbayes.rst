Pansharpening (bayes)
=====================

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

  * 0 --- bayes

  Default: *0*

``Weight`` [number]
  <put parameter description here>

  Default: *0.9999*

``S coefficient`` [number]
  <put parameter description here>

  Default: *1*

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

  processing.runalg('otb:pansharpeningbayes', -inp, -inxs, -method, -method.bayes.lambda, -method.bayes.s, -ram, -out)

See also
--------

