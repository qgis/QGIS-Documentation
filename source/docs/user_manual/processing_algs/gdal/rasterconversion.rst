.. only:: html


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
  Sets whether the output file should be of comma-separated values (csv) type.

  Default: *False*
  
Outputs
.......

``XYZ ASCII file`` [table]
  Table file containing the values exported from the raster band.


.. _gdalpcttorgb:

PCT to RGB
----------
Converts an 8bit paletted image to 24bit RGB.
It will convert a pseudocolor band on the input file into an output RGB file of the desired format.

This algorithm is derived from the `GDAL pct2rgb utility <https://www.gdal.org/pct2rgb.html>`_ .

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
  Sets whether the output file should be of RGBA type.

  Default: *False*
  
Outputs
.......

``PCT to RGB`` [raster]
  24bit RGB raster image


.. _gdalpolygonize:

Polygonize (raster to vector)
-----------------------------
Creates vector polygons for all connected regions of pixels in the
raster sharing a common pixel value. Each polygon is created with an
attribute indicating the pixel value of that polygon.

This algorithm is derived from the `GDAL polygonize utility <https://www.gdal.org/gdal_polygonize.html>`_ .

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


.. _gdalrearrange_bands:

Rearrange bands
---------------
Creates a new raster using selected band(s) from a given raster layer.
The algorithm also makes it possible to reorder the bands for the newly-created raster.

This algorithm is derived from the `GDAL translate utility <https://www.gdal.org/gdal_translate.html>`_ .

Parameters
..........

``Input layer`` [vector: any]
  Input raster layer.

``selected band(s)`` [raster band] [list]
  Ordered list of the bands to use to create the new raster.

``Additional creation options``
  Optional

  ``Profile`` [enumeration]
    <put parameter description here>
    Options:

    * 0 --- 
    * 1 --- Default
    * 2 --- No compression
    * 3 --- Low compression
    * 4 --- High compression
    * 5 --- JPEG compression

  Default: *0*

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
  Output raster layer with rearranged bands.


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

This algorithm is derived from the `GDAL rgb2pct utility <https://www.gdal.org/rgb2pct.html>`_ .

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
Converts raster data between different formats.

This algorithm is derived from the `GDAL translate utility <https://www.gdal.org/gdal_translate.html>`_ .

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
