Import Vector into PostGIS database (available connections)
===========================================================

Description
-----------

Imports vector layers inside a PostGIS database on the basis of
an available connection.
The algorithm is derived from the `ogr2ogr utility <http://www.gdal.org/ogr2ogr.html>`_ .

Parameters
----------

``Database (connection name)`` [selection]
  Requires the database (connection) name.

  Options:

  * 0 --- local

  Default: *0*

``Input layer`` [vector: any]
  Any OGR-supported vector layer.

``Output geometry type`` [selection]
  Defines the output geometry type. By default this is Polygon.

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
  CRS of the input vector layer.

  Default: *EPSG:4326*

``Output CRS (EPSG Code)`` [crs]
  Defines the output CRS of the database table.

  Default: *EPSG:4326*

``Schema name`` [string]
  Optional.

  Defines the schema to which the database table will be assigned to.
  By default, 'public' is chosen.

  Default: *public*

``Table name, leave blank to use input name`` [string]
  Optional.

  Defines a name for the table that will be imported into the database.
  By default the table name is the name oof the input vector file.

  Default: *(not set)*

``Primary Key`` [string]
  Optional.

  Defines which attribute field will be the primary key of the database table.
  By default this is 'id'.

  Default: *id*

``Geometry column name`` [string]
  Optional.

  Defines in which attribute field of the database there will be the geometry
  information. By default it will be taken from the 'geom' column.

  Default: *geom*

``Vector dimensions`` [selection]
  Defines if the vector file to be imported has 2-D or 3-D data.

  Options:

  * 0 --- 2
  * 1 --- 3

  Default: *0*

``Distance tolerance for simplification`` [string]
  Optional.

  Defines a distance tolerance for the simplification of the vector geometries
  to be imported.

  Default: *(not set)*

``Maximum distance between 2 nodes (densification)`` [string]
  Optional.

  The maximum distance between two nodes. Used to create intermediate points.

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

