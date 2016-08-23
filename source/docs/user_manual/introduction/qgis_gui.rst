.. Purpose: This chapter aims to describe only the interface of the default
.. QGIS interface. Details should be write in other part with a link toward it.

|updatedisclaimer|

.. _`label_qgismainwindow`:

********
QGIS GUI
********

.. only:: html

   .. contents::
      :local:

.. index::
   single:main window

When QGIS starts, you are presented with the GUI as shown in the figure (the
numbers 1 through 5 in yellow circles are discussed below).

.. _fig_startup:

.. only:: html

   **Figure QGIS GUI 1:**

.. figure:: /static/user_manual/introduction/startup.png
   :align: center

   QGIS GUI with Alaska sample data

.. note::
   Your window decorations (title bar, etc.) may appear different depending
   on your operating system and window manager.

The QGIS GUI is divided into five areas:

#. Menu Bar
#. Toolbars
#. Panels
#. Map View
#. Status Bar

These five components of the QGIS interface are described in more detail in
the following sections. Two more sections present keyboard shortcuts and
context help.

.. _label_menubar:

Menu Bar
========

.. index::
   single:menus

The menu bar provides access to various QGIS features using a standard
hierarchical menu. The top-level menus and a summary of some of the menu
options are listed below, together with the associated icons as
they appear on the toolbar, and keyboard shortcuts. The shortcuts presented in
this section are the defaults; however, keyboard shortcuts can also be configured
manually using the :guilabel:`Configure shortcuts` dialog, opened from
:menuselection:`Settings --> Configure Shortcuts...`.

Although most menu options have a corresponding tool and vice-versa, the menus
are not organized exactly like the toolbars. The toolbar containing the tool is
listed after each menu option as a checkbox entry. Some menu options only
appear if the corresponding plugin is loaded. For more information about tools
and toolbars, see section :ref:`label_toolbars`.

.. note:: QGIS is a cross-platform application meaning that though it provides you
   with the same tools, they may be placed in different menus according to the
   operating system specification. The lists below show the most common location
   and precise when there is a variation.

Project
-------

=======================================================  ====================  ==========================================  ===============================
Menu Option                                              Shortcut              Reference                                   Toolbar
=======================================================  ====================  ==========================================  ===============================
|fileNew| :guilabel:`New`                                :kbd:`Ctrl+N`         see :ref:`sec_projects`                     :guilabel:`Project`
|fileOpen| :guilabel:`Open`                              :kbd:`Ctrl+O`         see :ref:`sec_projects`                     :guilabel:`Project`
:menuselection:`New from template -->`                   \                     see :ref:`sec_projects`                     \
:menuselection:`Open Recent -->`                         \                     see :ref:`sec_projects`                     \
|fileSave| :guilabel:`Save`                              :kbd:`Ctrl+S`         see :ref:`sec_projects`                     :guilabel:`Project`
|fileSaveAs| :guilabel:`Save As...`                      :kbd:`Ctrl+Shift+S`   see :ref:`sec_projects`                     :guilabel:`Project`
|saveMapAsImage| :guilabel:`Save as Image...`            \                     see :ref:`sec_output`                       \
:guilabel:`DXF Export...`                                \                     see :ref:`sec_output`                       \
|projectProperties| :guilabel:`Project Properties...`    :kbd:`Ctrl+Shift+P`   see :ref:`sec_projects`                     \
|newComposer| :guilabel:`New Print Composer`             :kbd:`Ctrl+P`         see :ref:`label_printcomposer`              :guilabel:`Project`
|composerManager| :guilabel:`Composer manager...`        \                     see :ref:`label_printcomposer`              :guilabel:`Project`
:menuselection:`Print Composers -->`                     \                     see :ref:`label_printcomposer`              \
|fileExit| :guilabel:`Exit QGIS`                         :kbd:`Ctrl+Q`         \                                           \
=======================================================  ====================  ==========================================  ===============================

Under |osx| Mac OSX, the :guilabel:`Exit QGIS` command corresponds to
:menuselection:`QGIS --> Quit QGIS` (:kbd:`Cmd+Q`).

Edit
----

