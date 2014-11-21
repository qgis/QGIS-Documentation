Sieve
=====

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Threshold`` [number]
  <put parameter description here>

  Default: *2*

``Pixel connection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- 4
  * 1 --- 8

  Default: *0*

Outputs
-------

``Output layer`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:sieve', input, threshold, connections, output)

See also
--------

