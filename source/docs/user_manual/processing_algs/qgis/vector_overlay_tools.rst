|updatedisclaimer|

Vector overlay
==============

Clip
----

Description
...........

This algorithm extracts features from the Input layer that fall within, or partially within, the boundaries of features in the Clip layer. Input layer features that fall partially within clip layer feature(s) are split along the boundary of the clip layer feature(s) and only the portions within the clip layer features are retained. If any features are selected in the Input and Clip layers, then only those features are used in the clip operation. If no features are selected then the clip operation is performed using all features. The clip function is also known as the cookie-cutter.

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

This algorithm extracts features from the Input layer that fall outside, or partially overlap, features in the Difference layer. Input layer features that partially overlap the difference layer feature(s) are split along the boundary of the difference layer feature(s) and only the portions outside the difference layer features are retained. If any features are selected in the Input and Difference layers, then only those features are used in the difference operation. If no features are selected then the difference operation is performed using all features. The difference algorithm performs the opposite task to the clip algorithm.

Parameters
..........

``Input layer`` [vector: any]
  The layer on which the difference operation is performed.

``Difference layer`` [vector: any]
  The layer containing the difference features.

``Open output file after running algorithm``
  Choose whether to load the difference layer to the map canvas once the difference operation has been completed.

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

This algorithm extracts the overlapping portions of features in the Input and Intersect layers. Features in the Intersection layer are assigned the attributes of the overlapping features from both the Input and Intersect layers. If any features are selected in the Input and Intersect layers, then only those features are used in the intersection operation. If no features are selected then the intersection operation is performed using all features.

Parameters
..........

``Input layer`` [vector: any]
  The layer on which the intersection operation is performed.

``Intersect layer`` [vector: any]
  The layer containing the features to intersect the features in the input layer.

``Open output file after running algorithm``
  Choose whether to load the intersection layer to the map canvas once the intersection operation has been completed.

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

This algorithm creates point features where the lines in the Intersect layer intersect the lines in the Input layer. If no Input Unique and Intersect Unique ID fields are specified then the point features are given the values of the last field (i.e. the last field/column in the attribute table) of the intersecting lines. If any features are selected in the Input and Intersect layers, then only those features are used in the line intersection operation. If no features are selected then the intersection operation is performed using all features.

Parameters
..........

``Input layer`` [vector: line]
  The layer on which the intersection operation is performed.

``Intersect layer`` [vector: line]
  The layer containing the line features intersecting the features in the input layer.

``Input unique ID field`` [tablefield: any]
  Optional.
  An attribute field from the Input layer to include in the attribute table of the Line intersection layer.

``Intersect unique ID field`` [tablefield: any]
  Optional.
  An attribute field from the Intersect layer to include in the attribute table of the Line intersection layer.

``Open output file after running algorithm``
  Choose whether to load the line intersection layer to the map canvas once the intersection operation has been completed.

Outputs
.......

``Intersections`` [vector: point]
  Where to save the line intersection layer. Can be saved to file, a temporary file or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:lineintersections', input_a, input_b, field_a, field_b, output)

See also
........

Split lines with lines
----------------------

Description
...........

This algorithm splits the lines of the Input layer where they intersect the lines of the Split layer. If any lines are selected in the Input and Split layers, then only those features are used in the split operation. If no lines are selected then the split operation is performed using all features.

Parameters
..........

``Input layer`` [vector: line]
  The layer containing the lines to be split.

``Split layer`` [vector: line]
  The layer containing the lines with which to split (intersect) the input layer lines.

``Open output file after running algorithm``
  Choose whether to load the splitted layer to the map canvas once the split operation has been completed.

Outputs
.......

``Splitted`` [vector]
  Where to save the splitted layer. Can be saved to file, a temporary file or a memory layer.

Console usage
.............

::

  processing.runalg('qgis:splitlineswithlines', input, split, output)

See also
........

Symmetrical difference
----------------------

Description
...........

This algorithm creates a layer containing features from both the Input and Difference layers but with the overlapping areas between the two layers removed. The attribute table of the Symmetrical Difference layer contains atrributes from both the Input and Difference layers. If any features are selected in the Input and Difference layers, then only those features are used in the symmetrical difference operation. If no features are selected then the symmetrical difference operation is performed using all features. The symmetrical difference algorithm performs the opposite task to the intersection algorithm.

Parameters
..........

``Input layer`` [vector: any]
  The layer on which the symmetrical difference operation is performed.

``Difference layer`` [vector: any]
  The layer containing the difference features.

``Open output file after running algorithm``
  Choose whether to load the symmetrical difference layer to the map canvas once the symmetrical difference operation has been completed.

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

This algorithm creates a layer containing all the features from both input layers. In the case of polygon layers, separate features are created for overlapping and non-overlapping features. The attribute table of the union layer contains attribute values from the respective input layer for non-overlapping features, and attribute values from both input layers for overlapping features. If any features are selected in the two Input layers, then only those features are used in the union operation. If no features are selected then the union operation is performed using all features.

Parameters
..........

``Input layer`` [vector: any]
  The first layer participating in the union operation.

``Input layer 2`` [vector: any]
  The second layer participating in the union operation.

``Open output file after running algorithm``
  Choose whether to load the union layer to the map canvas once the union operation has been completed.

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

