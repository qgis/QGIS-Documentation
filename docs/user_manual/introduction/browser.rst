.. Purpose: This chapter aims to present the Browser panel in
.. all its glory.

.. index:: Browser panel
.. _`label_browserpanel`:

*******************
 The Browser panel
*******************


.. contents::
   :local:



The QGIS :guilabel:`Browser` panel is a great tool for browsing, searching,
inspecting, copying and loading QGIS resources.
It is available as:

* a :guilabel:`Data Source Manager` tab, enabled pressing the
  |dataSourceManager| :sup:`Open Data Source Manager` button (:kbd:`Ctrl+L`);
* as a QGIS panel you can open from the menu :menuselection:`View --> Panels`
  (or |kde| :menuselection:`Settings --> Panels`) or by pressing :kbd:`Ctrl+2`.

.. _figure_browser_panel:

.. figure:: img/browser_panel.png
   :align: center
   :width: 30%

   The Browser panel


A second browser panel can be opened by activating the :guilabel:`Browser (2)` panel
in :menuselection:`View --> Panels`.
Having two browser panels can be useful when copying layers between resources
that are located deep down in different branches of the browser hierarchy.


Exploring the Interface
========================

The Toolbar
-----------

At the top of the :guilabel:`Browser` panel, you find some buttons that help you:

* |addLayer| :sup:`Add Selected Layers`: you can also add data to the map
  canvas by selecting **Add selected layer(s)** from the layer's context menu;
* |refresh| :sup:`Refresh` the browser tree;
* |filterMap| :sup:`Filter Browser` to search for specific data. Enter a search
  word or wildcard and the browser will filter the tree to only show paths to
  matching DB tables, filenames or folders.
  Using the |options| :sup:`Options` pull-down menu next to the filter text field,
  you can:

  * make the comparison :guilabel:`Case Sensitive` or not
  * set the :guilabel:`Filter pattern syntax` to one of:

    * :guilabel:`Normal`: show items containing the search text
    * :guilabel:`Wildcard(s)`: fine tune the search using the ``?`` and/or ``*``
      characters to specify the position of the search text
    * :guilabel:`Regular expression`: use full capabilities of regular expression
      to find specific data.

* |collapseTree| :sup:`Collapse All` the whole tree;
* |metadata| :sup:`Enable/disable properties widget`: when toggled on,
  a new widget is added at the bottom of the panel showing, if applicable,
  metadata for the selected item.

  .. _figure_properties_widget:

  .. figure:: img/browser_p_properties_w.png
     :align: center
     :width: 30%

     The properties widget

The Entries
------------

The main part of the :guilabel:`Browser` panel is organised as an expandable hierarchy
with some fixed top-level entries that organise the resources handled by the browser.
Node entries are expanded by clicking on |browserExpand| to the left of the entry name.
A branch is collapsed by clicking on |browserCollapse|.
The |collapseTree| :sup:`Collapse All` button collapses all top-level entries.
Top level entries include:

#. :guilabel:`Favorites` where you can place shortcuts to often used locations
#. :guilabel:`Spatial Bookmarks` where you can store often used map extents
   (see :ref:`sec_bookmarks`)
#. :guilabel:`Project Home`: for a quick access to the folder in which (most of)
   the data related to your project are stored.
   The default value is the directory where your project file resides.
