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

Project
-------

=======================================================  ====================  ==========================================  ===============================
Menu Option                                              Shortcut              Reference                                   Toolbar
=======================================================  ====================  ==========================================  ===============================
|fileNew| :guilabel:`New`                                :kbd:`Ctrl+N`         see :ref:`sec_projects`                     :guilabel:`Project`
|fileOpen| :guilabel:`Open`                              :kbd:`Ctrl+O`         see :ref:`sec_projects`                     :guilabel:`Project`
:menuselection:`New from template -->`                   \                     see :ref:`sec_projects`                     :guilabel:`Project`
:menuselection:`Open Recent  -->`                        \                     see :ref:`sec_projects`                     \
|fileSave| :guilabel:`Save`                              :kbd:`Ctrl+S`         see :ref:`sec_projects`                     :guilabel:`Project`
|fileSaveAs| :guilabel:`Save As...`                      :kbd:`Ctrl+Shift+S`   see :ref:`sec_projects`                     :guilabel:`Project`
|saveMapAsImage| :guilabel:`Save as Image...`            \                     see :ref:`sec_output`                       \
:guilabel:`DXF Export ...`                               \                     see :ref:`sec_output`                       \
|projectProperties| :guilabel:`Project Properties ...`   :kbd:`Ctrl+Shift+P`   see :ref:`sec_projects`                     \
|newComposer| :guilabel:`New Print Composer`             :kbd:`Ctrl+P`         see :ref:`label_printcomposer`              :guilabel:`Project`
|composerManager| :guilabel:`Composer manager ...`       \                     see :ref:`label_printcomposer`              :guilabel:`Project`
:menuselection:`Print Composers -->`                     \                     see :ref:`label_printcomposer`              \
|fileExit| :guilabel:`Exit QGIS`                         :kbd:`Ctrl+Q`         \                                           \
=======================================================  ====================  ==========================================  ===============================

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
|rotatePointSymbols| :guilabel:`Rotate Feature(s)`                    \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
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
|pan| :guilabel:`Pan Map`                                \                     \                                           :guilabel:`Map Navigation`
|panToSelected| :guilabel:`Pan Map to Selection`         \                     \                                           :guilabel:`Map Navigation`
|zoomIn| :guilabel:`Zoom In`                             :kbd:`Ctrl++`         \                                           :guilabel:`Map Navigation`
|zoomOut| :guilabel:`Zoom Out`                           :kbd:`Ctrl+-`         \                                           :guilabel:`Map Navigation`
:menuselection:`Select -->`                              \                     see :ref:`sec_selection`                    :guilabel:`Attributes`
|identify| :guilabel:`Identify Features`                 :kbd:`Ctrl+Shift+I`   \                                           :guilabel:`Attributes`
:menuselection:`Measure -->`                             \                     see :ref:`sec_measure`                      :guilabel:`Attributes`
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

Layer
-----

============================================================  ====================  ==========================================  ===============================
Menu Option                                                   Shortcut              Reference                                   Toolbar
============================================================  ====================  ==========================================  ===============================
:menuselection:`Create Layer -->`                             \                     see :ref:`sec_create_vector`                :guilabel:`Manage Layers`
:menuselection:`Add Layer -->`                                \                     \                                           :guilabel:`Manage Layers`
:guilabel:`Embed Layers and Groups ...`                       \                     see :ref:`nesting_projects`                 \
:guilabel:`Add from Layer Definition File ...`                \                     \                                           \
|editCopy| :guilabel:`Copy style`                             \                     see :ref:`vector_style_menu`                \
|editPaste| :guilabel:`Paste style`                           \                     see :ref:`vector_style_menu`                \
|openTable| :guilabel:`Open Attribute Table`                  \                     see :ref:`sec_attribute_table`              :guilabel:`Attributes`
|toggleEditing| :guilabel:`Toggle Editing`                    \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|fileSave| :guilabel:`Save Layer Edits`                       \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|allEdits| :menuselection:`Current Edits -->`                 \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
:menuselection:`Save as...`                                   \                     \                                           \
:menuselection:`Save as layer definition file...`             \                     \                                           \
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
|customProjection| :guilabel:`Custom CRS ...`            \                     see :ref:`sec_custom_projections`           \
:guilabel:`Style Manager...`                             \                     see :ref:`vector_style_manager`             \
|options| :guilabel:`Configure shortcuts ...`            \                     \                                           \
|options| :guilabel:`Customization ...`                  \                     see :ref:`sec_customization`                \
|options| :guilabel:`Options ...`                        \                     see :ref:`gui_options`                      \
:guilabel:`Snapping Options ...`                         \                     see :ref:`snapping_tolerance`               \
=======================================================  ====================  ==========================================  ===============================

