.. only:: html

   |updatedisclaimer|

.. index:: Browse data, Add layers
.. _browser_panel:

*************
QGIS Browser
*************


QGIS Browser is a panel in QGIS Desktop that lets you easily navigate in your
filesystem and manage geodata. You can have access to common vector files
(e.g., ESRI shapefiles or MapInfo files), databases (e.g., PostGIS, Oracle,
SpatiaLite, GeoPackage or MSSQL Spatial) and OWS/WCS|WMS|WFS connections. You
can also view your GRASS data (to get the data into QGIS, see :ref:`sec_grass`).


To activate QGIS Browser, right-click on QGIS toolbar and check |checkbox|
:guilabel:`Browser Panel` or select it from :menuselection:`View --> Panels`
(or |kde| :menuselection:`Settings --> Panels`).
In the :guilabel:`Browser` panel, you can now browse in your filesystem,
databases and web services and get your data into the map view with a
simple drag-and-drop or double-click.

You can also open a QGIS project directly from the Browser panel by double-clicking
its name or by drag-and-drop into the map view.

At the top of the panel, you find some icons that help you to:

* |addLayer| Add Selected Layers. You can also add data into the map view
  by selecting **Add selected layer(s)** in the context menu.
* |draw| Refresh the browser tree
* |filterMap| search for specific data. Enter a search word or wildcard
  and the browser will filter the tree to only show paths to matching DB tables, filenames
  or folders -- other data or folders won't be displayed. See the Browser Panel(2)
  example on the figure_browser_panels_. The comparison can be case-sensitive or not.
  It can also be set to:

  * normal: return any item containing the search text
  * using wildcard(s): fine tune the search using ``?`` and/or ``*`` characters to
    specify the position of the search text
  * using a regular expression

* |collapseTree| Collapse the whole tree
* |propertiesWidget| Enable and disable properties widget. When toggled on,
  a new widget is added at the bottom of the panel showing, if applicable,
  metadatas of the selected item

Right-click an item in the browser tree helps you to:

* in case of file or table, display its metadata or open it in your project.
  Tables can even be renamed, deleted or truncated
* in case of folder, bookmark it into your favourites, hide it from the browser tree.
  Hidden folders can be managed from the :menuselection:`Settings --> Options
  --> Data Sources` tab
* refresh, rename or delete schema.

You can also import files into databases or copy tables from one schema/database
to another one with a simple drag-and-drop. There is a second browser panel
available to avoid long scrolling while dragging. Just select the file and
drag-and-drop from one panel to the other.

.. _figure_browser_panels:

.. figure:: /static/user_manual/qgis_browser/browser_panels.png
   :align: center

   QGIS Browser panels side-by-side
