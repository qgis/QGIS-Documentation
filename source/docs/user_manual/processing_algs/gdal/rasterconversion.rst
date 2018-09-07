.. only:: html

   |updatedisclaimer|

Raster conversion
=================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalgdal2xyz:

gdal2xyz
--------
Converts raster data to XYZ ASCII file format.

Parameters
..........

``Input layer`` [raster]
  Raster layer to convert.

``Band number`` [raster band]
  Number of the band to export values from.

  Default: *1*

``Output comma-separated values`` [boolean]
  Sets whether output file should be of comma-separated values (csv) type.

  Default: *False*
  
Outputs
.......

``XYZ ASCII file`` [table]
  Table file containing values exported from the raster band.


.. _gdalpcttorgb:

PCT to RGB
----------
Convert an 8bit paletted image to 24bit RGB.

This utility will convert a pseudocolor band on the input file into an output RGB file of the desired format.

``Default menu``: :menuselection:`Raster --> Conversion`

Parameters
..........

``Input layer`` [raster]
  Input 8bit raster image.

``Band number`` [enumeration]
  Band to convert to RGB.

  Options:

  * 0 --- 1
  * 1 --- 2
  * 2 --- 3
  * 3 --- 4
  * 4 --- 5
  * 5 --- 6
  * 6 --- 7
  * 7 --- 8
  * 8 --- 9
  * 9 --- 10
  * 10 --- 11
  * 11 --- 12
  * 12 --- 13
  * 13 --- 14
  * 14 --- 15
  * 15 --- 16
  * 16 --- 17
  * 17 --- 18
  * 18 --- 19
  * 19 --- 20
  * 20 --- 21
  * 21 --- 22
  * 22 --- 23
  * 23 --- 24
  * 24 --- 25

  Default: *0*

``Generate a RGBA file`` [boolean]
  Sets whether output file should be of RGBA type.

  Default: *False*
  
Outputs
.......

``PCT to RGB`` [raster]
  24bit RGB raster image

See also
........
`GDAL pct2rgb utility <http://www.gdal.org/pct2rgb.html>`_


.. _gdalpolygonize:

Polygonize (raster to vector)
-----------------------------
Creates vector polygons for all connected regions of pixels in the
raster sharing a common pixel value. Each polygon is created with an
attribute indicating the pixel value of that polygon.
The algorithm is derived from the `GDAL polygonize utility <http://www.gdal.org/gdal_polygonize.html>`_ .

``Default menu``: :menuselection:`Raster --> Conversion`

Parameters
..........

``Input layer`` [raster]
  Input raster layer.

``Band number`` [raster band]
  Band to extract data from.

``Name of the field to create`` [string]
  Defines the field name in which the attributes of the connected regions are
  entered. If no field name is defined the name will be 'DN'.

  Default: *DN*

``Use 8-connectedness`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
.......

``Vectorized`` [vector: polygon]
  Output vector layer. Default format is \*.shp.


.. _gdalrasterize:

Rasterize (vector to raster)
----------------------------
Converts vector geometries (points, lines and polygons) into a raster image.
The algorithm is derived from the `GDAL rasterize utility <http://www.gdal.org/gdal_rasterize.html>`_ .

``Default menu``: :menuselection:`Raster --> Conversion`

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer with point, line or polygon geometries.

``Field to use for a burn-in value`` [tablefield: numeric]
  Optional

  Defines the attribute field from which the attributes for the pixels
  should be chosen.

``A fixed value to burn`` [number]
  Optional

  <put parameter description here>

  Default: *0.000000*

``Output raster size units`` [enumeration]
  Units to apply to features.

  Options:

  * 0 --- Pixels
  * 1 --- Georeferenced units

  Default: *0*

``Width/Horizontal resolution`` [number]
  Sets the horizontal resolution of the output raster.

  Default: *0.000000*

``Height/Vertical resolution`` [number]
  Sets the vertical resolution of the output raster.

  Default: *0.000000*

``Output extent (xmin, xmax, ymin, ymax)`` [extent]
  Extent of the output raster layer. If the extent is not specified, the minimum
  extent that covers selected reference layer(s) will be used.

``Assign a specified nodata value to output bands`` [number]
  Optional

  <put parameter description here>

  Default: *0.000000*

``Output data type`` [enumeration]
  Defines the type of the resulting raster image.

  Options:

  * 0 --- Byte
  * 1 --- Int16
  * 2 --- UInt16
  * 3 --- UInt32
  * 4 --- Int32
  * 5 --- Float32
  * 6 --- Float64
  * 7 --- CInt16
  * 8 --- CInt32
  * 9 --- CFloat32
  * 10 --- CFloat64

  Default: *5*

``Pre-initialize the output image with value`` [number]
  Optional

  <put parameter description here>

``Invert rasterization`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
.......

``Rasterized`` [raster]
  Output raster layer.


.. _gdalrgbtopct:

RGB to PCT
----------
Converts a 24bit RGB image into a 8bit paletted. Computes an optimal pseudo-color
table for the given RGB-image using a median cut algorithm on a downsampled RGB
histogram. Then it converts the image into a pseudo-colored image using the color
table. This conversion utilizes Floyd-Steinberg dithering (error diffusion) to
maximize output image visual quality.
If you want to classify a raster map and want to reduce the number of classes it
can be helpful to downsample your image with this algorithm before.
The algorithm is derived from the `GDAL rgb2pct utility <http://www.gdal.org/rgb2pct.html>`_ .

``Default menu``: :menuselection:`Raster --> Conversion`

Parameters
..........

``Input layer`` [raster]
  Input RGB image raster.

``Number of colors`` [number]
  The number of colors the resulting image will contain. A value from 2-256 is possible.

  Default: *2*

Outputs
.......

``RGB to PCT`` [raster]
  8-bit output raster.


.. _gdaltranslate:

Translate (convert format)
--------------------------

``Default menu``: :menuselection:`Raster --> Conversion`

Parameters
..........

``Input layer`` [raster]
  <put parameter description here>

``Override the projection of the output file`` [crs]
  <put parameter description here>

``Assign a specified nodata value to output bands`` [number]
  Optional

  <put parameter description here>

  Default: *Not set*

``Copy all subdatasets of this file to individual output files`` [boolean]
  <put parameter description here>

  Default: *False*

``Additional creation parameters`` [string]
  Optional

  <put parameter description here>

  Default: *(not set)*

``Output data type`` [enumeration]
  Defines the type of the resulting raster image.

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

``Converted`` [raster]
  <put output description here>


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
