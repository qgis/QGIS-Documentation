.. Purpose: This chapter aims to present the Browser panel in
.. all its glory.

.. index:: Browser panel
.. _`label_browserpanel`:

The Browser panel
======================================================================


.. contents::
   :local:
   :depth: 2

The QGIS Browser panel is a great tool for browsing, searching,
inspecting, copying and loading QGIS resources.
Only resources that QGIS knows how to handle are shown in the
browser.

Using the Browser panel you can locate, inspect and add data, as
described in :ref:`browser_panel`.
In addition, the Browser panel supports drag and drop of many QGIS
resources, such as project files, Python scripts, Processing scripts and 
Processing models.

Python scripts, Processing scripts and Processing models can also be opened for 
editing in an external editor and the graphical modeller.

You can drag and drop layers from the :guilabel:`Layers` panel
to the :guilabel:`Browser` panel, for instance into a GeoPackage or a
PostgreSQL database.

.. _figure_browser_panel:

.. figure:: img/browser_panel.png
   :align: center
   :width: 30%

   The Browser panel

The browser panel (:numref:`figure_browser_panel`) is organised
as an expandable hierarchy with some fixed top-level entries that
organise the resources handled by the browser.
Node entries are expanded by clicking on |browserExpand| to the left
of the entry name.
A branch is collapsed by clicking on |browserCollapse|.
The |collapseTree| :sup:`Collapse All` button collapses all top-level
entries.

In :menuselection:`Settings --> Interface Customization` it is
possible to disable resources.
If you, for instance, would not like to show Python scripts in the
browser, you can uncheck the :menuselection:`Browser --> py` entry,
and if you want to get rid of your home folder in the browser, you
can uncheck the :menuselection:`Browser --> special:Home` entry.

A filter (|filterMap| :sup:`Filter Browser`) can be used for searching
based on entry names (both leaf entries and node entries in the
hierarchy).
Using the |options| :sup:`Options` pull-down menu next to the filter
text field, you can

* toggle :guilabel:`Case Sensitive` search
* set the :guilabel:`Filter pattern syntax` to one of

  * :guilabel:`Normal`
  * :guilabel:`Wildcard(s)`
  * :guilabel:`Regular Expressions`

The *Properties widget*, showing useful information about some
entries / resources, can be enabled / disabled using the |metadata|
:sup:`Enable/disable properties widget` button.
When enabled, it opens at the bottom of the browser panel, as shown in
:numref:`figure_properties_widget`.

.. _figure_properties_widget:

.. figure:: img/browser_p_properties_w.png
   :align: center
   :width: 30%

   The properties widget

A second browser panel can be opened by activating the
:guilabel:`Browser (2)` panel in :menuselection:`View --> Panels`.
Having two browser panels can be useful when copying layers between
resources that are locationed deep down in different branches of the
browser hierarchy.


Resources that can be opened / run from the Browser
----------------------------------------------------------------------

A lot can be accomplished in the Browser panel

* Add vector, raster and mesh layers to your map by double-clicking,
  dragging onto the map canvas or clicking the |addLayer|
  :sup:`Add Selected Layers` button (after selecting layers)
* Run Python scripts (including Processing algorithms) by
  double-clicking or dragging onto the map canvas
* Run models by double-clicking or dragging onto the map canvas
* :guilabel:`Extract Symbols...` from QGIS Project files using the
  context menu
* Open files with their default applications
  (:guilabel:`Open <file type> Externally...` in the context menu).
  Examples: HTML files, spreadsheets, images, PDFs, text files, ...
* Copy entries
* Rename and delete (multiple) layers (context menu: :menuselection:`Manage -->`)
* Open a file explorer window and directly select the file 
  :guilabel:`Show in Files`

Resource specific actions are listed for the different resource groups
sorted under the top-level entries listed below.


Browser panel top-level entries
----------------------------------------------------------------------

Favorites
......................................................................
Often used file system locations can be tagged as favorites.
The ones you have tagged will appear here.

