.. only:: html

   |updatedisclaimer|

Vector overlay
==============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisclip:

Clip
----
Clips a vector layer using the polygons of an additional polygon layer.

Only the parts of the features in the input layer that falls within the polygons
of the clipping layer will be added to the resulting layer.

.. _warning_difference:

.. warning:: **Feature modification**

  The attributes of the features are **not modified**, although properties
  such as area or length of the features will be modified by the clipping operation.
  If such properties are stored as attributes, those attributes will have to be
  manually updated.

This algorithm uses spatial indexes on the providers, prepared geometries and
apply a clipping operation if the geometry isn't wholly contained by the
mask geometry.

.. figure:: /static/user_manual/processing_algs/qgis/clip.png
  :align: center

  Clipping operation


Parameters
..........
``Input layer`` [vector: any]
  Layer containing the features to be clipped.

``Clip layer`` [vector: line or polygon]
  Layer containing the clipping features.

Output
......

``Clipped`` [vector]
  Layer containing features from the input layer split by the clip layer.

See also
........
:ref:`qgisintersection`


.. _qgisdifference:

Difference
----------
Extracts features from the input layer that don't fall within the boundaries of
the difference layer.

Input layer features that are partially within difference layer feature(s) are
split along the boundary of the difference layer feature(s) and only the portions
outside the difference layer features are retained.

Attributes are not modified (see warning_difference_).

.. figure:: /static/user_manual/processing_algs/qgis/difference.png
  :align: center

  Difference operation

Parameters
..........

``Input layer`` [vector: any]
  Layer to extract features from

``Difference layer`` [vector: any]
  Subtracting layer

Output
......

``Difference`` [vector]
  Layer containing the differences feature of the input layer.

See also
........
:ref:`qgissymmetricaldifference`


.. _qgisextractbyextent:

Extract/clip by extent
----------------------
Creates a new vector layer that only contains features which fall within a specified
extent.

Any features which intersect the extent will be included.

Parameters
..........

``Input layer`` [vector: any]
  Input layer to be clipped.

``Extent (xmin, xmax, ymin, ymax)`` [extent]
  Extent of the clipping

``Clip feature to the extent`` [boolean]
  If checked, output geometries will be automatically converted to multi geometries
  to ensure uniform output types. Moreover the geometries will be clipped to the
  extent chosen instead of taking the whole geometry as output.

Output
......

``Extracted`` [vector]
  Layer containing the clipped features.


.. _qgisintersection:

Intersection
------------
Extracts the portions of features from the input layer that overlap features in the intersection layer.

Features in the intersection layer are assigned the attributes of the overlapping
features from both the input and intersection layers

Attributes are not modified (see warning_difference_).

.. figure:: /static/user_manual/processing_algs/qgis/intersection.png
  :align: center

  Intersection operation

Parameters
..........

``Input layer`` [vector: any]
  Input layer

``Intersection layer`` [vector: any]
  Layer containing the intersecting features.

``Input fields to keep`` [multipleinput]
  Optional

  Choose here the field(s) of the input layer to be kept. If no fields are chosen
  all fields are taken.

``Intersect fields to keep`` [multipleinput]
  Optional

  Choose here the field(s) of the intersection layer to be kept. If no fields are
  chosen all fields are taken.

Output
......

``Intersection`` [vector]
  Layer containing the intersected features.

See also
........
:ref:`qgisclip`


.. _qgislineintersections:

Line intersections
------------------
Creates point features where the lines from both layers intersect.


.. figure:: /static/user_manual/processing_algs/qgis/line_intersection.png
  :align: center

  Points of intersection


Parameters
..........

``Input layer`` [vector: line]
  Input layer

``Intersection layer`` [vector: line]
  Layer to use in the intersection operation.

``Input fields to keep`` [multipleinput]
  Optional

  Choose here the fields of the input layer to be kept. If no fields are chosen
  all fields are taken.

``Intersect fields to keep`` [multipleinput]
  Optional

  Choose here the field of the intersection layer to be kept. If no fields are
  chosen all fields are taken.

Output
......

``Intersection`` [vector: point]
  Point vector layer of the intersection


.. _qgissplitwithlines:

Split with lines
----------------
Splits the lines or polygons in one layer using the lines in another layer to
define the breaking points. Intersection between geometries in both layers are
considered as split points.

Output will contain multi geometries for split features.

.. figure:: /static/user_manual/processing_algs/qgis/split_with_lines.png
  :align: center

  Split lines

Parameters
..........

``Input layer`` [vector: polygon or line]
  Layer containing the lines or polygons to split.

``Split layer`` [vector: line]
  Line layer whose lines are used to define the breaking points.

Output
......

``Split`` [vector]
  Output layer with split lines or polygons from input layer.


.. _qgissymmetricaldifference:

Symmetrical difference
-----------------------
Creates a layer containing features from both the input and difference layers but
with the overlapping areas between the two layers removed.

The attribute table of the symmetrical difference layer contains attributes and fields
from both the input and difference layers.

Attributes are not modified (see warning_difference_).

.. figure:: /static/user_manual/processing_algs/qgis/symmetrical_difference.png
  :align: center

  Symmetrical difference operation

Parameters
..........

``Input layer`` [vector: any]
  One layer containing feature(s) to be compared.

``Difference layer`` [vector: any]
  Subtracting layer

Output
......

``Symmetrical difference`` [vector]
  Layer containing the symmetrical differences feature of the input layer.

See also
........
:ref:`qgisdifference`


.. _qgisunion:

Union
-----
Creates a layer containing all the features from both input layers.

In the case of polygon layers, separate features are created for overlapping and
non-overlapping features.

The attribute table of the union layer contains attribute values from the respective
input layer for non-overlapping features and attribute values from both input
layers for overlapping features.


.. figure:: /static/user_manual/processing_algs/qgis/union.png
  :align: center

  Union operation


Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

``Union layer`` [vector: any]
  Layer that will be combined to the first one.

Output
......

``Union`` [vector]
  Layer containing the union of the layers
