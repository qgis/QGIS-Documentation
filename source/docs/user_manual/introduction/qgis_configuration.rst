.. only:: html

   |updatedisclaimer|

******************
QGIS Configuration
******************

.. only:: html

   .. contents::
      :local:

QGIS is highly configurable through the :menuselection:`Settings` menu. Choose
between Options, Project Properties and Customization.

.. note:: QGIS follows desktop guidelines for the location of options and project
   properties item. Consequently related to the OS you are using, location of some
   of items described below could be in the :menuselection:`Project`
   or the :menuselection:`Settings` menu.

..  FIXME: please add more introduction here

.. index:: Options, Configuration
.. _gui_options:

Options
=======

|options| Some basic options for QGIS can be selected using the
:guilabel:`Options` dialog. Select the menu option :menuselection:`Settings -->`
|options| :menuselection:`Options`.
You can modify the options according to your needs. Some of the changes may
require a restart of QGIS before they will be effective.

The tabs where you can customize your options are described below.

General Tab
-------------

**Application**

* Select the :guilabel:`Style (QGIS restart required)` |selectString| and choose
  between 'Oxygen', 'Windows', 'Motif', 'CDE', 'Plastique' and 'Cleanlooks'.
* Define the :guilabel:`Icon theme` |selectString|. It can be 'default' or 'Night Mapping'.
* Define the :guilabel:`Icon size` |selectString|.
* Define the :guilabel:`Font` and its :guilabel:`Size`. The font can be
  |radioButtonOn| :guilabel:`Qt default` or a user-defined one.
* Change the :guilabel:`Timeout for timed messages or dialogs` |selectString|.
* |checkbox| :guilabel:`Hide splash screen at startup`
* |checkbox| :guilabel:`Show tips at startup`
* |checkbox| :guilabel:`Check QGIS version at startup` to keep you informed
  if a newer version is released
* |checkbox| :guilabel:`QGIS-styled group boxes`
* |checkbox| :guilabel:`Use native color chooser dialogs` (see :ref:`color-selector`)
* |checkbox| :guilabel:`Use live-updating color chooser dialogs` (see :ref:`color-selector`)
* |checkbox| :guilabel:`Canvas rotation support (restart required)`

**Project files**

* :guilabel:`Open project on launch` |selectString| (choose between 'New',
  'Most recent', 'Welcome Page', and 'Specific'). When choosing 'Specific' use
  the |browseButton| to define the project to use by default. The 'Welcome Page'
  displays a list of recent projects with screenshot.
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
* :guilabel:`Enable macros` |selectString|. This option was created to handle
  macros that are written to perform an action on project events. You can
  choose between 'Never', 'Ask', 'For this session only' and
  'Always (not recommended)'.

.. index:: Environment variables
.. _`env_options`:

System Tab
-----------

**SVG paths**

Add or Remove :guilabel:`Path(s) to search for Scalable Vector Graphic (SVG)
symbols`. These SVG files are then available to symbolize features or
decorate your map composition.


**Plugin paths**

Add or Remove :guilabel:`Path(s) to search for additional C++
plugin libraries`

**QSettings**

It helps you :guilabel:`Reset user interface to default settings (restart required)`
if you made any :ref:`customization <sec_customization>`.

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

.. figure:: /static/user_manual/introduction/sys-env-options.png
   :align: center

   System environment variables in QGIS


Data Sources Tab
-----------------

**Feature attributes and table**

* |checkbox| :guilabel:`Open attribute table in a dock window`
* :guilabel:`Copy features as` 'Plain text, no geometry', 'Plain text, WKT geometry',
  or 'GeoJSON' when pasting features in other applications.
* :guilabel:`Attribute table behavior` |selectString|. There are three
  possibilities: 'Show all features', 'Show selected features' and 'Show
  features visible on map'.
* :guilabel:`Default view`: define the view mode of the attribute table at every
  opening. It can be 'Remember last view', 'Table view' or 'Form view'.
* :guilabel:`Attribute table row cache` |selectNumber|. This row cache makes
  it possible to save the last loaded N attribute rows so that working with the
  attribute table will be quicker. The cache will be deleted when closing the
  attribute table.
