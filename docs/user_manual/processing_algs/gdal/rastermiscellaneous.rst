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

This algorithm is derived from the
`GDAL addo utility <https://gdal.org/programs/gdaladdo.html>`_.

**Default menu**: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [raster]
     - Input raster layer
   * - **Remove all existing overviews**
     - ``CLEAN``
     - [boolean]

       Default: False
     - Removes existing overviews from the raster.
       By default these are not removed.

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Overview levels**
     - ``LEVELS``
     - [string]

       Default: '2 4 8 16'
     - Defines the number of overview levels calculated by the
       original resolution of the input raster layer.
       By default 4 levels will be taken into consideration.
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
       * 3 -- Cubic (4x4 kernel) (``cubic``)
       * 4 -- Cubic B-Spline (4x4 kernel) (``cubicspline``)
       * 5 -- Lanczos (6x6 kernel) (``lanczos``)
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
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Pyramidized**
     - ``OUTPUT``
     - [raster]
     - Output raster layer with overviews

Python code
...........

**Algorithm ID**: ``gdal:overviews``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalbuildvirtualraster:

Build virtual raster
--------------------
Builds a VRT (Virtual Dataset) that is a mosaic of the list of input
GDAL-supported rasters.
With a mosaic you can merge several raster files.

This algorithm is derived from the
`GDAL buildvrt utility <https://gdal.org/programs/gdalbuildvrt.html>`_.

**Default menu**: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
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

       Default: False
     - With 'True' you can define that each raster file goes into
       a separated stacked band in the VRT band.
   * - **Allow projection difference**
     - ``PROJ_DIFFERENCE``
     - [boolean]

       Default: False
     - Allows that the output bands have different projections
       derived from the projection of the input raster layers.
   * - **Virtual**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster layer.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Add alpha mask band to VRT when source raster has none**
     - ``ADD_ALPHA``
     - [boolean]

       Default: False
     - Adds an alpha mask band to the VRT when the source raster
       has none.
   * - **Override projection for the output file**

       Optional
     - ``ASSIGN_CRS``
     - [crs]

       Default: None
     - Overrides the projection for the output file.
       No reprojection is done.
   * - **Resampling algorithm**
     - ``RESAMPLING``
     - [enumeration]

       Default: 0
     - The `resampling algorithm <https://gdal.org/programs/gdalwarp.html#cmdoption-gdalwarp-r>`_ to use.
       Options:

       * 0 --- Nearest Neighbour (``nearest``)
       * 1 --- Bilinear (2x2 kernel) (``bilinear``)
       * 2 --- Cubic (4x4 kernel) (``cubic``)
       * 3 --- Cubic B-Spline (4x4 kernel) (``cubicspline``)
       * 4 --- Lanczos (6x6 kernel) (``lanczos``)
       * 5 --- Average (``average``)
       * 6 --- Mode (``mode``)
   * - **NoData value(s) for input bands (space separated)**

       Optional
     - ``SRC_NODATA``
     - [string]

       Default: None
     - Space separated NoData value(s) for input band(s)
   * - **Additional command-line parameters**
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description

   * - **Virtual**
     - ``OUTPUT``
     - [raster]
     - Output raster layer

Python code
...........

**Algorithm ID**: ``gdal:buildvirtualraster``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalgdal2tiles:

gdal2tiles
----------

Generates a directory with small tiles and metadata, following the
`OSGeo Tile Map Service Specification <https://wiki.osgeo.org/wiki/Tile_Map_Service_Specification>`_.
See also the
`OpenGIS Web Map Tile Service Implementation Standard
<https://www.ogc.org/standards/wmts>`_.
Simple web pages with viewers based on Google Maps, OpenLayers and
Leaflet are generated as well.
To explore your maps on-line in the web browser, you only need to
upload the generated directory onto a web server.

This algorithm also creates the necessary metadata for Google Earth
(KML SuperOverlay), in case the supplied map uses ``EPSG:4326``
projection.

