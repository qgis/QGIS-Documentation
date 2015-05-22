|updatedisclaimer|

GDAL miscellaneous
==================

Build Virtual Raster
--------------------

Description
...........

Builds a VRT (Virtual Dataset) that is a mosaic of the list of input GDAL-supported rasters.
With a mosaic you can merge several raster files.
The algorithm is derived from the `GDAL buildvrt utility <http://www.gdal.org/gdalbuildvrt.html>`_ .

Parameters
..........

``Input layers`` [multipleinput: rasters]
  GDAL-supported raster layers.

``Resolution`` [selection]
  The output resolution of the mosaic. By default the average resolution of th
  raster files will be chosen.

  Options:

  * 0 --- average
  * 1 --- highest
  * 2 --- lowest

  Default: *0*

``Layer stack`` [boolean]
  With 'False' you can define that each raster file goes into a separated stacked band
  in the VRT band.

  Default: *True*

``Allow projection difference`` [boolean]
  Allows that the output bands have different projections derived from the
  projection of the input raster layers.

  Default: *False*

Outputs
.......

``Output layer`` [raster]
  Output raster file.

Console usage
.............

::

  processing.runalg('gdalogr:buildvirtualraster', input, resolution, separate, proj_difference, output)

See also
........

Merge
-----

Description
...........

Merges raster files in a simple way. Here you can use a pseudocolor
table from an input raster and define the output raster type. All
the images must be in the same coordinate system.
The algorithm is derived from the `GDAL merge utility <http://www.gdal.org/gdal_merge.html>`_ .

Parameters
..........

``Input layers`` [multipleinput: rasters]
  Input raster layers.

``Grab pseudocolor table from first layer`` [boolean]
  The pseudocolor table from the first layer will be used for the
  coloring.

  Default: *False*

``Layer stack`` [boolean]
  If 'True' is chosen each input file will be placed into a separate stacked band.

  Default: *False*

``Output raster type`` [selection]
  Defines the output raster type. By default this will be 'Float23'.

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
  Output raster layer.

Console usage
.............

::

  processing.runalg('gdalogr:merge', input, pct, separate, rtype, output)

See also
........

Build overviews (pyramids)
--------------------------

Description
...........

To speed up rendering time of raster layers overviews (pyramids) can
be created. Overviews are lower resolution copies of the data which
QGIS uses depending of the level of zoom.
The algorithm is derived from the `GDAL addo utility <http://www.gdal.org/gdaladdo.html>`_ .

Parameters
..........

``Input layer`` [raster]
  Input raster layer.

``Overview levels`` [string]
  Defines the number of overview levels calculated by the original resolution
  of the input raster layer. By default 4 levels will be taken into consideration.

  Default: *2 4 8 16*

``Remove all existing overviews`` [boolean]
  Removes existing overviews from the raster. By default these aren't removed.

  Default: *False*

``Resampling method`` [selection]
  Calculates the overviews with a defined resampling method.

  Options:

  * 0 --- nearest
  * 1 --- average
  * 2 --- gauss
  * 3 --- cubic
  * 4 --- average_mp
  * 5 --- average_magphase
  * 6 --- mode

  Default: *0*

``Overview format`` [selection]
  The overviews can be stored internally, or externally as GTiff or ERDAS Imagine file.
  By default the overviews are stored in the output raster.

  Options:

  * 0 --- Internal (if possible)
  * 1 --- External (GTiff .ovr)
  * 2 --- External (ERDAS Imagine .aux)

  Default: *0*

Outputs
.......

``Output layer`` [raster]
  Output raster layer with overviews.

Console usage
.............

::

  processing.runalg('gdalogr:overviews', input, levels, clean, resampling_method, format)

See also
........

Information
-----------

Description
...........
The gdalinfo program lists various information about a GDAL supported raster dataset.

Parameters
..........

``Input layer`` [raster]
  Raster layer in input

``Suppress GCP info`` [boolean]
  Suppress ground control points list printing. It may be useful for datasets with huge amount of GCPs, such as L1B AVHRR or HDF4 MODIS which contain thousands of them.

  Default: *False*

``Suppress metadata info`` [boolean]
  Suppress metadata printing. Some datasets may contain a lot of metadata strings.

  Default: *False*

Outputs
.......

``Layer information`` [html]
  Raster information in output

Console usage
.............

::

  processing.runalg('gdalorg:rasterinfo', input, nogcp, nometadata, output)

See also
........
`GDAL info <http://www.gdal.org/gdalinfo.html>`_

Tile Index
----------

Description
...........

This tool builds a shapefile with a record for each input raster file, an
attribute containing the filename, and a polygon geometry outlining the raster.
This output is suitable for use with MapServer as a raster tileindex.

Parameters
..........

``Input layers`` [multipleinput: rasters]
  The input raster files. Can be multiple files.

``Tile index field`` [string]
  Optional.

  The output field name to hold the file path/location to the indexed rasters.

  Default: *location*

``Skip files with different projection reference`` [boolean]
  Only files with same projection as files already inserted in the tile index
  will be inserted. Default does not check projection and accepts all inputs.

  Default: *False*

Outputs
.......

``Output layer`` [vector]
  The name of the output file to create/append to. The default shapefile will
  be created if it doesn't already exist, otherwise it will append to the
  existing file.

Console usage
.............

::

  processing.runalg('gdalogr:tileindex', input, field_name, proj_difference, output)

See also
........