Plugins
-------

======================================================================  ====================  ===================================  ===============================
Menu Option                                                             Shortcut              Reference                            Toolbar
======================================================================  ====================  ===================================  ===============================
|showPluginManager| :guilabel:`Manage and Install Plugins ...`          \                     see :ref:`managing_plugins`          \
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
:guilabel:`Raster calculator ...`                               \                     see :ref:`label_raster_calc`                \
:guilabel:`Align Raster ...`                                    \                     see :ref:`label_raster_align`               \
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
|processingModel| :guilabel:`Graphical Modeler ...`             \                     see :ref:`processing.modeler`               \
|processingHistory| :guilabel:`History and log ...`             \                     see :ref:`processing.history`               \
|processingOption| :guilabel:`Options ...`                      \                     see :ref:`processing.options`               \
|processingResult| :guilabel:`Results viewer ...`               \                     see :ref:`processing.results`               \
|processingCommander| :guilabel:`Commander`                     :kbd:`Ctrl+Alt+M`     see :ref:`processing.commander`             \
==============================================================  ====================  ==========================================  ===============================

When starting QGIS for the first time not all core plugins are loaded.

Help
----

=======================================================  ====================  ==========================================  ===============================
Menu Option                                              Shortcut              Reference                                   Toolbar
=======================================================  ====================  ==========================================  ===============================
|helpContents| :guilabel:`Help Contents`                 :kbd:`F1`             \                                           :guilabel:`Help`
|whatsThis| :guilabel:`What's This?`                     :kbd:`Shift+F1`       \                                           :guilabel:`Help`
:guilabel:`API Documentation`                            \                     \                                           \
:guilabel:`Report an Issue`                              \                     \                                           \
:guilabel:`Need commercial support?`                     \                     \                                           \
|qgisHomePage| :guilabel:`QGIS Home Page`                :kbd:`Ctrl+H`         \                                           \
|checkQgisVersion| :guilabel:`Check QGIS Version`        \                     \                                           \
|helpAbout| :guilabel:`About`                            \                     \                                           \
|helpSponsors| :guilabel:`QGIS Sponsors`                 \                     \                                           \
=======================================================  ====================  ==========================================  ===============================

Please note that for Linux |nix|, the menu bar items listed above are the default
ones in the KDE window manager. In GNOME, the :menuselection:`Settings` menu
has different content and its items have to be found here:

+-------------------------------------------------------------+------------------------+
| |customProjection| :guilabel:`Custom CRS`                   | :guilabel:`Edit`       |
+-------------------------------------------------------------+------------------------+
| :guilabel:`Style Manager`                                   | :guilabel:`Edit`       |
+-------------------------------------------------------------+------------------------+
| |options| :guilabel:`Configure Shortcuts`                   | :guilabel:`Edit`       |
+-------------------------------------------------------------+------------------------+
| |options| :guilabel:`Customization`                         | :guilabel:`Edit`       |
+-------------------------------------------------------------+------------------------+
| |options| :guilabel:`Options`                               | :guilabel:`Edit`       |
+-------------------------------------------------------------+------------------------+
| :menuselection:`Snapping Options ...`                       | :guilabel:`Edit`       |
+-------------------------------------------------------------+------------------------+


.. See Appendix :ref:`app_menu` for complete descriptions of the menu items.

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
   single:layout toolbars

