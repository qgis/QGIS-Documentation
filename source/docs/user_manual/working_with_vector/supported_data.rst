|updatedisclaimer|

.. _supported_format:

Supported Data Formats
======================

.. only:: html

   .. contents::
      :local:

QGIS uses the OGR library to read and write vector data formats,
including ESRI shapefiles, MapInfo and MicroStation file formats, AutoCAD DXF,
PostGIS, SpatiaLite, DB2, Oracle Spatial and MSSQL Spatial databases, and many more.
GRASS vector and PostgreSQL support is supplied by native QGIS data provider
plugins. Vector data can also be loaded in read mode from zip and gzip archives
into QGIS. As of the date of this document, 69 vector formats are supported by
the OGR library (see OGR-SOFTWARE-SUITE in :ref:`literature_and_web`). The
complete list is available at http://www.gdal.org/ogr/ogr_formats.html.

.. note::

   Not all of the listed formats may work in QGIS for various reasons. For
   example, some require external commercial libraries, or the GDAL/OGR
   installation of your OS may not have been built to support the format you
   want to use. Only those formats that have been well tested will appear in
   the list of file types when loading a vector into QGIS. Other untested
   formats can be loaded by selecting ``*.*``.

Working with GRASS vector data is described in Section :ref:`sec_grass`.

This section describes how to work with several common formats: ESRI
shapefiles, PostGIS layers, SpatiaLite layers, OpenStreetMap vectors, and Comma
Separated data (CSV). Many of the features available in QGIS work the same,
regardless of the vector data source. This is by design, and it includes the
identify, select, labelling and attributes functions.

.. note::

   QGIS supports (multi)point, (multi)line, (multi)polygon, CircularString,
   CompoundCurve, CurvePolygon, MultiCurve, MultiSurface feature types, all
   with Z and/or M values.

   You should note also that some drivers don't support some of these feature
   types like CircularString, CompoundCurve, CurvePolygon, MultiCurve,
   MultiSurface feature type. QGIS will convert them to (multi)polygon feature.

.. index:: MapInfo, vector file, load a shapefile, Shapefile
.. _vector_loading_file:

Loading a layer from a file
---------------------------

|addOgrLayer| To load a layer from a file (like a Shapefile, a Mapinfo or a dxf
layer), click on the |addOgrLayer| :sup:`Add Vector Layer` toolbar button; or
type :kbd:`Ctrl+Shift+V`. This will bring up a new window (see
figure_vector_1_).

.. _figure_vector_1:

.. only:: html

   **Figure Vector 1:**

.. figure:: /static/user_manual/working_with_vector/addvectorlayerdialog.png
   :align: center

   Add Vector Layer Dialog

From the available options check |radioButtonOn| :guilabel:`File`. Click on
**[Browse]**. That will bring up a standard open file dialog
(see figure_vector_2_), which allows you to navigate the file system and load a
shapefile or other supported data source. The selection box :guilabel:`Filter`
|selectString| allows you to preselect some OGR-supported file formats.

You can also select the encoding for the file if desired.

.. _figure_vector_2:

.. only:: html

   **Figure Vector 2:**

.. figure:: /static/user_manual/working_with_vector/shapefileopendialog.png
   :align: center

   Open an OGR Supported Vector Layer Dialog

Selecting a file from the list and clicking **[Open]** loads it into QGIS.
Figure_vector_3_ shows QGIS after loading the :file:`alaska.shp` file.

.. _figure_vector_3:

.. only:: html

   **Figure Vector 3:**

.. figure:: /static/user_manual/working_with_vector/shapefileloaded.png
   :align: center

   QGIS with Shapefile of Alaska loaded

.. tip:: **Layer Colors**

   When you add a layer to the map, it is assigned a random color. When adding
   more than one layer at a time, different colors are assigned to each layer.

Once a file is loaded, you can zoom around it using the map navigation tools.
To change the style of a layer, open the :guilabel:`Layer Properties` dialog
by double clicking on the layer name or by right-clicking on the name in the
legend and choosing :menuselection:`Properties` from the context menu. See
section :ref:`vector_style_menu` for more information on setting symbology of
vector layers.

.. _tip_load_from_external_drive_OSX:

.. tip:: **Load layer and project from mounted external drives on OS X**

   On OS X, portable drives that are mounted beside the primary hard drive
   do not show up as expected under :menuselection:`File --> Open Project`.
   We are working on a more OSX-native open/save dialog to fix this.
   As a workaround, you can type ``/Volumes`` in the :guilabel:`File name` box
   and press :kbd:`Enter`. Then you can navigate to external drives and network
   mounts.

.. note:: DXF files containing several geometry types (point, line and/or
   polygon), the name of the layer will be made from *<filename.dxf> entities
   <geometry type>*.

.. note:: You can also drag and drop the file(s) into the :guilabel:`Layers
   Panel` from either the files browser or the QGIS Browser panel. If the layer
   contains several geometry types, a new windows will ask you to select the
   sublayer. This often occurs with GPX, Mapinfo or DXF files format.

.. index:: ArcInfo Binary Coverage, Tiger Format, UK_National Transfer Format, US Census Bureau
.. _vector_loading_directory_based_layer:

Loading specific directory based layer
......................................