In addition to the operations described under *Home*, the
context menu allows you to :guilabel:`Rename Favorite...` and
:guilabel:`Remove Favorite`.


Spatial Bookmarks
......................................................................

This is where you will find your :ref:`spatial bookmarks <sec_bookmarks>`,
divided into :guilabel:`Project Bookmarks` and :guilabel:`User Bookmarks`.

.. table:: available actions for spatial bookmarks
   :class: longtable

   +----------------------------------+-----------------------------------------------+
   | Level                            | Contextual menu                               |
   +==================================+===============================================+
   | :guilabel:`Spatial Bookmarks`    | :guilabel:`New Spatial Bookmark…`             |
   |                                  +-----------------------------------------------+
   |                                  | :guilabel:`Show the Spatial Bookmark Manager` |
   |                                  +-----------------------------------------------+
   |                                  | :guilabel:`Import Spatial Bookmarks…`         |
   |                                  +-----------------------------------------------+
   |                                  | :guilabel:`Export Spatial Bookmarks…`         |
   +----------------------------------+-----------------------------------------------+
   | Bookmark group                   | :guilabel:`New Spatial Bookmark…`             |
   |                                  +-----------------------------------------------+
   | (:guilabel:`Project Bookmarks`   | :guilabel:`Import Spatial Bookmarks…`         |
   | and :guilabel:`User Bookmarks`)  +-----------------------------------------------+
   |                                  | :guilabel:`Export Spatial Bookmarks…`         |
   +----------------------------------+-----------------------------------------------+
   | Individual bookmark              | :guilabel:`Zoom to Bookmark`                  |
   |                                  +-----------------------------------------------+
   |                                  | :guilabel:`Edit Spatial Bookmark…`            |
   |                                  +-----------------------------------------------+
   |                                  | :guilabel:`Delete Spatial Bookmark`           |
   +----------------------------------+-----------------------------------------------+


Project Home
............

Available once the project file has been saved, the :guilabel:`Project home`
entry is a folder containing data and other contents (scripts, models, text, ...)
that may be used within the current project.
Displayed in the :guilabel:`Browser` panel, it allows you to quickly
access data and other files of the project.

It defaults to the project file folder but can be changed through the
:menuselection:`Project --> Properties... --> General --> Project home` option,
or by right-clicking on the :guilabel:`Project Home` item of the Browser panel
and selecting :guilabel:`Set project home...`.
Customizing that folder is especially useful in contexts where QGIS projects
are not stored in the root folder of an organisational 'project', along with datasets.


Drives and file system
......................

The next items of the :guilabel:`Browser` panel depend on the OS in use
and concern the top level entries of its file system.

They are mainly:

* The :guilabel:`Home` folder, pointing to the current user home folder
* on Unix-based machines, the root :guilabel:`/` folder
* the connected drives, either local or network. Depending on the OS,
  they are directly listed (eg, ``C:\``, ``D:\``) or through the ``/Volumes``
  entry.

From the contextual menu of each of these folders or drives, you can:

* refresh the contents
* create a :menuselection:`New -->` subitem that is a :guilabel:`Directory`,
  :guilabel:`GeoPackage` or ESRI :guilabel:`Shapefile` format dataset
* hide the directory (:guilabel:`Hide from Browser`)
* :guilabel:`Set color`: customize the folder icon color, aiding in rapid
  browser navigation of complex folder structures
* enable :guilabel:`Scanning`:

  * |checkbox| :guilabel:`Monitor for changes`: allows to manually control
    whether a particular directory should be monitored and automatically updated.
    This setting applies to the selected directory and all subdirectories.
    This means that you can manually opt-in to monitoring of network drives
    if you know there's no issue, or manually opt-out of monitoring of large
    directories which you don't want monitored for other reasons.
    By default, remote or network drives are not automatically monitored.
  * |unchecked| :guilabel:`Fast scan this directory`
