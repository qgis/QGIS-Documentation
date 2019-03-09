.. only:: html

   |updatedisclaimer|

Layer tools
===========

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgispolygonfromlayerextent:

Extract layer extent
--------------------

Generates a vector layer with the minimum bounding box (rectangle with N-S orientation)
that covers all the input features.

The output layer contains a single bounding box for the whole input layer.

.. figure:: img/extract_layer_extent.png
   :align: center

   In red the bounding box of the source layer

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Input layer`` [vector: any]
  Vector layer.

Outputs
.......

``Extent`` [vector: polygon]
  Polygon vector layer.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
