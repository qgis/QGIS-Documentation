|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release


******************
QGIS Configuration
******************

QGIS is highly configurable through the :menuselection:`Settings` menu.
Choose between Panels, Toolbars, Project properties, Options and Customization.

..  please add more introduction here

.. _sec_panels_and_toolbars:

Panels and Toolbars
===================

In the :menuselection:`Panels-->` menu you can switch on and off QGIS widgets.
The :menuselection:`Toolbars-->` menu provides the possibility to switch on
and off icon groups in the QGIS toolbar (see figure_panels_toolbars_).

.. _figure_panels_toolbars:

.. only:: html

   **Figure Panels and Toolbars:**

.. figure:: /static/user_manual/introduction/panels_and_toolbars.png
   :align: center
   :width: 25em

   The Panels and Toolbars menu |nix|

.. index::
   single:Map overview

.. tip:: **Activating the QGIS Overview**

   In QGIS you can use an overview panel that provides a full extent view of layers added to it.
   It can be selected under the menu :menuselection:`Settings --> Panels`.
   Within the view is a rectangle showing the current map extent. This allows
   you to quickly determine which area of the map you are currently viewing. Note
   that labels are not rendered to the map overview even if the layers in the
   map overview have been set up for labeling.
   If you click and drag the red rectangle in the overview that shows your
   current extent, the main map view will update accordingly.

.. tip:: **Show Log Messages**

   Since QGIS 1.8 it's possible to track the QGIS messages. You can activate
   |checkbox|:guilabel:`Log Messages` in the menu
   :menuselection:`Settings --> Panels` and follow the messages
   in the :guilabel:`General` and :guilabel:`Plugin` tab during loading and operation.


Project Properties
==================

In the properties window for the project under |nix| :menuselection:`Settings -->
Project Properties` or |win| :menuselection:`Settings -->
Project Properties` you set project specific options. These
include:

* In the :guilabel:`General` tab the project title, selection and background
  color, layer units, precision, and the option to save relative paths to
  layers can be defined. You can define the layer units (only used when CRS
  transformation is disabled) and the precision of decimal places to use. You 
  also can define a project scale list, that overrides the global predefined scales.
* The :guilabel:`CRS Coordinate Reference System` tab enables you to choose
  the CRS for this project, and to enable on-the-fly re-projection of raster and
  vector layers when displaying layers from a different CRS.
* With the third :guilabel:`Identifiable layers` tab you set (or disable)
  which layers will respond to the identify tool. (See the Map tools paragraph from
  the :ref:`gui_options` section to enable identifying of multiple layers.)
* The tab :guilabel:`OWS Server` allows to define information about the QGIS
  mapserver Service Capabilities, the Extent and the CRS Restrictions as well as
  the WFS Capabilities. Activating the |checkbox| :guilabel:`Add WKT geometry to feature info response`
  will allow to query the WMS layers.

.. _gui_options:

Options
=======

|mActionOptions| Some basic options for QGIS can be selected using the
:guilabel:`Options` dialog. Select the menu option :menuselection:`Settings -->`
|mActionOptions| :menuselection:`Options`. The tabs where you can optimize your
options are:

General Tab
-----------

Application

* Select the :guilabel:`Style (QGIS restart required)` |selectstring| and choose between 'Oxygen','Windows','Motif','CDE', 'Plastique' and  'Cleanlux' (|nix|).
* Define the :guilabel:`Icon theme` |selectstring|. Currently only 'default' is possible.
* Define the :guilabel:`Icon size` |selectstring|.
* Define the :guilabel:`Font`. Choose between |radiobuttonon| :guilabel:`QT default` and a user-defined font.
* Change the :guilabel:`Timeout for timed messages or dialogs` |selectstring|. 
* |checkbox| :guilabel:`Hide splash screen at startup`
* |checkbox| :guilabel:`Show tips at startup`
* |checkbox| :guilabel:`Bold group box titles`
* |checkbox| :guilabel:`QGIS-styled group boxes`
* |checkbox| :guilabel:`Use live-updating color chooser dialog`


Project files

