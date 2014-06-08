|updatedisclaimer|

.. _`label_qgismainwindow`:

********
|qg| GUI
********

.. index::
   single:main window

When |qg| starts, you are presented with the GUI as shown in the figure (the numbers 1
through 5 in yellow circles are
discussed below).

.. _fig_startup:

.. only:: html

   **Figure QGIS GUI 1:**

.. figure:: /static/user_manual/introduction/startup.png
   :align: center
   :width: 35em

   |qg| GUI with Alaska sample data |nix|

.. note::
   Your window decorations (title bar, etc.) may appear different depending on
   your operating system and window manager.

The |qg| GUI is divided into five areas:

#. Menu Bar
#. Tool Bar
#. Map Legend
#. Map View
#. Status Bar

These five components of the |qg| interface are described in more detail in
the following sections. Two more sections present keyboard shortcuts and
context help.

.. _label_menubar:

Menu Bar
--------

.. index::
   single:menus

The menu bar provides access to various |qg| features using a standard
hierarchical menu. The top-level menus and a summary of some of the menu
options are listed below, together with the associated icons as
they appear on the toolbar, and keyboard shortcuts. The shortcuts presented in this section are the
defaults; however, keyboard shortcuts
can also be configured manually using the :guilabel:`Configure shortcuts` dialog, opened from
:menuselection:`Settings --> Configure Shortcuts...`.

Although most menu options have a corresponding tool and vice-versa, the menus
are not organized exactly like the toolbars. The toolbar containing the tool is
listed after each menu option as a checkbox entry. Some menu options only
appear if the corresponding plugin is loaded. For more information about tools
and toolbars, see section :ref:`label_toolbars`.

Project
........

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
|mActionFileNew| :guilabel:`New`                                :kbd:`Ctrl+N`         see :ref:`sec_projects`                     :guilabel:`Project`
|mActionFileOpen| :guilabel:`Open`                              :kbd:`Ctrl+O`         see :ref:`sec_projects`                     :guilabel:`Project`
:menuselection:`New from template -->`                          \                     see :ref:`sec_projects`                     :guilabel:`Project`
:menuselection:`Open Recent  -->`                               \                     see :ref:`sec_projects`                     \
|mActionFileSave| :guilabel:`Save`                              :kbd:`Ctrl+S`         see :ref:`sec_projects`                     :guilabel:`Project`
|mActionFileSaveAs| :guilabel:`Save As...`                      :kbd:`Ctrl+Shift+S`   see :ref:`sec_projects`                     :guilabel:`Project`
|mActionSaveMapAsImage| :guilabel:`Save as Image...`            \                     see :ref:`sec_output`                       \
:guilabel:`DXF Export ...`                                      \                     see :ref:`sec_output`                       \
|mActionNewComposer| :guilabel:`New Print Composer`             :kbd:`Ctrl+P`         see :ref:`label_printcomposer`              :guilabel:`Project`
|mActionComposerManager| :guilabel:`Composer manager ...`       \                     see :ref:`label_printcomposer`              :guilabel:`Project`
:menuselection:`Print Composers -->`                            \                     see :ref:`label_printcomposer`              \
|mActionFileExit| :guilabel:`Exit QGIS`                         :kbd:`Ctrl+Q`         \                                           \
==============================================================  ====================  ==========================================  ===============================

Edit
....

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
|mActionUndo| :guilabel:`Undo`                                  :kbd:`Ctrl+Z`         see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionRedo| :guilabel:`Redo`                                  :kbd:`Ctrl+Shift+Z`   see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionEditCut| :guilabel:`Cut Features`                       :kbd:`Ctrl+X`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionEditCopy| :guilabel:`Copy Features`                     :kbd:`Ctrl+C`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionEditPaste| :guilabel:`Paste Features`                   :kbd:`Ctrl+V`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
:menuselection:`Paste features as -->`                          \		      see :ref:`sec_attribute_table`	          \		
|mActionCapturePoint| :guilabel:`Add Feature`                   :kbd:`Ctrl+.`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionMoveFeature| :guilabel:`Move Feature(s)`                \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionDeleteSelected| :guilabel:`Delete Selected`             \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionRotatePointSymbols| :guilabel:`Rotate Feature(s)`       \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionSimplify| :guilabel:`Simplify Feature`                  \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionAddRing| :guilabel:`Add Ring`                           \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionAddPart| :guilabel:`Add Part`                           \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionFillRing| :guilabel:`Fill Ring`                         \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionDeleteRing| :guilabel:`Delete Ring`                     \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionDeletePart| :guilabel:`Delete Part`                     \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionReshape| :guilabel:`Reshape Features`                   \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionOffsetCurve| :guilabel:`Offset Curves`                  \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionSplitFeatures| :guilabel:`Split Features`               \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionSplitParts| :guilabel:`Split Parts`                     \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mergeFeats| :guilabel:`Merge Selected Features`                \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mergeFeats| :guilabel:`Merge Attr. of Selected Features`       \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionNodeTool| :guilabel:`Node Tool`                         \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionRotatePointSymbols| :guilabel:`Rotate Point Symbols`    \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
==============================================================  ====================  ==========================================  ===============================

