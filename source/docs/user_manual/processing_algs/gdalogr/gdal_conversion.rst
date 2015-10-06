|updatedisclaimer|

GDAL conversion
===============

gdal2xyz
--------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [raster]
  <put parameter description here>

``Band number`` [number]
  <put parameter description here>

  Default: *1*

Outputs
.......

``Output file`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('gdalogr:gdal2xyz', input, band, output)

See also
........

PCT to RGB
----------

Description
...........
Convert an 8bit paletted image to 24bit RGB

This utility will convert a pseudocolor band on the input file into an output RGB file of the desired format.

Parameters
..........

``Input layer`` [raster]
  Input 8bit raster image

``Band to convert`` [selection]
  Band to convert to RGB

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

Outputs
.......

``Output layer`` [raster]
  24bit RGB raster image

Console usage
.............

::

  processing.runalg('gdalogr:pcttorgb', input, nband, output)

See also
........
`GDAL pct2rgb utility <http://www.gdal.org/pct2rgb.html>`_

Polygonize (raster to vector)
-----------------------------

Description
...........

Creates vector polygons for all connected regions of pixels in the
raster sharing a common pixel value. Each polygon is created with an
attribute indicating the pixel value of that polygon.
The algorithm is derived from the `GDAL polygonize utility <http://www.gdal.org/gdal_polygonize.html>`_ .

Parameters
..........

``Input layer`` [raster]
  Input raster layer.

``Output field name`` [string]
  Defines the field name in which the attributes of the connected regions are
  entered. If no field name is defined the name will be 'DN'.

  Default: *DN*

Outputs
.......

``Output layer`` [vector]
  Output vector layer. Default format is \*.shp. 

Console usage
.............

::

  processing.runalg('gdalogr:polygonize', input, field, output)

See also
........

Rasterize (vector to raster)
----------------------------

Description
...........

Converts vector geometries (points, lines and polygons) into a raster image.
The algorithm is derived from the `GDAL rasterize utility <http://www.gdal.org/gdal_rasterize.html>`_ .


Parameters
..........

``Input layer`` [vector: any]
  Input vector layer with point, line or polygon geometries.

``Attribute field`` [tablefield: any]
  Defines the attribute field from which the attributes for the pixels
  should be chosen.

``Write values inside an existing raster layer(*)`` [boolean]
  If activated writes the results into an existing raster layer.

  Default: *False*

``Set output raster size (ignored if above option is checked)`` [selection]
  If the above option is not checked either the output size is in pixels (0)
  or the output resolution is in map units per pixel (1).

  Options:

  * 0 --- Output size in pixels
  * 1 --- Output resolution in map units per pixel

  Default: *1*

``Horizontal`` [number]
  Sets the horizontal resolution of the output raster.

  Default: *100.0*

``Vertical`` [number]
  Sets the vertical resolution of the output raster.

  Default: *100.0*

``Raster type`` [selection]
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

  Default: *0*

Outputs
.......

``Output layer: mandatory to choose an existing raster layer if the (*) option is selected`` [raster]
  Output raster layer. Give in here the name of the raster layer in which the results should be written
  (if this option is used).

Console usage
.............

::

  processing.runalg('gdalogr:rasterize', input, field, writeover, dimensions, width, height, rtype, output)

See also
........

RGB to PCT
----------

Description
...........

Converts a 24bit RGB image into a 8bit paletted. Computes an optimal pseudo-color
table for the given RGB-image using a median cut algorithm on a downsampled RGB
histogram. Then it converts the image into a pseudo-colored image using the color
table. This conversion utilizes Floyd-Steinberg dithering (error diffusion) to
maximize output image visual quality.
If you want to classify a raster map and want to reduce the number of classes it
can be helpful to downsample your image with this algorithm before.
The algorithm is derived from the `GDAL rgb2pct utility <http://www.gdal.org/rgb2pct.html>`_ .

Parameters
..........

``Input layer`` [raster]
  Input RGB image raster.

``Number of colors`` [number]
  The number of colors the resulting image will contain. A value from 2-256 is possible.

  Default: *2*

Outputs
.......

``Output layer`` [raster]
  8-bit output raster.

Console usage
.............

::

  processing.runalg('gdalogr:rgbtopct', input, ncolors, output)

See also
........

Translate (convert format)
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [raster]
  <put parameter description here>

``Set the size of the output file (In pixels or %)`` [number]
  <put parameter description here>

  Default: *100*

``Output size is a percentage of input size`` [boolean]
  <put parameter description here>

  Default: *True*

``Nodata value, leave as none to take the nodata value from input`` [string]
  <put parameter description here>

  Default: *none*

``Expand`` [selection]
  <put parameter description here>

  Options:

  * 0 --- none
  * 1 --- gray
  * 2 --- rgb
  * 3 --- rgba

  Default: *0*

``Output projection for output file [leave blank to use input projection]`` [crs]
  <put parameter description here>

  Default: *None*

``Subset based on georeferenced coordinates`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Copy all subdatasets of this file to individual output files`` [boolean]
  <put parameter description here>

  Default: *False*

``Additional creation parameters`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

``Output raster type`` [selection]
  <put parameter description here>

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

Outputs
.......

``Output layer`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('gdalogr:translate', input, outsize, outsize_perc, no_data, expand, srs, projwin, sds, extra, rtype, output)

See also
........

