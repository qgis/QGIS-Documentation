Metadata tools
================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _addhistorymetadata:

Add history metadata
--------------------

Adds a new history entry to the layer's metadata.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``INPUT``
     - [layer: any]
     - The input layer (vector, raster, etc.) to which the history entry will be added.
   * - **History entry**
     - ``HISTORY``
     - [string]
     - The text to be appended as a new entry in the layer's history metadata. This will be added to any existing history entries.

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
     - [same as input]
     - The resulting layer with the updated history metadata in its **Information properties**. 


Python code
...........

**Algorithm ID**: ``native:addhistorymetadata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscopylayermetadata:

Copy Layer Metadata
-------------------

Copies metadata from a source layer to a target layer.
Any existing metadata in the target layer will be replaced with the metadata from the source layer.
This includes all metadata fields, such as history, abstract, and other properties.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Source layer**
     - ``SOURCE``
     - [layer]
     - The layer from which metadata will be copied.
   * - **Target layer**
     - ``TARGET``
     - [layer]
     - The layer to which metadata will be copied. Any existing metadata in this layer will be replaced.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output layer**
     - ``OUTPUT``
     - [layer]
     - The target layer with the metadata replaced by the metadata from the source layer.
       This includes all metadata fields, such as history, abstract, and other properties.


Python code
...........

**Algorithm ID**: ``native:copylayermetadata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisexportlayermetadata:

Export Layer Metadata
---------------------

Exports the metadata of a layer to a QMD file.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``INPUT``
     - [layer]
     - The layer whose metadata will be exported.
   * - **Output**
     - ``OUTPUT``
     - [file]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

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
     - [file]
     - The QMD file containing the exported metadata. This file can be used to import metadata into another layer.


Python code
...........

**Algorithm ID**: ``native:exportlayermetadata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**