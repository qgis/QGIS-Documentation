*************************
Frequently Asked Question
*************************


.. only:: html

   .. contents::
      :local:
      :depth: 3


* *What are the differences between QGis Desktop and QGis Server?*

	QGis Desktop has an graphical user interface and allow you to create and modify maps. QGis server is a server application serving your QGis project files to end user applications via OGC streams like `WMS, WFS, etc. <https://www.ogc.org/docs/is>`_.

* *What is OGC?*

	The `OGC (Open Geospatial Consortium) <https://www.ogc.org/>`_ is an international not for profit organization committed to making quality open standards for the global geospatial community.

* *Name some other web mapping servers?*

  ArcGIS server, Geoserver, Mapserver, Mapnik etc.

*	*How to compare QGis server to other web mapping servers?*

	:doc:`See the Comparaison matrix<comparaison_matrix>`.

* *What is a tile cache?*

	Maps are often static. As most mapping clients render WMS (Web Map Service) data every time they are queried, this can result in unnecessary processing and increased wait times. The tile cache optimizes this experience by saving (caching) map images, or tiles, as they are requested, in effect acting as a proxy between client (such as OpenLayers or Google Maps) and server (any WMS-compliant server). As new maps and tiles are requested, QGis server intercepts these calls and returns pre-rendered tiles if stored, or calls the QGIs engine to render new tiles as necessary. Thus, once tiles are stored, the speed of map rendering increases by many times, creating a much improved user experience.

* *What is PostGIS?*

	PostGIS is a spatial database extender for PostgreSQL object-relational database. It adds support for geographic objects allowing location queries to be run in SQL.

* To be continued...