====================================================================  ====================  ==========================================  ===============================
Menu Option                                                           Shortcut              Reference                                   Toolbar
====================================================================  ====================  ==========================================  ===============================
|undo| :guilabel:`Undo`                                               :kbd:`Ctrl+Z`         see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|redo| :guilabel:`Redo`                                               :kbd:`Ctrl+Shift+Z`   see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|editCut| :guilabel:`Cut Features`                                    :kbd:`Ctrl+X`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|editCopy| :guilabel:`Copy Features`                                  :kbd:`Ctrl+C`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|editPaste| :guilabel:`Paste Features`                                :kbd:`Ctrl+V`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
:menuselection:`Paste features as -->`                                \                     see :ref:`sec_attribute_table`              \
|capturePoint| :guilabel:`Add Feature`                                :kbd:`Ctrl+.`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|moveFeature| :guilabel:`Move Feature(s)`                             \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|deleteSelected| :guilabel:`Delete Selected`                          \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|rotateFeature| :guilabel:`Rotate Feature(s)`                         \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|simplifyFeatures| :guilabel:`Simplify Feature`                       \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|addRing| :guilabel:`Add Ring`                                        \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|addPart| :guilabel:`Add Part`                                        \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|fillRing| :guilabel:`Fill Ring`                                      \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|deleteRing| :guilabel:`Delete Ring`                                  \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|deletePart| :guilabel:`Delete Part`                                  \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|reshape| :guilabel:`Reshape Features`                                \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|offsetCurve| :guilabel:`Offset Curve`                                \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|splitFeatures| :guilabel:`Split Features`                            \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|splitParts| :guilabel:`Split Parts`                                  \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mergeFeatures| :guilabel:`Merge Selected Features`                   \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mergeFeatAttributes| :guilabel:`Merge Attr. of Selected Features`    \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|nodeTool| :guilabel:`Node Tool`                                      \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|rotatePointSymbols| :guilabel:`Rotate Point Symbols`                 \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
====================================================================  ====================  ==========================================  ===============================

After activating |toggleEditing| :sup:`Toggle editing` mode for a layer,
you will enable the ``Add Feature`` icon in the :menuselection:`Edit` menu
depending on the layer type (point, line or polygon).

Edit (extra)
------------

=======================================================  ====================  ==========================================  ===============================
Menu Option                                              Shortcut              Reference                                   Toolbar
=======================================================  ====================  ==========================================  ===============================
|capturePoint| :guilabel:`Add Feature`                   \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|captureLine| :guilabel:`Add Feature`                    \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|capturePolygon| :guilabel:`Add Feature`                 \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
=======================================================  ====================  ==========================================  ===============================

View
----

=======================================================  ====================  ==========================================  ===============================
Menu Option                                              Shortcut              Reference                                   Toolbar
=======================================================  ====================  ==========================================  ===============================
|pan| :guilabel:`Pan Map`                                \                     see :ref:`zoom_pan`                         :guilabel:`Map Navigation`
|panToSelected| :guilabel:`Pan Map to Selection`         \                     \                                           :guilabel:`Map Navigation`
|zoomIn| :guilabel:`Zoom In`                             :kbd:`Ctrl++`         see :ref:`zoom_pan`                         :guilabel:`Map Navigation`
|zoomOut| :guilabel:`Zoom Out`                           :kbd:`Ctrl+-`         see :ref:`zoom_pan`                         :guilabel:`Map Navigation`
:menuselection:`Select -->`                              \                     see :ref:`sec_selection`                    :guilabel:`Attributes`
|identify| :guilabel:`Identify Features`                 :kbd:`Ctrl+Shift+I`   see :ref:`identify`                         :guilabel:`Attributes`
:menuselection:`Measure -->`                             \                     see :ref:`sec_measure`                      :guilabel:`Attributes`
|sum| :guilabel:`Statistical Summary`                    \                     see :ref:`statistical_summary`              :guilabel:`Attributes`
|zoomFullExtent| :guilabel:`Zoom Full`                   :kbd:`Ctrl+Shift+F`   \                                           :guilabel:`Map Navigation`
|zoomToLayer| :guilabel:`Zoom To Layer`                  \                     \                                           :guilabel:`Map Navigation`
|zoomToSelected| :guilabel:`Zoom To Selection`           :kbd:`Ctrl+J`         \                                           :guilabel:`Map Navigation`
|zoomLast| :guilabel:`Zoom Last`                         \                     \                                           :guilabel:`Map Navigation`
|zoomNext| :guilabel:`Zoom Next`                         \                     \                                           :guilabel:`Map Navigation`
|zoomActual| :guilabel:`Zoom To Native Resolution`       \                     \                                           :guilabel:`Map Navigation`
:menuselection:`Decorations -->`                         \                     see :ref:`decorations`                      \
:menuselection:`Preview mode -->`                        \                     \                                           \
|mapTips| :guilabel:`Map Tips`                           \                     see :ref:`maptips`                          :guilabel:`Attributes`
|newBookmark| :guilabel:`New Bookmark...`                :kbd:`Ctrl+B`         see :ref:`sec_bookmarks`                    :guilabel:`Attributes`
|showBookmarks| :guilabel:`Show Bookmarks`               :kbd:`Ctrl+Shift+B`   see :ref:`sec_bookmarks`                    :guilabel:`Attributes`
|draw| :guilabel:`Refresh`                               :kbd:`F5`                                                         :guilabel:`Map Navigation`
:menuselection:`Panels -->`                              \                     see :ref:`sec_panels_and_toolbars`          \
:menuselection:`Toolbars -->`                            \                     see :ref:`sec_panels_and_toolbars`          \
:guilabel:`Toggle Full Screen Mode`                      :kbd:`F11`            \                                           \
=======================================================  ====================  ==========================================  ===============================

