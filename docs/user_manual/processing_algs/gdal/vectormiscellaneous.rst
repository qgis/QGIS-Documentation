Vector miscellaneous
====================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalbuildvirtualvector:

Build virtual vector
--------------------
Creates a virtual vector layer that contains a set of vector layers.
The output virtual vector layer will not be opened in the current
project.

This algorithm is especially useful in case another algorithm needs
multiple layers but accept only one ``vrt`` in which the layers are
specified.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input datasources**
     - ``INPUT``
     - [vector: any] [list]
     - Select the vector layers you want to use to build
       the virtual vector
   * - **Create "unioned" VRT**
     - ``UNIONED``
     - [boolean]
       
       Default: False
     - Check if you want to unite all the vectors in a
       single ``vrt`` file
   * - **Virtual vector**
     - ``OUTPUT``
     - [same as input]

       Default: ``[Save to temporary file]``
     - Specify the output layer containing only the duplicates.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**


Outputs
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Virtual vector**
     - ``OUTPUT``
     - [vector: any]
     - The output virtual vector made from the chosen sources

Python code
...........

**Algorithm ID**: ``gdal:buildvirtualvector``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalexecutesql:

Execute SQL
-----------

Runs a simple or complex query with SQL syntax on the source layer.
The result of the query will be added as a new layer.

This algorithm is derived from the
`GDAL ogr2ogr utility <https://gdal.org/programs/ogr2ogr.html>`_.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - OGR-supported input vector layer
   * - **SQL expression**
     - ``SQL``
     - [string]
     - Defines the SQL query, for example
       ``SELECT * FROM my_table WHERE name is not null``.
   * - **SQL dialect**
     - ``DIALECT``
     - [enumeration]

       Default: 0
     - SQL dialect to use. One of:

       * 0 --- None
       * 1 --- OGR SQL
       * 2 --- SQLite
   * - **SQL result**
     - ``OUTPUT``
     - [vector: any]
     - Specification of the output layer.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

       For ``Save to File``, the output format has to be specified.
       All GDAL vector formats are supported.
       For ``Save to a Temporary File`` the default output vector
       layer format will be used.

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: '' (no additional options)
     - Additional GDAL creation options.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **SQL result**
     - ``OUTPUT``
     - [vector: any]
     - Vector layer created by the query

Python code
...........

**Algorithm ID**: ``gdal:executesql``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalimportvectorintopostgisdatabaseavailableconnections:

Export to PostgreSQL (available connections)
--------------------------------------------
Imports vector layers inside a PostgreSQL database on the basis of
an available connection.
The connection has to
:ref:`be defined properly <vector_create_stored_connection>`
beforehand.
Be aware that the checkboxes 'Save Username' and 'Save Password' are
activated.
Then you can use the algorithm.

