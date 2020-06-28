Layer tools
===========

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgispolygonfromlayerextent:

Extract layer extent
--------------------

Generates a vector layer with the minimum bounding box (rectangle with
N-S orientation) that covers all the input features.

The output layer contains a single bounding box for the whole input
layer.

.. figure:: img/extract_layer_extent.png
   :align: center

   In red the bounding box of the source layer

**Default menu**: :menuselection:`Vector --> Research Tools`

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
     - Input layer
   * - **Extent**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - Specify the polygon vector layer for the output extent.
       One of:

       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table...

       The file encoding can also be changed here.

Outputs
.......
.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   *  - Label
      - Name
      - Type
      - Description
   *  - **Extent**
      - ``OUTPUT``
      - [vector: polygon]
      - Output (polygon) vector layer with the extent
        (minimum bounding box)

**Algorithm ID**: ``qgis:polygonfromlayerextent``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

