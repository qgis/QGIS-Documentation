.. when the revision of a section has been finalized, 
.. comment out the following line:
.. \updatedisclaimer

.. label_forward:

*********
Foreword
*********

Welcome to the wonderful world of Geographical Information Systems (GIS)!
Quantum GIS (QGIS) is an Open Source Geographic Information System. The project
was born in May of 2002 and was established as a project on SourceForge in June
of the same year. We've worked hard to make GIS software (which is traditionally
expensive proprietary software) a viable prospect for anyone with basic access
to a Personal Computer. QGIS currently runs on most Unix platforms, Windows, and
OS X. QGIS is developed using the Qt toolkit (http://qt.nokia.com)
and C++. This means that QGIS feels snappy to use and has a pleasing, 
easy-to-use graphical user interface (GUI). 

QGIS aims to be an easy-to-use GIS, providing common functions and features.
The initial goal was to provide a GIS data viewer. QGIS has reached the point
in its evolution where it is being used by many for their daily GIS data viewing
needs. QGIS supports a number of raster and vector data formats, with new
format support easily added using the plugin architecture.

QGIS is released under the GNU General Public License (GPL). Developing QGIS 
under this license means that you can inspect and modify the source code,
and guarantees that you, our happy user, will always have access to a GIS
program that is free of cost and can be freely modified. You should have
received a full copy of the license with your copy of QGIS, and you also can
find it in Appendix :ref:`gpl_appendix`.  

.. index:: documentation

.. tip::
        **Up-to-date Documentation**
        The latest version of this document can always be found at 
        http://download.osgeo.org/qgis/doc/manual/, or in the documentation
        area of the QGIS website at http://www.qgis.org/en/documentation


Features
=========

|qg| offers many common GIS functionalities provided by core features and
plugins. As a short summary they are presented in six categories to gain a
first insight.

**View data**


You can view and overlay vector and raster data in different formats and
projections without conversion to an internal or common format. Supported
formats include:

*  Spatially-enabled tables using PostGIS and SpatiaLite, vector 
   formats supported by the installed OGR library, including ESRI shapefiles,
   MapInfo, SDTS, GML and many more.
*  Raster and imagery formats supported by the installed GDAL (Geospatial
   Data Abstraction Library) library, such as GeoTiff, Erdas Img., ArcInfo Ascii 
   Grid, JPEG, PNG and many more.
*  SpatiaLite databases (see section :ref:`label_spatialite`) 
*  GRASS raster and vector data from GRASS databases (location/mapset),
   see section :ref:`sec_grass`.
*  Online spatial data served as OGC-compliant Web Map Service (WMS) or
   Web Feature Service (WFS), see section :ref:`working_with_ogc`.
*  OpenStreetMap data (see section :ref:`plugins_osm`).

**Explore data and compose maps**


You can compose maps and interactively explore spatial data with a friendly
GUI. The many helpful tools available in the GUI include:

*  on the fly projection
*  map composer
*  overview panel
*  spatial bookmarks
*  identify/select features
*  edit/view/search attributes
*  feature labeling
*  change vector and raster symbology
*  add a graticule layer - now via fTools plugin
*  decorate your map with a north arrow scale bar and copyright label
*  save and restore projects

**Create, edit, manage and export data**


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

**Analyse data**


You can perform spatial data analysis on PostgreSQL/PostGIS and other OGR
supported formats using the fTools Python plugin. QGIS currently offers
vector analysis, sampling, geoprocessing, geometry and database management
tools. You can also use the integrated GRASS tools, which 
include the complete GRASS functionality of more than 400 modules (See Section
:ref:`sec_grass`).

**Publish maps on the Internet**


QGIS can be used to export data to a mapfile and to publish them on the
Internet using a webserver with UMN MapServer installed. QGIS can also
be used as a WMS or WFS client, and as WMS server. 

**Extend QGIS functionality through plugins**


QGIS can be adapted to your special needs with the extensible
plugin architecture. QGIS provides libraries that can be used to create
plugins.  You can even create new applications with C++ or Python!

**Core Plugins**

#.  Add Delimited Text Layer (Loads and displays delimited text files
    containing x,y coordinates).
#.  Coordinate Capture (Capture mouse coordinates in different CRS).
#.  Decorations (Copyright Label, North Arrow and Scale bar).
#.  Diagram Overlay (Placing diagrams on vector layer).
#.  Displacement Plugin (Handle point displacement in case points have the same
    position).
