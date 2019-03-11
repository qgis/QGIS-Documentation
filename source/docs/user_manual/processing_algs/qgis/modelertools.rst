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
-----------------------
Loads a layer to the current project.

Parameters
..........

``Layer`` [layer: any]
  Layer to load in the legend.

``Loaded layer name`` [string]
  Name of the loaded layer.


.. _qgisrenamelayer:

Rename layer
------------

Parameters
..........

``Layer`` [layer: any]
  Layer to rename.

``New name`` [string]
  Name of the layer.


.. _qgisstringconcatenation:

String concatenation
--------------------
Concatenates two strings into a single one in the Processing Modeler.

Parameters
..........

``Input 1`` [string]
  First string to concatenate.

``Input 2`` [string]
  Second string to concatenate.


.. _qgisvariabledistancebuffer:

Variable distance buffer
------------------------
Computes a buffer area for all the features in an input layer.

The size of the buffer for a given feature is defined by an attribute, so it allows
different features to have different buffer sizes.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Distance field`` [tablefield: numeric]
  Attribute for the distance radius of the buffer.

``Segments`` [number]
  Controls the number of line segments to use to approximate a quarter circle when
  creating rounded offsets.

  Default: *5*

``Dissolve result`` [boolean]
  Choose to dissolve the final buffer, resulting in a single feature covering all
  input features.

  Default: *False*

  .. figure:: img/buffer_dissolve.png
     :align: center

     Normal and dissolved buffer

``End cap style`` [enumeration]
  Controls how line endings are handled in the buffer.

  .. figure:: img/buffer_cap_style.png
     :align: center

     Round, flat and square cap styles

``Join style`` [enumeration]
  Specifies whether round, miter or beveled joins should be used when offsetting
  corners in a line.

``Miter limit`` [number]
  Only applicable for mitered join styles, and controls the maximum distance from
  the offset curve to use when creating a mitered join.

  Default: *2.0*

Outputs
.......

``Buffer`` [vector: polygon]
  Buffer polygon vector layer.

See also
........

:ref:`qgisbuffer`


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
