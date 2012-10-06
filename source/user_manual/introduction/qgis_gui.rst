.. `label_qgismainwindow`:

QGIS GUI
========

.. :index::
    single:main window

When QGIS starts, you are presented with the GUI as shown below
(the numbers 1 through 7 in yellow ovals refer to the six major areas of the
interface as discussed below):

.. _fig_startup:

.. figure:: ../../../static/user_manual/introduction/startup.png
   :align: center
   :width: 40em

   QGIS GUI with Alaska sample data (KDE)

.. note:: 
   Your window decorations (title bar, etc.) may appear
   different depending on your operating system and window manager.

The QGIS GUI is divided into six areas:

+--------------+-----------------+
|1. Menu Bar   | 4. Map View     |
+--------------+-----------------+
|2. Tool Bar   | 5. Map Overview |
+--------------+-----------------+
|3. Map Legend | 6. Browser      |
+--------------+-----------------+
|7. Status Bar                   |
+--------------------------------+     

These seven components of the QGIS interface are described in more detail in
the following sections. Two more sections present keyboard shortcuts and
context help.

.. _label_menubar:

Menu Bar
---------

.. index::
   single:menus

The menu bar provides access to various QGIS features using a standard
hierarchical menu. The top-level menus and a summary of some of the
menu options are listed below, together with the icons of the corresponding
tools as they appear on the toolbar, as well as keyboard
shortcuts. [1]_
Although most menu options have a corresponding tool and vice-versa,
the menus are not organized quite like the toolbars.
The toolbar containing the tool is listed after each menu option as a checkbox
entry. For more information about tools and toolbars, see Section
:ref:`label_toolbars`.

\

\ 

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
**File**                                                        \                     \                                           \ 
|mActionFileNew| :guilabel:`New Project`                        :kbd:`Ctrl+N`         see :ref:`sec_projects`                     :guilabel:`File`
|mActionFileOpen| :guilabel:`Open Project`                      :kbd:`Ctrl+O`         see :ref:`sec_projects`                     :guilabel:`File`
:menuselection:`Open Recent Projects -->`                       \                     see :ref:`sec_projects`                     \  
|mActionFileSave| :guilabel:`Save Project`                      :kbd:`Ctrl+S`         see :ref:`sec_projects`                     :guilabel:`File`
|mActionFileSaveAs| :guilabel:`Save Project As`                 :kbd:`Ctrl+Shift+S`   see :ref:`sec_projects`                     :guilabel:`File`
|mActionSaveMapAsImage| :guilabel:`Save as Image`               \                     see :ref:`sec_output`                       \ 
|mActionNewComposer| :guilabel:`New Print Composer`             :kbd:`Ctrl+P`         see :ref:`label_printcomposer`              :guilabel:`File`
|mActionComposerManager| :guilabel:`Composer manager`           \                     see :ref:`label_printcomposer`              :guilabel:`File`
:menuselection:`Print Composers`                                \                     see :ref:`label_printcomposer`              \ 
|mActionFileExit| :guilabel:`Exit`                              :kbd:`Ctrl+Q`         \                                           \ 
==============================================================  ====================  ==========================================  =============================== 

