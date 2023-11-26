Raster extraction
=================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalcliprasterbyextent:

Clip raster by extent
---------------------
Clips any GDAL-supported raster file to a given extent.

This algorithm is derived from the
`GDAL translate utility <https://gdal.org/programs/gdal_translate.html>`_.

**Default menu**: :menuselection:`Raster --> Extraction`

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
     - The input raster
   * - **Clipping extent**
     - ``EXTENT``
     - [extent]
     - Extent that should be used for the output raster.
       Only pixels within the specified bounding box will be
       included in the output.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Override the projection for the output file**
     - ``OVERCRS``
     - [boolean]

       Default: False
     - If checked, the output file is assigned the input layer CRS.
   * - **Assign a specified NoData value to output bands**

       Optional
     - ``NODATA``
     - [number]

       Default: None
     - Defines a value that should be inserted for the NoData
       values in the output raster
   * - **Clipped (extent)**
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
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]

       Default: 0
     - Defines the format of the output raster file.

       Options:

       .. include:: ../algs_include.rst
          :start-after: **raster_data_types_extended**
          :end-before: **end_raster_data_types_extended**

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
   * - **Clipped (extent)**
     - ``OUTPUT``
     - [raster]
     - Output raster layer clipped by the given extent

Python code
...........

**Algorithm ID**: ``gdal:cliprasterbyextent``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalcliprasterbymasklayer:

Clip raster by mask layer
-------------------------
Clips any GDAL-supported raster by a vector mask layer.

This algorithm is derived from the
`GDAL warp utility <https://gdal.org/programs/gdalwarp.html>`_.

**Default menu**: :menuselection:`Raster --> Extraction`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 30 20 20 30
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [raster]
     - The input raster
   * - **Mask layer**
     - ``MASK``
     - [vector: polygon]
     - Vector mask for clipping the raster
   * - **Source CRS**
     - ``SOURCE_CRS``
     - [crs]
     - Set the coordinate reference to use for the input raster
   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]
     - Set the coordinate reference to use for the mask layer
   * - **Target extent**

       Optional
     - ``TARGET_EXTENT``
     - [extent]
     - Extent of the output file to be created

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Assign a specified NoData value to output bands**

       Optional
     - ``NODATA``
     - [number]

       Default: None
     - Defines a value that should be inserted for the NoData
       values in the output raster
   * - **Create an output alpha band**
     - ``ALPHA_BAND``
     - [boolean]

       Default: False
     - Creates an alpha band for the result.
       The alpha band then includes the transparency values of the pixels.
   * - **Match the extent of the clipped raster to the extent of the mask layer**
     - ``CROP_TO_CUTLINE``
     - [boolean]

       Default: True
     - Applies the vector layer extent to the output raster if checked.
   * - **Keep resolution of input raster**
     - ``KEEP_RESOLUTION``
     - [boolean]

       Default: False
     - The resolution of the output raster will not be changed
   * - **Set output file resolution**
     - ``SET_RESOLUTION``
     - [boolean]

       Default: False
     - Shall the output resolution (cell size) be specified
   * - **X Resolution to output bands**

       Optional
     - ``X_RESOLUTION``
     - [number]

       Default: None
     - The width of the cells in the output raster
   * - **Y Resolution to output band**

       Optional
     - ``Y_RESOLUTION``
     - [number]

       Default: None
     - The height of the cells in the output raster
   * - **Use multithreaded warping implementation**
     - ``MULTITHREADING``
     - [boolean]

       Default: False
     - Two threads will be used to process chunks of image
       and perform input/output operation simultaneously.
       Note that computation is not multithreaded itself.
   * - **Clipped (mask)**
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
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]

       Default: 0
     - Defines the format of the output raster file.

       Options:

       .. include:: ../algs_include.rst
          :start-after: **raster_data_types_extended**
          :end-before: **end_raster_data_types_extended**

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
   * - **Clipped (mask)**
     - ``OUTPUT``
     - [raster]
     - Output raster layer clipped by the vector layer

Python code
...........

