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
`GDAL addo utility <https://gdal.org/gdaladdo.html>`_ .

**Default menu**: :menuselection:`Raster --> Miscellaneous`

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
     - Defines the number of overview levels calculated by the
       original resolution of the input raster layer.
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

   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options
   * - **Pyramidized**
     - ``OUTPUT``
     - [raster]
     - Output raster layer

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

Python code
...........

**Algorithm ID**: ``gdal:overviews``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalbuildvirtualraster:

Build virtual raster
--------------------
Builds a VRT (Virtual Dataset) that is a mosaic of the list of input
GDAL-supported rasters.
With a mosaic you can merge several raster files.

This algorithm is derived from the
`GDAL buildvrt utility <https://gdal.org/gdalbuildvrt.html>`_ .

**Default menu**: :menuselection:`Raster --> Miscellaneous`

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
     - Overrides the projection for the output file.
       No reprojection is done.

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
   * - **Additional command-line parameters**
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options
   * - **Virtual**
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

   * - **Virtual**
     - ``OUTPUT``
     - [raster]
     - Output raster layer

Python code
...........

**Algorithm ID**: ``gdal:buildvirtualraster``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalgdal2tiles:

gdal2tiles
----------

Generates a directory with small tiles and metadata, following the
`OSGeo Tile Map Service Specification <https://wiki.osgeo.org/wiki/Tile_Map_Service_Specification>`_.
See also the
`OpenGIS Web Map Tile Service Implementation Standard
<https://www.opengeospatial.org/standards/wmts>`_.
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
   * - **Resampling method**
     - ``RESAMPLING``
     - [enumeration]

       Default: 0
     - The resampling algorithm to be used

       Options:

       * 0 --- Average (``average``)
       * 1 --- Nearest neighbour (``near``)
       * 2 --- Bilinear (``bilinear``)
       * 3 --- Cubic (``cubic``)
       * 4 --- Cubic spline (``cubicspline``)
       * 5 --- Lanczos Windowed sinc (``lanczos``)
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
   * - **Output directory**
     - ``OUTPUT``
     - [folder]

       Default: ``[Save to temporary file]``
     - Specify the output folder for the tiles.

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

   * - **Output directory**
     - ``OUTPUT``
     - [folder]
     - The output folder (for the tiles)

Python code
...........

**Algorithm ID**: ``gdal:gdal2tiles``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalmerge:

Merge
-----
Merges raster files in a simple way. Here you can use a pseudocolor
table from an input raster and define the output raster type. All
the images must be in the same coordinate system.

This algorithm is derived from the
`GDAL merge utility <https://gdal.org/gdal_merge.html>`_ .

**Default menu**: :menuselection:`Raster --> Miscellaneous`

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
     - Place each input file into a separate band
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

   * - **Input pixel value to treat as "nodata"**

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
   * - **Additional command-line parameters**
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options
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

Python code
...........

**Algorithm ID**: ``gdal:merge``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalpansharp:

Pansharpening
------------------
Performs a pan-sharpening operation.
It can create a "classic" output dataset (such as GeoTIFF),
or a VRT dataset describing the pan-sharpening operation.

See
`GDAL Pansharpen <https://gdal.org/programs/gdal_pansharpen.html>`_.

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
   * - **Spectral dataset**
     - ``SPECTRAL``
     - [raster]
     - Input (spectral) raster layer
   * - **Panchromatic dataset**
     - ``PANCHROMATIC``
     - [raster]
     - Input (panchromatic) raster layer
   * - **Resampling algorithm**
     - ``RESAMPLING``
     - [enumeration]

       Default: 2
     - The resampling algorithm to be used

       Options:

       * 0 --- Nearest Neighbour (``nearest``)
       * 1 --- Bilinear (``bilinear``)
       * 2 --- Cubic (``cubic``)
       * 3 --- Cubic Spline (``cubicspline``)
       * 4 --- Lanczos Windowed Sinc (``lanczos``)
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
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options
   * - **Output**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output (sharpened) raster layer. One of:

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
   * - **Output**
     - ``OUTPUT``
     - [raster]
     - Output (sharpened) raster layer

Python code
...........

**Algorithm ID**: ``gdal:pansharp``

.. include:: ../qgis/qgis_algs_include.rst
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

.. seealso:: :ref:`qgisrastercalculator`

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

   * - **Set output nodata value**

       Optional
     - ``NO_DATA``
     - [number]

       Default: None
     - Value to use for nodata
   * - **Output raster type**
     - ``RTYPE``
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
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: ''
     - Add extra GDAL command line options
   * - **Calculated**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output (calculated) raster layer. One of:

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
   * - **Calculated**
     - ``OUTPUT``
     - [raster]
     - Output (calculated) raster layer

Python code
...........

**Algorithm ID**: ``gdal:rastercalculator``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalgdalinfo:

Raster information
------------------
The gdalinfo program lists various information about a GDAL supported
raster dataset.

This algorithm is derived from the
`GDAL info utility <https://gdal.org/gdalinfo.html>`_ .

**Default menu**: :menuselection:`Raster --> Miscellaneous`

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
   * - **Additional command-line parameters**
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options
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
     - The HTML file containing information about the input raster
       layer

Python code
...........

**Algorithm ID**: ``gdal:gdalinfo``

.. include:: ../qgis/qgis_algs_include.rst
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
`GDAL Retile utility <https://gdal.org/gdal_retile.html>`_ .

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
   * - **Source coordinate reference system**
     - ``SOURCE_CRS``
     - [crs]

       Default: None
     -
   * - **Resampling method**
     - ``RESAMPLING``
     - [enumeration]

       Default: 0
     - The resampling algorithm to be used

       Options:

       * 0 --- Nearest Neighbour (``nearest``)
       * 1 --- Bilinear (``bilinear``)
       * 2 --- Cubic (``cubic``)
       * 3 --- Cubic Spline (``cubicspline``)
       * 4 --- Lanczos Windowed Sinc (``lanczos``)

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
   * - **Output directory**
     - ``OUTPUT``
     - [folder]

       Default: ``[Save to temporary folder]``
     - Specify the output folder for the tiles.
       One of:

       * Save to Temporary Directory
       * Save to Directory...

       The file encoding can also be changed here.
   * - **CSV file containing the tile(s) georeferencing information**
     - ``OUTPUT_CSV``
     - [file]

       Default: ``[Skip output]``
     -
       One of:

       * Skip Output
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

.. include:: ../qgis/qgis_algs_include.rst
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
`GDAL Tile Index utility <https://gdal.org/gdaltindex.html>`_ .

**Default menu**: :menuselection:`Raster --> Miscellaneous`

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

       * Save to a Temporary File
       * Save to File

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

Python code
...........

**Algorithm ID**: ``gdal:tileindex``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

