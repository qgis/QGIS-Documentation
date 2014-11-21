Radiometric Indices
===================

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

``Blue Channel`` [number]
  <put parameter description here>

  Default: *1*

``Green Channel`` [number]
  <put parameter description here>

  Default: *1*

``Red Channel`` [number]
  <put parameter description here>

  Default: *1*

``NIR Channel`` [number]
  <put parameter description here>

  Default: *1*

``Mir Channel`` [number]
  <put parameter description here>

  Default: *1*

``Available Radiometric Indices`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ndvi
  * 1 --- tndvi
  * 2 --- rvi
  * 3 --- savi
  * 4 --- tsavi
  * 5 --- msavi
  * 6 --- msavi2
  * 7 --- gemi
  * 8 --- ipvi
  * 9 --- ndwi
  * 10 --- ndwi2
  * 11 --- mndwi
  * 12 --- ndpi
  * 13 --- ndti
  * 14 --- ri
  * 15 --- ci
  * 16 --- bi
  * 17 --- bi2

  Default: *0*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:radiometricindices', -in, -ram, -channels.blue, -channels.green, -channels.red, -channels.nir, -channels.mir, -list, -out)

See also
--------