**Algorithm ID**: ``gdal:cliprasterbymasklayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalcontour:

Contour
-------

Extracts contour lines from any GDAL-supported elevation raster.

This algorithm is derived from the
`GDAL contour utility <https://gdal.org/programs/gdal_contour.html>`_.

**Default menu**: :menuselection:`Raster --> Extraction`

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
     - Input raster
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - Raster band to create the contours from
   * - **Interval between contour lines**
     - ``INTERVAL``
     - [number]

       Default: 10.0
     - Defines the interval between the contour lines in the given
       units of the elevation raster (minimum value 0)
   * - **Attribute name (if not set, no elevation attribute is attached)**

       Optional
     - ``FIELD_NAME``
     - [string]

       Default: 'ELEV'
     - Provides a name for the attribute in which to put the elevation.
   * - **Offset from zero relative to which to interpret intervals**

       Optional
     - ``OFFSET``
     - [number]

       Default: 0.0
     -
   * - **Contours**
     - ``OUTPUT``
     - [vector: line]

       Default: ``[Save to temporary file]``
     - Specification of the output vector layer.
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
   * - **Produce 3D vector**
     - ``CREATE_3D``
     - [boolean]

       Default: False
     - Forces production of 3D vectors instead of 2D.
       Includes elevation at every vertex.
   * - **Treat all raster values as valid**
     - ``IGNORE_NODATA``
     - [boolean]

       Default: False
     - Ignores any NoData values in the dataset.
   * - **Input pixel value to treat as "NoData"**

       Optional
     - ``NODATA``
     - [number]

       Default: None
     - Defines a value that should be inserted for the NoData
       values in the output raster
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options.
       Refer to the corresponding GDAL utility documentation.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Contours**
     - ``OUTPUT``
     - [vector: line]
     - Output vector layer with contour lines

Python code
...........

**Algorithm ID**: ``gdal:contour``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalcontour_polygon:

Contour Polygons
----------------

Extracts contour polygons from any GDAL-supported elevation raster.

This algorithm is derived from the
`GDAL contour utility <https://gdal.org/programs/gdal_contour.html>`_.

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
     - Input raster
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - Raster band to create the contours from
   * - **Interval between contour lines**
     - ``INTERVAL``
     - [number]

       Default: 10.0
     - Defines the interval between the contour lines in the given
       units of the elevation raster (minimum value 0)
   * - **Offset from zero relative to which to interpret intervals**

       Optional
     - ``OFFSET``
     - [number]

       Default: 0.0
     -
   * - **Attribute name for minimum elevation of contour polygon**

       Optional
     - ``FIELD_NAME_MIN``
     - [string]

       Default: 'ELEV_MIN'
     - Provides a name for the attribute in which to put the minimum elevation
       of contour polygon. If not provided no minimum elevation attribute
       is attached.
   * - **Attribute name for maximum elevation of contour polygon**

       Optional
     - ``FIELD_NAME_MAX``
     - [string]

       Default: 'ELEV_MAX'
     - Provides a name for the attribute in which to put the maximum elevation
       of contour polygon. If not provided no maximum elevation attribute
       is attached.
   * - **Contours**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Save to temporary file]``
     - Specification of the output vector layer.
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
   * - **Produce 3D vector**
     - ``CREATE_3D``
     - [boolean]

       Default: False
     - Forces production of 3D vectors instead of 2D.
       Includes elevation at every vertex.
   * - **Treat all raster values as valid**
     - ``IGNORE_NODATA``
     - [boolean]

       Default: False
     - Ignores any NoData values in the dataset.
   * - **Input pixel value to treat as "NoData"**

       Optional
     - ``NODATA``
     - [number]

       Default: None
     - Defines a value that should be inserted for the NoData
       values in the output raster
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]

       Default: None
     - Add extra GDAL command line options.
       Refer to the corresponding GDAL utility documentation.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Contours**
     - ``OUTPUT``
     - [vector: polygon]
     - Output vector layer with contour polygons

Python code
...........

**Algorithm ID**: ``gdal:contour_polygon``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