ESRI world files and embedded georeferencing is used during tile
generation, but you can publish a picture without proper
georeferencing too.

This algorithm is derived from the
`GDAL gdal2tiles utility <https://gdal.org/programs/gdal2tiles.html>`_.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [raster]
     - GDAL-supported raster layer.
   * - **Tile cutting profile**
     - ``PROFILE``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- Mercator (``mercator``)
       * 1 --- Geodetic (``geodetic``)
       * 2 --- Raster (``raster``)

   * - **Zoom levels to render**

       Optional
     - ``ZOOM``
     - [string]

       Default: ''
     -
   * - **Web viewer to generate**
     - ``VIEWER``
     - [enumerate]

       Default: 0
     - One of:

       * 0 --- All (``all``)
       * 1 --- GoogleMaps (``google``)
       * 2 --- OpenLayers (``openlayers``)
       * 3 --- Leaflet (``leaflet``)
       * 4 --- None (``none``)

   * - **Title of the map**

       Optional
     - ``TITLE``
     - [string]

       Default: ''
     -
   * - **Copyright of the map**
     - ``COPYRIGHT``
     - [string]

       Default: ''
     -

   * - **Output directory**
     - ``OUTPUT``
     - [folder]

       Default: ``[Save to temporary folder]``
     - Specify the output folder for the tiles. One of:

       .. include:: ../algs_include.rst
          :start-after: **directory_output_types**
          :end-before: **end_directory_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Resampling method**
     - ``RESAMPLING``
     - [enumeration]

       Default: 0
     - The resampling algorithm to use.
       Options:

       * 0 --- Average (``average``)
       * 1 --- Nearest Neighbour (``near``)
       * 2 --- Bilinear (2x2 kernel) (``bilinear``)
       * 3 --- Cubic (4x4 kernel) (``cubic``)
       * 4 --- Cubic B-Spline (4x4 kernel) (``cubicspline``)
       * 5 --- Lanczos (6x6 kernel) (``lanczos``)
       * 6 --- Antialias (``antialias``)

   * - **The spatial reference system used for the source input data**

       Optional
     - ``SOURCE_CRS``
     - [crs]

       Default: None
     -
   * - **Transparency value to assign to the input data**

       Optional
     - ``NODATA``
     - [number]

       Default: 0.0
     -
   * - **URL address where the generated tiles are going to be published**

       Optional
     - ``URL``
     - [string]

       Default: ''
     -
   * - **Google Maps API key (http://code.google.com/apis/maps/signup.html)**

       Optional
     - ``GOOGLE_KEY``
     - [string]

       Default: ''
     - Your Google maps API key.
   * - **Bing Maps API key (https://www.bingmapsportal.com/)**

       Optional
     - ``BING_KEY``
     - [string]

       Default: ''
     - Your Bing maps API key.
   * - **Generate only missing files**
     - ``RESUME``
     - [boolean]

       Default: False
     -
   * - **Generate KML for Google Earth**
     - ``KML``
     - [boolean]

       Default: False
     -
   * - **Avoid automatic generation of KML files for EPSG:4326**
     - ``NO_KML``
     - [boolean]

       Default: False
     -

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output directory**
     - ``OUTPUT``
     - [folder]
     - The output folder (for the tiles)

Python code
...........

**Algorithm ID**: ``gdal:gdal2tiles``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalmerge:

Merge
-----
Merges raster files in a simple way. Here you can use a pseudocolor
table from an input raster and define the output raster type. All
the images must be in the same coordinate system.

This algorithm is derived from the
`GDAL merge utility <https://gdal.org/programs/gdal_merge.html>`_.

**Default menu**: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

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
     - Place each input file into a separate band
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]

       Default: 5
     - Defines the format of the output raster file.
       Options:

       .. include:: ../algs_include.rst
          :start-after: **raster_data_types**
          :end-before: **end_raster_data_types**

   * - **Merged**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster layer.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input pixel value to treat as "NoData"**

       Optional
     - ``NODATA_INPUT``
     - [number]

       Default: None
     - Ignores pixels from files being merged in with this pixel value
   * - **Assign specified "NoData" value to output**

       Optional
     - ``NODATA_OUTPUT``
     - [number]

       Default: None
     - Assigns the specified NoData value to output bands.
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

       Batch Process and Model Designer: separate multiple options with a pipe
       character (``|``).
   * - **Additional command-line parameters**
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Merged**
     - ``OUTPUT``
     - [raster]
     - Output raster layer

Python code
...........

**Algorithm ID**: ``gdal:merge``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalpansharp:

Pansharpening
------------------
Performs a pan-sharpening operation.
It can create a "classic" output dataset (such as GeoTIFF),
or a VRT dataset describing the pan-sharpening operation.

See `GDAL Pansharpen <https://gdal.org/programs/gdal_pansharpen.html>`_.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Spectral dataset**
     - ``SPECTRAL``
     - [raster]
     - Input (spectral) raster layer
   * - **Panchromatic dataset**
     - ``PANCHROMATIC``
     - [raster]
     - Input (panchromatic) raster layer
   * - **Output**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output (sharpened) raster layer. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Resampling algorithm**
     - ``RESAMPLING``
     - [enumeration]

       Default: 2
     - The `resampling algorithm <https://gdal.org/programs/gdalwarp.html#cmdoption-gdalwarp-r>`_ to use.
       Options:

       * 0 --- Nearest Neighbour (``nearest``)
       * 1 --- Bilinear (2x2 kernel) (``bilinear``)
       * 2 --- Cubic (4x4 kernel) (``cubic``)
       * 3 --- Cubic B-Spline (4x4 kernel) (``cubicspline``)
       * 4 --- Lanczos (6x6 kernel) (``lanczos``)
       * 5 --- Average (``average``)

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

       Batch Process and Model Designer: separate multiple options with a pipe
       character (``|``).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output**
     - ``OUTPUT``
     - [raster]
     - Output (sharpened) raster layer

Python code
...........

**Algorithm ID**: ``gdal:pansharp``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalrastercalculator:

Raster calculator
-----------------
Command line raster calculator with numpy syntax.
Use any basic arithmetic supported by numpy arrays,
such as +, -, \*, and / along with logical operators,
such as >.
Note that all input rasters must have the same
dimensions, but no projection checking is performed.

See the
`GDAL Raster Calculator utility docs <https://gdal.org/programs/gdal_calc.html>`_.

.. seealso:: :ref:`qgisrastercalc`, :ref:`qgisvirtualrastercalc`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer A**
     - ``INPUT_A``
     - [raster]
     - First input raster layer (mandatory)
   * - **Number of raster band for A**
     - ``BAND_A``
     - [raster band]
     - Band for input layer A (mandatory)
   * - **Input layer B**

       Optional
     - ``INPUT_B``
     - [raster]

       Default: None
     - Second input raster layer
   * - **Number of raster band for B**

       Optional
     - ``BAND_B``
     - [raster band]
     - Band for input layer B
   * - **Input layer C**

       Optional
     - ``INPUT_C``
     - [raster]

       Default: None
     - Third input raster layer
   * - **Number of raster band for C**

       Optional
     - ``BAND_C``
     - [raster band]
     - Band for input layer C
   * - **Input layer D**

       Optional
     - ``INPUT_D``
     - [raster]

       Default: None
     - Fourth input raster layer
   * - **Number of raster band for D**

       Optional
     - ``BAND_D``
     - [raster band]
     - Band for input layer D
   * - **Input layer E**

       Optional
     - ``INPUT_E``
     - [raster]

       Default: None
     - Fifth input raster layer
   * - **Number of raster band for E**

       Optional
     - ``BAND_E``
     - [raster band]
     - Band for input layer E
   * - **Input layer F**

       Optional
     - ``INPUT_F``
     - [raster]
     - Sixth input raster layer
   * - **Number of raster band for F**

       Optional
     - ``BAND_F``
     - [raster band]

       Default: None
     - Band for input layer F
   * - **Calculation in gdalnumeric syntax using +-/\* or any numpy array functions (i.e. logical_and())**
     - ``FORMULA``
     - [string]

       Default: ''
     - The calculation formula.
       Examples:

       * ``A*(A>0)`` --- outputs the value of the raster A if
         the value of A is greater than 0.
         If not, outputs 0.
       * ``A*(A>0 and A>B)``--- outputs the value of A if that value
         is bigger than 0 and bigger than the value of B.
         If not, outputs 0.
       * ``A*logical_or(A<=177,A>=185)`` --- outputs the value of A
         if A <= 177 or A >= 185.
         If not, outputs 0.
       * ``sqrt(A*A+B*B)`` --- Outputs the square root of the sum of
         the value of A squared and the value of B squared.

   * - **Set output NoData value**

       Optional
     - ``NO_DATA``
     - [number]

       Default: None
     - Value to use for NoData
   * - **Handling of extent differences**
     - ``EXTENT_OPT``
     - [enumeration]

       Default: 0
     - Determines how to handle rasters with different extents. Only available with GDAL 3.3+.
       `Supported options <https://gdal.org/programs/gdal_calc.html#cmdoption-extent>`_ are:

       * 0 --- Ignore
       * 1 --- Fail
       * 2 --- Union
       * 3 --- Intersect
   * - **Output extent**

       Optional
     - ``INPUT``
     - [extent]
     - Custom extent of the output raster. Only available with GDAL 3.3+.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Output raster type**
     - ``RTYPE``
     - [enumeration]

       Default: 5
     - Defines the data type of the output raster file.
       Options:

       .. include:: ../algs_include.rst
          :start-after: **raster_data_types**
          :end-before: **end_raster_data_types**

   * - **Calculated**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output (calculated) raster layer. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
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

       Batch Process and Model Designer: separate multiple options with a pipe
       character (``|``).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: ''
     - Add extra GDAL command line options


Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Calculated**
     - ``OUTPUT``
     - [raster]
     - Output (calculated) raster layer

Python code
...........

**Algorithm ID**: ``gdal:rastercalculator``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalgdalinfo:

Raster information
------------------
The gdalinfo program lists various information about a GDAL supported
raster dataset.

This algorithm is derived from the
`GDAL info utility <https://gdal.org/programs/gdalinfo.html>`_.

**Default menu**: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

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

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer information**
     - ``OUTPUT``
     - [html]
     - The HTML file containing information about the input raster
       layer

Python code
...........

**Algorithm ID**: ``gdal:gdalinfo``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalretile:

Retile
------
Retiles a set of input tiles.
All the input tiles must be georeferenced in the same
coordinate system and have a matching number of bands.
Optionally pyramid levels are generated.

This algorithm is derived from the
`GDAL Retile utility <https://gdal.org/programs/gdal_retile.html>`_.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input files**
     - ``INPUT``
     - [raster] [list]
     - The input raster files
   * - **Tile width**
     - ``TILE_SIZE_X``
     - [number]

       Default: 256
     - Width of the tiles in pixels (minimum 0)
   * - **Tile height**
     - ``TILE_SIZE_Y``
     - [number]

       Default: 256
     - Height of the tiles in pixels (minimum 0)
   * - **Overlap in pixels between consecutive tiles**
     - ``OVERLAP``
     - [number]

       Default: 0
     -
   * - **Number of pyramid levels to build**
     - ``LEVELS``
     - [number]

       Default: 1
     - Minimum: 0
   * - **Output directory**
     - ``OUTPUT``
     - [folder]

       Default: ``[Save to temporary folder]``
     - Specify the output folder for the tiles.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **directory_output_types**
          :end-before: **end_directory_output_types**

   * - **CSV file containing the tile(s) georeferencing information**
     - ``OUTPUT_CSV``
     - [file]

       Default: ``[Skip output]``
     - Specify the output file for the tiles. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Source coordinate reference system**

       Optional
     - ``SOURCE_CRS``
     - [crs]

       Default: None
     -
   * - **Resampling method**
     - ``RESAMPLING``
     - [enumeration]

       Default: 0
     - The `resampling algorithm <https://gdal.org/programs/gdalwarp.html#cmdoption-gdalwarp-r>`_ to use.
       Options:

       * 0 --- Nearest Neighbour (``nearest``)
       * 1 --- Bilinear (2x2 kernel) (``bilinear``)
       * 2 --- Cubic (4x4 kernel) (``cubic``)
       * 3 --- Cubic B-Spline (4x4 kernel) (``cubicspline``)
       * 4 --- Lanczos (6x6 kernel) (``lanczos``)

   * - **Column delimiter used in the CSV file**

       Optional
     - ``DELIMITER``
     - [string]

       Default: ';'
     - Delimiter to use in the CSV file containing the tile(s)
       georeferencing information
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

       Batch Process and Model Designer: separate multiple options with a pipe
       character (``|``).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: ''
     - Add extra GDAL command line options
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]

       Default: 5
     - Defines the format of the output raster file.
       Options:

       .. include:: ../algs_include.rst
          :start-after: **raster_data_types**
          :end-before: **end_raster_data_types**

   * - **Build only the pyramids**
     - ``ONLY_PYRAMIDS``
     - [boolean]

       Default: False
     -
   * - **Use separate directory for each tile row**
     - ``DIR_FOR_ROW``
     - [boolean]

       Default: False
     -


Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output directory**
     - ``OUTPUT``
     - [folder]
     - The output folder for the tiles.
   * - **CSV file containing the tile(s) georeferencing information**
     - ``OUTPUT_CSV``
     - [file]
     - The CSV file with georeferencing information for the tiles.

