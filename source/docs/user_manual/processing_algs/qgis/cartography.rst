
Cartography
============

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgiscategorizeusingstyle:

Create categorized renderer from styles
---------------------------------------
Sets a vector layer's renderer to a categorized renderer using matching symbols
from a style database. If no style file is specified, symbols from the user's
current :ref:`symbol library <vector_symbol_library>` are used instead.

A specified expression or field is used to create categories for the renderer.
Each category is individually matched to the symbols which exist within
the specified QGIS XML style database. Whenever a matching symbol name is found,
the category's symbol will be set to this matched symbol.

If desired, outputs can also be tables containing lists of the categories which
could not be matched to symbols, and symbols which were not matched to categories.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Vector layer to apply a categorized style to
   * - **Categorize using expression**
     - ``FIELD``
     - [expression]
     - Field or expression to categorize the features
   * - **Style database (leave blank to use saved symbols)**
     - ``STYLE``
     - [file]
     - File (:file:`.XML`) containing the symbols to apply to
       the input layer categories.
       The file can be obtained from the Style Manager
       :ref:`Share symbols <share_symbols>` tool.
       If no file is specified, QGIS local symbols library is
       used.
   * - **Use case-sensitive match to symbol names**
     - ``CASE_SENSITIVE``
     - [boolean]

       Default: False
     - If True (checked), applies a case sensitive comparison
       between the categories and symbols names
   * - **Ignore non-alphanumeric characters while matching**
     - ``TOLERANT``
     - [boolean]

       Default: False
     - If True (checked), non-alphanumeric characters in the
       categories and symbols names will be ignored, allowing
       greater tolerance during the match.
   * - **Non-matching categories**

       Optional
     - ``NON_MATCHING_CATEGORIES``
     - [table]

       Default: ``[Skip output]``
     - Output table for categories which do not match any symbol in
       the database. One of:

       * Skip output
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table

       The file encoding can also be changed here.
   * - **Non-matching symbol names**

       Optional
     - ``NON_MATCHING_SYMBOLS``
     - [table]

       Default: ``[Skip output]``
     - Output table for symbols from the provided style database which
       do not match any category. One of:

       * Skip output
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table

       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Non-matching categories**
     - ``NON_MATCHING_CATEGORIES``
     - [table]
     - Lists categories which could not be matched to any symbol in
       the provided style database
   * - **Non-matching symbol names**
     - ``NON_MATCHING_SYMBOLS``
     - [table]
     - Lists symbols from the provided style database which could
       not match any category
   * - **Categorized layer**
     - ``OUTPUT``
     - [same as input]
     - The input vector layer with the categorized style applied.
       No new layer is output.


.. _qgistopologicalcoloring:

Topological coloring
--------------------
Assigns a color index to polygon features in such a way that no adjacent polygons
share the same color index, whilst minimizing the number of colors required.

The algorithm allows choice of method to use when assigning colors.

A minimum number of colors can be specified if desired. The color index is saved
to a new attribute named **color_id**.

The following example shows the algorithm with four different colors chosen; as you
can see each color class has the same amount of features.

.. figure:: img/topological_color.png
  :align: center

  Topological colors example

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: polygon]
     - The input polygon layer
   * - **Minimum number of colors**
     - ``MIN_COLORS``
     - [number]

       Default: 4
     - The minimum number of colors to assign.
       Minimum 1, maximum 1000.
   * - **Minimum distance between features**
     - ``MIN_DISTANCE``
     - [number]

       Default: 0.0
     - Prevent nearby (but non-touching) features from
       being assigned equal colors.
       Minimum 0.0.
   * - **Balance color assignment**
     - ``BALANCE``
     - [enumeration]

       Default: 0
     - Options are:

       * 0 --- By feature count
         
         Attempts to assign colors so that the count of
         features assigned to each individual color index
         is balanced.
         
       * 1 --- By assigned area
         
         Assigns colors so that the total area of features
         assigned to each color is balanced.
         This mode can be useful to help avoid large
         features resulting in one of the colors appearing
         more dominant on a colored map.
         
       * 2 --- By distance between colors
         
         Assigns colors in order to maximize the distance
         between features of the same color.
         This mode helps to create a more uniform
         distribution of colors across a map.

   * - **Colored**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - Specify the output layer. One of:

       * Skip output
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table

       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Colored**
     - ``OUTPUT``
     - [vector: polygon]
     - Polygon vector layer with an added ``color_id`` column
