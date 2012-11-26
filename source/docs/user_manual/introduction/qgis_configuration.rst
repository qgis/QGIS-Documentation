.. comment out this disclaimer (by putting '.. ' in front of it) if file is uptodate with release

|updatedisclaimer|


******************
QGIS Configuration
******************

QGIS is highly configurable ... (please add more introduction here)

Project Properties
==================

In the properties window for the project under |nix| :menuselection:`Settings -->
Project Properties` or |win| :menuselection:`Settings -->
Project Properties` you set project specific options. These
include:

* In the :guilabel:`General` tab the project title, selection and background
  color, layer units, precision, and the option to save relative paths to
  layers can be defined. You can define the layer units (only used when CRS 
  transformation is disabled) and the precision of decimal places to use.  
* The :guilabel:`CRS Coordinate Reference System` tab enables you to choose 
  the CRS for this project, and to enable on-the-fly re-projection of raster and 
  vector layers when displaying layers from a different CRS.
* With the third :guilabel:`Identifiable layers` tab you set (or disable) 
  which layers will respond to the identify tool. (See the Map tools paragraph from
  the :ref:`gui_options` section to enable identifying of multiple layers.)
* The tab :guilabel:`WMS Server` allows to define information about the QGIS 
  mapserver Service Capabilities, the Extent and the CRS Restrictions. Activating 
  the |checkbox| :guilabel:`Add WKT geometry to feature info response` will allow 
  to query the WMS layers.

.. _gui_options:

Options 
=======

|mActionOptions| Some basic options for QGIS can be selected using the 
:guilabel:`Options` dialog. Select the menu option :menuselection:`Settings -->` 
|mActionOptions| :menuselection:`Options`. The tabs where you can optimize 
your options are:

General Tab
-----------

* |checkbox| :guilabel:`Prompt to save project changes when required`
* |checkbox| :guilabel:`Warn when opening a project file saved with an older version of QGIS`
* Change Selection and background Color
* Change the QGIS Style
* Change the icon theme (choose between 'default', 'classic', 'gis' and 'newgis')
* Change icon size between 16, 24 and 32 pixel.
* Change the menu size
* Define double click action in legend (choose between 'open layer properties' 
  and 'open ') attribute table.
* |checkbox| :guilabel:`Capitalize layer names in legend`
* |checkbox| :guilabel:`Display classification attribute names in legend`
* |checkbox| :guilabel:`Create raster icons in legend`
* |checkbox| :guilabel:`Hide splash screen at startup`
* |checkbox| :guilabel:`Show tips at startup`
* |checkbox| :guilabel:`Open identify results in a dock window (QGIS restart
  required)`
* |checkbox| :guilabel:`Open snapping options in a dock window (QGIS restart
  required)`
