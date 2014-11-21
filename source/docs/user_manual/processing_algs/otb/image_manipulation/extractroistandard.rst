ExtractROI (standard)
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

``Extraction mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- standard

  Default: *0*

``Start X`` [number]
  <put parameter description here>

  Default: *0*

``Start Y`` [number]
  <put parameter description here>

  Default: *0*

``Size X`` [number]
  <put parameter description here>

  Default: *0*

``Size Y`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:extractroistandard', -in, -ram, -mode, -startx, -starty, -sizex, -sizey, -out)

See also
--------

