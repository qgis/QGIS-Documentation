Raster miscellaneous
====================

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _gdaloverviews:

Build overviews (pyramids)
--------------------------
To speed up rendering time of raster layers overviews (pyramids) can
be created. Overviews are lower resolution copies of the data which
QGIS uses depending of the level of zoom.

This algorithm is derived from the `GDAL addo utility <https://gdal.org/gdaladdo.html>`_ .

``Default menu``: :menuselection:`Raster --> Miscellaneous`

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

``Resampling method`` [enumeration]
  Optional

  Calculates the overviews with a defined resampling method.

  Options:

  * 0 --- Nearest neighbour
  * 1 --- Average
  * 2 --- Gaussian
  * 3 --- Cubic convolution
  * 4 --- B-Spline convolution
  * 5 --- Lanczos windowed sinc
  * 6 --- Average MP
  * 7 --- Average in mag/phase space
  * 8 --- Mode

  Default: *0*

``Overview format`` [enumeration]
  Optional

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

.. _gdalbuildvirtualraster:

Build virtual raster
--------------------
Builds a VRT (Virtual Dataset) that is a mosaic of the list of input GDAL-supported rasters.
With a mosaic you can merge several raster files.

This algorithm is derived from the `GDAL buildvrt utility <https://gdal.org/gdalbuildvrt.html>`_ .

``Default menu``: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  -  Name
      -  Identifier
      -  Type
      -  Description
      
   *  - **Input layers**
      - INPUT
      - [raster] [list]
      - GDAL-supported raster layers.

   *  - **Resolution**
      - RESOLUTION
      - [enumeration]

        Default: *0*
      - The output resolution of the mosaic.
        By default the average resolution of the raster files
        will be chosen.
        
        Options:

        * 0 --- average
        * 1 --- highest
        * 2 --- lowest

   *  - **Place each input file into a separate band**
      - SEPARATE
      - [boolean]

        Default: *True*
      - With 'True' you can define that each raster file goes into
        a separated stacked band in the VRT band.

   *  - **Allow projection difference**
      - PROJ_DIFFERENCE
      - [boolean]

        Default: *False*
      - Allows that the output bands have different projections
        derived from the projection of the input raster layers.

   *  - **Add alpha mask band to VRT when source raster has none**
      - ADD_ALPHA
      - [boolean]
      - Adds an alpha mask band to the VRT when the source raster
        has none.

   *  - **Override projection for the output file**
   
        (optional)
      - ASSIGN_CRS
      - [crs]
      - Overrides the projection for the output file. No reprojection is done.
  
   *  - **Nodata value(s) for input bands (space separated)**
      - SRC_NODATA
      - [number] [list]
      - Space separated Nodata value(s) for input band(s)

   *  - **Resampling algorithm**
      - RESAMPLING
      - [enumeration]
      - The resampling algorithm to be used

        Options:

        * 0 --- nearest
        * 1 --- bilinear
        * 2 --- cubic
        * 3 --- cubicspline
        * 4 --- lanczos
        * 5 --- average
        * 6 --- mode

Outputs
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  -  Name
      -  Identifier
      -  Type
      -  Description

   *  -  **ParameterVrtDestination**
      -  OUTPUT
      -  [raster]
      -  Output raster layer


.. _gdalmerge:

Merge
-----
Merges raster files in a simple way. Here you can use a pseudocolor
table from an input raster and define the output raster type. All
the images must be in the same coordinate system.

This algorithm is derived from the `GDAL merge utility <https://gdal.org/gdal_merge.html>`_ .

``Default menu``: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

``Input layers`` [raster] [list]
  Input raster layers.

``Grab pseudocolor table from first layer`` [boolean]
  The pseudocolor table from the first layer will be used for the
  coloring.

  Default: *False*

``Layer stack`` [boolean]
  If 'True' is chosen each input file will be placed into a separate stacked band.

  Default: *False*

``Output raster type`` [enumeration]
  Defines the output raster type. By default this will be 'Float32'.

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

``Input pixel value to treat as "nodata"`` [number]
  Optional

  Ignores pixels from files being merged in with this pixel value.

``Assign specified "nodata" value to output`` [number]
  Optional

  Assigns the specified nodata value to output bands.

``Additional creation options``
  Optional

  Allows to add one or more creation options that can be used to control
  particulars (colorimetry, block size, file compression...) about the file to be
  created. For convenience, you can rely on predefined profiles (see
  :ref:`GDAL driver options section <gdal_createoptions>`).

Outputs
.......

``Output layer`` [raster]
  Output raster layer.

.. _gdalgdalinfo:

Raster information
------------------
The gdalinfo program lists various information about a GDAL supported raster dataset.

This algorithm is derived from the `GDAL info utility <https://gdal.org/gdalinfo.html>`_ .

``Default menu``: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

``Input layer`` [raster]
  Raster layer in input.

``Force computation of the actual min/max values for each band`` [boolean]
  Forces computation of the actual min/max values for each band in the dataset.

``Read and display image statistics (force computation if necessary)`` [boolean]
  Reads and displays image statistics. Forces computation if no statistics are stored in an image.

``Suppress GCP info`` [boolean]
  Suppresses ground control points list printing. It may be useful for datasets with huge amount of GCPs,
  such as L1B AVHRR or HDF4 MODIS which contain thousands of them.

  Default: *False*

``Suppress metadata info`` [boolean]
  Suppresses metadata printing. Some datasets may contain a lot of metadata strings.

  Default: *False*

Outputs
.......

``Layer information`` [html]
  Raster information in output.


.. _gdaltileindex:

Tile index
----------
Builds a vector layer with a record for each input raster file, an
attribute containing the filename, and a polygon geometry outlining the raster.
This output is suitable for use with MapServer as a raster tileindex.

This algorithm is derived from the
`GDAL Tile Index utility <https://gdal.org/gdaltindex.html>`_ .

``Default menu``: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

``Input files`` [raster] [list]
  The input raster files. Can be multiple files.

``Field name to hold the file path to the indexed rasters`` [string]
  Optional

  The output field name to hold the file path/location to the indexed rasters.

  Default: *location*

``Store absolute path to the indexed rasters`` [boolean]
  Set whether the absolute path to the raster files is stored in the tile index file.
  By default the raster filenames will be put in the file exactly as they are
  specified in the command.

  Default: *False*

``Skip files with different projection reference`` [boolean]
  Only files with same projection as files already inserted in the tile index
  will be inserted. Default does not check projection and accepts all inputs.

  Default: *False*

``Transform geometries to the given CRS`` [crs]
  Optional

  Geometries of input files will be transformed to the desired target coordinate
  reference system.
  Default creates simple rectangular polygons in the same coordinate reference
  system as the input rasters.

``The name of the field to store the SRS of each tile`` [string]
  Optional

  The name of the field to store the SRS of each tile.

``The format in which the CRS of each tile must be written`` [enumeration]
  Optional

  Possible values are:

  * 0 --- Auto
  * 1 --- Well-known text (WKT)
  * 2 --- EPSG
  * 3 --- Proj

  Default: *0*

Outputs
.......

``Tile index`` [vector: polygon]
  The name of the output file to create/append to. The default shapefile will
  be created if it doesn't already exist, otherwise it will append to the
  existing file.
