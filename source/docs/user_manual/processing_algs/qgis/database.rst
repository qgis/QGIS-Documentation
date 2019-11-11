Database
========

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgisimportintopostgis:

Export to PostgreSQL
--------------------
Exports a vector layer to a PostgreSQL database.
Prior to this a connection between QGIS and the PostgreSQL database has to
be created (see eg :ref:`vector_create_stored_connection`).

Parameters
..........

``Layer to import`` [vector: any]
  Vector layer to add to the database.

``Database (connection name)`` [string]
  Name of the database connection (not the database name). Existing connections
  will be shown in the combobox.

``Schema (schema name)`` [string]
  Optional

  Name of the schema to store the data. It can be a new one or already exist.

  Default: *public*

``Table to import to (leave blank to use layer name)`` [string]
  Optional

  Defines a table name for the imported vector file.
  If nothing is added, the layer name will be used.

``Primary key field`` [tablefield: any]
  Optional

  Sets the primary key field from an existing field in the vector layer.
  A column with **unique** values can be used as Primary key for the database.

``Geometry column`` [string]
  Defines the name of the geometry column in the new PostGIS table.
  Geometry information for the features is stored in this column.

  Default: *geom*

``Encoding`` [string]
  Optional

  Defines the encoding of the layer in the new PostGIS table.

  Default: *UTF-8*

``Overwrite`` [boolean]
  Overwrites existing tables having the same name.

  Default: *True*

``Create spatial index`` [boolean]
  Specifies whether to create a spatial index or not.

  Default: *True*

``Convert field names to lowercase`` [boolean]
  Converts the field names of the input vector layer to lowercase.

  Default: *True*

``Drop length constraints on character fields`` [boolean]
  Specifies whether the length constraints on character fields should be dropped
  or not.

  Default: *False*

``Create single-part geometries instead of multi-part`` [boolean]
  Specifies if the features of the loaded layer should be single-part instead of
  multi-part.
  By default the existing geometries information are preserved.

  Default: *False*


.. _qgisimportintospatialite:

Export to SpatiaLite
--------------------
Exports a vector layer to a SpatiaLite database.
Prior to this a connection between QGIS and the SpatiaLite database has to
be created (see eg :ref:`label_spatialite`).


Parameters
..........

``Layer to import`` [vector: any]
  Vector layer to add to the database.

``File database`` [vector]
  The SQLite/SpatiaLite database file to connect to.

``Table to import to (leave blank to use layer name)`` [string]
  Optional

  Defines a table name for the imported vector file.
  If nothing is added, the layer name will be used.

``Primary key field`` [tablefield: any]
  Optional

  Sets the primary key field from an existing field in the vector layer.

``Geometry column`` [string]
  Defines the name of the geometry column in the new SpatiaLite table.
  Geometry information for the features is stored in this column.

  Default: *geom*

``Encoding`` [string]
  Optional

  Defines the encoding of the layer in the new SpatiaLite table.

  Default: *UTF-8*

``Overwrite`` [boolean]
  Overwrites existing table having the same name.

  Default: *True*

``Create spatial index`` [boolean]
  Specifies whether to create a spatial index or not.

  Default: *True*

``Convert field names to lowercase`` [boolean]
  Converts the field names of the input vector layer to lowercase.

  Default: *True*

``Drop length constraints on character fields`` [boolean]
  Specifies whether the length constraints on character fields should be dropped
  or not.

  Default: *False*

``Create single-part geometries instead of multi-part`` [boolean]
  Specifies if the features of the loaded layer should be single-part instead of
  multi-part.
  By default the existing geometries information are preserved.

  Default: *False*


.. _qgispackage:

Package layers |38|
-------------------
Adds layers to a GeoPackage.

If the GeoPackage exists and ``Overwrite existing GeoPackage``
is checked, it will be overwritten (removed and recreated).
If the GeoPackage exists and ``Overwrite existing GeoPackage``
is not checked, the layers will be appended to the GeoPackage.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Name
     - Identifier
     - Type
     - Description
   * - **Input layers**
     - LAYERS
     - [vector: any] [list]
     - The (vector) layers to import into the GeoPackage.
       If a raster layer is specified, a ``QgsProcessingException``
       will be thrown.
   * - **Overwrite existing GeoPackage**
     - OVERWRITE
     - [boolean]
     
       Default: False
     - If the specified GeoPackage, checking this option
       will remove it and create a new one.
   * - **Save layer styles into GeoPackage**
     - SAVE_STYLES
     - [boolean]
     
       Default: True
     - Save the layer styles
   * - **Destination GeoPackage**
     - OUTPUT
     - [geopackage file]
     - If not specified the GeoPackage will be saved in
       the temporary folder.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Name
     - Identifier
     - Type
     - Description

   * - **Layers within new package**
     - OUTPUT_LAYERS
     - [string] [list]
     - The list of layers added to the GeoPackage.


.. _qgispostgisexecuteandloadsql:

PostgreSQL execute and load SQL
-------------------------------

Allows a SQL database query to be performed on a PostgreSQL database connected to QGIS
and loads the result. The algorithm **won't** create any new layer: it is designed to
run queries on the layer itself.

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

Run the second query and update the ``area`` column and calculate the area of each
feature:

.. code-block:: sql

  UPDATE my_table SET area=ST_AREA(geom);

Parameters
..........

``Database (connection name)`` [string]
  Name of the database connection (not the database name). Existing connections
  will be shown in the combobox.

``SQL query`` [string]
  Defines the SQL query, for example ``UPDATE my_table SET field=10``.

``Unique ID field name`` [tablefield: any]
  Sets the primary key field from an existing field in the table.

  Default: *id*

``Geometry column`` [string]
  Optional

  Name of the geometry column in the table.

  Default: *geom*

Outputs
.......
No new layer is created. The SQL query is executed in place on the layer and
its result (as a subset of the input table) is automatically loaded in QGIS.


.. _qgispostgisexecutesql:

PostgreSQL execute SQL
----------------------

Allows a SQL database query to be performed on a PostgreSQL database connected to QGIS.
The algorithm **won't** create any new layer: it is designed to run queries on
the layer itself.

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
No new layer is created. The SQL query is executed in place on the layer.

See also
........
For some SQL query examples see :ref:`PostGIS SQL Query Examples <qgis_postgis_execute_sql_example>`.


.. _qgisspatialiteexecutesql:

SpatiaLite execute SQL
----------------------

Allows a SQL database query to be performed on a SpatiaLite database connected to QGIS.
The algorithm **won't** create any new layer: it is designed to run queries on
the layer itself.

Parameters
..........

``Database`` [vector]
  The SQLite/SpatiaLite database file to connect to.

  Default: *(not set)*

``SQL query`` [string]
  Defines the SQL query, for example ``UPDATE my_table SET field=10``.

  Default: *(not set)*

Outputs
.......
No new layer is created. The SQL query is executed in place on the layer.

See also
........
For some SQL query examples see :ref:`PostGIS SQL Query Examples <qgis_postgis_execute_sql_example>`.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |38| replace:: ``NEW in 3.8``
