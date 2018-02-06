.. only:: html

   |updatedisclaimer|

Database
========

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgis_import_into_postgis:

Import into PostGIS
-------------------

Imports a vector layer currently loaded in QGIS into a PostGIS database.
Prior to this a connection between QGIS and the PostGIS database has to
be created (for example with the DB Manager).

Parameters
..........

``Layer to import`` [vector: any]
  One of the loaded layer in QGIS. If you want to import another layer you have
  to load it in QGIS before to import.

``Database (connection name)`` [selection]
  Name of the database connection (not the database name). Existing connections
  will be shown in the combobox.

``Schema (schema name)`` [string]
  Optional. Existing schemas will be listed in the combobox.

  An existing schema of the selected database can be chosen.

  Default: *public*

``Table to import to (leave blank to use layer name)`` [string]
  Optional.

  Defines a table name for the imported vector file.
  If nothing is added, the layer name will be used.

``Primary key field`` [tablefield: any]
  Optional. A column with **unique** values can be used as Primary key for the
  database.

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
  Specify whether to create a spatial index or not.

  Default: *True*

``Convert field names to lowercase`` [boolean]
  If activated this prevents the field names of the input vector layer from
  being converted to lowercase.

  Default: *True*

``Drop length constraints on character fields`` [boolean]
  Specify whether the length constraints on character fields should be dropped
  or not.

  Default: *False*

``Create single-part geometries instead of multi-part`` [boolean]
  Specify if the features of the loaded layer should be single-part instead of
  multi-part.
  By default the existing geometries information are preserved.

  Default: *False*


.. _qgis_postgis_execute_sql:

PostGIS execute SQL
-------------------

Allows a SQL database query to be performed on a PostGIS database connected to QGIS.
The algorithm **won't** create any new layer: it is designed to run queries on
the layer itself.

.. _qgis_postgis_execute_sql_example:

Example
.......
1. Set all the values of an existing field to a fixed value. The SQL query string
will be:

.. code-block:: sql

  UPDATE your_table SET field_to_update=20;

in the example above, the values of the field ``field_to_update`` of the table
``your_table`` will be all set to ``20``.

2. Create a new ``area`` column and calculate the area of each feature with the
``ST_AREA`` PostGIS function.

Run the first query and create the new column ``area`` on the table ``my_table``:

.. code-block:: sql

  ALTER TABLE my_table ADD COLUMN area double precision;

Run the second query and update the `area` column and calculate the area of each
feature:

.. code-block:: sql

  UPDATE my_table SET area=ST_AREA(geom);


Parameters
..........

``Database`` [string]
  Name of the database, not the connection name.
  By default you don't have to fill in the name, the current database
  connection will be chosen.

``SQL query`` [string]
  Defines the SQL query, for example ``UPDATE my_table SET field=10``.


Outputs
.......
No new outputs will be created. The layer chosen will be updated with the executed
SQL query. By opening the table (for example with Data Manager) you will see
the results.


.. _qgis_package_layers:

Package layers
--------------
Collects a number of existing layers and packages them together into a single
GeoPackage database.

Parameters
..........

``Input layers`` [multipleinput]
  All the vector layers to import into the GeoPackage database

``Overwrite existing GeoPackage`` [boolean]
  Replaces an existing database with a new one

  Default: *False*

Outputs
.......
``Destination GeoPackage``
  If not specified the GeoPackage database will be save in the temporary folder.


.. _qgis_import_into_spatialite:

Import into SpatiaLite
----------------------

Imports a vector layer currently loaded in QGIS into a SpatiaLite database.
Prior to this a connection between QGIS and the SpatiaLite database has to
be created (for example with the DB Manager).


Parameters
..........

``Layer to import`` [vector: any]
  One of the loaded layer in QGIS. If you want to import another layer you have
  to load it in QGIS before to import.

``File database`` [selection]
  Name of the database connection. The combobox will show all the databases of
  the layers loaded in QGIS. Moreover, it is possible to choose an external
  `sqlite` file.

``Table to import to (leave blank to use layer name)`` [string]
  Optional.

  Defines a table name for the imported vector file.
  If nothing is added, the layer name will be used.

``Primary key field`` [tablefield: any]
  Optional.

  Sets the primary key field from an existing field in the vector layer.

``Geometry column`` [string]
  Defines the name of the geometry column in the new SpatiaLite table.
  Geometry information for the features is stored in this column.

  Default: *geom*

``Encoding`` [string]
  Optional.

  Defines the encoding of the layer in the new SpatiaLite table.

  Default: *UTF-8*

``Overwrite`` [boolean]
  Overwrites existing tables having the same name.

  Default: *True*

``Create spatial index`` [boolean]
  Specify whether to create a spatial index or not.

  Default: *True*

``Convert field names to lowercase`` [boolean]
  If activated this prevents the field names of the input vector layer from
  being converted to lowercase.

  Default: *True*

``Drop length constraints on character fields`` [boolean]
  Specify whether the length constraints on character fields should be dropped
  or not.

  Default: *False*

``Create single-part geometries instead of multi-part`` [boolean]
  Specify if the features of the loaded layer should be single-part instead of
  multi-part.
  By default the existing geometries information are preserved.

  Default: *False*


.. _qgis_spatialite_execute_sql:

SpatiaLite execute SQL
----------------------

Allows a SQL database query to be performed on a SpatiaLite database connected to QGIS.
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

See also
........
For some SQL query examples see :ref:`PostGIS SQL Query Examples <qgis_postgis_execute_sql_example>`.