After activating |mActionToggleEditing| :sup:`Toggle editing` mode for a layer,
you will find the ``Add Feature`` icon in the :menuselection:`Edit` menu
depending on the layer type (point, line or polygon).

Edit (extra)
............

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
|mActionCapturePoint| :guilabel:`Add Feature`                   \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionCaptureLine| :guilabel:`Add Feature`                    \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionCapturePolygon| :guilabel:`Add Feature`                 \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
==============================================================  ====================  ==========================================  ===============================

View
....

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
|mActionPan| :guilabel:`Pan Map`                                \                     \                                           :guilabel:`Map Navigation`
|PanToSelected| :guilabel:`Pan Map to Selection`                \                     \                                           :guilabel:`Map Navigation`
|mActionZoomIn| :guilabel:`Zoom In`                             :kbd:`Ctrl++`         \                                           :guilabel:`Map Navigation`
|mActionZoomOut| :guilabel:`Zoom Out`                           :kbd:`Ctrl+-`         \                                           :guilabel:`Map Navigation`
:menuselection:`Select -->`                                     \                     see :ref:`sec_selection`                    :guilabel:`Attributes`
|mActionIdentify| :guilabel:`Identify Features`                 :kbd:`Ctrl+Shift+I`   \                                           :guilabel:`Attributes`
:menuselection:`Measure -->`                                    \                     see :ref:`sec_measure`                      :guilabel:`Attributes`
|mActionZoomFullExtent| :guilabel:`Zoom Full`                   :kbd:`Ctrl+Shift+F`   \                                           :guilabel:`Map Navigation`
|mActionZoomToLayer| :guilabel:`Zoom To Layer`                  \                     \                                           :guilabel:`Map Navigation`
|mActionZoomToSelected| :guilabel:`Zoom To Selection`           :kbd:`Ctrl+J`         \                                           :guilabel:`Map Navigation`
|mActionZoomLast| :guilabel:`Zoom Last`                         \                     \                                           :guilabel:`Map Navigation`
|mActionZoomNext| :guilabel:`Zoom Next`                         \                     \                                           :guilabel:`Map Navigation`
|mActionZoomActual| :guilabel:`Zoom Actual Size`                \                     \                                           :guilabel:`Map Navigation`
:menuselection:`Decorations -->`                                \                     see :ref:`decorations`                      \
|mActionMapTips| :guilabel:`Map Tips`                           \                     \                                           :guilabel:`Attributes`
|mActionNewBookmark| :guilabel:`New Bookmark`                   :kbd:`Ctrl+B`         see :ref:`sec_bookmarks`                    :guilabel:`Attributes`
|mActionShowBookmarks| :guilabel:`Show Bookmarks`               :kbd:`Ctrl+Shift+B`   see :ref:`sec_bookmarks`                    :guilabel:`Attributes`
|mActionDraw| :guilabel:`Refresh`                               :kbd:`Ctrl+R`                                                     :guilabel:`Map Navigation`
==============================================================  ====================  ==========================================  ===============================

Layer
.....