* :guilabel:`Open project on launch` |selectstring| (choose between 'New'. 'Most recent' and 'Specific'. When choosing 'Specific' use the |browsebutton| to define a project)
* |checkbox| :guilabel:`Create new project from default project`. You have the possibility to press on :guilabel:`Set current project as default` or on :guilabel:`Reset default`. You can browse through your files and define a directory where you find your user-defined project templates. There will be an entry in :menuselection:`Project --> New From Template` if you first activate |checkbox| :guilabel:`Create new project from default project` and then save a project in the project templates folder.
* |checkbox| :guilabel:`Prompt to save project and data source changes when required`
* |checkbox| :guilabel:`Warn when opening a project file saved with an older version of QGIS`

.. FIXME: more information necessary

* :guilabel:`Enable macros` |selectstring| . This option was created to handle macros which are written to ... . If you use 'Never' ... In case of 'Ask' ... . 'For this session only' ... and 'Always (not recommended)' ... .

System Tab
----------

.. FIXME:more information necessary

Environment

* |checkbox| :guilabel:`Use custom variables (restart required - include separators)`. 
  You can :guilabel:`Add` and :guilabel:`Remove` variables.
  :menuselection:`Current environment variables -->` are displayed below and it's possible 
  to |checkbox| :guilabel:`Show only QGIS-specific variables`.

Plugin paths

* :guilabel:`Add` or :guilabel:`Remove` :guilabel:`Path(s) to search for additional C++ plugin libraries`

Data Sources Tab
----------------

Feature attributes and table

* |checkbox| :guilabel:`Open attribute table in a dock window (QGIS restart required)`

.. FIXME:more information necessary

* |checkbox| :guilabel:`Copy geometry in WKT representation from attribute table`
* :guilabel:`Attribute table behaviour` |selectstring|. There are three possibilities: 'Show all features',
  'Show selected features' and 'Show features visible on map'

.. FIXME: more information necessary

* :guilabel:`Attribute table row cache` |selectstring|
* :guilabel:`Representation for NULL values` 


Data source handling

* :guilabel:`Scan for valid items in the browser dock` |selectstring|. You can choose between 'Check extension' and 'Check file contents'.
* :guilabel:`Scan for contents of compresses files (.zip) in browser dock` |selectstring|. 'No', 'Basic scan' and 'Full scan' are possible.
* :guilabel:`Prompt for raster sublayers when opening`. Some rasters support sublayers - they are called subdatasets in GDAL. An example is netcdf files - if there are many netcdf variables, GDAL sees every variable as a subdataset. The option is to control how to deal with sublayers when a file with sublayers is opened. You have the following choices:
   
  * ‘Always’: always ask (if there are existing sublayers)
  * ‘If needed’: ask if layer has no bands, but has sublayers
  * ‘Never’: never prompt, will not load anything
  * ‘Load all’: never prompt, but load all sublayers

.. FIXME: more information necessary

* |checkbox| :guilabel:`Ignore shapefile encoding declaration`
* |checkbox| :guilabel:`Add PostGIS layer with double click and select in extended mode`
* |checkbox| :guilabel:`Add Oracle layers with double click and select in extended mode`

Rendering Tab
-------------

Rendering quality

* |checkbox| :guilabel:`Make lines appear less jagged at the expense of some drawing
  performance`
* |checkbox| :guilabel:`Fix problems with incorrectly filled polygons`


Rasters

* with :guilabel:`RGB band selection` you can define the number for the Red, Green and Blue band.

Contrast enhancement

* :guilabel:`Single band gray` |selectstring|. A single band gray can have 'No stretch', 'Stretch to MinMax', 'Stretch and Clip to MinMax' and also 'Clip to MinMax'
* :guilabel:`Multi band color (byte/band)` |selectstring|. 'No stretch', 'Stretch to MinMax', 'Stretch and Clip to MinMax' and 'Clip to MinMax'.

.. FIXME: more information necessary

* :guilabel:`Multi band color (>byte/band)` |selectstring|. 'No stretch', 'Stretch to MinMax', 'Stretch and Clip to MinMax' and 'Clip to MinMax'.
* :guilabel:`Limits (minimum/maximum)` |selectstring|. 'Cumulative pixel count cut', 'Minimum/Maximum', 'Mean +/- standard deviation'
* :guilabel:`Cumulative pixel count cut limits`
* :guilabel:`Standard deviation multiplier`


Debugging

* :guilabel:`Show these events in the Log Message panel (under rendering tab):` |checkbox| :guilabel:`Map canvas refresh`

Canvas and legend Tab
---------------------

