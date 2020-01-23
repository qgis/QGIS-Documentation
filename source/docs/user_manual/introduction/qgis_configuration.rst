******************
QGIS Configuration
******************

.. only:: html

   .. contents::
      :local:
      :depth: 2

QGIS is highly configurable. Through the :menuselection:`Settings` menu, it
provides different tools to:

* |styleManager| :guilabel:`Style Manager...`: create and manage :ref:`symbols,
  styles and color ramps <vector_style_manager>`.
* |customProjection| :guilabel:`Custom Projections...`: create your own
  :ref:`coordinate reference systems <sec_custom_projections>`.
* |keyboardShortcuts| :guilabel:`Keyboard Shortcuts...`: define your own set of
  :ref:`keyboard shortcuts <shortcuts>`.
  Also, they can be overridden during each QGIS session by the :ref:`project
  properties <project_properties>` (accessible under :menuselection:`Project` menu).
* |interfaceCustomization| :guilabel:`Interface Customization...`: configure the
  :ref:`application interface <sec_customization>`, hiding dialogs or tools you may
  not need.
* |options| :guilabel:`Options...`: set global :ref:`options <gui_options>` to
  apply in different areas of the software. These preferences are saved in the
  active :ref:`User profile <user_profiles>` settings and applied by default
  whenever you open a new project with this profile.


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

.. note:: **Plugins can embed their settings within the Options dialog**

 While only Core settings are presented below, note that this list can be extended
 by :ref:`installed plugins <plugins>` implementing their own options into the
 standard Options dialog. This avoids each plugin having their own config dialog
 with extra menu items just for them...

 .. Todo: Would be nice to link in the future to a place in the PyQGIS Cookbook
   showing the code to use to implement plugin options in standard dialog


.. _general_options:

General Settings
----------------

.. index:: Overwrite language
.. _locale_options:

**Override System Locale**

By default, QGIS relies on your Operating System configuration to set language
and manipulate numerical values. Enabling this group allows you to customize
the behavior.

* Select from :guilabel:`User interface translation` the language to apply to
  the GUI
* Select in :guilabel:`Locale (number, date and currency formats)` the system
  on which date and numeric values should be input and rendered
* |checkbox| :guilabel:`Show group (thousand) separator`

A summary of the selected settings and how they would be interpreted is
displayed at the bottom of the frame.


**Application**

* Select the :guilabel:`Style (QGIS restart required)` ie, the widgets look and
  placement in dialogs. Possible values depend on your Operating System.
* Define the :guilabel:`UI theme (QGIS restart required)` |selectString|.
  It can be 'default', 'Night Mapping', or 'Blend of Gray'
* Define the :guilabel:`Icon size` |selectString|
* Define the :guilabel:`Font` and its :guilabel:`Size`. The font can be
  |radioButtonOn| :guilabel:`Qt default` or a user-defined one
* Change the :guilabel:`Timeout for timed messages or dialogs`
* |unchecked| :guilabel:`Hide splash screen at startup`
* |checkbox| :guilabel:`Show QGIS news feed on welcome page`: displays a curated
  QGIS news feed on the welcome page, giving you a direct way to be aware of
  project news (user/developer meetings date and summary, community surveys,
  releases announcements, various tips...)
* |checkbox| :guilabel:`Check QGIS version at startup` to keep you informed
  if a newer version is released
* |unchecked| :guilabel:`Use native color chooser dialogs`
  (see :ref:`color-selector`)
* |unchecked| :guilabel:`Modeless data source manager dialog` to keep the
  :ref:`data source manager <datasourcemanager>` dialog opened and allow
  interaction with QGIS interface while adding layers to project


.. _projectfiles_options:

**Project files**

* :guilabel:`Open project on launch`

  * 'Welcome Page' (default): can display the "News" feed, the project
    template(s) and the most recent projects (with thumbnails) of the
    :ref:`user profile <user_profiles>`. No project is opened by default.
  * 'New': opens a new project, based on the default template
  * 'Most recent': reopens the last saved project
  * and 'Specific': opens a particular project. Use the :guilabel:`...` button
    to define the project to use by default.
* |checkbox| :guilabel:`Create new project from default project`. You have the
  possibility to press on :guilabel:`Set current project as default` or on
  :guilabel:`Reset default`. You can browse through your files and define a
  directory where you find your user-defined project templates. This will be
  added to :menuselection:`Project --> New From Template`. If you first activate
  |checkbox| :guilabel:`Create new project from default project` and then save
  a project in the project templates folder.
* |checkbox| :guilabel:`Prompt to save project and data source changes when
  required` to avoid losing changes you made.
* |checkbox| :guilabel:`Prompt for confirmation when a layer is to be removed`
* |checkbox| :guilabel:`Warn when opening a project file saved with an older
  version of QGIS`. You can always open projects created with older version of
  QGIS but once the project is saved, trying to open with older release may fail
  because of features not available in that version.
* :guilabel:`Enable macros` |selectString|. This option was created to handle
  macros that are written to perform an action on project events. You can
  choose between 'Never', 'Ask', 'For this session only' and
  'Always (not recommended)'.
* :guilabel:`Default project file format`

  * |radioButtonOn| :guilabel:`QGZ Archive file format, supports auxiliary data`
    (see :ref:`auxiliary data <vector_auxiliary_storage>`)
  * |radioButtonOff| :guilabel:`QGS Project saved in a clear text, does not
    support auxiliary data`


.. index:: Environment variables
.. _`env_options`:

System Settings
---------------

.. _svg_paths:

**SVG paths**

Add or Remove :guilabel:`Path(s) to search for Scalable Vector Graphic (SVG)
symbols`. These SVG files are then available to symbolize or label the features
or decorate your map composition.

When using an SVG file in a symbol or a label, QGIS allows you to:

* load the file from the file system: the file is identified through the file path and
  QGIS needs to resolve the path in order to display the corresponding image
* load the file from a remote URL: as above, the image will only be loaded on successful
  retrieval of the remote resource
* embed the SVG file into the item: the file is embedded inside
  the current project, style database, or print layout template.
  The SVG file is then always rendered as part of the item.
  This is a convenient way to create self-contained projects with custom SVG symbols
  which can be easily shared amongst different users and installations of QGIS.

  It is also possible to extract the embedded SVG file from a symbol or label
  and save it on disk.

.. note:: The above mentioned options for loading and storing an SVG file in a project
 are also applicable to raster images you may want to use for customizing
 symbols, labels or decorations.

**Plugin paths**

Add or Remove :guilabel:`Path(s) to search for additional C++
plugin libraries`.

**Documentation paths**

Add or Remove :guilabel:`Documentation Path(s)` to use for QGIS help. By default,
a link to the official online User Manual corresponding to the version being used
is added. You can however add other links and prioritize them from top to bottom:
each time you click on a :guilabel:`Help` button in a dialog, the topmost link
is checked and if no corresponding page is found, the next one is tried,
and so on.

.. note::
  Documentation is versioned and translated only for QGIS Long Term Releases (LTR),
  meaning that if you are running a regular release (eg, QGIS 3.0), the help button
  will by default open the next LTR manual page (ie. 3.4 LTR), which may contain
  description of features in newer releases (3.2 and 3.4). If no LTR documentation
  is available then the *testing* doc, with features from newer and development
  versions, is used.

**QSettings**

It helps you :guilabel:`Reset user interface to default settings (restart required)`
if you made any :ref:`customization <sec_customization>`.

