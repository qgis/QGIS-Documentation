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

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Layer to import**
     - ``INPUT``
     - [vector: any]
     - Vector layer to add to the database
   * - **Database (connection name)**
     - ``DATABASE``
     - [string]
     - Name of the database connection (not the database name).
       Existing connections will be shown in the combobox.
   * - **Schema (schema name)**
       
       Optional
     - ``SCHEMA``
     - [string]

       Default: 'public'
     - Name of the schema to store the data.
       It can be a new one or already exist.
   * - **Table to import to (leave blank to use layer name)**

       Optional
     - ``TABLENAME``
     - [string]

       Default: ''
     - Defines a table name for the imported vector file.
       If nothing is added, the layer name will be used.
   * - **Primary key field**

       Optional
     - ``PRIMARY_KEY``
     - [tablefield: any]
     - Sets the primary key field from an existing field
       in the vector layer.
       A column with **unique** values can be used as
       Primary key for the database.
   * - **Geometry column**
     - ``GEOMETRY_COLUMN``
     - [string]
       
       Default: 'geom'
     - Defines the name of the geometry column in the
       new PostGIS table.
       Geometry information for the features is stored
       in this column.
   * - **Encoding**

       Optional
     - ``ENCODING``
     - [string]
       
       Default: 'UTF-8'
     - Defines the encoding of the output layer
   * - **Overwrite**
     - ``OVERWRITE``
     - [boolean]
       
       Default: True
     - If the specified table exists, setting this option to
       ``True`` will make sure that it is deleted and a new
       table will be created before the features are added.
       If this option is ``False``, the features will be
       appended to the table.
   * - **Create spatial index**
     - ``CREATEINDEX``
     - [boolean]
       
       Default: True
     - Specifies whether to create a spatial index or not
   * - **Convert field names to lowercase**
     - ``LOWERCASE_NAMES``
     - [boolean]
       
       Default: True
     - Converts the field names of the input vector layer
       to lowercase
   * - **Drop length constraint on character fields**
     - ``DROP_STRING_LENGTH``
     - [boolean]
       
       Default: False
     - Should length constraints on character fields be
       dropped or not
   * - **Create single-part geometries instead of multi-part**
     - ``FORCE_SINGLEPART``
     - [boolean]
       
       Default: False
     - Should the features of the output layer be
       single-part instead of multi-part.
       By default the existing geometries information
       are preserved.

Outputs
.......

The algorithm has no output.


.. _qgisimportintospatialite:

Export to SpatiaLite
--------------------
Exports a vector layer to a SpatiaLite database.
Prior to this a connection between QGIS and the SpatiaLite database has to
be created (see eg :ref:`label_spatialite`).


Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Layer to import**
     - ``INPUT``
     - [vector: any]
     - Vector layer to add to the database
   * - **File database**
     - ``DATABASE``
     - [vector: any]
     - The SQLite/SpatiaLite database file to connect to
   * - **Table to import to (leave blank to use layer name)**

       Optional
     - ``TABLENAME``
     - [string]

       Default: ''
     - Defines the table name for the imported vector file.
       If nothing is specified, the layer name will be used.
   * - **Primary key field**

       Optional
     - ``PRIMARY_KEY``
     - [tablefield: any]
     - Use a field in the input vector layer as the primary key
   * - **Geometry column**
     - ``GEOMETRY_COLUMN``
     - [string]
       
       Default: 'geom'
     - Defines the name of the geometry column in the new
       SpatiaLite table.
       Geometry information for the features is stored in this
       column.
   * - **Encoding**

       Optional
     - ``ENCODING``
     - [string]
       
       Default: 'UTF-8'
     - Defines the encoding of the output layer
   * - **Overwrite**
     - ``OVERWRITE``
     - [boolean]
       
       Default: True
     - If the specified database exists, setting this option to
       ``True`` will make sure that it is deleted and a new
       database will be created before the layers are added.
       If this option is ``False``, the layers will be
       appended.
   * - **Create spatial index**
     - ``CREATEINDEX``
     - [boolean]
       
       Default: True
     - Specifies whether to create a spatial index or not
   * - **Convert field names to lowercase**
     - ``LOWERCASE_NAMES``
     - [boolean]
       
       Default: True
     - Convert the field names of the input vector layer
       to lowercase
   * - **Drop length constraint on character fields**
     - ``DROP_STRING_LENGTH``
     - [boolean]
       
       Default: False
     - Should length constraints on character fields be
       dropped or not
   * - **Create single-part geometries instead of multi-part**
     - ``FORCE_SINGLEPART``
     - [boolean]
       
       Default: False
     - Should the features of the output layer be
       single-part instead of multi-part.
       By default the existing geometries information
       are preserved.

Outputs
.......

The algorithm has no output.


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

   * - Label
     - Name
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

   * - Label
     - Name
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

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description

   * - **Database (connection name)**
     - ``DATABASE``
     - [string]
     - The database connection (not the database name).
       Existing connections will be shown in the combobox.
   * - **SQL query**
     - ``SQL``
     - [string]
     - Defines the SQL query, for example
       ``'UPDATE my_table SET field=10'``.
   * - **Unique ID field name**
     - ``ID_FIELD``
     - [string]
       
       Default: id
     - Sets the primary key field (a column in the result table)
   * - **Geometry field name**

       Optional
     - ``GEOMETRY_FIELD``
     - [string]
       
       Default: 'geom'
     - Name of the geometry column (a column in the result table)

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description

   * - **SQL layer**
     - ``OUTPUT``
     - [vector: any]
     - The resulting vector layer to be loaded into QGIS.


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

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description

   * - **Database (connection name)**
     - ``DATABASE``
     - [string]
     - The database connection (not the database name).
       Existing connections will be shown in the combobox.
   * - **SQL query**
     - ``SQL``
     - [string]
     - Defines the SQL query, for example
       ``'UPDATE my_table SET field=10'``.

Outputs
.......

No output is created.
The SQL query is executed in place.


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

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description

   * - **File Database**
     - ``DATABASE``
     - [vector]
       
       Default: not set
     - The SQLite/SpatiaLite database file to connect to
   * - **SQL query**
     - ``SQL``
     - [string]
       
       Default: ''
     - Defines the SQL query, for example
       ``'UPDATE my_table SET field=10'``.

Outputs
.......

No output is created.
The SQL query is executed in place.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |38| replace:: ``NEW in 3.8``