Default map appearance (overridden by project properties)

* Define a :guilabel:`Selection color` and a :guilabel:`Background color`.


Layer legend

* :guilabel:`Double click action in legend` |selectstring|. You can either 
  'Open layer properties' or 'Open attribute table' with the double click.

* the following :guilabel:`Legend item styles` are possible

  * |checkbox| :guilabel:`Capitalise layer names`
  * |checkbox| :guilabel:`Bold layer names`
  * |checkbox| :guilabel:`Bold group names`
  * |checkbox| :guilabel:`Display classification attribute names`
  * |checkbox| :guilabel:`Create raster icons (may be slow)`
  * |checkbox| :guilabel:`Add new layers to selected or current group`

Map tools Tab
-------------

Identify

* |checkbox| :guilabel:`Open identify results in a dock window (QGIS restart required)`
* The :guilabel:`Mode` setting determines which layers will be shown by the Identify
  tool. By switching to 'Top down' or 'Top down, stop at first' instead of 'Current
  layer' attributes for all identifiable layers (see the Project properties section
  under: :ref:`sec_projects` to set which layers are identifiable) will be shown
  with the Identify tool.
* |checkbox| :guilabel:`Open feature form, if a single feature is identified`
* Define :guilabel:`Search radius for identifying and displaying map tips as a
  percentage of the map width`


Measure tool

