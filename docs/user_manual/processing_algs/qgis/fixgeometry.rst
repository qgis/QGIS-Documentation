.. _fixgeometry_algorithms:

Fix Geometry
============

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgisfixgeometryangle:

Fix geometry (Angle)
--------------------

Deletes vertices based on an error layer from the :ref:`qgischeckgeometryangle` algorithm.
When deletion of a vertex results in a duplicate vertex (when a spike vertex is deleted),
the duplicate vertex is deleted to keep a single vertex and preserve topology.

:seealso: :ref:`qgischeckgeometryangle`

Parameters
..........

Basic parameters
................

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
     - [vector: line, polygon]
     - Layer with the geometries to fix
   * - **Error layer**
     - ``ERRORS``
     - [vector: point]
     - Point layer with the errors location 
   * - **Field of original feature unique identifier**
     - ``UNIQUE_ID``
     - [tablefield: any]
     - Field storing unique values for feature identification in input layer (???)
   * - **Field of part index**
     - ``PART_IDX``
     - [numeric: integer]
 
       Default: ``gc_partidx``
     - Field storing the erroneous feature's geometry part number.
   * - **Field of ring index**
     - ``RING_IDX``
     - [numeric: integer]

       Default: ``gc_ringidx``
     - Field storing the erroneous feature's geometry ring number.
   * - **Field of vertex index**
     - ``VERTEX_IDX``
     - [numeric: integer]

       Default: ``gc_vertidx``
     - Field storing the erroneous feature's geometry vertex number.
   * - **Output layer**
     - ``OUTPUT``
     - [vector: any]

       Default: ``[Create temporary layer]``
     - Specification of the output layer contained erroneous input features.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

   * - **Report layer**
     - ``REPORT``
     - [vector: point]

       Default: ``[Create temporary layer]``
     - Specification of the output layer containing the errors location.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Advanced parameters
...................

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Tolerance**
     - ``TOLERANCE``
     - [numeric: integer]

       Default: 8
     - 

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Report layer**
     - ``REPORT``
     - [vector: any]
     - Output point layer representing the error locations and fix applied
       (the ID and name of the input layer, the ID, geometry part, ring and vertex index of the erroneous feature,
       x and y coordinates and value of the erroneous angle, the applied fix and its successfulness)
   * - **Output layer**
     - ``OUTPUT``
     - [same as input]
     - Output layer with corrected features from the input layer

Python code
...........

**Algorithm ID**: ``native:fixgeometryangle``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
