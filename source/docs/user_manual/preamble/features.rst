|updatedisclaimer|

*********
Features
*********

|qg| offers many common GIS functionalities provided by core features and
plugins. As a short summary they are presented in six categories to gain a
first insight.

View data
---------

You can view and overlay vector and raster data in different formats and
projections without conversion to an internal or common format. Supported
formats include:

*  Spatially-enabled tables and views using PostGIS, SpatiaLite and MSSQL Spatial, vector
   formats supported by the installed OGR library, including ESRI shapefiles,
   MapInfo, SDTS, GML and many more, see section :ref:`label_workingvector`.
*  Raster and imagery formats supported by the installed GDAL (Geospatial
   Data Abstraction Library) library, such as GeoTiff, Erdas Img., ArcInfo Ascii
   Grid, JPEG, PNG and many more, see section :ref:`working_with_raster`.
*  GRASS raster and vector data from GRASS databases (location/mapset),
   see section :ref:`sec_grass`.
*  Online spatial data served as OGC-compliant Web Map Service (WMS) or
   Web Feature Service (WFS), see section :ref:`working_with_ogc`.
*  OpenStreetMap data, see section :ref:`plugins_osm`.

Explore data and compose maps
-----------------------------

You can compose maps and interactively explore spatial data with a friendly
GUI. The many helpful tools available in the GUI include:

*  QGIS browser
*  On the fly projection
*  Map composer
*  Overview panel
*  Spatial bookmarks
*  Identify/select features
*  Edit/view/search attributes
*  Feature labeling
*  Change vector and raster symbology
*  Add a graticule layer - now via fTools plugin and as decoration
*  Decorate your map with a north arrow scale bar and copyright label
*  Save and restore projects

Create, edit, manage and export data
------------------------------------

You can create, edit, manage and export vector maps in several formats. Raster
data have to be imported into GRASS to be able to edit and export them into
other formats. QGIS offers the following:

*  Digitizing tools for OGR supported formats and GRASS vector layer
*  Create and edit shapefiles and GRASS vector layers
*  Geocode images with the Georeferencer plugin
*  GPS tools to import and export GPX format, and convert other GPS
   formats to GPX or down/upload directly to a GPS unit (on Linux, usb: has been
   addedto list of GPS devices)
*  Visualize and edit OpenStreetMap data
*  Create PostGIS layers from shapefiles with the SPIT plugin
*  Improved handling of PostGIS tables
*  Manage vector attribute tables with the new attribute table (see section
   :ref:`sec_attribute_table`) or Table Manager plugin
*  Save screenshots as georeferenced images

Analyse data
------------

You can perform spatial data analysis on PostgreSQL/PostGIS and other OGR
supported formats using the fTools Python plugin. QGIS currently offers
vector analysis, sampling, geoprocessing, geometry and database management
tools. You can also use the integrated GRASS tools, which
include the complete GRASS functionality of more than 400 modules (See Section
:ref:`sec_grass`). Or you work with SEXTANTE, which provides powerful geospatial
analysis framework to call native and third party algorithms from QGIS, such as
GDAL, SAGA, GRASS, fTools and more (see section :ref:`label_sextante`).

Publish maps on the Internet
----------------------------

QGIS can be used to export data to a mapfile and to publish them on the
Internet using a webserver with MapServer installed. QGIS can also
be used as a WMS, WMS-C or WFS and WFS-T client, and as WMS or WFS server
(see section :ref:`sec_ogc`).

Extend QGIS functionality through plugins
-----------------------------------------

QGIS can be adapted to your special needs with the extensible
plugin architecture. QGIS provides libraries that can be used to create
plugins.  You can even create new applications with C++ or Python!

Core Plugins
............

#.  Add Delimited Text Layer (Loads and displays delimited text files
    containing x,y coordinates)
#.  Coordinate Capture (Capture mouse coordinates in different CRS)
#.  DB Manager (Exchange, edit and view layers and tables; execute SQL queries)
#.  Diagram Overlay (Placing diagrams on vector layer)
#.  Dxf2Shp Converter (Convert DXF to Shape)
#.  GPS Tools (Loading and importing GPS data)
#.  GRASS (GRASS GIS integration)
#.  GDALTools (Integrate GDAL Tools into QGIS)
#.  Georeferencer GDAL (Adding projection information to raster using GDAL)
#.  Heatmap tool (Generating raster heatmaps from point data)
#.  Interpolation plugin (interpolate based on vertices of a vector layer)
#.  Mapserver Export (Export QGIS project file to a MapServer map file)
#.  Offline Editing (Allow offline editing and synchronizing with database)
#.  Oracle Spatial GeoRaster support
#.  Plugin Installer (Download and install QGIS python plugins)
#.  Raster terrain analysis (Raster based terrain analysis)
#.  Road graph plugin (Shortest Path network analysis)
#.  SPIT (Import Shapefile to PostgreSQL/PostGIS)
#.  SQL Anywhere Plugin (Store vector layers within a SQL Anywhere database)
#.  Zonal statistics plugin (Calculate count, sum, mean of raster for each polygon
    of a vector layer)
#.  Spatial Query plugin (Makes spatial queries on vector layers)
#.  eVIS (Event Visualization Tool)
#.  fTools (Tools for vector data analysis and management)
#.  Open Layers plugin (OpenStreetMap, Google Maps, Bing Maps layers and more)
#.  Topology Checker (Finding topological errors in vector layers)

External Python Plugins
........................

QGIS offers a growing number of external python plugins that are provided by
the community. These plugins reside in the official plugins repository, and
can be easily installed using the Python Plugin Installer (See Section
:ref:`load_external_plugin`).

Python Console
---------------

For scripting, it is possible to take advantage of an integrated Python console. 
It can be opened from menu: :menuselection:`Plugins --> Python Console`. The console 
opens as a non-modal utility window. For interaction with the QGIS environment, there is
the :data:`qgis.utils.iface` variable, which is an instance of :class:`QgisInterface`.
This interface allows access to the map canvas, menus, toolbars and other
parts of the QGIS application.

For further information about working with the Python Console and Programming 
PyQGIS plugins and applications, please refer to 
http://new.qgis.org/html/en/docs/pyqgis_developer_cookbook/index.html.