* |checkbox| :guilabel:`Open attribute table in a dock window`
* |checkbox| :guilabel:`Add PostGIS layers with double click and select in extended mode`
* |checkbox| :guilabel:`Add new layers to selected group`
* |checkbox| :guilabel:`Copy geometry in WKT representation from attribute table`
* :guilabel:`Attribute table behavior` (choose between 'Show all features' (default), 'Show 
  selected features','Show features in current canvas')
* :guilabel:`Attribute table row cache`
* Define :guilabel:`Representation for NULL values`
* :guilabel:`Prompt for raster sublayers` Some rasters support sublayers - they are called subdatasets in gdal.
  An example is netcdf files - if there are many netcdf variables, gdal
  sees every variable as a subdataset.
  The option is to control how to deal with sublayers when a file with sublayers is opened. 
  You have the following choices:
  'Always': always ask (if there are existing sublayers)
  'If needed': ask if layer has no bands, but has sublayers
  'Never': never prompt, will not load anything
  'Load all': never prompt, but load all sublayers
* :guilabel:`Scan for valid items in the browser dock` The 'Check extension' option
  was designed to speed up the loading of a directory, which
  can be time-consuming when 'Check file contents' is activated and
  there are many files (tens or hundreds).
* :guilabel:`Scan for contents of compressed files (.zip) in browser dock` 
  This option was also designed to speed up the loading of a directory. You have
  the following choices:
  'Basic Scan': checks that the extension is supported by one of the drivers
  'Full Scan': opens every file to check it is valid
  'Passthru': don't use this option it will be removed in the next QGIS version

GDAL tab
--------

GDAL is a data exchange library for raster files. In this tab you can define which
GDAL driver to be used for a raster format as in some cases more than one GDAL driver 
is available.


Plugins tab
-----------

* Add :guilabel:`Path(s) to search for additional C++ plugin libraries`. 


Rendering Tab
-------------

* |checkbox| :guilabel:`By default new layers added to the map should be displayed`
* Define :guilabel:`Number of features to draw before updating the display`.
* |checkbox| :guilabel:`Use render caching where possible to speed up redraws`
* |checkbox| :guilabel:`Make lines appear less jagged at the expense of some drawing
  performance`
* |checkbox| :guilabel:`Fix problems with incorrectly filled polygons`
* |checkbox| :guilabel:`Use new generation symbology for rendering`
* Define the default Raster settings for visualisation: 'RGB band selection', |checkbox| :guilabel:`Use standard deviation` and 
  'Contrast Enhancement'
* Add/remove :guilabel:`Path(s) to search for Scalable Vector Graphics (SVG) symbols`


Additionally you can define whether to save the path for svg textures
absolute or relative in the :guilabel:`General` tab of the
:menuselection:`Settings --> Project Properties` menu.

Map tools Tab
-------------

* The :guilabel:`Mode` setting determines which layers will be shown by the Identify
  tool. By switching to 'Top down' or 'Top down, stop at
  first' instead of 'Current layer' attributes for all identifiable
  layers (see the Project properties section under: :ref:`sec_projects` to set
  which layers are identifiable) will be shown with the Identify tool.
* |checkbox| :guilabel:`Open feature form, if a single feature is identified`
* Define :guilabel:`Search radius for identifying and displaying map tips as a
  percentage of the map width`
* Define :guilabel:`Ellipsoid for distance calculations`
* Define :guilabel:`Rubberband color` for measure tools
* Define :guilabel:`Decimal places`
* |checkbox| :guilabel:`Keep base unit`
* |radiobuttonon| :guilabel:`Define preferred measurement units ('meters' or 'feet')`
* |radiobuttonon| :guilabel:`Define preferred angle units ('Degrees', 'Radians' or 'Gon')`
* Define :guilabel:`Mouse wheel action` ('Zoom', 'Zoom and recenter', 'Zoom to mouse
  cursor', 'Nothing')
* Define :guilabel:`Zoom factor` for wheel mouse

Overlays Tab
------------

* Define :guilabel:`Placement algorithm` for labels (choose between 'Central point'
  (standard), 'Chain', 'Popmusic tabu chain', 'Popmusic tabu' and 'Popmusic chain')

Digitizing Tab
--------------

* Define Rubberband :guilabel:`Line color` and :guilabel:`Line width`
* Define :guilabel:`Default snap mode` ('To vertex', 'To segment', 'To vertex and segment')
* Define :guilabel:`Default snapping tolerance` in map units or pixel
* Define search radius for vertex edits in 'map units' or 'pixel'
* |checkbox| :guilabel:`Show markers only for selected features`
* Define vertex :guilabel:`Marker style` ('Cross' (default), 'Semi transparent', 'Circle' or
  'None') and vertex :guilabel:`Marker size`.
* |checkbox| :guilabel:`Suppress attributes pop-up windows after each created feature`
* |checkbox| :guilabel:`Reuse last entered attribute values`
* :guilabel:`Validate geometries` Editing complex lines/polygons with many nodes can end up 
  with very slow rendering. This is because the default validation procedures in QGIS can use
  a lot of time. To speed up rendering it is possible to select GEOS geometry validation
  (starting from GEOS 3.3) or to switch it off. GEOS geometry validation is much faster,
  but the disadvantage is that only the first geometry problem will be reported.

The next 3 options refer to the |mActionOffsetCurve| :sup:`Offset Curve` tool in :ref:`sec_advanced_edit`.
Through the various settings, it is possible to influence the shape of the line offset. These options are
possible from GEOS 3.3 .

* :guilabel:`Join style for curve offset` 
* :guilabel:`Quadrantsegments for curve offset`
* :guilabel:`Miter limit for curve offset`


CRS Tab
-------

The CRS tab is divided in two areas. The first area allows to define the default 
CRS for new projects.

* Select a CRS and :guilabel:`Always start new projects with this CRS`.
* |checkbox| :guilabel:`Enable on the fly re-projection by default`

The second area allows to define the action, when a new layer is created, or when 
a layer without CRS is loaded.

* |radiobuttonoff| :guilabel:`Prompt for Coordinate Reference System (CRS)`
* |radiobuttonoff| :guilabel:`Use project Coordinate Reference System (CRS)`
* |radiobuttonon| :guilabel:`Use default Coordinate Reference System (CRS) displayed below`

Locale Tab
----------

* |checkbox| :guilabel:`Overwrite system locale` and :guilabel:`Locale to use instead`
* Information about active system locale

Network Tab
-----------

.. _figure_network_tab:

.. only:: html

   **Figure Network Tab:**

.. figure:: /static/user_manual/introduction/proxy-settings.png
   :align: center
   :width: 40em
   
   Proxy-settings in |qg|

* |checkbox| :guilabel:`Use proxy for web access` and define 'Host', 'Port', 'User', 
  and 'Password'.
* Set the :menuselection:`Proxy type -->` according to your needs.

  * :menuselection:`Default Proxy -->`: Proxy is determined based on the application 
     proxy set using
  * :menuselection:`Socks5Proxy -->`: Generic proxy for any kind of connection. 
     Supports TCP, UDP, binding to a port (incoming connections) and 
     authentication.
  * :menuselection:`HttpProxy -->`: Implemented using the "CONNECT" command, supports 
    only outgoing TCP connections; supports authentication.
  * :menuselection:`HttpCachingProxy -->`: Implemented using normal HTTP commands, it 
    is useful only in the context of HTTP requests
  * :menuselection:`FtpCachingProxy -->`: Implemented using an FTP proxy, it is 
    useful only in the context of FTP requests
 
* Define :guilabel:`Cache settings` (path and size)
* Define :guilabel:`WMS search address`, default is 
  ``http://geopole.org/wms/search?search=\%1\&type=rss``
* Define :guilabel:`Timeout for network requests (ms)` - default is 60000

Excluding some URLs can be added to the text box below the proxy-settings (see
Figure_Network_Tab_) by pressing the **[Add]** button. After 
that double-click into the just created URL-field and enter the URL you would like
to exclude from using the proxy. Obviously the button **[Remove]** removes 
the selected entry.

If you need more detailed information about the different proxy-settings,
please refer to the manual of the underlying QT-library-documentation at
http://doc.trolltech.com/4.5/qnetworkproxy.html#ProxyType-enum.

.. tip::
   **Using Proxies**

   Using proxies can sometimes be tricky. It is useful to 'trial and
   error' the above proxy types and check if they succeed in your case.

You can modify the options according to your needs. Some of the changes may
require a restart of QGIS before they will be effective.

* |nix| settings are saved in a texfile: \$HOME/.config/QuantumGIS/qgis.conf
* |osx| you can find your settings in: 
  \$HOME/Library/Preferences/org.qgis.qgis.plist
* |win| settings are stored in the registry under:

::

   \\HKEY\CURRENT_USER\Software\QuantumGISqgis

Customization
=============


