.. _qgis.documentation.features:

********
Features
********

.. only:: html

   .. contents::
      :local:

QGIS offers a wealth of GIS functions, provided by core features
and plugins.
The locator bar makes it easy to search for functions, datasets and
more.

A short summary of six general categories of features and
plugins is presented below, followed by first insights into the
integrated Python console.

View data
----------------------------------------------------------------------

You can view combinations of vector and raster data (in 2D or 3D) in
different formats and projections without conversion to an internal
or common format.
Supported formats include:

*  Spatially-enabled tables and views using PostGIS, SpatiaLite and MS SQL
   Spatial, Oracle Spatial, vector formats supported by the installed OGR
   library, including GeoPackage, ESRI Shapefile, MapInfo, SDTS, GML and
   many more.
   See section :ref:`label_workingvector`.
*  Raster and imagery formats supported by the installed GDAL (Geospatial
   Data Abstraction Library) library, such as GeoTIFF, ERDAS IMG, ArcInfo
   ASCII GRID, JPEG, PNG and many more. See section :ref:`working_with_raster`.
*  Mesh data (TINs and regular grids are supported). See :ref:`label_meshdata`.
*  Vector tiles
*  GRASS raster and vector data from GRASS databases (location/mapset).
   See section :ref:`sec_grass`.
*  Online spatial data served as OGC Web Services, including WMS,
   WMTS, WCS, WFS, and WFS-T. See section :ref:`working_with_ogc`.

   The QGIS authentication infrastructure helps you manage
   user/password, certificates and keys for web services and other
   resources.
*  Spreadsheets (ODS / XLSX)

Temporal data are supported.


Explore data and compose maps
----------------------------------------------------------------------

You can compose maps and interactively explore spatial data with a
friendly GUI. The many helpful tools available in the GUI include:

*  QGIS browser
*  On-the-fly reprojection
*  DB Manager
*  Print layout
*  Report
*  Overview panel
*  Spatial bookmarks
*  Annotation tools
*  Identify/select features
*  Edit/view/search attributes
*  Data-defined feature labeling
*  Data-defined vector and raster symbology tools
*  Atlas map composition with graticule layers
*  North arrow, scale bar and copyright label for maps
*  Support for saving and restoring projects


Create, edit, manage and export data
----------------------------------------------------------------------

You can create, edit, manage and export vector and raster layers in
several formats. QGIS offers the following:

*  Vector digitizing tools
*  Ability to create and edit multiple file formats and GRASS vector layers
*  Georeferencer plugin to geocode images
*  GPS tools to import and export GPX format, and convert other GPS
   formats to GPX or down/upload directly to a GPS unit (on Linux,
   usb: has been added to list of GPS devices)
*  Support for visualizing and editing OpenStreetMap data
*  Ability to create spatial database tables from files with the DB
   Manager plugin
*  Improved handling of spatial database tables
*  Tools for managing vector attribute tables
*  Option to save screenshots as georeferenced images
*  DXF-Export tool with enhanced capabilities to export styles and plugins
   to perform CAD-like functions

Analyze data
----------------------------------------------------------------------

You can perform spatial data analysis on spatial databases and other
OGR-supported formats. QGIS currently offers vector analysis, raster
analysis, sampling, geoprocessing, geometry and database management
tools.
You can also use the integrated GRASS tools, which include the
complete GRASS functionality of more than 400 modules (see section
:ref:`sec_grass`). Or, you can work with the Processing plugin, which
provides a powerful geospatial analysis framework to call native and
third-party algorithms from QGIS, such as GDAL, SAGA, GRASS, R, and
more (see section :ref:`sec_processing_intro`).
All analysis functions are run in the background, allowing you to
continue your work before the processing has finished.

The graphical modeller allows you to combine / chain functions into a
complete workflow in an intuitive graphical environment.


Publish maps on the Internet
----------------------------------------------------------------------