----

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
**Edit**                                                        \                     \                                           \ 
|mActionUndo| :guilabel:`Undo`                                  :kbd:`Ctrl+Z`         see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionRedo| :guilabel:`Redo`                                  :kbd:`Ctrl+Shift+Z`   see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing` 
|mActionEditCut| :guilabel:`Cut Features`                       :kbd:`Ctrl+X`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionEditCopy| :guilabel:`Copy Features`                     :kbd:`Ctrl+C`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionEditPaste| :guilabel:`Paste Features`                   :kbd:`Ctrl+V`         see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionEditPaste| :guilabel:`Move Feature`                     \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionDeleteSelected| :guilabel:`Delete Selected`             \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionSimplify| :guilabel:`Simplify Feature`                  \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionAddRing| :guilabel:`Add Ring`                           \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionAddIsland| :guilabel:`Add Part`                         \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionDeleteRing| :guilabel:`Delete Ring`                     \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionDeletePart| :guilabel:`Delete Part`                     \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionReshape| :guilabel:`Reshape Features`                   \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionSplitFeatures| :guilabel:`Split Features`               \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mergeFeats| :guilabel:`Merge selected Features`                \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mergeFeats| :guilabel:`Merge attributes of selected Features`  \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
|mActionNodeTool| :guilabel:`Node Tool`                         \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionRotatePointSymbols| :guilabel:`Rotate Point Symbols`    \                     see :ref:`sec_advanced_edit`                :guilabel:`Advanced Digitizing`
==============================================================  ====================  ==========================================  ===============================

\ 

\

After activating |mActionToggleEditing| :sup:`Toggle editing` mode 
for a layer, you will find a capture feature icon in the :menuselection:`Edit`
menu depending on the layer type (point, line or polygon). 

---- 

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
**Edit** extra                                                  \                     \                                           \ 
|mActionCapturePoint| :guilabel:`Capture Point`                 \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionCaptureLine| :guilabel:`Capture Line`                   \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
|mActionCapturePolygon| :guilabel:`Capture Polygon`             \                     see :ref:`sec_edit_existing_layer`          :guilabel:`Digitizing`
==============================================================  ====================  ==========================================  ===============================

----

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
**View**                                                        \                     \                                           \ 
|mActionPan| :guilabel:`Pan Map`                                \                     \                                           :guilabel:`Map Navigation`
|mActionZoomIn| :guilabel:`Zoom In`                             :kbd:`Ctrl++`         \                                           :guilabel:`Map Navigation`
|mActionZoomOut| :guilabel:`Zoom Out`                           :kbd:`Ctrl+-`         \                                           :guilabel:`Map Navigation`
:menuselection:`Select`                                         \                     see :ref:`sec_selection`                    :guilabel:`Attributes`
|mActionIdentify| :guilabel:`Identify Features`                 :kbd:`Ctrl+Shift+I`   \                                           :guilabel:`Attributes`
:menuselection:`Measure`                                        \                     see :ref:`sec_measure`                      :guilabel:`Attributes`
|mActionZoomFullExtent| :guilabel:`Zoom Full`                   :kbd:`Ctrl+Shift+F`   \                                           :guilabel:`Map Navigation`
|mActionZoomToLayer| :guilabel:`Zoom To Layer`                  \                     \                                           :guilabel:`Map Navigation`
|mActionZoomToSelected| :guilabel:`Zoom To Selection`           :kbd:`Ctrl+J`         \                                           :guilabel:`Map Navigation`
|mActionZoomLast| :guilabel:`Zoom Last`                         \                     \                                           :guilabel:`Map Navigation`
|mActionZoomNext| :guilabel:`Zoom Next`                         \                     \                                           :guilabel:`Map Navigation`
:menuselection:`Zoom Actual Size`                               \                     \                                           \ 
|mActionMapTips| :guilabel:`Map Tips`                           \                     \                                           :guilabel:`Attributes`
|mActionNewBookmark| :guilabel:`New Bookmark`                   :kbd:`Ctrl+B`         see :ref:`sec_bookmarks`                    :guilabel:`Attributes`
|mActionShowBookmarks| :guilabel:`Show Bookmarks`               :kbd:`Ctrl+Shift+B`   see :ref:`sec_bookmarks`                    :guilabel:`Attributes`
|mActionDraw| :guilabel:`Refresh`                               :kbd:`Ctrl+R`                                                     :guilabel:`Map Navigation`
:menuselection:`Tile scale slider`                              \                     see :ref:`tilesets`                         :guilabel:`Tile scale`
:menuselection:`Live GPS tracking`                              \                     see :ref:`sec_gpstracking`                  :guilabel:`GPS Information`
==============================================================  ====================  ==========================================  =============================== 

----

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
**Layer**                                                       \                     \                                           \ 
:menuselection:`New`                                            \                     see :ref:`sec_create_shape`                 :guilabel:`Manage Layers`
|mActionAddNonDbLayer| :guilabel:`Add Vector Layer`             :kbd:`Ctrl+Shift+V`   see :ref:`label_workingvector`              :guilabel:`Manage Layers`
|mActionAddRasterLayer| :guilabel:`Add Raster Layer`            :kbd:`Ctrl+Shift+R`   see :ref:`load_raster`                      :guilabel:`Manage Layers`
|mActionAddLayer| :guilabel:`Add PostGIS Layer`                 :kbd:`Ctrl+Shift+D`   see :ref:`label_postgis`                    :guilabel:`Manage Layers`
|mActionAddSpatiaLiteLayer| :guilabel:`Add SpatiaLite Layer`    :kbd:`Ctrl+Shift+L`   see :ref:`label_spatialite`                 :guilabel:`Manage Layers`
|mActionAddWmsLayer| :guilabel:`Add WMS Layer`                  :kbd:`Ctrl+Shift+W`   see :ref:`ogc-wms`                          :guilabel:`Manage Layers`
|mActionOpenTable| :guilabel:`Open Attribute Table`             \                     \                                           :guilabel:`Attributes`
|mActionFileSave| :guilabel:`Save edits`                        \                     \                                           :guilabel:`Digitizing`
|mActionToggleEditing| :guilabel:`Toggle editing`               \                     \                                           :guilabel:`Digitizing`
:menuselection:`Save as...`                                     \                     \                                           \ 
:menuselection:`Save selection as vector file...`               \                     See :ref:`sec_attribute_table`              \ 
|mActionRemoveLayer| :guilabel:`Remove Layer`                   :kbd:`Ctrl+D`         \                                           \ 
:menuselection:`Set CRS of Layer(s)`                            :kbd:`Ctrl+Shift+C`   \                                           \ 
:menuselection:`Set project CRS from Layer`                     \                     \                                           \ 
:menuselection:`Properties`                                     \                     \                                           \ 
:menuselection:`Query...`                                       \                     \                                           \ 
|mActionLabeling| :guilabel:`Labeling`                          \                     \                                           \ 
|mActionInOverview| :guilabel:`Add to Overview`                 :kbd:`Ctrl+Shift+O`   \                                           :guilabel:`Manage Layers` 
|mActionAddAllToOverview| :guilabel:`Add All To Overview`       \                     \                                           \  
|RemoveAllOverview| :guilabel:`Remove All From Overview`        \                     \                                           \  
|mActionShowAllLayers| :guilabel:`Show All Layers`              :kbd:`Ctrl+Shift+U`   \                                           :guilabel:`Manage Layers`
|mActionHideAllLayers| :guilabel:`Hide All Layers`              :kbd:`Ctrl+Shift+H`   \                                           :guilabel:`Manage Layers` 
==============================================================  ====================  ==========================================  =============================== 

----

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
**Settings**                                                    \                     \                                           \ 
:menuselection:`Panels`                                         \                     \                                           \ 
:menuselection:`Toolbars`                                       \                     \                                           \ 
:menuselection:`Toggle Full Screen Mode`                        :kbd:`Ctrl-F`         \                                           \ 
|mActionProjectProperties| :guilabel:`Project Properties`       :kbd:`Ctrl+Shift+P`   see :ref:`sec_projects`                     \ 
|mActionCustomProjection| :guilabel:`Custom CRS`                \                     see :ref:`sec_custom_projections`           :guilabel:`Style Manager`
|mActionOptions| :guilabel:`Configure shortcuts`                \                     \                                           \ 
|mActionOptions| :guilabel:`Options`                            \                     see :ref:`gui_options`                      \ 
:menuselection:`Snapping Options`                               \                     \                                           \ 
==============================================================  ====================  ==========================================  ===============================
 
----

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
**Plugins**                                                     \                     \                                           \ 
(Further menu items are added by plugins                        \                     \                                           \ 
\ as they are loaded.)                                          \                     \                                           \ 
|mActionShowPluginManager| :guilabel:`Manage Plugins`           \                     see :ref:`managing_plugins`                 :guilabel:`Plugins`
:menuselection:`Python Console`                                 \                     \                                           \ 
==============================================================  ====================  ==========================================  =============================== 

----

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
**Raster**                                                      \                     \                                           \ 
:menuselection:`Raster calculator`                              \                     see  :ref:`sec_raster_calc`                 \ 
==============================================================  ====================  ==========================================  =============================== 

----

==============================================================  ====================  ==========================================  ===============================
Menu Option                                                     Shortcut              Reference                                   Toolbar
==============================================================  ====================  ==========================================  ===============================
**Help**                                                        \                     \                                           \ 
|mActionHelpContents| :guilabel:`Help Contents`                 :kbd:`F1`             \                                           :guilabel:`Help`     
:menuselection:`API Documentation`                              \                     \                                           \ 
|mActionQgisHomePage| :guilabel:`QGIS Home Page`                :kbd:`Ctrl+H`         \                                           \ 
|mActionCheckQgisVersion| :guilabel:`Check QGIS Version`        \                     \                                           \ 
|mActionHelpAbout| :guilabel:`About`                            \                     \                                           \ 
|mActionHelpSponsors| :guilabel:`QGIS Sponsors`                 \                     \                                           \ 
==============================================================  ====================  ==========================================  ===============================
 
----

.. note::
   |nix| The Menu Bar items listed above are the default ones in KDE 
   window manager. In GNOME, Settings menu is missing and its items are to be 
   found there:

\

\

+-----------------------------------------------------------------------+------------------------+
| |mActionProjectProperties| :guilabel:`Project Properties`             | :guilabel:`File menu`  |
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

Toolbars
--------

.. index::
   single:toolbars

The toolbars provide access to most of the same functions as the menus,
plus additional tools for interacting with the map. Each toolbar item has
popup help available. Hold your mouse over the item and a short description of
the tool's purpose will be displayed.

Every menubar can be moved around according to your needs. Additionally every
menubar can be switched off using your right mouse button context menu holding
the mouse over the toolbars.

.. index::
   single:layout toolbars

.. tip::
   **Restoring toolbars** 

   If you have accidentally hidden all your toolbars, you can get them
   back by choosing menu option :menuselection:`Settings --> Toolbars -->`.

.. _`label_legend`:

Map Legend
-----------

.. index::
   single:legend

The map legend area lists all the layers in the project.
The checkbox in each legend entry can be used to show or hide the layer 

.. index::
   single:layer visibility

A layer can be selected and dragged up or down in the legend to change the
z-ordering. Z-ordering means that layers listed nearer the top of the legend are
drawn over layers listed lower down in the legend.

Layers in the legend window can be organised into groups. To do so, right click
in the legend window and choose :menuselection:`Add group -->`. Type in a name for the
group and press :kbd:`Enter`. Now click on an existing layer and drag it
onto the group. Also, if new layers are added to the project while a group is
selected, they will automatically be placed in the group.

To bring a layer out of a group you can drag it out, or right click on it and 
choose :menuselection:`Make to toplevel item -->`. Groups can be nested inside other groups.

The checkbox for a group will show or hide all the layers in the group
with one click.

The content of the right mouse button context menu depends on whether the selected 
legend item is a raster or a vector layer. For GRASS vector layers 
:menuselection:`toggle editing -->` is not available. See section 
:ref:`grass_digitizing` for information on editing GRASS vector layers.

* **Right mouse button menu for raster layers**

  * :menuselection:`Zoom to layer extent -->`
  * :menuselection:`Zoom to best scale (100 %) -->`
  * :menuselection:`Show in overview -->`
  * :menuselection:`Remove -->`
  * :menuselection:`Properties -->`
  * :menuselection:`Rename -->`
  * :menuselection:`Add Group -->`
  * :menuselection:`Expand all -->`
  * :menuselection:`Collapse all -->`

.. *  :menuselection:`Show file groups`

* **Right mouse button menu for vector layers**

  * :menuselection:`Zoom to layer extent -->`
  * :menuselection:`Show in overview -->`
  * :menuselection:`Remove -->`
  * :menuselection:`Open attribute table -->`
  * :menuselection:`Toggle editing (not available for GRASS layers) -->`
  * :menuselection:`Save as -->`
  * :menuselection:`Save selection as -->`
  * :menuselection:`Query -->`
  * :menuselection:`Properties -->`
  * :menuselection:`Rename -->`
  * :menuselection:`Add Group -->`
  * :menuselection:`Expand all -->`
  * :menuselection:`Collapse all -->`

.. * :menuselection:`Make to toplevel item`
.. * :menuselection:`Show file groups`

* **Right mouse button menu for layer groups**

  * :menuselection:`Zoom to group -->`
  * :menuselection:`Remove -->`
  * :menuselection:`Set group CRS -->`
  * :menuselection:`Rename -->`
  * :menuselection:`Add Group -->`
  * :menuselection:`Expand all -->`
  * :menuselection:`Collapse all -->`

.. *  :menuselection:`Show file groups`


It is possible to select more than one Layer or Group at the same time 
by holding down the :kbd:`Ctrl`-Key while selecting the Layers with the 
left mouse button. You can then move all selected Layers to a new Group at 
the same time.

You are also able to delete more than one Layer or Group at once by selecting 
several Layers with the :kbd:`Ctrl` - Key and pressing :kbd:`Ctrl D` afterwards.
This way all selected Layers or Groups will be removed from the Layerlist.


.. _`label_mapview`:

Map View
--------

.. index::`map view`

This is the 'business end' of QGIS - maps are displayed in this area! The
map displayed in this window will depend on the vector and raster layers you
have chosen to load (see sections that follow for more information on how to
load layers). The map view can be panned (shifting the focus of the map display
to another region) and zoomed in and out. Various other operations can be
performed on the map as described in the toolbar description above.  The map
view and the legend are tightly bound to each other - the maps in view reflect
changes you make in the legend area.

.. index::
   single:zoom mouse wheel

.. tip::
   **Zooming the Map with the Mouse Wheel**

   You can use the mouse wheel to zoom in and out on the map. Place
   the mouse cursor inside the map area and roll the wheel forward (away from 
   you) to zoom in and backwards (towards you) to zoom out. The mouse cursor 
   position is the center where the zoom occurs. You can customize the behavior 
   of the mouse wheel zoom using the :menuselection:`Map tools` tab under 
   the :menuselection:`Settings --> Options` menu.

.. tip::
   **Panning the Map with the Arrow Keys and Space Bar**
   
   .. index::
      single:pan arrow keys

   You can use the arrow keys to pan in the map. Place the mouse cursor
   inside the map area and click on the right arrow key to pan East, left arrow
   key to pan West, up arrow key to pan North and down arrow key to pan South.
   You can also pan the map using the space bar: just move the mouse while
   holding down space bar.

.. _`label_mapoverview`:

Map Overview 
------------

.. index::
   single:Map overview

The map overview panel provides a full extent view of layers added to it. It
can be selected under the menu :menuselection:`Settings --> Panels`.
Within the view is a rectangle showing the current map extent. This allows
you to quickly determine which area of the map you are currently viewing. Note
that labels are not rendered to the map overview even if the layers in the
map overview have been set up for labeling.

You can add a single layer to the overview by right-clicking on it in the
legend and select |checkbox| Show in overview. You can also add layers to,
or remove all layers from the overview using the Overview tools on the toolbar.

If you click and drag the red rectangle in the overview that shows your
current extent, the main map view will update accordingly.

.. _`label_statusbar`:

Status Bar
----------

The status bar shows you your current position in map coordinates (e.g.
meters or decimal degrees) as the mouse pointer is moved across the map view.
To the left of the coordinate display in the status bar is a small button that
will toggle between showing coordinate position or the view extents of the
map view as you pan and zoom in and out.

A progress bar in the status bar shows progress of rendering
as each layer is drawn to the map view. In some cases, such as the gathering
of statistics in raster layers, the progress bar will be used to show the
status of lengthy operations.

If a new plugin or a plugin update is available, you will see a message in the
status bar. On the right side of the status bar is a small
checkbox which can be used to temporarily prevent layers being rendered to the
map view (see Section :ref:`redraw_events` below). The icon |mIconStopRendering| 
immediately stops the current map rendering process. 

At the far right of the status bar you find the EPSG code of the current 
project CRS and a projector icon. Clicking on this opens the projection properties 
for the current project.

.. tip::
   **Calculating the correct Scale of your Map Canvas**

.. index::`Scale calculate`

   When you start QGIS, degrees is the default unit, and it tells QGIS
   that any coordinate in your layer is in degrees. To get correct scale values,
   you can either change this to meter manually in the :guilabel:`General` tab under
   :menuselection:`Settings -->` :menuselection:`Project Properties -->` or you can 
   select a project Coordinate Reference System (CRS) clicking on the
   |mIconProjectionDisabled| :sup:`CRS status` icon in the lower right-hand corner of 
   the statusbar. In the last case, the units are set to what the project 
   projection specifies, e.g. '+units=m'.

