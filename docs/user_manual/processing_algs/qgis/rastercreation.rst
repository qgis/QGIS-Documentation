Raster Creation
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgiscreateconstantrasterlayer:

Create constant raster layer
----------------------------

Generates raster layer for given extent and cell size filled
with the specified value.

Additionally an output data type can be specified.
The algorithm will abort if a value has been entered that
cannot be represented by the selected output raster data type.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent**
     - ``EXTENT``
     - [extent]
     - Specify the extent (xmin, xmax, ymin, ymax) of the output raster layer.
       One of:
       
       * Use Canvas Extent
       * Select Extent on Canvas
       * Use Layer Extent...
       
       It will internally be extended to a multiple of the tile size.
   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]
       
       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]
       
       Default: 0.1
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Constant value**
     - ``NUMBER``
     - [number]
       
       Default: 1
     - Constant pixel value for the output raster layer.
   * - **Constant**
     - ``OUTPUT``
     - [raster]
     - Specification of the output raster. One of:

       .. include:: qgis_algs_include.rst
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
   * - **Output data type**
     - ``OUTPUT_TYPE``

       Default: 5
     - [enumeration]
     - Defines the data type of the output raster file. Options:

       * 0 -- Byte
       * 1 -- Integer16
       * 2 -- Unsigned Integer16
       * 3 -- Integer32
       * 4 -- Unsigned Integer32
       * 5 -- Float32
       * 6 -- Float64

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Constant**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the specified pixel
       size and value.

Python code
...........

**Algorithm ID**: ``qgis:createconstantrasterlayer``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

