.. only:: html

   |updatedisclaimer|

Layer Tools
===========

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgis_extract_layer_extent:

Extract layer extent
--------------------

Generates a vector layer with the minimum bounding box (rectangle with N-S orientation)
that covers all the input features.

The output layer contains a single bounding box for the whole input layer.

.. figure:: /static/user_manual/processing_algs/qgis/extract_layer_extent.png
   :align: center

   In red the bounding box of the source layer

Parameters
..........

``Input layer`` [vector: any]
  Vector layer

Outputs
.......

``Extent`` [vector]
  Polygon vector layer
