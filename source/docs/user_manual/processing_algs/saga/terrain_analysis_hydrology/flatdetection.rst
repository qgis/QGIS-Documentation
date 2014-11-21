Flat detection
==============

Description
-----------

<put algortithm description here>

Parameters
----------

``DEM`` [raster]
  <put parameter description here>

``Flat Area Values`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] elevation
  * 1 --- [1] enumeration

  Default: *0*

Outputs
-------

``No Flats`` [raster]
  <put output description here>

``Flat Areas`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:flatdetection', dem, flat_output, noflats, flats)

See also
--------