|addOgrLayer| To load some specific format like ArcInfo Binary Coverage, UK.
National Transfer Format, as well as the raw TIGER format of the US Census
Bureau or OpenfileGDB, click on the |addOgrLayer| :sup:`Add Vector Layer`
toolbar button or press :kbd:`Ctrl+Shift+V` to open the
:guilabel:`Add Vector Layer` dialog. Select |radioButtonOn|
:guilabel:`Directory` as :guilabel:`Source type`. Change the file type filter
:guilabel:`Files of type` |selectString| to the format you want to open, for
example 'Arc/Info Binary Coverage'. Navigate to the directory that contains the
coverage file or the file, and select it.

.. index:: ESRI, Shapefile, OGR
.. _vector_shapefiles:

ESRI Shapefiles
................

The ESRI shapefile is still one of the most used vector file format in QGIS.
However, this file format has some limitation that some other file format have
not (like Geopackage, spatialite). Support is provided by the
:index:`OGR Simple Feature Library` (http://www.gdal.org/ogr/).

A shapefile actually consists of several files. The following three are
required:

#. :file:`.shp` file containing the feature geometries
#. :file:`.dbf` file containing the attributes in dBase format
#. :file:`.shx` index file

Shapefiles also can include a file with a :file:`.prj` suffix, which contains
the projection information. While it is very useful to have a projection file,
it is not mandatory. A shapefile dataset can contain additional files. For
further details, see the ESRI technical specification at
http://www.esri.com/library/whitepapers/pdfs/shapefile.pdf.

**Improving Performance for Shapefiles**

To improve the performance of drawing a shapefile, you can create a spatial
index. A spatial index will improve the speed of both zooming and panning.
Spatial indexes used by QGIS have a :file:`.qix` extension.

Use these steps to create the index:

*  Load a shapefile by clicking on the |addOgrLayer| :sup:`Add Vector Layer`
   toolbar button or pressing :kbd:`Ctrl+Shift+V`.
*  Open the :guilabel:`Layer Properties` dialog by double-clicking on the
   shapefile name in the legend or by right-clicking and choosing
   :menuselection:`Properties` from the context menu.
*  In the :guilabel:`General` tab, click the **[Create Spatial Index]** button.

**Problem loading a shape .prj file**

If you load a shapefile with a :file:`.prj` file and QGIS is not able to read the
coordinate reference system from that file, you will need to define the proper
projection manually within the :guilabel:`General` tab of the
:guilabel:`Layer Properties` dialog of the layer by clicking the
**[Specify...]**  button. This is due to the fact that :file:`.prj` files
often do not provide the complete projection parameters as used in QGIS and
listed in the :guilabel:`CRS` dialog.

For the same reason, if you create a new shapefile with QGIS, two different
projection files are created: a :file:`.prj` file with limited projection
parameters, compatible with ESRI software, and a :file:`.qpj` file, providing
the complete parameters of the used CRS. Whenever QGIS finds a :file:`.qpj`
file, it will be used instead of the :file:`.prj`.

.. index:: CSV, Comma Separated Values
.. _vector_csv:

Delimited Text Files
--------------------

Tabular data is a very common and widely used format because of its simplicity
and readability -- data can be viewed and edited even in a plain text editor.
A delimited text file is an attribute table with each column separated by a
defined character and each row separated by a line break. The first row usually
contains the column names. A common type of delimited text file is a CSV
(Comma Separated Values), with each column separated by a comma.

Such data files can also contain positional information in two main forms:

* As point coordinates in separate columns
* As well-known text (WKT) representation of geometry

QGIS allows you to load a delimited text file as a layer or ordinal table. But
first check that the file meets the following requirements:

#. The file must have a delimited header row of field names. This must be the first line in the
   text file.
#. The header row must contain field(s) with geometry definition. These field(s)
   can have any name.
#. The X and Y coordinates (if geometry is defined by coordinates) must be
   specified as numbers. The coordinate system is not important.

As an example of a valid text file, we import the elevation point data file
:file:`elevp.csv` that comes with the QGIS sample dataset (see section
:ref:`label_sampledata`):

::

 X;Y;ELEV
 -300120;7689960;13
 -654360;7562040;52
 1640;7512840;3
 [...]

Some items to note about the text file:

#. The example text file uses ``;`` (semicolon) as delimiter. Any character can
   be used to delimit the fields.
#. The first row is the header row. It contains the fields ``X``, ``Y`` and
   ``ELEV``.
#. No quotes (``"``) are used to delimit text fields.
#. The X coordinates are contained in the ``X`` field.
#. The Y coordinates are contained in the ``Y`` field.

Others valuable informations for advanced users
...............................................

Features with curved geometries (CircularString, CurvePolygon and CompoundCurve) are
supported. Here are three examples of such geometry types as a delimited text
with WKT geometries::

  Label;WKT_geom
  CircularString;CIRCULARSTRING(268 415,227 505,227 406)
  CurvePolygon;CURVEPOLYGON(CIRCULARSTRING(1 3, 3 5, 4 7, 7 3, 1 3))
  CompoundCurve;COMPOUNDCURVE((5 3, 5 13), CIRCULARSTRING(5 13, 7 15,
    9 13), (9 13, 9 3), CIRCULARSTRING(9 3, 7 1, 5 3))

Delimited Text supports also Z and M coordinates in geometries::

   LINESTRINGM(10.0 20.0 30.0, 11.0 21.0 31.0)


.. _vector_loading_csv:

Loading a delimited text file
.............................

Click the toolbar icon |delimitedText| :sup:`Add Delimited Text Layer` in the
:guilabel:`Manage layers` toolbar to open the :guilabel:`Create a Layer from a
Delimited Text File` dialog, as shown in figure_delimited_text_1_.

.. _figure_delimited_text_1:

.. only:: html

   **Figure Delimited Text 1:**

.. figure:: /static/user_manual/introduction/delimited_text_dialog.png
   :align: center

   Delimited Text Dialog

First, select the file to import (e.g., :file:`qgis_sample_data/csv/elevp.csv`)
by clicking on the **[Browse]** button. Once the file is selected, QGIS
attempts to parse the file with the most recently used delimiter. To enable QGIS to properly parse the
file, it is important to select the correct delimiter. You can specify a
delimiter by activating |radioButtonOn| :guilabel:`Custom delimiters`, or by activating
|radioButtonOn| :guilabel:`Regular expression delimiter` and entering
text into the :guilabel:`Expression` field. For example, to
change the delimiter to tab, use ``\t`` (this is a regular expression for the
tab character).

Once the file is parsed, set :guilabel:`Geometry definition` to
|radioButtonOn|:guilabel:`Point coordinates` and choose the ``X`` and ``Y``
fields from the dropdown lists. If the coordinates are defined as
degrees/minutes/seconds, activate the |checkbox| :guilabel:`DMS coordinates`
checkbox.

Finally, enter a layer name (e.g., :file:`elevp`), as shown in
figure_delimited_text_1_. To add the layer to the map, click **[OK]**. The
delimited text file now behaves as any other map layer in QGIS.

There is also a helper option that allows you to trim leading and trailing
spaces from fields --- |checkbox| :guilabel:`Trim fields`. Also, it is possible
to |checkbox| :guilabel:`Discard empty fields`. If necessary, you can force a comma
to be the decimal separator by activating |checkbox| :guilabel:`Decimal separator is
comma`.

If spatial information is represented by WKT, activate the |radioButtonOn|
:guilabel:`Well Known Text` option and select the field with the WKT definition for
point, line or polygon objects. If the file contains non-spatial data, activate
|radioButtonOn| :guilabel:`No geometry (attribute only table)` and it will be
loaded as an ordinal table.

Additionally, you can enable:

* |checkbox| :guilabel:`Use spatial index` to improve the performance of displaying
  and spatially selecting features.
* |checkbox| :guilabel:`Use subset index`.
* |checkbox| :guilabel:`Watch file` to watch for changes to the file by other
  applications while QGIS is running.

.. index:: OSM, OpenStreetMap

.. _vector_osm:

OpenStreetMap data
------------------

In recent years, the OpenStreetMap project has gained popularity because in many
countries no free geodata such as digital road maps are available. The objective
of the OSM project is to create a free editable map of the world from GPS data,
aerial photography or local knowledge. To support this objective, QGIS
provides support for OSM data.

.. _open_street_map:

Loading OpenStreetMap Vectors
.............................

QGIS integrates OpenStreetMap import as a core functionality.

* To connect to the OSM server and download data, open the menu
  :menuselection:`Vector --> Openstreetmap --> Load data`. You can skip this
  step if you already obtained an :file:`.osm` XML file using JOSM, Overpass API or
  any other source.
* The menu :menuselection:`Vector --> Openstreetmap --> Import topology from
  an XML file` will convert your :file:`.osm` file into a SpatiaLite database
  and create a corresponding database connection.
* The menu :menuselection:`Vector --> Openstreetmap --> Export topology to
  SpatiaLite` then allows you to open the database connection, select the type
  of data you want (points, lines, or polygons) and choose tags to import.
  This creates a SpatiaLite geometry layer that you can add to your
  project by clicking on the |addSpatiaLiteLayer|
  :sup:`Add SpatiaLite Layer` toolbar button or by selecting the
  |addSpatiaLiteLayer| :menuselection:`Add SpatiaLite Layer...` option
  from the :menuselection:`Layer` menu (see section :ref:`label_spatialite`).

.. index:: PostGIS, PostgreSQL
.. _label_postgis:

PostGIS Layers
--------------

PostGIS layers are stored in a PostgreSQL database. The advantages of PostGIS
are the spatial indexing, filtering and query capabilities it provides. Using
PostGIS, vector functions such as select and identify work more accurately than they do
with OGR layers in QGIS.

.. _vector_create_stored_connection:

Creating a stored Connection
............................

|addPostgisLayer| The first time you use a PostGIS data source, you must
create a connection to the PostgreSQL database that contains the data. Begin by
clicking on the |addPostgisLayer| :sup:`Add PostGIS Layer` toolbar
button, selecting the |addPostgisLayer| :menuselection:`Add PostGIS Layer...`
option from the :menuselection:`Layer` menu, or typing :kbd:`Ctrl+Shift+D`. You
can also open the :guilabel:`Add Vector Layer` dialog and select
|radioButtonOn| :guilabel:`Database`. The :guilabel:`Add PostGIS Table(s)`
dialog will be displayed. To access the connection manager, click on the
**[New]** button to display the :guilabel:`Create a New PostGIS Connection`
dialog. The parameters required for a connection are:

* **Name**: A name for this connection. It can be the same as *Database*.
* **Service**: Service parameter to be used alternatively to hostname/port (and
  potentially database). This can be defined in :file:`pg_service.conf`.
  Check the :ref:`pg-service-file` section for more details.
* **Host**: Name of the database host. This must be a resolvable host name
  such as would be used to open a telnet connection or ping the host. If the
  database is on the same computer as QGIS, simply enter *'localhost'* here.
* **Port**: Port number the PostgreSQL database server listens on. The default
  port is 5432.
* **Database**: Name of the database.
* **SSL mode**: How the SSL connection will be negotiated with the server. Note
  that massive speed-ups in PostGIS layer rendering can be achieved by disabling
  SSL in the connection editor. The following options are available:

  * Disable: Only try an unencrypted SSL connection.
  * Allow: Try a non-SSL connection. If that fails, try an SSL connection.
  * Prefer (the default): Try an SSL connection. If that fails, try a
    non-SSL connection.
  * Require: Only try an SSL connection.

* **Username**: User name used to log in to the database.
* **Password**: Password used with *Username* to connect to the database.

Optionally, you can activate the following checkboxes:

*  |checkbox| :guilabel:`Save Username`
*  |checkbox| :guilabel:`Save Password`
*  |checkbox| :guilabel:`Only look in the geometry_columns table`
*  |checkbox| :guilabel:`Don't resolve type of unrestricted columns (GEOMETRY)`
*  |checkbox| :guilabel:`Only look in the 'public' schema`
*  |checkbox| :guilabel:`Also list tables with no geometry`
*  |checkbox| :guilabel:`Use estimated table metadata`

Once all parameters and options are set, you can test the connection
by clicking on the **[Test Connect]** button.

.. tip:: **Use estimated table metadata to speed up operations**

   When initializing layers, various queries may be needed to establish the
   characteristics of the geometries stored in the database table. When the
   :guilabel:`Use estimated table metadata` option is checked, these queries
   examine only a sample of the rows and use the table statistics, rather than
   the entire table. This can drastically speed up operations on large datasets,
   but may result in incorrect characterization of layers (eg. the feature count
   of filtered layers will not be accurately determined) and may even cause strange
   behaviour in case columns that are supposed to be unique actually are not.

.. _vector_loading_postgis:

Loading a PostGIS Layer
.......................

|addPostgisLayer| Once you have one or more connections defined, you can
load layers from the PostgreSQL database. Of course, this requires having data in
PostgreSQL. See section :ref:`vector_import_data_in_postgis` for a discussion on
importing data into the database.

To load a layer from PostGIS, perform the following steps:

*  If the :guilabel:`Add PostGIS layers` dialog is not already open,
   selecting the |addPostgisLayer| :menuselection:`Add PostGIS Layer...`
   option from the :menuselection:`Layer` menu or typing :kbd:`Ctrl+Shift+D`
   opens the dialog.
*  Choose the connection from the drop-down list and click **[Connect]**.
*  Select or unselect |checkbox| :guilabel:`Also list tables with no geometry`.
*  Optionally, use some |checkbox| :guilabel:`Search Options` to define
   which features to load from the layer, or use the **[Build query]** button
   to start the :guilabel:`Query builder` dialog.
*  Find the layer(s) you wish to add in the list of available layers.
*  Select it by clicking on it. You can select multiple layers by holding
   down the :kbd:`Shift` key while clicking. See section
   :ref:`vector_query_builder` for information on using the PostgreSQL
   Query Builder to further define the layer.
*  Click on the **[Add]** button to add the layer to the map.

.. _tip_postgis_layers:

.. tip:: **PostGIS Layers**

   Normally, a PostGIS layer is defined by an entry in the geometry_columns
   table. QGIS can load layers that do not have an entry in the geometry_columns
   table. This includes both tables and views. Defining a spatial view provides
   a powerful means to visualize your data. Refer to your PostgreSQL manual for
   information on creating views.

.. _pg-service-file:

Service connection file
^^^^^^^^^^^^^^^^^^^^^^^

The service connection file allows PostgreSQL connection parameters to be
associated with a single service name. That service name can then be specified
by a client and the associated settings will be used.

It's called :file:`.pg_service.conf` under \*nix systems (GNU/Linux, macOS etc.) and
:file:`pg_service.conf` on Windows.

The service file looks like::

 [water_service]
 host=192.168.0.45
 port=5433
 dbname=gisdb
 user=paul
 password=paulspass

 [wastewater_service]
 host=dbserver.com
 dbname=water
 user=waterpass

.. note:: There are two services in the above example: ``water_service``
  and ``wastewater_service``. You can use these to connect from QGIS,
  pgAdmin etc. by specifying only the name of the service you want to
  connect to (without the enclosing brackets).
  If you want to use the service with ``psql`` you need to do something
  like ``export PGSERVICE=water_service`` before doing your psql commands.

.. note:: You can find all the parameters `here <https://www.postgresql.org/docs/current/static/libpq-connect.html#LIBPQ-PARAMKEYWORDS>`_

.. note:: If you don't want to save the passwords in the service file you can
  use the `.pg_pass <https://www.postgresql.org/docs/current/static/libpq-pgpass.html>`_
  option.


On \*nix operating systems (GNU/Linux, macOS etc.) you can save the
:file:`.pg_service.conf` file in the user's home directory and
the PostgreSQL clients will automatically be aware of it.
For example, if the logged user is ``web``, :file:`.pg_service.conf` should
be saved in the :file:`/home/web/` directory in order to directly work (without
specifying any other environment variables).

You can specify the location of the service file by creating a ``PGSERVICEFILE``
environment variable (e.g. run the ``export PGSERVICEFILE=/home/web/.pg_service.conf``
command under your \*nix OS to temporarily set the ``PGSERVICEFILE`` variable)

You can also make the service file available system-wide (all users) either by
placing it at ``pg_config --sysconfdir``**/.pg_service.conf**  or by adding the
``PGSYSCONFDIR`` environment variable to specify the directory containing
the service file. If service definitions with the same name exist in the user
and the system file, the user file takes precedence.

.. warning::

 There are some caveats under Windows:

 * The service file should be saved as :file:`pg_service.conf`
   and not as :file:`.pg_service.conf`.
 * The service file should be saved in Unix format in order to work.
   One way to do it is to open it with `Notepad++ <https://notepad-plus-plus.org/>`_
   and ``Edit -> EOL Conversion -> UNIX Format -> File save``.
 * After adding an environment variable you may also need to restart
   the computer.


.. _sec_postgis_details:

Some details about PostgreSQL layers
....................................

This section contains some details on how QGIS accesses PostgreSQL layers.
Most of the time, QGIS should simply provide you with a list of database
tables that can be loaded, and it will load them on request. However, if you have
trouble loading a PostgreSQL table into QGIS, the information below may
help you understand any QGIS messages and give you direction on changing
the PostgreSQL table or view definition to allow QGIS to load it.

QGIS requires that PostgreSQL layers contain a column that can be used
as a unique key for the layer. For tables, this usually means that the table
needs a primary key, or a column with a unique constraint on it. In QGIS,
this column needs to be of type int4 (an integer of size 4 bytes).
Alternatively, the ctid column can be used as primary key. If a table lacks
these items, the oid column will be used instead. Performance will be
improved if the column is indexed (note that primary keys are automatically
indexed in PostgreSQL).

If the PostgreSQL layer is a view, the same requirement exists, but views
do not have primary keys or columns with unique constraints on them. You have to
define a primary key field (has to be integer) in the QGIS dialog before you
can load the view. If a suitable column does not exist in the view, QGIS
will not load the layer. If this occurs, the solution is to alter the view so
that it does include a suitable column (a type of integer and either a primary
key or with a unique constraint, preferably indexed).

QGIS offers a checkbox **Select at id** that is activated by default. This
option gets the ids without the attributes which is faster in most cases. It
can make sense to disable this option when you use expensive views.

.. tip:: **Backup of PostGIS database with layers saved by QGIS**

   If you want to make a backup of your PostGIS database using the :file:`pg_dump` and
   :file:`pg_restore` commands, and the default layer styles as saved by QGIS fail to
   restore afterwards, you need to set the XML option to :file:`DOCUMENT` and the
   restore will work.


.. %FIXME: Add missing information
.. % When dealing with views, QGIS parses the view definition and

QGIS allows to filter features already on server side. Check the
|checkbox| :guilabel:`Execute expressions on postgres server-side if
possible (Experimental)` checkbox to do so. Only supported expressions will be
sent to the database. Expressions using unsupported operators or functions will
gracefully fallback to local evaluation.

.. index:: shp2pgsql
.. _vector_import_data_in_postgis:

Importing Data into PostgreSQL
------------------------------

Data can be imported into PostgreSQL/PostGIS using several tools, including the
DB Manager plugin and the command line tools shp2pgsql and ogr2ogr.

DB Manager
..........

QGIS comes with a core plugin named |dbManager| :sup:`DB Manager`. It can
be used to load shapefiles and other data formats, and it includes support for
schemas. See section :ref:`dbmanager` for more information.

shp2pgsql
.........

PostGIS includes an utility called **shp2pgsql** that can be used to import
shapefiles into a PostGIS-enabled database. For example, to import a
shapefile named :file:`lakes.shp` into a PostgreSQL database named
``gis_data``, use the following command:

::

  shp2pgsql -s 2964 lakes.shp lakes_new | psql gis_data

This creates a new layer named ``lakes_new`` in the ``gis_data`` database.
The new layer will have a spatial reference identifier (SRID) of 2964.
See section :ref:`label_projections` for more information on spatial
reference systems and projections.

.. index:: pgsql2shp

.. _tip_export_from_postgis:

.. tip:: **Exporting datasets from PostGIS**

   Like the import tool **shp2pgsql**, there is also a tool to export
   PostGIS datasets as shapefiles: **pgsql2shp**. This is shipped within
   your PostGIS distribution.

.. index:: ogr2ogr

ogr2ogr
.......

Besides **shp2pgsql** and **DB Manager**, there is another tool for feeding geodata
in PostGIS: **ogr2ogr**. This is part of your GDAL installation.

To import a shapefile into PostGIS, do the following:
::

  ogr2ogr -f "PostgreSQL" PG:"dbname=postgis host=myhost.de user=postgres
  password=topsecret" alaska.shp

This will import the shapefile :file:`alaska.shp` into the PostGIS database
*postgis* using the user *postgres* with the password *topsecret* on host
server *myhost.de*.

Note that OGR must be built with PostgreSQL to support PostGIS.
You can verify this by typing (in |nix|)
::

  ogrinfo --formats | grep -i post


If you prefer to use PostgreSQL's **COPY** command instead of the default
**INSERT INTO** method, you can export the following environment variable
(at least available on |nix| and |osx|):
::

  export PG_USE_COPY=YES

**ogr2ogr** does not create spatial indexes like **shp2pgsl** does. You
need to create them manually, using the normal SQL command **CREATE INDEX**
afterwards as an extra step (as described in the next section
:ref:`vector_improving_performance`).

.. _vector_improving_performance:

Improving Performance
.....................

Retrieving features from a PostgreSQL database can be time-consuming, especially
over a network. You can improve the drawing performance of PostgreSQL layers by
ensuring that a :index:`PostGIS spatial index` exists on each layer in the
database. PostGIS supports creation of a :index:`GiST (Generalized Search Tree)
index` to speed up spatial searches of the data (GiST index information is taken
from the PostGIS documentation available at http://postgis.net).

.. tip:: You can use the DBManager to create an index to your layer. You should
   first select the layer and click on :menuselection:`Table > Edit table`, go to
   :menuselection:`Indexes` tab and click on **[Add spatial index]**.

The syntax for creating a GiST index is:
::


   CREATE INDEX [indexname] ON [tablename]
     USING GIST ( [geometryfield] GIST_GEOMETRY_OPS );


Note that for large tables, creating the index can take a long time. Once the
index is created, you should perform a ``VACUUM ANALYZE``. See the PostGIS
documentation (POSTGIS-PROJECT :ref:`literature_and_web`) for more information.

The following is an example of creating a GiST index:
::

  gsherman@madison:~/current$ psql gis_data
  Welcome to psql 8.3.0, the PostgreSQL interactive terminal.

  Type:  \copyright for distribution terms
         \h for help with SQL commands
         \? for help with psql commands
         \g or terminate with semicolon to execute query
         \q to quit

  gis_data=# CREATE INDEX sidx_alaska_lakes ON alaska_lakes
  gis_data-# USING GIST (the_geom GIST_GEOMETRY_OPS);
  CREATE INDEX
  gis_data=# VACUUM ANALYZE alaska_lakes;
  VACUUM
  gis_data=# \q
  gsherman@madison:~/current$

.. index:: ST_Shift_Longitude

Vector layers crossing 180 |degrees| longitude
----------------------------------------------

Many GIS packages don't wrap vector maps with a geographic reference system
(lat/lon) :index:`crossing the 180 degrees longitude line`
(http://postgis.refractions.net/documentation/manual-2.0/ST\_Shift\_Longitude.html).
As result, if we open such a map in QGIS, we will see two far, distinct locations,
that should appear near each other. In Figure_vector_4_, the tiny point on the far
left of the map canvas (Chatham Islands) should be within the grid, to the right of the
New Zealand main islands.

.. _figure_vector_4:

.. only:: html

   **Figure Vector 4:**

.. figure:: /static/user_manual/working_with_vector/vectorNotWrapping.png
   :align: center

   Map in lat/lon crossing the 180 |degrees| longitude line

A work-around is to transform the longitude values using PostGIS and the
**ST_Shift_Longitude** function. This function reads every point/vertex in every
component of every feature in a geometry, and if the longitude coordinate is
< 0 |degrees|, it adds 360 |degrees| to it. The result is a 0 |degrees| - 360 |degrees|
version of the data to be plotted in a 180 |degrees|-centric map.

.. _figure_vector_5:

.. only:: html

   **Figure Vector 5:**

.. figure:: /static/user_manual/working_with_vector/vectorWrapping.png
   :align: center
   :width: 25em

   Crossing 180 |degrees| longitude applying the **ST_Shift_Longitude**
   function

Usage
.....

*  Import data into PostGIS (:ref:`vector_import_data_in_postgis`) using,
   for example, the DB Manager plugin.
*  Use the PostGIS command line interface to issue the following command
   (in this example, "TABLE" is the actual name of your PostGIS table):
   ``gis_data=# update TABLE set the_geom=ST_Shift_Longitude(the_geom);``
*  If everything went well, you should receive a confirmation about the
   number of features that were updated. Then you'll be able to load the
   map and see the difference (Figure_vector_5_).

.. index:: Spatialite, SQLite
.. _label_spatialite:

SpatiaLite Layers
-----------------

|addSpatiaLiteLayer| The first time you load data from a SpatiaLite
database, begin by clicking on the |addSpatiaLiteLayer|
:sup:`Add SpatiaLite Layer` toolbar button, or by selecting the
|addSpatiaLiteLayer| :menuselection:`Add SpatiaLite Layer...` option
from the :menuselection:`Layer` menu, or by typing :kbd:`Ctrl+Shift+L`.
This will bring up a window that will allow you either to connect to a
SpatiaLite database already known to QGIS, which you can choose from the
drop-down menu, or to define a new connection to a new database. To define a
new connection, click on **[New]** and use the file browser to point to
your SpatiaLite database, which is a file with a :file:`.sqlite` extension.

If you want to save a vector layer to SpatiaLite format, you can do this by
right clicking the layer in the legend. Then, click on :menuselection:`Save as..`,
define the name of the output file, and select 'SpatiaLite' as format and the CRS.
Also, you can select 'SQLite' as format and then add ``SPATIALITE=YES`` in the
OGR data source creation option field. This tells OGR to create a SpatiaLite
database. See also http://www.gdal.org/ogr/drv_sqlite.html.

QGIS also supports editable views in SpatiaLite.

Creating a new SpatiaLite layer
...............................

If you want to create a new SpatiaLite layer, please refer to section
:ref:`vector_create_spatialite`.

.. index:: QSpatiaLite, Spatialite_Manager, DB_Manager

.. _tip_spatialite_management_plugin:

.. tip:: **SpatiaLite data management Plugins**

   For SpatiaLite data management, you can also use several Python plugins:
   QSpatiaLite, SpatiaLite Manager or :ref:`DB Manager <dbmanager>` (core plugin, recommended).
   If necessary, they can be downloaded and installed with the Plugin Installer.

.. index:: MSSQL Spatial
.. _label_mssql:

MSSQL Spatial Layers
--------------------

|addMssqlLayer| QGIS also provides native MS SQL support. The first
time you load MSSQL Spatial data, begin by clicking on the
|addMssqlLayer| :sup:`Add MSSQL Spatial Layer` toolbar button or by
selecting the |addMssqlLayer| :menuselection:`Add MSSQL Spatial Layer...`
option from the :menuselection:`Layer` menu, or by typing :kbd:`Ctrl+Shift+M`.

.. _label_oracle_spatial:
.. index:: Oracle Spatial

Oracle Spatial Layers
---------------------

The spatial features in Oracle Spatial aid users in managing geographic and
location data in a native type within an Oracle database. QGIS now has
support for such layers.

Creating a stored Connection
............................

|addOracleLayer| The first time you use an Oracle Spatial data source,
you must create a connection to the database that contains the data. Begin by
clicking on the |addOracleLayer| :sup:`Add Oracle Spatial Layer` toolbar
button, selecting the |addOracleLayer| :menuselection:`Add Oracle
Spatial Layer...` option from the :menuselection:`Layer` menu, or typing
:kbd:`Ctrl+Shift+O`. To access the connection manager, click on the **[New]**
button to display the :guilabel:`Create a New Oracle Spatial Connection` dialog.
The parameters required for a connection are:

* **Name**: A name for this connection. It can be the same as *Database*
* **Database**: SID or SERVICE_NAME of the Oracle instance.
* **Host**: Name of the database host. This must be a resolvable host name
  such as would be used to open a telnet connection or ping the host. If the
  database is on the same computer as QGIS, simply enter *'localhost'* here.
* **Port**: Port number the Oracle database server listens on. The default
  port is 1521.
* **Username**: Username used to login to the database.
* **Password**: Password used with *Username* to connect to the database.

Optionally, you can activate following checkboxes:

*  |checkbox| :guilabel:`Save Username` Indicates whether to save the database
   username in the connection configuration.
*  |checkbox| :guilabel:`Save Password` Indicates whether to save the database
   password in the connection settings.
*  |checkbox| :guilabel:`Only look in meta data table` Restricts the displayed
   tables to those that are in the all_sdo_geom_metadata view. This can speed
   up the initial display of spatial tables.
*  |checkbox| :guilabel:`Only look for user's tables` When searching for spatial
   tables, restrict the search to tables that are owned by the user.
*  |checkbox| :guilabel:`Also list tables with no geometry` Indicates that
   tables without geometry should also be listed by default.
*  |checkbox| :guilabel:`Use estimated table statistics for the layer metadata`
   When the layer is set up, various metadata are required for the Oracle table.
   This includes information such as the table row count, geometry type and
   spatial extents of the data in the geometry column. If the table contains a
   large number of rows, determining this metadata can be time-consuming. By
   activating this option, the following fast table metadata operations are
   done: Row count is determined from ``all_tables.num_rows``. Table extents
   are always determined with the SDO_TUNE.EXTENTS_OF function, even if a layer
   filter is applied. Table geometry is determined from the first 100
   non-null geometry rows in the table.
*  |checkbox| :guilabel:`Only existing geometry types` Only list the existing
   geometry types and don't offer to add others.

.. warning::

   In the :guilabel:`Authentication` tab, saving **username** and **password** 
   will keep unprotected credentials in the connection configuration. Those
   **credentials will be visible** if, for instance, you shared the project file
   with someone. Therefore, it's advisable to save your credentials in a
   *Authentication configuration* instead (:guilabel:`configurations` tab). 
   See :ref:`authentication_index` for more details.

Once all parameters and options are set, you can test the connection by
clicking on the **[Test Connect]** button.

.. _tip_settings_security:

.. tip:: **QGIS User Settings and Security**

   Depending on your computing environment, storing passwords in your QGIS
   settings may be a security risk. Passwords are saved in clear text in the
   system configuration and in the project files!
   Your customized settings for QGIS are stored based on the operating system:

   * |nix| The settings are stored in your home directory in :file:`~/.qgis2`.
   * |win| The settings are stored in the registry.


Loading an Oracle Spatial Layer
................................

|addOracleLayer| Once you have one or more connections defined, you can
load layers from the Oracle database. Of course, this requires having data in
Oracle.

To load a layer from Oracle Spatial, perform the following steps:

*  If the :guilabel:`Add Oracle Spatial layers` dialog is not already open,
   click on the |addOracleLayer| :sup:`Add Oracle Spatial Layer` toolbar
   button.
*  Choose the connection from the drop-down list and click **[Connect]**.
*  Select or unselect |checkbox| :guilabel:`Also list tables with no geometry`.
*  Optionally, use some |checkbox| :guilabel:`Search Options` to define
   which features to load from the layer or use the **[Build query]** button
   to start the :guilabel:`Query builder` dialog.
*  Find the layer(s) you wish to add in the list of available layers.
*  Select it by clicking on it. You can select multiple layers by holding
   down the :kbd:`Shift` key while clicking. See section
   :ref:`vector_query_builder` for information on using the Oracle
   Query Builder to further define the layer.
*  Click on the **[Add]** button to add the layer to the map.

.. _tip_ORACLE Spatial_layers:

.. tip:: **Oracle Spatial Layers**

   Normally, an Oracle Spatial layer is defined by an entry in the
   **USER_SDO_METADATA** table.

.. _label_db2_spatial:
.. index:: DB2 Spatial

DB2 Spatial Layers
---------------------

IBM DB2 for Linux, Unix and Windows (DB2 LUW), IBM DB2 for z/OS (mainframe) 
and IBM DashDB products allow
users to store and analyse spatial data in relational table columns.
The DB2 provider for QGIS supports the full range of visualization, analysis
and manipulation of spatial data in these databases.

.. _DB2 z/OS KnowledgeCenter: https://www.ibm.com/support/knowledgecenter/en/SSEPEK_11.0.0/spatl/src/tpc/spatl_db2sb03.html
.. _DB2 LUW KnowledgeCenter: http://www.ibm.com/support/knowledgecenter/SSEPGG_11.1.0/com.ibm.db2.luw.spatial.topics.doc/doc/db2sb03.html
.. _DB2 DashDB KnowledgeCenter: https://www.ibm.com/support/knowledgecenter/SS6NHC/com.ibm.db2.luw.spatial.topics.doc/doc/csbp1001.html
.. _DB2 Spatial Tutorial: https://www.ibm.com/developerworks/data/tutorials/dm-1202db2spatialdata1/

User documentation on these capabilities can be found at the
`DB2 z/OS KnowledgeCenter`_
,
`DB2 LUW KnowledgeCenter`_ 
and
`DB2 DashDB KnowledgeCenter`_.

For more information about working with the DB2 spatial capabilities, check out
the `DB2 Spatial Tutorial`_ on IBM DeveloperWorks.

Configuring QGIS for DB2
............................

The DB2 provider currently only supports the Windows environment through the Windows ODBC driver.

The client running QGIS needs to have one of the following installed:

* DB2 LUW
* IBM Data Server Driver Package
* IBM Data Server Client

If you are accessing a DB2 LUW database on the same machine or using DB2 LUW as a client, 
the DB2 executables and supporting files need to be included in the Windows path.
This can be done by creating a batch file like the following with the name **db2.bat** and including it in the directory 
**%OSGEO4W_ROOT%/etc/ini**.

::

	@echo off
	REM Point the following to where DB2 is installed
	SET db2path=C:\Program Files (x86)\sqllib
	REM This should usually be ok - modify if necessary
	SET gskpath=C:\Program Files (x86)\ibm\gsk8
	SET Path=%db2path%\BIN;%db2path%\FUNCTION;%gskpath%\lib64;%gskpath%\lib;%path%

Creating a stored Connection
............................

|addDb2Layer| The DB2 provider uses ODBC to connect to a DB2 database.
Windows includes ODBC by default.

The first time you use an DB2 Spatial data source,
you must create a connection to the database that contains the data. 
A connection can be created by:

* Right-clicking on  |db2| :menuselection:`DB2` in the QGIS Browser panel 
  and selecting :menuselection:`New connection`
  
or  
  
* Selecting the |addDb2Layer| :menuselection:`Add DB2
  Spatial Layer...` option from the :menuselection:`Layer` menu.
  To access the connection manager, click on the **[New]**
  button to display the :guilabel:`Create a New DB2 Connection` dialog.

The connection can be specified using either a Service/DSN name defined to ODBC
or using the driver, host and port information.

All connections require:

* **Connection Name**: A name for this connection. It can be the same as *Database*
* **Database**: The DB2 database name.
* User name and password. See more information below.

An ODBC Service/DSN connection requires in addition:

* **Service/DSN**: The service name defined to ODBC

A driver / host / host connection requires in addition:

* **Driver**: Name of the DB2 driver. Typically this would be IBM DB2 ODBC DRIVER.
* **DB2 Host**: Name of the database host. This must be a resolvable host name
  such as would be used to open a telnet connection or ping the host. If the
  database is on the same computer as QGIS, simply enter *'localhost'* here.
* **DB2 Port**: Port number the DB2 database server listens on. The default
  DB2 LUW port is 50000. The default DB2 z/OS port is 446.

.. warning::

   In the :guilabel:`Authentication` tab, saving **username** and **password** 
   will keep unprotected credentials in the connection configuration. Those
   **credentials will be visible** if, for instance, you shared the project file
   with someone. Therefore, it's advisable to save your credentials in a
   *Authentication configuration* instead (:guilabel:`configurations` tab). 
   See :ref:`authentication_index` for more details.

Once all parameters and options are set, you can test the connection by
clicking on the **[Test connection]** button.

Loading a DB2 Spatial Layer
................................

|addDb2Layer| Once you have one or more connections defined, you can
load layers from the DB2 database. A DB2 Spatial layer is defined by a row in the
**DB2GSE.ST_GEOMETRY_COLUMNS** view. 

To load a layer from DB2 Spatial, perform the following steps:

*  If the :guilabel:`Add DB2 Spatial layers` dialog is not already open,
   click on the |addDb2Layer| :sup:`Add DB2 Spatial Layer` toolbar
   button.
*  Choose the connection from the drop-down list and click **[Connect]**.
*  Optionally, use some |checkbox| :guilabel:`Search Options` to define
   which features to load from the layer or use the **[Build query]** button
   to start the :guilabel:`Query builder` dialog.
*  Find the layer(s) you wish to add in the list of available layers.
*  Select it by clicking on it. You can select multiple layers by holding
   down the :kbd:`Shift` key while clicking. See section
   :ref:`vector_query_builder` for information on using the
   Query Builder to further define the layer.
*  Click on the **[Add]** button to add the layer to the map.

Or more simply, expand the |db2| :menuselection:`DB2` connection in the QGIS Browser panel
and double-click the name of the layer.

.. note:: 

  In order to work effectively with DB2 spatial tables in QGIS, it is important that
  tables have an INTEGER or BIGINT column defined as PRIMARY KEY and if new features
  are going to be added, this column should also have the GENERATED characteristic.

  It is also helpful for the spatial column to be registered with a specific spatial
  reference identifier (most often 4326 for WGS84 coordinates). 
  A spatial column can be registered by calling the ST_Register_Spatial_Column stored
  procedure.   