===================================================================  ====================  ==========================================  ===============================
Menu Option                                                          Shortcut              Reference                                   Toolbar
===================================================================  ====================  ==========================================  ===============================
:menuselection:`New -->`                                             \                     see :ref:`sec_create_vector`                :guilabel:`Manage Layers`
:guilabel:`Embed Layers and Groups ...`                              \                     see :ref:`nesting_projects`                 \
|mActionAddOgrLayer| :guilabel:`Add Vector Layer`                    :kbd:`Ctrl+Shift+V`   see :ref:`label_workingvector`              :guilabel:`Manage Layers`
|mActionAddRasterLayer| :guilabel:`Add Raster Layer`                 :kbd:`Ctrl+Shift+R`   see :ref:`load_raster`                      :guilabel:`Manage Layers`
|mActionAddPostgisLayer| :guilabel:`Add PostGIS Layer`               :kbd:`Ctrl+Shift+D`   see :ref:`label_postgis`                    :guilabel:`Manage Layers`
|mActionAddSpatiaLiteLayer| :guilabel:`Add SpatiaLite Layer`         :kbd:`Ctrl+Shift+L`   see :ref:`label_spatialite`                 :guilabel:`Manage Layers`
|mActionAddMssqlLayer| :guilabel:`Add MSSQL Spatial Layer`           :kbd:`Ctrl+Shift+M`   see :ref:`label_mssql`                      :guilabel:`Manage Layers`
|oracle_raster| :guilabel:`Add Oracle GeoRaster Layer`               \                     see :ref:`oracle_raster`                    :guilabel:`Manage Layers`
|icon_sqlanywhere| :guilabel:`Add SQL Anywhere Layer`                \                     see :ref:`sqlanywhere`                      :guilabel:`Manage Layers`
|mActionAddWmsLayer| :guilabel:`Add WMS/WMTS Layer`                  :kbd:`Ctrl+Shift+W`   see :ref:`ogc-wms`                          :guilabel:`Manage Layers`
|wcs| :guilabel:`Add WCS Layer`                                      \                     see :ref:`ogc-wcs`                          :guilabel:`Manage Layers`
|wfs| :guilabel:`Add WFS Layer`                                      \                     see :ref:`ogc-wfs`                          :guilabel:`Manage Layers`
|mActionAddDelimitedTextLayer| :guilabel:`Add Delimited Text Layer`  \                     see :ref:`label_dltext`                     :guilabel:`Manage Layers`
|mActionEditCopy| :guilabel:`Copy style`                             \                     see :ref:`vector_style_menu`                \
|mActionEditPaste| :guilabel:`Paste style`                           \                     see :ref:`vector_style_menu`                \
|mActionOpenTable| :guilabel:`Open Attribute Table`                  \                     see :ref:`sec_attribute_table`              :guilabel:`Attributes`
|mActionToggleEditing| :guilabel:`Toggle Editing`                    \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionFileSave| :guilabel:`Save Layer Edits`                       \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionAllEdits| :menuselection:`Current Edits -->`                 \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
:menuselection:`Save as...`                                          \                     \                                           \
:menuselection:`Save selection as vector file...`                    \                     See :ref:`sec_attribute_table`              \
|mActionRemoveLayer| :guilabel:`Remove Layer(s)`                     :kbd:`Ctrl+D`         \                                           \
|mActionDuplicateLayer| :guilabel:`Duplicate Layers (s)`             \                     \                                           \
:menuselection:`Set CRS of Layer(s)`                                 :kbd:`Ctrl+Shift+C`   \                                           \
:menuselection:`Set project CRS from Layer`                          \                     \                                           \
:menuselection:`Properties`                                          \                     \                                           \
:menuselection:`Query...`                                            \                     \                                           \
|mActionLabeling| :guilabel:`Labeling`                               \                     \                                           \
|mActionInOverview| :guilabel:`Add to Overview`                      :kbd:`Ctrl+Shift+O`   \                                           :guilabel:`Manage Layers`
|mActionAddAllToOverview| :guilabel:`Add All To Overview`            \                     \                                           \
|RemoveAllOverview| :guilabel:`Remove All From Overview`             \                     \                                           \
|mActionShowAllLayers| :guilabel:`Show All Layers`                   :kbd:`Ctrl+Shift+U`   \                                           :guilabel:`Manage Layers`
|mActionHideAllLayers| :guilabel:`Hide All Layers`                   :kbd:`Ctrl+Shift+H`   \                                           :guilabel:`Manage Layers`
===================================================================  ====================  ==========================================  ===============================

