|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release


Supported Data Formats
======================

|qg| uses the OGR library to read and write vector data formats (GRASS vector and
PostgreSQL support is supplied by native QGIS data provider plugins), including
ESRI Shapefiles, MapInfo and Microstation file formats; PostGIS, SpatiaLite,
Oracle Spatial databases and many more. The vector data can also be loaded in
read mode from zip and gzip archives into QGIS. At the date of this document, 69
vector formats are supported by the OGR library (see OGR-SOFTWARE-SUITE :ref:`literature_and_web`).
The complete list is available at http://www.gdal.org/ogr/ogr_formats.html.

.. note::

   Not all of the listed formats may work in |qg| for various reasons.
   For example, some require external commercial libraries or the GDAL/OGR
   installation of your OS was not build to support the format you want to use.
   Only those formats that have been well tested will appear in the list of
   file types when loading a vector into |qg|. Other untested formats can be
   loaded by selecting ``*.*``.

Working with GRASS vector data is described in Section :ref:`sec_grass`.

This section describes how to work with several common formats: ESRI
Shapefiles, PostGIS layers and SpatiaLite layers. Many of the features
available in |qg| work the same, regardless of the vector data source.
This is by design and includes the identify, select, labeling and
attributes functions.

.. index:: ESRI, Shapefile, OGR

.. _vector_shapefiles:

ESRI Shapefiles
---------------