**Environment**

.. _figure_environment_variables:

.. figure:: img/sys-env-options.png
   :align: center

   System environment variables in QGIS

System environment variables can be viewed, and many configured, in the
**Environment** group. This is useful for
platforms, such as Mac, where a GUI application does not necessarily inherit
the user's shell environment. It's also useful for setting and viewing environment
variables for the external tool sets controlled by the Processing toolbox (e.g.,
SAGA, GRASS), and for turning on debugging output for specific sections of the
source code.

|checkbox| :guilabel:`Use custom variables (restart required - include separators)`.
You can :guilabel:`Add` and :guilabel:`Remove` variables. Already defined environment
variables are displayed in :guilabel:`Current environment variables`, and it's
possible to filter them by activating
|checkbox| :guilabel:`Show only QGIS-specific variables`.

.. index:: CRS, Datum transformation, On-the-fly reprojection
.. _crs_options:

CRS Settings
------------

.. note:: For more information on how QGIS handles layer projection, please
  read the dedicated section at :ref:`label_projections`.

.. _figure_crs_options:

.. figure:: img/options_crs.png
   :align: center

   CRS Settings in QGIS

**CRS for projects**

There is an option to automatically set new project’s CRS:

* |radioButtonOn|:guilabel:`Use CRS from first layer added`: the CRS of the
  project will be set to the CRS of the first layer loaded into it
* |radioButtonOff|:guilabel:`Use a default CRS`: a preselected CRS is applied by
  default to any new project and is left unchanged when adding layers to the
  project.

The choice will be saved for use in subsequent QGIS sessions.
The Coordinate Reference System of the project can still be overridden from
the :menuselection:`Project --> Properties... --> CRS` tab.

**CRS for layers**

:guilabel:`Default CRS for layers`: select a default CRS to use when you
create a layer

You can also define the action to take when a new layer is created,
or when a layer without a CRS is loaded.

* |radioButtonOn| :guilabel:`Leave as unknown CRS (take no action)`
* |radioButtonOff| :guilabel:`Prompt for CRS`
* |radioButtonOff| :guilabel:`Use project CRS`
* |radioButtonOff| :guilabel:`Use a default CRS`

**Default datum transformations**

In this group, you can control whether reprojecting layers to another CRS should be:

* automatically processed using QGIS default transformations settings;
* and/or more controlled by you with custom preferences such as:

  * |checkbox| :guilabel:`Ask for datum transformation if several are available`
  * a predefined list of datum transformations to apply by default.
    See :ref:`datum_transformation` for more details.


* |unchecked| :guilabel:`Planimetric measurements`: sets the default for the
  "planimetric measurements" property for newly created projects.


.. _datasources_options:

Data Sources Settings
---------------------

.. _figure_data_sources_settings:

.. figure:: img/options_data_sources.png
   :align: center

   Data Sources Settings in QGIS


**Feature attributes and table**

* |checkbox| :guilabel:`Open new attribute tables as docked windows`
* :guilabel:`Copy features as` 'Plain text, no geometry', 'Plain text, WKT geometry',
  or 'GeoJSON' when pasting features in other applications.
* :guilabel:`Attribute table behavior` |selectString|: set filter on the attribute
  table at the opening. There are three possibilities: 'Show all features',
  'Show selected features' and 'Show features visible on map'.
* :guilabel:`Default view`: define the view mode of the attribute table at every
  opening. It can be 'Remember last view', 'Table view' or 'Form view'.
* :guilabel:`Attribute table row cache` |selectNumber|. This row cache makes
  it possible to save the last loaded N attribute rows so that working with the
  attribute table will be quicker. The cache will be deleted when closing the
  attribute table.
* :guilabel:`Representation for NULL values`. Here, you can define a value for
  data fields containing a NULL value.

.. _tip_table_filtering:

.. tip:: **Improve opening of big data attribute table**

 When working with layers with big amount of records, opening the attribute table
 may be slow as the dialog request all the rows in the layer. Setting the
 :guilabel:`Attribute table behavior` to **Show features visible on map** will
 make QGIS request only the features in the current map canvas when opening the
 table, allowing a quick data loading.

 Note that data in this attribute table instance will be always tied to the canvas
 extent it was opened with, meaning that selecting **Show All Features** within
 such a table will not display new features. You can however update the set of
 displayed features by changing the canvas extent and selecting **Show Features
 Visible On Map** option in the attribute table.


**Data source handling**

* :guilabel:`Scan for valid items in the browser dock` |selectString|. You can
  choose between 'Check extension' and 'Check file contents'.
* :guilabel:`Scan for contents of compressed files (.zip) in browser dock`
  |selectString| defines how detailed is the widget information at the bottom
  of the Browser panel when querying such files. 'No', 'Basic scan' and 'Full scan'
  are possible options.
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
* |checkbox| :guilabel:`Execute expressions on server-side if possible`: When
  requesting features from a datasource, QGIS will try to optimize requests by
  sending filter criteria directly to the server and only download the features
  which match the criteria. For example, if for a list on the user interface
  only the farmers which live in Bern should be listed, QGIS will send a ``WHERE
  "hometown" = 'Bern'`` to the database.
  In some cases, filter criteria are too complex to be translated from QGIS
  Expressions to database compatible SQL. In those cases, QGIS will download
  the whole data and filter locally to be on the safe side, which is much less
  performant.

  By disabling this option, QGIS can be forced to always download the whole data
  and filter locally, at the expense of a performance penalty. This option is
  meant as a safety break and should only be deactivated if you identify a
  misbehavior of the QGIS expression translation engine.
* |checkbox| :guilabel:`Evaluate default values` defines whether default values
  from database provider should be calculated when digitizing the new feature
  (checked status) or when saving the changes.


**Hidden Browser Path**

This widget lists all the folders you chose to hide from the :ref:`Browser panel
<browser_panel>`.
Removing a folder from the list will make it available in the :guilabel:`Browser`
panel.


.. index:: Rendering
.. _rendering_options:

Rendering Settings
------------------

.. _figure_rendering_menu:

.. figure:: img/rendering_menu.png
   :align: center

   Rendering tab of Project Properties dialog

**Rendering behavior**

* |checkbox| :guilabel:`By default new layers added to the map should be
  displayed`: unchecking this option can be handy when loading multiple layers
  to avoid each new layer being rendered in the canvas and slow down the process
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
* |unchecked| :guilabel:`Simplify on provider side if possible`: the geometries
  are simplified by the provider (PostGIS, Oracle...) and unlike the
  local-side simplification, geometry-based calculations may be affected
* :guilabel:`Maximum scale at which the layer should be simplified`
* |doubleSpinBox| :guilabel:`Magnification level` (see the :ref:`magnifier <magnifier>`)

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
* :guilabel:`Tolerance type`: it can be *Maximum angle* or *Maximum difference*
  between approximation and curve.

**Rasters**

* With :guilabel:`RGB band selection`, you can define the number for the Red,
  Green and Blue band.

*Contrast enhancement*

Contrast enhancement options can be applied to :guilabel:`Single band gray`,
:guilabel:`Multi band color (byte/band)` or :guilabel:`Multi band color (>byte/band)`.
For each, you can set:

* the :guilabel:`Algorithm` to use, whose values can be 'No stretch',
  'Stretch to MinMax', 'Stretch and Clip to MinMax' or 'Clip to MinMax'