* open the directory in your file manager (:guilabel:`Open Directory...`)
* open the directory in a terminal window  (:guilabel:`Open in Terminal...`)
* inspect the :guilabel:`Properties...` or the parent :guilabel:`Directory
  Properties...`


Data type
.........

.. table:: Available actions for plain layer files
   :widths: 32, 17, 17, 17, 17
   :class: longtable

   +----------------------------------------------+--------------------------------------------------------------------------------------------------------------+
   | Level and Context menu                       | Types of layers                                                                                              |
   |                                              +-----------------------------+-----------------------------+------------------------------+-------------------+
   |                                              | |addRasterLayer|            | |addOgrLayer|               | |addPointCloudLayer|         | |addMeshLayer|    |
   |                                              | Raster                      | Vector                      | Point clouds                 | Mesh              |
   |                                              |                             |                             |                              |                   |
   |                                              | (:ref:`Reference            | (:ref:`Reference            | (:ref:`Reference             | (:ref:`Reference  |
   |                                              | <raster_properties_dialog>`)| <vector_properties_dialog>`)| <working_with_point_clouds>`)| <label_meshdata>`)|
   +==============================================+=============================+=============================+==============================+===================+
   | **File**                                                                                                                                                    |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Delete File <dataset name>`       | |checkbox|                  | |checkbox|                  |                              |                   |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Show in Files`                    | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :menuselection:`Manage`                      | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`File Properties…`                 | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Open <file type> Externally…`     | |checkbox|                  |                             |                              |                   |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | **Layer**                                                                                                                                                   |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Add Layer to Project`             | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :menuselection:`Export Layer`                | |checkbox|                  | |checkbox|                  |                              |                   |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Layer Properties…`                | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Open with Data Source Manager…`   | |checkbox|                  | |checkbox|                  |                              |                   |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Execute SQL…`                     |                             | |checkbox|                  |                              |                   |
   +----------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+

.. _database_entries:

Database entries
.................

Depending on your OS and installed drivers, you might have access to different database
types to use in QGIS. Below are listed the different entries of contextual menu at
each level of the dataset tree.

.. You might want to use https://www.tablesgenerator.com/text_tables (Text tab) to update the next table.
    Particularly useful if you need to add, resize or move columns


.. table:: Available actions for database entries
   :widths: 27, 15, 13, 15, 10, 10, 10
   :class: longtable

   +--------------------------------------------+------------------------------------------------------------------------------------+
   | Level and Context menu                     |                                  Type of database                                  |
   |                                            +--------------+--------------+------------+------------+---------------+------------+
   |                                            | |geoPackage| | |spatialite| | |postgis|  | |hana|     | |mssql|       | |oracle|   |
   |                                            |              |              |            |            |               |            |
   |                                            | GeoPackage   | SpatiaLite   | PostgreSQL | SAP HANA   | MS SQL Server | Oracle     |
   |                                            | ([1]_)       |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | **Top menu**                                                                                                                    |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | Create a :guilabel:`New Connection…`       | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    | |checkbox| |
   | to an existing database                    |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Create Database…`               | |checkbox|   | |checkbox|   |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Create Database and Layer…`     | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Save Connections…` details      |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
   | to a file                                  |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Load Connections…`              |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | **Connection / Database**                                                                                                       |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Refresh` a connection           |              |              | |checkbox| | |checkbox| | |checkbox|    | |checkbox| |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Edit Connection…` settings      |              |              | |checkbox| | |checkbox| | |checkbox|    | |checkbox| |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Duplicate Connection`           |              |              | |checkbox| | |checkbox| | |checkbox|    | |checkbox| |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Remove Connection…`             | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    | |checkbox| |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Import Vector Layer…`           | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`New Field Domain -->       |              |              |            |            |               |            |
   | New Range Domain`                          | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`New Field Domain -->       |              |              |            |            |               |            |
   | New Coded Values Domain`                   | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`New Field Domain -->       |              |              |            |            |               |            |
   | New Glob Domain`                           | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Delete <database_name>`         | |checkbox|   | |checkbox|   |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Compact Database (VACUUM)`      | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | Create a :guilabel:`New Schema…`           |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | Create a :guilabel:`New Table…`            | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Execute SQL…` query             | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | **Schema**                                                                                                                      |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Refresh` a schema               |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Schema Operations -->      |              |              |            |            |               |            |
   | Rename Schema…`                            |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Schema Operations -->      |              |              |            |            |               |            |
   | Delete Schema…`                            |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | Create a :guilabel:`New Table…`            |              |              | |checkbox| | |checkbox| |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Execute SQL…` query             |              |              | |checkbox| | |checkbox| |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | **Table / Layer**                                                                                                               |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Table Operations -->       |              |              |            |            |               |            |
   | Rename Table…`                             |              |              | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Table Operations -->       |              |              |            |            |               |            |
   | Truncate Table…`                           |              |              | |checkbox| |            | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Execute SQL…` query             | |checkbox|   | |checkbox|   | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Export Layer --> To file…` | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Manage -->                 |              |              |            |            |               |            |
   | Rename Layer <layer_name>…`                | |checkbox|   | |checkbox|   |            |            | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Manage -->                 |              |              |            |            |               |            |
   | Delete Layer <layer_name>…`                | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Manage -->                 | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
   | Delete Selected Layers`                    |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Manage -->                 | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
   | Add Layer to Project`                      |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Manage -->                 | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
   | Add Selected Layers to Project`            |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Manage -->                 |              |              | |checkbox| |            | |checkbox|    |            |
   | Move to Another Schema`                    |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | Open :guilabel:`Layer Properties…` dialog  | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | Open :guilabel:`File Properties…` dialog   | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Open with Data Source Manager`  | |checkbox|   | |checkbox|   |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | **Fields**                                                                                                                      |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Add New Field…`                 | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | **Field**                                                                                                                       |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Set Field Domain`               | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Rename Field` ([2]_)            | |checkbox|   |              | |checkbox| |            ||checkbox|     |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Set Alias…`                     | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Set Comment…`                   | |checkbox|   |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Delete Field…`                  | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+

