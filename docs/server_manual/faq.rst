*************************
Frequently Asked Question
*************************


.. only:: html

   .. contents::
      :local:
      :depth: 3


* *What are the differences between QGIS Desktop and QGIS Server?*

  QGIS Desktop has a graphical user interface and allows you to create and modify maps.
  QGIS Server is a server application serving your QGIS project files to end user
  applications via OGC web services like `WMS, WFS, etc. <https://www.ogc.org/docs/is>`_.

* *What is OGC?*

  The `OGC (Open Geospatial Consortium) <https://www.ogc.org/>`_ is an international
  not for profit organization committed to making quality open standards for the
  global geospatial community.

* *Name some other web mapping servers?*

  ArcGIS server, Geoserver, Mapserver, Mapnik etc.

.. _`feature_comparaison`:

* *How to compare QGIS server to other web mapping servers? (2021/01/01)*
  
  .. list-table:: 
     :header-rows: 1
     :stub-columns: 1
  
     * - Features
       - QGIS Server
       - GeoServer
       - ArcGIS Server
         
     * - Since
       - 2006
       - 2001
       - 1999
         
     * - Licence
       - GPL
       - GPL
       - commercial
         
     * - Commercial support
       - Multiple companies
       - Multiple companies
       - ESRI and its vendors network
  
     * - Technology
       - C++/python
       - Java
       - C++
  
     * - Tile cache
       - yes
       - yes (via GeoWebCache)
       - yes
  
     * - 3D
       - No
       - No
       - Yes    
         
     * - Querying
       - FES (2.0) and OGC (1.0) filters
       - CQL and OGC filters
       - OGC filters
  
     * - Report generation
       - yes
       - yes
       - yes
         
     * - Server administration
       - yes via third parties (LizMap, QWC2, etc.)
       - web + API REST
       - web + API REST
         
     * - GIS project Layer/symbology edition
       - complete via dedicated GUI
       - simple via web interface
       - complete via dedicated GUI


.. _`version_comparaison`:

* *What are the OGC specification versions implemented in QGIS server compared to other web mapping servers? (2021/01/01)*

  .. list-table:: 
     :header-rows: 1
     :stub-columns: 1
  
     * - OGC standards
       - QGIS Server
       - GeoServer
       - ArcGIS Server
         
     * - WMS (Web Map Service)
       - 1.3.0 - 1.1.1
       - 1.3.0 - 1.1.1
       - 1.3.0 - 1.1.1
         
     * - WFS (Web Feature Service)
       - 1.1.0 - 1.0.0
       - 2.0.0 - 1.0.0
       - 2.0.0 - 1.0.0
  
     * - OAPIF (aka WFS3)
       - 1.0.0
       - no
       - no
         
     * - WMTS (Web Map Tile Service)
       - 1.0.0
       - 1.0.0
       - 1.0.0
  
     * - WCS (Web Coverage Service)
       - 1.0.0
       - 2.0.1 - 1.0.0
       - 2.0.1 - 1.0.0
  
     * - WPS (Web Processing Service)
       - no
       - 1.0.0
       - 1.0.0
  
     * - CSW (Catalogue Service for the Web)
       - no
       - 2.0.2
       - no
  
     * - SLD (Styled Layer Descriptor)
       - yes
       - yes
       - yes

  
* *What is a tile cache?*

  Maps are often static. As most mapping clients render WMS (Web Map Service) data
  every time they are queried, this can result in unnecessary processing and
  increased wait times.

  The tile cache optimizes this experience by saving (caching) map images, or tiles,
  as they are requested, in effect acting as a proxy between client (such as
  OpenLayers or Google Maps) and server (any WMS-compliant server). As new maps and
  tiles are requested, QGIS server intercepts these calls and returns pre-rendered
  tiles if stored, or calls the QGIS engine to render new tiles as necessary. Thus,
  once tiles are stored, the speed of map rendering increases by many times, creating
  a much improved user experience.

* *What is PostgreSQL?*

  `PostgreSQL <https://www.postgresql.org/>`_ is a powerful, open source
  object-relational database companion for QGIS.

* *What is PostGIS?*

  `PostGIS <https://postgis.net/>`_ is a spatial database extender for PostgreSQL
  object-relational database. It adds support for geographic objects allowing location
  queries to be run in SQL.