Under |nix| Linux KDE, :menuselection:`Panels -->`, :menuselection:`Toolbars -->`
and :guilabel:`Toggle Full Screen Mode` are rather placed in :menuselection:`Settings`
menu.
:menuselection:`Preview mode -->` is not available under |osx| Mac OS X.

Layer
-----

============================================================  ====================  ==========================================  ===============================
Menu Option                                                   Shortcut              Reference                                   Toolbar
============================================================  ====================  ==========================================  ===============================
:menuselection:`Create Layer -->`                             \                     see :ref:`sec_create_vector`                :guilabel:`Manage Layers`
:menuselection:`Add Layer -->`                                \                     see :ref:`supported_format`                 :guilabel:`Manage Layers`
:guilabel:`Embed Layers and Groups...`                        \                     see :ref:`nesting_projects`                 \
:guilabel:`Add from Layer Definition File...`                 \                     \                                           \
|editCopy| :guilabel:`Copy style`                             \                     see :ref:`save_layer_property`              \
|editPaste| :guilabel:`Paste style`                           \                     see :ref:`save_layer_property`              \
|openTable| :guilabel:`Open Attribute Table`                  \                     see :ref:`sec_attribute_table`              :guilabel:`Attributes`
|toggleEditing| :guilabel:`Toggle Editing`                    \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|fileSave| :guilabel:`Save Layer Edits`                       \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|allEdits| :menuselection:`Current Edits -->`                 \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
:menuselection:`Save As...`                                   \                     see :ref:`general_saveas`                   \
:menuselection:`Save As Layer Definition File...`             \                     \                                           \
|removeLayer| :guilabel:`Remove Layer/Group`                  :kbd:`Ctrl+D`         \                                           \
|duplicateLayer| :guilabel:`Duplicate Layers (s)`             \                     \                                           \
:guilabel:`Set Scale Visibility of Layers`                    \                     \                                           \
:guilabel:`Set CRS of Layer(s)`                               :kbd:`Ctrl+Shift+C`   \                                           \
:guilabel:`Set project CRS from Layer`                        \                     \                                           \
:guilabel:`Properties...`                                     \                     see :ref:`vector_properties_dialog`          \
:guilabel:`Filter...`                                         \                     see :ref:`vector_query_builder`             \
|labeling| :guilabel:`Labeling`                               \                     see :ref:`vector_labels_tab`                \
|inOverview| :guilabel:`Add to Overview`                      :kbd:`Ctrl+Shift+O`   \                                           :guilabel:`Manage Layers`
|addAllToOverview| :guilabel:`Add All To Overview`            \                     \                                           \
|removeAllOVerview| :guilabel:`Remove All From Overview`      \                     \                                           \
|showAllLayers| :guilabel:`Show All Layers`                   :kbd:`Ctrl+Shift+U`   \                                           :guilabel:`Manage Layers`
|hideAllLayers| :guilabel:`Hide All Layers`                   :kbd:`Ctrl+Shift+H`   \                                           :guilabel:`Manage Layers`
|showAllLayers| :guilabel:`Show selected Layers`              \                     \                                           \
|hideAllLayers| :guilabel:`Hide selected Layers`              \                     \                                           \
============================================================  ====================  ==========================================  ===============================