.. [1] The different entries may also be available for some GDAL supported
 `vector file formats <https://gdal.org/en/latest/drivers/vector/index.html>`_
 such as ESRI File Geodatabase, FlatGeobuf, GeoParquet, NetCDF, ... when compatible.
.. [2] For PostgreSQL connections: only supported with ALTER TABLE privilege.

.. note::

  When loading vector layers into QGIS, fields with |sourceFields| :guilabel:`Field Domains`
  (such as those defined in a GeoPackage or ESRI File Geodatabase) are automatically
  detected. These domains are database-level constraints, meaning they are enforced
  by the database itself and apply across different applications, not just QGIS.

Importing vector layers into databases using Browser panel
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

QGIS allows you to import vector layers directly into a database from the :guilabel:`Browser` panel.
This provides a simple way to transfer datasets into supported database
formats without using |dbManager| :sup:`DB Manager` (see :ref:`dbmanager`).

You can start the import in two ways:

* Drag and drop a single vector layer from the Browser panel or from the Project into
  a database connection or schema item.
* Right-click on a database connection or schema item and choose :guilabel:`Import Vector Layer...`
  from the context menu.

.. note:: When multiple layers are dragged into a database, they are imported immediately
   without further options. All imports run in the background, so the QGIS interface remains responsive
   during the process.

.. _figure_importvector_dialog:

.. figure:: img/importvector_dialog.png
   :align: center

   Import Vector Layer dialog

To add a layer using :guilabel:`Import Vector Layer...` follow these steps:

#. Add :guilabel:`Source layer`: the layer to import, chosen from the current QGIS project.
   To import only selected features of the source layer use the |checkbox| :guilabel:`Selected features only` option.
