ExtractROI (fit)
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

``Extraction mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- fit

  Default: *0*

``Reference image`` [raster]
  <put parameter description here>

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:extractroifit', -in, -ram, -mode, -mode.fit.ref, -mode.fit.elev.default, -out)

See also
--------

