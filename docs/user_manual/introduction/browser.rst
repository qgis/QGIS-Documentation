.. Purpose: This chapter aims to present the Browser panel in
.. all its glory.

.. index:: Browser panel
.. _`label_browserpanel`:

The browser panel
=================

The QGIS browser panel is a great tool for browsing, searching,
inspecting and loading QGIS resources.

Using the browser panel you can locate, inspect and add data, as
described in :ref:`browser_panel`.
In addition, the Browser panel supports drag and drop of many QGIS
resources, such as project files, processing scripts and processing
models.

.. _figure_browser_panel:

.. figure:: img/browser_panel.png
   :align: center

The browser panel is organised as an expandable hierarchy with some
fixed top-level entries.
Node entries are expanded by clicking on |browserExpand| to the left
of the entry name.
A branch is collapsed by clicking on |browserCollapse|.


Browser panel top-level entries
-------------------------------

Favorites
.........
Often used file system locations can be tagged as favorites.
The ones you have tagged will appear here.

In addition to the operations described under *Home*, the
context menu allows you to :guilabel:`Rename Favorite...` and
:guilabel:`Remove Favourite`.


Spatial Bookmarks
.................
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
.........
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
.........
Your file system root directory / folder.


Geopackage
..........
Geopackage files / databases.
From the top level context menu, you can create a Geopackage
file / database (:guilabel:`Create Database...`) or add a
Geopackage file / database (:guilabel:`New Connection...`).

The context menu of each Geopackage lets you remove it from
the list (:guilabel:`Remove connection...`), add a new layer
or table to the Geopackage (:guilabel:`Create new Layer og Table...`),
delete the Geopackage (:guilabel:`Delete <name of geopackage>`)
and :guilabel:`Compact Database (VACUUM)`.

For Geopackage layer/table entries you can 

* rename it (:guilabel:`Rename Layer <layer name>...`)
* export it (:menuselection:`Export Layer --> To file`)
* hide the directory (:guilabel:`Hide from Browser`)
* add it to the project :guilabel:`Add Layer to Project`
* delete it (:guilabel:`Delete Layer`)
* inspect properties (:guilabel:`Layer Properties...`,
  :guilabel:`File Properties...`)


SpatiaLite
..........
SpatiaLite database connections.


PostGIS
.......
PostGIS database connections.


MSSQL
.....
Microsoft SQL Server connections.


DB2
...
IBM DB2 database connections.


WMS/WMTS
........
Web Map Services (WMS) and Web Map Tile Services (WMTS)


Vector Tiles
............
Vector tile services


XYZ Tiles
.........
XYZ tile services


WCS
...
Web Coverage Services


WFS / OGC API - Features
........................
*Web Feature Services* (WFS) and *OGC API - Features services* (aka WFS3)

OWS
...
Here you will find a read-only list of all your Open Web Services (OWS)
- WMS / WCS / WFS / ...

ArcGIS Map Service
..................


ArcGIS Features Service
.......................


GeoNode
.......


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.
.. |browserCollapse| image:: /static/common/browser_collapse.png
   :width: 1.5em
.. |browserExpand| image:: /static/common/browser_expand.png
   :width: 1.5em

