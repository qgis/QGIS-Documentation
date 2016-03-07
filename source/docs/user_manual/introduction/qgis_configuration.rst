|updatedisclaimer|

******************
|qg| Configuration
******************

|qg| is highly configurable through the :menuselection:`Settings` menu. Choose
between Panels, Toolbars, Project Properties, Options and Customization.

.. note:: |qg| follows desktop guidelines for the location of options and project 
   properties item. Consequently related to the OS you are using, location of some 
   of items described above could be located in the :menuselection:`View` menu 
   (Panels and Toolbars) or in :menuselection:`Project` for Options.

..  FIXME: please add more introduction here

.. _sec_panels_and_toolbars:

Panels and Toolbars
===================

In the :menuselection:`Panels-->` menu, you can switch on and off |qg| widgets.
The :menuselection:`Toolbars-->` menu provides the possibility to switch on
and off icon groups in the |qg| toolbar (see figure_panels_toolbars_).

.. _figure_panels_toolbars:

.. only:: html

   **Figure Panels and Toolbars:**

.. figure:: /static/user_manual/introduction/panels_and_toolbars.png
   :align: center

   The Panels and Toolbars menu

.. index::
   single:Map overview

.. tip:: **Activating the QGIS Overview**

   In |qg|, you can use an overview panel that provides a full extent view of
   layers added to it. It can be selected under the menu |nix| :menuselection:`Settings --> Panels` or
   |win| :menuselection:`View --> Panels`. Within the view is a rectangle showing the
   current map extent. This allows you to quickly determine which area of the
   map you are currently viewing. Note that labels are not rendered to the map
   overview even if the layers in the map overview have been set up for
   labelling. If you click and drag the red rectangle in the overview that shows
   your current extent, the main map view will update accordingly.

.. tip:: **Show Log Messages**

   It's possible to track the |qg| messages. You can activate
   |checkbox| :guilabel:`Log Messages` in the menu
   |nix| :menuselection:`Settings --> Panels` or 
   |win| :menuselection:`View --> Panels` and follow the messages 
   that appear in the different tabs during loading and operation.


Project Properties
==================

In the properties window for the project under |nix| 
:menuselection:`Settings --> Project Properties` (kde) or |nix| |win| 
:menuselection:`Project --> Project Properties` (Gnome), you can set 
project-specific options.

