.. only:: html

   |updatedisclaimer|

.. Purpose: This chapter aims to describe only the interface of the default
.. QGIS interface. Details should be written in other parts with a link toward it.

.. _`label_qgismainwindow`:

********
QGIS GUI
********

.. only:: html

   .. contents::
      :local:

.. index::
   single: Main window

When QGIS starts, you are presented with the GUI as shown in the figure (the
numbers 1 through 5 in yellow circles are discussed below).

.. _figure_startup:

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

.. index:: Menu
.. _label_menubar:

Menu Bar
========

The menu bar provides access to various QGIS features using a standard
hierarchical menu. The top-level menus and a summary of some of the menu
options are listed below, together with the associated icons as
they appear on the toolbar, and keyboard shortcuts. The shortcuts presented in
this section are the defaults; however, keyboard shortcuts can also be configured
manually using the :guilabel:`Keyboard Shortcuts` dialog, opened from
:menuselection:`Settings -->` menu.

Although most menu options have a corresponding tool and vice-versa, the menus
are not organized exactly like the toolbars. The toolbar containing the tool is
listed after each menu option as a checkbox entry. Some menu options only
appear if the corresponding plugin is loaded. For more information about tools
and toolbars, see section :ref:`label_toolbars`.

.. note:: QGIS is a cross-platform application meaning that though it provides you
   with the same tools, they may be placed in different menus according to the
   operating system specification. The lists below show the most common location
   and precise when there is a variation.

.. index:: Project

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
:guilabel:`DWG/DXF Import...`                            \                     \                                           \
:guilabel:`Snapping Options...`                          :kbd:`S`              see :ref:`snapping_tolerance`               \
|projectProperties| :guilabel:`Project Properties...`    :kbd:`Ctrl+Shift+P`   see :ref:`sec_projects`                     \
|newComposer| :guilabel:`New Print Composer`             :kbd:`Ctrl+P`         see :ref:`label_printcomposer`              :guilabel:`Project`
|composerManager| :guilabel:`Composer manager...`        \                     see :ref:`label_printcomposer`              :guilabel:`Project`
:menuselection:`Print Composers -->`                     \                     see :ref:`label_printcomposer`              \
|fileExit| :guilabel:`Exit QGIS`                         :kbd:`Ctrl+Q`         \                                           \
=======================================================  ====================  ==========================================  ===============================

Under |osx| macOS, the :guilabel:`Exit QGIS` command corresponds to
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
:menuselection:`Select -->`                                           \                     see :ref:`sec_selection`                    :guilabel:`Attributes`
|capturePoint| :guilabel:`Add Feature`                                :kbd:`Ctrl+.`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|circularStringCurvePoint| :guilabel:`Add Circular String`            \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|circularStringRadius| :guilabel:`Add Circular String by Radius`      \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|moveFeature| :guilabel:`Move Feature(s)`                             \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|deleteSelected| :guilabel:`Delete Selected`                          \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|multiEdit| :guilabel:`Modify Attributes of Selected Features`        \                     see :ref:`calculate_fields_values`          :guilabel:`Digitizing`
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
|offsetPointSymbols| :guilabel:`Offset Point Symbols`                 \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
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
|newMap| :guilabel:`New Map View`                        :kbd:`Ctrl+M`         \                                           :guilabel:`Map Navigation`
|pan| :guilabel:`Pan Map`                                \                     see :ref:`zoom_pan`                         :guilabel:`Map Navigation`
|panToSelected| :guilabel:`Pan Map to Selection`         \                     \                                           :guilabel:`Map Navigation`
|zoomIn| :guilabel:`Zoom In`                             :kbd:`Ctrl+Alt++`     see :ref:`zoom_pan`                         :guilabel:`Map Navigation`
|zoomOut| :guilabel:`Zoom Out`                           :kbd:`Ctrl+Alt+-`     see :ref:`zoom_pan`                         :guilabel:`Map Navigation`
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
|showAllLayers| :guilabel:`Show All Layers`              :kbd:`Ctrl+Shift+U`   \                                           :guilabel:`Manage Layers`
|hideAllLayers| :guilabel:`Hide All Layers`              :kbd:`Ctrl+Shift+H`   \                                           :guilabel:`Manage Layers`
|showAllLayers| :guilabel:`Show Selected Layers`         \                     \                                           \
|hideAllLayers| :guilabel:`Hide Selected Layers`         \                     \                                           \
|hideAllLayers| :guilabel:`Hide Deselected Layers`       \                     \                                           \
:menuselection:`Panels -->`                              \                     see :ref:`sec_panels_and_toolbars`          \
:menuselection:`Toolbars -->`                            \                     see :ref:`sec_panels_and_toolbars`          \
:guilabel:`Toggle Full Screen Mode`                      :kbd:`F11`            \                                           \
:guilabel:`Toggle Panel Visibility`                      :kbd:`Ctrl+Tab`       \                                           \
=======================================================  ====================  ==========================================  ===============================

