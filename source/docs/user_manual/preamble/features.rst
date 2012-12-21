.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

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

*  Digitizing tools for OGR supported formats and GRASS vector layer.
*  Create and edit shapefiles and GRASS vector layers.
*  Geocode images with the Georeferencer plugin.
*  GPS tools to import and export GPX format, and convert other GPS
   formats to GPX or down/upload directly to a GPS unit (on Linux, usb: has been
   addedto list of GPS devices).
*  Visualize and edit OpenStreetMap data.
*  Create PostGIS layers from shapefiles with the SPIT plugin.
*  Improved handling of PostGIS tables.
*  Manage vector attribute tables with the new attribute table (see section
   :ref:`sec_attribute_table`) or Table Manager plugin.
*  Save screenshots as georeferenced images.

Analyse data
------------

You can perform spatial data analysis on PostgreSQL/PostGIS and other OGR
supported formats using the fTools Python plugin. QGIS currently offers
vector analysis, sampling, geoprocessing, geometry and database management
tools. You can also use the integrated GRASS tools, which
include the complete GRASS functionality of more than 400 modules (See Section
:ref:`sec_grass`). Or you work with SEXTANTE, which provides powerful a geospatial
analysis framework to call native and third party algorithms from QGIS, such as
GDAL, SAGA, GRASS, fTools, ... (See Section :ref:`label_sextante`).

Publish maps on the Internet
----------------------------

QGIS can be used to export data to a mapfile and to publish them on the
Internet using a webserver with UMN MapServer installed. QGIS can also
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
#.  OpenStreetMap plugin (Viewer and editor for openstreetmap data)
#.  Oracle Spatial GeoRaster support
#.  Plugin Installer (Download and install QGIS python plugins)
#.  Raster terrain analysis (Raster based terrain analysis)
#.  Road graph plugin (Shortest Path network analysis)
#.  SPIT (Import Shapefile to PostgreSQL/PostGIS)
#.  SQL Anywhere Plugin (Store vector layers within a SQL Anywhere database)
#.  Zonal statictics plugin (Calculate count, sum, mean of raster for each polygon
    of a vector layer)
#.  Spatial Query plugin (Makes spatial queries on vector layers)
#.  eVIS (Event Visualization Tool)
#.  fTools (Tools for vector data analysis and management)

External Python Plugins
........................

QGIS offers a growing number of external python plugins that are provided by
the community. These plugins reside in the official PyQGIS repository, and
can be easily installed using the Python Plugin Installer (See Section
:ref:`load_external_plugin`).

What's new in the version 1.8
-----------------------------

Please note that this is a release in our 'cutting edge' release series. As such
it contains new features and extends the programmatic interface over QGIS 1.0.x
and QGIS 1.7.0. We recommend that you use this version over previous releases.

This release includes hundreds of bug fixes and many new features and enhancements
that will be described in this manual.

**QGIS Browser**

A stand alone app and a new panel in QGIS. The browser lets you easily navigate
your file system and connection based (PostGIS, WFS etc.) datasets, preview them
and drag and drop items into the canvas.

**DB Manager**

The DB manager is now officially part of QGIS core. You can drag layers from the
QGIS Browser into DB Manager and it will import your layer into your spatial
database. Drag and drop tables between spatial databases and they will get
imported. You can use the DB Manager to execute SQL queries against your spatial
database and then view the spatial output for queries by adding the results to
QGIS as a query layer. You can also create, edit, delete, and empty tables, and
move them to another schema.

**Terrain Analysis Plugin:**

A new core plugin was added for doing terrain analysis (slope, aspect, hillshade,
relief and ruggedness index).

**New symbol layer types**

* Line Pattern Fill
* Point Pattern Fill
* Ellipse renderer (render ellipse and also rectangles, triangles, crosses)

**New plugin repository**

Note that the old repository is now no longer supported by default; plugin authors
are kindly requested to move their plugins to the new repository. Get the QGIS
Plugins list at http://plugins.qgis.org/plugins/

**More new features**

* Support for nesting projects within other projects to embed content from other
  project files
* Layer grouping: Option to add layers to selected or active group
* Message log: Lets you keep an eye on the messages QGIS generates during loading
  and operation
* GUI Customization: Allows setting up simplified QGIS interface by hiding various
  components of main window and widgets in dialogs
* Action Tool is now accessible from the map tools toolbar and allows you to
  click on a vector feature and execute an action
* New scale selector: select from a list of predefined scales
* Pan To Selected tool: Pans the map to selected feature(s); does not change the
  zoom level
* Copy and paste styles between layers
* Updated CRS selector dialog
* Define Legend-independent drawing order
* MSSQL Spatial Support - you can now connect to your Microsoft SQL Server spatial
  databases using QGIS
* Print Composers allows to have multiple lines on legend items using a specified
  character
* Expression based labeling
* Heatmap Plugin - a new core plugin has been added for generating raster heatmaps
  from point data
* The GPS live tracking user interface was overhauled and many fixes and
  improvements were added to it
* The menu was re-organised a little - we now have separate menus for Vector,
  Raster, Web and many plugins were updated to place their menus in the new
  Vector, Raster and Web top level menus
* Offset Curves - a new digitising tool for creating offset curves was added
* New tools in the Vector menu to Densify geomtries and Build spatial index
* Export/add geometry column tool can export info using layer CRS, project CRS
  or ellipsoidal measurements
* Model/view based tree for rules in rule-based renderer
* Improvements in Spatial Bookmarks
* New Plugin metadata in metadata.txt
* Refactored postgres data provider: support for arbitrary key (including
  non-numeric and multi column), support for requesting a certain geometry type
  and/or srid in QgsDataSourceURI
* Added gdal_fillnodata to GDALTools plugin
* Support for PostGIS TopoGeometry datatype
* Python bindings for vector field symbol layer and general updates to the Python
  bindings
* Added a Benchmark program
* Added Row cache for attribute table
* UUID generation widget for attribute table
* Added support of editable views in SpatiaLite databases
* added expression based widget in field calculator
* Creation of event layers in analysis lib using linear referencing
* Load/save layer styles in the new symbology renderer from/to SLD document
* QGIS Server can act as WFS Server
* WFS Client support is now a core feature in QGIS
* Option to skip WKT geometry when copying from attribute table
* Support loading of zipped and gzipped layers
* The QGIS test suite now passes all tests on major platforms and nightly tests
* You can set tile size for WMS layers