* In the :guilabel:`General` menu, the **general settings** let you:

  * give a title to the project beside the project file path
  * choose the color to use for features when they are selected 
  * choose the background color: the color to use for the map canvas
  * set whether the path to layers in the project should be saved as absolute
    (full) or as relative to the project file location. You may prefer
    relative path when both layers and project files can be moved or shared
    or if the project is accessed from computers on different platforms.
  * choose to avoid artifacts when project is rendered as map tiles. Note that
    checking this option can lead to performance degradation.

  Calculating areas and distances is a common need in GIS. However, these values
  are really tied to the underlying projection settings. The **Measurements**
  frame lets you control these parameters. You can indeed choose:
  
  * the ellipsoid to use: it can be an existing one, a custom one 
    (you'll need to set values of the semi-major and semi-minor axis)
    or None/Planimetric.
  * the :guilabel:`units for distance measurements` for length and perimeter and
    the :guilabel:`units for area measurements`. These settings, which default
    to the units set in QGIS options but then overrides it for the current project,
    are used in:
  
    * Attribute table field update bar
    * Field calculator calculations
    * Identify tool derived length, perimeter and area values
    * Default unit shown in measure dialog

  The **Coordinate display** allows you to choose and customize the format of units
  to use to display the mouse coordinate in the status bar and the derived coordinates
  shown via the identify tool.
  
  Finally, you can define a **project scale** list, which overrides the global
  predefined scales.

.. _figure_general_menu:

.. only:: html

   **Figure General Menu:**

.. figure:: /static/user_manual/introduction/project_general.png
   :align: center

   General tab of Project Properties dialog
  
* The :guilabel:`CRS` menu enables you to choose the Coordinate Reference
  System for this project, and to enable on-the-fly re-projection of raster and
  vector layers when displaying layers from a different CRS.
* With the :guilabel:`Identify layers` menu, you set (or disable) which
  layers will respond to the :ref:`identify tool <identify>`. By default, layers
  are set queryable.
* The :guilabel:`Default Styles` menu lets you control how new layers will be
  drawn when they do not have an existing :file:`.qml` style defined. You can
  also set the default transparency level for new layers and whether symbols
  should have random colors assigned to them.
  There is also an additional section where you can define specific colors for the 
  running project. You can find the added colors in the drop down menu of the color dialog
  window present in each renderer.
* The tab :guilabel:`OWS Server` allows you to define information about the |qg|
  Server WMS and WFS capabilities, extent and CRS restrictions.
* The :guilabel:`Macros` menu is used to edit Python macros for projects. Currently,
  only three macros are available: ``openProject()``, ``saveProject()`` and
  ``closeProject()``.

.. _figure_macro_menu:

.. only:: html

   **Figure Macro Menu:**

.. figure:: /static/user_manual/introduction/macro.png
   :align: center

   Macro settings in QGIS


* The :guilabel:`Relations` menu is used to define 1:n relations. The relations
  are defined in the project properties dialog. Once relations exist for a layer,
  a new user interface element in the form view (e.g. when identifying a feature
  and opening its form) will list the related entities. This provides a powerful
  way to express e.g. the inspection history on a length of pipeline or road segment.
  You can find out more about 1:n relations support in Section :ref:`vector_relations`.

.. _gui_options:

Options
=======

|mActionOptions| Some basic options for |qg| can be selected using the
:guilabel:`Options` dialog. Select the menu option :menuselection:`Settings -->`
|mActionOptions| :menuselection:`Options`. The tabs where you can customize your
options are described below.

General Menu
-------------

**Application**

* Select the :guilabel:`Style (QGIS restart required)` |selectstring| and choose
  between 'Oxygen','Windows','Motif','CDE', 'Plastique' and  'Cleanlooks' (|nix|).
* Define the :guilabel:`Icon theme` |selectstring|. Currently only 'default' is
  possible.
* Define the :guilabel:`Icon size` |selectstring|.
* Define the :guilabel:`Font`. Choose between |radiobuttonon|
  :guilabel:`Qt default` and a user-defined font.
* Change the :guilabel:`Timeout for timed messages or dialogs` |selectstring|.
* |checkbox| :guilabel:`Hide splash screen at startup`
* |checkbox| :guilabel:`Show tips at startup`
* |checkbox| :guilabel:`Bold group box titles`
* |checkbox| :guilabel:`QGIS-styled group boxes`
* |checkbox| :guilabel:`Use native color chooser dialogs`
* |checkbox| :guilabel:`Use live-updating color chooser dialogs`
* |checkbox| :guilabel:`Custom side bar style`
* |checkbox| :guilabel:`Experimental canvas rotation support (restart required)`

**Project files**

* :guilabel:`Open project on launch` |selectstring| (choose between 'New',
  'Most recent' and 'Specific'). When choosing 'Specific' use the |browsebutton|
  to define a project.
* |checkbox| :guilabel:`Create new project from default project`. You have the
  possibility to press on :guilabel:`Set current project as default` or on
  :guilabel:`Reset default`. You can browse through your files and define a
  directory where you find your user-defined project templates. This will be
  added to :menuselection:`Project --> New From Template`. If you first activate
  |checkbox| :guilabel:`Create new project from default project` and then save
  a project in the project templates folder.
* |checkbox| :guilabel:`Prompt to save project and data source changes when
  required`
* |checkbox| :guilabel:`Prompt for confirmation when a layer is to be removed`
* |checkbox| :guilabel:`Warn when opening a project file saved with an older
  version of QGIS`
* :guilabel:`Enable macros` |selectstring|. This option was created to handle
  macros that are written to perform an action on project events. You can
  choose between 'Never', 'Ask', 'For this session only' and
  'Always (not recommended)'.

.. _`env_options`:

System Menu
-----------

**Environment**

System environment variables can now be viewed, and many configured, in the
**Environment** group (see figure_environment_variables_). This is useful for
platforms, such as Mac, where a GUI application does not necessarily inherit
the user's shell environment. It's also useful for setting and viewing environment
variables for the external tool sets controlled by the Processing toolbox (e.g.,
SAGA, GRASS), and for turning on debugging output for specific sections of the
source code.

* |checkbox| :guilabel:`Use custom variables (restart required - include separators)`.
  You can **[Add]** and **[Remove]** variables. Already-defined environment
  variables are displayed in :guilabel:`Current environment variables`, and it's
  possible to filter them by activating
  |checkbox| :guilabel:`Show only QGIS-specific variables`.

.. _figure_environment_variables:

.. only:: html

   **Figure System Environment:**

.. figure:: /static/user_manual/introduction/sys-env-options.png
   :align: center

   System environment variables in |qg|


**Plugin paths**

**[Add]** or **[Remove]** :guilabel:`Path(s) to search for additional C++
plugin libraries`


Data Sources Menu
-----------------

**Feature attributes and table**

* |checkbox| :guilabel:`Open attribute table in a dock window (QGIS restart
  required)`
* |checkbox| :guilabel:`Copy geometry in WKT representation from attribute
  table`. When using |mActionCopySelected| :sup:`Copy selected rows to
  clipboard` from the :guilabel:`Attribute table` dialog, this has the
  result that the coordinates of points or vertices are also copied to the
  clipboard.
* :guilabel:`Attribute table behavior` |selectstring|. There are three
  possibilities: 'Show all features', 'Show selected features' and 'Show
  features visible on map'.
* :guilabel:`Attribute table row cache` |selectnumber|. This row cache makes
  it possible to save the last loaded N attribute rows so that working with the
  attribute table will be quicker. The cache will be deleted when closing the
  attribute table.
* :guilabel:`Representation for NULL values`. Here, you can define a value for
  data fields containing a NULL value.

**Data source handling**

* :guilabel:`Scan for valid items in the browser dock` |selectstring|. You can
  choose between 'Check extension' and 'Check file contents'.
* :guilabel:`Scan for contents of compressed files (.zip) in browser dock`
  |selectstring|. 'No', 'Basic scan' and 'Full scan' are possible.
* :guilabel:`Prompt for raster sublayers when opening`. Some rasters support
  sublayers --- they are called subdatasets in GDAL. An example is netCDF files
  --- if there are many netCDF variables, GDAL sees every variable as a
  subdataset. The option allows you to control how to deal with sublayers when a file
  with sublayers is opened. You have the following choices:

  * ‘Always’: Always ask (if there are existing sublayers)
  * ‘If needed’: Ask if layer has no bands, but has sublayers
  * ‘Never’: Never prompt, will not load anything
  * ‘Load all’: Never prompt, but load all sublayers

* |checkbox| :guilabel:`Ignore shapefile encoding declaration`. If a shapefile
  has encoding information, this will be ignored by |qg|.
* |checkbox| :guilabel:`Add PostGIS layers with double click and select in
  extended mode`
* |checkbox| :guilabel:`Add Oracle layers with double click and select in
  extended mode`
* |checkbox| :guilabel:`Execute expressions on postgres server-side if 
  possible (Experimental)`

Rendering Menu
--------------

**Rendering behavior**

* |checkbox| :guilabel:`By default new layers added to the map should be displayed`
* |checkbox| :guilabel:`Use render caching where possible to speed up redraws`
* |checkbox| :guilabel:`Render layers in parallel using many CPU cores`
* |checkbox| :guilabel:`Max cores to use`
* :guilabel:`Map update interval (default to 250 ms)`
* |checkbox| :guilabel:`Enable feature simplification by default for newly added layers`
* :guilabel:`Simplification threshold`
* |checkbox| :guilabel:`Simplify on provider side if possible`
* :guilabel:`Maximum scale at which the layer should be simplified`

**Rendering quality**

* |checkbox| :guilabel:`Make lines appear less jagged at the expense of some
  drawing performance`

**Rasters**

* With :guilabel:`RGB band selection`, you can define the number for the Red,
  Green and Blue band.

*Contrast enhancement*

* :guilabel:`Single band gray` |selectstring|. A single band gray can have
  'No stretch', 'Stretch to MinMax', 'Stretch and Clip to MinMax' and also
  'Clip to MinMax'.
* :guilabel:`Multi band color (byte/band)` |selectstring|. Options are 'No stretch',
  'Stretch to MinMax', 'Stretch and Clip to MinMax' and 'Clip to MinMax'.
* :guilabel:`Multi band color (>byte/band)` |selectstring|. Options are 'No stretch',
  'Stretch to MinMax', 'Stretch and Clip to MinMax' and 'Clip to MinMax'.
* :guilabel:`Limits (minimum/maximum)` |selectstring|. Options are
  'Cumulative pixel count cut', 'Minimum/Maximum', 'Mean +/- standard deviation'.
* :guilabel:`Cumulative pixel count cut limits`
* :guilabel:`Standard deviation multiplier`

**Debugging**

* |checkbox| :guilabel:`Map canvas refresh`

Colors Menu
------------

This menu allows you to add some custom color that you can find in each color dialog 
window of the renderers. You will see a set of predefined colors in the tab: you can 
delete or edit all of them. Moreover you can add the color you want and perform some copy 
and paste operations. Finally you can export the color set as a :file:`gpl` file or import
them.


Canvas and Legend Menu
----------------------

**Default map appearance (overridden by project properties)**

* Define a :guilabel:`Selection color` and a :guilabel:`Background color`.

**Layer legend**

* :guilabel:`Double click action in legend` |selectstring|. You can either
  'Open layer properties' or 'Open attribute table' with the double click.
* The following :guilabel:`Legend item styles` are possible:

  * |checkbox| :guilabel:`Capitalise layer names`
  * |checkbox| :guilabel:`Bold layer names`
  * |checkbox| :guilabel:`Bold group names`
  * |checkbox| :guilabel:`Display classification attribute names`
  * |checkbox| :guilabel:`Create raster icons (may be slow)`

Map tools Menu
--------------

This menu offers some options regarding the behavior of the :guilabel:`Identify tool`.

* :guilabel:`Search radius for identifying and displaying map tips` is a tolerance factor
  expressed as a percentage of the map width. This means the identify tool will depict results
  as long as you click within this tolerance.
* :guilabel:`Highlight color` allows you to choose with which color should features being
  identified are to be highlighted.
* :guilabel:`Buffer` determines a buffer distance
  to be rendered from the outline of the identify highlight. 
* :guilabel:`Minimum width` determines how thick should
  the outline of a highlighted object be.

**Measure tool**

* Define :guilabel:`Rubberband color` for measure tools
* Define :guilabel:`Decimal places`
* |checkbox| :guilabel:`Keep base unit` to not automatically convert large numbers
  (e.g., meters to kilometers)
* :guilabel:`Preferred distance units` |radiobuttonon| ('Meters', 'Feet', 'Nautical Miles', 'Degrees' or 'Map Units' )
* :guilabel:`Preferred area units` |radiobuttonon| ('Square meters', 'Square feet', 'Square yards', 'Hectares', 'Map Units' ...)
* :guilabel:`Preferred angle units` |radiobuttonon| ('Degrees', 'Radians', 'Gon/gradians', 'Minutes of arc' ...)

**Panning and zooming**

* Define :guilabel:`Mouse wheel action` |selectstring| ('Zoom', 'Zoom and recenter',
  'Zoom to mouse cursor', 'Nothing')
* Define :guilabel:`Zoom factor` for wheel mouse

.. _predefinedscales:

**Predefined scales**

Here, you find a list of predefined scales. With the |mActionSignPlus|
and |mActionSignMinus| buttons you can add or remove your personal scales.
You can also import or export scales from/to a ``.XML`` file. Note that you still have
the possibility to remove your changes and reset to the predefined list.

Composer Menu
-------------

**Composition defaults**

You can define the :guilabel:`Default font` here.

**Grid appearance**

* Define the :guilabel:`Grid style` |selectstring| ('Solid', 'Dots', 'Crosses')
* Define the :guilabel:`Grid color`

**Grid and guide defaults**

* Define the :guilabel:`Grid spacing` |selectnumber|
* Define the :guilabel:`Grid offset` |selectnumber| for x and y
* Define the :guilabel:`Snap tolerance` |selectnumber|


Digitizing Menu
---------------

**Feature creation**

* |checkbox| :guilabel:`Suppress attributes pop-up windows after each created feature`
* |checkbox| :guilabel:`Reuse last entered attribute values`
* :guilabel:`Validate geometries`. Editing complex lines and polygons with many
  nodes can result in very slow rendering. This is because the default
  validation procedures in |qg| can take a lot of time. To speed up rendering, it
  is possible to select GEOS geometry validation (starting from GEOS 3.3) or to
  switch it off. GEOS geometry validation is much faster, but the disadvantage
  is that only the first geometry problem will be reported.

**Rubberband**

* Define Rubberband :guilabel:`Line width` and :guilabel:`Line color`

**Snapping**

* |checkbox| :guilabel:`Open snapping options in a dock window (QGIS restart required)`
* Define :guilabel:`Default snap mode` |selectstring| ('To vertex', 'To segment',
  'To vertex and segment', 'Off')
* Define :guilabel:`Default snapping tolerance` in map units or pixels
* Define the :guilabel:`Search radius for vertex edits` in map units or pixels

**Vertex markers**

* |checkbox| :guilabel:`Show markers only for selected features`
* Define vertex :guilabel:`Marker style` |selectstring| ('Cross' (default), 'Semi
  transparent circle' or 'None')
* Define vertex :guilabel:`Marker size`

**Curve offset tool**

The next 3 options refer to the |mActionOffsetCurve| :sup:`Offset Curve` tool
in :ref:`sec_advanced_edit`. Through the various settings, it is possible to
influence the shape of the line offset. These options are possible starting from GEOS 3.3.

* :guilabel:`Join style`
* :guilabel:`Quadrant segments`
* :guilabel:`Miter limit`

GDAL Menu
---------

GDAL is a data exchange library for raster files. In this tab, you can
:guilabel:`Edit create options` and :guilabel:`Edit Pyramids Options` of the
raster formats. Define which GDAL driver is to be used for a raster format, as in
some cases more than one GDAL driver is available.

CRS Menu
--------

**Default CRS for new projects**

* |radiobuttonoff| :guilabel:`Don't enable 'on the fly' reprojection`
* |radiobuttonon| :guilabel:`Automatically enable 'on the fly' reprojection if
  layers have different CRS`
* |radiobuttonoff| :guilabel:`Enable 'on the fly' reprojection by default`
* Select a CRS and :guilabel:`Always start new projects with this CRS`

**CRS for new layers**

This area allows you to define the action to take when a new layer is created, or when
a layer without a CRS is loaded.

* |radiobuttonon| :guilabel:`Prompt for CRS`
* |radiobuttonoff| :guilabel:`Use project CRS`
* |radiobuttonoff| :guilabel:`Use default CRS`

**Default datum transformations**

* |checkbox| :guilabel:`Ask for datum transformation when no default is defined`
* If you have worked with the 'on-the-fly' CRS transformation you can see the result
  of the transformation in the window below. You can find information about 'Source CRS'
  and 'Destination CRS' as well as 'Source datum transform' and 'Destination datum transform'.

Locale Menu
-----------

* |checkbox| :guilabel:`Overwrite system locale` and :guilabel:`Locale to use instead`
* Information about active system locale

Network Menu
------------

**General**

* Define :guilabel:`WMS search address`, default is
  ``http://geopole.org/wms/search?search=\%1\&type=rss``
* Define :guilabel:`Timeout for network requests (ms)` - default is 60000
* Define :guilabel:`Default expiration period for WMSC/WMTS tiles (hours)` - default is 24
* Define :guilabel:`Max retry in case of tile request errors`
* Define :guilabel:`User-Agent`


.. _figure_network_tab:

.. only:: html

   **Figure Network Tab:**

.. figure:: /static/user_manual/introduction/proxy-settings.png
   :align: center

   Proxy-settings in |qg|

**Cache settings**

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
    is useful only in the context of HTTP requests.
  * :menuselection:`FtpCachingProxy`: Implemented using an FTP proxy, it is
    useful only in the context of FTP requests.

Excluding some URLs can be added to the text box below the proxy settings (see
Figure_Network_Tab_).

If you need more detailed information about the different proxy settings,
please refer to the manual of the underlying QT library documentation at
http://doc.trolltech.com/4.5/qnetworkproxy.html#ProxyType-enum.

.. tip::
   **Using Proxies**

   Using proxies can sometimes be tricky. It is useful to proceed by 'trial and
   error' with the above proxy types, to check to see if they succeed in your case.

You can modify the options according to your needs. Some of the changes may
require a restart of |qg| before they will be effective.

* |nix| Settings are saved in a text file: :file:`$HOME/.config/QGIS/QGIS2.conf`
* |osx| You can find your settings in: :file:`$HOME/Library/Preferences/org.qgis.qgis.plist`
* |win| Settings are stored in the registry under: ``HKEY\CURRENT_USER\Software\QGIS\qgis``

.. _sec_customization:

Customization
=============

The customization tool lets you (de)activate almost every element in the |qg|
user interface. This can be very useful if you have a lot of plugins
installed that you never use and that are filling your screen.

.. _figure_customization:

.. only:: html

   **Figure Customization 1:**

.. figure:: /static/user_manual/introduction/customization.png
   :align: center

   The Customization dialog

|qg| Customization is divided into five groups. In |checkbox| :guilabel:`Menus`,
you can hide entries in the Menu bar. In |checkbox| :guilabel:`Panels`, you
find the panel windows. Panel windows are applications that can be started and
used as a floating, top-level window or embedded to the |qg| main window as a
docked widget (see also :ref:`sec_panels_and_toolbars`). In the |checkbox|
:guilabel:`Status Bar`, features like the coordinate information can be
deactivated. In |checkbox| :guilabel:`Toolbars`, you can (de)activate the
toolbar icons of |qg|, and in |checkbox| :guilabel:`Widgets`, you can (de)activate
dialogs as well as their buttons.

With |mActionSelect| :sup:`Switch to catching widgets in main application`, you
can click on elements in |qg| that you want to be hidden and find the corresponding
entry in Customization (see figure_customization_). You can also save your
various setups for different use cases as well. Before your changes
are applied, you need to restart |qg|.