Settings
--------

=======================================================  ====================  ==========================================  ===============================
Menu Option                                              Shortcut              Reference                                   Toolbar
=======================================================  ====================  ==========================================  ===============================
|customProjection| :guilabel:`Custom CRS...`             \                     see :ref:`sec_custom_projections`           \
:guilabel:`Style Manager...`                             \                     see :ref:`vector_style_manager`             \
|options| :guilabel:`Configure shortcuts...`             \                     \                                           \
|options| :guilabel:`Customization...`                   \                     see :ref:`sec_customization`                \
|options| :guilabel:`Options...`                         \                     see :ref:`gui_options`                      \
:guilabel:`Snapping Options...`                          \                     see :ref:`snapping_tolerance`               \
=======================================================  ====================  ==========================================  ===============================

Under |nix| Linux KDE, you'll find more tools in :menuselection:`Settings`
menu such as :guilabel:`Project Properties`, :menuselection:`Panels -->`,
:menuselection:`Toolbars -->` and :guilabel:`Toggle Full Screen Mode`.

Plugins
-------

======================================================================  ====================  ===================================  ===============================
Menu Option                                                             Shortcut              Reference                            Toolbar
======================================================================  ====================  ===================================  ===============================
|showPluginManager| :guilabel:`Manage and Install Plugins...`           \                     see :ref:`managing_plugins`          \
:guilabel:`Python Console`                                              :kbd:`Ctrl+Alt+P`     \                                    \
======================================================================  ====================  ===================================  ===============================

When starting QGIS for the first time not all core plugins are loaded.

Vector
------

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
:menuselection:`Open Street Map -->`                            \                     see :ref:`open_street_map`                  \
|analysis| :menuselection:`Analysis Tools -->`                  \                     see :ref:`ftools`                           \
|sampling| :menuselection:`Research Tools -->`                  \                     see :ref:`ftools`                           \
|geoprocessing| :menuselection:`Geoprocessing Tools -->`        \                     see :ref:`ftools`                           \
|geometry| :menuselection:`Geometry Tools -->`                  \                     see :ref:`ftools`                           \
|management| :menuselection:`Data Management Tools -->`         \                     see :ref:`ftools`                           \
==============================================================  ====================  ==========================================  ===============================

When starting QGIS for the first time not all core plugins are loaded.

Raster
------

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
:guilabel:`Raster calculator...`                                \                     see :ref:`label_raster_calc`                \
:guilabel:`Align Raster...`                                     \                     see :ref:`label_raster_align`               \
==============================================================  ====================  ==========================================  ===============================

When starting QGIS for the first time not all core plugins are loaded.


Database
--------

===============================================  ====================  ==========================================  ===============================
Menu Option                                      Shortcut              Reference                                   Toolbar
===============================================  ====================  ==========================================  ===============================
:menuselection:`Database -->`                    \                     see :ref:`dbmanager`                        :guilabel:`Database`
===============================================  ====================  ==========================================  ===============================

When starting QGIS for the first time not all core plugins are loaded.


Web
---

===============================================  ====================  ==========================================  ===============================
Menu Option                                      Shortcut              Reference                                   Toolbar
===============================================  ====================  ==========================================  ===============================
:menuselection:`Metasearch`                      \                     see :ref:`metasearch`                       :guilabel:`Web`
===============================================  ====================  ==========================================  ===============================

When starting QGIS for the first time not all core plugins are loaded.


Processing
----------

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
|processingToolbox| :guilabel:`Toolbox`                         \                     see :ref:`processing.toolbox`               \
|processingModel| :guilabel:`Graphical Modeler...`              \                     see :ref:`processing.modeler`               \
|processingHistory| :guilabel:`History and log...`              \                     see :ref:`processing.history`               \
|processingOption| :guilabel:`Options...`                       \                     see :ref:`processing.options`               \
|processingResult| :guilabel:`Results viewer...`                \                     see :ref:`processing.results`               \
|processingCommander| :guilabel:`Commander`                     :kbd:`Ctrl+Alt+M`     see :ref:`processing.commander`             \
==============================================================  ====================  ==========================================  ===============================

When starting QGIS for the first time not all core plugins are loaded.