This algorithm is derived from the
`GDAL ogr2ogr utility <https://gdal.org/programs/ogr2ogr.html>`_.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Database (connection name)**
     - ``DATABASE``
     - [string]
     - The PostgreSQL database to connect to
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - OGR-supported vector layer to export to the database
   * - **Shape encoding**

       Optional
     - ``SHAPE_ENCODING``
     - [string]

       Default: ''
     - Sets the encoding to apply to the data
   * - **Output geometry type**
     - ``GTYPE``
     - [enumeration]

       Default: 0
     - Defines the output geometry type. One of:

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

   * - **Assign an output CRS**

       Optional
     - ``A_SRS``
     - [crs]

       Default: None
     - Defines the output CRS of the database table
   * - **Reproject to this CRS on output**

       Optional
     - ``T_SRS``
     - [crs]

       Default: None
     - Reprojects/transforms to this CRS on output
   * - **Override source CRS**

       Optional
     - ``S_SRS``
     - [crs]

       Default: None
     - Overrides the input layer CRS
   * - **Schema (schema name)**

       Optional
     - ``SCHEMA``
     - [string]

       Default: 'public'
     - Defines the schema for the database table
   * - **Table to export to (leave blank to use layer name)**

       Optional
     - ``TABLE``
     - [string]

       Default: ''
     - Defines a name for the table that will be imported into the
       database.
       By default the table name is the name of the input vector
       file.
   * - **Primary Key (new field)**

       Optional
     - ``PK``
     - [string]

       Default: 'id'
     - Defines which attribute field will be the primary key of the
       database table
   * - **Primary Key (existing field, used if the above option is
       left empty)**

       Optional
     - ``PRIMARY_KEY``
     - [tablefield: any]

       Default: None
     - Defines which attribute field in the exported layer will be
       the primary key of the database table
   * - **Geometry column name**

       Optional
     - ``GEOCOLUMN``
     - [string]

       Default: 'geom'
     - Defines in which attribute field of the database there will be
       the geometry information
   * - **Vector dimensions**

       Optional
     - ``DIM``
     - [enumeration]

       Default: 0 (2D)
     - Defines if the vector file to be imported has 2D or 3D data.
       One of:

       * 0 --- 2
       * 1 --- 3

   * - **Distance tolerance for simplification**

       Optional
     - ``SIMPLIFY``
     - [string]

       Default: ''
     - Defines a distance tolerance for the simplification of the
       vector geometries to be imported.
       By default there is no simplification.
   * - **Maximum distance between 2 nodes (densification)**

       Optional
     - ``SEGMENTIZE``
     - [string]

       Default: ''
     - The maximum distance between two nodes.
       Used to create intermediate points.
       By default there is no densification.
   * - **Select features by extent (defined in input layer CRS)**

       Optional
     - ``SPAT``
     - [extent]

       Default: None
     - You can select features from a given extent that will be in
       the output table.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Clip the input layer using the above (rectangle) extent**

       Optional
     - ``CLIP``
     - [boolean]

       Default: False
     - The input layer will be clipped by the extent you defined
       before
   * - **Select features using a SQL "WHERE" statement (Ex: column="value")**

       Optional
     - ``WHERE``
     - [string]

       Default: ''
     - Defines with a SQL "WHERE" statement which features should be
       selected from the input layer
   * - **Group N features per transaction (Default: 2000)**

       Optional
     - ``GT``
     - [string]

       Default: ''
     - You can group the input features in transactions where N
       defines the size.
       By default N limits the transaction size to 20000 features.
   * - **Overwrite existing table**

       Optional
     - ``OVERWRITE``
     - [boolean]

       Default: True
     - If there is a table with the same name in the database,
       and if this option is set to True, the table will be
       overwritten.
   * - **Append to existing table**

       Optional
     - ``APPEND``
     - [boolean]

       Default: False
     - If checked / True the vector data will be appended to an
       existing table.
       New fields found in the input layer are ignored.
       By default a new table will be created.
   * - **Append and add new fields to existing table**

       Optional
     - ``ADDFIELDS``
     - [boolean]

       Default: False
     - If activated the vector data will be appended to an
       existing table, there won't be a new table created.
       New fields found in input layer are added to the
       table.
       By default a new table will be created.
   * - **Do not launder columns/table names**

       Optional
     - ``LAUNDER``
     - [boolean]

       Default: False
     - With this option checked you can prevent the default
       behaviour (converting column names to lowercase,
       removing spaces and other invalid characters).
   * - **Do not create Spatial Index**

       Optional
     - ``INDEX``
     - [boolean]

       Default: False
     - Prevents a spatial index for the output table from being
       created.
       By default, a spatial index is added.
   * - **Continue after a failure, skipping the failed feature**

       Optional
     - ``SKIPFAILURES``
     - [boolean]

       Default: False
     - 
   * - **Promote to Multipart**

       Optional
     - ``PROMOTETOMULTI``
     - [boolean]

       Default: True
     - Casts features geometry type to multipart in the output table
   * - **Keep width and precision of input attributes**

       Optional
     - ``PRECISION``
     - [boolean]

       Default: True
     - Avoids modifying column attributes to comply with input data
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: '' (no additional options)
     - Additional GDAL creation options.

Outputs
.......

This algorithm has no output.

Python code
...........

**Algorithm ID**: ``gdal:importvectorintopostgisdatabaseavailableconnections``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalimportvectorintopostgisdatabasenewconnection:

Export to PostgreSQL (new connection)
-------------------------------------
Imports vector layers inside a PostgreSQL database. A new connection
to the PostGIS database must be created.

