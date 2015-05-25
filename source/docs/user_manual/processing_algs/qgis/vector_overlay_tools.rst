|updatedisclaimer|

Vector overlay
==============

Clip
----

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Clip layer`` [vector: any]
  <put parameter description here>

Outputs
.......

``Clipped`` [vector]
  <put output description here>

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
  <put output description here>

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
  <put output description here>

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
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:lineintersections', input_a, input_b, field_a, field_b, output)

See also
........

Symetrical difference
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

``Symetrical difference`` [vector]
  <put output description here>

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
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:union', input, input2, output)

See also
........

