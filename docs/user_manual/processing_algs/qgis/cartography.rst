Cartography
============

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgiscombinestyles:

Combine style databases
---------------------------------------
Combines multiple QGIS style databases into a single style database.
If items of the same type with the same name exist in different source
databases these will be renamed to have unique names in the output combined database.

.. seealso:: :ref:`qgisstylefromproject`

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
   * - **Input databases**
     - ``INPUT``
     - [file] [list]
     - Files containing QGIS style items
   * - **Objects to combine**
     - ``OBJECTS``
     - [enumeration] [list]
     - Types of style items in the input databases you would like to
       put in the new database.  These can be:

       * 0 --- :ref:`Symbols <edit_symbol>`
       * 1 --- :ref:`Color ramps <color-ramp>`
       * 2 --- :ref:`Text formats <text_format>`
       * 3 --- :ref:`Label settings <showlabels>`

   * - **Output style database**
     - ``OUTPUT``
     - [file]
       
       Default: ``[Save to temporary file]``
     - Output :file:`.XML` file combining the selected style items.
       One of:

       * Save to a Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...

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
   * - **Color ramp count**
     - ``COLORRAMPS``
     - [number]
     - 
   * - **Label settings count**
     - ``LABELSETTINGS``
     - [number]
     - 
   * - **Output style database**
     - ``OUTPUT``
     - [file]
     - Output :file:`.XML` file combining the selected style items
   * - **Symbol count**
     - ``SYMBOLS``
     - [number]
     - 
   * - **Text format count**
     - ``TEXTFORMATS``
     - [number]
     - 

Python code
...........

**Algorithm ID**: ``qgis:combinestyles``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


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
       * Save to PostGIS Table...

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
       * Save to PostGIS Table...

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

Python code
...........

**Algorithm ID**: ``qgis:categorizeusingstyle``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisstylefromproject:

Create style database from project
----------------------------------------
Extracts all style objects (symbols, color ramps, text formats and
label settings) from a QGIS project.

The extracted symbols are saved to a QGIS style database (:file:`XML` format),
which can be managed and imported via the :ref:`Style Manager <vector_style_manager>`
dialog.

.. seealso:: :ref:`qgiscombinestyles`

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
   * - **Input project (leave blank to use current)**

       Optional
     - ``INPUT``
     - [file]
     - A QGIS project file to extract the style items from
   * - **Objects to extract**
     - ``OBJECTS``
     - [enumeration] [list]
     - Types of style items in the input project you would like to
       put in the new database. These can be:

       * 0 --- :ref:`Symbols <edit_symbol>`
       * 1 --- :ref:`Color ramps <color-ramp>`
       * 2 --- :ref:`Text formats <text_format>`
       * 3 --- :ref:`Label settings <showlabels>`

   * - **Output style database**
     - ``OUTPUT``
     - [file]

       Default: ``[Save to temporary file]``
     - Specify the output :file:`.XML` file for the selected style items.
       One of:

       * Save to a Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...

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
   * - **Color ramp count**
     - ``COLORRAMPS``
     - [number]
     - Number of color ramps
   * - **Label settings count**
     - ``LABELSETTINGS``
     - [number]
     - Number of label settings
   * - **Output style database**
     - ``OUTPUT``
     - [file]
     - Output :file:`.XML` file for the selected style items
   * - **Symbol count**
     - ``SYMBOLS``
     - [number]
     - Number of symbols
   * - **Text format count**
     - ``TEXTFORMATS``
     - [number]
     - Number of text formats

Python code
...........

**Algorithm ID**: ``qgis:stylefromproject``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisprintlayoutmapextenttolayer:

Print layout map extent to layer
-------------------------------------

Creates a polygon layer containing the extent of a print layout map item
(or items), with attributes specifying the map size (in layout units,
i.e. the :ref:`reference map <reference_map>` units), scale and rotation.

If the map item parameter is specified, then only the matching map extent will
be exported. If it is not specified, all map extents from the layout will be exported.

Optionally, a specific output CRS can be specified. If it is not specified,
the original map item CRS will be used.

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Print layout**
     - ``LAYOUT``
     - [enumeration]
     - A print layout in the current project
   * - **Map item**

       Optional
     - ``MAP``
     - [enumeration]

       Default: *All the map items*
     - The map item(s) whose information you want to
       extract.
       If none is provided then all the map items
       are processed.
   * - **Overrride CRS**

       Optional
     - ``CRS``
     - [crs]

       Default: *The layout CRS*
     - Select the CRS for the layer in which the information
       will be reported.

   * - **Extent**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - Specify the output vector layer for the extent(s). One of:

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
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Map height**
     - ``HEIGHT``
     - [number]
     - 
   * - **Extent**
     - ``OUTPUT``
     - [vector: polygon]
     - Output polygon vector layer containing extents of all
       the input layout map item(s)
   * - **Map rotation**
     - ``ROTATION``
     - [number]
     - 
   * - **Map scale**
     - ``SCALE``
     - [number]
     - 
   * - **Map width**
     - ``WIDTH``
     - [number]
     - 

Python code
...........

**Algorithm ID**: ``qgis:printlayoutmapextenttolayer``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


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
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Colored**
     - ``OUTPUT``
     - [vector: polygon]
     - Polygon vector layer with an added ``color_id`` column

Python code
...........

**Algorithm ID**: ``qgis:topologicalcoloring``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
