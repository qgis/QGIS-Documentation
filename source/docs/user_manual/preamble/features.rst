|updatedisclaimer|

.. _qgis.documentation.features:

********
Features
********

|qg| offers many common GIS functionalities provided by core features
and plugins. A short summary of six general categories of features and
plugins is presented below, followed by first insights into the
integrated Python console.

View data 
---------

You can view and overlay vector and raster data in different formats
and projections without conversion to an internal or common
format. Supported formats include:

*  Spatially-enabled tables and views using PostGIS, SpatiaLite and MS SQL
   Spatial, Oracle Spatial, vector formats supported by the installed OGR
   library, including ESRI shapefiles, MapInfo, SDTS, GML and many more.
   See section :ref:`label_workingvector`.
*  Raster and imagery formats supported by the installed GDAL (Geospatial
   Data Abstraction Library) library, such as GeoTIFF, ERDAS IMG, ArcInfo
   ASCII GRID, JPEG, PNG and many more. See section :ref:`working_with_raster`.
*  GRASS raster and vector data from GRASS databases (location/mapset).
   See section :ref:`sec_grass`.
*  Online spatial data served as OGC Web Services, including WMS, WMTS, WCS,
   WFS, and WFS-T. See section :ref:`sec_ogc`.
*  OpenStreetMap data. See section :ref:`plugins_osm`.

Explore data and compose maps 
-----------------------------

You can compose maps and interactively explore spatial data with a
friendly GUI. The many helpful tools available in the GUI include:

*  |qg| browser
*  On-the-fly reprojection
*  DB Manager
*  Map composer
*  Overview panel
*  Spatial bookmarks
*  Annotation tools
*  Identify/select features
*  Edit/view/search attributes
*  Data-defined feature labeling
*  Data-defined vector and raster symbology tools
*  Atlas map composition with graticule layers
*  North arrow scale bar and copyright label for maps
*  Support for saving and restoring projects

Create, edit, manage and export data 
------------------------------------

You can create, edit, manage and export vector and raster layers in
several formats. |qg| offers the following:

*  Digitizing tools for OGR-supported formats and GRASS vector layers
*  Ability to create and edit shapefiles and GRASS vector layers
*  Georeferencer plugin to geocode images
*  GPS tools to import and export GPX format, and convert other GPS
   formats to GPX or down/upload directly to a GPS unit (On Linux,
   usb: has been added to list of GPS devices.)
*  Support for visualizing and editing OpenStreetMap data
*  Ability to create spatial database tables from shapefiles with
   DB Manager plugin
*  Improved handling of spatial database tables
*  Tools for managing vector attribute tables
*  Option to save screenshots as georeferenced images

Analyse data 
------------

You can perform spatial data analysis on spatial databases and other
OGR- supported formats. |qg| currently offers vector analysis,
sampling, geoprocessing, geometry and database management tools. You
can also use the integrated GRASS tools, which include the complete
GRASS functionality of more than 400 modules. (See section
:ref:`sec_grass`.) Or, you can work with the Processing Plugin, which
provides a powerful geospatial analysis framework to call native and
third-party algorithms from |qg|, such as GDAL, SAGA, GRASS, fTools
and more. (See section :ref:`sec_processing_intro`.)

Publish maps on the Internet 
----------------------------

|qg| can be used as a WMS, WMTS, WMS-C or WFS and WFS-T client, and as
a WMS, WCS or WFS server. (See section :ref:`sec_ogc`.) Additionally,
you can publish your data on the Internet using a webserver with UMN
MapServer or GeoServer installed.

Extend |qg| functionality through plugins 
-----------------------------------------

|qg| can be adapted to your special needs with the extensible plugin
architecture and libraries that can be used to create plugins. You can
even create new applications with C++ or Python!

Core Plugins
............

Core plugins include:

#.  Coordinate Capture (Capture mouse coordinates in different CRSs)
#.  DB Manager (Exchange, edit and view layers and tables; execute SQL queries)
#.  Diagram Overlay (Place diagrams on vector layers)
#.  Dxf2Shp Converter (Convert DXF files to shapefiles)
#.  eVIS (Visualize events)
#.  fTools (Analyze and manage vector data)
#.  GDALTools (Integrate GDAL Tools into |qg|)
#.  Georeferencer GDAL (Add projection information to rasters using GDAL)
#.  GPS Tools (Load and import GPS data)
#.  GRASS (Integrate GRASS GIS)
#.  Heatmap (Generate raster heatmaps from point data)
#.  Interpolation Plugin (Interpolate based on vertices of a vector layer)
#.  Offline Editing (Allow offline editing and synchronizing with databases)
#.  Oracle Spatial GeoRaster
#.  Processing (formerly SEXTANTE)
#.  Raster Terrain Analysis (Analyze raster-based terrain)
#.  Road Graph Plugin (Analyze a shortest-path network)
#.  Spatial Query Plugin
#.  SPIT (Import shapefiles to PostgreSQL/PostGIS)
#.  SQL Anywhere Plugin (Store vector layers within a SQL Anywhere database)
#.  Topology Checker (Find topological errors in vector layers)
#.  Zonal Statistics Plugin (Calculate count, sum, and mean of a raster for each
    polygon of a vector layer)


External Python Plugins
.......................

|qg| offers a growing number of external Python plugins that are
provided by the community. These plugins reside in the official
Plugins Repository and can be easily installed using the Python Plugin
Installer. See Section :ref:`managing_plugins`.

Python Console 
--------------

For scripting, it is possible to take advantage of an integrated
Python console, which can be opened from menu: :menuselection:`Plugins
--> Python Console`. The console opens as a non-modal utility
window. For interaction with the |qg| environment, there is the
:data:`qgis.utils.iface` variable, which is an instance of
:class:`QgsInterface`. This interface allows access to the map canvas,
menus, toolbars and other parts of the |qg| application.

For further information about working with the Python console and
programming |qg| plugins and applications, please refer to
http://www.qgis.org/html/en/docs/pyqgis_developer_cookbook/index.html.

Known Issues 
------------

Number of open files limitation
...............................

If you are opening a large QGIS project and you are sure that all
layers are valid, but some layers are flagged as bad, you are probably
faced with this issue. Linux (and other OSs, likewise) has a limit of
opened files by process. Resource limits are per-process and
inherited. The ``ulimit`` command, which is a shell built-in, changes
the limits only for the current shell process; the new limit will be
inherited by any child processes.

You can see all current ulimit info by typing ::

    user@host:~$ ulimit -aS

You can see the current allowed number of opened files per proccess
with the following command on a console ::

    user@host:~$ ulimit -Sn

To change the limits for an **existing session**, you may be able to
use something like ::

    user@host:~$ ulimit -Sn #number_of_allowed_open_files
    user@host:~$ ulimit -Sn
    user@host:~$ qgis

**To fix it forever**

On most Linux systems, resource limits are set
on login by the ``pam_limits`` module according to the settings
contained in :file:`/etc/security/limits.conf` or
:file:`/etc/security/limits.d/*.conf`. You should be able to edit
those files if you have root privilege (also via sudo), but you will
need to log in again before any changes take effect.

More info:

http://www.cyberciti.biz/faq/linux-increase-the-maximum-number-of-open-files/
http://linuxaria.com/article/open-files-in-linux?lang=en