Under |kde| Linux KDE, :menuselection:`Panels -->`, :menuselection:`Toolbars -->`
and :guilabel:`Toggle Full Screen Mode` are rather placed in :menuselection:`Settings`
menu.
:menuselection:`Preview mode -->` is not available under |osx| macOS.

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
|openTable| :guilabel:`Open Attribute Table`                  :kbd:`F6`             see :ref:`sec_attribute_table`              :guilabel:`Attributes`
|toggleEditing| :guilabel:`Toggle Editing`                    \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|fileSave| :guilabel:`Save Layer Edits`                       \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|allEdits| :menuselection:`Current Edits -->`                 \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
:menuselection:`Save As...`                                   \                     see :ref:`general_saveas`                   \
:menuselection:`Save As Layer Definition File...`             \                     \                                           \
|removeLayer| :guilabel:`Remove Layer/Group`                  :kbd:`Ctrl+D`         \                                           \
|duplicateLayer| :guilabel:`Duplicate Layer(s)`               \                     \                                           \
:guilabel:`Set Scale Visibility of Layer(s)`                  \                     \                                           \
:guilabel:`Set CRS of Layer(s)`                               :kbd:`Ctrl+Shift+C`   \                                           \
:guilabel:`Set Project CRS from Layer`                        \                     \                                           \
:guilabel:`Properties...`                                     \                     see :ref:`vector_properties_dialog`          \
:guilabel:`Filter...`                                         :kbd:`Ctrl+F`         see :ref:`vector_query_builder`             \
|labeling| :guilabel:`Labeling`                               \                     see :ref:`vector_labels_tab`                \
|inOverview| :guilabel:`Add to Overview`                      :kbd:`Ctrl+Shift+O`   \                                           :guilabel:`Manage Layers`
|addAllToOverview| :guilabel:`Add All To Overview`            \                     \                                           \
|removeAllOVerview| :guilabel:`Remove All From Overview`      \                     \                                           \
============================================================  ====================  ==========================================  ===============================

Settings
--------

================================================================  ====================  ==========================================  ===============================
Menu Option                                                       Shortcut              Reference                                   Toolbar
================================================================  ====================  ==========================================  ===============================
|symbology| :guilabel:`Style Manager...`                          \                     see :ref:`vector_style_manager`             \
|customProjection| :guilabel:`Custom Projections...`              \                     see :ref:`sec_custom_projections`           \
|keyboardShortcuts| :guilabel:`Keyboard Shortcuts...`             \                     see :ref:`shortcuts`                        \
|interfaceCustomization| :guilabel:`Interface Customization...`   \                     see :ref:`sec_customization`                \
|options| :guilabel:`Options...`                                  \                     see :ref:`gui_options`                      \
================================================================  ====================  ==========================================  ===============================

Under |kde| Linux KDE, you'll find more tools in :menuselection:`Settings`
menu such as :guilabel:`Project Properties`, :menuselection:`Panels -->`,
:menuselection:`Toolbars -->` and :guilabel:`Toggle Full Screen Mode`.

Plugins
-------

======================================================================  ====================  ===================================  ===============================
Menu Option                                                             Shortcut              Reference                            Toolbar
======================================================================  ====================  ===================================  ===============================
|showPluginManager| :guilabel:`Manage and Install Plugins...`           \                     see :ref:`managing_plugins`          \
|installPluginFromZip| :guilabel:`Install Plugins from ZIP...`          \                     see :ref:`managing_plugins`          \
:guilabel:`Python Console`                                              :kbd:`Ctrl+Alt+P`     \                                    \
======================================================================  ====================  ===================================  ===============================

