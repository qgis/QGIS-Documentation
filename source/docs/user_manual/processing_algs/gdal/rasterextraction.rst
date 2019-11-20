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

This algorithm is derived from the `GDAL grid utility <https://gdal.org/gdal_grid.html>`_ .

``Default menu``: :menuselection:`Raster --> Extraction`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input layer**
      - ``INPUT``
      - [raster]
      - The input raster
   *  - **Clipping extent**
      - ``EXTENT``
      - [extent]
      - Extent that should be used for the output raster.
        Only pixels within the specified bounding box will be
        included in the output.
   *  - **Assign a specified nodata value to output bands**
        
        Optional
      - ``NODATA``
      - [numeric]
        
        Default: None
      - Defines a value that should be inserted for the nodata
        values in the output raster
   *  - **Additional creation options**
        
        Optional
      - ``OPTIONS``
      - [string]
        
        Default: ''
      - For adding one or more creation options that control the
        raster to be created (colors, block size, file
        compression...).
        For convenience, you can rely on predefined profiles (see
        :ref:`GDAL driver options section <gdal_createoptions>`).
   *  - **Output data type**
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

   *  - **Additional command-line parameters**
        
        Optional
      - ``EXTRA``
      - [string]
        
        Default: None
      - 
   *  - **Clipped (extent)**
      - ``OUTPUT``
      - [raster]
        Default: '[Save to temporary file]'
      - Specification of the output raster layer.
        One of 
        * Save to a Temporary File
        * Save to File...
        
        The file encoding can also be changed here

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
   *  - **Clipped (extent)**
      - ``OUTPUT``
      - [raster]
      - Output raster layer clipped by the given extent


.. _gdalcliprasterbymasklayer:

Clip raster by mask layer
-------------------------
Clips any GDAL-supported raster by a vector mask layer.

This algorithm is derived from the `GDAL grid utility <https://gdal.org/gdal_grid.html>`_ .

``Default menu``: :menuselection:`Raster --> Extraction`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input layer**
      - ``INPUT``
      - [raster]
      - The input raster
   *  - **Mask layer**
      - ``EXTENT``
      - [vector: polygon]
      - Vector mask for clipping the rasterraster
   *  - **Source CRS**
      - ``SOURCE_CRS``
      - [crs]
      - 
   *  - **Target CRS**
      - ``TARGET_CRS``
      - [crs]
      - 
   *  - **Assign a specified nodata value to output bands**
        
        Optional
      - ``NODATA``
      - [numeric]
        
        Default: None
      - Defines a value that should be inserted for the nodata
        values in the output raster
   *  - **Create an output alpha band**
      - ``ALPHA_BAND``
      - [boolean]
        
        Default: False
      - Creates an alpha band for the result.
        The alpha band then includes the transparency values of
        the pixels.
   *  - **Match the extent of the clipped raster to the extent of the mask layer**
      - ``CROP_TO_CUTLINE``
      - [boolean]
        
        Default: True
      - Applies the vector layer extent to the output raster if checked.
   *  - **Keep resolution of input raster**
      - ``KEEP_RESOLUTION``
      - [boolean]
        
        Default: False
      - The resolution of the output raster will not be changed
   *  - **Set output file resolution** |36|
      - ``SET_RESOLUTION``
      - [boolean]
        
        Default: False
      - 
   *  - **X Resolution to output bands** |36|
        
        Optional
      - ``X_RESOLUTION``
      - [number]
      - 
   *  - **Y Resolution to output band** |36|
        
        Optional
      - ``Y_RESOLUTION``
      - [number]
      - 
   *  - **Use multithreaded warping implementation** |36|
      - ``MULTITHREADING``
      - [boolean]
        
        Default: False
      - 
   *  - **Additional creation options**
        
        Optional
      - ``OPTIONS``
      - [string]
        
        Default: ''
      - For adding one or more creation options that control the
        raster to be created (colors, block size, file
        compression...).
        For convenience, you can rely on predefined profiles (see
        :ref:`GDAL driver options section <gdal_createoptions>`).
   *  - **Output data type**
      - ``DATA_TYPE``
      - [enumeration]
        
        Default: 0
      - Defines the format of the output raster file.

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

   *  - **Additional command-line parameters** |310|
        
        Optional
      - ``EXTRA``
      - [string]
        
        Default: None
      - 
   *  - **Clipped (mask)**
      - ``OUTPUT``
      - [raster]
        Default: '[Save to temporary file]'
      - Specification of the output raster layer.
        One of 
        * Save to a Temporary File
        * Save to File...
        
        The file encoding can also be changed here

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
   *  - **Clipped (mask)**
      - ``OUTPUT``
      - [raster]
      - Output raster layer clipped by the vector layer


.. _gdalcontour:

Contour
-------
Extracts contour lines from any GDAL-supported elevation raster.

This algorithm is derived from the `GDAL contour utility <https://gdal.org/gdal_contour.html>`_ .

``Default menu``: :menuselection:`Raster --> Extraction`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input layer**
      - ``INPUT``
      - [raster]
      - Input raster
   *  - **Band number**
      - ``BAND``
      - [raster band]
      - Raster band to create the contours from
   *  - **Interval between contour lines**
      - ``INTERVAL``
      - [number]
        
        Default: 10
      - Defines the interval between the contour lines in the given
        units of the elevation raster (minimum value 0)
   *  - **Attribute name (if not set, no elevation attribute is attached)**
        
        Optional
      - ``FIELD_NAME``
      - [string]
        
        Default: 'ELEV'
      - Defines the attribute name for the field containing the
        values of the contour lines.
   *  - **Produce 3D vector**
      - ``CREATE_3D``
      - [boolean]
        
        Default: False
      - Forces production of 3D vectors instead of 2D.
        Includes elevation at every vertex.
   *  - **Treat all raster values as valid**
      - ``IGNORE_NODATA``
      - [boolean]
        
        Default: False
      - Ignores any nodata values in the dataset.
   *  - **Input pixel value to treat as "nodata"**
        
        Optional
      - ``NODATA``
      - [number]
        
        Default: None
      - Defines a value that should be inserted for the nodata
        values in the output raster
   *  - **Offset from zero relative to which to interpret intervals**
        
        Optional
      - ``OFFSET``
      - [number]
        
        Default: 0.0
      - 
   *  - **Additional command-line parameters** |310|
        
        Optional
      - ``EXTRA``
      - [string]
        
        Default: None
      - 
   *  - **Additional creation options**
        
        Optional
      - ``OPTIONS``
      - [string]
        
        Default: ''
      - For adding one or more creation options that control the
        raster to be created (colors, block size, file
        compression...).
        For convenience, you can rely on predefined profiles (see
        :ref:`GDAL driver options section <gdal_createoptions>`).
   *  - **Contours**
      - ``OUTPUT``
      - [vector line]
        Default: '[Save to temporary file]'
      - Specification of the output raster layer.
        One of 
        * Save to a Temporary File
        * Save to File...
        
        The file encoding can also be changed here.

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
   *  - **Contours**
      - ``OUTPUT``
      - [vector: line]
      - Output vector layer wiht contour lines

.. |36| replace:: ``NEW in 3.6``
.. |310| replace:: ``NEW in 3.10``
