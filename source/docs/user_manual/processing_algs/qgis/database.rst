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

Package layers
--------------
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
       Raster layers are not supported. If a raster layer is
       added, a
       :class:`QgsProcessingException <qgis.core.QgsProcessingException>`
       will be thrown.
   * - **Overwrite existing GeoPackage**
     - OVERWRITE
     - [boolean]
     
       Default: False
     - If the specified GeoPackage exists, setting this option to
       ``True`` will make sure that it is deleted and a new one
       will be created before the layers are added.
       If this option is ``False``, the layers will be appended.
   * - **Save layer styles into GeoPackage** |38|
     - SAVE_STYLES
     - [boolean]
     
       Default: True
     - Save the layer styles
   * - **Destination GeoPackage**
     - OUTPUT
     - [file]
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

.. include:: qgis_algs_include.rst
   :start-after: **postgisexecutesqlexample**
   :end-before: **end_postgisexecutesqlexample**

.. seealso:: :ref:`qgispostgisexecutesql`, :ref:`qgisexecutesql`,
 :ref:`qgisspatialiteexecutesql`

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

.. include:: qgis_algs_include.rst
   :start-after: **postgisexecutesqlexample**
   :end-before: **end_postgisexecutesqlexample**

.. seealso:: :ref:`qgispostgisexecuteandloadsql`, :ref:`qgisexecutesql`,
 :ref:`qgisspatialiteexecutesql`

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


.. _qgisspatialiteexecutesql:

SpatiaLite execute SQL
----------------------

Allows a SQL database query to be performed on a SpatiaLite database connected to QGIS.
The algorithm **won't** create any new layer: it is designed to run queries on
the layer itself.

.. seealso:: :ref:`qgispostgisexecutesql`, :ref:`qgisexecutesql`

 For some SQL query examples see :ref:`PostGIS SQL Query Examples
 <qgis_postgis_execute_sql_example>`.

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


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |38| replace:: ``NEW in 3.8``