#. :guilabel:`Home` directory in the file system and the filesystem root directory.
#. Connected local or network drives
#. Then comes a number of container / database types and service protocols,
   depending on your platform and underlying libraries:

   .. list-table:: Database and service entries in Browser panel
      :header-rows: 1
      :widths: 20 80
      :class: longtable

      * - Label
        - References
      * - |geoPackage| :guilabel:`GeoPackage`
        - :ref:`database_entries`, :ref:`vector_create_geopackage`
      * - |spatialite| :guilabel:`SpatiaLite`
        - :ref:`database_entries`, :ref:`vector_create_spatialite`, :ref:`label_spatialite`
      * - |postgis| :guilabel:`PostgreSQL`
        - :ref:`database_entries`, :ref:`create_postgresql_connection`
      * - |hana| :guilabel:`SAP HANA`
        - :ref:`database_entries`, :ref:`create_hana_connection`
      * - |stac| :guilabel:`STAC`
        - :ref:`tiles_web_services`, :ref:`stac`
      * - |mssql| :guilabel:`MS SQL Server`
        - :ref:`database_entries`, :ref:`create_ms_sql_server_connection`
      * - |oracle| :guilabel:`Oracle`
        - :ref:`database_entries`, :ref:`create_oracle_connection`
      * - |wms| :guilabel:`WMS/WMTS`
        - :ref:`tiles_web_services`, :ref:`ogc-wms`
      * - |cloud| :guilabel:`Cloud`
        - :ref:`tiles_web_services`, :ref:`cloud_connections`
      * - |tiledSceneLayer| :guilabel:`Scenes`
        - :ref:`tiles_web_services`, :ref:`3d_tiles`
      * - |sensor| :guilabel:`SensorThings`
        - :ref:`tiles_web_services`, :ref:`sensor_things`
      * - |vectorTileLayer| :guilabel:`Vector Tiles`
        - :ref:`tiles_web_services`, :ref:`vector_tiles`
      * - |xyz| :guilabel:`XYZ Tiles`
        - :ref:`tiles_web_services`, :ref:`xyz_tile`
      * - |wcs| :guilabel:`WCS`
        - :ref:`tiles_web_services`, :ref:`ogc-wcs`
      * - |wfs| :guilabel:`WFS/OGC API-Features`
        - :ref:`tiles_web_services`, :ref:`ogc-wfs`
      * - |afs| :guilabel:`ArcGIS REST Servers`
        - :ref:`tiles_web_services`, :ref:`arcgis_rest`


You can customize the list of displayed items by disabling some of them
in the :menuselection:`Settings --> Interface Customization` dialog.
If you, for instance, would not like to show Python scripts in the browser,
you can uncheck the :menuselection:`Browser --> py` entry,
and if you want to get rid of your home folder in the browser,
you can uncheck the :menuselection:`Browser --> special:Home` entry.
Read :ref:`sec_customization` for more details.


Browser panel top-level entries
================================

Many types of resources can be found in the :guilabel:`Browser` tree.
They can be GIS layers (vector, raster, mesh, point cloud, ...),
QGIS project files or templates, layer styles, bookmark extents,
Processing scripts and models, Python scripts, various file types (images, pdf, xml, ...).
The resources can be stored as plain files on disk, tables of database,
or served through a web service.
The :guilabel:`Browser` panel generally supports double-clicking those resources
or drag-and-dropping them across entries within the browser, between the browser
and the :guilabel:`Layers` panel and from the browser to the map canvas.
The result of the drag and drop depends on the type of resource and its destination;
it can load a layer or a project, copy a resource, execute a script or a model, ...

Most of the elements in the :guilabel:`Browser` panel also have actions
assigned through their contextual menu.
The actions vary depending on the item you right-clicked over.
Resource specific actions are listed for the different resource groups
sorted under the top-level entries listed below.


Favorites
----------

Often used file system locations can be tagged as favorites.
The ones you have tagged will appear here.

In addition to the operations described under common :ref:`folders and drives <drives_file_system>`,
the context menu allows you to :guilabel:`Rename Favorite…` and :guilabel:`Remove Favorite`.


Spatial Bookmarks
------------------

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
-------------

Available once the project file has been saved, the :guilabel:`Project home`
entry is a folder containing data and other contents (scripts, models, text, ...)
that may be used within the current project.
Displayed in the :guilabel:`Browser` panel, it allows you to quickly
access data and other files of the project.

It defaults to the project file folder but can be changed through the
:menuselection:`Project --> Properties… --> General --> Project home` option,
or by right-clicking on the :guilabel:`Project Home` item of the Browser panel
and selecting :guilabel:`Set project home…`.
Customizing that folder is especially useful in contexts where QGIS projects
are not stored in the root folder of an organisational 'project', along with datasets.

.. _drives_file_system:

Drives and file system
-----------------------