* the :guilabel:`Limits (minimum/maximum)` to apply, with values such as 'Cumulative
  pixel count cut', 'Minimum/Maximum', 'Mean +/- standard deviation'.

For rasters rendering, you can also define the following options:

* :guilabel:`Cumulative pixel count cut limits`
* :guilabel:`Standard deviation multiplier`

**Debugging**

* |checkbox| :guilabel:`Map canvas refresh` to debug rendering duration in
  the :guilabel:`Log Messages` panel.

.. _canvas_legend_options:

Canvas and Legend Settings
--------------------------

.. _figure_canvas_legend:

.. figure:: img/options_canvas_legend.png
   :align: center

   Canvas and Legend Settings

These properties let you set:

* the **Default map appearance (overridden by project properties)**: the
  :guilabel:`Selection color` and :guilabel:`Background color`.

* **Layer legend** interaction:

  * :guilabel:`Double click action in legend` |selectString|. You can either
    'Open layer properties', 'Open attribute table' or 'Open layer styling dock'
    with the double click.
  * |checkbox| :guilabel:`Display classification attribute names` in the Layers
    panel, e.g. when applying a categorized or rule-based renderer
    (see :ref:`vector_style_menu` for more information).
  * the :guilabel:`WMS getLegendGraphic Resolution`
* the :guilabel:`Delay` in milliseconds of layers :ref:`map tips <maptips>` display

.. index:: Map tools
.. _maptools_options:

Map tools Settings
------------------

.. _figure_map_tools_settings:

.. figure:: img/options_map_tools.png
   :align: center

   Map tools Settings in QGIS

This tab offers some options regarding the behavior of the :ref:`Identify tool <identify>`.

* :guilabel:`Search radius for identifying features and displaying map tips` is
  a tolerance distance within which the identify tool will depict results
  as long as you click within this tolerance.
* :guilabel:`Highlight color` allows you to choose with which color features
  being identified should be highlighted.
* :guilabel:`Buffer` determines a buffer distance
  to be rendered from the outline of the identify highlight.
* :guilabel:`Minimum width` determines how thick should
  the outline of a highlighted object be.

**Measure tool**

* Define :guilabel:`Rubberband color` for measure tools
* Define :guilabel:`Decimal places`
* |checkbox| :guilabel:`Keep base unit` to not automatically convert large
  numbers (e.g., meters to kilometers)
* :guilabel:`Preferred distance units`: options are 'Meters', 'Kilometers',
  'Feet', 'Yards', 'Miles', 'Nautical Miles', 'Centimeters', 'Millimeters',
  'Degrees' or 'Map Units'
* :guilabel:`Preferred area units`: options are 'Square meters', 'Square
  kilometers', 'Square feet', 'Square yards', 'Square miles', 'Hectares',
  'Acres', 'Square nautical miles', 'Square centimeters', 'Square millimeters',
  'Square degrees' or 'Map Units'
* :guilabel:`Preferred angle units`: options are 'Degrees', 'Radians',
  'Gon/gradians', 'Minutes of arc', 'Seconds of arc', 'Turns/revolutions',
  milliradians (SI definition) or mil (NATO/military definition)

**Panning and zooming**

* Define a :guilabel:`Zoom factor` for zoom tools or wheel mouse

.. _predefinedscales:

**Predefined scales**

Here, you find a list of predefined scales. With the |signPlus|
and |signMinus| buttons you can add or remove your personal scales.
You can also import or export scales from/to a ``.XML`` file. Note that you
still have the possibility to remove your changes and reset to the predefined
list.


.. index:: Colors
.. _colors_options:

Colors Settings
---------------

.. _figure_colors_options:

.. figure:: img/options_colors.png
   :align: center

   Colors Settings

This menu allows you to create or update palettes of colors used throughout the
application in the :ref:`color selector widget <color_widget>`. You can choose
from:

* :guilabel:`Recent colors` showing recently used colors
* :guilabel:`Standard colors`, the default palette of colors
* :guilabel:`Project colors`, a set of colors specific to the current project
  (see :ref:`default_styles_properties` for more details)
* :guilabel:`New layer colors`, a set of colors to use by default when new
  layers are added to QGIS
* or custom palette(s) you can create or import using the :guilabel:`...`
  button next to the palette combobox.

By default, :guilabel:`Recent colors`, :guilabel:`Standard colors` and
:guilabel:`Project colors` palettes can not be removed and are set to appear in
the color button drop-down. Custom palettes can also be added to this widget
thanks to the :guilabel:`Show in Color Buttons` option.

For any of the palettes, you can manage the list of colors using the set of
tools next to the frame, ie:

* |signPlus| :guilabel:`Add` or |signMinus| :guilabel:`Remove` color
* |editCopy| :guilabel:`Copy` or |editPaste| :guilabel:`Paste` color
* |fileOpen| :guilabel:`Import` or |fileSave| :guilabel:`Export` the set of colors
  from/to :file:`.gpl` file.

Double-click a color in the list to tweak or replace it in the :ref:`Color
Selector <color-selector>` dialog. You can also rename it by double-clicking
in the :guilabel:`Label` column.


.. index:: Digitizing configuration
.. _digitizing_options:

Digitizing Settings
-------------------

.. _figure_digitizing_settings:

.. figure:: img/options_digitizing.png
   :align: center

   Digitizing Settings in QGIS

This tab helps you configure general settings when :ref:`editing vector layer
<editingvector>` (attributes and geometry).

**Feature creation**

* |checkbox| :guilabel:`Suppress attribute form pop-up after feature creation`:
  this choice can be overridden in each layer properties dialog.
* |checkbox| :guilabel:`Reuse last entered attribute values`.
* :guilabel:`Validate geometries`. Editing complex lines and polygons with many
  nodes can result in very slow rendering. This is because the default
  validation procedures in QGIS can take a lot of time. To speed up rendering, it
  is possible to select GEOS geometry validation (starting from GEOS 3.3) or to
  switch it off. GEOS geometry validation is much faster, but the disadvantage
  is that only the first geometry problem will be reported.

  Note that depending on the selection, reports of geometry errors may differ
  (see :ref:`typesofgeomerrors`)
* :guilabel:`Default Z value` to use when creating new 3D features.

**Rubberband**

* Define Rubberband :guilabel:`Line width`, :guilabel:`Line color`
  and :guilabel:`Fill color`.
* :guilabel:`Don't update rubberband during vertex editing`.

**Snapping**

* |checkbox| :guilabel:`Enable snapping by default` activates snapping when
  a project is opened
* Define :guilabel:`Default snap mode` |selectString| ('Vertex', 'Vertex and segment',
  'Segment')
* Define :guilabel:`Default snapping tolerance` in map units or pixels
* Define the :guilabel:`Search radius for vertex edits` in map units or pixels
* :guilabel:`Display main dialog as (restart required)`: set whether the
  Advanced Snapping dialog should be shown as 'Dialog' or 'Dock'.
* :guilabel:`Snapping marker color`
* |checkbox| :guilabel:`Show snapping tooltips` such as name of the layer whose
  feature you are about to snap. Helpful when multiple features overlap.
* |checkbox| :guilabel:`Enable snapping on invisible features (not shown on the
  map canvas)`


**Vertex markers**