Settings
........

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
:menuselection:`Panels -->`                                     \                     see :ref:`sec_panels_and_toolbars`          \
:menuselection:`Toolbars -->`                                   \                     see :ref:`sec_panels_and_toolbars`          \
:menuselection:`Toggle Full Screen Mode`                        :kbd:`F 11`           \                                           \
|mActionProjectProperties| :guilabel:`Project Properties ...`   :kbd:`Ctrl+Shift+P`   see :ref:`sec_projects`                     \
|mActionCustomProjection| :guilabel:`Custom CRS ...`            \                     see :ref:`sec_custom_projections`           \
:guilabel:`Style Manager...`                                    \                     see :ref:`vector_style_manager`             \
|mActionOptions| :guilabel:`Configure shortcuts ...`            \                     \                                           \
|mActionOptions| :guilabel:`Customization ...`                  \                     see :ref:`sec_customization`                \
|mActionOptions| :guilabel:`Options ...`                        \                     see :ref:`gui_options`                      \
:menuselection:`Snapping Options ...`                           \                     \                                           \
==============================================================  ====================  ==========================================  ===============================

Plugins
.......

=================================================================  ====================  ==========================================  ===============================
Menu Option                                                        Shortcut              Reference                                   Toolbar
=================================================================  ====================  ==========================================  ===============================
|mActionShowPluginManager| :guilabel:`Manage and Install Plugins`  \                     see :ref:`managing_plugins`                 \
:menuselection:`Python Console`                                    \                     \                                           \
=================================================================  ====================  ==========================================  ===============================

When starting |qg| for the first time not all core plugins are loaded.

Vector
......

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

When starting |qg| for the first time not all core plugins are loaded.

Raster
......

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
:menuselection:`Raster calculator ...`                          \                     see :ref:`sec_raster_calc`                  \
==============================================================  ====================  ==========================================  ===============================

When starting |qg| for the first time not all core plugins are loaded.

Processing
..........

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
|proc_toolbox| :guilabel:`Toolbox`                              \                     see :ref:`processing.toolbox`               \
|proc_model| :guilabel:`Graphical Modeler`                      \                     see :ref:`processing.modeler`               \
|proc_history| :guilabel:`History and log`                      \                     see :ref:`processing.history`               \
|proc_option| :guilabel:`Options and configuration`             \                     see :ref:`processing.options`               \
|proc_result| :guilabel:`Results viewer`                        \                     see :ref:`processing.results`               \
|proc_commander| :guilabel:`Commander`                          :kbd:`Ctrl+Alt+M`     see :ref:`processing.commander`             \
==============================================================  ====================  ==========================================  ===============================

When starting |qg| for the first time not all core plugins are loaded.

Help
....

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
|mActionHelpContents| :guilabel:`Help Contents`                 :kbd:`F1`             \                                           :guilabel:`Help`
|mActionWhatsThis| :guilabel:`What's This?`                     :kbd:`Shift+F1`       \                                           :guilabel:`Help`
:menuselection:`API Documentation`                              \                     \                                           \
:menuselection:`Need commercial support?`                       \                     \                                           \
|mActionQgisHomePage| :guilabel:`QGIS Home Page`                :kbd:`Ctrl+H`         \                                           \
|mActionCheckQgisVersion| :guilabel:`Check QGIS Version`        \                     \                                           \
|mActionHelpAbout| :guilabel:`About`                            \                     \                                           \
|mActionHelpSponsors| :guilabel:`QGIS Sponsors`                 \                     \                                           \
==============================================================  ====================  ==========================================  ===============================

Please note that for Linux |nix|, the menu bar items listed above are the
default ones in the KDE window manager. In GNOME, the :menuselection:`Settings` menu
has different content and its items have to be found here:

