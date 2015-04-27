Clip raster by extent
=====================

Description
-----------

Clips any GDAL-supported raster file to a given extent.

Parameters
----------

``Input layer`` [raster]
  Input raster file.

``Nodata value, leave as none to take the nodata value from input`` [string]
  Defines a value that should be inserted for the nodata values in the output raster.

  Default: *none*

``Clipping extent`` [extent]
  Extent that should be used for the output raster. Selects only features within the
  specified bounding box.

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

