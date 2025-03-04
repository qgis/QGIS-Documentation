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
   * - **Output layer**
     - ``OUTPUT``
     - [layer: any]
     - The resulting layer with the updated history metadata in its **Information properties**. 


Python code
...........

**Algorithm ID**: ``native:addhistorymetadata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**