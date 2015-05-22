|updatedisclaimer|

Shapes tools
============

Create graticule
----------------

Description
...........

Creates a grid.

Parameters
..........

``Extent`` [vector: any]
  Optional.

  Grid will be created according to the selected layer.

``Output extent`` [extent]
  Extent of the grid.

  Default: *0,1,0,1*

``Division Width`` [number]
  X-axes spacing between the lines.

  Default: *1.0*

``Division Height`` [number]
  Y-axes spacing between the lines.

  Default: *1.0*

``Type`` [selection]
  Geometry type of the resulting grid.

  Options:

  * 0 --- [0] Lines
  * 1 --- [1] Rectangles

  Default: *0*

Outputs
.......

``Graticule`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:creategraticule', extent, output_extent, distx, disty, type, graticule)

See also
........

Cut shapes layer
----------------

Description
...........

<put algortithm description here>

Parameters
..........

``Vector layer to cut`` [vector: any]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] completely contained
  * 1 --- [1] intersects
  * 2 --- [2] center

  Default: *0*

``Cutting polygons`` [vector: any]
  <put parameter description here>

Outputs
.......

``Result`` [vector]
  <put output description here>

``Extent`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:cutshapeslayer', shapes, method, polygons_polygons, cut, extent)

See also
........

Get shapes extents
------------------

Description
...........

Creates polygons according to the extent of the input layer features.

Parameters
..........

``Shapes`` [vector: any]
  Input layer.

``Parts`` [boolean]
  Determines whether create polygon for each feature (``True``) or just create
  single polygon for whole layer (``False``).

  Default: *True*

Outputs
.......

``Extents`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:getshapesextents', shapes, parts, extents)

See also
........

Merge shapes layers
-------------------

Description
...........

Merges two or more input layer into a unique resulting layer. You can merge
together only layer of the same type (polygons with polygons, lines with lines,
points with points).

The attribute table of the resulting layer will include only the attributes of
the first input layer. Two additional columns will be added: one corresponding
to the ID of every merged layer and the other one corresponding to the original
name of the merged layer.

Parameters
..........

``Main Layer`` [vector: any]
  Initial layer.

``Additional Layers`` [multipleinput: any vectors]
  Optional.

  Layer(s) to merge with.

Outputs
.......

``Merged Layer`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:mergeshapeslayers', main, layers, out)

See also
........

Polar to cartesian coordinates
------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Polar Coordinates`` [vector: any]
  <put parameter description here>

``Exaggeration`` [tablefield: any]
  <put parameter description here>

``Exaggeration Factor`` [number]
  <put parameter description here>

  Default: *1*

``Radius`` [number]
  <put parameter description here>

  Default: *6371000.0*

``Degree`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Cartesian Coordinates`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:polartocartesiancoordinates', polar, f_exagg, d_exagg, radius, degree, cartes)

See also
........

Quadtree structure to shapes
----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Shapes`` [vector: any]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Polygons`` [vector]
  <put output description here>

``Lines`` [vector]
  <put output description here>

``Duplicated Points`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:quadtreestructuretoshapes', shapes, attribute, polygons, lines, points)

See also
........

Shapes buffer
-------------

Description
...........

Creates buffer around features based on fixed distance or distance field.

Parameters
..........

``Shapes`` [vector: any]
  Input layer.

``Buffer Distance`` [selection]
  Buffering method.

  Options:

  * 0 --- [0] fixed value
  * 1 --- [1] attribute field

  Default: *0*

``Buffer Distance (Fixed)`` [number]
  Buffer distance for "fixed value" method.

  Default: *100.0*

``Buffer Distance (Attribute)`` [tablefield: any]
  Name of the distance field for "attribute field" method.

``Scaling Factor for Attribute Value`` [number]
  <put parameter description here>

  Default: *1.0*

``Number of Buffer Zones`` [number]
  Number of buffer(s) to generate.

  Default: *1.0*

``Circle Point Distance [Degree]`` [number]
  Smoothness of the buffer borders: great numbers means rough borders.

  Default: *5.0*

``Dissolve Buffers`` [boolean]
  Determines whether to dissolve results or not.

  Default: *True*

Outputs
.......

``Buffer`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('saga:shapesbuffer', shapes, buf_type, buf_dist, buf_field, buf_scale, buf_zones, dcircle, dissolve, buffer)

See also
........

Split shapes layer randomly
---------------------------

Description
...........

Splits the input layer randomly in two parts.

Parameters
..........

``Shapes`` [vector: any]
  Layer to split.

``Split ratio (%)`` [number]
  Split ratio between the resulting layers.

  Default: *50*

Outputs
.......

``Group A`` [vector]
  First resulting layer.

``Group B`` [vector]
  Second resulting layer.

Console usage
.............

::

  processing.runalg('saga:splitshapeslayerrandomly', shapes, percent, a, b)

See also
........

Transform shapes
----------------

Description
...........

<put algortithm description here>

Parameters
..........

``Shapes`` [vector: any]
  <put parameter description here>

``dX`` [number]
  <put parameter description here>

  Default: *0.0*

``dY`` [number]
  <put parameter description here>

  Default: *0.0*

``Angle`` [number]
  <put parameter description here>

  Default: *0.0*

``Scale Factor X`` [number]
  <put parameter description here>

  Default: *1.0*

``Scale Factor Y`` [number]
  <put parameter description here>

  Default: *1.0*

``X`` [number]
  <put parameter description here>

  Default: *0.0*

``Y`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:transformshapes', in, dx, dy, angle, scalex, scaley, anchorx, anchory, out)

See also
........

