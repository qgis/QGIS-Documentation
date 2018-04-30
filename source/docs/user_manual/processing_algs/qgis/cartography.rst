.. only:: html

   |updatedisclaimer|

Cartography
============

.. only:: html

   .. contents::
      :local:
      :depth: 1

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
  Polygon vector layer

``Minimum number of colors`` [number]
  Minimum colors number to assign

``Minimum distance between features`` [number]
  Prevent nearby (but non-touching) features from being assigned equal colors

``Balance color assignment`` [selection]
  Options:

  * by feature count

    Attempts to assign colors so that the count of features assigned to each
    individual color index is balanced

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

.. |updatedisclaimer| replace:: :disclaimer:`Docs for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