#. Set the :guilabel:`Table name`: the name of the destination table in the database.
   By default, it is taken from the source layer name but can be modified.
   You can also use the |checkbox| :guilabel:`Replace destination table (if exists)`
   to overwrite an existing table.
#. Define the :guilabel:`Output CRS`: the coordinate reference system of the
   destination table. By default, it is the CRS of the source layer, but it can
   be changed using the :ref:`CRS selector <crs_selector>`.
#. Configure the :guilabel:`Attributes`:
   
   * :guilabel:`Source expression`: expression used to populate the field. By default,
     this corresponds to the original source field.
   * :guilabel:`Name`: name of the field in the destination table.
   * :guilabel:`Type`: field data type (integer, text, real, etc.).
   * :guilabel:`Length` and :guilabel:`Precision`: length and precision of the field,
     where applicable.
   * :guilabel:`Constraints`: rules to enforce on the field values (e.g. NOT NULL, UNIQUE, DEFAULT).
     Support depends on the destination database.
   * :guilabel:`Alias`: an alternate display name for the field.
   * :guilabel:`Comment`: a description or note attached to the field.

   You can use buttons on the right side to:

   * |newAttribute| :sup:`Add new field` to add a new field to the destination table.
   * |deleteAttribute| :sup:`Delete selected field` to remove a field from the destination table.
   * |arrowUp| :sup:`Move selected field up` or |arrowDown| :sup:`Move selected field down` to reorder fields.
   * |clearText| :sup:`Reset all fields` to clear all fields and start from scratch.
   * |settings| :sup:`Convert All Fields To Lowercase` or |settings| :sup:`Convert All Fields To Uppercase`,
     to change the case of all field names.

#. Optionally, apply a spatial filter with :ref:`Filter by Extent <extent_selector>`. This restricts
   the import to features within a defined bounding box.

#. Optionally, apply an attribute filter with :ref:`Feature filter <expression_builder>`.
   This allows you to use an expression to select which features are imported.


Tiles and Web Services
......................

.. table:: Available actions for web services (1)
   :widths: 30, 14, 14, 14, 14, 14
   :class: longtable

   +--------------------------------------------------------------+-------------------------------------------------------------------------------------------------+
   | Level and Context menu                                       |                                         Type of services                                        |
   |                                                              +---------------------+------------------+------------------+------------------+------------------+
   |                                                              | |wms|               | |xyz|            | |wcs|            | |wfs|            | |afs|            |
   |                                                              |                     |                  |                  |                  |                  |
   |                                                              | WMS / WMTS          | XYZ Tiles        | WCS              | WFS / OGC        | ArcGIS REST      |
   |                                                              |                     |                  |                  | API - Features   | Servers          |
   |                                                              |                     |                  |                  |                  |                  |
   |                                                              | (:ref:`Reference    | (:ref:`Reference | (:ref:`Reference | (:ref:`Reference | (:ref:`Reference |
   |                                                              | <ogc-wms-servers>`) | <xyz_tile>`)     | <ogc-wcs>`)      | <ogc-wfs>`)      | <arcgis_rest>`)  |
   +==============================================================+=====================+==================+==================+==================+==================+
   | **Top menu**                                                                                                                                                   |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | Create a :guilabel:`New Connection…`                         | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Save Connections…` details to a file              | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Load Connections…`                                | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | **Connection**                                                                                                                                                 |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Refresh` connection                               | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Edit Connection…` settings                        | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Duplicate Connection`                             | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Remove Connection…`                               | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`View Service Info` in Web browser                 |                     |                  |                  |                  | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | **Table / Layer**                                                                                                                                              |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :menuselection:`Export Layer --> To File…`                   | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Add Layer to Project`                             | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Add Filtered Layer to Project…`                   |                     |                  |                  |                  | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | Open :guilabel:`Layer properties…` dialog                    | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`View Service Info` in Web browser                 |                     |                  |                  |                  | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+

