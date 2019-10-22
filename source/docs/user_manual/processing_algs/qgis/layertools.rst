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
