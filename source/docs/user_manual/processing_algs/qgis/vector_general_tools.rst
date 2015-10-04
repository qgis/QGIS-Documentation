|updatedisclaimer|

Vector general
==============

Delete duplicate geometries
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)

See also
........

Join attributes by location
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Target vector layer`` [vector: any]
  <put parameter description here>

``Join vector layer`` [vector: any]
  <put parameter description here>

``Geometric predicate`` [geometrypredicate]
  Predicate name or list of predicate names interpreted in an OR like manner.

  Possible values: *['intersects', 'contains', 'equals', 'touches', 'overlaps', 'within', 'crosses']*

  Default: *[]*

``Attribute summary`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Take attributes of the first located feature
  * 1 --- Take summary of intersecting features

  Default: *0*

``Statistics for summary (comma separated)`` [string]
  Optional.

  <put parameter description here>

  Default: *sum,mean,min,max,median*

``Joined table`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Only keep matching records
  * 1 --- Keep all records (including non-matching target records)

  Default: *0*

Outputs
.......

``Joined layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:joinattributesbylocation', target, join, predicate, summary, stats, keep, output)

See also
........

Join attributes table
---------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Input layer 2`` [table]
  <put parameter description here>

``Table field`` [tablefield: any]
  <put parameter description here>

``Table field 2`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:joinattributestable', input_layer, input_layer_2, table_field, table_field_2, output_layer)

See also
........

Merge vector layers
-------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer 1`` [vector: any]
  <put parameter description here>

``Input layer 2`` [vector: any]
  <put parameter description here>

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:mergevectorlayers', layer1, layer2, output)

See also
........

Polygon from layer extent
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Calculate extent for each feature separately`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:polygonfromlayerextent', input_layer, by_feature, output)

See also
........

Reproject layer
---------------

Description
...........

Reprojects a vector layer in a different CRS.

Parameters
..........

``Input layer`` [vector: any]
  Layer to reproject.

``Target CRS`` [crs]
  Destination coordinate reference system.

  Default: *EPSG:4326*

Outputs
.......

``Reprojected layer`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('qgis:reprojectlayer', input, target_crs, output)

See also
........

Save selected features
----------------------

Description
...........

Saves the selected features as a new layer.

Parameters
..........

``Input layer`` [vector: any]
  Layer to process.

Outputs
.......

``Output layer with selected features`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg('qgis:saveselectedfeatures', input_layer, output_layer)

See also
........

Set style for vector layer
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Vector layer`` [vector: any]
  <put parameter description here>

``Style file`` [file]
  <put parameter description here>

Outputs
.......

``Styled layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:setstyleforvectorlayer', input, style)

See also
........

Snap points to grid
-------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Layer`` [vector: any]
  <put parameter description here>

``Horizontal spacing`` [number]
  <put parameter description here>

  Default: *0.1*

``Vertical spacing`` [number]
  <put parameter description here>

  Default: *0.1*

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:snappointstogrid', input, hspacing, vspacing, output)

See also
........

Split vector layer
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Unique ID field`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Output directory`` [directory]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:splitvectorlayer', input, field, output)

See also
........

Oriented minimum bounding box
-----------------------------

Description
...........

Return an oriented minimum bounding Box layer by using the rotating calipers algorithm.

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Calculate OMBB for each feature separately`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Oriented_MBBox`` [vector]
  The resulting layer.

Console usage
.............

::

  processing.runalg("qgis:orientedminimumboundingbox", input , by_feature, output)

See also
........