The standard vector file format used in |qg| is the ESRI Shapefile.
Support is provided by the :index:`OGR Simple Feature Library`
( http://www.gdal.org/ogr/ ).

A shapefile actually consists of several files. The following three are required:

#. :file:`.shp` file containing the feature geometries.
#. :file:`.dbf` file containing the attributes in dBase format.
#. :file:`.shx` index file.

Shapefiles also can include a file with a :file:`.prj` suffix, which contains the
projection information. While it is very useful to have a projection file, it is
not mandatory. A shapefile dataset can contain additional files. For further
details see the ESRI technical specification at:
http://www.esri.com/library/whitepapers/pdfs/shapefile.pdf.

.. _vector_load_shapefile:

Loading a Shapefile
...................

|mActionAddNonDbLayer| To :index:`load a shapefile`, start |qg| and click on the
|mActionAddNonDbLayer| :sup:`Add Vector Layer` toolbar button or simply type
:kbd:`Ctrl+Shift+V`. This will bring up a new window (see figure_vector_1_).


.. _figure_vector_1:

.. only:: html

   **Figure Vector 1:**

.. figure:: /static/user_manual/working_with_vector/addvectorlayerdialog.png
   :align: center
   :width: 25em

   Add Vector Layer Dialog |nix|

From the available options check |radiobuttonon| :guilabel:`File`. Click on button
**[Browse]**. That will bring up a standard open file dialog (see figure_vector_2_)
which allows you to navigate the file system and load a shapefile or other
supported data source. The selection box :guilabel:`Filter` |selectstring| allows
you to preselect some OGR supported file formats.

You can also select the Encoding type for the shapefile if desired.


.. _figure_vector_2:

.. only:: html

   **Figure Vector 2:**

.. figure:: /static/user_manual/working_with_vector/shapefileopendialog.png
   :align: center
   :width: 25em

   Open an OGR Supported Vector Layer Dialog |nix|

Selecting a shapefile from the list and clicking **[Open]** loads it into |qg|.
Figure_vector_3_ shows |qg| after loading the :file:`alaska.shp` file.


.. _figure_vector_3:

.. only:: html

   **Figure Vector 3:**

.. figure:: /static/user_manual/working_with_vector/shapefileloaded.png
   :align: center
   :width: 30em

   |qg| with Shapefile of Alaska loaded |nix|

.. _tip_layer_colors:

.. tip:: **Layer Colors**

   When you add a layer to the map, it is assigned a random color.
   When adding more than one layer at a time, different colors are assigned
   to each layer.

Once loaded, you can zoom around the shapefile using the map navigation tools.
To change the style of a layer, open the :guilabel:`Layer Properties` dialog
by double clicking on the layer name or by right-clicking on the name in the
legend and choosing :menuselection:`Properties` from the popup menu.
See Section :ref:`vector_style_tab` for more information on setting
symbology of vector layers.

.. _tip_load_from_external_drive_OSX:

.. tip:: **Load layer and project from mounted external drives on OS X**

   On OS X, portable drives that are mounted besides the primary hard drive
   do not show up under :menuselection:`File --> Open Project` as expected.
   We are working on a more OSX-native open/save dialog to fix this.
   As a workaround you can type '/Volumes' in the File name box and press
   :kbd:`return`. Then you can navigate to external drives and network mounts.

.. _vector_improving_performance_shape:

Improving Performance Shape
...........................

To improve the performance of drawing a shapefile, you can create a spatial
index. A spatial index will improve the speed of both zooming and panning.
Spatial indexes used by |qg| have a :file:`.qix` extension.

Use these steps to create the index:


*  Load a shapefile.
*  Open the :guilabel:`Layer Properties` dialog by double-clicking on the
   shapefile name in the legend or by right-clicking and choosing
   :menuselection:`Properties` from the popup menu.
*  In the tab :guilabel:`General` click the **[Create Spatial Index]** button.

.. _vector_shape_problem_loading:

Problem loading a shape .prj file
.................................

If you load a shapefile with :file:`.prj` file and |qg| is not able to read
the coordinate reference system from that file, you have to define the
proper projection manually within the :guilabel:`General` tab of the
:guilabel:`Layer Properties` dialog of the layer.
This is due to the fact, that :file:`.prj` files often do not provide the
complete projection parameters, as used in |qg| and listed in the
:guilabel:`CRS` dialog.

For that reason, if you create a new shapefile with |qg|, two different
projection files are created. A :file:`.prj` file with limited projection
parameters, compatible with ESRI software, and a :file:`.qpj` file,
providing the complete parameters of the used CRS. Whenever |qg| finds
a :file:`.qpj` file, it will be used instead of the :file:`.prj`.

.. index:: MapInfo

.. _vector_loading_mapinfo:

Loading a MapInfo Layer
-----------------------

|mActionAddNonDbLayer| To load a MapInfo layer, click on the |mActionAddNonDbLayer|
:sup:`Add Vector Layer` toolbar button or type :kbd:`Ctrl+Shift+V`, change the
file type filter :guilabel:`Filter` |selectstring|: to 'Mapinfo File [OGR]' and
select the MapInfo layer you want to load.

.. index:: ArcInfo_Binary_Coverage, Tiger_Format, UK_National_Transfer_Format
.. index:: US_Census_Bureau

.. _vector_loading_arcinfo_coverage:

Loading an ArcInfo Binary Coverage
----------------------------------

|mActionAddNonDbLayer| To load an ArcInfo binary coverage, click on the |mActionAddNonDbLayer|
:sup:`Add Vector Layer` toolbar button or press :kbd:`Ctrl+Shift+V` to open the
:guilabel:`Add Vector Layer` dialog. Select |radiobuttonon| :guilabel:`Directory`.
Change to :guilabel:`Filter` |selectstring| to 'Arc/Info Binary Coverage'.
Navigate to the directory that contains the coverage files and select it.

Similarly, you can load directory based vector files in the UK National Transfer
Format as well as the raw TIGER Format of the US Census Bureau.

.. index:: PostGIS, PostgreSQL

.. _label_postgis:

PostGIS Layers
--------------

PostGIS layers are stored in a PostgreSQL database. The advantages of PostGIS are
the spatial indexing, filtering and query capabilities it provides. Using PostGIS,
vector functions such as select and identify work more accurately than with OGR
layers in |qg|.

.. index:: Connection_Manager

.. _vector_create_stored_connection:

Creating a stored Connection
............................

|mActionAddLayer| The first time you use a PostGIS data source, you must create
a connection to the PostgreSQL database that contains the data. Begin by clicking
on the |mActionAddLayer| :sup:`Add PostGIS Layer` toolbar button, selecting the
|mActionAddLayer| :menuselection:`Add PostGIS Layer...` option from the
:menuselection:`Layer` menu or typing :kbd:`Ctrl+Shift+D`. You can also open the
:guilabel:`Add Vector Layer` dialog and select |radiobuttonon| :guilabel:`Database`.
The :guilabel:`Add PostGIS Table(s)` dialog will be displayed. To access the
connection manager, click on the **[New]** button to display the
:guilabel:`Create a New PostGIS Connection` dialog. The parameters required for
a connection are:

* **Name**: A name for this connection. Can be the same as *Database*
* **Service**: Service parameter to be used alternatively to hostname/port (and
  potentially database). This can be defined in :file:`pg_service.conf`
* **Host**: Name of the database host. This must be a resolvable host name the
  same as would be used to open a telnet connection or ping the host. If the
  database is on the same computer as |qg|, simply enter *'localhost'* here.
* **Port**: Port number the PostgreSQL database server listens on. The default
  port is 5432.
* **Database**: Name of the database.
* **SSL mode**: How the SSL connection will be negotiated with the server. Note
  that massive speedups in PostGIS layer rendering can be achieved by disabling
  SSL in the connection editor. Following options are available:

  * disable: only try an unencrypted SSL connection
  * allow: try a non-SSL connection, if that fails, try an SSL connection
  * prefer (the default): try an SSL connection, if that fails, try a
    non-SSL connection;
  * require: only try an SSL connection.

* **Username**: User name used to login to the database.
* **Password**: Password used with *Username* to connect to the database.


Optional you can activate following checkboxes:

*  |checkbox| :guilabel:`Save Username`
*  |checkbox| :guilabel:`Save Password`
*  |checkbox| :guilabel:`Only look in the geometry_columns table`
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

   * |nix|, the settings are stored in your home directory in :file:`.qgis/`.
   * |win|, the settings are stored in the registry.

.. _vector_loading_postgis:

Loading a PostGIS Layer
.......................

|mActionAddLayer| Once you have one or more connections defined, you can load
layers from the PostgreSQL database. Of course this requires having data in
PostgreSQL. See Section :ref:`vector_import_data_in_postgis` for a discussion on
importing data into the database.

To load a layer from PostGIS, perform the following steps:

*  If the :guilabel:`Add PostGIS layers` dialog is not already open,
   click on the |mActionAddLayer| :sup:`Add PostGIS Layer` toolbar button.
*  Choose the connection from the drop-down list and click **[Connect]**.
*  Select or unselect |checkbox| :guilabel:`Also list tables with no geometry`
*  Optionally use some |checkbox| :guilabel:`Search Options` to define
   which features to load from the layer or use the **[Build query]** button
   to start the :guilabel:`Query builder` dialog.
*  Find the layer(s) you wish to add in the list of available layers.
*  Select it by clicking on it. You can select multiple layers by holding
   down the :kbd:`Shift` key while clicking. See Section
   :ref:`vector_query_builder` for information on using the PostgreSQL
   Query Builder to further define the layer.
*  Click on the **[Add]** button to add the layer to the map.

.. _tip_postgis_layers:

.. tip:: **PostGIS Layers**

   Normally a PostGIS layer is defined by an entry in the geometry_columns
   table. From version 0.9.0 on, |qg| can load layers that do not have an
   entry in the geometry_columns table. This includes both tables and views.
   Defining a spatial view provides a powerful means to visualize your data.
   Refer to your PostgreSQL manual for information on creating views.

.. _sec_postgis_details:

Some details about PostgreSQL layers
....................................

This section contains some details on how |qg| accesses PostgreSQL layers.
Most of the time |qg| should simply provide you with a list of database
tables that can be loaded, and load them on request. However, if you have
trouble loading a PostgreSQL table into |qg|, the information below may
help you understand any |qg| messages and give you direction on changing
the PostgreSQL table or view definition to allow |qg| to load it.

|qg| requires that PostgreSQL layers contain a column that can be used
as a unique key for the layer. For tables this usually means that the table
needs a primary key, or a column with a unique constraint on it. In |qg|,
this column needs to be of type int4 (an integer of size 4 bytes).
Alternatively the ctid column can be used as primary key. If a table lacks
these items, the oid column will be used instead. Performance will be
improved if the column is indexed (note that primary keys are automatically
indexed in PostgreSQL).

If the PostgreSQL layer is a view, the same requirement exists, but views
do not have primary keys or columns with unique constraints on them.
In this case |qg| will try to find a column in the view that is derived
from a suitable table column. It does this by parsing the view definition
SQL. However there are several aspects of SQL that |qg| ignores; these
include the use of table aliases and columns that are generated by SQL
functions.

If a suitable column cannot be found, |qg| will not load the layer.
If this occurs, the solution is to alter the view so that it does include
a suitable column (a type of int4 and either a primary key or with a
unique constraint, preferably indexed).

.. %FIXME: Add missing information
.. % When dealing with views, |qg| parses the view definition and

.. index:: shp2pgsql

.. _loading_postgis_data:

.. _vector_import_data_in_postgis:

Importing Data into PostgreSQL
------------------------------

Data can be imported into PostgreSQL/PostGIS using several tools, such as the SPIT
plugin or the command line tools shp2pgsql or ogr2ogr.

.. _spit_plugin:

SPIT Plugin
...........

|qg| comes with a core plugin named |spiticon| :sup:`SPIT` (Shapefile to
PostGIS Import Tool). SPIT can be used to load multiple shapefiles at
one time and includes support for schemas. See Section :ref:`label_spit` for
more information.

shp2pgsql
...........

PostGIS includes an utility called **shp2pgsql** that can be used to import
shapefiles into a PostGIS enabled database. For example, to import a
shapefile named :file:`lakes.shp` into a PostgreSQL database named
``gis_data``, use the following command:

::

  shp2pgsql -s 2964 lakes.shp lakes_new | psql gis_data

This creates a new layer named ``lakes_new`` in the ``gis_data`` database.
The new layer will have a spatial reference identifier (SRID) of 2964.
See Section :ref:`label_projections` for more information on spatial
reference systems and projections.

.. index:: pgsql2shp

.. _tip_export_from_postgis:

.. tip:: **Exporting datasets from PostGIS**

   Like the import-tool **shp2pgsql** there is also a tool to export
   PostGIS-datasets as shapefiles: **pgsql2shp**. This is shipped within
   your PostGIS distribution.



.. index:: ogr2ogr

ogr2ogr
.......

Beside **shp2pgsql** and **SPIT** there is another tool for feeding geodata
in PostGIS: **ogr2ogr**. This is part of your GDAL installation.

To import a shapefile into PostGIS, do the following:
::

  ogr2ogr -f "PostgreSQL" PG:"dbname=postgis host=myhost.de user=postgres \
  password=topsecret" alaska.shp


This will import the shapefile :file:`alaska.shp` into the PostGIS-database
*postgis* using the user *postgres* with the password *topsecret* on host
server *myhost.de*.

Note that OGR must be built with PostgreSQL to support PostGIS.
You can see this by typing
::

  ogrinfo --formats | grep -i post


If you like to use PostgreSQL's **COPY** \ -command instead of the default
**INSERT INTO** method you can export the following environment-variable
(at least available on |nix| and |osx|):
::


  export PG_USE_COPY=YES


**ogr2ogr** does not create spatial indexes like **shp2pgsl** does. You
need to create them manually using the normal SQL-command **CREATE INDEX**
afterwards as an extra step (as described in the next section
:ref:`vector_improving_performance`).

.. _label_improve:

.. _vector_improving_performance:

Improving Performance
.....................

Retrieving features from a PostgreSQL database can be time consuming, especially
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
-----------------------------------------------

Many GIS packages don't wrap vector maps, with a geographic reference system
(lat/lon), :index:`crossing the 180 degrees longitude line`
(http://postgis.refractions.net/documentation/manual-1.4/ST\_Shift\_Longitude.html).
As result, if we open such map in |qg|, we will see two far, distinct locations,
that should show near each other. In Figure_vector_4_ the tiny point on the far
left of the map canvas (Chatham Islands), should be within the grid, right of
New Zealand main islands.

.. _figure_vector_4:

.. only:: html

   **Figure Vector 4:**

.. figure:: /static/user_manual/working_with_vector/vectorNotWrapping.png
   :width: 30em
   :align: center

   Map in lat/lon crossing the 180 |degrees| longitude line |nix|


A workaround is to transform the longitude values using PostGIS and the
**ST_Shift_Longitude** function  This function reads every point/vertex in every
component of every feature in a geometry, and if the longitude coordinate is
< 0 |degrees| adds 360 |degrees| to it. The result would be a 0 |degrees| - 360 |degrees|
version of the data to be plotted in a 180 |degrees| centric map.


.. _figure_vector_5:

.. only:: html

   **Figure Vector 5:**

.. figure:: /static/user_manual/working_with_vector/vectorWrapping.png
   :width: 30em
   :align: center

   Crossing 180 |degrees| longitude applying the **ST_Shift_Longitude**
   function |nix|

Usage
.....

*  Import data to PostGIS (:ref:`vector_import_data_in_postgis`) using
   for example the PostGIS Manager plugin or the SPIT plugin
*  Use the PostGIS command line interface to issue the following command
   (this is an example where "TABLE" is the actual name of your PostGIS table)

   ``gis_data=# update TABLE set the_geom=ST_Shift_Longitude(the_geom);``
*  If everything went right you should receive a confirmation about the
   number of features that were updated, then you'll be able to load the
   map and see the difference (Figure_vector_5_)

.. index:: Spatialite, SQLite

.. _label_spatialite:

SpatiaLite Layers
-----------------

|mActionAddSpatiaLiteLayer| The first time you load data from a SpatiaLite
database, begin by clicking on the |mActionAddSpatiaLiteLayer|
:sup:`Add SpatiaLite Layer` toolbar button or by selecting the
|mActionAddSpatiaLiteLayer| :menuselection:`Add SpatiaLite Layer...` option
from the :menuselection:`Layer` menu or by typing :kbd:`Ctrl+Shift+L`.
This will bring up a window, which will allow you to either connect to a
SpatiaLite database already known to |qg|, which you can choose from the
dropdown menu or to define a new connection to a new database. To define a
new connection, click on **[New]** and use the file browser to point to
your SpatiaLite database, which is a file with a :file:`.sqlite` extension.

If you want to save a vector layer to SpatiaLite format you can do this by
right clicking the layer in the legend. Then click on :menuselection:`Save as..`,
define the name of the output file, select 'SpatiaLite' as format and the CRS.
Also you can select 'SQLite' as format, and then add ``SPATIALITE=YES`` in the
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

   For SpatiaLite data management you can also use several Python plugins:
   QSpatiaLite, SpatiaLite Manager or DB Manager (core plugin, recommended). They
   can be downloaded and installed with the Plugin Installer.

.. _label_mssql:

MSSQL Spatial Layers
--------------------

|mActionAddMssqlLayer| QGIS also provides native MS SQL 2008 support. The
|mActionAddMssqlLayer| :sup:`Add MSSQL Spatial Layer` is part of the new toolbar
button or available in the MS SQL node in the QBrowser tree, providing drag and
drop import support.


ORACLE Spatial Layers
--------------------

|mActionAddOracleLayer| QGIS also provides native ORACLE Spatial support. The
|mActionAddOracleLayer| :sup:`Add ORACLE Spatial Layer` is part of the new toolbar
button or available in the ORACLE node in the QBrowser tree, providing drag and
drop import support. 
