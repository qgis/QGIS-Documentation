
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

This algorithm is derived from the `GDAL addo utility <https://www.gdal.org/gdaladdo.html>`_ .

``Default menu``: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [raster]
     - Input raster layer
   * - **Overview levels**
     - ``LEVELS``
     - [string]
       
       Default: '2 4 8 16'
     - Defines the number of overview levels calculated by the original
       resolution of the input raster layer.
       By default 4 levels will be taken into consideration.
   * - **Remove all existing overviews**
     - ``CLEAN``
     - [boolean]
       
       Default: False
     - Removes existing overviews from the raster.
       By default these are not removed.
   * - **Resampling method**
       
       Optional
     - ``RESAMPLING``
     - [enumeration]
       
       Default: 0
     - Calculates the overviews with a defined resampling method.
       Possible resampling methods are:
       
       * 0 -- Nearest Neighbour (``nearest``)
       * 1 -- Average (``average``)
       * 2 -- Gaussian (``gauss``)
       * 3 -- Cubic Convolution (``cubic``)
       * 4 -- B-Spline Convolution (``cubicspline``)
       * 5 -- Lanczos Windowed Sinc (``lanczos``)
       * 6 -- Average MP (``average_mp``)
       * 7 -- Average in Mag/Phase Space (``average_magphase``)
       * 8 -- Mode (``mode``)

   * - **Overviews format**
       
       Optional
     - ``FORMAT``
     - [enumeration]
       
       Default: 0
     - The overviews can be stored internally, or externally as GTiff
       or ERDAS Imagine file.
       By default the overviews are stored in the output raster.
       Possible formats methods are:

       * 0 -- Internal (if possible)
       * 1 -- External (GTiff .ovr)
       * 2 -- External (ERDAS Imagine .aux)

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Pyramidized**
     - ``OUTPUT``
     - [raster]
     - Output raster layer with overviews


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

   * -  Name
     -  Identifier
     -  Type
     -  Description
   * - **Input layers**
     - ``INPUT``
     - [raster] [list]
     - GDAL-supported raster layers.
   * - **Resolution**
     - ``RESOLUTION``
     - [enumeration]
       
       Default: 0
     - The output resolution of the mosaic.
       By default the average resolution of the raster files
       will be chosen.
       
       Options:
       
       * 0 --- Average (``average``)
       * 1 --- Highest (``highest``)
       * 2 --- Lowest (``lowest``)

   * - **Place each input file into a separate band**
     - ``SEPARATE``
     - [boolean]
       
       Default: True
     - With 'True' you can define that each raster file goes into
       a separated stacked band in the VRT band.
   * - **Allow projection difference**
     - ``PROJ_DIFFERENCE``
     - [boolean]
       
       Default: False
     - Allows that the output bands have different projections
       derived from the projection of the input raster layers.
   * - **Add alpha mask band to VRT when source raster has none**
     - ``ADD_ALPHA``
     - [boolean]
       
       Default: False
     - Adds an alpha mask band to the VRT when the source raster
       has none.
   * - **Override projection for the output file**
       
       (optional)
     - ``ASSIGN_CRS``
     - [crs]
       
       Default: None
     - Overrides the projection for the output file. No reprojection is done.

   * - **Resampling algorithm**
     - ``RESAMPLING``
     - [enumeration]
       
       Default: 0
     - The resampling algorithm to be used

       Options:
       
       * 0 --- Nearest Neighbour (``nearest``)
       * 1 --- Bilinear (``bilinear``)
       * 2 --- Cubic Convolution (``cubic``)
       * 3 --- B-Spline Convolution (``cubicspline``)
       * 4 --- Lanczos Windowed Sinc (``lanczos``)
       * 5 --- Average (``average``)
       * 6 --- Mode (``mode``)

   * - **Nodata value(s) for input bands (space separated)**
       
       Optional
     - ``SRC_NODATA``
     - [string]
       
       Default: None
     - Space separated Nodata value(s) for input band(s)
   * -  **Additional command-line parameters**
     -  ``EXTRA``
     -  [string]
        
        Default: None
     -  Add extra GDAL command line options
   * -  **Virtual**
     -  ``OUTPUT``
     -  [raster]    
        
        Default: ``[Save to temporary file]``
     -  Specification of the output raster layer.
        One of:
        
        * Save to a Temporary File
        * Save to File...
        
        The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Name
     - Identifier
     - Type
     - Description

   * - **Virtual**
     - ``OUTPUT``
     - [raster]
     - Output raster layer


.. _gdalmerge:

Merge
-----
Merges raster files in a simple way. Here you can use a pseudocolor
table from an input raster and define the output raster type. All
the images must be in the same coordinate system.

This algorithm is derived from the `GDAL merge utility <https://www.gdal.org/gdal_merge.html>`_ .

``Default menu``: :menuselection:`Raster --> Miscellaneous`

Parameters
..........


