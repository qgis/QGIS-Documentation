|updatedisclaimer|

Supported Data Formats
======================

|qg| uses the OGR library to read and write vector data formats,
including ESRI shapefiles, MapInfo and MicroStation file formats, AutoCAD DXF, PostGIS,
SpatiaLite, Oracle Spatial and MSSQL Spatial databases, and many more. GRASS vector
and PostgreSQL support is supplied by native |qg| data provider plugins. Vector data can also be loaded in read mode from zip and gzip archives into
|qg|. As of the date of this document, 69 vector formats are supported by the OGR
library (see OGR-SOFTWARE-SUITE in :ref:`literature_and_web`). The complete list
is available at http://www.gdal.org/ogr/ogr_formats.html.

.. note::

   Not all of the listed formats may work in |qg| for various reasons. For
   example, some require external commercial libraries, or the GDAL/OGR
   installation of your OS may not have been built to support the format you want to use.
   Only those formats that have been well tested will appear in the list of
   file types when loading a vector into |qg|. Other untested formats can be
   loaded by selecting ``*.*``.

Working with GRASS vector data is described in Section :ref:`sec_grass`.

This section describes how to work with several common formats: ESRI
shapefiles, PostGIS layers, SpatiaLite layers, OpenStreetMap vectors, and Comma
Separated data (CSV). Many of the features available in |qg| work the same,
regardless of the vector data source. This is by design, and it includes the
identify, select, labeling and attributes functions.

.. index:: ESRI, Shapefile, OGR
.. _vector_shapefiles:

ESRI Shapefiles
---------------