The next items of the :guilabel:`Browser` panel depend on the OS in use
and concern the top level entries of its file system.
They are mainly:

* The :guilabel:`Home` folder, pointing to the current user home folder
* on Unix-based machines, the root :guilabel:`/` folder
* the connected drives, either local or network.
  Depending on the OS, they are directly listed (e.g., ``C:\``, ``D:\``)
  or through the ``/Volumes`` entry.

From the contextual menu of each of these folders or drives, you can:

* :guilabel:`Refresh` the files and folders of the entry
* create a :menuselection:`New -->` subitem that is a :guilabel:`Directory…`,
  :guilabel:`GeoPackage…`, ESRI :guilabel:`Shapefile…` or
  :guilabel:`ESRI FileGeodatabase…` format dataset
* :guilabel:`Hide from Browser`: hides the selected directory or drive from the panel.
  The list of hidden folders can be found in :menuselection:`Settings --> Options -->
  Data sources --> Hidden folders` and the folders can be recovered individually.
  They also can be recovered from the contextual menu
  of their parent folder using the :menuselection:`Hidden Items -->` entry.
* :guilabel:`Set color…`: customize the folder icon color, aiding in rapid
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
* :guilabel:`Open Directory…`: opens the directory in your file manager
* :guilabel:`Open in Terminal…`: opens the directory in a terminal window
* inspect the :guilabel:`Properties…` or the parent :guilabel:`Directory Properties…`

.. note:: The abovementioned contextual menu items are also available
    from any directory in the browser, regardless of its location.

Under the directories, interaction with files may differ depending on
whether it is a QGIS project file, it is of a data format supported or not by QGIS,
it is a plain file or a data container, ...


Project files
..............

Project files can be dragged and dropped from the browser to the map canvas
to open the project or to a database (e.g., GeoPackage, PostgreSQL, ...) for storage.
Further operations can be done through their contextual menu:

* :guilabel:`Open project`
* :guilabel:`Extract symbols…`: opens the :ref:`Style manager <vector_style_manager>` dialog
  filled with all the symbols (marker, text, label, material, 3D symbol, ...).
  It is then possible to select items and :ref:`share them <share_symbols>` with other contexts.
* :menuselection:`Manage --> Rename <project_file>…`
* :menuselection:`Manage --> Delete <project_file>…`
* :guilabel:`Show in files`: Opens the folder containing the project file
  in the Operating System file explorer
* :guilabel:`File properties…`

Project files stored in directories can be expanded in the :guilabel:`Browser`panel,
showing the full layer tree (including groups) within that project.
Layers of a project can be loaded from the browser to the active project
through double-click or drag and drop to map canvas or :guilabel:`Layers` panel.
They can also be dropped onto a database and :ref:`imported within <import_vector_db_browser>`.
Their contextual menu allows to :menuselection:`Export Layer --> To File…`,
:guilabel:`Add Layer to Project` and preview :guilabel:`Layer Properties…`.

Layer files
............

For leaf entries that can act as layers in a QGIS project,
the contextual menu will present some of the following entries.