Help
----

=======================================================  ====================  ===========================  ========================
Menu Option                                              Shortcut              Reference                    Toolbar
=======================================================  ====================  ===========================  ========================
|helpContents| :guilabel:`Help Contents`                 :kbd:`F1`             \                            :guilabel:`Help`
|whatsThis| :guilabel:`What's This?`                     :kbd:`Shift+F1`       \                            :guilabel:`Help`
:guilabel:`API Documentation`                            \                     \                            \
:guilabel:`Report an Issue`                              \                     \                            \
:guilabel:`Need commercial support?`                     \                     \                            \
|qgisHomePage| :guilabel:`QGIS Home Page`                :kbd:`Ctrl+H`         \                            \
|checkQgisVersion| :guilabel:`Check QGIS Version`        \                     \                            \
|helpAbout| :guilabel:`About`                            \                     \                            \
|helpSponsors| :guilabel:`QGIS Sponsors`                 \                     \                            \
=======================================================  ====================  ===========================  ========================

QGIS
....

This menu is only available under |osx| Mac OS X and contains some OS related
commands.

================================  ====================  =========================
Menu Option                       Shortcut              Reference
================================  ====================  =========================
:guilabel:`Preferences`           \                     \
:guilabel:`About QGIS`            \                     \
:guilabel:`Hide QGIS`             \                     \
:guilabel:`Show All`              \                     \
:guilabel:`Hide Others`           \                     \
:guilabel:`Quit QGIS`             :kbd:`Cmd+Q`          \
================================  ====================  =========================

:guilabel:`Preferences` and :guilabel:`About QGIS` are the same commands as
:menuselection:`Settings --> Options` and :menuselection:`Help --> About`.
:guilabel:`Quit QGIS` corresponds to :menuselection:`Project --> Exit QGIS`
under the other platforms.

.. _sec_panels_and_toolbars:

Panels and Toolbars
===================

From the :menuselection:`View` menu (:menuselection:`Settings` under KDE), you can
switch on and off QGIS widgets (:menuselection:`Panels -->`) or toolbars
(:menuselection:`Toolbars -->`). You can (de)activate any of them by
right-clicking the menu bar or a toolbar and choose the item you want.
Each panel or toolbar can be moved and placed wherever you feel comfortable
with in QGIS interface.
The list can also be extended with the activation of :ref:`Core or external
plugins <plugins>`.

.. _`label_toolbars`:

Toolbars
--------

.. index::
   single:toolbar

The toolbar provides access to most of the same functions as the menus, plus
additional tools for interacting with the map. Each toolbar item has pop-up help
available. Hold your mouse over the item and a short description of the tool's
purpose will be displayed.

Every toolbar can be moved around according to your needs. Additionally,
they can be switched off using the right mouse button context menu, or by
holding the mouse over the toolbars.

.. _figure_toolbars:

.. only:: html

   **Figure Toolbars:**

.. figure:: /static/user_manual/introduction/toolbars.png
   :align: center

   The Toolbars menu

.. index::
   single: Layout toolbars, Toolbars; Layout

