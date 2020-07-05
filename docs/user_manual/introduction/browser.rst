.. Purpose: This chapter aims to present the Browser panel in
.. all its glory.

.. index:: Browser panel
.. _`label_browserpanel`:

The Browser panel
======================================================================

The QGIS Browser panel is a great tool for browsing, searching,
inspecting, copying and loading QGIS resources.
Only resources that QGIS knows how to handle are shown in the
browser.

Using the Browser panel you can locate, inspect and add data, as
described in :ref:`browser_panel`.
In addition, the Browser panel supports drag and drop of many QGIS
resources, such as project files, processing scripts and processing
models.
Processing scripts and models can also be opened for editing in an
external editor and the graphical modeller respectively.

You can drag and drop layers from the :guilabel:`Layers` panel
to the :guilabel:`Browser` panel, for instance into a GeoPackage or a
PostGIS database.

.. _figure_browser_panel:

.. figure:: img/browser_panel.png
   :align: center

The browser panel is organised as an expandable hierarchy with some
fixed top-level entries that organise the resources handled by the
browser.
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
:ref:`figure_properties_widget`.

.. _figure_properties_widget:

.. figure:: img/browser_p_properties_w.png
   :align: center

   The properties widget

A second browser panels can be opened by activating the
:guilabel:`Browser (2)` panel in :menuselection:`View --> Panels`.
Having two browser panels can be useful when copying layers between
resources that are locationed deep down in different branches of the
browser hierarcy.


Resources that can be opened / run from the Browser
----------------------------------------------------------------------

A lot can be accomplished in the Browser panel

* Add vector, raster and mesh layers to your map by double-clicking,
  dragging onto the map canvas or clicking the |addLayer|
  :sup:`Add Selected Layers` button (after selecting layers)
* Run Python scripts (including Processing algorithms) by
  double-clicking or dragging onto the map canvas
* Run Models by double-clicking or dragging onto the map canvas
* :guilabel:`Extract Symbols...` from QGIS Project files using the
  context menu
* Open files with their default applications
  (:guilabel:`Open <file type> Externally...` in the context menu).
  Examples: HTML files, spreadsheets, images, PDFs, text files, ...
* Copy entries 

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
:guilabel:`Remove Favourite`.


Spatial Bookmarks
......................................................................
This is where you will find your spatial bookmarks, organised
into :guilabel:`Project Bookmarks` and :guilabel:`User Bookmarks`.

From the top level context menu, you can create a bookmark
(:guilabel:`New Spatial Bookmark...`),
:guilabel:`Show the Spatial Bookmark Manager`,
:guilabel:`Import Spatial Bookmarks...` and
:guilabel:`Export Spatial Bookmarks...`,

For bookmark entries you can :guilabel:`Zoom to Bookmark`,
:guilabel:`Edit Spatial Bookmark...` and
:guilabel:`Delete Spatial Bookmark`


Home
......................................................................
Your file system home directory / folder.
By right-clicking on an entry, and choosing
:guilabel:`Add as a Favorite`, the location will be added to
:guilabel:`Favorites`.
From the context menu, you can also

* add a directory, Geopackage or ESRI Shapefile format dataset
  (:guilabel:`Add`)
* hide the directory (:guilabel:`Hide from Browser`)
* toggle :guilabel:`Fast Scan this Directory`
* open the directory in your file manager (:guilabel:`Open Directory`)
* open the directory in a terminal window
  (:guilabel:`Open in Terminal`)
* inspect properties (:guilabel:`Properties...`,
  :guilabel:`Directory Properties...`)


/
......................................................................
Your file system root directory / folder.


Geopackage
......................................................................
Geopackage files / databases.
From the top level context menu, you can create a Geopackage
file / database (:guilabel:`Create Database...`) or add an existing
Geopackage file / database (:guilabel:`New Connection...`).

The context menu of each Geopackage lets you remove it from
the list (:guilabel:`Remove connection...`), add a new layer
or table to the Geopackage (:guilabel:`Create new Layer or Table...`),
delete the Geopackage (:guilabel:`Delete <name of geopackage>`)
and :guilabel:`Compact Database (VACUUM)`.

For layer/table entries you can 

* rename it (:guilabel:`Rename Layer <layer name>...`)
* export it (:menuselection:`Export Layer --> To file`)
* add it to the project :guilabel:`Add Layer to Project`
* delete it (:guilabel:`Delete Layer`)
* inspect properties (:guilabel:`Layer Properties...`,
  :guilabel:`File Properties...`)


