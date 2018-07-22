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
The algorithm is derived from the `GDAL grid utility <http://www.gdal.org/gdal_grid.html>`_ .

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

Outputs
.......

``Output layer`` [raster]
  Output raster layer.


.. _gdalcliprasterbymasklayer:

Clip raster by mask layer
-------------------------
Clips any GDAL-supported raster by a vector mask layer.
The algorithm is derived from the `GDAL grid utility <http://www.gdal.org/gdal_grid.html>`_ .

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

``Create and output alpha band`` [boolean]
  Creates an alpha band for the result. The alpha band then includes the transparency
  values of the pixels.

  Default: *False*

``Keep resolution of output raster`` [boolean]
  The resolution of the output raster will not be changed.

  Default: *False*

``Additional creation parameters`` [string]
  Optional

  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Output layer`` [raster]
  Output raster layer.


.. _gdalcontour:

Contour
-------
Extracts contour lines from any GDAL-supported elevation raster.
The algorithm is derived from the `GDAL contour utility <http://www.gdal.org/gdal_contour.html>`_ .

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

  Default: *False*

``Treat all raster values as valid`` [boolean]

  Default: *False*

``Input pixel value to treat as "nodata"`` [number]
  Optional

  Default: *Not set*

Outputs
.......

``Contours`` [vector: line]
  Output file for contour lines


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