.. tip:: **Restoring toolbars**

   If you have accidentally hidden a toolbar, you can get it
   back by choosing menu option :menuselection:`View --> Toolbars -->`
   (or :menuselection:`Settings --> Toolbars -->` under Linux KDE).
   If for some reason a toolbar (or any other widget) totally disappears
   from the interface, you'll find tips to get it back at :ref:`restoring
   initial GUI <tip_restoring_configuration>`.

.. index:: Panels

Panels
------

QGIS provides by default many panels to work with.


.. _figure_panels:

.. only:: html

   **Figure Panels:**

.. figure:: /static/user_manual/introduction/panels.png
   :align: center

   The Panels menu

Some of these panels are described
below while others may be found in different parts of the document, namely:

* the :ref:`Browser Panel <label_qgis_browser>`
* the :ref:`Advanced Digitizing Panel <advanced_digitizing_panel>`
* the :ref:`Spatial Bookmarks Panel <sec_bookmarks>`
* the :ref:`GPS Information Panel <sec_gpstracking>`
* the :ref:`Tile Scale Panel <tilesets>`
* the :ref:`Identify Panel <identify>`
* the :ref:`User Input Panel <rotate_feature>`
* the :ref:`layer_order`
* the :ref:`statistical_summary`
* the :ref:`overview_panels`
* the :ref:`log_message_panel`
* the :ref:`undo_redo_panel`
* the :ref:`label_processing`


.. _`label_mapview`:

Map View
========

.. index::`map view`

Also called **Map canvas**, this is the "business end" of QGIS ---
maps are displayed in this area. The map displayed in this window
will depend on the vector and raster layers you have chosen to load
(see sections that follow for more information on how to load layers).
The map view can be panned, shifting the focus of the map display to
another region, and it can be zoomed in and out. Various other operations can be
performed on the map as described in the label_toolbars_ description above. The map
view and the legend are tightly bound to each other --- the maps in view reflect
changes you make in the legend area.

.. index::
   single:zoom mouse wheel

.. tip::
   **Zooming the Map with the Mouse Wheel**

   You can use the mouse wheel to zoom in and out on the map. Place the mouse
   cursor inside the map area and roll the wheel forward (away from you) to
   zoom in and backwards (towards you) to zoom out. The zoom is centered on the
   mouse cursor position. You can customize the behavior of the
   mouse wheel zoom using the :guilabel:`Map tools` tab under the
   :menuselection:`Settings --> Options` menu.

.. tip::
   **Panning the Map with the Arrow Keys and Space Bar**

   .. index::
      single: pan arrow keys

   You can use the arrow keys to pan the map. Place the mouse cursor inside
   the map area and click on the right arrow key to pan east, left arrow key to
   pan west, up arrow key to pan north and down arrow key to pan south. You can
   also pan the map using the space bar or the click on mouse wheel: just move
   the mouse while holding down space bar or click on mouse wheel.

.. _`label_mapoverview`:


.. _`label_statusbar`:

Status Bar
==========

The status bar provides you with general information about the map view,
and actions processed or available and offers you tools to manage the map view.

On the left side of the status bar, you can get a summary of actions you've done
(such as selecting features in a layer, removing layer) or a long description
of the tool you are hovering over (not available for all tools).
On startup, the bar status also informs you about availability of new or upgradeable
plugins (if checked in :ref:`Plugin Manager settings <setting_plugins>`).

In case of lengthy operations, such as gathering of statistics in raster layers
or rendering several layers in map view, a progress bar is displayed in the
status bar to show the current progress of the action.

The |tracking| :guilabel:`Coordinate` option shows the current position of the mouse,
following it while moving across the map view. You can set the unit (and precision)
to use in the project properties, General tab.
Click on the small button at the left of the textbox to toggle between
the Coordinate option and the |extents| :guilabel:`Extents` option that displays
in map units, the coordinates of the current lower leftmost and upper rightmost
points of the map view, as you pan and zoom in and out.

Next to the coordinate display you will find the :guilabel:`Scale` display.
It shows the scale of the map view. If you zoom in or out, QGIS shows you the
current scale. There is a scale selector, which allows you to choose among
:ref:`predefined and custom scales <predefinedscales>` to assign to the map view.

To the right of the scale display you can define a current clockwise rotation for
your map view in degrees.


On the right side of the status bar, there is a small
checkbox which can be used to temporarily prevent layers being rendered to the
map view (see section :ref:`redraw_events`).

To the right of the render functions, you find the |projectionDisabled|
:sup:`Current CRS:` icon with the EPSG code of the current
project CRS. Clicking on this lets you :guilabel:`Enable 'on the fly' CRS
transformation` properties for the current project and apply another CRS to the
map view.

Finally, the |messageLog| :sup:`Messages` button opens the :guilabel:`Log
Messages Panel` which informs you on underlying process (QGIS startup, plugins
loading, processing tools...)


.. tip::
   **Calculating the Correct Scale of Your Map Canvas**

   .. index::
      single:scale calculate

   When you start QGIS, the default CRS is ``WGS 84 (epsg 4326)`` and
   units are degrees. This means that QGIS will interpret any
   coordinate in your layer as specified in degrees. To get correct scale values,
   you can either manually change this setting, e.g. to meters, in the :guilabel:`General`
   tab under :menuselection:`Project --> Project Properties`, or you can use
   the |projectionDisabled| :sup:`Current CRS:` icon seen above. In the latter case,
   the units are set to what the project projection specifies (e.g., ``+units=us-ft``).

   Note that CRS choice on startup can be set in :menuselection:`Settings --> Options --> CRS`.
