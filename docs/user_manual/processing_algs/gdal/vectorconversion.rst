Vector conversion
=================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalconvertformat:

Convert format
--------------
Converts any OGR-supported vector layer into another OGR-supported
format.

This algorithm is derived from the
`ogr2ogr utility <https://gdal.org/ogr2ogr.html>`_.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Additional creation options**

       (optional)
     - ``OPTIONS``
     - [string]

       Default: '' (no additional options)
     - Additional GDAL creation options.
   * - **Converted**
     - ``OUTPUT``
     - [same as input]
     - Specification of the output vector layer.
       One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.

       For ``Save to File``, the output format has to be specified.
       All GDAL vector formats are supported.
       For ``Save to a Temporary File`` the QGIS default vector format
       will be used.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Converted**
     - ``OUTPUT``
     - [same as input]
     - The output vector layer

Python code
...........

**Algorithm ID**: ``gdal:convertformat``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalrasterize_over:

Rasterize (overwrite with attribute)
------------------------------------
Overwrites a raster layer with values from a vector layer.
New values are assigned based on the attribute value of
the overlapping vector feature.

This algorithm is derived from the
`GDAL rasterize utility <https://gdal.org/gdal_rasterize.html>`_.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input layer**
      - ``INPUT``
      - [vector: any]
      - Input vector layer
   *  - **Input raster layer**
      - ``INPUT_RASTER``
      - [raster]
      - Input raster layer
   *  - **Field to use for a burn-in value**

        Optional
      - ``FIELD``
      - [tablefield: numeric]
      - Defines the attribute field to use to set the pixels values
   *  - **Add burn in values to existing raster values**
      - ``ADD``
      - [boolean]

        Default: False
      - If False, pixels are assigned the selected field's value.
        If True, the selected field's value is added to the value
        of the input raster layer.
   *  - **Additional command-line parameters**

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

   *  - Label
      - Name
      - Type
      - Description
   *  - **Rasterized**
      - ``OUTPUT``
      - [raster]
      - The overwritten input raster layer

Python code
...........

**Algorithm ID**: ``gdal:rasterize_over``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalrasterize_over_fixed_value:

Rasterize (overwrite with fixed value)
--------------------------------------
Overwrites parts of a raster layer with a fixed value.
The pixels to overwrite are chosen based on the supplied (overlapping)
vector layer.

This algorithm is derived from the
`GDAL rasterize utility <https://gdal.org/gdal_rasterize.html>`_.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input layer**
      - ``INPUT``
      - [vector: any]
      - Input vector layer
   *  - **Input raster layer**
      - ``INPUT_RASTER``
      - [raster]
      - Input raster layer
   *  - **A fixed value to burn**
      - ``BURN``
      - [number]

        Default: 0.0
      - The value to burn
   *  - **Add burn in values to existing raster values**
      - ``ADD``
      - [boolean]

        Default: False
      - If False, pixels are assigned the fixed value.
        If True, the fixed value is added to the value of
        the input raster layer.
   *  - **Additional command-line parameters**

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

   *  - Label
      - Name
      - Type
      - Description
   *  - **Rasterized**
      - ``OUTPUT``
      - [raster]
      - The overwritten input raster layer

Python code
...........

**Algorithm ID**: ``gdal:rasterize_over_fixed_value``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalrasterize:

Rasterize (vector to raster)
----------------------------
Converts vector geometries (points, lines and polygons) into a raster
image.

This algorithm is derived from the
`GDAL rasterize utility <https://gdal.org/gdal_rasterize.html>`_.

**Default menu**: :menuselection:`Raster --> Conversion`

Parameters
..........

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
     - [vector: any]
     - Input vector layer
   * - **Field to use for a burn-in value**

       Optional
     - ``FIELD``
     - [tablefield: numeric]
     - Defines the attribute field from which the attributes for
       the pixels should be chosen
   * - **A fixed value to burn**

       Optional
     - ``BURN``
     - [number]

       Default: 0.0
     - A fixed value to burn into a band for all features.
   * - **Output raster size units**
     - ``UNITS``
     - [enumeration]

       Default: 0
     - Units to use when defining the output raster size/resolution.
       One of:

       * 0 --- Pixels
       * 1 --- Georeferenced units

   * - **Width/Horizontal resolution**
     - ``WIDTH``
     - [number]

       Default: 0.0
     - Sets the width (if size units is "Pixels") or horizontal
       resolution (if size units is "Georeferenced units") of the
       output raster. Minimum value: 0.0.
   * - **Height/Vertical resolution**
     - ``HEIGHT``
     - [number]

       Default: 0.0
     - Sets the height (if size units is "Pixels") or vertical
       resolution (if size units is "Georeferenced units") of the
       output raster.
   * - **Output extent**
     - ``EXTENT``
     - [extent]
     - Extent of the output raster layer.
       If the extent is not specified, the minimum extent that covers
       the selected reference layer(s) will be used.
   * - **Assign a specified nodata value to output bands**

       Optional
     - ``NODATA``
     - [number]

       Default: 0.0
     - Assigns a specified nodata value to output bands
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

   * - **Pre-initialize the output image with value**

       Optional
     - ``INIT``
     - [number]
     - Pre-initializes the output image bands with this value.
       Not marked as the nodata value in the output file.
       The same value is used in all the bands.
   * - **Invert rasterization**
     - ``INVERT``
     - [boolean]

       Default: False
     - Burns the fixed burn value, or the burn value associated
       with the first feature into all parts of the image not
       inside the provided polygon.
   * - **Rasterized**
     - ``OUTPUT``
     - [raster]

       Default: '[Save to temporary file]'
     - Specification of the output raster layer.
       One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here
       For ``Save to File``, the output format has to be specified.
       All GDAL raster formats are supported.
       For ``Save to a Temporary File`` the QGIS default raster format
       will be used.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Rasterized**
     - ``OUTPUT``
     - [raster]
     - Output raster layer

Python code
...........

**Algorithm ID**: ``gdal:rasterize``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