* :guilabel:`Representation for NULL values`. Here, you can define a value for
  data fields containing a NULL value.

**Data source handling**

* :guilabel:`Scan for valid items in the browser dock` |selectString|. You can
  choose between 'Check extension' and 'Check file contents'.
* :guilabel:`Scan for contents of compressed files (.zip) in browser dock`
  |selectString|. 'No', 'Basic scan' and 'Full scan' are possible.
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
  has encoding information, this will be ignored by QGIS.
* |checkbox| :guilabel:`Add PostGIS layers with double click and select in
  extended mode`
* |checkbox| :guilabel:`Add Oracle layers with double click and select in
  extended mode`
* |checkbox| :guilabel:`Execute expressions on server-side if possible`


**Hidden Browser Path**

This widget lists all the folder you chose to hide from the Browser panel.
Removing a folder from the list will make it available in the Browser panel.

.. index:: Rendering

Rendering Tab
--------------

\

.. _figure_rendering_menu:

.. figure:: /static/user_manual/introduction/rendering_menu.png
   :align: center

   Rendering tab of Project Properties dialog

**Rendering behavior**

* |checkbox| :guilabel:`By default new layers added to the map should be displayed`
* |checkbox| :guilabel:`Use render caching where possible to speed up redraws`
* |checkbox| :guilabel:`Render layers in parallel using many CPU cores`
* |checkbox| :guilabel:`Max cores to use`
* :guilabel:`Map update interval (default to 250 ms)`

.. _global_simplification:

* |checkbox| :guilabel:`Enable feature simplification by default for newly added layers`
* :guilabel:`Simplification threshold`
* :guilabel:`Simplification algorithm`: This option performs a local
  "on-the-fly" simplification on feature's and speeds up geometry rendering. It
  doesn't change the geometry fetched from the data providers. This is important
  when you have expressions that use the feature geometry (e.g. calculation of
  area) - it ensures that these calculations are done on the original geometry,
  not on the simplified one. For this purpose, QGIS provides three algorithms:
  'Distance' (default), 'SnapToGrid' and 'Visvalingam'.
* |checkbox| :guilabel:`Simplify on provider side if possible`: the geometries
  are simplified by the provider (PostGIS, Oracle...) and unlike the
  local-side simplification, geometry-based calculations may be affected
* :guilabel:`Maximum scale at which the layer should be simplified`
* |doublespinbox| :guilabel:`Magnification level` (see the :ref:`magnifier <magnifier>`)

.. note:: Besides the global setting, feature simplification can be set for any
   specific layer from its :menuselection:`Layer properties --> Rendering` menu.

**Rendering quality**

* |checkbox| :guilabel:`Make lines appear less jagged at the expense of some
  drawing performance`

**Curve segmentation**

* :guilabel:`Segmentation tolerance`: this setting controls the way circular arcs
  are rendered. **The smaller** maximum angle (between the two consecutive vertices
  and the curve center, in degrees) or maximum difference (distance between the
  segment of the two vertices and the curve line, in map units), the **more
  straight line** segments will be used during rendering.
* :guilabel:`Tolerance type`: it can be 'Maximum angle' or 'Maximum distance'

  **Rasters**

* With :guilabel:`RGB band selection`, you can define the number for the Red,
  Green and Blue band.

*Contrast enhancement*

* :guilabel:`Single band gray` |selectString|. A single band gray can have
  'No stretch', 'Stretch to MinMax', 'Stretch and Clip to MinMax' and also
  'Clip to MinMax'.
* :guilabel:`Multi band color (byte/band)` |selectString|. Options are 'No stretch',
  'Stretch to MinMax', 'Stretch and Clip to MinMax' and 'Clip to MinMax'.
* :guilabel:`Multi band color (>byte/band)` |selectString|. Options are 'No stretch',
  'Stretch to MinMax', 'Stretch and Clip to MinMax' and 'Clip to MinMax'.
* :guilabel:`Limits (minimum/maximum)` |selectString|. Options are
  'Cumulative pixel count cut', 'Minimum/Maximum', 'Mean +/- standard deviation'.