.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layers**
     - ``INPUT``
     - [raster] [list]
     - Input raster layers
   * - **Grab pseudocolor table from first layer**
     - ``PCT``
     - [boolean]
       
       Default: False
     - The pseudocolor table from the first layer will be used
       for the coloring
   * - **Place each input file into a separate band**
     - ``SEPARATE``
     - [boolean]
       
       Default: False
     - 
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]
       
       Default: 5
     - Defines the format of the output raster file.

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
       
   * - **Input pixel value to treat as "nodata**
       
       Optional
     - ``NODATA_INPUT``
     - [number]
       
       Default: None
     - Ignores pixels from files being merged in with this pixel value
   * - **Assign specified "nodata" value to output**
       
       Optional
     - ``NODATA_OUTPUT``
     - [number]
       
       Default: None
     - Assigns the specified nodata value to output bands.
   * - **Additional creation options**
       
       Optional
     - ``OPTIONS``
     - [string]
        
       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Merged**
     - ``OUTPUT``
     - [raster]
       
       Default: ``[Save to temporary file]``
     - Specification of the output raster layer.
       One of:
       
       * Save to a Temporary File
       * Save to File...
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Merged**
     - ``OUTPUT``
     - [raster]
     - Output raster layer


.. _gdalgdalinfo:

Raster information
------------------
The gdalinfo program lists various information about a GDAL supported raster dataset.

This algorithm is derived from the `GDAL info utility <https://www.gdal.org/gdalinfo.html>`_ .

``Default menu``: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [raster]
     - Input raster layer
   * - **Force computation of the actual min/max values for each band**
     - ``MIN_MAX``
     - [boolean]
       
       Default: False
     - Forces computation of the actual min/max values for each band in
       the dataset
   * - **Read and display image statistics (force computation if necessary)**
     - ``STATS``
     - [boolean]
       
       Default: False
     - Reads and displays image statistics. Forces computation if no
       statistics are stored in an image.
   * - **Suppress GCP info**
     - ``NO_GCP``
     - [boolean]
       
       Default: False
     - Suppresses ground control points list printing.
       It may be useful for datasets with huge amount of GCPs, such as
       L1B AVHRR or HDF4 MODIS which contain thousands of them.
   * - **Suppress metadata info**
     - ``NO_METADATA``
     - [boolean]
       
       Default: False
     - Suppresses metadata printing.
       Some datasets may contain a lot of metadata strings.
   * - **Layer information**
     - ``OUTPUT``
     - [html]
       
       Default: ``[Save to temporary file]``
     - Specify the HTML file for output.

       One of:
       
       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.
  
Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Layer information**
     - ``OUTPUT``
     - [html]
     - The HTML file containing information about the input raster layer


.. _gdaltileindex:

Tile index
----------
Builds a vector layer with a record for each input raster file, an
attribute containing the filename, and a polygon geometry outlining the raster.
This output is suitable for use with MapServer as a raster tileindex.

This algorithm is derived from the
`GDAL Tile Index utility <https://www.gdal.org/gdaltindex.html>`_ .

``Default menu``: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input files**
     - ``LAYERS``
     - [raster] [list]
     - The input raster files. Can be multiple files.
   * - **Field name to hold the file path to the indexed rasters**
     - ``PATH_FIELD_NAME``
       Optional
     - [string]
       
       Default: 'location'
     - The output field name to hold the file path/location to the
       indexed rasters.
   * - **Store absolute path to the indexed rasters**
     - ``ABSOLUTE_PATH``
     - [boolean]
       
       Default: False
     - Set whether the absolute path to the raster files is
       stored in the tile index file.
       By default the raster filenames will be put in the
       file exactly as they are specified in the command.
   * - **Skip files with different projection reference**
     - ``PROJ_DIFFERENCE``
     - [boolean]
       
       Default: False
     - Only files with same projection as files already inserted
       in the tile index will be inserted.
       Default does not check projection and accepts all inputs.
   * - **Transform geometries to the given CRS**
       
       Optional
     - ``TARGET_CRS``
     - [crs]
     - Geometries of input files will be transformed to the specified
       target coordinate reference system.
       Default creates simple rectangular polygons in the same
       coordinate reference system as the input rasters.
   * - **The name of the field to store the SRS of each tile**
       
       Optional
     - ``CRS_FIELD_NAME``
     - [string]
     - The name of the field to store the SRS of each tile
   * - **The format in which the CRS of each tile must be written**
     - ``CRS_FORMAT``
     - [enumeration]
       Default: 0
     - Format for the CRS. One of:

       * 0 -- Auto (``AUTO``)
       * 1 -- Well-known text (``WKT``)
       * 2 -- EPSG (``EPSG``)
       * 3 -- Proj.4 (``PROJ``)

   * - **Tile index**
     - ``OUTPUT``
     - [vector: polygon]
       
       Default: ``[Save to temporary file]``
     - Specify the polygon vector layer to write the index to.
       One of:
       
       * ``Save to a Temporary File``
       * ``Save to File``
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Tile index**
     - ``OUTPUT``
     - [vector: polygon]
     - The polygon vector layer with the tile index.
