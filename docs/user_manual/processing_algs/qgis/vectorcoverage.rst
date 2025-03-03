Vector coverage
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgiscoverageunion:

Dissolve coverage
-----------------

Operates on a coverage (represented as a set of polygon features with exactly matching edge geometry)
to dissolve (union) the geometries.
It provides a heavily optimized approach for unioning these features compared with the standard Dissolve tools.

.. seealso:: :ref:`qgisdissolve`

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
     - [vector: polygon]
     - Input polygon vector layer
   * - **Dissolved**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - Specify the output vector layer. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Dissolved**
     - ``OUTPUT``
     - [vector: polygon]
     - The output polygon vector layer with dissolved geometries.

Python code
...........

**Algorithm ID**: ``native:coverageunion``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscoveragesimplify:

Simplify coverage
-----------------

Operates on a coverage (represented as a set of polygon features with exactly matching edge geometry)
to apply a Visvalingam–Whyatt simplification to the edges, reducing complexity in proportion with the provided tolerance,
while retaining a valid coverage (i.e. no edges will cross or touch after the simplification).
Geometries will never be removed, but they may be simplified down to just a triangle.
Also, some geometries (such as polygons which have too few non-repeated points) will be returned unchanged.

If the input dataset is not a valid coverage due to overlaps, it will still be simplified,
but invalid topology such as crossing edges will still be invalid.

**Requires version of GEOS >= 3.12**

.. seealso:: :ref:`qgissimplifygeometries`, :ref:`qgissmoothgeometry`

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
     - [vector: polygon]
     - Input polygon vector layer
   * - **Tolerance**
     - ``TOLERANCE``
     - [number]

       Default: 0.0
     - The maximum distance (in unit of choice) between two consecutive vertices to get merged.
   * - **Preserve boundary**
     - ``PRESERVE_BOUNDARY``
     - [number]

       Default: False
     - When enabled, the outside edges of the coverage will be preserved without simplification
   * - **Simplified**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - Specify the output vector layer. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Simplified**
     - ``OUTPUT``
     - [vector: polygon]
     - The output polygon vector layer, with a lower number of vertices.

Python code
...........

**Algorithm ID**: ``native:coveragesimplify``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscoveragevalidate:

Validate coverage
-----------------

Analyzes a coverage (represented as a set of polygon features with exactly matching edge geometry)
to find places where the assumption of exactly matching edges is not met.
Invalidity includes polygons that overlap or that have gaps smaller than the specified gap width.

**Requires version of GEOS >= 3.12**

.. seealso:: :ref:`qgischeckvalidity`

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
     - [vector: polygon]
     - Input polygon vector layer
   * - **Gap width**
     - ``GAP_WIDTH``
     - [number]

       Default: 0.0
     - The maximum width of gap to detect
   * - **Invalid edges**
     - ``INVALID_EDGES``
     - [vector: line]

       Default: ``[Create temporary layer]``
     - Specify the output vector layer. One of:

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
   * - **Invalid edges**
     - ``OUTPUT``
     - [vector: line]
     - The output line vector layer showing error edges for each invalid polygon.
   * - **Validity result**
     - ``IS_VALID``
     - [boolean]
     - Returns whether the coverage is valid or not.

Python code
...........

**Algorithm ID**: ``native:coveragevalidate``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
