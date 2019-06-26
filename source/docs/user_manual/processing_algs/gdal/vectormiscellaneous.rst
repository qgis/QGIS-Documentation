.. only:: html

   |updatedisclaimer|

Vector miscellaneous
====================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalexecutesql:

Execute SQL
-----------

This algorithm is derived from the `GDAL ogr2ogr utility <https://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

``Input layer`` [vector: any]
  OGR-supported vector layer.

``SQL expression`` [string]
  Defines the SQL query, for example ``SELECT * FROM my_table WHERE name is not null``.

  Default: *(not set)*

``SQL dialect`` [enumeration]
  SQL dialect used.

  Options:

  * 0 --- None
  * 1 --- OGR SQL
  * 2 --- SQLite

  Default: *0*

``Additional creation options`` [string]
  Optional

  <put parameter description here>

Outputs
.......

``SQL result`` [vector: any]
  Vector layer created by the query.

.. _importvectorintopostgisdatabaseavailableconnection:

Export to PostgreSQL (available connections)
--------------------------------------------
Imports vector layers inside a PostgreSQL database on the basis of
an available connection. The connection has to :ref:`be defined properly
<vector_create_stored_connection>` beforehand. Be aware that the checkboxes 'Save Username'
and 'Save Password' are activated. Then you can use the algorithm.

This algorithm is derived from the `GDAL ogr2ogr utility <https://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

``Database (connection name)`` [string]
  Requires the database (connection) name.

  Options:

  * 0 --- local

  Default: *0*

``Input layer`` [vector: any]
  OGR-supported vector layer to export to the database.

``Shape encoding`` [string]
  Optional

  Sets the encoding to apply to the data.

``Output geometry type`` [enumeration]
  Defines the output geometry type.

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

  Default: *0*

``Assign an output CRS`` [crs]
  Defines the output CRS of the database table.

``Reproject to this CRS on output`` [crs]
  Optional

  Reprojects/transforms to this CRS on output.

``Override source CRS`` [crs]
  Optional

  Overrides the input layer CRS.

``Schema (schema name)`` [string]
  Optional

  Defines the schema to which the database table will be assigned to.
  By default, 'public' is chosen.

  Default: *public*

``Table to export to (leave blank to use layer name)`` [string]
  Optional

  Defines a name for the table that will be imported into the database.
  By default the table name is the name of the input vector file.

``Primary Key (new field)`` [string]
  Optional

  Defines which attribute field will be the primary key of the database table.

  Default: *id*

``Primary Key (existing field, used if the above option is left empty)`` [tablefield: any]
  Optional

  Defines which attribute field in the exported layer will be the primary key of the database table.

``Geometry column name`` [string]
  Optional

  Defines in which attribute field of the database there will be the geometry
  information.

  Default: *geom*

``Vector dimensions`` [enumeration]
  Defines if the vector file to be imported has 2D or 3D data.

  Options:

  * 0 --- 2
  * 1 --- 3

  Default: *0*

``Distance tolerance for simplification`` [string]
  Optional

  Defines a distance tolerance for the simplification of the vector geometries
  to be imported. By default no simplification there is no simplification.

``Maximum distance between 2 nodes (densification)`` [string]
  Optional

  The maximum distance between two nodes. Used to create intermediate points.
  By default there is no maximum distance.

``Select features by extent (defined in input layer CRS)`` [extent]
  You can select features from a given extent that will be in the output table.

``Clip the input layer using the above (rectangle) extent`` [boolean]
  The input layer will be clipped by the extent you defined before.

  Default: *False*

``Select features using a SQL "WHERE" statement (Ex: column="value")`` [string]
  Optional

  Defines with a SQL "WHERE" statement which features should be selected for the
  output table.

``Group N features per transaction (Default: 20000)`` [string]
  Optional

  You can group the input features in transactions where N defines the size.
  By default N limits the transaction size to 20000 features.

  Default: *(not set)*

``Overwrite existing table`` [boolean]
  If there is a table with the same name in the database, it won't
  be overwritten. By default this takes place.

  Default: *True*

``Append to existing table`` [boolean]
  If activated the vector data will be appended to an existing table,
  there won't be created a new table. New fields found in the input layer
  are ignored. By default a new table will be created.

  Default: *False*

``Append and add new fields to existing table`` [boolean]
  If activated the vector data will be appended to an existing table,
  there won't be created a new table. New fields found in input layer
  are added to the table. By default a new table will be created.

  Default: *False*

``Do not launder columns/table names`` [boolean]
  With this option you can prevent processing from converting column
  names to lowercase, from removing spaces and other invalid characters.

  Default: *False*

``Do not create Spatial Index`` [boolean]
  Prevents that a spatial index in the output table will be created.

  Default: *False*

``Continue after a failure, skipping the failed feature`` [boolean]
  <put parameter description here>

  Default: *False*

``Promote to Multipart`` [boolean]
  Casts features geometry type to multipart in the output table.

  Default: *True*

``keep width and precision of input attributes`` [boolean]
  Avoids to modify fields attributes to comply with input data.

  Default: *True*

