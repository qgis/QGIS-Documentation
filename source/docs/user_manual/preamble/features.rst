|updatedisclaimer|

.. _qgis.documentation.features:

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

*  Spatially-enabled tables and views using PostGIS, SpatiaLite and MSSQL
   Spatial, Oracle Spatial, vector formats supported by the installed OGR
   library, including ESRI shapefiles,
   MapInfo, SDTS, GML and many more, see section :ref:`label_workingvector`.
*  Raster and imagery formats supported by the installed GDAL (Geospatial
   Data Abstraction Library) library, such as GeoTiff, Erdas Img., ArcInfo Ascii
   Grid, JPEG, PNG and many more, see section :ref:`working_with_raster`.
*  |qg| processing framework to call hundreds of native and third party
   algorithms from |qg|, see section Processing :ref:`sec_processing_intro`.
*  GRASS raster and vector data from GRASS databases (location/mapset),
   see section :ref:`sec_grass`.
*  Online spatial data served as OGC Web Services, such as (WMS, WMTS, WCS,
   WFS, WFS-T, ...), see section :ref:`sec_ogc`.
*  OpenStreetMap data, see section :ref:`plugins_osm`.

Explore data and compose maps
-----------------------------

You can compose maps and interactively explore spatial data with a friendly
GUI. The many helpful tools available in the GUI include e.g.:

*  |qg| browser
*  On-the-fly reprojection
*  DB Manager
*  Map composer
*  Overview panel
*  Spatial bookmarks
*  Annotation tools
*  Identify/select features
*  Edit/view/search attributes
*  Feature labeling also data defined
*  Change vector and raster symbology also data defined
*  Add a graticule layers to create an atlas map composition
*  Decorate your map with a north arrow scale bar and copyright label
*  Save and restore projects

Create, edit, manage and export data
------------------------------------

You can create, edit, manage and export vector and raster layers in several formats. |qg| offers e.g. the following:

*  Digitizing tools for OGR supported formats and GRASS vector layer
*  Create and edit shapefiles and GRASS vector layers
*  Geocode images with the Georeferencer plugin
*  GPS tools to import and export GPX format, and convert other GPS
   formats to GPX or down/upload directly to a GPS unit (on Linux, usb: has been
   addedto list of GPS devices)
*  Visualize and edit OpenStreetMap data
*  Create spatial database tables from shapefiles with DB Manager plugin
*  Improved handling of spatial database tables
*  Manage vector attribute tables
*  Save screenshots as georeferenced images

Analyse data
------------

You can perform spatial data analysis on spatial databases and other OGR
supported formats. |qg| currently offers vector analysis, sampling, geoprocessing, geometry and database management tools. You can also use the integrated GRASS tools, which include the complete GRASS functionality of more than 400 modules (See Section :ref:`sec_grass`). Or you work with the Processing Plugin, which provides powerful geospatial analysis framework to call native and third party algorithms from |qg|, such as GDAL, SAGA, GRASS, fTools and more (see section :ref:`sec_processing_intro`).

Publish maps on the Internet
----------------------------

|qg| can be used as a WMS, WMTS, WMS-C or WFS and WFS-T client, and as WMS or WFS server (see section :ref:`sec_ogc`). Additionally you can export data publish them on the Internet using a webserver with UMN MapServer or GeoServer installed.

Extend |qg| functionality through plugins
-----------------------------------------

|qg| can be adapted to your special needs with the extensible
plugin architecture. |qg| provides libraries that can be used to create
plugins.  You can even create new applications with C++ or Python!

Core Plugins
............

#.  Coordinate Capture (Capture mouse coordinates in different CRS)
#.  DB Manager (Exchange, edit and view layers and tables; execute SQL queries)
#.  Diagram Overlay (Placing diagrams on vector layer)
#.  Dxf2Shp Converter (Convert DXF to Shape)
#.  eVIS (Event Visualization Tool)
#.  fTools (Tools for vector data analysis and management)
#.  GDALTools (Integrate GDAL Tools into |qg|)
#.  Georeferencer GDAL (Adding projection information to raster using GDAL)
#.  GPS Tools (Loading and importing GPS data)
#.  GRASS (GRASS GIS integration)
#.  Heatmap (Generating raster heatmaps from point data)
#.  Interpolation plugin (interpolate based on vertices of a vector layer)
#.  Mapserver Export (Export |qg| project file to a MapServer map file)
#.  Offline Editing (Allow offline editing and synchronizing with database)
#.  Open Layers plugin (OpenStreetMap, Google Maps, Bing Maps layers and more)
#.  Oracle Spatial GeoRaster
#.  Processing (formerly SEXTANTE)
#.  Raster terrain analysis (Raster based terrain analysis)
#.  Road graph plugin (Shortest Path network analysis)
#.  Spatial Query Plugin
#.  SPIT (Import Shapefile to PostgreSQL/PostGIS)
#.  SQL Anywhere Plugin (Store vector layers within a SQL Anywhere database)
#.  Topology Checker (Finding topological errors in vector layers)
#.  Zonal statistics plugin (Calculate count, sum, mean of raster for each polygon
    of a vector layer)


External Python Plugins
........................

|qg| offers a growing number of external python plugins that are provided by
the community. These plugins reside in the official plugins repository, and
can be easily installed using the Python Plugin Installer (See Section
:ref:`load_external_plugin`).

Python Console
---------------

For scripting, it is possible to take advantage of an integrated Python console.
It can be opened from menu: :menuselection:`Plugins --> Python Console`. The console
opens as a non-modal utility window. For interaction with the |qg| environment, there is
the :data:`qgis.utils.iface` variable, which is an instance of :class:`QgsInterface`.
This interface allows access to the map canvas, menus, toolbars and other
parts of the |qg| application.

For further information about working with the Python Console and Programming
Py|qg| plugins and applications, please refer to
http://www.qgis.org/html/en/docs/pyqgis_developer_cookbook/index.html.