This algorithm is derived from the
`GDAL ogr2ogr utility <https://gdal.org/programs/ogr2ogr.html>`_.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - OGR-supported vector layer to export to the database
   * - **Shape encoding**

       Optional
     - ``SHAPE_ENCODING``
     - [string]

       Default: ''
     - Sets the encoding to apply to the data
   * - **Output geometry type**
     - ``GTYPE``
     - [enumeration]

       Default: 0
     - Defines the output geometry type. One of:

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

   * - **Assign an output CRS**

       Optional
     - ``A_SRS``
     - [crs]

       Default: None
     - Defines the output CRS of the database table
   * - **Reproject to this CRS on output**

       Optional
     - ``T_SRS``
     - [crs]

       Default: None
     - Reprojects/transforms to this CRS on output
   * - **Override source CRS**

       Optional
     - ``S_SRS``
     - [crs]

       Default: None
     - Overrides the input layer CRS
   * - **Host**

       Optional
     - ``HOST``
     - [string]

       Default: 'localhost'
     - Name of the database host
   * - **Port**

       Optional
     - ``PORT``
     - [string]

       Default: '5432'
     - Port number the PostgreSQL database server listens on
   * - **Username**

       Optional
     - ``USER``
     - [string]

       Default: ''
     - User name used to log in to the database
   * - **Database name**

       Optional
     - ``DBNAME``
     - [string]

       Default: ''
     - Name of the database
   * - **Password**

       Optional
     - ``PASSWORD``
     - [string]

       Default: ''
     - Password used with Username to connect to the database
   * - **Schema (schema name)**

       Optional
     - ``SCHEMA``
     - [string]

       Default: 'public'
     - Defines the schema for the database table
   * - **Table name, leave blank to use input name**

       Optional
     - ``TABLE``
     - [string]

       Default: ''
     - Defines a name for the table that will be imported into the
       database.
       By default the table name is the name of the input vector
       file.
   * - **Primary Key (new field)**

       Optional
     - ``PK``
     - [string]

       Default: 'id'
     - Defines which attribute field will be the primary key of the
       database table
   * - **Primary Key (existing field, used if the above option is left empty)**

       Optional
     - ``PRIMARY_KEY``
     - [tablefield: any]

       Default: None
     - Defines which attribute field in the exported layer will be
       the primary key of the database table
   * - **Geometry column name**

       Optional
     - ``GEOCOLUMN``
     - [string]

       Default: 'geom'
     - Defines in which attribute field to store the geometry
       information
   * - **Vector dimensions**

       Optional
     - ``DIM``
     - [enumeration]

       Default: 0 (2D)
     - Defines if the vector file to be imported has 2D or 3D data.
       One of:

       * 0 --- 2D
       * 1 --- 3D

   * - **Distance tolerance for simplification**

       Optional
     - ``SIMPLIFY``
     - [string]

       Default: ''
     - Defines a distance tolerance for the simplification of the
       vector geometries to be imported.
       By default there is no simplification.
   * - **Maximum distance between 2 nodes (densification)**

       Optional
     - ``SEGMENTIZE``
     - [string]

       Default: ''
     - The maximum distance between two nodes.
       Used to create intermediate points.
       By default there is no densification.
   * - **Select features by extent (defined in input layer CRS)**

       Optional
     - ``SPAT``
     - [extent]

       Default: None
     - You can select features from a given extent that will be in
       the output table.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Clip the input layer using the above (rectangle) extent**

       Optional
     - ``CLIP``
     - [boolean]

       Default: False
     - The input layer will be clipped by the extent you defined
       before
   * - **Fields to include (leave empty to use all fields)**

       Optional
     - ``FIELDS``
     - [string] [list]

       Default: []
     - Defines fields to keep from the imported vector file.
       If none is selected, all the fields are imported.
   * - **Select features using a SQL "WHERE" statement (Ex: column="value")**

       Optional
     - ``WHERE``
     - [string]

       Default: ''
     - Defines with a SQL "WHERE" statement which features should be
       selected for the output table
   * - **Group N features per transaction (Default: 2000)**

       Optional
     - ``GT``
     - [string]

       Default: ''
     - You can group the input features in transactions where N
       defines the size.
       By default N limits the transaction size to 20000 features.
   * - **Overwrite existing table**

       Optional
     - ``OVERWRITE``
     - [boolean]

       Default: True
     - If there is a table with the same name in the database,
       and if this option is set to True, the table will be
       overwritten.
   * - **Append to existing table**

       Optional
     - ``APPEND``
     - [boolean]

       Default: False
     - If checked / True the vector data will be appended to an
       existing table.
       New fields found in the input layer are ignored.
       By default a new table will be created.
   * - **Append and add new fields to existing table**

       Optional
     - ``ADDFIELDS``
     - [boolean]

       Default: False
     - If activated the vector data will be appended to an
       existing table, there won't be created a new table.
       New fields found in input layer are added to the
       table.
       By default a new table will be created.
   * - **Do not launder columns/table names**

       Optional
     - ``LAUNDER``
     - [boolean]

       Default: False
     - With this option checked you can prevent the default
       behaviour (converting column names to lowercase,
       removing spaces and other invalid characters).
   * - **Do not create Spatial Index**

       Optional
     - ``INDEX``
     - [boolean]

       Default: False
     - Prevents a spatial index for the output table from being
       created.
       By default, a spatial index is added.
   * - **Continue after a failure, skipping the failed feature**

       Optional
     - ``SKIPFAILURES``
     - [boolean]

       Default: False
     - 
   * - **Promote to Multipart**

       Optional
     - ``PROMOTETOMULTI``
     - [boolean]

       Default: True
     - Casts features geometry type to multipart in the output table
   * - **Keep width and precision of input attributes**

       Optional
     - ``PRECISION``
     - [boolean]

       Default: True
     - Avoids modifying column attributes to comply with input data
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: '' (no additional options)
     - Additional GDAL creation options.

Outputs
.......

This algorithm has no output.

Python code
...........

**Algorithm ID**: ``gdal:importvectorintopostgisdatabasenewconnection``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalogrinfo:

Vector Information
------------------
Creates an information file that lists information about an
OGR-supported data source.
The output will be shown in a 'Result' window and can be written
into a HTML-file.
The information includes the geometry type, feature count, the spatial
extent, the projection information and many more.

This algorithm is derived from the
`GDAL ogrinfo utility <https://gdal.org/programs/ogrinfo.html>`_.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Summary output only**

       Optional
     - ``SUMMARY_ONLY``
     - [boolean]

       Default: True
     - 
   * - **Suppress metadata info**

       Optional
     - ``NO_METADATA``
     - [boolean]

       Default: False
     - 
   * - **Layer information**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the output HTML file that includes the file
       information. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

       If no HTML-file is defined the output will be written
       to a temporary file


Outputs
.......
.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description

   * - **Layer information**
     - ``OUTPUT``
     - [html]
     - The output HTML-file that includes the file information.

Python code
...........

**Algorithm ID**: ``gdal:ogrinfo``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
