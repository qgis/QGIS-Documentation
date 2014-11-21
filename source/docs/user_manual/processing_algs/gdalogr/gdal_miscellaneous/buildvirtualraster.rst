Build Virtual Raster
====================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layers`` [multipleinput: rasters]
  <put parameter description here>

``Resolution`` [selection]
  <put parameter description here>

  Options:

  * 0 --- average
  * 1 --- highest
  * 2 --- lowest

  Default: *0*

``Layer stack`` [boolean]
  <put parameter description here>

  Default: *True*

``Allow projection difference`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
-------

``Output layer`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:buildvirtualraster', input, resolution, separate, proj_difference, output)

See also
--------

