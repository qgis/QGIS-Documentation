|updatedisclaimer|

OGR miscellaneous
=================

Execute SQL
-----------

Description
...........

<put algortithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``SQL`` [string]
  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``SQL result`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('gdalogr:executesql', input, sql, output)

See also
........

Import Vector into PostGIS database (available connections)
-----------------------------------------------------------

Description
...........

Imports vector layers inside a PostGIS database on the basis of
an available connection. The connection has to be defined properly
with the 'Add PostGIS Table(s)' dialog before. Use the 'Edit' button
to define the connection. Be aware that the checkboxes 'Save Username'
and 'Save Password' are activated. Then you can use the algorithm.
The algorithm is derived from the `ogr2ogr utility <http://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

``Database (connection name)`` [selection]
  Requires the database (connection) name.

  Options:

  * 0 --- local

  Default: *0*

``Input layer`` [vector: any]
  Any OGR-supported vector layer loaded into the |qg| map canvas.

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
  By default the table name is the name of the input vector file.

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
  to be imported. By default no simplification there is no simplification.

  Default: *(not set)*

``Maximum distance between 2 nodes (densification)`` [string]
  Optional.

  The maximum distance between two nodes. Used to create intermediate points.
  By default there is no maximum distance.

  Default: *(not set)*

``Select features by extent (defined in input layer CRS)`` [extent]
  You can select features from a given extent that will be in the output table.

  Default: *0,1,0,1*

``Clip the input layer using the above (rectangle) extent`` [boolean]
  The input layer will be clipped by the extent you defined before.

  Default: *False*

``Select features using a SQL "WHERE" statement (Ex: column="value")`` [string]
  Optional.

  Defines with a SQL "WHERE" statement which features should be selected for the
  output table.

  Default: *(not set)*

``Group "n" features per transaction (Default: 20000)`` [string]
  Optional.

  You can group the input features in transactions where "n" defines the size.
  By default "n" limits the transaction size to 20000 features.

  Default: *(not set)*

``Overwrite existing table?`` [boolean]
  If there is a table with the same name in the database, it won't
  be overwritten. By default this takes place.

  Default: *True*

``Append to existing table?`` [boolean]
  <put parameter description here>

  Default: *False*

``Append and add new fields to existing table?`` [boolean]
  If activated the vector data will be appended to an existing table,
  there won't be created a new table. By default a new table will be
  created.

  Default: *False*

``Do not launder columns/table name/s?`` [boolean]
  With this option you can prevent processing from converting column
  names to lowercase, from removing spaces and other invalid characters.

  Default: *False*

``Do not create Spatial Index?`` [boolean]
  Prevents that a spatial index in the output table will be created.

  Default: *False*

``Continue after a failure, skipping the failed feature`` [boolean]
  <put parameter description here>

  Default: *False*

``Additional creation options`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
.......

Console usage
.............

::

  processing.runalg('gdalogr:importvectorintopostgisdatabaseavailableconnections', database, input_layer, gtype, s_srs, t_srs, schema, table, pk, geocolumn, dim, simplify, segmentize, spat, clip, where, gt, overwrite, append, addfields, launder, index, skipfailures, options)

See also
........

Import Vector into PostGIS database (new connection)
----------------------------------------------------

Description
...........

Imports vector layers inside a PostGIS database. A new connection
to the PostGIS database must be created.
The algorithm is derived from the `ogr2ogr utility <http://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

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

``Host`` [string]
  <put parameter description here>

  Default: *localhost*

``Port`` [string]
  <put parameter description here>

  Default: *5432*

``Username`` [string]
  <put parameter description here>

  Default: *(not set)*

``Database Name`` [string]
  <put parameter description here>

  Default: *(not set)*

``Password`` [string]
  <put parameter description here>

  Default: *(not set)*

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
.......

Console usage
.............

::

  processing.runalg('gdalogr:importvectorintopostgisdatabasenewconnection', input_layer, gtype, s_srs, t_srs, host, port, user, dbname, password, schema, table, pk, geocolumn, dim, simplify, segmentize, spat, clip, where, gt, overwrite, append, addfields, launder, index, skipfailures, options)

See also
........

Information
-----------

Description
...........

Creates an information file that lists information about an OGR-supported
data source. The output will be shown in a 'Result' window and can be written
into a HTML-file.
The information includes the geometry type, feature count, the spatial extent,
the projection information and many more.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

Outputs
.......

``Layer information`` [html]
  Name of the output HTML-file that includes the file information.
  If no HTML-file is defined the output will be written into a temporary file.

Console usage
.............

::

  processing.runalg('gdalogr:information', input, output)

See also
........