SpatiaLite
......................................................................
SpatiaLite database connections.

From the top level context menu, you can create a SpatiaLite
file / database (:guilabel:`Create Database...`) or add an
existing SpatiaLite file / database (:guilabel:`New Connection...`).

The context menu of each SpatiaLite file lets you delete it
(:guilabel:`Delete`).

For layer/table entries you can 

* export it (:menuselection:`Export Layer --> To file`)
* add it to the project :guilabel:`Add Layer to Project`
* delete it (:guilabel:`Delete Layer`)
* inspect properties (:guilabel:`Layer Properties...`)


PostGIS
......................................................................
PostGIS database connections.

From the top level context menu, you can add a new connection
(:guilabel:`New Connection...`).

The context menu of each connection lets you :guilabel:`Refresh` it,
edit it :guilabel:`Edit connection...`, delete it
(:guilabel:`Delete connection`) or :guilabel:`Create Schema...`.

The context menu of each schema lets you :guilabel:`Refresh`,
:guilabel:`Rename Schema...` or :guilabel:`Delete Schema`.

For layers/tables you can 

* rename it (:guilabel:`Rename Table...`)
* remove its contents (:guilabel:`Truncate Table...`)
* export it (:menuselection:`Export Layer --> To file`)
* add it to the project (:guilabel:`Add Layer to Project`)
* delete it (:guilabel:`Delete Layer`)
* inspect its properties (:guilabel:`Layer Properties...`)


MSSQL
......................................................................
Microsoft SQL Server connections.

From the top level context menu, you can add a new connection
(:guilabel:`New Connection...`).

The context menu of each connection lets you :guilabel:`Refresh` it,
edit it :guilabel:`Edit connection...`, delete it
(:guilabel:`Delete connection`) or :guilabel:`Create Schema...`.

The context menu of each schema lets you :guilabel:`Refresh`,
:guilabel:`Rename Schema...` or :guilabel:`Delete Schema`.

For layers/tables you can 

* rename it (:guilabel:`Rename Table...`)
* remove its contents (:guilabel:`Truncate Table...`)
* export it (:menuselection:`Export Layer --> To file`)
* add it to the project (:guilabel:`Add Layer to Project`)
* delete it (:guilabel:`Delete Layer`)
* inspect its properties (:guilabel:`Layer Properties...`)


DB2
......................................................................
IBM DB2 database connections.

From the top level context menu, you can add a new connection
(:guilabel:`New Connection...`).

The context menu of each connection lets you :guilabel:`Refresh` it,
edit it :guilabel:`Edit connection...`, delete it
(:guilabel:`Delete connection`) or :guilabel:`Create Schema...`.

The context menu of each schema lets you :guilabel:`Refresh`,
:guilabel:`Rename Schema...` or :guilabel:`Delete Schema`.

For layers/tables you can 

* rename it (:guilabel:`Rename Table...`)
* remove its contents (:guilabel:`Truncate Table...`)
* export it (:menuselection:`Export Layer --> To file`)
* add it to the project (:guilabel:`Add Layer to Project`)
* delete it (:guilabel:`Delete Layer`)
* inspect its properties (:guilabel:`Layer Properties...`)


WMS/WMTS
......................................................................
Web Map Services (WMS) and Web Map Tile Services (WMTS)

From the top level context menu, you can add a new connection
(:guilabel:`New Connection...`).

The context menu of each WSM/WMTS service lets you :guilabel:`Refresh`
it, :guilabel:`Edit...` it and delete it (:guilabel:`Delete`).

Group layers can be added by dragging them onto the map canvas.

For WMS/WMTS layer entries you can 

* export it (:menuselection:`Export Layer --> To file`)
* add it to the project (:guilabel:`Add Layer to Project`)
* inspect properties (:guilabel:`Layer Properties...`)


Vector Tiles
......................................................................
Vector tile services

From the top level context menu, you add an existing service
(:guilabel:`New Connection...`), and you can
:guilabel:`Save Connections...` or :guilabel:`Load Connections...`
to / from XML files.


XYZ Tiles
......................................................................
XYZ tile services

From the top level context menu, you add an existing service
(:guilabel:`New Connection...`), and you can
:guilabel:`Save Connections...` or :guilabel:`Load Connections...`
to / from XML files.

For the XYZ tile service entries you can 