* |checkbox| :guilabel:`Show markers only for selected features`
* Define vertex :guilabel:`Marker style` |selectString| ('Cross' (default), 'Semi
  transparent circle' or 'None')
* Define vertex :guilabel:`Marker size (in millimeter)`

**Curve offset tool**

The next 3 options refer to the |offsetCurve| :sup:`Offset Curve` tool in
:ref:`sec_advanced_edit`. Through the various settings, it is possible to
influence the shape of the line offset. These options are possible starting
from GEOS 3.3.

* :guilabel:`Join style`: 'Round', 'Mitre' or 'Bevel'
* :guilabel:`Quadrant segments`
* :guilabel:`Miter limit`


.. _layout_options:

Layouts Settings
----------------

.. _figure_layouts_settings:

.. figure:: img/options_layouts.png
   :align: center

   Layouts Settings in QGIS


**Composition defaults**

You can define the :guilabel:`Default font` used within the :ref:`print layout
<label_printlayout>`.

**Grid appearance**

* Define the :guilabel:`Grid style` |selectString| ('Solid', 'Dots', 'Crosses')
* Define the :guilabel:`Grid color`

**Grid and guide defaults**

* Define the :guilabel:`Grid spacing` |selectNumber|
* Define the :guilabel:`Grid offset` |selectNumber| for X and Y
* Define the :guilabel:`Snap tolerance` |selectNumber|


**Layout Paths**

* Define :guilabel:`Path(s) to search for extra print templates`: a list of folders
  with custom layout templates to use while creating new one.


.. _gdal_options:

GDAL Settings
-------------

`GDAL <https://gdal.org>`_ is a data exchange library for vector and raster
files. It provides drivers to read and or write data in different formats.
The :guilabel:`GDAL` tab currently exposes the drivers for raster formats with
their capabilities.

GDAL driver options
...................

This frame provides ways to customize the behavior of drivers that support read
and write access:

.. _gdal_createoptions:

* :guilabel:`Edit create options`: allows you to edit or add different profiles
  of file transformation, i.e. a set of predefined combinations of parameters
  (type and level of compression, blocks size, overview, colorimetry, alpha...)
  to use when outputting raster files. The parameters depend on the driver.

  .. _figure_gdal_create_settings:

  .. figure:: img/gdalCreateOptions.png
     :align: center

     Sample of create options profile (for GeoTiff)

  The upper part of the dialog lists the current profile(s) and allows you to
  add new ones or remove any of them. You can also reset the profile to its
  default parameters if you have changed them. Some drivers (eg, GeoTiff)
  have some sample of profiles you can work with.

  At the bottom of the dialog:

  * The |signPlus| button lets you add rows to fill with the parameter name and value
  * The |signMinus| button deletes the selected parameter
  * Click the :guilabel:`Validate` button to check that the creation options
    entered for the given format are valid
  * Use the :guilabel:`Help` button to find the parameters to use, or refer
    to the `GDAL raster drivers documentation
    <https://gdal.org/drivers/raster/index.html>`_.

.. _gdal_pyramidsoptions:

* :guilabel:`Edit Pyramids Options`

  .. _figure_gdal_pyramids_settings:

  .. figure:: img/gdalPyramidsOptions.png
     :align: center

     Sample of Pyramids profile

GDAL drivers
............

In this frame, you can define which GDAL driver is to use to read and/or
write files, as in some cases more than one GDAL driver is available.

.. _figure_gdal_settings:

.. figure:: img/options_gdal.png
   :align: center

   GDAL Settings in QGIS

.. tip:: Double-click a driver that allows read and write access (``rw+(v)``)
  opens the :ref:`Edit Create options <gdal_createoptions>` dialog for
  customization.

.. index:: Variables
.. _variables_options:

Variables Settings
------------------

The :guilabel:`Variables` tab lists all the variables available at the
global-level.

It also allows the user to manage global-level variables. Click the |signPlus|
button to add a new custom global-level variable. Likewise, select a custom
global-level variable from the list and click the |signMinus| button to remove
it.

More information about variables in the :ref:`general_tools_variables`
section.


.. _figure_variables_settings:

.. figure:: img/options_variables_global.png
   :align: center

   Variables Settings in QGIS


.. index:: Authentication
.. _authentication_options:

Authentication Settings
-----------------------

In the :guilabel:`Authentication` tab you can set authentication configurations
and manage PKI certificates. See :ref:`authentication_index` for more
details.


.. _figure_authentication_settings:

.. figure:: ../auth_system/img/auth-editor-configs2.png
   :align: center

   Authentication Settings in QGIS


.. index:: Proxy, Network
.. _network_options:

Network Settings
----------------

**General**

* Define :guilabel:`WMS search address`, default is
  ``http://geopole.org/wms/search?search=\%1\&type=rss``
* Define :guilabel:`Timeout for network requests (ms)` - default is 60000
* Define :guilabel:`Default expiration period for WMS Capabilities (hours)` -
  default is 24
* Define :guilabel:`Default expiration period for WMSC/WMTS tiles (hours)` -
  default is 24
* Define :guilabel:`Max retry in case of tile or feature request errors`
* Define :guilabel:`User-Agent`

.. _figure_network_tab:

.. figure:: img/proxy-settings.png
   :align: center

   Proxy-settings in QGIS

**Cache settings**

Defines the :guilabel:`Directory` and a :guilabel:`Size` for the cache.
Also offers tools to :guilabel:`automatically clear the connection authentication
cache on SSL errors (recommended)`.

**Proxy for web access**

* |checkbox| :guilabel:`Use proxy for web access`
* Set the :guilabel:`Proxy type` |selectString| according to your needs and
  define 'Host' and 'Port'. Available proxy types are:

  * :menuselection:`Default Proxy`: Proxy is determined based on system's proxy
  * :menuselection:`Socks5Proxy`: Generic proxy for any kind of connection.
    Supports TCP, UDP, binding to a port (incoming connections) and authentication.
  * :menuselection:`HttpProxy`: Implemented using the "CONNECT" command, supports
    only outgoing TCP connections; supports authentication.
  * :menuselection:`HttpCachingProxy`: Implemented using normal HTTP commands, it
    is useful only in the context of HTTP requests.
  * :menuselection:`FtpCachingProxy`: Implemented using an FTP proxy, it is
    useful only in the context of FTP requests.

Credentials of proxy are set using the :ref:`authentication widget <authentication>`.

Excluding some URLs can be added to the text box below the proxy settings (see
Figure_Network_Tab_). No proxy will be used if the target url starts with one of
the string listed in this text box.

If you need more detailed information about the different proxy settings,
please refer to the manual of the underlying QT library documentation at
https://doc.qt.io/qt-5.9/qnetworkproxy.html#ProxyType-enum

.. tip:: **Using Proxies**

   Using proxies can sometimes be tricky. It is useful to proceed by 'trial and
   error' with the above proxy types, to check if they succeed in your case.

.. index:: Search widget, Locator
.. _locator_options:

Locator Settings
----------------

|search| The :guilabel:`Locator` tab allows to configure the :ref:`Locator bar <locator_bar>`, a
quick search widget available on the status bar that helps you perform searches
anywhere in the application. It provides some default filters (with prefix) to use:

* Project layers (``l``): finds and selects a layer in the :guilabel:`Layers`
  panel.
* Project layouts (``pl``): finds and opens a print layout.
* Actions (``.``): finds and executes a QGIS action; actions can be any tool
  or menu in QGIS, opening a panel...
* Active layer features (``f``): searches for matching attributes in any field
  from the current active layer and zooms to the selected feature.
* Features in all layers (``af``): searches for matching attributes in the
  :ref:`display name <maptips>` of each :ref:`searchable layers <project_layer_capabilities>`
  and zooms to the selected feature.
* Calculator (``=``): allows evaluation of any QGIS expression and, if valid,
  gives an option to copy the result to the clipboard.
* Spatial bookmarks (``b``): finds and zooms to the bookmark extent.
* Settings (``set``): browses and opens project and application-wide properties
  dialogs.
* Processing (``a``): searches and opens a Processing algorithm dialog.
* Edit selected features (``ef``): gives quick access and runs a compatible
  :ref:`modify-in-place <processing_inplace_edit>` Processing algorithm on the
  active layer.

For each filter, you can customize the filter, set whether it is enabled by default or not.
The set of default locator filters can be extended by plugins, eg for OSM
nominatim searches, direct database searching, layer catalog searches.

The locator search bar can be activated pressing :kbd:`Ctrl+K`. Type your text
to perform a search. By default, results are returned for all enabled locator
filters but you can limit the search to a certain filter by prefixing your
text with the locator filter prefix, ie. typing ``l cad`` will return only the
layers whose name contains ``cad``. Click on the result to execute the
corresponding action, depending on the type of item.

Searching is handled using threads, so that results always become available as
quickly as possible, regardless of whether any slow search filters may be
installed. They also appear as soon as each result is encountered by each
filter, which means that e.g. a file search filter will show results one by one
as the file tree is scanned. This ensures that the UI is always responsive even
if a very slow search filter is present (e.g. one which uses an online service).

.. tip:: **Quick access to the locator's configurations**

  Click on the |search| icon inside the locator widget on the status bar to
  display the list of filters you can use and a :guilabel:`Configure` entry that
  opens the :guilabel:`Locator` tab of the :menuselection:`Settings -->
  Options...` menu.


.. _figure_locator_settings:

.. figure:: img/options_locator.png
   :align: center

   Locator Settings in QGIS


.. _optionsadvanced:

Advanced Settings
-----------------

.. _figure_advanced_settings:

.. figure:: img/options_advanced.png
   :align: center

   Advanced Settings tab in QGIS

All the settings related to QGIS (UI, tools, data providers, Processing
configurations, default values and paths, plugins options, expressions,
geometry checks...) are saved in a :file:`QGIS/QGIS3.ini` file under the active
:ref:`user profile <user_profiles>` directory.
Configurations can be shared by copying this file to other installations.

From within QGIS, the :guilabel:`Advanced` tab offers a way to manage these
settings through the :guilabel:`Advanced Settings Editor`.
After you promise to be careful, the widget is populated with a tree of all
the existing settings, and you can edit their value.
Right-click over a setting or a group and you can delete it
(to add a setting or group, you have to edit the :file:`QGIS3.ini` file).
Changes are automatically saved in the :file:`QGIS3.ini` file.

.. warning:: **Avoid using the Advanced tab settings blindly**

   Be careful while modifying items in this dialog given that changes are
   automatically applied. Doing changes without knowledge can break your
   QGIS installation in various ways.


Acceleration Settings
---------------------
OpenCL acceleration settings.

.. _figure_acceleration_settings:

.. figure:: img/acceleration_menu.png
   :align: center

   Acceleration tab


Processing Settings
-------------------

The |processing| :guilabel:`Processing` tab provides you with general settings
of tools and data providers that are used in the QGIS Processing framework.
More information at :ref:`label_processing`.

.. comment for writers:
 Actually, there seems to not be a real section describing the Processing options
 dialog. So the link above should be redirected if ever such a section is
 created, preferably in Processing chapter.

.. _figure_processing_settings:

.. figure:: img/options_processing.png
   :align: center

   Processing Settings tab in QGIS


.. _user_profiles:

Working with User Profiles
==========================

The :menuselection:`Settings --> User Profiles` menu provides functions to set
and access user profiles. A user profile is a unified application configuration
that allows to store in a single folder:

* all the :ref:`global settings <gui_options>`, including locale,
  projections, authentication settings, color palettes, shortcuts...
* GUI configurations and :ref:`customization <sec_customization>`
* installed :ref:`plugins <plugins>` and their configurations
* project templates and history of saved project with their image preview
* :ref:`processing settings <label_processing>`, logs, scripts, models.

By default, a QGIS installation contains a single user profile named ``default``.
But you can create as many user profiles as you want:

#. Click the :guilabel:`New profile...` entry.
#. You'll be prompted to provide a profile name, creating a folder of the same name
   under :file:`~/<UserProfiles>/` where:

   * ``~`` represents the **HOME** directory, which on |win| Windows is usually
     something like :file:`C:\\Users\\(user)`.
   * and ``<UserProfiles>`` represents the main profiles folder, i.e.:

     * |nix| :file:`.local/share/QGIS/QGIS3/profiles/`
     * |win| :file:`AppData\\Roaming\\QGIS\\QGIS3\\profiles\\`
     * |osx| :file:`Library/Application Support/QGIS/QGIS3/profiles/`

   The user profile folder can be opened from within QGIS using the
   :guilabel:`Open Active Profile Folder`.
#. A new instance of QGIS is started, using a clean
   configuration. You can then set your custom configurations.

As each user profile contains isolated settings, plugins and history they can be great for
different workflows, demos, users of the same machine, or testing settings, etc.
And you can switch from one to the other by selecting them in the :menuselection:`Settings -->
User Profiles` menu. You can also run QGIS with a specific user profile from the
:ref:`command line <label_commandline>`.

Unless changed, the profile of the last closed QGIS session will be used in the
following QGIS sessions.

.. tip:: **Run QGIS under a new user profile to check for bug persistence**

 When you encounter weird behavior with some functions in QGIS, create a new user
 profile and run the commands again. Sometimes, bugs are related to some leftovers
 in the current user profile and creating a new one may fix them as it restarts
 QGIS with the new (clean) profile.


.. index:: Project properties
   single: Project; Properties
   single: Settings; Project

.. _project_properties:

Project Properties
==================

In the properties window for the project under :menuselection:`Project -->
Project Properties`, you can set project-specific options.
The project-specific options overwrite their equivalent in the :guilabel:`Options`
dialog described above.

General Properties
------------------

In the :guilabel:`General` tab, the :guilabel:`General settings` let you:

* see the location of the project file
* set the folder for the project home (available in the ``Project Home`` item
  in the browser).
  The path can be relative to the folder of the project file (type it in) or absolute.
  The project home can be used for storing data and other content that is
  useful for the project.
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
are really tied to the underlying projection settings. The :guilabel:`Measurements`
frame lets you control these parameters. You can indeed choose:

* the :guilabel:`Ellipsoid`, on which distance and area calculations are entirely
  based; it can be:

  * **None/Planimetric**: returned values are in this case cartesian measurements.
  * a **Custom** one: you'll need to set values of the semi-major and semi-minor axes.
  * or an existing one from a predefined list (Clarke 1866, Clarke 1880 IGN,
    New International 1967, WGS 84...).
* the :guilabel:`units for distance measurements` for length and perimeter and
  the :guilabel:`units for area measurements`. These settings, which default
  to the units set in QGIS options but then overrides it for the current project,
  are used in:

  * Attribute table field update bar
  * Field calculator calculations
  * Identify tool derived length, perimeter and area values
  * Default unit shown in measure dialog

The :guilabel:`Coordinate display` allows you to choose and customize the format of units
to use to display the mouse coordinate in the status bar and the derived coordinates
shown via the identify tool.

Finally, you can set a :guilabel:`Project predefined scales` list, which overrides
the global predefined scales.

.. _figure_general_tab:

.. figure:: img/project_general.png
   :align: center

   General tab of the Project Properties dialog

.. _project_metadata:

Metadata Properties
-------------------

The :guilabel:`Metadata` tab allows detailed metadata to be defined,
including (among the others): author, creation date, language, abstracts,
categories, keywords, contact details, links, history. There is also a
validation functionality that checks if specific fields were filled, anyway
this is not enforced. See :ref:`vector layer metadata properties
<vectormetadatamenu>` for some details.

CRS Properties
--------------

.. note:: For more information on how QGIS handles project projection, please
  read the dedicated section at :ref:`label_projections`.

The |crs| :guilabel:`CRS` tab helps you set the coordinate reference system
to use in this project. It can be:

* |checkbox| :guilabel:`No projection (or unknown/non-Earth projection)`:
  layers are drawn based on their raw coordinates
* or an existing coordinate reference system that can be *geographic*,
  *projected* or *user-defined*. Layers added to the project are translated
  on-the-fly to this CRS in order to overlay them regardless their original CRS.

The |crs| :guilabel:`CRS` tab also helps you control the layers reprojection
settings by configuring the datum transformation preferences to apply in the
current project. As usual, these override any corresponding global settings.
See :ref:`datum_transformation` for more details.

.. _default_styles_properties:

Default Styles Properties
-------------------------

The :guilabel:`Default Styles` tab lets you control how new layers will be
drawn in the project when they do not have an existing :file:`.qml` style
defined. You can:

* Set default symbols (:guilabel:`Marker`, :guilabel:`Line`, :guilabel:`Fill`)
  to apply depending on the layer geometry type as well as a default
  :guilabel:`Color Ramp`
* Apply a default :guilabel:`Opacity` to new layers
* |checkbox| :guilabel:`Assign random colors to symbols`, modifying the symbols
  fill colors, hence avoiding same rendering for all layers.

.. _figure_default_styles:

.. figure:: img/project_default_styles.png
   :align: center

   Default Styles tab

Using the |styleManager| :guilabel:`Style Manager` button, you can also quickly
access the :ref:`Style Manager <vector_style_manager>` dialog and configure
symbols and color ramps.

.. _project_colors:

There is also an additional section where you can define specific colors for the
running project. Like the :ref:`global colors <colors_options>`, you can:

* |signPlus| :guilabel:`Add` or |signMinus| :guilabel:`Remove` color
* |editCopy| :guilabel:`Copy` or |editPaste| :guilabel:`Paste` color
* |fileOpen| :guilabel:`Import` or |fileSave| :guilabel:`Export` the set of colors
  from/to :file:`.gpl` file.

Double-click a color in the list to tweak or replace it in the :ref:`Color
Selector <color-selector>` dialog. You can also rename it by double-clicking
in the :guilabel:`Label` column.

These colors are identified as :guilabel:`Project colors` and listed as part of
:ref:`color widgets <color-selector>`.

.. tip:: **Use project colors to quickly assign and update color widgets**

  Project colors can be refered to using their label and the color widgets
  they are used in are bound to them. This means that instead of repeatedly
  setting the same color for many properties and, to avoid a cumbersome update
  you can:

  #. Define the color as a project color
  #. Click the :ref:`data defined override widget <data_defined>` next to
     the color property you want to set
  #. Hover over the :guilabel:`Color` menu and select the project color. The
     property is then assigned the expression ``project_color('color_label')``
     and the color widget reflects that color.
  #. Repeat steps 2 and 3 as much as needed
  #. Update the project color once and the change is reflected EVERYWHERE
     it's in use.

Data Sources Properties
-----------------------

In the :guilabel:`Data Sources` tab, you can:

* |unchecked| :guilabel:`Automatically create transaction groups where possible`:
  When this mode is turned on, all
  (postgres) layers from the same database are synchronised in their edit state,
  i.e. when one layer is put into edit state, all are, when one layer is committed
  or one layer is rolled back, so are the others. Also, instead of buffering edit
  changes locally, they are directly sent to a transaction in the database which
  gets committed when the user clicks save layer.
  Note that you can (de)activate this option only if no layer is being edited
  in the project.
* |unchecked| :guilabel:`Evaluate default values on provider side`: When adding
  new features in a PostgreSQL table, fields with default value constraint are
  evaluated and populated at the form opening, and not at the commit moment.
  This means that instead of an expression like ``nextval('serial')``, the field
  in the :guilabel:`Add Feature` form will display expected value (e.g., ``25``).
* |unchecked| :guilabel:`Trust project when data source has no metadata`:
  To speed up project loading by skipping data checks. Useful in QGIS Server context
  or in projects with huge database views/materialized views. The extent of layers
  will be read from the QGIS project file (instead of data sources) and when
  using the PostgreSQL provider the primary key unicity will not be
  checked for views and materialized views.

.. _project_layer_capabilities:

* Configure the :guilabel:`Layers Capabilities`, i.e.:

  * Set (or disable) which layers are ``identifiable``, i.e. will respond to the
    :ref:`identify tool <identify>`. By default, layers are set queryable.
  * Set whether a layer should appear as ``read-only``, meaning that
    it can not be edited by the user, regardless of the data provider's
    capabilities. Although this is a weak protection, it remains a quick and handy
    configuration to avoid end-users modifying data when working with file-based layers.
  * Define which layers are ``searchable``, i.e. could be queried using the
    :ref:`locator widget <locator_options>`. By default, layers are set searchable.
  * Define which layers are defined as ``required``. Checked layers in this list
    are protected from inadvertent removal from the project.

  The :guilabel:`Layers Capabilities` table provides some convenient tools to:

  * Select multiple cells and press :guilabel:`Toggle Selection` to have them change their
    checkbox state;
  * |unchecked| :guilabel:`Show spatial layers only`, filtering out non-spatial
    layers from the layers list;
  * |search| :guilabel:`Filter layers...` and quickly find a particular layer to
    configure.

.. _figure_datasources_tab:

.. figure:: img/project_datasources.png
   :align: center

   Data Sources tab

Relations Properties
--------------------

The :guilabel:`Relations` tab is used to define 1:n relations. The relations
are defined in the project properties dialog. Once relations exist for a layer,
a new user interface element in the form view (e.g. when identifying a feature
and opening its form) will list the related entities. This provides a powerful
way to express e.g. the inspection history on a length of pipeline or road segment.
You can find out more about 1:n relations support in Section :ref:`vector_relations`.

.. _figure_relations_tab:

.. figure:: img/project_relations.png
   :align: center

   Relations tab

Variables Properties
--------------------

The :guilabel:`Variables` tab lists all the variables available at
the project's level (which includes all global variables). Besides, it
also allows the user to manage project-level variables. Click the |signPlus|
button to add a new custom project-level variable. Likewise, select a custom
project-level variable from the list and click the |signMinus| button to
remove it.
More information on variables usage in the General Tools
:ref:`general_tools_variables` section.

Macros Properties
-----------------

The :guilabel:`Macros` tab is used to edit Python macros for projects. Currently,
only three macros are available: ``openProject()``, ``saveProject()`` and
``closeProject()``.

.. _figure_macro_tab:

.. figure:: img/macro.png
   :align: center

   Macro settings in QGIS

QGIS Server Properties
----------------------

The tab :guilabel:`QGIS Server` allows you to configure your project in order
to publish it online. Here you can define information about the QGIS
Server WMS and WFS capabilities, extent and CRS restrictions. More information
available in section :ref:`Creatingwmsfromproject` and subsequent.


.. _figure_qgisserver_tab:

.. figure:: img/project_qgisserver.png
   :align: center

   QGIS Server settings tab

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

.. figure:: img/customization.png
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
You can also use the :guilabel:`Search` box to find items by their name or label.

Once you setup your configuration, click :guilabel:`Apply` or :guilabel:`OK` to validate your
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
   * pressing the :guilabel:`Reset` button in the **QSettings** frame under
     :menuselection:`Settings --> Options` menu, :guilabel:`System` tab
   * launching QGIS at a command prompt with the following command line
     ``qgis --nocustomization``
   * setting to ``false`` the value of :menuselection:`UI --> Customization -->
     Enabled` variable under :menuselection:`Settings --> Options` menu,
     :guilabel:`Advanced` tab (see the :ref:`warning <optionsadvanced>`).

   In most cases, you need to restart QGIS in order to have the change applied.

.. index:: Keyboard shortcuts
.. _shortcuts:

Keyboard shortcuts
==================

QGIS provides default keyboard shortcuts for many features. You can find them in
section :ref:`label_menubar`. Additionally, the menu option
:menuselection:`Settings -->` |keyboardShortcuts| :menuselection:`Keyboard
Shortcuts...` allows you to change the default keyboard shortcuts and add new
ones to QGIS features.

.. _figure_shortcuts:

.. figure:: img/shortcuts.png
   :align: center

   Define shortcut options

Configuration is very simple. Use the search box at the top of the dialog
to find a particular action, select it from the list and click on :

* :guilabel:`Change` and press the new combination you want to assign as new shortcut
* :guilabel:`Set None` to clear any assigned shortcut
* or :guilabel:`Set Default` to backup the shortcut to its original and default value.

Proceed as above for any other tools you wish to customize. Once you have
finished your configuration, simply :guilabel:`Close` the dialog to have your changes
applied. You can also :guilabel:`Save` the changes as an :file:`.XML` file
and :guilabel:`Load` them into another QGIS installation.

.. index:: Command line options
.. _`label_commandline`:

Running QGIS with advanced settings
===================================

Command line and environment variables
--------------------------------------

We've seen that :ref:`launching QGIS <label_startingqgis>` is done as for any
application on your OS.
QGIS provides command line options for more advanced use cases (in some cases
you can use an environment variable instead of the command line option).
To get a list of the options, enter ``qgis --help`` on the command line, which
returns::

  QGIS is a user friendly Open Source Geographic Information System.
  Usage: /usr/bin/qgis.bin [OPTION] [FILE]
    OPTION:
          [--version]     display version information and exit
          [--snapshot filename]   emit snapshot of loaded datasets to given file
          [--width width] width of snapshot to emit
          [--height height]       height of snapshot to emit
          [--lang language]       use language for interface text (changes existing override)
          [--project projectfile] load the given QGIS project
          [--extent xmin,ymin,xmax,ymax]  set initial map extent
          [--nologo]      hide splash screen
          [--noversioncheck]      don't check for new version of QGIS at startup
          [--noplugins]   don't restore plugins on startup
          [--nocustomization]     don't apply GUI customization
          [--customizationfile path]      use the given ini file as GUI customization
          [--globalsettingsfile path]     use the given ini file as Global Settings (defaults)
          [--authdbdirectory path] use the given directory for authentication database
          [--code path]   run the given python file on load
          [--defaultui]   start by resetting user ui settings to default
          [--hide-browser]        hide the browser widget
          [--dxf-export filename.dxf]     emit dxf output of loaded datasets to given file
          [--dxf-extent xmin,ymin,xmax,ymax]      set extent to export to dxf
          [--dxf-symbology-mode none|symbollayer|feature] symbology mode for dxf output
          [--dxf-scale-denom scale]       scale for dxf output
          [--dxf-encoding encoding]       encoding to use for dxf output
          [--dxf-map-theme maptheme]      map theme to use for dxf output
          [--take-screenshots output_path]        take screen shots for the user documentation
          [--screenshots-categories categories]   specify the categories of screenshot to be used (see QgsAppScreenShots::Categories).
          [--profile name]        load a named profile from the user's profiles folder.
          [--profiles-path path]  path to store user profile folders. Will create profiles inside a {path}\profiles folder
          [--version-migration]   force the settings migration from older version if found
          [--openclprogramfolder]         path to the folder containing the sources for OpenCL programs.
          [--help]                this text
          [--]            treat all following arguments as FILEs

    FILE:
      Files specified on the command line can include rasters,
      vectors, and QGIS project files (.qgs and .qgz):
       1. Rasters - supported formats include GeoTiff, DEM
          and others supported by GDAL
       2. Vectors - supported formats include ESRI Shapefiles
          and others supported by OGR and PostgreSQL layers using
          the PostGIS extension

.. tip::
        **Example Using command line arguments**

        You can start QGIS by specifying one or more data files on the command
        line. For example, assuming you are in the :file:`qgis_sample_data`
        directory, you could start QGIS with a vector layer and a raster file
        set to load on startup using the following command:
        ``qgis ./raster/landcover.img ./gml/lakes.gml``

``--version``
..............

This option returns QGIS version information.

``--snapshot``
..............

This option allows you to create a snapshot in PNG format from the current view.
This comes in handy when you have many projects and want to generate
snapshots from your data, or when you need to create snapshots of the
same project with updated data.

Currently, it generates a PNG file with 800x600 pixels. The size can be adjusted
using the ``--width`` and ``--height`` arguments. The filename can
be added after ``--snapshot``. For example::

  qgis --snapshot my_image.png --width 1000 --height 600 --project my_project.qgs

``--width``
...........

This option returns the width of the snapshot to be emitted (used with ``--snapshot``).

``--height``
............

This option returns the height of the snapshot to be emitted (used with ``--snapshot``).

``--lang``
..........

Based on your locale, QGIS selects the correct localization. If you would like
to change your language, you can specify a language code. For example,
``qgis --lang it`` starts QGIS in Italian localization.

``--project``
..............

Starting QGIS with an existing project file is also possible. Just add the
command line option ``--project`` followed by your project name and QGIS will
open with all layers in the given file loaded.

``--extent``
............

To start with a specific map extent use this option. You need to add the
bounding box of your extent in the following order separated by a comma::

  --extent xmin,ymin,xmax,ymax

This option probably makes more sense when paired with the ``--project`` option
to open a specific project at the desired extent.

``--nologo``
............

This option hides the splash screen when you start QGIS.

``--noversioncheck``
....................

Skip searching for a new version of QGIS at startup.

``--noplugins``
...............

If you have trouble at start-up with plugins, you can avoid loading them at
start-up with this option. They will still be available from the Plugins Manager
afterwards.

``--nocustomization``
.....................

Using this option, any existing :ref:`GUI customization <sec_customization>`
will not be applied at startup. This means that any hidden buttons, menu items,
toolbars, and so on, will show up on QGIS start up. This is not a permanent
change. The customization will be applied again if QGIS is launched without
this option.

This option is useful for temporarily allowing access to tools that have been
removed by customization.

.. _custom_commandline:

``--customizationfile``
.......................

Using this option, you can define a UI customization file, that
will be used at startup.

``--globalsettingsfile``
........................

Using this option, you can specify the path for a Global Settings
file (``.ini``), also known as the Default Settings. The settings in the specified
file replace the original inline default ones, but the user profiles'
settings will be set on top of those. The default global settings is located in
:file:`your_QGIS_PKG_path/resources/qgis_global_settings.ini`.

Presently, there's no way to specify a file to write settings to; therefore,
you can create a copy of an original settings file, rename, and adapt it.

Setting the :file:`qgis_global_setting.ini` file path to a network shared
folder, allows a system administrator to change global settings and defaults in
several machines by only editing one file.

The equivalent environment variable is ``QGIS_GLOBAL_SETTINGS_FILE``.

``--authdbdirectory``
.....................

This option is similar to ``--globalsettingsfile``, but defines the path to the
directory where the authentication database will be stored and loaded.

``--code``
..........

This option can be used to run a given python file directly after QGIS has
started.

For example, when you have a python file named :file:`load_alaska.py` with
following content:

.. code-block:: python

   from qgis.utils import iface
   raster_file = "/home/gisadmin/Documents/qgis_sample_data/raster/landcover.img"
   layer_name = "Alaska"
   iface.addRasterLayer(raster_file, layer_name)

Assuming you are in the directory where the file :file:`load_alaska.py` is
located, you can start QGIS, load the raster file :file:`landcover.img` and give
the layer the name 'Alaska' using the following command::

  qgis --code load_alaska.py

``--defaultui``
...............

On load, **permanently resets** the user interface (UI) to the default settings.
This option will restore the panels and toolbars visibility, position, and size.
Unless it's changed again, the default UI settings will be used in the following
sessions.

Notice that this option doesn't have any effect on :ref:`GUI
customization<sec_customization>`. Items hidden by GUI customization (e.g. the
status bar) will remain hidden even using the ``--defaultui`` option. See also
the ``--nocustomization`` option.

``--hide-browser``
..................

On load, hides the :guilabel:`Browser` panel from the user interface. The panel
can be enabled by right-clicking a space in the toolbars or using the
:menuselection:`View --> Panels` (:menuselection:`Settings --> Panels` in |kde|
Linux KDE).

Unless it's enabled again, the Browser panel will remain hidden in the following
sessions.

``--dxf-*``
...........

These options can be used to export a QGIS project into a DXF file. Several
options are available:

* *--dxf-export*: the DXF filename into which to export the layers;
* *--dxf-extent*: the extent of the final DXF file;
* *--dxf-symbology-mode*: several values can be used here: ``none``
  (no symbology), ``symbollayer`` (Symbol layer symbology), ``feature`` (feature
  symbology);
* *--dxf-scale-denom*: the scale denominator of the symbology;
* *--dxf-encoding*: the file encoding;
* *--dxf-map-theme*: choose a :ref:`map theme <map_themes>` from the layer tree
  configuration.

``--take-screenshots``
......................

Takes screenshots for the user documentation. Can be used together with
``--screenshots-categories`` to filter which categories/sections of the
documentation screenshots should be created (see QgsAppScreenShots::Categories).

``--profile``
.............

Loads QGIS using a specific profile from the user's profile folder. Unless
changed, the selected profile will be used in the following QGIS sessions.

.. _profiles-path_option:

``--profiles-path``
...................

With this option, you can choose a path to load and save the profiles (user
settings). It creates profiles inside a ``{path}\profiles`` folder, which
includes settings, installed plugins, processing models and scripts, and so on.

This option allows you to, for instance, carry all your plugins and settings
in a flash drive, or, for example, share the settings between different computers
using a file sharing service.

The equivalent environment variable is ``QGIS_CUSTOM_CONFIG_PATH``.

``--version-migration``
.......................

If settings from an older version are found (*e.g.*, the ``.qgis2`` folder from QGIS
2.18), this option will import them into the default QGIS profile.

``--openclprogramfolder``
.........................

Using this option, you can specify an alternative path for your OpenCL programs.
This is useful for developers while testing new versions of the programs
without needing to replace the existing ones.

The equivalent environment variable is ``QGIS_OPENCL_PROGRAM_FOLDER``.

Deploying QGIS within an organization
-------------------------------------

If you need to deploy QGIS within an organization with a custom configuration file,
first you need to copy/paste the content of the default settings file located in
:file:`your_QGIS_PKG_path/resources/qgis_global_settings.ini`. This file already
contains some default sections identified by a block starting with ``[]``.
We recommend that you keep these defaults values and add your own sections at the bottom
of the file. If a section is duplicated in the file, QGIS will take the last
one from top to bottom.

You can change ``allowVersionCheck=false`` to disable
the QGIS version check.

If you do not want to display the migration window after a fresh install, you need
the following section:

.. code-block:: ini

    [migration]
    fileVersion=2
    settings=true

If you want to add a custom variable in the global scope:

.. code-block:: ini

   [variables]
   organisation="Your organization"

To discover the possibilities of the settings ``INI`` file, we suggest that you set
the config you would like in QGIS Desktop and then search for it in your ``INI``
file located in your profile using a text editor. A lot of settings can be set
using the ``INI`` file such as WMS/WMTS, PostGIS connections, proxy settings, maptips…

Finally, you need to set the environment variable ``QGIS_GLOBAL_SETTINGS_FILE``
to the path of your customized file.

In addition, you can also deploy files such as Python macros, color palettes,
layout templates, project templates… either in the QGIS system directory or
in the QGIS user profile.

* Layout templates must be deployed in the :file:`composer_templates` directory.
* Project templates must be deployed in the :file:`project_templates` directory.
* Custom Python macros must be deployed in the :file:`python` directory.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |crs| image:: /static/common/CRS.png
   :width: 1.5em
.. |customProjection| image:: /static/common/mActionCustomProjection.png
   :width: 1.5em
.. |doubleSpinBox| image:: /static/common/doublespinbox.png
   :width: 1.5em
.. |editCopy| image:: /static/common/mActionEditCopy.png
   :width: 1.5em
.. |editPaste| image:: /static/common/mActionEditPaste.png
   :width: 1.5em
.. |fileOpen| image:: /static/common/mActionFileOpen.png
   :width: 1.5em
.. |fileSave| image:: /static/common/mActionFileSave.png
   :width: 1.5em
.. |interfaceCustomization| image:: /static/common/mActionInterfaceCustomization.png
   :width: 1.5em
.. |kde| image:: /static/common/kde.png
   :width: 1.5em
.. |keyboardShortcuts| image:: /static/common/mActionKeyboardShortcuts.png
   :width: 1.5em
.. |nix| image:: /static/common/nix.png
   :width: 1em
.. |offsetCurve| image:: /static/common/mActionOffsetCurve.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |osx| image:: /static/common/osx.png
   :width: 1em
.. |processing| image:: /static/common/processingAlgorithm.png
   :width: 1.5em
.. |radioButtonOff| image:: /static/common/radiobuttonoff.png
   :width: 1.5em
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
   :width: 1.5em
.. |search| image:: /static/common/search.png
   :width: 1.5em
.. |select| image:: /static/common/mActionSelect.png
   :width: 1.5em
.. |selectAllTree| image:: /static/common/mActionSelectAllTree.png
   :width: 1.5em
.. |selectNumber| image:: /static/common/selectnumber.png
   :width: 2.8em
.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |styleManager| image:: /static/common/mActionStyleManager.png
   :width: 1.5em
.. |unchecked| image:: /static/common/checkbox_unchecked.png
   :width: 1.3em
.. |win| image:: /static/common/win.png
   :width: 1em
