|updatedisclaimer|

Vector overlay
==============

Clip
----

Description
...........

This algorithm extracts features from the Input Layer that fall within, or partially within, the boundaries of features in the Clip Layer. Input Layer features that fall partially within clip layer feature(s) are split along the boundary of the clip layer feature(s). If any features are selected in the Input and Clip Layers, then only those features are used in the clip operation. If no features are selected then the clip operation is performed using all features. The clip function is also known as the cookie-cutter.

Parameters
..........

``Input layer`` [vector: any]
  The layer containing the features to be clipped.

``Clip layer`` [vector: any]
  The layer containing the features that are used to clip the features in the input layer.

``Open output file after running algorithm``
  Choose whether to load the clipped layer to the map canvas once the clip operation has been completed.

Outputs
.......

``Clipped`` [vector]
  Where to save the clipped layer. Can be saved to file, a temporary file or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:clip', input, overlay, output)

See also
........

Difference
----------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Difference layer`` [vector: any]
  <put parameter description here>

Outputs
.......

``Difference`` [vector]
  Where to save the difference layer. Can be saved to file, a temporary file or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:difference', input, overlay, output)

See also
........

Intersection
------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Intersect layer`` [vector: any]
  <put parameter description here>

Outputs
.......

``Intersection`` [vector]
  Where to save the intersection layer. Can be saved to file, a temporary file or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:intersection', input, input2, output)

See also
........

Line intersections
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: line]
  <put parameter description here>

``Intersect layer`` [vector: line]
  <put parameter description here>

``Input unique ID field`` [tablefield: any]
  <put parameter description here>

``Intersect unique ID field`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  Where to save the line intersection layer. Can be saved to file, a temporary file or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:lineintersections', input_a, input_b, field_a, field_b, output)

See also
........

Symmetrical difference
---------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Difference layer`` [vector: any]
  <put parameter description here>

Outputs
.......

``Symmetrical difference`` [vector]
  Where to save the symmetrical difference layer. Can be saved to file, a temporary file or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:symetricaldifference', input, overlay, output)

See also
........

Union
-----

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Input layer 2`` [vector: any]
  <put parameter description here>

Outputs
.......

``Union`` [vector]
  Where to save the union layer. Can be saved to file, a temporary file or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:union', input, input2, output)

See also
........

