.. only:: html

   |updatedisclaimer|

Cartography
============

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgis_topological_coloring:

Topological coloring
--------------------
This algorithm assigns a color index to polygon features in such a way that no
adjacent polygons share the same color index, whilst minimizing the number of
colors required.

The algorithm allows choice of method to use when assigning colors. The default
method ``by feature count`` attempts to assign colors so that the count of features
assigned to each individual color index is balanced.

The by ``assigned area`` mode instead assigns colors so that the total area of
features assigned to each color is balanced. This mode can be useful to help
avoid large features resulting in one of the colors appearing more dominant on a
colored map.

The ``by distance between colors`` mode will assign colors in order to maximize the
distance between features of the same color. This mode helps to create a more
uniform distribution of colors across a map.

A minimum number of colors can be specified if desired. The color index is saved
to a new attribute named **color_id**.

The following example shows the algorithm with 10 different colors chosen: as you
can see each color class has the same amount of features:

.. figure:: /static/user_manual/processing_algs/qgis/topological_color.png
  :align: center

  Color classes and feature count

Parameters
..........

``Input layer`` [vector: polygon]
  Polygon vector layer

``Minimum number of colors`` [number]

``Minimum distance between features`` [number]
  prevent nearby (but non-touching) features from being assigned equal colors

``Balance color assignment`` [selection]
  Options:

  * by feature count

    each color index contains the same amount of features


  * by assigned area

    the total area assigned to each class is balanced


  * by distance between colors

    maximizes the distance of features having the same color

  Default: *by feature count*

Outputs
.......

``Colored`` [vector: polygon]
  Polygon vector layer with the addition of the ``color_id`` column.

Console usage
.............

::

  # import the processing class
  import processing
  # define the parameters dictionary with all the input
  parameters = {'INPUT' : 'path_of_your_layer', 'MIN_COLORS':4,'MIN_DISTANCE':0,'BALANCE':0,'OUTPUT':'memory:'}
  # run the algorithm and load the result
  processing.runAndLoadResults('qgis:topologicalcoloring', parameters)
