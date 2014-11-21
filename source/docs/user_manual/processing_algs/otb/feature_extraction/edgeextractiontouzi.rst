EdgeExtraction (touzi)
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

  * 0 --- touzi

  Default: *0*

``The Radius`` [number]
  <put parameter description here>

  Default: *1*

Outputs
-------

``Feature Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:edgeextractiontouzi', -in, -channel, -ram, -filter, -filter.touzi.xradius, -out)

See also
--------

