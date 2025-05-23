Metadata tools
================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisaddhistorymetadata:

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
     - [layer]
     - The input layer (vector, raster, etc.) to which the history entry will be added.
   * - **History entry**
     - ``HISTORY``
     - [string]
     - The text to be appended as a new entry in the layer's history metadata.
       This will be added to any existing history entries.

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
     - The resulting layer with the updated history in its **Metadata properties**. 

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
     - The layer to which metadata will be pasted. Any existing metadata in this layer will be replaced.
   * - **Save metadata as default**
     - ``DEFAULT``
     - [boolean]

       Default: False
     - If checked, the metadata information will be saved with the layer,
       hence available by default in subsequent projects.

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
     - Specification of the output file. :ref:`One of <output_parameter_widget>`:

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
     - The :file:`.qmd` file containing the exported metadata.
       This file can be used to import metadata into another layer.

Python code
...........

**Algorithm ID**: ``native:exportlayermetadata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgissetlayermetadata:

Set Layer Metadata
------------------

Applies metadata to a layer from a :file:`.qmd` file.

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
     - The layer to which the metadata will be applied.
   * - **Metadata file**
     - ``METADATA``
     - [file]
     - The :file:`.qmd` file containing the metadata to be applied.
   * - **Save metadata as default**
     - ``DEFAULT``
     - [boolean]

       Default: False
     - If checked, the metadata information will be saved with the layer,
       hence available by default in subsequent projects.

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
     - [same as input]
     - The input layer with the metadata replaced by the metadata from the :file:`.qmd` file.

Python code
...........

**Algorithm ID**: ``native:setlayermetadata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgissetmetadatafields:

Set Metadata Fields
-------------------
Sets various metadata fields for a layer.

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
     - The layer whose metadata fields will be updated
   * - **Identifier**

       Optional
     - ``IDENTIFIER``
     - [string]
     - A unique identifier for the layer
   * - **Parent identifier**

       Optional
     - ``PARENT_IDENTIFIER``
     - [string]
     - The identifier of the parent resource, if applicable
   * - **Title**

       Optional
     - ``TITLE``
     - [string]
     - The title of the layer
   * - **Type**

       Optional
     - ``TYPE``
     - [string]
     - The type of data stored in the layer
   * - **Language**

       Optional
     - ``LANGUAGE``
     - [string]
     - The language of the metadata
   * - **Encoding**

       Optional
     - ``ENCODING``
     - [string]
     - The character encoding used in the metadata
   * - **Abstract**

       Optional
     - ``ABSTRACT``
     - [string]
     - A brief description or abstract of the layer
   * - **Coordinate reference system**

       Optional
     - ``CRS``
     - [crs]
     - The coordinate reference system of the layer
   * - **Fees**

       Optional
     - ``FEES``
     - [string]
     - Information about any fees associated with accessing the layer
   * - **Ignore empty fields**
     - ``IGNORE_EMPTY``
     - [boolean]

       Default: False
     - If checked, no update will be done to metadata fields that are not filled

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
     - [same as input]
     - The input layer with the specified metadata fields updated.


Python code
...........

**Algorithm ID**: ``native:setmetadatafields``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisupdatelayermetadata:

Update Layer Metadata
---------------------
Copies all non-empty metadata fields from a source layer to a target layer.
Leaves empty input fields unchanged in the target.

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
     - The layer from which non-empty metadata fields will be copied
   * - **Target layer**
     - ``TARGET``
     - [layer]
     - The layer to which non-empty metadata fields will be pasted.
       Empty fields in the source layer will not overwrite existing metadata in the target layer.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Target layer**
     - ``OUTPUT``
     - [layer]
     - The target layer with updated metadata.


Python code
...........

**Algorithm ID**: ``native:updatelayermetadata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