.. tip:: **Restoring toolbars**

   If you have accidentally hidden a toolbar, you can get it
   back by choosing menu option :menuselection:`View --> Toolbars -->`
   (or :menuselection:`Settings --> Toolbars -->` under Linux KDE).
   If for some reason a toolbar (or any other widget) totally disappears
   from the interface, you'll find tips to get it back at :ref:`restoring
   initial GUI <tip_restoring_configuration>`.

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

.. _`label_legend`:

Layers Panel
............

.. index::
   single:legend

The layers panel lists all the layers in the project. The checkbox in each
legend entry can be used to show or hide the layer. The toolbar in the layers
panel allows you to:

* |addGroup| Add new group
* |showPresets| :sup:`Manage Visibility`: control visibility of layers and
  preset layers combination
* |filterMap| :sup:`Filter Legend by Map Content`: only the layers that are set
  visible and whose features intersect the current map canvas have their style
  rendered in the layers panel. Otherwise, a generic NULL symbol is applied to the
  layer. Based on the layer symbology, this is a convenient way to identify which
  kind of features from which layers cover your area of interest.
* |expressionFilter| :sup:`Filter Legend by Expression`: helps you apply an
  expression to remove from the selected layer tree styles that have no feature
  satisfying the condition. This can be used for example to highlight features that are
  within a given area/feature of another layer.
  From the drop-down list, you can edit and clear the expression set.
* |expandTree| :sup:`Expand All` or |collapseTree| :sup:`Collapse All`
  layers and groups in the layers panel.
* and |removeLayer| :sup:`Remove Layer/Group` currently selected.

.. _figure_layer_toolbar:

.. only:: html

   **Figure Layer tools Bar:**

   .. figure:: /static/user_manual/introduction/layer_toolbar.png
      :align: center

      Layer Toolbar in Layers Panel


.. index::
   single:layer visibility

The button |showPresets| allows you to add **Presets** views in the legend.
Presets are a way to save and easily restore a combination of layers with their
current style. To add a preset view, just set visible the layers you want, with
their desired symbology, and click on |showPresets| button.
Choose :menuselection:`Add Preset...` from the drop-down menu and give a name to the preset.
The added preset is listed at the bottom of the drop-down menu and is recalled by
clicking on it.

The :menuselection:`Replace Preset -->` option helps you overwrite a preset content
with the current map view while the :menuselection:`Remove Current Preset` button
deletes the active preset.

All the added presets are also present in the map composer in order to allow you
to create a map layout based on your specific views (see :ref:`composer_main_properties`).

.. note::
   Tools to manage the layers panel are also available to layout the map
   and legend items of the print composer

A layer can be selected and dragged up or down in the legend to change the
Z-ordering. Z-ordering means that layers listed nearer the top of the legend
are drawn over layers listed lower down in the legend.

.. note:: This behavior can be overridden by the :ref:`Layer Order <layer_order>` panel.

Layers in the legend window can be organized into groups. There are two ways to
do this:

#. Press the |folder| icon to add a new group. Type in a name for
   the group and press :kbd:`Enter`. Now click on an existing layer and
   drag it onto the group.
#. Select some layers, right click in the legend window and choose
   :guilabel:`Group Selected`. The selected layers will automatically be placed
   in a new group.

To bring a layer out of a group, you can drag it out, or right click on it and
choose :guilabel:`Make to toplevel item`. Groups can also be nested inside other
groups.

The checkbox for a group will show or hide all the layers in the group
with one click.

The content of the right mouse button context menu depends on whether the
selected legend item is a raster or a vector layer. For GRASS vector layers,
|toggleEditing| :sup:`Toggle editing` is not available. See section
:ref:`grass_digitizing` for information on editing GRASS vector layers.

Below are listed available options in context menu depending on the selected item.

================================================================  =====================  ===================== ===============
Option                                                            Vector Layer           Raster Layer          Group
================================================================  =====================  ===================== ===============
|zoomToLayer| :menuselection:`Zoom to Layer/Group`                |checkbox|             |checkbox|            |checkbox|
|unchecked| :menuselection:`Show in Overview`                     |checkbox|             |checkbox|            \
|zoomActual| :menuselection:`Zoom to Native Resolution (100%)`    \                      |checkbox|            \
:menuselection:`Stretch Using Current Extent`                     \                      |checkbox|            \
|removeLayer| :menuselection:`Remove`                             |checkbox|             |checkbox|            |checkbox|
|duplicateLayer| :menuselection:`Duplicate`                       |checkbox|             |checkbox|            \
:menuselection:`Set Layer Scale Visibility`                       |checkbox|             |checkbox|            \
:menuselection:`Set Layer/Group CRS`                              |checkbox|             |checkbox|            |checkbox|
:menuselection:`Set Project CRS from Layer`                       |checkbox|             |checkbox|            \
:menuselection:`Styles -->`                                       |checkbox|             |checkbox|            \
:menuselection:`Copy Style`                                       |checkbox|             |checkbox|            \
:menuselection:`Paste Style`                                      |checkbox|             |checkbox|            |checkbox|
|openTable| :menuselection:`Open Attribute Table`                 |checkbox|             \                     \
|toggleEditing| :menuselection:`Toggle Editing`                   |checkbox|             \                     \
|allEdits| :menuselection:`Current Edits -->`                     |checkbox|             \                     \
                                                                  (in Edit mode)
:menuselection:`Save As...`                                       |checkbox|             |checkbox|            \
:menuselection:`Save As Layer Definition File...`                 |checkbox|             |checkbox|            |checkbox|
:menuselection:`Filter`                                           |checkbox|             \                     \
|unchecked| :menuselection:`Show Feature Count`                   |checkbox|             \                     \
:menuselection:`Properties`                                       |checkbox|             |checkbox|            \
:menuselection:`Move to Top-level`                                |checkbox|             |checkbox|            \
:menuselection:`Rename`                                           |checkbox|             |checkbox|            |checkbox|
:menuselection:`Group Selected`                                   |checkbox|             |checkbox|            \
:menuselection:`Properties`                                       |checkbox|             |checkbox|            \
:menuselection:`Set Group WMS Data`                               \                      \                     |checkbox|
|unchecked| :menuselection:`Mutually Exclusive Group`             \                      \                     |checkbox|
|addGroup| :menuselection:`Add Group`                             \                      \                     |checkbox|
================================================================  =====================  ===================== ===============


Enabling the **Mutually Exclusive Group** option you can make a group have only
one layer visible at the same time.
Whenever a layer within the group is set visible the others will be toggled not visible.

It is possible to select more than one layer or group at the same time by
holding down the :kbd:`Ctrl` key while selecting the layers with the left mouse
button. You can then move all selected layers to a new group at the same time.

You may also delete more than one layer or group at once by selecting
several items with the :kbd:`Ctrl` key and pressing :kbd:`Ctrl+D` afterwards.
This way, all selected layers or groups will be removed from the layers list.

.. index:: Style

.. _editing_style_layer:

Editing vector layer style
^^^^^^^^^^^^^^^^^^^^^^^^^^^

From the Layers panel, you have shortcuts to easily and quickly edit the layer
rendering.
Right-click on a vector layer and select :guilabel:`Styles -->` in the list
in order to:

* see the currently applied :ref:`styles <manage_custom_style>` to the layer. In
  case you defined many styles for the layer, you can switch from one to another
  and have your layer rendering automatically updated in the map canvas.
* copy the current style, and when applicable, paste a copied style from another layer
* rename the current style, add a new one (which is actually a copy of the current
  one) or delete the current style (when multiple styles available).

.. note:: The previous options are also available for raster layer.

Whether the features in the vector layer have all the same unique symbol or they are
classified (in that case, the layer is displayed in a tree structure with each class
as sub-item), the following options are available at layer level or class level:

* a :guilabel:`Edit Symbol...` button to open the :ref:`symbol-selector` dialog and
  update any property (symbol, size, color...) of the layer or feature symbol.
  Double-clicking on a feature does also open the :guilabel:`Symbol Selector` dialog.
* a :ref:`color-selector` widget with a **Color Wheel** from which you can click a
  color and have it automatically update the symbol fill color. For convenience,
  **Recent colors** are available at the bottom of the color wheel.
* a |showAllLayers| :guilabel:`Show All Items` and |hideAllLayers| :guilabel:`Hide All
  Items` to toggle on or off the visibility of all the classes of features. This avoids
  (un)checking items one by one.

.. tip:: **Quickly share a layer style**

    From the context menu, copy the style of a layer and paste it to a group
    or a selection of layers: the style is applied to all the layers that
    are of the same type (vector vs raster) as the original layer and,
    in case of vector, have the same geometry type (point, line or polygon).


.. _layer_order:

Working with the Legend independent layer order
...............................................

There is a panel that allows you to define an independent drawing order for
the layers panel. You can activate it in the menu
:menuselection:`Settings --> Panels --> Layer Order Panel`. This feature allows you
to, for instance, order your layers in order of importance, but still display
them in the correct order (see figure_layer_order_). Checking the |checkbox|
:guilabel:`Control rendering order` box underneath the list of layers will
cause a revert to default behavior.

.. _figure_layer_order:

.. only:: html

   **Figure Layer Order:**

.. figure:: /static/user_manual/introduction/layer_order.png
    :align: center

    Define a legend independent layer order

.. index::
   single:Statistic

.. _`statistical_summary`:

Statistical Summary Panel
..........................

This panel can show some statistics on a specific vector layers. The panel
allows users to choose:

* the vector layer;
* the column or the expression;
* filter statistics to selected features;
* refresh the informations;
* the statistics information to display with the bottom right button;

.. index::
   single:Map overview

QGIS Overview Panel
...................

In QGIS, you can use an overview panel that provides a full extent view of
layers added to it. Within the view is a rectangle showing the current map
extent. This allows you to quickly determine which area of the map you are
currently viewing. Note that labels are not rendered to the map overview even
if the layers in the map overview have been set up for labelling. If you click
and drag the red rectangle in the overview that shows your current extent, the
main map view will update accordingly.


.. index::
   single:Log messages

Log Messages Panel
..................

When loading or processing some operations, you can track and follow messages
that appear in different tabs using the |messageLog| Log Messages Panel.
It can be activated using the most right icon in the bottom status bar.


.. index:: Undo, Redo

Undo/Redo Panel
..................

For each layer being edited, this panel shows the list of actions done, allowing
to quickly undo a set of actions by simply selecting the action listed above.

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
performed on the map as described in the toolbar description above. The map
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