* Define :guilabel:`Rubberband color` for measure tools
* Define :guilabel:`Decimal places`
* |checkbox| :guilabel:`Keep base unit`
* :guilabel:`Preferred measurements units` |radiobuttonon| ('meters' or 'feet')`
* :guilabel:`Preferred angle units` |radiobuttonon| ('Angle', 'Radians' or 'Gon')

Panning and zooming

Mouse wheel action

* Define :guilabel:`Mouse wheel action` |selectstring| ('Zoom', 'Zoom and recenter',
  'Zoom to mouse cursor', 'Nothing')
* Define :guilabel:`Zoom factor` for wheel mouse

Predefined scales

Here you find a list of predefined scales. With the '+' and '-' buttons you can add or
remove your individual scales.


Digitizing Tab
--------------


Feature creation

* |checkbox| :guilabel:`Suppress attributes pop-up windows after each created feature`
* |checkbox| :guilabel:`Reuse last entered attribute values`
* :guilabel:`Validate geometries`. Editing complex lines/polygons with many nodes can end up
  with very slow rendering. This is because the default validation procedures in QGIS can use
  a lot of time. To speed up rendering it is possible to select GEOS geometry validation
  (starting from GEOS 3.3) or to switch it off. GEOS geometry validation is much faster,
  but the disadvantage is that only the first geometry problem will be reported.


Rubberband

* Define Rubberband :guilabel:`Line width` and :guilabel:`Line color`

 
Snapping

* |checkbox| :guilabel:`Open snapping options in a dock window (QGIS restart required)`
* Define :guilabel:`Default snap mode` |selectstring| ('To vertex', 'To segment',
  'To vertex and segment', 'Off')
* Define :guilabel:`Default snapping tolerance` in map units or pixels
* Define the :guilabel:`Search radius for vertex edits` in map units or pixels


Vertex markers

* |checkbox| :guilabel:`Show markers only for selected features`
* Define vertex :guilabel:`Marker style` |selectstring| ('Cross' (default), 'Semi
  transparent circle' or 'None')
* Define vertex :guilabel:`Marker size`


Curve offset tool

The next 3 options refer to the |mActionOffsetCurve| :sup:`Offset Curve` tool in :ref:`sec_advanced_edit`.
Through the various settings, it is possible to influence the shape of the line offset. These options are
possible from GEOS 3.3 .

* :guilabel:`Join style for curve offset`
* :guilabel:`Quadrant segments for curve offset`
* :guilabel:`Miter limit for curve offset`


GDAL Tab
--------
 
GDAL is a data exchange library for raster files. In this tab you can :guilabel:`Edit create options`
and :guilabel:`Edit Pyramids Options` of the raster formats. Define which GDAL driver to be used for
a raster format as in some cases more than one GDAL driver is available.

CRS Tab
-------


Default CRS for new projects

* |checkbox| :guilabel:`Automatically enable 'on the fly' reprojection if layers have different CRS`
* |checkbox| :guilabel:`Enable on the fly re-projection by default`
* Select a CRS and :guilabel:`Always start new projects with this CRS`


CRS for new layers

This area allows to define the action, when a new layer is created, or when
a layer without CRS is loaded.

* |radiobuttonon| :guilabel:`Prompt for CRS`
* |radiobuttonoff| :guilabel:`Use project CRS`
* |radiobuttonoff| :guilabel:`Use default CRS displayed below`

Locale Tab
----------

* |checkbox| :guilabel:`Overwrite system locale` and :guilabel:`Locale to use instead`
* Information about active system locale


Network Tab
-----------

General

* Define :guilabel:`WMS search address`, default is
  ``http://geopole.org/wms/search?search=\%1\&type=rss``
* Define :guilabel:`Timeout for network requests (ms)` - default is 60000
* Define :guilabel:`Default expiration period for WMSC/WMTS tiles (hours)` - default is 24 


.. _figure_network_tab:

.. only:: html

   **Figure Network Tab:**

.. figure:: /static/user_manual/introduction/proxy-settings.png
   :align: center
   :width: 25em

   Proxy-settings in |qg|

Cache settings

Define the :guilabel:`Directory` and a :guilabel:`Size` for the cache.


* |checkbox| :guilabel:`Use proxy for web access` and define 'Host', 'Port', 'User',
  and 'Password'.
* Set the :guilabel:`Proxy type` |selectstring| according to your needs.

  * :menuselection:`Default Proxy`: Proxy is determined based on the application
    proxy set using
  * :menuselection:`Socks5Proxy`: Generic proxy for any kind of connection.
    Supports TCP, UDP, binding to a port (incoming connections) and authentication.
  * :menuselection:`HttpProxy`: Implemented using the "CONNECT" command, supports
    only outgoing TCP connections; supports authentication.
  * :menuselection:`HttpCachingProxy`: Implemented using normal HTTP commands, it
    is useful only in the context of HTTP requests
  * :menuselection:`FtpCachingProxy`: Implemented using an FTP proxy, it is
    useful only in the context of FTP requests

Excluding some URLs can be added to the text box below the proxy-settings (see
Figure_Network_Tab_).

If you need more detailed information about the different proxy-settings,
please refer to the manual of the underlying QT-library-documentation at
http://doc.trolltech.com/4.5/qnetworkproxy.html#ProxyType-enum.

.. tip::
   **Using Proxies**

   Using proxies can sometimes be tricky. It is useful to 'trial and
   error' the above proxy types and check if they succeed in your case.

You can modify the options according to your needs. Some of the changes may
require a restart of QGIS before they will be effective.

* |nix| settings are saved in a text file: :file:`$HOME/.config/QuantumGIS/qgis.conf`
* |osx| you can find your settings in: :file:`$HOME/Library/Preferences/org.qgis.qgis.plist`
* |win| settings are stored in the registry under: ``HKEY\CURRENT_USER\Software\QuantumGIS\qgis``

.. _sec_customization:

Customization
=============

The customization tool is a new development in QGIS 1.8.. It lets you (de)activate
almost every element in the QGIS user interface. This can get very useful if you have
a lot of plug-ins installed that you never use and that are filling your screen.

.. _figure_customization:

.. only:: html

   **Figure Customization 1:**

.. figure:: /static/user_manual/introduction/customization.png
   :align: center
   :width: 25em

   The Customization dialog |nix|

QGIS Customization is divided into five groups. In |checkbox| :guilabel:`Docks` you
find the dock windows. Dock windows are applications that can be started and used as
a floating, top-level window or embedded to the QGIS main window as a docked widget
(see also :ref:`sec_panels_and_toolbars`). In |checkbox| :guilabel:`Menus` you
can hide entries in the Menu bar. In the |checkbox| :guilabel:`Status Bar` features
like the coordinate information can be daectivated. In |checkbox| :guilabel:`Toolbars`
you can (de)activate the toolbar icons of QGIS and in |checkbox| :guilabel:`Widgets`
you can (de)activate dialogs as well as their buttons.

With |mActionSelect| :guilabel:`Switch to catching widgets in main application`
you can click on elements in QGIS you want to be hidden and find the corresponding entry
in Customization (see figure_customization_). You can also save your various different
setups for different use cases as well. Before your changes are applied, you need to
restart QGIS.

