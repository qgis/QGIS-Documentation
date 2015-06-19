|updatedisclaimer|

Database
========

Import into PostGIS
-------------------

Description
...........

Imports existing vector layer in QGIS into a PostGIS database.
Before a connection between QGIS and the PostGIS database has to
be created (for example with the DB Manager).

Parameters
..........

``Layer to import`` [vector: any]
  Existing vector layer in QGIS.

``Database (connection name)`` [selection]
  Name of the database connection name (not the database name).

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
  Defines the name for the geometry information of the table.

  Default: *geom*

``Overwrite`` [boolean]
  Overwrites existing tables having the same name.

  Default: *True*

``Create spatial index`` [boolean]
  Defines that no spatial index is created. By default a spatial index
  is created.

  Default: *True*

``Convert field names to lowercase`` [boolean]
  If activated this prevents that the field names of the input vector layer
  are set to lowercase.
  By default field names will be lowercase after the import.

  Default: *True*

``Drop length constraints on character fields`` [boolean]
  Activates that the length constraints on character fields are dropped.
  By default the length constraints are valid.

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

Makes it possible to perform a SQL database query on a PostGIS database
connected to QGIS.

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

