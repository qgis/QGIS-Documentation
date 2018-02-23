.. only:: html

   |updatedisclaimer|

Modeler tools
=============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisloadlayer:

Load layer into project
=======================
Loads a layer to the current project.

Parameters
..........

``Layer`` [multipleinput]
  Layer to load in the legend

``Loaded layer name`` [string]
  Name of the loaded layer


.. _qgisrenamelayer:

Rename layer
============
Renames a layer in the legend.

Parameters
..........

``Layers`` [multipleinput]
  Layer to rename

``New name`` [string]
  Name of the layer


.. _qgisvariabledistancebuffer:

Variable distance buffer
------------------------
Computes a buffer area for all the features in an input layer.

The size of the buffer for a given feature is defined by an attribute, so it allows
different features to have different buffer sizes.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

``Distance field`` [tablefield: numeric]
  Attribute for the distance radius of the buffer

``Segments`` [number]
  Controls the number of line segments to use to approximate a quarter circle when
  creating rounded offsets

  Default: *5*

``Dissolve result`` [boolean]
  Choose to dissolve the final buffer, resulting in a single feature covering all
  input features.

  Default: *False*

  .. figure:: /static/user_manual/processing_algs/qgis/buffer_dissolve.png
     :align: center

     Normal and dissolved buffer

``End cap style`` [selection]
  Controls how line endings are handled in the buffer.

  .. figure:: /static/user_manual/processing_algs/qgis/buffer_cap_style.png
     :align: center

     Round, flat and square cap styles

``Join style`` [selection]
  Specifies whether round, miter or beveled joins should be used when offsetting
  corners in a line.

``Miter limit`` [number]
  Only applicable for mitered join styles, and controls the maximum distance from
  the offset curve to use when creating a mitered join

  Default: *2.0*

Outputs
.......

``Buffer`` [vector: polygon]
  Buffer polygon vector layer

See also
........
:ref:`qgisbuffer`