* edit it (:guilabel:`Edit...`)
* delete it (:guilabel:`Delete`)
* export it (:menuselection:`Export Layer --> To file`)
* add it to the project :guilabel:`Add Layer to Project`
* inspect properties (:guilabel:`Layer Properties...`)


WCS
......................................................................
Web Coverage Services

From the top level context menu, you can add a new connection
(:guilabel:`New Connection...`).

The context menu of each WCS lets you :guilabel:`Refresh`
it, :guilabel:`Edit...` it and delete it (:guilabel:`Delete`).

For WCS layer entries you can 

* export it (:menuselection:`Export Layer --> To file`)
* add it to the project (:guilabel:`Add Layer to Project`)
* inspect properties (:guilabel:`Layer Properties...`)


WFS / OGC API - Features
......................................................................
*Web Feature Services* (WFS) and *OGC API - Features services* (aka WFS3)

From the top level context menu, you can add a new connection
(:guilabel:`New Connection...`).

The context menu of each WFS lets you :guilabel:`Refresh`
it, :guilabel:`Edit...` it and delete it (:guilabel:`Delete`).

For WFS layer entries you can 

* export it (:menuselection:`Export Layer --> To file`)
* add it to the project (:guilabel:`Add Layer to Project`)
* inspect properties (:guilabel:`Layer Properties...`)


OWS
......................................................................
Here you will find a read-only list of all your Open Web Services (OWS)
- WMS / WCS / WFS / ...


ArcGIS Map Service
......................................................................


ArcGIS Features Service
......................................................................


GeoNode
......................................................................
From the top level context menu, you can add a new connection
(:guilabel:`New Connection...`).

The context menu of each service lets you :guilabel:`Refresh`
it, :guilabel:`Edit...` it and delete it (:guilabel:`Delete`).

For the service layer entries you can 

* export it (:menuselection:`Export Layer --> To file`)
* add it to the project (:guilabel:`Add Layer to Project`)
* inspect properties (:guilabel:`Layer Properties...`)


Resources
----------------------------------------------------------------------

* Project files.
  The context menu for QGIS project files allows you to:

  * open it (:guilabel:`Open Project`)
  * extract symbols (:guilabel:`Extract Symbols...`) - open the style
    manager that allows you to export symbols to an XML file, add
    symbols to the default style or export as PNG or SVG.
  * inspect properties (:guilabel:`File Properties...`)

  You can expand the project file to see its layers.
  The context menu of a layers offers the same actions as elsewhere
  in the browser.
* QGIS Layer Definition files (QLR)
  The following actions are available from the context menu:

  * export it (:menuselection:`Export Layer --> To file`)
  * add it to the project (:guilabel:`Add Layer to Project`)
  * inspect properties (:guilabel:`Layer Properties...`)

* QGIS Models (.model3)
  The following actions are available from the context menu:

  * :guilabel:`Run Model...`)
  * :guilabel:`Edit Model...`)

* QGIS print composer templates (QPT)
  The following action is available from the context menu:

  * (:guilabel:`New Layout from Template`)

* Python scripts (.py)
  The following actions are available from the context menu:

  * (:guilabel:`Run script...`)
  * (:guilabel:`Open in External Editor`)

* Recognized raster formats.
  The following actions are available from the context menu:

  * delete it (:guilabel:`Delete File <dataset name>`)
  * export it (:menuselection:`Export Layer --> To file`)
  * add it to the project (:guilabel:`Add Layer to Project`)
  * inspect properties (:guilabel:`Layer Properties...`,
    :guilabel:`File Properties...`)

  For some formats you can also
  :guilabel:`Open <file type> Externally...`
* Recognized vector formats.
  The following actions are available from the context menu:

  * delete it (:guilabel:`Delete File <dataset name>`)
  * export it (:menuselection:`Export Layer --> To file`)
  * add it to the project (:guilabel:`Add Layer to Project`)
  * inspect properties (:guilabel:`Layer Properties...`,
    :guilabel:`File Properties...`)

  For some formats you can also
  :guilabel:`Open <file type> Externally...`


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.
.. |addLayer| image:: /static/common/mActionAddLayer.png
   :width: 1.5em
.. |browserCollapse| image:: /static/common/browser_collapse.png
   :width: 1.5em
.. |browserExpand| image:: /static/common/browser_expand.png
   :width: 1.5em
.. |collapseTree| image:: /static/common/mActionCollapseTree.png
   :width: 1.5em
.. |filterMap| image:: /static/common/mActionFilterMap.png
   :width: 1.5em
.. |metadata| image:: /static/common/metadata.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em


