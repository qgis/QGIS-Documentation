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

The output layer can contain a single bounding box for the whole input layer or
one for each feature, representing the bounding box of each of them.

Parameters
..........

``Input layer`` [vector: any]
  Vector layer

  .. figure:: /static/user_manual/processing_algs/qgis/extract_layer_extent.png
     :align: center

     In red the bounding box of the light blue layer

Outputs
.......

``Extent`` [vector]
  Polygon vector layer.

Console usage
.............

::

  # import processing
  import processing
  # define the parameters dictionary with all the input
  parameters = {'INPUT' : 'path_of_your_layer', 'OUTPUT' : 'memory:'}
  # run the algorithm
  processing.runAndLoadResults('qgis:polygonfromlayerextent', parameters)
