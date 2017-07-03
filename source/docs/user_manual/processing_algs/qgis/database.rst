.. only:: html

   |updatedisclaimer|

Database
========

.. only:: html

   .. contents::
      :local:
      :depth: 1

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

``Schema (schema name)`` [string]
  Optional.

  An existing schema of the selected database can be chosen.
  By default this is the `public` schema.

  Default: *public*

``Table to import to (leave blank to use layer name)`` [string]
  Optional.

  Defines a table name for the imported vector file.
  If nothing is added, the layer name will be chosen.

  Default: *(not set)*

``Primary key field`` [tablefield: any]
  Optional.

  Sets the primary key field from an existing field in the vector layer.

``Geometry column`` [string]
  Defines the name of the geometry column in the new PostGIS table.
  Geometry information for the features is stored in this column.

  Default: *geom*

``Encoding`` [string]
  Optional.

  Defines the encoding of the layer in the new PostGIS table.

  Default: *UTF-8*

``Overwrite`` [boolean]
  Overwrites existing tables having the same name.

  Default: *True*

``Create spatial index`` [boolean]
  Specify whether to create a spatial index or not. By default a spatial
  index is created.

  Default: *True*

``Convert field names to lowercase`` [boolean]
  If activated this prevents the field names of the input vector layer from
  being converted to lowercase.
  By default field names will be lowercase after the import.

  Default: *True*

``Drop length constraints on character fields`` [boolean]
  Specify whether the length constraints on character fields should be dropped
  or not.
  By default the length constraints are applied.

  Default: *False*

``Create single-part geometries instead of multi-part`` [boolean]
  Specify if the features of the loaded layer should be single-part instead of
  multi-part.
  By default the existing geometries information are preserved.

  Default: *False*


Console usage
.............

::

  processing.run('qgis:importintopostgis', input, database, schema, tablename, primary_key, geometry_column, encoding, overwrite, createindex, lowercase_names, drop_string_length, create_single_parts)


PostGIS execute SQL
-------------------

Description
...........

Allows a SQL database query to be performed on a PostGIS database connected to QGIS.
The algorithm **won't** create any new layer: it is designed to run queries on
the layer itself.

.. _postgis_query_example:

Example
.......
1. Set all the values of an existing filed to a fixed value. The SQL query string
will be::

  UPDATE your_table SET field_to_update=20;

in the example above, the values of the field ``field_to_update`` of the table
``your_table`` will be all set to ``20``.

2. Create a new ``area`` column and calculate the area of each feature with the
``ST_AREA`` PostGIS function.

Run the first query and create the new column ``area`` on the table ``my_table``::

  ALTER TABLE my_table ADD COLUMN area double precision;

Run the second query and update the `area` column and calculate the area of each
feature::

  UPDATE my_table SET area=ST_AREA(geom);


Parameters
..........

``Database`` [string]
  Name of the database, not the connection name.
  By default you don't have to fill in the name, the current database
  connection will be chosen.

  Default: *(not set)*

``SQL query`` [string]
  Defines the SQL query, for example ``UPDATE my_table SET field=10``.

  Default: *(not set)*

Outputs
.......
No new outputs will be created. The layer chosen will be updated with the executed
SQL query. By opening the table (for example with Data Manager) you will see
the results.

Console usage
.............

::

  processing.run('qgis:postgisexecutesql', database, sql)


Import into Spatialite
----------------------

Description
...........

Imports a vector layer currently loaded in QGIS into a Spatialite database.
Prior to this a connection between QGIS and the Spatialite database has to
be created (for example with the DB Manager).


Parameters
..........

``Layer to import`` [vector: any]
  Existing vector layer in QGIS.

``File database`` [selection]
  Name of the database connection. The combobox will show all the databases of
  the layers loaded in QGIS. Moreover, it is possible to choose an external
  `sqlite` file.

``Table to import to (leave blank to use layer name)`` [string]
  Optional.

  Defines a table name for the imported vector file.
  If nothing is added, the layer name will be chosen.

  Default: *(not set)*

``Primary key field`` [tablefield: any]
  Optional.

  Sets the primary key field from an existing field in the vector layer.

``Geometry column`` [string]
  Defines the name of the geometry column in the new SpatiaLite table.
  Geometry information for the features is stored in this column.

  Default: *geom*

``Encoding`` [string]
  Optional.

  Defines the encoding of the layer in the new SpatiLite table.

  Default: *UTF-8*

``Overwrite`` [boolean]
  Overwrites existing tables having the same name.

  Default: *True*

``Create spatial index`` [boolean]
  Specify whether to create a spatial index or not. By default a spatial
  index is created.

  Default: *True*

``Convert field names to lowercase`` [boolean]
  If activated this prevents the field names of the input vector layer from
  being converted to lowercase.
  By default field names will be lowercase after the import.

  Default: *True*

``Drop length constraints on character fields`` [boolean]
  Specify whether the length constraints on character fields should be dropped
  or not.
  By default the length constraints are applied.

  Default: *False*

``Create single-part geometries instead of multi-part`` [boolean]
  Specify if the features of the loaded layer should be single-part instead of
  multi-part.
  By default the existing geometries information are preserved.

  Default: *False*


Console usage
.............

::

  processing.run('qgis:importintosptaialite', input, database, tablename, primary_key, geometry_column, encoding, overwrite, createindex, lowercase_names, drop_string_length, create_single_parts)


Spatialite execute SQL
----------------------

Description
...........

Allows a SQL database query to be performed on a SpatiLite database connected to QGIS.
The algorithm **won't** create any new layer: it is designed to run queries on
the layer itself.

Parameters
..........

``Database`` [string]
  Name of the database, not the connection name.
  By default you don't have to fill in the name, the current database
  connection will be chosen.

  Default: *(not set)*

``SQL query`` [string]
  Defines the SQL query, for example ``UPDATE my_table SET field=10``.

  Default: *(not set)*

Outputs
.......
No new outputs will be created. The layer chosen will be updated with the executed
SQL query. By opening the table (for example with Data Manager) you will see
the results.

Console usage
.............

::

  processing.run('qgis:spatialiteexecutesql', database, sql)

See also
........
For some SQL query examples see :ref:`PostGIS SQL Query Examples <postgis_query_example>`
