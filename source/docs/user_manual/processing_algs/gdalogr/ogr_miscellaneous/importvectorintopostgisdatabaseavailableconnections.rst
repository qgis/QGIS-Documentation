Import Vector into PostGIS database (available connections)
===========================================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Database (connection name)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- local

  Default: *0*

``Input layer`` [vector: any]
  <put parameter description here>

``Output geometry type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- 
  * 1 --- NONE
  * 2 --- GEOMETRY
  * 3 --- POINT
  * 4 --- LINESTRING
  * 5 --- POLYGON
  * 6 --- GEOMETRYCOLLECTION
  * 7 --- MULTIPOINT
  * 8 --- MULTIPOLYGON
  * 9 --- MULTILINESTRING

  Default: *5*

``Input CRS (EPSG Code)`` [crs]
  <put parameter description here>

  Default: *EPSG:4326*

``Output CRS (EPSG Code)`` [crs]
  <put parameter description here>

  Default: *EPSG:4326*

``Schema name`` [string]
  Optional.

  <put parameter description here>

  Default: *public*

``Table name, leave blank to use input name`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

``Primary Key`` [string]
  Optional.

  <put parameter description here>

  Default: *id*

``Geometry column name`` [string]
  Optional.

  <put parameter description here>

  Default: *geom*

``Vector dimensions`` [selection]
  <put parameter description here>

  Options:

  * 0 --- 2
  * 1 --- 3

  Default: *0*

``Distance tolerance for simplification`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

``Maximum distance between 2 nodes (densification)`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

``Select features by extent (defined in input layer CRS)`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Clip the input layer using the above (rectangle) extent`` [boolean]
  <put parameter description here>

  Default: *False*

``Select features using a SQL "WHERE" statement (Ex: column="value")`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

``Group "n" features per transaction (Default: 20000)`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

``Overwrite existing table?`` [boolean]
  <put parameter description here>

  Default: *True*

``Append to existing table?`` [boolean]
  <put parameter description here>

  Default: *False*

``Append and add new fields to existing table?`` [boolean]
  <put parameter description here>

  Default: *False*

``Do not launder columns/table name/s?`` [boolean]
  <put parameter description here>

  Default: *False*

``Do not create Spatial Index?`` [boolean]
  <put parameter description here>

  Default: *False*

``Continue after a failure, skipping the failed feature`` [boolean]
  <put parameter description here>

  Default: *False*

``Additional creation options`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
-------

Console usage
-------------

::

  processing.runalg('gdalogr:importvectorintopostgisdatabaseavailableconnections', database, input_layer, gtype, s_srs, t_srs, schema, table, pk, geocolumn, dim, simplify, segmentize, spat, clip, where, gt, overwrite, append, addfields, launder, index, skipfailures, options)

See also
--------