The standard vector file format used in |qg| is the ESRI shapefile. Support is
provided by the :index:`OGR Simple Feature Library` (http://www.gdal.org/ogr/).

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

.. _vector_load_shapefile:
Loading a Shapefile
...................

To :index:`load a shapefile`, start |qg| and click on the |mActionAddOgrLayer|
:sup:`Add Vector Layer` toolbar button, or simply press :kbd:`Ctrl+Shift+V`.
This will bring up a new window (see figure_vector_1_).

.. _figure_vector_1:

.. only:: html

   **Figure Vector 1:**

.. figure:: /static/user_manual/working_with_vector/addvectorlayerdialog.png
   :align: center

   Add Vector Layer Dialog |nix|

From the available options check |radiobuttonon| :guilabel:`File`. Click on
**[Browse]**. That will bring up a standard open file dialog
(see figure_vector_2_), which allows you to navigate the file system and load a
shapefile or other supported data source. The selection box :guilabel:`Filter`
|selectstring| allows you to preselect some OGR-supported file formats.

You can also select the encoding for the shapefile if desired.

.. _figure_vector_2:

.. only:: html

   **Figure Vector 2:**

.. figure:: /static/user_manual/working_with_vector/shapefileopendialog.png
   :align: center

   Open an OGR Supported Vector Layer Dialog |nix|

Selecting a shapefile from the list and clicking **[Open]** loads it into |qg|.
Figure_vector_3_ shows |qg| after loading the :file:`alaska.shp` file.

.. _figure_vector_3:

.. only:: html

   **Figure Vector 3:**

.. figure:: /static/user_manual/working_with_vector/shapefileloaded.png
   :align: center

   |qg| with Shapefile of Alaska loaded |nix|

.. tip:: **Layer Colors**

   When you add a layer to the map, it is assigned a random color. When adding
   more than one layer at a time, different colors are assigned to each layer.

Once a shapefile is loaded, you can zoom around it using the map navigation tools.
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

Improving Performance for Shapefiles
....................................

To improve the performance of drawing a shapefile, you can create a spatial
index. A spatial index will improve the speed of both zooming and panning.
Spatial indexes used by |qg| have a :file:`.qix` extension.

Use these steps to create the index:

*  Load a shapefile by clicking on the |mActionAddOgrLayer| :sup:`Add Vector Layer`
   toolbar button or pressing :kbd:`Ctrl+Shift+V`.
*  Open the :guilabel:`Layer Properties` dialog by double-clicking on the
   shapefile name in the legend or by right-clicking and choosing
   :menuselection:`Properties` from the context menu.
*  In the :guilabel:`General` tab, click the **[Create Spatial Index]** button.

Problem loading a shape .prj file
.................................

If you load a shapefile with a :file:`.prj` file and |qg| is not able to read the
coordinate reference system from that file, you will need to define the proper
projection manually within the :guilabel:`General` tab of the
:guilabel:`Layer Properties` dialog of the layer by clicking the
**[Specify...]**  button. This is due to the fact that :file:`.prj` files
often do not provide the complete projection parameters as used in |qg| and
listed in the :guilabel:`CRS` dialog.

For the same reason, if you create a new shapefile with |qg|, two different
projection files are created: a :file:`.prj` file with limited projection
parameters, compatible with ESRI software, and a :file:`.qpj` file, providing
the complete parameters of the used CRS. Whenever |qg| finds a :file:`.qpj`
file, it will be used instead of the :file:`.prj`.

.. index:: MapInfo
.. _vector_loading_mapinfo:

Loading a MapInfo Layer
-----------------------

|mActionAddOgrLayer| To load a MapInfo layer, click on the |mActionAddOgrLayer|
:sup:`Add Vector Layer` toolbar button; or type :kbd:`Ctrl+Shift+V`, change the
file type filter :guilabel:`Files of type` |selectstring|: to
'Mapinfo File [OGR] (*.mif *.tab *.MIF *.TAB)' and select the MapInfo layer you
want to load.

.. index:: ArcInfo_Binary_Coverage, Tiger_Format, UK_National_Transfer_Format, US_Census_Bureau
.. _vector_loading_arcinfo_coverage:

Loading an ArcInfo Binary Coverage
----------------------------------

|mActionAddOgrLayer| To load an ArcInfo Binary Coverage, click on the
|mActionAddOgrLayer| :sup:`Add Vector Layer` toolbar button or press
:kbd:`Ctrl+Shift+V` to open the :guilabel:`Add Vector Layer` dialog. Select
|radiobuttonon| :guilabel:`Directory` as :guilabel:`Source type`. Change the
file type filter :guilabel:`Files of type` |selectstring| to
'Arc/Info Binary Coverage'. Navigate to the directory that contains the
coverage file, and select it.

Similarly, you can load directory-based vector files in the UK National Transfer
Format, as well as the raw TIGER Format of the US Census Bureau.

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

|qg| allows you to load a delimited text file as a layer or ordinal table. But
first check that the file meets the following requirements:

#. The file must have a delimited header row of field names. This must be the first line in the
   text file.
#. The header row must contain field(s) with geometry definition. These field(s)
   can have any name.
#. The X and Y coordinates (if geometry is defined by coordinates) must be
   specified as numbers. The coordinate system is not important.

As an example of a valid text file, we import the elevation point data file
:file:`elevp.csv` that comes with the |qg| sample dataset (see section
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

.. _vector_loading_csv:
Loading a delimited text file
.............................

Click the toolbar icon |delimited_text| :sup:`Add Delimited Text Layer` in the
:guilabel:`Manage layers` toolbar to open the :guilabel:`Create a Layer from a
Delimited Text File` dialog, as shown in figure_delimited_text_1_.

.. _figure_delimited_text_1:

.. only:: html

   **Figure Delimited Text 1:**

.. figure:: /static/user_manual/introduction/delimited_text_dialog.png
   :align: center

   Delimited Text Dialog |nix|

First, select the file to import (e.g., :file:`qgis_sample_data/csv/elevp.csv`)
by clicking on the **[Browse]** button. Once the file is selected, |qg|
attempts to parse the file with the most recently used delimiter. To enable |qg| to properly parse the
file, it is important to select the correct delimiter. You can specify a
delimiter by activating |radiobuttonon| :guilabel:`Custom delimiters`, or by activating
|radiobuttonon| :guilabel:`Regular expression delimiter` and entering
text into the :guilabel:`Expression` field. For example, to
change the delimiter to tab, use ``\t`` (this is a regular expression for the
tab character).

Once the file is parsed, set :guilabel:`Geometry definition` to
|radiobuttonon|:guilabel:`Point coordinates` and choose the ``X`` and ``Y``
fields from the dropdown lists. If the coordinates are defined as
degrees/minutes/seconds, activate the |checkbox| :guilabel:`DMS coordinates`
checkbox.

Finally, enter a layer name (e.g., :file:`elevp`), as shown in
figure_delimited_text_1_. To add the layer to the map, click **[OK]**. The
delimited text file now behaves as any other map layer in |qg|.

There is also a helper option that allows you to trim leading and trailing
spaces from fields --- |checkbox| :guilabel:`Trim fields`. Also, it is possible
to |checkbox| :guilabel:`Discard empty fields`. If necessary, you can force a comma
to be the decimal separator by activating |checkbox| :guilabel:`Decimal separator is
comma`.

If spatial information is represented by WKT, activate the |radiobuttonon|
:guilabel:`Well Known Text` option and select the field with the WKT definition for
point, line or polygon objects. If the file contains non-spatial data, activate
|radiobuttonon| :guilabel:`No geometry (attribute only table)` and it will be
loaded as an ordinal table.

Additionaly, you can enable:

* |checkbox| :guilabel:`Use spatial index` to improve the performance of displaying
  and spatially selecting features.
* |checkbox| :guilabel:`Use subset index`.
* |checkbox| :guilabel:`Watch file` to watch for changes to the file by other
  applications while |qg| is running.

.. index:: OSM, OpenStreetMap

.. _vactor_osm:

OpenStreetMap data
------------------

In recent years, the OpenStreetMap project has gained popularity because in many
countries no free geodata such as digital road maps are available. The objective
of the OSM project is to create a free editable map of the world from GPS data,
aerial photography or local knowledge. To support this objective, |qg|
provides suppport for OSM data.

.. _open_street_map:

Loading OpenStreetMap Vectors
.............................

|qg| integrates OpenStreetMap import as a core functionality.

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
  project by clicking on the |mActionAddSpatiaLiteLayer|
  :sup:`Add SpatiaLite Layer` toolbar button or by selecting the
  |mActionAddSpatiaLiteLayer| :menuselection:`Add SpatiaLite Layer...` option
  from the :menuselection:`Layer` menu (see section :ref:`label_spatialite`).

.. index:: PostGIS, PostgreSQL
.. _label_postgis:

PostGIS Layers
--------------

PostGIS layers are stored in a PostgreSQL database. The advantages of PostGIS
are the spatial indexing, filtering and query capabilities it provides. Using
PostGIS, vector functions such as select and identify work more accurately than they do
with OGR layers in |qg|.

.. _vector_create_stored_connection:

Creating a stored Connection
............................

|mActionAddPostgisLayer| The first time you use a PostGIS data source, you must
create a connection to the PostgreSQL database that contains the data. Begin by
clicking on the |mActionAddPostgisLayer| :sup:`Add PostGIS Layer` toolbar
button, selecting the |mActionAddPostgisLayer| :menuselection:`Add PostGIS Layer...`
option from the :menuselection:`Layer` menu, or typing :kbd:`Ctrl+Shift+D`. You
can also open the :guilabel:`Add Vector Layer` dialog and select
|radiobuttonon| :guilabel:`Database`. The :guilabel:`Add PostGIS Table(s)`
dialog will be displayed. To access the connection manager, click on the
**[New]** button to display the :guilabel:`Create a New PostGIS Connection`
dialog. The parameters required for a connection are:

* **Name**: A name for this connection. It can be the same as *Database*.
* **Service**: Service parameter to be used alternatively to hostname/port (and
  potentially database). This can be defined in :file:`pg_service.conf`.
* **Host**: Name of the database host. This must be a resolvable host name
  such as would be used to open a telnet connection or ping the host. If the
  database is on the same computer as |qg|, simply enter *'localhost'* here.
* **Port**: Port number the PostgreSQL database server listens on. The default
  port is 5432.
* **Database**: Name of the database.
* **SSL mode**: How the SSL connection will be negotiated with the server. Note
  that massive speedups in PostGIS layer rendering can be achieved by disabling
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

.. _tip_settings_security:

.. tip:: **QGIS User Settings and Security**

   Depending on your computing environment, storing passwords in your |qg|
   settings may be a security risk. Your customized settings for |qg| are
   stored based on the operating system:

   * |nix| The settings are stored in your home directory in :file:`~/.qgis2`.
   * |win| The settings are stored in the registry.

.. _vector_loading_postgis:

Loading a PostGIS Layer
.......................

|mActionAddPostgisLayer| Once you have one or more connections defined, you can
load layers from the PostgreSQL database. Of course, this requires having data in
PostgreSQL. See section :ref:`vector_import_data_in_postgis` for a discussion on
importing data into the database.

To load a layer from PostGIS, perform the following steps:

*  If the :guilabel:`Add PostGIS layers` dialog is not already open,
   selecting the |mActionAddPostgisLayer| :menuselection:`Add PostGIS Layer...`
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
   table. From version 0.9.0 on, |qg| can load layers that do not have an
   entry in the geometry_columns table. This includes both tables and views.
   Defining a spatial view provides a powerful means to visualize your data.
   Refer to your PostgreSQL manual for information on creating views.

.. _sec_postgis_details:

Some details about PostgreSQL layers
....................................

This section contains some details on how |qg| accesses PostgreSQL layers.
Most of the time, |qg| should simply provide you with a list of database
tables that can be loaded, and it will load them on request. However, if you have
trouble loading a PostgreSQL table into |qg|, the information below may
help you understand any |qg| messages and give you direction on changing
the PostgreSQL table or view definition to allow |qg| to load it.

|qg| requires that PostgreSQL layers contain a column that can be used
as a unique key for the layer. For tables, this usually means that the table
needs a primary key, or a column with a unique constraint on it. In |qg|,
this column needs to be of type int4 (an integer of size 4 bytes).
Alternatively, the ctid column can be used as primary key. If a table lacks
these items, the oid column will be used instead. Performance will be
improved if the column is indexed (note that primary keys are automatically
indexed in PostgreSQL).

If the PostgreSQL layer is a view, the same requirement exists, but views
do not have primary keys or columns with unique constraints on them. You have to
define a primary key field (has to be integer) in the |qg| dialog before you
can load the view. If a suitable column does not exist in the view, |qg|
will not load the layer. If this occurs, the solution is to alter the view so
that it does include a suitable column (a type of integer and either a primary
key or with a unique constraint, preferably indexed).

|qg| offers a checkbox **Select at id** that is activated by default. This
option gets the ids without the attributes which is faster in most cases. It
can make sense to disable this option when you use expensive views.

.. %FIXME: Add missing information
.. % When dealing with views, |qg| parses the view definition and

.. index:: shp2pgsql
.. _vector_import_data_in_postgis:

Importing Data into PostgreSQL
------------------------------

Data can be imported into PostgreSQL/PostGIS using several tools, including the
SPIT plugin and the command line tools shp2pgsql and ogr2ogr.

DB Manager
..........

|qg| comes with a core plugin named |icon_dbmanager| :sup:`DB Manager`. It can
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
from the PostGIS documentation available at http://postgis.refractions.net).

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
As result, if we open such a map in |qg|, we will see two far, distinct locations,
that should appear near each other. In Figure_vector_4_, the tiny point on the far
left of the map canvas (Chatham Islands) should be within the grid, to the right of the
New Zealand main islands.

.. _figure_vector_4:

.. only:: html

   **Figure Vector 4:**

.. figure:: /static/user_manual/working_with_vector/vectorNotWrapping.png
   :align: center

   Map in lat/lon crossing the 180 |degrees| longitude line |nix|

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

|mActionAddSpatiaLiteLayer| The first time you load data from a SpatiaLite
database, begin by clicking on the |mActionAddSpatiaLiteLayer|
:sup:`Add SpatiaLite Layer` toolbar button, or by selecting the
|mActionAddSpatiaLiteLayer| :menuselection:`Add SpatiaLite Layer...` option
from the :menuselection:`Layer` menu, or by typing :kbd:`Ctrl+Shift+L`.
This will bring up a window that will allow you either to connect to a
SpatiaLite database already known to |qg|, which you can choose from the
drop-down menu, or to define a new connection to a new database. To define a
new connection, click on **[New]** and use the file browser to point to
your SpatiaLite database, which is a file with a :file:`.sqlite` extension.

If you want to save a vector layer to SpatiaLite format, you can do this by
right clicking the layer in the legend. Then, click on :menuselection:`Save as..`,
define the name of the output file, and select 'SpatiaLite' as format and the CRS.
Also, you can select 'SQLite' as format and then add ``SPATIALITE=YES`` in the
OGR data source creation option field. This tells OGR to create a SpatiaLite
database. See also http://www.gdal.org/ogr/drv_sqlite.html.

|qg| also supports editable views in SpatiaLite.

Creating a new SpatiaLite layer
...............................

If you want to create a new SpatiaLite layer, please refer to section
:ref:`vector_create_spatialite`.

.. index:: QSpatiaLite, Spatialite_Manager, DB_Manager

.. _tip_spatialite_management_plugin:

.. tip:: **SpatiaLite data management Plugins**

   For SpatiaLite data management, you can also use several Python plugins:
   QSpatiaLite, SpatiaLite Manager or DB Manager (core plugin, recommended).
   If necessary, they can be downloaded and installed with the Plugin Installer.

.. _label_mssql:
.. index:: MSSQL Spatial

MSSQL Spatial Layers
--------------------

|mActionAddMssqlLayer| |qg| also provides native MS SQL 2008 support. The first
time you load MSSQL Spatial data, begin by clicking on the
|mActionAddMssqlLayer| :sup:`Add MSSQL Spatial Layer` toolbar button or by
selecting the |mActionAddMssqlLayer| :menuselection:`Add MSSQL Spatial Layer...`
option from the :menuselection:`Layer` menu, or by typing :kbd:`Ctrl+Shift+M`.

.. _label_oracle_spatial:
.. index:: Oracle Spatial

Oracle Spatial Layers
---------------------

The spatial features in Oracle Spatial aid users in managing geographic and
location data in a native type within an Oracle database. |qg| now has
support for such layers.

Creating a stored Connection
............................

|mActionAddOracleLayer| The first time you use an Oracle Spatial data source,
you must create a connection to the database that contains the data. Begin by
clicking on the |mActionAddOracleLayer| :sup:`Add Orcale Spatial Layer` toolbar
button, selecting the |mActionAddOracleLayer| :menuselection:`Add Orcale
Spatial Layer...` option from the :menuselection:`Layer` menu, or typing
:kbd:`Ctrl+Shift+O`. To access the connection manager, click on the **[New]**
button to display the :guilabel:`Create a New Oracle Spatial Connection` dialog.
The parameters required for a connection are:

* **Name**: A name for this connection. It can be the same as *Database*
* **Database**: SID or SERVICE_NAME of the Oracle instance.
* **Host**: Name of the database host. This must be a resolvable host name
  such as would be used to open a telnet connection or ping the host. If the
  database is on the same computer as |qg|, simply enter *'localhost'* here.
* **Port**: Port number the PostgreSQL database server listens on. The default
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

Once all parameters and options are set, you can test the connection by
clicking on the **[Test Connect]** button.

.. _tip_settings_security:

.. tip:: **QGIS User Settings and Security**

   Depending on your computing environment, storing passwords in your |qg|
   settings may be a security risk. Passwords are saved in clear text in the
   system configuration and in the project files!
   Your customized settings for |qg| are stored based on the operating system:

   * |nix| The settings are stored in your home directory in
     :file:`.config/QGIS/QGIS2.conf`.
   * |win| The settings are stored in the registry.

Loading an Oracle Spatial Layer
..............................

|mActionAddOracleLayer| Once you have one or more connections defined, you can
load layers from the Oracle database. Of course, this requires having data in
Oracle.

To load a layer from Oracle Spatial, perform the following steps:

*  If the :guilabel:`Add Oracle Spatial layers` dialog is not already open,
   click on the |mActionAddOracleLayer| :sup:`Add Oracle Spatial Layer` toolbar
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
