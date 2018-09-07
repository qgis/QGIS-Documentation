.. only:: html

   |updatedisclaimer|

Cartography
============

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgiscategorizeusingstyle:

Create categorized renderer from styles |34|
--------------------------------------------
Sets a vector layer's renderer to a categorized renderer using matching symbols
from a style database. If no style file is specified, symbols from the user's
current style library are used instead.

The specified expression (or field name) is used to create categories for the
renderer. A category will be created for each unique value within the layer.
Each category is individually matched to the symbols which exist within
the specified QGIS XML style database. Whenever a matching symbol name is found,
the category's symbol will be set to this matched symbol.
The matching is case-insensitive by default, but can be made case-sensitive
if required.

Optionally, non-alphanumeric characters in both the category value and symbol
name can be ignored while performing the match. This allows for greater
tolerance when matching categories to symbols.

If desired, tables can also be output containing lists of the categories which
could not be matched to symbols, and symbols which were not matched to categories.


Parameters
..........

``Input layer`` [vector: any]
  Vector layer to apply a categorized style to.

``Categorize using expression`` [expression]
  Field or rule of categorization of the features.

``Style database (leave blank to use saved symbols)`` [file]
  File containing the symbols to apply to the input layer categories.

``Use case-sensitive match to symbol names`` [boolean]
  If checked, applies a case sensitive comparison between categories and symbol names.

  Default: *False*

``Ignore non-alphanumeric characters while matching`` [boolean]
  If checked, non-alphanumeric characters in style and category names will be
  ignored during the match.

  Default: *False*

Outputs
.......

``Categorized layer`` [vector: any]
  vector layer with the categorized style applied.

``Non-matching categories`` [table]
  Optional

  Lists all existing categories which could not be matched
  to a symbol in the provided style.

``Non-matching symbol names`` [table]
  Optional

  Lists all symbol names from the provided style file which could not match
  any existing category.


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

``Input layer`` [vector: polygon]
  Polygon vector layer.

``Minimum number of colors`` [number]
  Minimum colors number to assign.

``Minimum distance between features`` [number]
  Prevent nearby (but non-touching) features from being assigned equal colors.

``Balance color assignment`` [enumeration]
  Options:

  * by feature count

    Attempts to assign colors so that the count of features assigned to each
    individual color index is balanced.

  * by assigned area

    Assigns colors so that the total area of features assigned to each color is
    balanced. This mode can be useful to help avoid large features resulting in
    one of the colors appearing more dominant on a colored map.


  * by distance between colors

    Assigns colors in order to maximize the distance between features of the same
    color. This mode helps to create a more uniform distribution of colors across
    a map.

  Default: *by feature count*

Outputs
.......

``Colored`` [vector: polygon]
  Polygon vector layer with the addition of the ``color_id`` column.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |34| replace:: :kbd:`NEW in 3.4`
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
