|updatedisclaimer|

GDAL extraction
===============

Clip raster by extent
---------------------

Description
...........

Clips any GDAL-supported raster file to a given extent.
The algorithm is derived from the `GDAL grid utility <http://www.gdal.org/gdal_grid.html>`_ .


Parameters
..........

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
.......

``Output layer`` [raster]
  Output raster layer.

Console usage
.............

::

  processing.runalg('gdalogr:cliprasterbyextent', input, no_data, projwin, extra, output)

See also
........

Clip raster by mask layer
-------------------------

Description
...........

Clips any GDAL-supported raster by a vector mask layer.
The algorithm is derived from the `GDAL grid utility <http://www.gdal.org/gdal_grid.html>`_ .

Parameters
..........

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
.......

``Output layer`` [raster]
  Output raster layer.

Console usage
.............

::

  processing.runalg('gdalogr:cliprasterbymasklayer', input, mask, no_data, alpha_band, keep_resolution, extra, output)

See also
........

Contour
-------

Description
...........

Extracts contour lines from any GDAL-supported elevation raster.
The algorithm is derived from the `GDAL contour utility <http://www.gdal.org/gdal_contour.html>`_ .

Parameters
..........

``Input layer`` [raster]
  Input elevation raster.

``Interval between contour lines`` [number]
  Defines the interval between the contour lines in the given units of the
  elevation raster.

  Default: *10.0*

``Attribute name (if not set, no elevation attribute is attached)`` [string]
  Optional.

  Defines the attribute name for the field containing the values of the
  contour lines. If nothing is defines the default name will be 'ELEV'.

  Default: *ELEV*

``Additional creation parameters`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Output file for contour lines (vector)`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('gdalogr:contour', input_raster, interval, field_name, extra, output_vector)

See also
........