.. table:: Available actions for plain layer files
   :widths: 32, 17, 17, 17, 17
   :class: longtable

   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | Level and Contextual menu                          | Types of layers                                                                                              |
   |                                                    +-----------------------------+-----------------------------+------------------------------+-------------------+
   |                                                    | |addRasterLayer|            | |addOgrLayer|               | |addPointCloudLayer|         | |addMeshLayer|    |
   |                                                    | Raster                      | Vector                      | Point clouds                 | Mesh              |
   |                                                    |                             |                             |                              |                   |
   |                                                    | (:ref:`Reference            | (:ref:`Reference            | (:ref:`Reference             | (:ref:`Reference  |
   |                                                    | <raster_properties_dialog>`)| <vector_properties_dialog>`)| <working_with_point_clouds>`)| <label_meshdata>`)|
   +====================================================+=============================+=============================+==============================+===================+
   | :guilabel:`Open <file type> Externally…`           | |checkbox|                  | |checkbox|                  |                              |                   |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Execute SQL…`                           |                             | |checkbox|                  |                              |                   |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :menuselection:`Export Layer --> To File…`         | |checkbox|                  | |checkbox|                  |                              |                   |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Add Layer to Project`                   | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Add Selected Layers to Project`         | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Layer Properties…`                      | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Open with Data Source Manager…`         | |checkbox|                  | |checkbox|                  |                              |                   |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :menuselection:`Manage --> Rename <file_name>`     | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :menuselection:`Manage --> Delete <file_name>`     | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :menuselection:`Manage --> Delete Selected Files`  | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`Show in Files`                          | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+
   | :guilabel:`File Properties…`                       | |checkbox|                  | |checkbox|                  | |checkbox|                   | |checkbox|        |
   +----------------------------------------------------+-----------------------------+-----------------------------+------------------------------+-------------------+


Some notes about opening options:

* :guilabel:`Open <file type> Externally…` allows to open files
  (HTML files, spreadsheets, images, PDFs, text files, ...) with their default applications
* Use :guilabel:`Open with Data Source Manager…` to directly open and configure the data source
  in the :guilabel:`Data Source Manager` using the URI of your data source.
  This simplifies the process of adding a layer from the Browser by allowing you
  to set specific opening options for the data source.
  It is currently available for vector (including the dedicated GeoPackage entry),
  raster, and SpatiaLite data sources.

Other specific supported file types
....................................

.. table:: Available actions for various supported files
   :class: longtable

   +--------------------------+------------------------------------------------------------+
   | File type                | Context menu                                               |
   +==========================+============================================================+
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


.. _metadata_browser:

Properties of Browser items
...........................

For files and directories in the :guilabel:`Browser` panel,
dedicated :guilabel:`File properties…` and :guilabel:`Directory properties…` tools
in their contextual menu open their properties dialog using the Operating System.

For items in the :guilabel:`Browser` panel that can be used as layers in QGIS,
the :guilabel:`Layer properties…` contextual menu entry opens a dialog
with detailed information to better understand the dataset.
These details can also be displayed automatically at the bottom
of the :guilabel:`Browser` panel if the |metadata| :sup:`Enable/disable
properties widget` button in its top toolbar is activated.

* :guilabel:`Metadata`: similar to what you find in the :guilabel:`Information` tab
  of the layer properties dialog after you load the layer in QGIS.
  Metadata groups :guilabel:`Information from provider`
  (if possible, :guilabel:`Path` will be a hyperlink to the source),
  :guilabel:`Identification`, :guilabel:`Extent`, :guilabel:`Access`,
  :guilabel:`Fields` (for vector layers), :guilabel:`Bands` (for raster layers),
  :guilabel:`Contacts`, :guilabel:`Links` (for vector layers),
  :guilabel:`References` (for raster layers), :guilabel:`History`.
* :guilabel:`Preview`: helps spatially visualize the data you can pan and zoom.
* :guilabel:`Attributes`: shows the attribute table, for vector sources.


.. _database_entries:

Database entries
----------------

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
   | **Top menu (provider)**                                                                                                         |
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
   | :guilabel:`New Relationship…`              | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Delete <database_name>`         | |checkbox|   | |checkbox|   |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Compact Database (VACUUM)`      | |checkbox|   |              | |checkbox| |            |               |            |
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
   | :menuselection:`Project -->                |              |              | |checkbox| |            |               |            |
   | Save Current Project As…`                  |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Project -->                |              |              | |checkbox| |            |               |            |
   | Import Projects…`                          |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Project -->                |              |              | |checkbox| |            |               |            |
   | Enable Projects Versioning…`               |              |              |            |            |               |            |
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
   | :guilabel:`New Table…`                     | |checkbox|   | |checkbox|   | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Execute SQL…` query             | |checkbox|   | |checkbox|   | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Compact Database (VACUUM)`      | |checkbox|   |              | |checkbox| |            |               |            |
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
   | :menuselection:`Manage -->                 |              |              | |checkbox| |            | |checkbox|    |            |
   | Move to Another Schema`                    |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Manage -->                 | |checkbox|   | |checkbox|   | |checkbox| |            | |checkbox|    | |checkbox| |
   | Create Spatial Index`                      |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Manage --> Set Comment…`   |              |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`Manage -->                 | |checkbox|   | |checkbox|   | |checkbox| |            | |checkbox|    | |checkbox| |
   | Delete Spatial Index`                      |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Add Layer to Project`           | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Add Selected Layers to Project` | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | Open :guilabel:`Layer Properties…` dialog  | |checkbox|   | |checkbox|   | |checkbox| | |checkbox| | |checkbox|    |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | Open :guilabel:`File Properties…` dialog   | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Open with Data Source Manager`  | |checkbox|   | |checkbox|   |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | **QGIS project**                                                                                                                |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Export Project to File…`        |              |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Rename Project…`                |              |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Delete Project…`                |              |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Duplicate Project…`             |              |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Move Project to Schema…`        |              |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Set Comment…`                   |              |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Enable Projects Versioning…`    |              |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Show Project Versions…`         |              |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Open Project`                   | |checkbox|   |              | |checkbox| |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Extract Symbols…`               | |checkbox|   |              | |checkbox| |            |               |            |
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
   | **Field Domains**                                                                                                               |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`New Field Domain --> New   | |checkbox|   |              |            |            |               |            |
   | Range Domain…`                             |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`New Field Domain --> New   | |checkbox|   |              |            |            |               |            |
   | Coded Values Domain…`                      |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :menuselection:`New Field Domain --> New   | |checkbox|   |              |            |            |               |            |
   | Glob Domain…`                              |              |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | **Field Domain**                                                                                                                |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Edit Field Domain…`             | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+
   | :guilabel:`Delete Field Domain…`           | |checkbox|   |              |            |            |               |            |
   +--------------------------------------------+--------------+--------------+------------+------------+---------------+------------+


.. [1] The different entries may also be available for some GDAL supported
 `vector file formats <https://gdal.org/en/latest/drivers/vector/index.html>`_
 such as ESRI File Geodatabase, FlatGeobuf, GeoParquet, NetCDF, ... when compatible.