.. table:: Available actions for web services (2)
   :widths: 30, 14, 14, 14, 14, 14
   :class: longtable

   +--------------------------------------------------------------+------------------------------------------------------------------------------------------------------+
   | Level and Context menu                                       | Type of services                                                                                     |
   |                                                              +-------------------+-------------------+-----------------------+-------------------+------------------+
   |                                                              | |vectorTileLayer| | |tiledSceneLayer| | |cloud|               | |sensor|          | |stac|           |
   |                                                              |                   |                   |                       |                   |                  |
   |                                                              | Vector Tiles      | Scene             | Cloud                 | SensorThings      | STAC             |
   |                                                              |                   |                   |                       |                   |                  |
   |                                                              | (:ref:`Reference  | (:ref:`Reference  | (:ref:`Reference      | (:ref:`Reference  | (:ref:`Reference |
   |                                                              | <vector_tiles>`)  | <3d_tiles>`)      | <cloud_connections>`) | <sensor_things>`) | <stac>`)         |
   +==============================================================+===================+===================+=======================+===================+==================+
   | **Top menu**                                                                                                                                                        |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | Create a :guilabel:`New Connection…`                         |                   | |checkbox|        | |checkbox|            | |checkbox|        | |checkbox|       |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | Create a :guilabel:`New Generic Connection…`                 | |checkbox|        |                   |                       |                   |                  |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | Create a :guilabel:`New ArcGIS Vector Tile Service           | |checkbox|        |                   |                       |                   |                  |
   | Connection…`                                                 |                   |                   |                       |                   |                  |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Save Connections…` details  to a file             | |checkbox|        | |checkbox|        | |checkbox|            | |checkbox|        | |checkbox|       |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Load Connections…`                                | |checkbox|        | |checkbox|        | |checkbox|            | |checkbox|        | |checkbox|       |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | **Connection**                                                                                                                                                      |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Edit Connection…` settings                        | |checkbox|        | |checkbox|        | |checkbox|            | |checkbox|        | |checkbox|       |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Duplicate Connection`                             | |checkbox|        | |checkbox|        | |checkbox|            | |checkbox|        |                  |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Delete Connection…`                               | |checkbox|        | |checkbox|        | |checkbox|            | |checkbox|        | |checkbox|       |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Refresh`                                          |                   |                   |                       |                   | |checkbox|       |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Details…`                                         |                   |                   |                       |                   | |checkbox|       |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | **Table / Layer**                                                                                                                                                   |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :menuselection:`Export Layer --> To File…`                   |                   |                   |                       | |checkbox|        |                  |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Add Layer to Project`                             | |checkbox|        | |checkbox|        |                       | |checkbox|        |                  |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | Open :guilabel:`Layer properties…` dialog                    | |checkbox|        | |checkbox|        |                       | |checkbox|        |                  |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Refresh`                                          |                   |                   |                       |                   | |checkbox|       |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Download assets…`                                 |                   |                   |                       |                   | |checkbox|       |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+
   | :guilabel:`Details…`                                         |                   |                   |                       |                   | |checkbox|       |
   +--------------------------------------------------------------+-------------------+-------------------+-----------------------+-------------------+------------------+

Project and supported file types
................................

