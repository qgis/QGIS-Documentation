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
     - Raster layer to convert
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: The first band of the input layer
     - If the raster is multiband, choose the band you want to
       convert
   * - **Output comma-separated values**
     - ``CSV``
     - [boolean]

       Default: False
     - Sets whether the output file should be of type comma-separated
       values (csv).
   * - **XYZ ASCII file**
     - ``OUTPUT``
     - [file]

       Default: ``[Save to temporary file]``
     - Specification of the output file.
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
   * - **XYZ ASCII file**
     - ``INPUT``
     - [table]
     - Table file containing the values exported from the raster band.

**Algorithm ID**: ``gdal:gdal2xyz``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalpcttorgb:

PCT to RGB
----------
Converts an 8 bit paletted image to a 24 bit RGB.
It will convert a pseudocolor band from the input file to
an RGB file of the desired format.

This algorithm is derived from the
`GDAL pct2rgb utility <https://gdal.org/pct2rgb.html>`_ .

**Default menu**: :menuselection:`Raster --> Conversion`

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
     - Input 8 bit raster image
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: The first band of the input layer
     - If the raster is multiband, choose the band you want to
       convert
   * - **Generate a RGBA file**
     - ``RGBA``
     - [boolean]

       Default: False
     - Sets whether the output file should be of type RGBA.
   * - **PCT to RGB**
     - ``OUTPUT``
     - [file]

       Default: ``[Save to temporary file]``
     - Specification of the output file.
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
   * - **PCT to RGB**
     - ``OUTPUT``
     - [raster]
     - 24 bit RGB raster image

**Algorithm ID**: ``gdal:pcttorgb``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalpolygonize:

Polygonize (raster to vector)
-----------------------------
Creates vector polygons for all connected regions of pixels in the
raster sharing a common pixel value. Each polygon is created with an
attribute indicating the pixel value of that polygon.

This algorithm is derived from the
`GDAL polygonize utility <https://gdal.org/gdal_polygonize.html>`_ .

**Default menu**: :menuselection:`Raster --> Conversion`

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
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: The first band of the input layer
     - If the raster is multiband, choose the band you want to use
   * - **Name of the field to create**
     - ``FIELD``
     - [string]

       Default: 'DN'
     - Specify the field name for the attributes of the connected
       regions.
   * - **Use 8-connectedness**
     - ``EIGHT_CONNECTEDNESS``
     - [boolean]

       Default: False
     - If not set, raster cells must have a common border to be
       considered connected (*4-connected*).
       If set, touching raster cells are also considered connected
       (*8-connected*).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
   * - **Vectorized**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Save to temporary file]``
     - Specification of the output (polygon) vector layer.
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
   * - **Vectorized**
     - ``OUTPUT``
     - [vector: polygon]
     - Output vector layer

**Algorithm ID**: ``gdal:polygonize``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalrearrange_bands:

Rearrange bands
---------------
Creates a new raster using selected band(s) from a given raster layer.
The algorithm also makes it possible to reorder the bands for the
newly-created raster.

This algorithm is derived from the
`GDAL translate utility <https://gdal.org/gdal_translate.html>`_ .

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
   * - **Selected band(s)**
     - ``BANDS``
     - [raster band] [list]

       Default: None
     - Ordered list of the bands to use to create the new raster
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
     - Defines the data type of the output raster file.
       Options:

       * 0 --- Use Input Layer Data Type
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

   * - **Converted**
     - ``OUTPUT``
     - [raster]

       Default: Save to temporary file
     - Specification of the output raster. One of:

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
   * - **Converted**
     - ``OUTPUT``
     - [raster]
     - Output raster layer with rearranged bands.

**Algorithm ID**: ``gdal:rearrange_bands``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalrgbtopct:

RGB to PCT
----------
Converts a 24 bit RGB image into a 8 bit paletted.
Computes an optimal pseudo-color table for the given RGB-image using a
median cut algorithm on a downsampled RGB histogram.
Then it converts the image into a pseudo-colored image using the color
table. This conversion utilizes Floyd-Steinberg dithering (error
diffusion) to maximize output image visual quality.

If you want to classify a raster map and want to reduce the number of
classes it can be helpful to downsample your image with this algorithm
before.

This algorithm is derived from the
`GDAL rgb2pct utility <https://gdal.org/rgb2pct.html>`_ .

**Default menu**: :menuselection:`Raster --> Conversion`

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
     - Input (RGB) raster layer
   * - **Number of colors**
     - ``NCOLORS``
     - [number]

       Default: 2
     - The number of colors the resulting image will contain.
       A value from 2-256 is possible.
   * - **RGB to PCT**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

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
   * - **RGB to PCT**
     - ``OUTPUT``
     - [raster]
     - Output raster layer.

**Algorithm ID**: ``gdal:rgbtopct``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdaltranslate:

Translate (convert format)
--------------------------

Converts raster data between different formats.

This algorithm is derived from the
`GDAL translate utility <https://gdal.org/gdal_translate.html>`_ .

**Default menu**: :menuselection:`Raster --> Conversion`

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
   * - **Override the projection of the output file**

       Optional
     - ``TARGET_CRS``
     - [crs]
     - Specify a projection for the output file
   * - **Assign a specified nodata value to output bands**
       
       Optional
     - ``NODATA``
     - [number]

       Default: Not set
     - Defines the value to use for nodata in the output raster
   * - **Copy all subdatasets of this file to individual output files**
     - ``COPY_SUBDATASETS``
     - [boolean]

       Default: False
     - Create individual files for subdatasets
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
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]

       Default: 0
     - Defines the data type of the output raster file.
       Options:

       * 0 --- Use Input Layer Data Type
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

   * - **Converted**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output (translated) raster layer.
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
   * - **Converted**
     - ``OUTPUT``
     - [raster]
     - Output (translated) raster layer.

**Algorithm ID**: ``gdal:translate``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