* :guilabel:`Cumulative pixel count cut limits`
* :guilabel:`Standard deviation multiplier`

**Debugging**

* |checkbox| :guilabel:`Map canvas refresh`

.. index:: Colors

Colors Tab
------------

This menu allows you to add some custom color that you can find in each color dialog
window of the renderers. You will see a set of predefined colors in the tab: you can
delete or edit all of them. Moreover you can add the color you want and perform some copy
and paste operations. Finally you can export the color set as a :file:`gpl` file or import
them.


Canvas and Legend Tab
----------------------

**Default map appearance (overridden by project properties)**

* Define a :guilabel:`Selection color` and a :guilabel:`Background color`.

**Layer legend**

* :guilabel:`Double click action in legend` |selectString|. You can either
  'Open layer properties', 'Open attribute table' or 'Open layer styling dock'
  with the double click.
* The following :guilabel:`Legend item styles` are possible:

  * |checkbox| :guilabel:`Capitalise layer names`
  * |checkbox| :guilabel:`Bold layer names`
  * |checkbox| :guilabel:`Bold group names`
  * |checkbox| :guilabel:`Display classification attribute names`
  * |checkbox| :guilabel:`Create raster icons (may be slow)`
  * you can also set the :guilabel:`WMS getLegendGraphic Resolution`

.. index:: Map tools

Map tools Tab
--------------

This tab offers some options regarding the behavior of the :ref:`Identify tool <identify>`.

* :guilabel:`Search radius for identifying and displaying map tips` is a tolerance
  distance within which the identify tool will depict results
  as long as you click within this tolerance.
* :guilabel:`Highlight color` allows you to choose with which color should features being
  identified be highlighted.
* :guilabel:`Buffer` determines a buffer distance
  to be rendered from the outline of the identify highlight.
* :guilabel:`Minimum width` determines how thick should
  the outline of a highlighted object be.

**Measure tool**

* Define :guilabel:`Rubberband color` for measure tools
* Define :guilabel:`Decimal places`
* |checkbox| :guilabel:`Keep base unit` to not automatically convert large numbers
  (e.g., meters to kilometers)
* :guilabel:`Preferred distance units` |radioButtonOn| ('Meters', 'Kilometers', 'Feet',
  'Yards', 'Miles', 'Nautical Miles', 'Degrees' or 'Map Units' )
