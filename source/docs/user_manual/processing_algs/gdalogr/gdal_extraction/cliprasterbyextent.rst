Clip raster by extent
=====================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Nodata value, leave as none to take the nodata value from input`` [string]
  <put parameter description here>

  Default: *none*

``Clipping extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Additional creation parameters`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
-------

``Output layer`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:cliprasterbyextent', input, no_data, projwin, extra, output)

See also
--------