``Additional creation options`` [string]
  Optional

  <put parameter description here>


.. _importvectorintopostgisdatabasenewconnection:

Export to PostgreSQL (new connection)
-------------------------------------
Imports vector layers inside a PostgreSQL database. A new connection
to the PostgreSQL database must be created.

This algorithm is derived from the `GDAL ogr2ogr utility <https://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

``Input layer`` [vector: any]
  OGR-supported vector layer to export to the database.

``Shape encoding`` [string]
  Optional

  Sets the encoding to apply to the data.

``Output geometry type`` [enumeration]
  Defines the output geometry type.

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

  Default: *0*

``Assign an output CRS`` [crs]
  Optional

  Defines the output CRS of the database table.

``Reproject to this CRS on output`` [crs]
  Optional

  Reprojects/transforms to this CRS on output.

``Override source CRS`` [crs]
  Optional

  Overrides the input layer CRS.

``Host`` [string]
  Optional

  Name of the database host.

  Default: *localhost*

``Port`` [string]
  Optional

  Port number the PostgreSQL database server listens on.

  Default: *5432*

``Username`` [string]
  Optional

  User name used to log in to the database.

``Database Name`` [string]
  Optional

  Name of the database.

``Password`` [string]
  Optional

  Password used with Username to connect to the database.

``Schema name`` [string]
  Optional

  Defines the schema to which the database table will be assigned to.
  By default, 'public' is chosen.

  Default: *public*

``Table to export to (leave blank to use layer name)`` [string]
  Optional

  Defines a name for the table that will be imported into the database.
  By default the table name is the name of the input vector file.

``Primary Key (new field)`` [string]
  Optional

  Defines which attribute field will be the primary key of the database table.

  Default: *id*

``Primary Key (existing field, used if the above option is left empty)`` [tablefield: any]
  Optional

  Defines which attribute field in the exported layer will be the primary key of the database table.

``Geometry column name`` [string]
  Optional

  Defines in which attribute field to store the geometry information.

  Default: *geom*

``Vector dimensions`` [enumeration]
  Defines if the vector file to be imported has 2D or 3D data.

  Options:

  * 0 --- 2
  * 1 --- 3

  Default: *0*

``Distance tolerance for simplification`` [string]
  Optional

  Defines a distance tolerance for the simplification of the vector geometries
  to be imported. By default no simplification there is no simplification.

``Maximum distance between 2 nodes (densification)`` [string]
  Optional

  The maximum distance between two nodes. Used to create intermediate points.
  By default there is no maximum distance.

``Select features by extent (defined in input layer CRS)`` [extent]
  You can select features from a given extent that will be in the output table.

  Default: *minimum covering extent*

``Clip the input layer using the above (rectangle) extent`` [boolean]
  The input layer will be clipped by the extent you defined before.

  Default: *False*

``Fields to include (leave empty to use all fields)`` [list]
  Optional

  Defines fields to keep from the imported vector file.
  If none is selected, all the fields are imported.

``Select features using a SQL "WHERE" statement (Ex: column="value")`` [string]
  Optional

  Defines with a SQL "WHERE" statement which features should be selected for the
  output table.

``Group N features per transaction (Default: 20000)`` [string]
  Optional

  You can group the input features in transactions where N defines the size.
  By default N limits the transaction size to 20000 features.

  Default: *(not set)*

``Overwrite existing table`` [boolean]
  If there is a table with the same name in the database, it won't
  be overwritten. By default this takes place.

  Default: *True*

``Append to existing table`` [boolean]
  If activated the vector data will be appended to an existing table,
  there won't be created a new table. New fields found in the input layer
  are ignored. By default a new table will be created.

  Default: *False*

``Append and add new fields to existing table`` [boolean]
  If activated the vector data will be appended to an existing table,
  there won't be created a new table. New fields found in input layer
  are added to the table. By default a new table will be created.

  Default: *False*

``Do not launder columns/table names`` [boolean]
  With this option you can prevent processing from converting column
  names to lowercase, from removing spaces and other invalid characters.

  Default: *False*

``Do not create Spatial Index`` [boolean]
  Prevents that a spatial index in the output table will be created.

  Default: *False*

``Continue after a failure, skipping the failed feature`` [boolean]
  <put parameter description here>

  Default: *False*

``Promote to Multipart`` [boolean]
  Casts features geometry type to multipart in the output table.

  Default: *True*

``keep width and precision of input attributes`` [boolean]
  Avoids to modify fields attributes to comply with input data.

  Default: *True*

``Additional creation options`` [string]
  Optional

  <put parameter description here>


.. _gdalogrinfo:

Information
-----------
Creates an information file that lists information about an OGR-supported
data source. The output will be shown in a 'Result' window and can be written
into a HTML-file.
The information includes the geometry type, feature count, the spatial extent,
the projection information and many more.

This algorithm is derived from the `GDAL ogrinfo utility <https://www.gdal.org/ogrinfo.html>`_ .

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

Outputs
.......

``Layer information`` [html]
  Name of the output HTML-file that includes the file information.
  If no HTML-file is defined the output will be written into a temporary file.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