* :guilabel:`Preferred area units` |radioButtonOn| ('Square meters', 'Square
   kilometers', 'Square feet', 'Square yards', 'Square miles', 'Hectares',
   'Acres', 'Square nautical miles', 'Square degrees" or 'Map Units')
* :guilabel:`Preferred angle units` |radioButtonOn| ('Degrees', 'Radians', 'Gon/gradians',
  'Minutes of arc', 'Seconds of arc' or 'Turns/revolutions')

**Panning and zooming**

* Define a :guilabel:`Zoom factor` for zoom tools or wheel mouse

.. _predefinedscales:

**Predefined scales**

Here, you find a list of predefined scales. With the |signPlus|
and |signMinus| buttons you can add or remove your personal scales.
You can also import or export scales from/to a ``.XML`` file. Note that you still have
the possibility to remove your changes and reset to the predefined list.

Composer Tab
-------------

**Composition defaults**

You can define the :guilabel:`Default font` used within the :ref:`print composer
<label_printcomposer>`.

**Grid appearance**

* Define the :guilabel:`Grid style` |selectString| ('Solid', 'Dots', 'Crosses')
* Define the :guilabel:`Grid color`

**Grid and guide defaults**

* Define the :guilabel:`Grid spacing` |selectNumber|
* Define the :guilabel:`Grid offset` |selectNumber| for x and y
* Define the :guilabel:`Snap tolerance` |selectNumber|


**Composer Paths**

* Define :guilabel:`Path(s) to search for extra print templates`: a list of folders
  with custom composer templates to use while creating new one.

.. index:: Digitizing configuration

Digitizing Tab
---------------

This tab helps you configure general settings when :ref:`editing vector layer
<editingvector>` (attributes and geometry).

**Feature creation**

* |checkbox| :guilabel:`Suppress attribute form pop-up after feature creation`
* |checkbox| :guilabel:`Reuse last entered attribute values`
* :guilabel:`Validate geometries`. Editing complex lines and polygons with many
  nodes can result in very slow rendering. This is because the default
  validation procedures in QGIS can take a lot of time. To speed up rendering, it
  is possible to select GEOS geometry validation (starting from GEOS 3.3) or to
  switch it off. GEOS geometry validation is much faster, but the disadvantage
  is that only the first geometry problem will be reported.

**Rubberband**

* Define Rubberband :guilabel:`Line width`, :guilabel:`Line color`
  and :guilabel:`Fill color`
* :guilabel:`Don't update rubberband during node editing`

**Snapping**

* |checkbox| :guilabel:`Open snapping options in a dock window (QGIS restart required)`
* Define :guilabel:`Default snap mode` |selectString| ('To vertex', 'To segment',
  'To vertex and segment', 'Off')
* Define :guilabel:`Default snapping tolerance` in map units or pixels
* Define the :guilabel:`Search radius for vertex edits` in map units or pixels

**Vertex markers**

* |checkbox| :guilabel:`Show markers only for selected features`
* Define vertex :guilabel:`Marker style` |selectString| ('Cross' (default), 'Semi
  transparent circle' or 'None')
* Define vertex :guilabel:`Marker size`

**Curve offset tool**

The next 3 options refer to the |offsetCurve| :sup:`Offset Curve` tool in
:ref:`sec_advanced_edit`. Through the various settings, it is possible to
influence the shape of the line offset. These options are possible starting
from GEOS 3.3.

* :guilabel:`Join style`: 'Round', 'Mitre' or 'Bevel'
* :guilabel:`Quadrant segments`
* :guilabel:`Miter limit`

GDAL Tab
---------

GDAL is a data exchange library for raster files. In this tab, you can
:guilabel:`Edit create options` and :guilabel:`Edit Pyramids Options` of the
raster formats. You can define which GDAL driver is to be used for a raster
format, as in some cases more than one GDAL driver is available.

.. index:: CRS, Datum transformation, On-the-fly reprojection

CRS Tab
--------

**Default CRS for new projects**

* |radioButtonOff| :guilabel:`Don't enable 'on the fly' reprojection`
* |radioButtonOn| :guilabel:`Automatically enable 'on the fly' reprojection if
  layers have different CRS`
* |radioButtonOff| :guilabel:`Enable 'on the fly' reprojection by default`
* Select a CRS and :guilabel:`Always start new projects with this CRS`

**CRS for new layers**

This area allows you to define the action to take when a new layer is created,
or when a layer without a CRS is loaded.

* |radioButtonOn| :guilabel:`Prompt for CRS`
* |radioButtonOff| :guilabel:`Use project CRS`
* |radioButtonOff| :guilabel:`Use default CRS`

**Default datum transformations**

* |checkbox| :guilabel:`Ask for datum transformation when no default is defined`
* With the 'on-the-fly' CRS transformation enabled and the above option checked,
  adding layers of different CRS opens the :guilabel:`Select datum transformations`
  dialog. This offers you to select the most appropriate transformation settings.
  Validating this dialog with the 'Remember selection' option checked populates
  the table under :menuselection:`CRS --> Default datum transformations` with
  information about 'Source CRS' and 'Destination CRS' as well as 'Source datum
  transform' and 'Destination datum transform'. From now, QGIS automatically
  uses the selected datum transformation for further transformation between
  these two CRSs until you |signMinus| remove it from the list.

  You can use the |signPlus| button to add a datum transformation if you know
  its parameters (source and destination ellipsoids and the numbers from the
  transformation table). You then need to manually enter each setting.


.. index:: Overwrite language

Locale Tab
-----------

* |checkbox| :guilabel:`Override system locale` and :guilabel:`Locale to use instead`
* Information about active system locale

Authentication Tab
-------------------

In the :guilabel:`Authentication` tab you can set authentication configurations
and manage PKI certificates. See :ref:`authentication_index` for more
details.

.. index:: Proxy, Network

Network Tab
------------

**General**

* Define :guilabel:`WMS search address`, default is
  ``http://geopole.org/wms/search?search=\%1\&type=rss``
* Define :guilabel:`Timeout for network requests (ms)` - default is 60000
* Define :guilabel:`Default expiration period for WMS Capabilities (hours)` - default is 24
* Define :guilabel:`Default expiration period for WMSC/WMTS tiles (hours)` - default is 24
* Define :guilabel:`Max retry in case of tile or feature request errors`
* Define :guilabel:`User-Agent`

.. _figure_network_tab:

.. figure:: /static/user_manual/introduction/proxy-settings.png
   :align: center

   Proxy-settings in QGIS

**Cache settings**

Define the :guilabel:`Directory` and a :guilabel:`Size` for the cache.

* |checkbox| :guilabel:`Use proxy for web access` and define 'Host', 'Port', 'User',
  and 'Password'.
* Set the :guilabel:`Proxy type` |selectString| according to your needs.

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
http://doc.qt.io/qt-4.8/qnetworkproxy.html#ProxyType-enum

.. tip:: **Using Proxies**

   Using proxies can sometimes be tricky. It is useful to proceed by 'trial and
   error' with the above proxy types, to check if they succeed in your case.


Variables Tab
--------------

The :guilabel:`Variables` tab lists and helps you create global-level variables.
More information about variables at section :ref:`general_tools_variables`.

.. _optionsadvanced:

Advanced Tab
------------

Depending on your OS, all the settings related to QGIS (UI, tools, data providers,
default values, plugins options...) are saved:

* |nix| in a text file: :file:`$HOME/.config/QGIS/QGIS2.conf`
* |osx| in the properties list file: :file:`$HOME/Library/Preferences/org.qgis.qgis.plist`
* |win| in the registry under: ``HKEY\CURRENT_USER\Software\QGIS\qgis``

The :guilabel:`Advanced` tab offers you in a single place, regardless your OS,
means to manage these settings through the :guilabel:`Advanced Settings Editor`.
After you promise to be careful,
the widget is populated with a tree of all QGIS settings, which you can directly edit.

.. warning:: **Avoid using the Advanced tab settings blindly**

   Be careful while modifying items in this dialog given that changes are
   automatically applied. Doing changes without knowledge can break your
   QGIS installation in various ways.


.. index:: Project properties
   single: Project; Properties
   single: Settings; Project

Project Properties
==================

In the properties window for the project under :menuselection:`Project -->
Project Properties` (or |kde| :menuselection:`Settings --> Project Properties`),
you can set project-specific options.

The project-specific options overwrite their equivalent in the options
described above.

* In the :guilabel:`General` tab, the **general settings** let you:

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

.. _figure_general_tab:

.. figure:: /static/user_manual/introduction/project_general.png
   :align: center

   General tab of Project Properties dialog

* The :guilabel:`CRS` tab enables you to choose the Coordinate Reference
  System for this project, and to enable on-the-fly re-projection of raster and
  vector layers when displaying layers from a different CRS.
* With the :guilabel:`Identify layers` tab, you set (or disable) which
  layers will respond to the :ref:`identify tool <identify>`. By default, layers
  are set queryable.
  
  You can also set whether a layer should appear as ``read-only``, meaning that
  it can not be edited by the user, regardless of the data provider's
  capabilities. Although this is a weak protection, it remains a quick and handy
  configuration to avoid end-users modifying data when working with file-based layers.
* The :guilabel:`Default Styles` tab lets you control how new layers will be
  drawn when they do not have an existing :file:`.qml` style defined. You can
  also set the default transparency level for new layers and whether symbols
  should have random colors assigned to them.
  There is also an additional section where you can define specific colors for the
  running project. You can find the added colors in the drop down menu of the color dialog
  window present in each renderer.
* The tab :guilabel:`OWS Server` allows you to define information about the QGIS
  Server WMS and WFS capabilities, extent and CRS restrictions.
* The :guilabel:`Macros` tab is used to edit Python macros for projects. Currently,
  only three macros are available: ``openProject()``, ``saveProject()`` and
  ``closeProject()``.

.. _figure_macro_tab:

.. figure:: /static/user_manual/introduction/macro.png
   :align: center

   Macro settings in QGIS


* The :guilabel:`Relations` tab is used to define 1:n relations. The relations
  are defined in the project properties dialog. Once relations exist for a layer,
  a new user interface element in the form view (e.g. when identifying a feature
  and opening its form) will list the related entities. This provides a powerful
  way to express e.g. the inspection history on a length of pipeline or road segment.
  You can find out more about 1:n relations support in Section :ref:`vector_relations`.
* In the :guilabel:`Data Sources` tab, you can:

  * |checkbox| :guilabel:`Evaluate default values on provider side`: When adding
    new features in a PostGreSQL table, fields with default value constraint are
    evaluated and populated at the form opening, and not at the commit moment.
    This means that instead of an expression like ``nextval('serial')``, the field
    in the :guilabel:`Add Feature` form will display expected value (e.g., ``25``).
  * |checkbox| :guilabel:`Automatically create transaction groups where possible`:
    When this mode is turned on, all
    (postgres) layers from the same database are synchronised in their edit state,
    i.e. when one layer is put into edit state, all are, when one layer is committed
    or one layer is rolled back, so are the others. Also, instead of buffering edit
    changes locally, they are directly sent to a transaction in the database which
    gets committed when the user clicks save layer.
    Note that you can (de)activate this option only if no layer is being edited
    in the project.

* Besides the list of global-level variables, The :guilabel:`Variables` tab
  lists and helps you create project-level variables.
  More information about variables at section :ref:`general_tools_variables`.


.. index:: Customization
.. _sec_customization:

Customization
=============

The customization dialog lets you (de)activate almost every element in the QGIS
user interface. This can be very useful if you want to provide your end-users with a
'light' version of QGIS, containing only the icons, menus or panels they need.

.. note::
   Before your changes are applied, you need to restart QGIS.

.. _figure_customization:

.. figure:: /static/user_manual/introduction/customization.png
   :align: center

   The Customization dialog

Ticking the |checkbox| :guilabel:`Enable customization` checkbox is the first step
on the way to QGIS customization. This enables the toolbar and the widget
panel from which you can uncheck and thus disable some GUI items.

The configurable item can be:

* a **Menu** or some of its sub-menus from the :ref:`label_menubar`
* a whole **Panel** (see :ref:`sec_panels_and_toolbars`)
* the **Status bar** described in :ref:`label_statusbar` or some of its items
* a **Toolbar**: the whole bar or some of its icons
* or any **widget** from any dialog in QGIS: label, button, combobox...

With |select| :sup:`Switch to catching widgets in main application`, you
can click on an item in QGIS interface that you want to be hidden and
QGIS automatically unchecks the corresponding entry in the Customization dialog.

Once you setup your configuration, click **[Apply]** or **[Ok]** to validate your
changes. This configuration becomes the one used by default by QGIS at the next startup.

The modifications can also be saved in a ``.ini`` file using |fileSave|
:sup:`Save To File` button. This is a handy way to share a common QGIS
interface among multiple users. Just click on |fileOpen| :sup:`Load from File`
from the destination computer in order to import the ``.ini`` file.
You can also run :ref:`command line tools <custom_commandline>` and save various
setups for different use cases as well.

.. _tip_restoring_configuration:

.. tip:: **Easily restore predefined QGIS**

   The initial QGIS GUI configuration can be restored by one of the methods below:

   * unchecking |checkbox| :guilabel:`Enable customization` option in the
     Customization dialog or click the |selectAllTree| :sup:`Check All` button
   * pressing the **[Reset]** button in the **QSettings** frame under
     :menuselection:`Settings --> Options` menu, :guilabel:`System` tab
   * launching QGIS at a command prompt with the following command line
     ``qgis --nocustomization``
   * setting to ``false`` the value of :menuselection:`UI --> Customization -->
     Enabled` variable under :menuselection:`Settings --> Options` menu,
     :guilabel:`Advanced` tab (see the :ref:`warning <optionsadvanced>`).

   In most cases, you need to restart QGIS in order to have the change applied.