.. table:: Available actions for various supported files
   :class: longtable

  +--------------------------+------------------------------------------------------------+
  | File type                | Context menu                                               |
  +==========================+============================================================+
  | QGIS Project file        | :menuselection:`Open Project`                              |
  | (.qgz, .qgs)             +------------------------------------------------------------+
  |                          | :menuselection:`Extract Symbols…`                          |
  |                          | (opens Style Manager to export symbols to XML,             |
  |                          | add to default style, or export as PNG/SVG)                |
  |                          +------------------------------------------------------------+
  |                          | :menuselection:`File Properties…`                          |
  +--------------------------+------------------------------------------------------------+
  | QGIS Layer Definition    | :menuselection:`Export Layer --> To File…`                 |
  | (.qlr)                   +------------------------------------------------------------+
  |                          | :menuselection:`Add Layer to Project`                      |
  |                          +------------------------------------------------------------+
  |                          | :menuselection:`Layer Properties…`                         |
  +--------------------------+------------------------------------------------------------+
  | Processing Model         | :menuselection:`Run Model…`                                |
  | (.model3)                +------------------------------------------------------------+
  |                          | :menuselection:`Edit Model…`                               |
  +--------------------------+------------------------------------------------------------+
  | Print Composer Template  | :menuselection:`New Layout from Template`                  |
  | (.qpt)                   |                                                            |
  +--------------------------+------------------------------------------------------------+
  | Python script            | :menuselection:`Run Script…`                               |
  | (.py)                    +------------------------------------------------------------+
  |                          | :menuselection:`Open in External Editor`                   |
  +--------------------------+------------------------------------------------------------+


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addLayer| image:: /static/common/mActionAddLayer.png
   :width: 1.5em
.. |addMeshLayer| image:: /static/common/mActionAddMeshLayer.png
   :width: 1.5em
.. |addOgrLayer| image:: /static/common/mActionAddOgrLayer.png
   :width: 1.5em
.. |addPointCloudLayer| image:: /static/common/mActionAddPointCloudLayer.png
   :width: 1.5em
.. |addRasterLayer| image:: /static/common/mActionAddRasterLayer.png
   :width: 1.5em
.. |afs| image:: /static/common/mIconAfs.png
   :width: 1.5em
.. |arrowDown| image:: /static/common/mActionArrowDown.png
   :width: 1.5em
.. |arrowUp| image:: /static/common/mActionArrowUp.png
   :width: 1.5em
.. |browserCollapse| image:: /static/common/browser_collapse.png
   :width: 1.5em
.. |browserExpand| image:: /static/common/browser_expand.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |clearText| image:: /static/common/mIconClearText.png
   :width: 1.5em
.. |cloud| image:: /static/common/mIconCloud.png
   :width: 1.5em
.. |collapseTree| image:: /static/common/mActionCollapseTree.png
   :width: 1.5em
.. |dbManager| image:: /static/common/dbmanager.png
   :width: 1.5em
.. |deleteAttribute| image:: /static/common/mActionDeleteAttribute.png
   :width: 1.5em
.. |filterMap| image:: /static/common/mActionFilterMap.png
   :width: 1.5em
.. |geoPackage| image:: /static/common/mGeoPackage.png
   :width: 1.5em
.. |hana| image:: /static/common/mIconHana.png
   :width: 1.5em
.. |metadata| image:: /static/common/metadata.png
   :width: 1.5em
.. |mssql| image:: /static/common/mIconMssql.png
   :width: 1.5em
.. |newAttribute| image:: /static/common/mActionNewAttribute.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |oracle| image:: /static/common/mIconOracle.png
   :width: 1.5em
.. |postgis| image:: /static/common/mIconPostgis.png
   :width: 1.5em
.. |sensor| image:: /static/common/sensor.png
   :width: 1.5em
.. |settings| image:: /static/common/settings.png
   :width: 1.5em
.. |sourceFields| image:: /static/common/mSourceFields.png
   :width: 1.5em
.. |spatialite| image:: /static/common/mIconSpatialite.png
   :width: 1.5em
.. |stac| image:: /static/common/mIconStac.png
   :width: 1.5em
.. |tiledSceneLayer| image:: /static/common/mIconTiledSceneLayer.png
   :width: 1.5em
.. |unchecked| image:: /static/common/unchecked.png
   :width: 1.3em
.. |vectorTileLayer| image:: /static/common/mIconVectorTileLayer.png
   :width: 1.5em
.. |wcs| image:: /static/common/mIconWcs.png
   :width: 1.5em
.. |wfs| image:: /static/common/mIconWfs.png
   :width: 1.5em
.. |wms| image:: /static/common/mIconWms.png
   :width: 1.5em
.. |xyz| image:: /static/common/mIconXyz.png
   :width: 1.5em