.. [2] For PostgreSQL connections: only supported with ALTER TABLE privilege.


.. _tiles_web_services:

Tiles and Web Services
----------------------

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
   | :guilabel:`Add Layer to Project`                             | |checkbox|          | |checkbox|       | |checkbox|       | |checkbox|       |                  |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Add Vector Layer (FeatureServer) to Project`      |                     |                  |                  |                  | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Add Raster Layer (MapServer) to Project`          |                     |                  |                  |                  | |checkbox|       |
   +--------------------------------------------------------------+---------------------+------------------+------------------+------------------+------------------+
   | :guilabel:`Add Raster with All MapServer Layers`             |                     |                  |                  |                  | |checkbox|       |
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
   | :guilabel:`Refresh`                                          |                   |                   | |checkbox|            |                   | |checkbox|       |
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
.. |browserCollapse| image:: /static/common/browser_collapse.png
   :width: 1.5em
.. |browserExpand| image:: /static/common/browser_expand.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |cloud| image:: /static/common/mIconCloud.png
   :width: 1.5em
.. |collapseTree| image:: /static/common/mActionCollapseTree.png
   :width: 1.5em
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
.. |filterMap| image:: /static/common/mActionFilterMap.png
   :width: 1.5em
.. |geoPackage| image:: /static/common/mGeoPackage.png
   :width: 1.5em
.. |hana| image:: /static/common/mIconHana.png
   :width: 1.5em
.. |kde| image:: /static/common/kde.png
   :width: 1.5em
.. |metadata| image:: /static/common/metadata.png
   :width: 1.5em
.. |mssql| image:: /static/common/mIconMssql.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |oracle| image:: /static/common/mIconOracle.png
   :width: 1.5em
.. |postgis| image:: /static/common/mIconPostgis.png
   :width: 1.5em
.. |refresh| image:: /static/common/mActionRefresh.png
   :width: 1.5em
.. |sensor| image:: /static/common/sensor.png
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