+-----------------------------------------------------------------------+------------------------+
| |mActionProjectProperties| :guilabel:`Project Properties`             | :guilabel:`Project`    |
+-----------------------------------------------------------------------+------------------------+
| |mActionOptions| :guilabel:`Options`                                  | :guilabel:`Edit`       |
+-----------------------------------------------------------------------+------------------------+
| |mActionOptions| :guilabel:`Configure Shortcuts`                      | :guilabel:`Edit`       |
+-----------------------------------------------------------------------+------------------------+
| :guilabel:`Style Manager`                                             | :guilabel:`Edit`       |
+-----------------------------------------------------------------------+------------------------+
| |mActionCustomProjection| :guilabel:`Custom CRS`                      | :guilabel:`Edit`       |
+-----------------------------------------------------------------------+------------------------+
| :menuselection:`Panels -->`                                           | :guilabel:`View`       |
+-----------------------------------------------------------------------+------------------------+
| :menuselection:`Toolbars -->`                                         | :guilabel:`View`       |
+-----------------------------------------------------------------------+------------------------+
| :guilabel:`Toggle Full Screen Mode`                                   | :guilabel:`View`       |
+-----------------------------------------------------------------------+------------------------+
| :guilabel:`Tile scale slider`                                         | :guilabel:`View`       |
+-----------------------------------------------------------------------+------------------------+
| :guilabel:`Live GPS tracking`                                         | :guilabel:`View`       |
+-----------------------------------------------------------------------+------------------------+

.. See Appendix :ref:`app_menu` for complete descriptions of the menu items.

.. _`label_toolbars`:

Toolbar
-------

.. index::

   single:toolbar

The toolbar provides access to most of the same functions as the menus, plus
additional tools for interacting with the map. Each toolbar item has pop-up help
available. Hold your mouse over the item and a short description of the tool's
purpose will be displayed.

Every menu bar can be moved around according to your needs. Additionally, every
menu bar can be switched off using your right mouse button context menu, holding
the mouse over the toolbars (read also :ref:`sec_panels_and_toolbars`).

.. index::
   single:layout toolbars

.. tip::
        **Restoring toolbars**

        If you have accidentally hidden all your toolbars, you can get them
        back by choosing menu option :menuselection:`Settings --> Toolbars -->`.
        If a toolbar disappears under Windows, which seems to be a problem in
        |qg| from time to time, you have to remove key
        ``\HKEY_CURRENT_USER\Software\QGIS\qgis\UI\state`` in the registry.
        When you restart |qg|, the key is written again with the default state,
        and all toolbars are visible again.

.. _`label_legend`:

Map Legend
----------

.. index::
   single:legend

The map legend area lists all the layers in the project. The checkbox in each
legend entry can be used to show or hide the layer.

.. index::
   single:layer visibility

A layer can be selected and dragged up or down in the legend to change the
Z-ordering. Z-ordering means that layers listed nearer the top of the legend
are drawn over layers listed lower down in the legend.

.. note:: This behaviour can be overridden by the 'Layer order' panel.

Layers in the legend window can be organised into groups. There are two ways to
do this:

#. Right click in the legend window and choose :guilabel:`Add New Group`. Type in a
   name for the group and press :kbd:`Enter`. Now click on an existing layer
   and drag it onto the group.
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
|mActionToggleEditing| :sup:`Toggle editing` is not available. See section
:ref:`grass_digitizing` for information on editing GRASS vector layers.

**Right mouse button menu for raster layers**

* :menuselection:`Zoom to layer extent`
* :menuselection:`Zoom to Best Scale (100%)`
* :menuselection:`Stretch Using Current Extent`
* :menuselection:`Show in overview`
* :menuselection:`Remove`
* :menuselection:`Duplicate`
* :menuselection:`Set Layer CRS`
* :menuselection:`Set Project CRS from Layer`
* :menuselection:`Save as ...`
* :menuselection:`Properties`
* :menuselection:`Rename`
* :menuselection:`Copy Style`
* :menuselection:`Add New Group`
* :menuselection:`Expand all`
* :menuselection:`Collapse all`
* :menuselection:`Update Drawing Order`

Additionally, according to layer position and selection

* :menuselection:`Make to toplevel item`
* :menuselection:`Group Selected`

..   * :menuselection:`Show file groups`

**Right mouse button menu for vector layers**

* :menuselection:`Zoom to Layer Extent`
* :menuselection:`Show in Overview`
* :menuselection:`Remove`
* :menuselection:`Duplicate`
* :menuselection:`Set Layer CRS`
* :menuselection:`Set Project CRS from Layer`
* :menuselection:`Open Attribute Table`
* :menuselection:`Toggle Editing` (not available for GRASS layers)
* :menuselection:`Save As ...`
* :menuselection:`Save Selection As`
* :menuselection:`Filter`
* :menuselection:`Show Feature Count`
* :menuselection:`Properties`
* :menuselection:`Rename`
* :menuselection:`Copy Style`
* :menuselection:`Add New Group`
* :menuselection:`Expand all`
* :menuselection:`Collapse all`
* :menuselection:`Update Drawing Order`

