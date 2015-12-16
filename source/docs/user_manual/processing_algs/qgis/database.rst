|updatedisclaimer|

Database
========

Import into PostGIS
-------------------

Description
...........

Imports a vector layer currently loaded in QGIS into a PostGIS database.
Prior to this a connection between QGIS and the PostGIS database has to
be created (for example with the DB Manager).

Parameters
..........

``Layer to import`` [vector: any]
  Existing vector layer in QGIS.

``Database (connection name)`` [selection]
  Name of the database connection (not the database name).

  Options:

  * 0 --- local

  Default: *0*

``Schema (schema name)`` [string]
  An existing schema of the selected database can be chosen.
  By default this is the 'public' schema.

  Default: *public*

``Table to import to (leave blank to use layer name)`` [string]
  Defines a table name for the imported vector file.
  By default the name of the vector file is chosen.

  Default: *(not set)*

``Primary key field`` [tablefield: any]
  Optional.

  Sets the primary key field from an existing field in the vector layer.

``Geometry column`` [string]
  Defines the name of the geometry column in the new PostGIS table. Geometry information for the features is stored in this column.

  Default: *geom*

``Overwrite`` [boolean]
  Overwrites existing tables having the same name.

  Default: *True*

``Create spatial index`` [boolean]
  Specify whether to create a spatial index or not. By default a spatial index
  is created.

  Default: *True*

``Convert field names to lowercase`` [boolean]
  If activated this prevents the field names of the input vector layer from being converted to lowercase.
  By default field names will be lowercase after the import.

  Default: *True*

``Drop length constraints on character fields`` [boolean]
  Specify whether the length constraints on character fields should be dropped or not.
  By default the length constraints are applied.

  Default: *False*

Outputs
.......

Console usage
.............

::

  processing.runalg('qgis:importintopostgis', input, database, schema, tablename, primary_key, geometry_column, overwrite, createindex, lowercase_names, drop_string_length)

See also
........

PostGIS execute SQL
-------------------

Description
...........

Allows a SQL database query to be performed on a PostGIS database connected to QGIS.

Parameters
..........

``Database`` [string]
  Name of the database, not the connection name.
  By default you don't have to fill in the name, the current database
  connection will be chosen.

  Default: *(not set)*

``SQL query`` [string]
  Defines the SQL query, for example 'create schema test;'.

  Default: *(not set)*

Outputs
.......

Console usage
.............

::

  processing.runalg('qgis:postgisexecutesql', database, sql)

See also
........

