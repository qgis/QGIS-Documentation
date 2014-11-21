BinaryMorphologicalOperation (erode)
====================================

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

``Structuring Element Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ball

  Default: *0*

``The Structuring Element Radius`` [number]
  <put parameter description here>

  Default: *5*

``Morphological Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- erode

  Default: *0*

Outputs
-------

``Feature Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:binarymorphologicaloperationerode', -in, -channel, -ram, -structype, -structype.ball.xradius, -filter, -out)

See also
--------

