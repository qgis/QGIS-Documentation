.. only:: html

   |updatedisclaimer|

Raster extraction
=================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalcliprasterbyextent:

Clip raster by extent
---------------------
Clips any GDAL-supported raster file to a given extent.

This algorithm is derived from the `GDAL grid utility <https://www.gdal.org/gdal_grid.html>`_ .

``Default menu``: :menuselection:`Raster --> Extraction`

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
  Optional

  <put parameter description here>

  Default: *(not set)*

``Output data type`` [enumeration]
  Defines the format of the output raster file.

  Options:

  * 0 --- Use input layer data type
  * 1 --- Byte
  * 2 --- Int16
  * 3 --- UInt16
  * 4 --- UInt32
  * 5 --- Int32
  * 6 --- Float32
  * 7 --- Float64
  * 8 --- CInt16
  * 9 --- CInt32
  * 10 --- CFloat32
  * 11 --- CFloat64

  Default: *0*

Outputs
.......

``Clipped (extent)`` [raster]
  Output raster layer clipped by the given extent.


.. _gdalcliprasterbymasklayer:

Clip raster by mask layer
-------------------------
Clips any GDAL-supported raster by a vector mask layer.

This algorithm is derived from the `GDAL grid utility <https://www.gdal.org/gdal_grid.html>`_ .

``Default menu``: :menuselection:`Raster --> Extraction`

Parameters
..........

``Input layer`` [raster]
  Input raster layer.

``Mask layer`` [vector: polygon]
  Defines the vector mask for clipping the raster.

``Nodata value, leave as none to take the nodata value from input`` [string]
  Defines a value for the no-data areas of the input raster.

  Default: *none*

``Create an output alpha band`` [boolean]
  Creates an alpha band for the result. The alpha band then includes the transparency
  values of the pixels.

  Default: *False*

``Match the extent of the clipped raster to the extent of the mask layer`` [boolean]
  Applies the vector layer extent to the output raster if checked.

  Default: *True*

``Keep resolution of output raster`` [boolean]
  The resolution of the output raster will not be changed.

  Default: *False*

``Additional creation parameters`` [string]
  Optional

  <put parameter description here>

  Default: *(not set)*

``Output data type`` [enumeration]
  Defines the format of the output raster file.

  Options:

  * 0 --- Use input layer data type
  * 1 --- Byte
  * 2 --- Int16
  * 3 --- UInt16
  * 4 --- UInt32
  * 5 --- Int32
  * 6 --- Float32
  * 7 --- Float64
  * 8 --- CInt16
  * 9 --- CInt32
  * 10 --- CFloat32
  * 11 --- CFloat64

  Default: *0*

Outputs
.......

``Clipped (mask)`` [raster]
  Output raster layer clipped by the vector layer.


.. _gdalcontour:

Contour
-------
Extracts contour lines from any GDAL-supported elevation raster.

This algorithm is derived from the `GDAL contour utility <https://www.gdal.org/gdal_contour.html>`_ .

``Default menu``: :menuselection:`Raster --> Extraction`

Parameters
..........

``Input layer`` [raster]
  Input elevation raster.

``Band number`` [raster band]
  Raster band to extract.

``Interval between contour lines`` [number]
  Defines the interval between the contour lines in the given units of the
  elevation raster.

  Default: *10.0*

``Attribute name (if not set, no elevation attribute is attached)`` [string]
  Optional

  Defines the attribute name for the field containing the values of the
  contour lines. If nothing is defines the default name will be 'ELEV'.

  Default: *ELEV*

``Offset from zero relative to which to interpret intervals`` [number]
  Optional

  Default: *0.0*

``Produce 3D vector`` [boolean]
  Forces production of 3D vectors instead of 2D. Includes elevation at every vertex.

  Default: *False*

``Treat all raster values as valid`` [boolean]
  Ignores any nodata values in the dataset.

  Default: *False*

``Input pixel value to treat as "nodata"`` [number]
  Optional

  Default: *Not set*

``Additional creation options`` [string]
  Optional

Outputs
.......

``Contours`` [vector: line]
  Output file for contour lines.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