Python code
...........

**Algorithm ID**: ``gdal:retile``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdaltileindex:

Tile index
----------
Builds a vector layer with a record for each input raster file, an
attribute containing the filename, and a polygon geometry outlining
the raster.
This output is suitable for use with MapServer as a raster tileindex.

This algorithm is derived from the
`GDAL Tile Index utility <https://gdal.org/programs/gdaltindex.html>`_.

**Default menu**: :menuselection:`Raster --> Miscellaneous`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

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
   * - **Tile index**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Save to temporary file]``
     - Specify the polygon vector layer to write the index to.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
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

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Tile index**
     - ``OUTPUT``
     - [vector: polygon]
     - The polygon vector layer with the tile index.

Python code
...........

**Algorithm ID**: ``gdal:tileindex``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalviewshed:

Viewshed
--------

Calculates a viewshed raster from an input raster DEM using method defined in
`Wang2000 <https://gdal.org/programs/gdal_viewshed.html#wang2000>`_ for a user
defined point.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [raster]
     - Input elevation raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - The number of the band to use as elevation
   * - **Observer location**
     - ``OBSERVER``
     - [point]
     - The location of the observer
   * - **Observer height**
     - ``OBSERVER_HEIGHT``
     - [number]

       Default: 1.0
     - The altitude of the observer, in the DEM units
   * - **Target height**
     - ``TARGET_HEIGHT``
     - [number]

       Default: 1.0
     - The altitude of the target element, in the DEM units
   * - **Maximum distance from observer to compute visibility**
     - ``MAX_DISTANCE``
     - [number]

       Default: 100.0
     - Maximum distance from observer to compute visibility,
       in the DEM units
   * - **Output**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Output raster layer. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
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

       Batch Process and Model Designer: separate multiple options with a pipe
       character (``|``).
   * - **Additional command-line parameters**
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output**
     - ``OUTPUT``
     - [raster]
     - The raster layer displaying the viewshed.

Python code
...........

**Algorithm ID**: ``gdal:viewshed``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