When starting QGIS for the first time not all core plugins are loaded.

Vector
------

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
:menuselection:`OpenStreetMap -->`                              \                     see :ref:`open_street_map`                  \
|analysis| :menuselection:`Analysis Tools -->`                  \                     see :ref:`vector_menu`                      \
|sampling| :menuselection:`Research Tools -->`                  \                     see :ref:`vector_menu`                      \
|geoprocessing| :menuselection:`Geoprocessing Tools -->`        \                     see :ref:`vector_menu`                      \
|geometry| :menuselection:`Geometry Tools -->`                  \                     see :ref:`vector_menu`                      \
|management| :menuselection:`Data Management Tools -->`         \                     see :ref:`vector_menu`                      \
==============================================================  ====================  ==========================================  ===============================

When starting QGIS for the first time not all core plugins are loaded.
Many of the above-mentioned sub-menus require the core plugin Processing
to be activated.

Raster
------

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
:guilabel:`Raster calculator...`                                \                     see :ref:`label_raster_calc`                \
:guilabel:`Align Raster...`                                     \                     see :ref:`label_raster_align`               \
|analysis| :menuselection:`Analysis -->`                        \                     see :ref:`label_plugingdaltools`            \
|sampling| :menuselection:`Projection -->`                      \                     see :ref:`label_plugingdaltools`            \
|geoprocessing| :menuselection:`Conversion -->`                 \                     see :ref:`label_plugingdaltools`            \
|geometry| :menuselection:`Miscellaneous -->`                   \                     see :ref:`label_plugingdaltools`            \
|management| :menuselection:`Extraction -->`                    \                     see :ref:`label_plugingdaltools`            \
==============================================================  ====================  ==========================================  ===============================

When starting QGIS for the first time not all core plugins are loaded.
Many of the above-mentioned sub-menus require the core plugin Processing
to be activated.

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
|processing| :guilabel:`Toolbox`                                :kbd:`Ctrl+Alt+T`     see :ref:`processing.toolbox`               \
|processingModel| :guilabel:`Graphical Modeler...`              :kbd:`Ctrl+Alt+M`     see :ref:`processing.modeler`               \
|processingHistory| :guilabel:`History...`                      :kbd:`Ctrl+Alt+H`     see :ref:`processing.history`               \
|processingResult| :guilabel:`Results Viewer`                   :kbd:`Ctrl+Alt+R`     see :ref:`processing.results`               \
|processingCommander| :guilabel:`Commander`                     :kbd:`Ctrl+Alt+D`     see :ref:`processing.commander`             \
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
-----

This menu is only available under |osx| macOS and contains some OS related
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

From the :menuselection:`View` menu (or |kde| :menuselection:`Settings`), you can
switch on and off QGIS widgets (:menuselection:`Panels -->`) or toolbars
(:menuselection:`Toolbars -->`). You can (de)activate any of them by
right-clicking the menu bar or a toolbar and choose the item you want.
Each panel or toolbar can be moved and placed wherever you feel comfortable
within QGIS interface.
The list can also be extended with the activation of :ref:`Core or external
plugins <plugins>`.


.. index:: Toolbars
.. _`label_toolbars`:

Toolbars
--------

The toolbar provides access to most of the same functions as the menus, plus
additional tools for interacting with the map. Each toolbar item has pop-up help
available. Hold your mouse over the item and a short description of the tool's
purpose will be displayed.

Every toolbar can be moved around according to your needs. Additionally,
they can be switched off using the right mouse button context menu, or by
holding the mouse over the toolbars.

.. _figure_toolbars:

.. figure:: /static/user_manual/introduction/toolbars.png
   :align: center

   The Toolbars menu

.. index::
   single: Toolbars; Layout

