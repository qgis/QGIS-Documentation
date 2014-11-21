Haralick Texture Extraction
===========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Selected Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``X Radius`` [number]
  <put parameter description here>

  Default: *2*

``Y Radius`` [number]
  <put parameter description here>

  Default: *2*

``X Offset`` [number]
  <put parameter description here>

  Default: *1*

``Y Offset`` [number]
  <put parameter description here>

  Default: *1*

``Image Minimum`` [number]
  <put parameter description here>

  Default: *0*

``Image Maximum`` [number]
  <put parameter description here>

  Default: *255*

``Histogram number of bin`` [number]
  <put parameter description here>

  Default: *8*

``Texture Set Selection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- simple
  * 1 --- advanced
  * 2 --- higher

  Default: *0*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:haralicktextureextraction', -in, -channel, -ram, -parameters.xrad, -parameters.yrad, -parameters.xoff, -parameters.yoff, -parameters.min, -parameters.max, -parameters.nbbin, -texture, -out)

See also
--------

