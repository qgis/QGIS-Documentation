Clip raster by mask layer
=========================

Description
-----------

Clips any GDAL-supported raster by a vector mask layer.

Parameters
----------

``Input layer`` [raster]
  Input raster layer.

``Mask layer`` [vector: polygon]
  Defines the vector mask for clipping the raster.

``Nodata value, leave as none to take the nodata value from input`` [string]
  Defines a value for the no-data areas of the input raster.

  Default: *none*

``Create and output alpha band`` [boolean]
  Creates an alpha band for the result. The alpha band then includes the transparency
  values of the pixels. 

  Default: *False*

``Keep resolution of output raster`` [boolean]
  The resolution of the output raster will not be changed.

  Default: *False*

``Additional creation parameters`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
-------

``Output layer`` [raster]
  Output raster layer.

Console usage
-------------

::

  processing.runalg('gdalogr:cliprasterbymasklayer', input, mask, no_data, alpha_band, keep_resolution, extra, output)

See also
--------