.. tip:: **Restoring toolbars**

   If you have accidentally hidden a toolbar, you can get it
   back by choosing menu option :menuselection:`View --> Toolbars -->`
   (or |kde| :menuselection:`Settings --> Toolbars -->`).
   If for some reason a toolbar (or any other widget) totally disappears
   from the interface, you'll find tips to get it back at :ref:`restoring
   initial GUI <tip_restoring_configuration>`.

.. index:: Panels
.. _panels_tools:

Panels
------

Besides toolbars, QGIS provides by default many panels to work with. Panels are
special widgets that you can interact with (selecting options, checking boxes,
filling values...) in order to perform a more complex task.


.. _figure_panels:

.. figure:: /static/user_manual/introduction/panels.png
   :align: center

   The Panels menu

Below are listed default panels provided by QGIS:

* the :ref:`label_legend`
* the :ref:`Browser Panel <browser_panel>`
* the :ref:`Advanced Digitizing Panel <advanced_digitizing_panel>`
* the :ref:`Spatial Bookmarks Panel <sec_bookmarks>`
* the :ref:`GPS Information Panel <sec_gpstracking>`
* the :ref:`Tile Scale Panel <tilesets>`
* the :ref:`Identify Panel <identify>`
* the :ref:`User Input Panel <rotate_feature>`
* the :ref:`Layer Order Panel <layer_order>`
* the :ref:`layer_styling_panel` 
* the :ref:`statistical_summary`
* the :ref:`overview_panels`
* the :ref:`log_message_panel`
* the :ref:`undo_redo_panel`
* the :ref:`Processing Toolbox <label_processing>`


.. index:: Map view
.. _`label_mapview`:

Map View
========

Also called **Map canvas**, this is the "business end" of QGIS ---
maps are displayed in this area. The map displayed in this window
will depend on the vector and raster layers you have chosen to load.

When you add a layer (see e.g. :ref:`vector_loading_file`), QGIS automatically
looks for its Coordinate Reference System (CRS) and zooms to its extent if you
work in a blank QGIS project. The layer's CRS is then applied to the project.
If there are already layers in the project, and in the case the new layer has
the same CRS as the project, its features falling in the current map canvas
extent will be visualized. If the new layer is in a different CRS from the
project's, you must :guilabel:`Enable on-the-fly CRS transformation` from the
:menuselection:`Project --> Project Properties --> CRS`
(see :ref:`otf_transformation`). The added layer should now be visible if data
are available in the current view extent.

The map view can be panned, shifting the focus of the map display to another
region, and it can be zoomed in and out. Various other operations can be
performed on the map as described in the :ref:`label_toolbars` description.
The map view and the legend are tightly bound to each other --- the maps in
view reflect changes you make in the legend area.


.. index:: Zoom, Mouse wheel

.. tip::
   **Zooming the Map with the Mouse Wheel**

   You can use the mouse wheel to zoom in and out on the map. Place the mouse
   cursor inside the map area and roll the wheel forward (away from you) to
   zoom in and backwards (towards you) to zoom out. The zoom is centered on the
   mouse cursor position. You can customize the behavior of the
   mouse wheel zoom using the :guilabel:`Map tools` tab under the
   :menuselection:`Settings --> Options` menu.


.. index:: Pan, Arrow 

.. tip::
   **Panning the Map with the Arrow Keys and Space Bar**

   You can use the arrow keys to pan the map. Place the mouse cursor inside
   the map area and click on the right arrow key to pan east, left arrow key to
   pan west, up arrow key to pan north and down arrow key to pan south. You can
   also pan the map using the space bar or the click on mouse wheel: just move
   the mouse while holding down space bar or click on mouse wheel.

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

.. index:: Magnification
.. _magnifier:

On the right side of the scale display you can define a current
magnification level for your map view. This allows to zoom in to a map
without altering the map scale, making it easier to accurately
tweak the positions of labels and symbols. The magnification level is expressed as a
percentage. If the :guilabel:`Magnifier` has a level of 100%, then the current
map is not magnified. Additionally, a default magnification value can be defined
within
:menuselection:`Settings --> Options --> Rendering --> Rendering behaviour`,
which is very useful for high resolution screen to avoid too small symbols.

To the right of the magnifier tool you can define a current clockwise rotation for
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
      single: Scale calculate

   When you start QGIS, the default CRS is ``WGS 84 (epsg 4326)`` and
   units are degrees. This means that QGIS will interpret any
   coordinate in your layer as specified in degrees. To get correct scale values,
   you can either manually change this setting, e.g. to meters, in the :guilabel:`General`
   tab under :menuselection:`Project --> Project Properties`, or you can use
   the |projectionDisabled| :sup:`Current CRS:` icon seen above. In the latter case,
   the units are set to what the project projection specifies (e.g., ``+units=us-ft``).

   Note that CRS choice on startup can be set in :menuselection:`Settings --> Options --> CRS`.