Additionally, according to layer position and selection

* :menuselection:`Make to toplevel item`
* :menuselection:`Group Selected`

..   * :menuselection:`Show file groups`

**Right mouse button menu for layer groups**

* :menuselection:`Zoom to Group`
* :menuselection:`Remove`
* :menuselection:`Set Group CRS`
* :menuselection:`Rename`
* :menuselection:`Add New Group`
* :menuselection:`Expand all`
* :menuselection:`Collapse all`
* :menuselection:`Update Drawing Order`

..   Additionally, according to position

..   *  :menuselection:`Show file groups`


It is possible to select more than one layer or group at the same time by
holding down the :kbd:`Ctrl` key while selecting the layers with the left mouse
button. You can then move all selected layers to a new group at the same time.

You may also delete more than one layer or group at once by selecting
several layers with the :kbd:`Ctrl` key and pressing :kbd:`Ctrl+D` afterwards.
This way, all selected layers or groups will be removed from the layers list.

Working with the Legend independent layer order
...............................................

There is a panel that allows you to define an independent drawing order for the map legend.
You can activate it in the menu :menuselection:`Settings --> Panels --> Layer
order`. This feature allows you to, for instance, order your layers in order of importance,
but still display them in the correct order (see figure_layer_order_).
Checking the |checkbox| :guilabel:`Control rendering order` box underneath the
list of layers will cause a revert to default behavior.

.. _figure_layer_order:

.. only:: html

   **Figure Layer Order:**

.. figure:: /static/user_manual/introduction/layer_order.png
    :align: center

    Define a legend independent layer order |nix|

.. _`label_mapview`:

Map View
--------

.. index::`map view`

This is the "business end" of |qg| --- maps are displayed in this area! The
map displayed in this window will depend on the vector and raster layers you
have chosen to load (see sections that follow for more information on how to
load layers). The map view can be panned, shifting the focus of the map display
to another region, and it can be zoomed in and out. Various other operations can be
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
      single:pan arrow keys

   You can use the arrow keys to pan the map. Place the mouse cursor inside
   the map area and click on the right arrow key to pan east, left arrow key to
   pan west, up arrow key to pan north and down arrow key to pan south. You can
   also pan the map using the space bar or the click on mouse wheel: just move
   the mouse while holding down space bar or click on mouse wheel.

.. _`label_mapoverview`:


.. _`label_statusbar`:

Status Bar
----------

The status bar shows you your current position in map coordinates (e.g.,
meters or decimal degrees) as the mouse pointer is moved across the map view.
To the left of the coordinate display in the status bar is a small button that
will toggle between showing coordinate position or the view extents of the
map view as you pan and zoom in and out.

Next to the coordinate display you will find the scale display. It shows the scale of
the map view. If you zoom in or out, |qg| shows you the current scale. There is
a scale selector, which allows you to choose between predefined scales from
1:500 to 1:1000000.

A progress bar in the status bar shows the progress of rendering as each layer is
drawn to the map view. In some cases, such as the gathering of statistics in
raster layers, the progress bar will be used to show the status of lengthy
operations.

If a new plugin or a plugin update is available, you will see a message at the
far left of the status bar. On the right side of the status bar, there is a small
checkbox which can be used to temporarily prevent layers being rendered to the
map view (see section :ref:`redraw_events` below). The icon |mIconStopRendering|
immediately stops the current map rendering process.

To the right of the render functions, you find the EPSG code of the current
project CRS and a projector icon. Clicking on this opens the projection
properties for the current project.


.. tip::
   **Calculating the Correct Scale of Your Map Canvas**

   .. index::
      single:scale calculate

   When you start |qg|, the default units are degrees, and this means that |qg| will interpret any
   coordinate in your layer as specified in degrees. To get correct scale values, you can
   either change this setting to meters manually in the :guilabel:`General` tab
   under :menuselection:`Settings --> Project Properties`, or you can select a
   project CRS clicking on the
   |mIconProjectionDisabled| :sup:`CRS status` icon in the lower right-hand
   corner of the status bar. In the last case, the units are set to what the
   project projection specifies (e.g., '+units=m').

