.. _checkgeometry_algorithms:

Check Geometry
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgischeckgeometryangle:

Check geometry (Angle)
----------------------

Checks the angles of line or polygon geometries.

:seealso: :ref:`qgisfixgeometryangle`

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
     - Layer with the geometries to check
   * - **Unique feature identifier**
     - ``UNIQUE_ID``
     - [tablefield: any]
     - Field storing unique values for feature identification
   * - **Minimum angle**
     - ``MIN_ANGLE``
     - [numeric: double]
     - Allowed minimum angle between adjacent segments in a feature's geometry.
       Any angle below this threshold is reported as error.
   * - **Error layer**
     - ``ERRORS``
     - [vector: point]

       Default: ``[Create temporary layer]``
     - Specification of the output layer containing the errors location.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

   * - **Output layer**
     - ``OUTPUT``
     - [vector: any]

       Default: ``[Create temporary layer]``
     - Specification of the output layer contained erroneous input features.
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
   * - **Error layer**
     - ``ERRORS``
     - [vector: any]
     - Output point layer representing the error locations and information
       (the ID and name of the input layer, the ID, geometry part, ring and vertex index of the erroneous feature,
       x and y coordinates and value of the erroneous angle)
   * - **Output layer**
     - ``OUTPUT``
     - [same as input]
     - Output layer with the erroneous features from the input layer

Python code
...........

**Algorithm ID**: ``native:checkgeometryangle``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