QGIS can be used as a WMS, WMTS, WMS-C or WFS and WFS-T client (see
section :ref:`working_with_ogc`), and QGIS Server (see the :ref:`QGIS-Server-manual`)
allows you to publish your data through the WMS, WCS and WFS protocols on the Internet
using a webserver.

Extend QGIS functionality through plugins
----------------------------------------------------------------------

QGIS can be adapted to your special needs with the extensible plugin
architecture and libraries that can be used to create plugins. You can
even create new applications with C++ or Python!

Core Plugins
............

Core plugins include:

#.  DB Manager (exchange, edit and view layers and tables from/to databases; execute SQL queries)
#.  Geometry Checker (check geometries for errors)
#.  Georeferencer GDAL (add projection information to rasters using GDAL)
#.  GPS Tools (load and import GPS data)
#.  GRASS 7 (integrate GRASS GIS)
#.  MetaSearch Catalogue Client (interacting with metadata catalog services
    supporting the OGC Catalog Service for the Web (CSW) standard)
#.  Offline Editing (allow offline editing and synchronizing with databases)
#.  Processing (the spatial data processing framework for QGIS)
#.  Topology Checker (find topological errors in vector layers)


External Python Plugins
.......................

QGIS offers a growing number of external Python plugins that are
provided by the community. These plugins reside in the official
Plugins Repository and can be easily installed using the Python Plugin
Installer. See Section :ref:`managing_plugins`.


Python Console
----------------------------------------------------------------------

For scripting, it is possible to take advantage of an integrated
Python console, which can be opened with: :menuselection:`Plugins
--> Python Console`. The console opens as a non-modal utility
window. For interaction with the QGIS environment, there is the
:data:`qgis.utils.iface` variable, which is an instance of
:class:`QgisInterface <qgis.gui.QgisInterface>`. This interface provides access to the map canvas,
menus, toolbars and other parts of the QGIS application. You can create
a script, then drag and drop it into the QGIS window and it will be
executed automatically.

For further information about working with the Python console and
programming QGIS plugins and applications, please refer to
:ref:`console` and :ref:`PyQGIS-Developer-Cookbook`.

.. _qgis.documentation.whatsnew:

What is new in QGIS |version|
-----------------------------

This release of QGIS includes hundreds of bug fixes and many new
features and enhancements, compared to |QGIS_CURRENT|_.
We recommend that you use this version over previous releases.
For a list of new features, visit the visual changelogs at
https://qgis.org/en/site/forusers/visualchangelogs.html.

.. |QGIS_CURRENT| replace:: QGIS 3.10
.. _QGIS_CURRENT: https://docs.qgis.org/3.10/en/docs/


Known Issues
----------------------------------------------------------------------

Number of open files limitation
...............................

If you are opening a large QGIS project and you are sure that all
layers are valid, but some layers are flagged as bad, you are probably
faced with this issue. Linux (and other OSs, likewise) has a limit of
opened files by process. Resource limits are per-process and
inherited. The ``ulimit`` command, which is a shell built-in, changes
the limits only for the current shell process; the new limit will be
inherited by any child processes.

You can see all current ulimit info by typing:

.. code-block:: bash

    $ ulimit -aS

You can see the current allowed number of opened files per process
with the following command on a console:

.. code-block:: bash

    $ ulimit -Sn

To change the limits for an **existing session**, you may be able to
use something like:

.. code-block:: bash

    $ ulimit -Sn #number_of_allowed_open_files
    $ ulimit -Sn
    $ qgis

**To fix it forever**

On most Linux systems, resource limits are set
on login by the ``pam_limits`` module according to the settings
contained in :file:`/etc/security/limits.conf` or
:file:`/etc/security/limits.d/*.conf`. You should be able to edit
those files if you have root privilege (also via sudo), but you will
need to log in again before any changes take effect.

More info:

https://www.cyberciti.biz/faq/linux-increase-the-maximum-number-of-open-files/
https://linuxaria.com/article/open-files-in-linux
