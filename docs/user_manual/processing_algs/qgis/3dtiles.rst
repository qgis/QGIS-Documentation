3D Tiles
========

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisb3dmtogltf:

Convert B3DM to GLTF
--------------------

Converts files from the legacy :file:`.B3DM` format to :file:`.GLTF` or :file:`.GLB`.

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
   * - **Input B3DM**
     - ``INPUT``
     - [3D Tile]
     - Input file to convert.
   * - **Output file**
     - ``OUTPUT``
     - [3D Tile]

       Default: ``[Save to temporary file]``
     - Specify the output 3D tile file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output file**
     - ``OUTPUT``
     - [3D Tile]
     - Output layer in :file:`.GLTF` format.

Python code
...........

**Algorithm ID**: ``native:b3dmtogltf``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisgltftovector:

Convert GLTF to vector features
-------------------------------

Converts :file:`.GLTF` or :file:`.GLB` file contents to standard vector layer formats.

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
   * - **Input GLTF**
     - ``INPUT``
     - [3D Tile]
     - Input file to convert.
   * - **Output polygons**

       Optional
     - ``OUTPUT_POLYGONS``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - Specify the output vector layer to store polygon features. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types_skip**
          :end-before: **end_layer_output_types_skip**
   * - **Output lines**

       Optional
     - ``OUTPUT_LINES``
     - [vector: line]

       Default: ``[Create temporary layer]``
     - Specify the output vector layer to store line features. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types_skip**
          :end-before: **end_layer_output_types_skip**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output polygons**
     - ``OUTPUT_POLYGONS``
     - [vector: polygon]
     - A vector layer storing the polygon features in input layer.
   * - **Output lines**
     - ``OUTPUT_LINES``
     - [vector: line]
     - A vector layer storing the line features in input layer.

Python code
...........

**Algorithm ID**: ``native:gltftovector``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
