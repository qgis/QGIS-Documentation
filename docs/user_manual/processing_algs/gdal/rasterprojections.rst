Raster projections
==================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalassignprojection:

Assign projection
-----------------
Applies a coordinate system to a raster dataset.

This algorithm is derived from the
`GDAL edit utility <https://gdal.org/gdal_edit.html>`_ .

**Default menu**: :menuselection:`Raster --> Projections`

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
     - ``INPUT_LAYER``
     - [raster]
     - Input raster layer
   * - **Desired CRS**
     - ``CRS``
     - [crs]
     - The projection (CRS) of the output layer

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
   * - **Layer with projection**
     - ``OUTPUT``
     - [raster]
     - The output raster layer (with the new projection information)

**Algorithm ID**: ``gdal:assignprojection``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalextractprojection:

Extract projection
------------------
Extracts the projection of a raster file and writes it into a *world*
file with extension :file:`.wld`.

This algorithm is derived from the
`GDAL srsinfo utility <https://gdal.org/gdalsrsinfo.html>`_ .

**Default menu**: :menuselection:`Raster --> Projections`

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
   *  - **Input file**
      - ``INPUT_LAYER``
      - [raster]
      - Input raster
        The raster layer has to be file based, as the algorithm
        uses the path to the raster file as the location of the
        generated :file:`.wld` file.
        Using a non-file raster layer will lead to an error.
   *  - **Create also .prj file**
      - ``PRJ_FILE_CREATE``
      - [boolean]

        Default: False
      - If this is activated a :file:`.prj` file containing the
        projection information is also created.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **World file**
      - ``WORLD_FILE``
      - [file]
      - Text file with extension :file:`.wld` containing
	transformation parameters for the raster file.
   *  - **ESRI Shapefile prj file**
      - ``PRJ_FILE``
      - [file]
      - Text file with :file:`.prj` extension that describes the CRS.
        Will be ``None`` if :guilabel:`Create also .prj file` is
	False.

**Algorithm ID**: ``gdal:extractprojection``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalwarpreproject:

Warp (reproject)
----------------
Reprojects a raster layer into another Coordinate Reference System
(CRS).
The output file resolution and the resampling method can be chosen.

This algorithm is derived from the
`GDAL warp utility <https://gdal.org/gdalwarp.html>`_ .

**Default menu**: :menuselection:`Raster --> Projections`

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
     - Input raster layer to reproject
   * - **Source CRS**

       Optional
     - ``SOURCE_CRS``
     - [crs]
     - Defines the CRS of the input raster layer
   * - **Target CRS**

       Optional
     - ``TARGET_CRS``
     - [crs]

       Default: ``EPSG:4326``
     - The CRS of the output layer
   * - **Resampling method to use**
     - ``RESAMPLING``
     - [enumeration]

       Default: 0
     - Pixel value resampling method to use.
       Options:

       * 0 --- Nearest neighbour
       * 1 --- Bilinear
       * 2 --- Cubic
       * 3 --- Cubic spline
       * 4 --- Lanczos windowed sinc
       * 5 --- Average
       * 6 --- Mode
       * 7 --- Maximum
       * 8 --- Minimum
       * 9 --- Median
       * 10 --- First quartile
       * 11 --- Third quartile

   * - **Nodata value for output bands**

       Optional
     - ``NODATA``
     - [number]

       Default: None
     - Sets nodata value for output bands.
       If not provided, then nodata values will be copied from
       the source dataset.
   * - **Output file resolution in target georeferenced units**

       Optional
     - ``TARGET_RESOLUTION``
     - [number]

       Default: None
     - Defines the output file resolution of reprojection result
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
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]

       Default: 0
     - Defines the format of the output raster file.

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
       
   * - **Georeferenced extents of output file to be created**

       Optional
     - ``TARGET_EXTENT``
     - [extent]
     - Sets the georeferenced extent of the output file to be
       created (in the :guilabel:`Target CRS` by default.
       In the :guilabel:`CRS of the target raster extent`, if
       specified).
   * - **CRS of the target raster extent**

       Optional
     - ``TARGET_EXTENT_CRS``
     - [crs]
     - Specifies the CRS in which to interpret the coordinates given
       for the extent of the output file.
       This must not be confused with the target CRS of the output
       dataset.
       It is instead a convenience e.g. when knowing the output
       coordinates in a geodetic long/lat CRS, but wanting a result
       in a projected coordinate system.
   * - **Use multithreaded warping implementation**
     - ``MULTITHREADING``
     - [boolean]

       Default: False
     - Two threads will be used to process chunks of the image and
       perform input/output operations simultaneously.
       Note that the computation itself is not multithreaded.
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options.
   * - **Reprojected**
     - ``OUTPUT``
     - [raster]

       Default: '[Save to temporary file]'
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
   * - **Reprojected**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Reprojected output raster layer

**Algorithm ID**: ``gdal:warpreproject``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
