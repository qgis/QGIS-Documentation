Local Statistic Extraction
==========================

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

``Neighborhood radius`` [number]
  <put parameter description here>

  Default: *3*

Outputs
-------

``Feature Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:localstatisticextraction', -in, -channel, -ram, -radius, -out)

See also
--------

