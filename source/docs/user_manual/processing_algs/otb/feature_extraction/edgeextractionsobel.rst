EdgeExtraction (sobel)
======================

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

``Edge feature`` [selection]
  <put parameter description here>

  Options:

  * 0 --- sobel

  Default: *0*

Outputs
-------

``Feature Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:edgeextractionsobel', -in, -channel, -ram, -filter, -out)

See also
--------