#.  Dxf2Shp Converter (Convert DXF to Shape).
#.  GPS Tools (Loading and importing GPS data).
#.  GRASS (GRASS GIS integration).
#.  GDALTools (Integrate GDAL Tools into QGIS).
#.  Georeferencer GDAL (Adding projection information to raster using GDAL).
#.  Interpolation plugin (interpolate based on vertices of a vector layer).
#.  Mapserver Export (Export QGIS project file to a MapServer map file).
#.  Offline Editing (Allow offline editing and synchronizing with database).
#.  OpenStreetMap plugin (Viewer and editor for openstreetmap data).
#.  Oracle Spatial GeoRaster support.
#.  Plugin Installer (Download and install QGIS python plugins).
#.  Raster terrain analysis (Raster based terrain analysis).
#.  Road graph plugin (Shortest Path network analysis).
#.  SPIT (Import Shapefile to PostgreSQL/PostGIS).
#.  SQL Anywhere Plugin (Store vector layers within a SQL Anywhere database).
#.  Spatial Query Plugin (make spatial queries on vector layers).
#.  WFS Plugin (Add WFS layers to QGIS canvas).
#.  eVIS (Event Visualization Tool).
#.  fTools (Tools for vector data analysis and management).

**External Python Plugins**


QGIS offers a growing number of external python plugins that are provided by
the community. These plugins reside in the official PyQGIS repository, and
can be easily installed using the Python Plugin Installer (See Section
:ref:`load_external_plugin`).

**What's new in version \CURRENT**


Please note that this is a release in our 'cutting edge' release series. As such 
it contains new features and extends the programmatic interface over QGIS 1.0.x 
and QGIS 1.6.0. We recommend that you use this version over previous releases.

This release includes over 277 bug fixes and many new features and enhancements.

**Symbology labels and diagrams**


* New symbology now used by default.
* Diagram system that uses the same smart placement system as labeling-ng.
* Export and import of styles (symbology-ng).
* Labels for rules in rule-based renderers.
* Font marker can have an X,Y offset.
* Line symbology:

  * Option to put marker on the central point of a line.
  * Option to put marker only on first/last vertex of a line.
  * Allow the marker line symbol layer to draw markers on each vertex.

* Polygon symbology:

  * Rotation for svg fills.
  * Added 'centroid fill' symbol layer which draws a marker on polygon's centroid.
  * Allow the line symbol layers to be used for outline of polygon (fill) symbols.

* Labels:

  * Ability to set label distance in map units.
  * Move/rotate/change label edit tools to interactively change data defined
    label properties.

* New Tools:

  * Added GUI for gdaldem.
  * Added field calculator with functions like $x, $y and $perimeter.
  * Added 'Lines to polygons' tool to vector menu.
  * Added voronoi polygon tool to Vector menu.

**User interface updates**


* Allow managing missing layers in a list.
* Zoom to group of layers.
* 'Tip of the day' on startup. You can en/disable tips in the options panel.
* Better organisation of menus, separate database menu added.
* Add ability to show number of features in legend classes. Accessible via
  right-click legend menu.
* General clean-ups and usability improvements.

**CRS Handling**


* Show active crs in status bar.
* Assign layer CRS to project (in the legend context menu).
* Select default CRS for new projects.
* Allow setting CRS for multiple layers at once.
* Default to last selection when prompting for CRS.

**Rasters**


* Added AND and OR operator for raster calculator.
* On-the-fly reprojection of rasters added.
* Proper implementation of raster providers.
* Added raster toolbar with histogram stretch functions.

**Providers and Data Handling**


* New SQLAnywhere vector provider.
* Table join support.
* Feature form updates.
* Make NULL value string representation configurable.
* Fix feature updates in feature form from attribute table.
* Add support for NULL values in value maps (comboboxes).
* Use layer names instead of ids in drop down list when loading value maps from
  layers.
* Support feature form expression fields: line edits on the form which name
  prefix "expr_" are evaluated. Their value is interpreted as field calculator
  string and replaced with the calculated value.
* Support searching for NULL in attribute table.
* Attribute editing improvements
* Improved interactive attribute editing in table (adding/deleting features,
  attribute update).
* Allow adding of geometryless features.
* Fixed attribute undo/redo.
* Improved attribute handling.
* Optionally re-use entered attribute values for next digitized feature.
* Allow merging/assigning attribute values to a set of features.
* Allow OGR "save as" without attributes (for eg. DGN/DXF).

**Api and Developer Centric**


* Refactored attribute dialog calls to QgsFeatureAttribute.
* Added QgsVectorLayer::featureAdded signal.
* Layer menu function added.
* Added option to load c++ plugins from user specified directories. Requires
  application restart to activate.
* Completely new geometry checking tool for fTools. Significantly faster, more
  relevant error messages, and now supports zooming to errors. See the new
  QgsGeometry.validateGeometry function.

**QGIS Server**

* Ability to specify wms service capabilities in the properties section of the
  project file (instead of wms_metadata.xml file).
* Support for wms printing with GetPrint-Request.

**Plugins**

* Support for icons of plugins in the plugin manager dialog.
* Removed quickprint plugin - use easyprint plugin rather from plugin repo.
* Removed ogr convertor plugin - use 'save as' context menu rather.

**Printing**


* Undo/Redo support for the print composer.

