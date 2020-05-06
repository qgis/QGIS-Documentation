.. Purpose: This chapter aims to describe generic tools that can be used even
.. if the user is in another chapter.

.. _general_tools:

*************
General Tools
*************

.. only:: html

   .. contents::
      :local:
      :depth: 2

.. _`context_help`:

Context help
============

.. index::
   single: Context help

Whenever you need help on a specific topic, you can access the corresponding
page in the current User Manual via the
:guilabel:`Help` button available in most dialogs --- please note that third-party
plugins can point to dedicated web pages.

.. index:: Panels

Panels
=======
By default, QGIS provides many panels to work with.
Some of these panels are described below while others may be found in different
parts of the document. A complete list of default panels provided by QGIS is
available via the :menuselection:`View --> Panels -->` menu and mentioned at
:ref:`panels_tools`.

.. index:: Panels; Layers
.. _`label_legend`:

Layers Panel
------------

.. index::
   single: Legend

The :guilabel:`Layers` panel (also called the ``map legend``) lists all
the layers in the project and helps you
manage their visibility. You can show or hide it by pressing :kbd:`Ctrl+1`.
A layer can be selected and dragged up or down in the
legend to change the Z-ordering. Z-ordering means that layers listed nearer the
top of the legend are drawn over layers listed lower down in the legend.

.. note:: The Z-ordering behavior can be overridden by the
   :ref:`Layer Order <layer_order>` panel.

At the top of the Layers panel, a toolbar allows you to:

* |symbology| :sup:`Open the layer styling dock (F7)`: toggle the layer styling
  panel on and off.
* |addGroup| :sup:`Add new group`
* |showMapTheme| :sup:`Manage Map Themes`: control visibility of layers and
  arrange them in different map themes.
* |filterMap| :sup:`Filter Legend by Map Content`: only the layers that are set
  visible and whose features intersect the current map canvas have their style
  rendered in the layers panel. Otherwise, a generic NULL symbol is applied to
  the layer. Based on the layer symbology, this is a convenient way to identify
  which kind of features from which layers cover your area of interest.
* |expressionFilter| :sup:`Filter Legend by Expression`: apply an
  expression to remove styles from the selected layer tree that have no feature
  satisfying the condition. This can be used to highlight features
  that are within a given area/feature of another layer.
  From the drop-down list, you can edit and clear the expression currently applied.
* |expandTree| :sup:`Expand All` or |collapseTree| :sup:`Collapse All`
  layers and groups in the layers panel.
* |removeLayer| :sup:`Remove Layer/Group` currently selected.

.. _figure_layer_toolbar:

.. figure:: img/layer_toolbar.png
   :align: center

   Layer Toolbar in Layers Panel

.. note::
   Tools to manage the layers panel are also available for map
   and legend items in print layouts

.. index:: Map themes
.. _map_themes:

Configuring map themes
......................

The |showMapTheme| :sup:`Manage Map Themes` drop-down button provides access to
convenient shortcuts to manipulate visibility of the layers in the :guilabel:`Layers`
panel:

* |showAllLayers| :guilabel:`Show All Layers`
* |hideAllLayers| :guilabel:`Hide All Layers`
* |showSelectedLayers| :guilabel:`Show Selected Layers`
* |hideSelectedLayers| :guilabel:`Hide Selected Layers`
* |hideDeselectedLayers| :guilabel:`Hide Deselected Layers`

Beyond the simple control of layer visibility,
the |showMapTheme| :sup:`Manage Map Themes` menu allows you to configure
**Map Themes** in the legend and switch from one map theme to another.
A map theme is a **snapshot** of the current map legend that records:

* the layers set as visible in the :guilabel:`Layers` panel
* **and** for each visible layer:

  * the reference to the :ref:`style <save_layer_property>` applied to the layer
  * the visible classes of the style, ie the layer checked node items in the
    :guilabel:`Layers panel`. This applies to :ref:`symbologies <vector_style_menu>`
    other than the single symbol rendering
  * the collapsed/expanded state of the layer node(s) and the group(s) it's placed
    inside

To create a map theme:

#. Check a layer you want to show
#. Configure the layer properties (symbology, diagram, labels...) as usual
#. Expand the :menuselection:`Style -->` menu at the bottom and click on :guilabel:`Add...` to
   store the settings as :ref:`a new style embedded in the project
   <manage_custom_style>`

   .. note:: A map theme does not remember the current details of the properties:
     only a reference to the style name is saved, so whenever you apply
     modifications to the layer while this style is enabled (eg change the
     symbology rendering), the map theme is updated with new information.

#. Repeat the previous steps as necessary for the other layers
#. If applicable, expand or collapse groups or visible layer nodes in the
   :guilabel:`Layers` panel
#. Click on the |showMapTheme| :sup:`Manage Map Themes` button on top of the panel,
   and :guilabel:`Add Theme...`
#. Enter the map theme's name and click :guilabel:`OK`

The new theme is listed in the lower part of the |showMapTheme| drop-down menu.

You can create as many map themes as you need: whenever the current combination
in the map legend (visible layers, their active style, the map legend nodes)
does not match any existing map theme contents as defined above, click on
:guilabel:`Add Theme...` to create a new map theme, or use
:menuselection:`Replace Theme -->` to update a map theme.
Use the :menuselection:`Remove Current Theme` button to delete the active theme.

Map themes are helpful to switch quickly between different preconfigured
combinations: select a map theme in the list to restore its combination.
All configured themes are also accessible in the print layout, allowing you to
create different map items based on specific themes and independent of
the current main canvas rendering (see :ref:`Map item layers <layout_layers>`).


Overview of the context menu of the Layers panel
................................................

At the bottom of the toolbar, the main component of the Layers panel is the
frame listing vector or raster layers added to the project, optionally
organized in groups. Depending on the item selected in the panel, a
right-click shows a dedicated set of options presented below.

.. tabularcolumns:: |l|c|c|c|

=================================================================  ==================  =================  =============
Option                                                             Vector Layer        Raster Layer       Group
=================================================================  ==================  =================  =============
|zoomToLayer| :guilabel:`Zoom to Layer/Group`                      |checkbox|          |checkbox|         |checkbox|
|zoomToLayer| :guilabel:`Zoom to Selection`                        |checkbox|          \                  \
|inOverview| :guilabel:`Show in Overview`                          |checkbox|          |checkbox|         \
:guilabel:`Show Feature Count`                                     |checkbox|          \                  \
:guilabel:`Copy Layer/Group`                                       |checkbox|          |checkbox|         |checkbox|
:guilabel:`Rename Layer/Group`                                     |checkbox|          |checkbox|         |checkbox|
|zoomActual| :guilabel:`Zoom to Native Resolution (100%)`          \                   |checkbox|         \
:guilabel:`Stretch Using Current Extent`                           \                   |checkbox|         \
|dbManager| :guilabel:`Update SQL Layer...`                        |checkbox|          \                  \
|addGroup| :guilabel:`Add Group`                                   \                   \                  |checkbox|
|duplicateLayer| :guilabel:`Duplicate Layer`                       |checkbox|          |checkbox|         \
|removeLayer| :guilabel:`Remove Layer/Group...`                    |checkbox|          |checkbox|         |checkbox|
:guilabel:`Move Out of Group`                                      |checkbox|          |checkbox|         \
:guilabel:`Move to Top`                                            |checkbox|          |checkbox|         |checkbox|
:guilabel:`Check and all its Parents`                              |checkbox|          |checkbox|         \
:guilabel:`Group Selected`                                         |checkbox|          |checkbox|         \
|openTable| :guilabel:`Open Attribute Table`                       |checkbox|          \                  \
|toggleEditing| :guilabel:`Toggle Editing`                         |checkbox|          \                  \
|allEdits| :menuselection:`Current Edits -->`                      |checkbox|          \                  \
:guilabel:`Filter...`                                              |checkbox|          \                  \
:guilabel:`Set Layer Scale Visibility...`                          |checkbox|          |checkbox|         \
:guilabel:`Zoom to Visible Scale`                                  |checkbox|          |checkbox|         \
:menuselection:`Set CRS -->`                                       |checkbox|          |checkbox|         \
:menuselection:`--> Set Layer/Group CRS...`                        |checkbox|          |checkbox|         |checkbox|
:menuselection:`--> Set Project CRS from Layer`                    |checkbox|          |checkbox|         \
:guilabel:`Set Group WMS Data...`                                  \                   \                  |checkbox|
|unchecked| :guilabel:`Mutually Exclusive Group`                   \                   \                  |checkbox|
:guilabel:`Check and all its children (Ctrl-click)`                \                   \                  |checkbox|
:guilabel:`Uncheck and all its children (Ctrl-click)`              \                   \                  |checkbox|
:guilabel:`Make Permanent`                                         |checkbox|          \                  \
:menuselection:`Export -->`                                        |checkbox|          |checkbox|         |checkbox|
:menuselection:`--> Save As...`                                    \                   |checkbox|         \
:menuselection:`--> Save Features As...`                           |checkbox|          \                  \
:menuselection:`--> Save Selected Features As...`                  |checkbox|          \                  \
:menuselection:`--> Save As Layer Definition File...`              |checkbox|          |checkbox|         |checkbox|
:menuselection:`--> Save As QGIS Layer Style File...`              |checkbox|          |checkbox|         \
:menuselection:`Styles -->`                                        |checkbox|          |checkbox|         \
:menuselection:`--> Copy Style`                                    |checkbox|          |checkbox|         \
:menuselection:`--> Paste Style`                                   |checkbox|          |checkbox|         |checkbox|
:menuselection:`--> Add...`                                        |checkbox|          |checkbox|         \
:menuselection:`--> Rename Current...`                             |checkbox|          |checkbox|         \
:guilabel:`Properties...`                                          |checkbox|          |checkbox|         \
=================================================================  ==================  =================  =============

Table: Context menu from Layers Panel items

For GRASS vector layers, |toggleEditing| :sup:`Toggle editing` is not available.
See section :ref:`grass_digitizing` for information on editing GRASS vector
layers.

.. index:: Group, Layer
.. _group_layers_interact:

Interact with groups and layers
...............................

Layers in the legend window can be organized into groups. There are two ways to
do this:

#. Press the |folder| icon to add a new group. Type in a name for
   the group and press :kbd:`Enter`. Now click on an existing layer and
   drag it onto the group.
#. Select some layers, right-click in the legend window and choose
   :guilabel:`Group Selected`. The selected layers will automatically be placed
   in a new group.

To move a layer out of a group, drag it out, or right-click on it and
choose :guilabel:`Move Out of Group`: the layer is moved from the group and
placed above it. Groups can also be nested inside other groups. If a layer
is placed in a nested group, :guilabel:`Move Out of Group` will move the layer
out of all nested groups.

To move a group or layer to the top of the layer panel, either drag it to
the top, or choose :guilabel:`Move to Top`. If you use this option on a layer nested
in a group, the layer is moved to the top in its current group.

The checkbox for a group will show or hide all the layers in the group
with one click.

Enabling the **Mutually Exclusive Group** option means you can make a group have
only one layer visible at the same time.
Whenever a layer within the group is set visible the others will be toggled not visible.

It is possible to select more than one layer or group at the same time by
holding down the :kbd:`Ctrl` key while clicking additional layers. You can then move
all selected layers to a new group at the same time.

You may also delete more than one layer or group at once by selecting
several items with the :kbd:`Ctrl` key and then pressing :kbd:`Ctrl+D`:
all selected layers or groups will be removed from the layers list.

More information on layers and groups using indicator icon
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In some circumstances, icons appears next to the layer or group in the
:guilabel:`Layers` panel to give more information about the layer/group. These
symbols are:

* |toggleEditing| to indicate that the layer is in edit mode and you can modify
  the data
* |editableEdits| to indicate that the layer being edited has some unsaved changes
* |indicatorFilter| to indicate :ref:`a filter <vector_query_builder>` applied
  to the layer. Hover over the icon to see the filter expression and double-click
  to update the setting
* |indicatorEmbedded| to identify an :ref:`embedded group or layer
  <nesting_projects>` and the path to their original project file
* |indicatorBadLayer| to identify a layer whose data source was not available
  at the project file opening. Click the icon to update the source path.
* |indicatorMemory| to remind you that the layer is a :ref:`temporary scratch
  layer <vector_new_scratch_layer>` and its content will be discarded when you
  close this project. To avoid data loss and make the layer permanent, click
  the icon to store the layer in any of the OGR vector formats supported by QGIS.
* |indicatorNoCRS| to identify a layer that has no/unknown CRS

.. index:: Style

.. _editing_style_layer:

Editing vector layer style
...........................

From the Layers panel, you have shortcuts to change the layer rendering quickly
and easily. Right-click on a vector layer and select :menuselection:`Styles -->`
in the list in order to:

* see the :ref:`styles <manage_custom_style>` currently applied to the layer. If
  you defined many styles for the layer, you can switch from one to another
  and your layer rendering will automatically be updated on the map canvas.
* copy the current style, and when applicable, paste a copied style from another layer
* rename the current style, add a new style (which is actually a copy of the current
  one) or delete the current style (when multiple styles are available).

.. note:: The previous options are also available for raster layers.

Whether the features in the vector layer all have the same unique symbol or they are
classified (in which case the layer is displayed in a tree structure with each class
as a sub-item), the following options are available at layer level or class level:

* :guilabel:`Edit Symbol...` to open the :ref:`symbol-selector` dialog to
  change any properties of the layer or feature symbol (symbol, size, color...).
  Double-clicking on a feature also opens the :guilabel:`Symbol Selector` dialog.
* :ref:`color-selector` with a **Color Wheel** from which you can click a
  color to update the symbol fill color automatically. For convenience,
  **Recent colors** are available at the bottom of the color wheel.
* |showAllLayers| :guilabel:`Show All Items` and |hideAllLayers| :guilabel:`Hide All
  Items` to toggle on or off the visibility of all the classes of features. This avoids
  (un)checking items one by one.

.. tip:: **Quickly share a layer style**

    From the context menu, copy the style of a layer and paste it to a group
    or a selection of layers: the style is applied to all the layers that
    are of the same type (vector/raster) as the original layer and,
    for vector layers, have the same geometry type (point, line or polygon).


.. index::
   single: Layer properties
   single: Panels; Style
.. _layer_styling_panel:

Layer Styling Panel
--------------------

The :guilabel:`Layer Styling` panel (also enabled with :kbd:`Ctrl+3`) is
a shortcut to some of the functionalities of the :guilabel:`Layer Properties`
dialog. It provides a quick and easy way to define the rendering and the
behavior of a layer, and to visualize its effects without having to open the
layer properties dialog.

In addition to avoiding the blocking (or "modal") layer properties dialog, the layer
styling panel also avoids cluttering the screen with dialogs, and
contains most style functions (color selector, effects properties, rule edit,
label substitution...): e.g., clicking color buttons inside the layer style panel
causes the color selector dialog to be opened inside the layer style panel itself
rather than as a separate dialog.

From a drop-down list of current layers in the layer panel, select an item and:

* Set raster layer |symbology| :guilabel:`Symbology`, |transparency| :guilabel:`Transparency`,
  and |rasterHistogram| :guilabel:`Histogram` properties.
  These options are the same as those in the :ref:`raster_properties_dialog`.
* Set vector layer |symbology| :guilabel:`Symbology`, |3d| :guilabel:`3D View` and
  |labeling| :guilabel:`Labels` properties.
  These options are the same as those in the :ref:`vector_properties_dialog`.
* Manage the associated style(s) in the |stylePreset| :guilabel:`Style Manager`
  (more details at :ref:`manage_custom_style`).
* See the |history| :guilabel:`History` of changes you applied to the
  layer style in the current project: you can therefore cancel or restore to any
  state by selecting it in the list and clicking :guilabel:`Apply`.

Another powerful feature of this panel is the |checkbox| :guilabel:`Live update` checkbox.
Tick it to render your changes immediately on the map canvas:
you no longer need to click the :guilabel:`Apply` button.

.. _figure_layer_styling:

.. figure:: img/layer_styling.png
    :align: center

    Defining a layer's symbology from the layer styling panel

.. tip:: **Add custom tabs to the Layer Styling panel**

  Using :ref:`PyQGIS <PyQGIS-Developer-Cookbook>`, you can set new tabs to manage
  layer properties in the Layer Styling Panel. See
  https://nathanw.net/2016/06/29/qgis-style-dock-part-2-plugin-panels/ for an example.

.. Todo: Actually, what could be nice is to provide example in the Cookbook to have an
 internal and always guaranteed link (see #2071)

.. index:: Layers; Order
.. _layer_order:

Layer Order Panel
-----------------

By default, layers shown on the QGIS map canvas are drawn following their order
in the :guilabel:`Layers` panel: the higher a layer is in the panel, the
higher (hence, more visible) it'll be in the map view.

You can define a drawing order for the layers independent of the order in the
layers panel with the :guilabel:`Layer Order` panel enabled
in :menuselection:`View --> Panels -->` menu or with :kbd:`Ctrl+9`.
Check |checkbox| :guilabel:`Control rendering order` underneath
the list of layers and reorganize the layers in the panel as you want. This
order becomes the one applied to the map canvas.
For example, in figure_layer_order_, you can see that the ``airports``
features are displayed over the ``alaska`` polygon despite those layers'
respective placement in the Layers panel.

Unchecking |checkbox| :guilabel:`Control rendering order` will
revert to default behavior.

.. _figure_layer_order:

.. figure:: img/layer_order.png
    :align: center

    Define a layer order independent of the legend

.. index::
   single: Map; Overview
   single: Panels; Overview
.. _`overview_panels`:

Overview Panel
--------------

The :guilabel:`Overview` panel (:kbd:`Ctrl+8`) displays a map with
a full extent view of some of the layers. The Overview map is filled with layers
using the :guilabel:`Show in Overview` option from the :menuselection:`Layer`
menu or in the layer contextual menu. Within the view,
a red rectangle shows the current map canvas extent, helping you quickly to
determine which area of the whole map you are currently viewing. If you
click-and-drag the red rectangle in the overview frame, the main map view
extent will update accordingly.

Note that labels are not rendered to the map overview even
if the layers used in the map overview have been set up for labeling.

.. index::
   single: Log messages
   single: Panels; Log messages

.. _`log_message_panel`:

Log Messages Panel
------------------

When loading or processing some operations, you can track and follow messages
that appear in different tabs using the |messageLog| :guilabel:`Log Messages Panel`.
It can be activated using the most right icon in the bottom status bar.


.. index:: Undo, Redo
   single: Panels; Undo
   single: Panels; Redo

.. _`undo_redo_panel`:

Undo/Redo Panel
---------------

For each layer being edited, the :guilabel:`Undo/Redo` (:kbd:`Ctrl+5`) panel
shows the list of actions carried out, allowing you
quickly to undo a set of actions by selecting the action listed above.
More details at :ref:`Undo and Redo edits <undoredo_edits>`.

.. index::
   single: Panels; Statistic
   single: Statistic

.. _`statistical_summary`:

Statistical Summary Panel
--------------------------

The :guilabel:`Statistics` panel (:kbd:`Ctrl+6`) provides summarized information
on any vector layer. This panel allows you to select:

* the vector layer to compute the statistics on
* the column to use, or an |expression| :ref:`expression <vector_expressions>`
* the statistics to return using the drop-down button at the bottom-right of the
  dialog. Depending on the field's (or expression's values) type, available
  statistics are:

.. tabularcolumns:: |l|c|c|c|c|

================================== ============ ============  ============  ============
 Statistics                         String       Integer       Float         Date
================================== ============ ============  ============  ============
Count                               |checkbox|   |checkbox|    |checkbox|    |checkbox|
Count Distinct Value                |checkbox|                               |checkbox|
Count Missing value                 |checkbox|                               |checkbox|
Sum                                              |checkbox|    |checkbox|
Mean                                             |checkbox|    |checkbox|    |checkbox|
Standard Deviation                               |checkbox|    |checkbox|
Standard Deviation on Sample                     |checkbox|    |checkbox|
Minimal value                       |checkbox|   |checkbox|    |checkbox|    |checkbox|
Maximal value                       |checkbox|   |checkbox|    |checkbox|    |checkbox|
Range                                            |checkbox|    |checkbox|    |checkbox|
Minority                                         |checkbox|    |checkbox|
Majority                                         |checkbox|    |checkbox|
Variety                                          |checkbox|    |checkbox|
First Quartile                                   |checkbox|    |checkbox|
Third Quartile                                   |checkbox|    |checkbox|
Inter Quartile Range                             |checkbox|    |checkbox|
Minimum Length                      |checkbox|
Maximum Length                      |checkbox|
================================== ============ ============  ============  ============

Table: Statistics available for each field type

The statistical summary can be:

* returned for the whole layer or |checkbox| :guilabel:`selected features only`
* recalculated using the |draw| button when the underlying data source changes
  (eg, new or removed features/fields, attribute modification)
* |editCopy| copied to the clipboard and pasted as a table in another application

.. _figure_statistical_summary:

.. figure:: img/statistical_summary.png
    :align: center

    Show statistics on a field


.. index:: Nesting projects, Embed layers and groups
.. _nesting_projects:

Nesting Projects
================

Sometimes, you'd like to keep some layers in different projects, but with the
same style. You can either create a :ref:`default style <store_style>` for
these layers or embed them from another project to save time and effort.

Embed layers and groups from an existing project has some advantages over
styling:

* All types of layers (vector or raster, local or online...) can be added
* Fetching groups and layers, you can keep the same tree structure of the
  "background" layers in your different projects
* While the embedded layers are editable, you can't change their properties
  such as symbology, labels, forms, default values and actions, ensuring
  consistency across projects
* Modify the items in the original project and changes are propagated to all
  the other projects

If you want to embed content from other project files into your project, select
:menuselection:`Layer --> Embed Layers and Groups`:

#. Click the :guilabel:`...` button to look for a project: you can see the content of the
   project (see figure_embed_dialog_)
#. Hold down :kbd:`Ctrl` ( or |osx| :kbd:`Cmd`) and click on the layers and
   groups you wish to retrieve
#. Click :guilabel:`OK`

The selected layers and groups are embedded in the :guilabel:`Layers`
panel and displayed on the map canvas. An |indicatorEmbedded|
icon is added next to their name for recognition and hovering over displays
a tooltip with the original project file path.

.. _figure_embed_dialog:

.. figure:: img/embed_dialog.png
   :align: center

   Select layers and groups to embed

Like any other layer, an embedded layer can be removed from the project by
right-clicking on the layer and clicking |removeLayer| :sup:`Remove`.

.. tip:: **Change rendering of an embedded layer**

 It's not possible to change the rendering of an embedded layer, unless you make
 the changes in the original project file. However, right-clicking on a layer and
 selecting :guilabel:`Duplicate` creates a layer which is fully-featured and not
 dependent on the original project. You can then safely remove the linked
 layer.


.. _working_canvas:

Working with the map canvas
===========================

.. index:: Rendering
.. _`redraw_events`:

Rendering
---------

By default, QGIS renders all visible layers whenever the map canvas is
refreshed. The events that trigger a refresh of the map canvas include:

*  adding a layer
*  panning or zooming
*  resizing the QGIS window
*  changing the visibility of a layer or layers

QGIS allows you to control the rendering process in a number of ways.

.. index:: Rendering scale dependent, Scale
.. _`label_scaledepend`:

Scale Dependent Rendering
.........................

Scale-dependent rendering allows you to specify the minimum and maximum scales
at which a layer (raster or vector) will be visible. To set scale-dependent rendering,
open the :guilabel:`Properties` dialog by double-clicking on the layer in the legend.
On the :guilabel:`Rendering` tab, tick |checkbox| :guilabel:`Scale
dependent visibility` and enter the :guilabel:`Minimum (exclusive)` and
:guilabel:`Maximum (inclusive)` scale values.

You can also activate scale dependent visibility on a layer from the Layers panel.
Right-click on the layer and in the context menu, select :guilabel:`Set Layer Scale Visibility`.

The |mapIdentification| :sup:`Set to current canvas scale` button allow you to use
the current map canvas scale as boundary of the range visibility.


.. note::
   When a layer is not rendered in the map canvas because the map scale is out of
   its visibility scale range, the layer is greyed in the Layers panel and
   a new option :guilabel:`Zoom to Visible Scale` appears in the layer context menu.
   Select it and the map is zoomed to the layer's nearest visibility scale.


.. _`label_controlmap`:

Controlling Map Rendering
.........................

Map rendering can be controlled in various ways, as described below.

.. index::
   single: Rendering; Suspending
.. _`label_suspendrender`:

Suspending Rendering
^^^^^^^^^^^^^^^^^^^^

To suspend rendering, click the |checkbox| :guilabel:`Render` checkbox in the
bottom-right corner of the status bar. When |checkbox| :guilabel:`Render`
is not checked, QGIS does not redraw the canvas in response to any of
the events described in the section :ref:`redraw_events`. Examples of when you
might want to suspend rendering include:

* adding many layers and symbolizing them prior to drawing
* adding one or more large layers and setting scale dependency before drawing
* adding one or more large layers and zooming to a specific view before drawing
* any combination of the above

Checking the |checkbox| :guilabel:`Render` checkbox enables rendering and
causes an immediate refresh of the map canvas.


.. index::
   single: Rendering; Options
   single: Layers; Initial visibility
.. _`label_settinglayer`:

Setting Layer Add Option
^^^^^^^^^^^^^^^^^^^^^^^^

You can set an option to always load new layers without drawing them. This
means the layer will be added to the map, but its visibility checkbox in the
legend will be unchecked by default. To set this option, choose menu option
:menuselection:`Settings --> Options` and click on the :guilabel:`Rendering`
tab. Uncheck |checkbox| :guilabel:`By default new layers added to the map
should be displayed`. Any layer subsequently added to the map will be off
(invisible) by default.


.. index::
   single: Rendering; Halting
.. _label_stoprender:

Stopping Rendering
^^^^^^^^^^^^^^^^^^

To stop the map drawing, press the :kbd:`Esc` key. This will halt the refresh of
the map canvas and leave the map partially drawn. It may take a bit of time
between pressing :kbd:`Esc` for the map drawing to halt.


.. index::
   single: Rendering; Quality
.. _`label_renderquality`:

Influence Rendering Quality
^^^^^^^^^^^^^^^^^^^^^^^^^^^

QGIS has an option to influence the rendering quality of the map. Choose menu
option :menuselection:`Settings --> Options`, click on the :guilabel:`Rendering`
tab and select or deselect |checkbox| :guilabel:`Make lines appear less jagged
at the expense of some drawing performance`.

.. index::
   single: Rendering; Speed-up

Speed-up rendering
^^^^^^^^^^^^^^^^^^

There are some settings that allow you to improve rendering speed. Open the QGIS options
dialog using :menuselection:`Settings --> Options`, go to the :guilabel:`Rendering`
tab and select or deselect the following checkboxes:

* |checkbox| :guilabel:`Use render caching where possible to speed up redraws`.
* |checkbox| :guilabel:`Render layers in parallel using many CPU cores` and then
  set the |checkbox| :guilabel:`Max cores to use`.
* The map renders in the background onto a separate image and each
  |checkbox| :guilabel:`Map Update interval`, the content from this
  (off-screen) image will be taken to update the visible screen representation.
  However, if rendering finishes faster than this duration, it will be shown
  instantaneously.
* With |checkbox| :guilabel:`Enable Feature simplification by default for newly
  added layers`, you simplify features' geometry (fewer nodes) and as a result,
  they display more quickly.
  Be aware that this can cause rendering inconsistencies.


.. index:: Zoom, Pan, Map navigation
.. _zoom_pan:

Zooming and Panning
-------------------

QGIS provides tools to zoom and pan to your area of interest.

Apart from using the |pan| :sup:`pan` and |zoomIn|
:sup:`zoom-in`/|zoomOut| :sup:`zoom-out` icons on the toolbar
with the mouse, you can also navigate with the mouse wheel, spacebar
and arrow keys. A :guilabel:`Zoom factor` can be set under the
:menuselection:`Settings -->` |options| :menuselection:`Options --> Map tools`
menu to define the scale behavior while zooming.

With the mouse wheel
....................

You can press the mouse wheel to pan inside of the main window (on macOS,
you may need to hold down the :kbd:`cmd` key).
You can roll the mouse wheel to zoom in and out on the map; the mouse
cursor position will be the center of the zoomed area of interest.
Holding down :kbd:`Ctrl` while rolling the mouse wheel results in a finer zoom.

With the arrow keys
...................

Panning the map is possible with the arrow keys.
Place the mouse cursor inside the map area, and click on the arrow keys
to pan up, down, left and right.

You can also use the space bar to cause mouse movements temporarily to pan
the map. The :kbd:`PgUp` and :kbd:`PgDown` keys on your keyboard will cause
the map display to zoom in or out following the zoom factor set. Pressing
:kbd:`Ctrl++` or :kbd:`Ctrl+-` also performs an immediate zoom in/out
on the map canvas.

When certain map tools are active (Identify, Measure...), you can perform a zoom by
holding down :kbd:`Shift` and dragging a rectangle on the map to zoom to that area.
This is not enabled for selection tools (since they
use :kbd:`Shift` for adding to selection) or edit tools.


.. index::
   single: Bookmarks
   see: Spatial bookmarks; Bookmarks
.. _`sec_bookmarks`:

Spatial Bookmarks
-----------------

Spatial Bookmarks allow you to "bookmark" a geographic location and return to
it later. By default, bookmarks are saved in the user's profile (as :guilabel:`User
Bookmarks`), meaning that they are available from any project the user opens.
They can also be saved for a single project (named
:guilabel:`Project Bookmarks`) and stored within the project file, which can
be helpful if the project is to be shared with other users.

Creating a Bookmark
...................

To create a bookmark:

#. Zoom and pan to the area of interest.
#. Select the menu option :menuselection:`View -->` |newBookmark|
   :menuselection:`New Spatial Bookmark...`,
   press :kbd:`Ctrl+B` or right-click the |showBookmarks| :guilabel:`Spatial
   Bookmarks` entry in
   the :guilabel:`Browser` panel and select :guilabel:`New Spatial Bookmark`.
   The :guilabel:`Bookmark Editor` dialog opens.

   .. _figure_create_bookmarks:

   .. figure:: img/bookmark_editor.png
      :align: center

      The Bookmark Editor Dialog

#. Enter a descriptive name for the bookmark
#. Enter or select a group name in which to store related bookmarks
#. Select the extent of the area you wish to save, using the extent selector;
   the extent can be calculated from a loaded layer extent, the current map
   canvas or drawn over the current map canvas.
#. Indicate the :guilabel:`CRS` to use for the extent
#. Select whether the bookmark will be :guilabel:`Saved in` :guilabel:`User
   Bookmarks` or :guilabel:`Project Bookmarks`
#. Press :guilabel:`Save` to add the bookmark to the list

Note that you can have multiple bookmarks with the same name.

Working with Bookmarks
......................

To use and manage bookmarks, you can either use the :guilabel:`Spatial Bookmarks`
panel or :guilabel:`Browser`.

Select :menuselection:`View -->` |showBookmarks| :menuselection:`Show Spatial
Bookmark Manager` or press :kbd:`Ctrl+7`
to open the :guilabel:`Spatial Bookmarks Manager` panel.
Select :menuselection:`View -->` |showBookmarks| :menuselection:`Show Bookmarks`
or :kbd:`Ctrl+Shift+B` to show
the |showBookmarks| :guilabel:`Spatial Bookmarks` entry in the
:guilabel:`Browser` panel.

You can perform the following tasks:

.. list-table::
   :header-rows: 1
   :widths: 20 40 40
   :stub-columns: 0

   * - Task
     - Spatial Bookmark Manager
     - Browser
   * - **Zoom to a Bookmark**
     - Double-click on it, or select the bookmark and press the
       |zoomToBookmark| :guilabel:`Zoom to bookmark` button.
     - Double-click on it, drag and drop it to the map canvas, or right-click
       the bookmark and select :guilabel:`Zoom to Bookmark`.
   * - **Delete a bookmark**
     - Select the bookmark and click the |deleteSelected| :guilabel:`Delete bookmark` button.
       Confirm your choice.
     - Right-click the bookmark and select :guilabel:`Delete Spatial Bookmark`.
       Confirm your choice.
   * - **Export bookmarks to XML**
     - Click the |sharing| :guilabel:`Import/Export Bookmarks` button and select
       |sharingExport| :guilabel:`Export`.
       All the bookmarks (user or project) are saved in an xml file.
     - Select one or more folders (user or project) or subfolders (groups),
       then right-click and select |sharingExport| :guilabel:`Export Spatial Bookmarks...`.
       The selected bookmark subset is saved.
   * - **Import bookmarks from XML**
     - Click the |sharing| :guilabel:`Import/Export Bookmarks` button and
       select |sharingImport| :guilabel:`Import`.
       All bookmarks in the XML file are imported as user bookmarks.
     - Right-click the :guilabel:`Spatial Bookmarks` entry or one of its folders (user or
       project) or subfolders (groups) to determine where to import the
       bookmarks, then select |sharingImport| :guilabel:`Import Spatial Bookmarks`.
       If performed on the :guilabel:`Spatial Bookmarks` entry, the bookmarks
       are added to :guilabel:`User Bookmarks`.
   * - **Edit bookmark**
     - You can change a bookmark by changing the values in the table. You can
       edit the name, the group, the extent and if it is stored in the project or
       not.
     - Right-click the desired bookmark and select :guilabel:`Edit Spatial
       Bookmark...`.
       The :guilabel:`Bookmark Editor` will open, allowing you to redefine every
       aspect of the bookmark as if you were creating it for the first time.

       You can also drag and drop the bookmark between folders (user and
       project) and subfolders (groups).

You can also zoom to bookmarks by typing the bookmark name in the
:ref:`locator <label_statusbar>`.

.. index:: Decorations
.. _decorations:

Decorations
-----------

Decorations include Grid, Title Label, Copyright Label, Image, North Arrow, Scale Bar and Layout
Extents. They are used to 'decorate' the map by adding cartographic elements.

.. index:: Grid
.. _grid_decoration:

Grid
....

|addGrid| :guilabel:`Grid` allows you to add a coordinate grid and coordinate
annotations to the map canvas.

#. Select menu option :menuselection:`View --> Decorations --> Grid...` to open the dialog.

   .. _figure_decorations_grid:

   .. figure:: img/grid_dialog.png
      :align: center

      The Grid Dialog

#. Tick |checkbox| :guilabel:`Enable grid` and set grid
   definitions according to the layers loaded in the map canvas:

   * The :guilabel:`Grid type`: it can be :guilabel:`Line` or :guilabel:`Marker`
   * The associated :ref:`Line symbol <vector_line_symbols>` or :ref:`marker
     symbol <vector_marker_symbols>` used to represent the grid marks
   * The :guilabel:`Interval X` and :guilabel:`Interval Y` between the grid
     marks, in map units
   * An :guilabel:`Offset X` and :guilabel:`Offset Y` distance of the grid
     marks from the bottom left corner of the map canvas, in map units
   * The interval and offset parameters can be set based on the:

     * :guilabel:`Canvas Extents`: generates a grid with an interval that is
       approximatively 1/5 of the canvas width
     * :guilabel:`Active Raster Layer` resolution
#. Tick |checkbox| :guilabel:`Draw annotations` to display the coordinates of
   the grid marks and set:

   * The :guilabel:`Annotation direction`, ie how the labels would be placed
     relative to their grid line. It can be:

     * :guilabel:`Horizontal` or :guilabel:`Vertical` for all the labels
     * :guilabel:`Horizontal and Vertical`, ie each label is parallel to the
       grid mark it refers to
     * :guilabel:`Boundary direction`, ie each label follows the canvas
       boundary, and is perpendicular to the grid mark it refers to
   * The :guilabel:`Annotation font` using the OS :ref:`font selector widget
     <font_selector>`
   * The :guilabel:`Distance to map frame`, margin between annotations and map
     canvas limits. Convenient when exporting the map canvas eg to an image
     format or PDF, and avoid annotations to be on the "paper" limits.

     .. Todo: Add a reference link to export map canvas to image or pdf section when done

   * The :guilabel:`Coordinate precision`

#. Click :guilabel:`Apply` to verify that it looks as expected or :guilabel:`OK`
   if you're satisfied.

.. index:: Title
.. _title_label_decoration:

Title Label
...........

|titleLabel| :guilabel:`Title Label` allows you to decorate your map with a **Title**.

To add a Title Label decoration:

#. Select menu option :menuselection:`View --> Decorations --> Title Label...`
   to open the dialog.

   .. _figure_decorations_title:

   .. figure:: img/titleLabel.png
      :align: center

      The Title Decoration Dialog

#. Make sure |checkbox| :guilabel:`Enable Title Label` is checked
#. Enter the title text you want to place on the map.
   You can make it dynamic using the :guilabel:`Insert an Expression` button.
#. Choose the :guilabel:`Font` for the label using the :ref:`font selector
   widget <font_selector>` with full access to QGIS :ref:`text formatting
   <text_format>` options. Quickly set the font color and opacity by clicking
   the black arrow to the right of the font combo box.
#. Select the :ref:`color <color-selector>` to apply to the title's
   :guilabel:`Background bar color`.
#. Choose the :guilabel:`Placement` of the label in the canvas: options are
   :guilabel:`Top left`, :guilabel:`Top Center` (default),
   :guilabel:`Top Right`, :guilabel:`Bottom left`, :guilabel:`Bottom Center`
   and :guilabel:`Bottom Right`.
#. Refine the placement of the item by setting a horizontal and/or vertical
   :guilabel:`Margin from Edge`. These values can be in **Millimeters** or
   **Pixels** or set as a **Percentage** of the width or height of the map canvas.
#. Click :guilabel:`Apply` to verify that it looks as expected or
   :guilabel:`OK` if you're satisfied.

.. index:: Copyright
.. _copyright_decoration:

Copyright Label
...............

|copyrightLabel| :guilabel:`Copyright Label` can be used to decorate your
map with a **Copyright** label.

To add this decoration:

#. Select menu option :menuselection:`View --> Decorations --> Copyright Label...`
   to open the dialog.

   .. _figure_decorations_copyright:

   .. figure:: img/copyright.png
      :align: center

      The Copyright Decoration Dialog

#. Make sure |checkbox| :guilabel:`Enable Copyright Label` is checked
#. Enter the copyright text you want to place on the map.
   You can make it dynamic using the :guilabel:`Insert an Expression` button.
#. Choose the :guilabel:`Font` for the label using the :ref:`font selector
   widget <font_selector>` with full access to QGIS :ref:`text formatting
   <text_format>` options. Quickly set the font color and opacity by clicking
   the black arrow to the right of the font combo box.
#. Choose the :guilabel:`Placement` of the label in the canvas: options are
   :guilabel:`Top left`, :guilabel:`Top Center`,
   :guilabel:`Top Right`, :guilabel:`Bottom left`, :guilabel:`Bottom Center`,
   and :guilabel:`Bottom Right` (default for Copyright decoration)
#. Refine the placement of the item by setting a horizontal and/or vertical
   :guilabel:`Margin from Edge`. These values can be in **Millimeters** or
   **Pixels** or set as a **Percentage** of the width or height of the map canvas.
#. Click :guilabel:`Apply` to verify that it looks as expected or
   :guilabel:`OK` if you're satisfied.

.. index:: Image decoration
.. _image_decoration:

Image Decoration
................

|addImage| :guilabel:`Image` allows you to add an image (logo, legend, ..) on the map canvas.

To add an image:

#. Select menu option :menuselection:`View --> Decorations --> Image...`
   to open the dialog.

   .. _figure_image_decoration:

   .. figure:: img/image_decoration.png
      :align: center

      The Image Decoration Dialog

#. Make sure |checkbox| :guilabel:`Enable Image` is checked
#. Select a bitmap (e.g. png or jpg) or SVG image using the
   :guilabel:`...` :sup:`Browse` button
#. If you have chosen a parameter enabled SVG then you can also set
   a :guilabel:`Fill` or :guilabel:`Stroke` (outline) color.
   For bitmap images, the color settings are disabled.
#. Set a :guilabel:`Size` of the image in mm. The width of selected image is used to
   resize it to given :guilabel:`Size`.
#. Choose where you want to place the image on the map canvas with the
   :guilabel:`Placement` combo box. The default position is :guilabel:`Top Left`.
#. Set the :guilabel:`Horizontal` and :guilabel:`Vertical Margin from (Canvas) Edge`.
   These values can be set in **Millimeters**, **Pixels** or as a **Percentage** of
   the width or height of the map canvas.
#. Click :guilabel:`Apply` to verify that it looks as expected and :guilabel:`OK`
   if you're satisfied.

.. index:: North arrow
.. _northarrow_decoration:

North Arrow
...........

|northArrow| :guilabel:`North Arrow` allows you to add a north arrow on the map canvas.

To add a north arrow:

#. Select menu option :menuselection:`View --> Decorations --> North Arrow...`
   to open the dialog.

   .. _figure_decorations_north:

   .. figure:: img/north_arrow_dialog.png
      :align: center

      The North Arrow Dialog

#. Make sure |checkbox| :guilabel:`Enable north arrow` is checked
#. Optionally change the color and size, or choose a custom SVG
#. Optionally change the angle or choose **Automatic** to let QGIS determine the
   direction
#. Optionally choose the placement from the Placement combo box
#. Optionally refine the placement of the arrow by setting a horizontal and/or vertical
   `Margin from (Canvas) Edge`. These values can be in **Millimeters** or
   **Pixels** or set as a **Percentage** of the width or height of the map canvas.
#. Click :guilabel:`Apply` to verify that it looks as expected and :guilabel:`OK` if you're satisfied.


.. index:: Scale bar
.. _scalebar_decoration:

Scale Bar
.........

|scaleBar| :guilabel:`Scale Bar` adds a simple scale bar to the map canvas.
You can control the style and placement, as well as the labelling of the bar.

QGIS only supports displaying the scale in the same units as your map frame.
So, if the units of your project's CRS are meters, you can't create a scale bar in
feet. Likewise, if you are using decimal degrees, you can't create a scale
bar to display distance in meters.

To add a scale bar:

#. Select menu option :menuselection:`View --> Decorations --> Scale Bar...`
   to open the dialog

   .. _figure_decorations_scale:

   .. figure:: img/scale_bar_dialog.png
      :align: center

      The Scale Bar Dialog

#. Make sure |checkbox| :guilabel:`Enable scale bar` is checked
#. Choose a style from the :guilabel:`Scale bar style` |selectString| combo box
#. Select the :guilabel:`Color of bar` |selectColor| by choosing
   a fill color (default: black) and an outline color (default: white). The scale
   bar fill and outline can be made opaque by clicking on the down arrow to the right
   of the color input.
#. Select the font for the scale bar from the :guilabel:`Font of bar` |selectString| combo box
#. Set the :guilabel:`Size of bar` |selectNumber|
#. Optionally check |checkbox| :guilabel:`Automatically snap to round number
   on resize` to display easy-to-read values
#. Choose the placement from the :guilabel:`Placement` |selectString| combo box
#. You can refine the placement of the item by setting a horizontal and/or vertical
   `Margin from (Canvas) Edge`. These values can be in **Millimeters** or
   **Pixels** or set as a **Percentage** of the width or height of the map canvas.
#. Click :guilabel:`Apply` to verify that it looks as expected or :guilabel:`OK` if you're satisfied.

.. index:: Layout extents
.. _layoutextents_decoration:

Layout Extents
..............

|addMap| :guilabel:`Layout Extents` adds the extents of :ref:`map item(s) <layout_map_item>` in print
layout(s) to the canvas. When enabled, the extents of all map items within all print layouts are
shown using a lightly dotted border labeled with the name of the print layout and map item.
You can control the style and labeling of the displayed layout extents.
This decoration is useful when you are tweaking the positioning of map elements such as labels,
and need to know the actual visible region of print layouts.

.. _figure_decorations_layoutextents_example:

.. figure:: img/decoration_layoutextents_example.png
   :align: center

   Example of layout extents displayed in a QGIS project with two print layouts. The print
   layout named 'Sights' contains two map items, while the other print layout contains one
   map item.

To add layout extent(s):

#. Select :menuselection:`View --> Decorations --> Layout Extents` to open
   the dialog

   .. _figure_decorations_layoutextents:

   .. figure:: img/decoration_layoutextents.png
      :align: center

      The Layout Extents Dialog

#. Make sure |checkbox| :guilabel:`Show layout extents` is checked.
#. Optionally change the symbol and labeling of the extents.
#. Click :guilabel:`Apply` to verify that it looks as expected and :guilabel:`OK`
   if you're satisfied.


.. tip::

   **Decorations Settings**

   When you save a QGIS project file, any changes you have made to Grid,
   North Arrow, Scale Bar, Copyright and Layout Extents will be saved in the project and restored
   the next time you load the project.


.. index::
   single: Annotation
   see: Annotation; Form annotation
.. _sec_annotations:

Annotation Tools
----------------

Annotations are information added to the map canvas and shown within a
balloon. This information can be of different types and annotations are
added using the corresponding tools in the :guilabel:`Attributes Toolbar`:

* |textAnnotation| :sup:`Text Annotation` for custom formatted text
* |htmlAnnotation| :sup:`HTML Annotation` to place the content of an :file:`html`
  file
* |svgAnnotation| :sup:`SVG Annotation` to add an :file:`SVG` symbol
* |formAnnotation| :sup:`Form Annotation`: useful to display attributes
  of a vector layer in a customized :file:`ui` file (see figure_custom_annotation_).
  This is similar to the :ref:`custom attribute forms <provide_ui_file>`,
  but displayed in an annotation item. Also see this video
  https://www.youtube.com/watch?v=0pDBuSbQ02o&feature=youtu.be&t=2m25s
  from Tim Sutton for more information.

.. _figure_custom_annotation:

.. figure:: img/custom_annotation.png
   :align: center

   Customized QT Designer annotation form

.. Todo: Ideally, to sync with the text, this screenshot should not show the
 dialog of form annotation but instead different forms in action, this will be all
 about showing what an annotation looks like.
 Annotation dialog will need to be shown only when it's described (which is done below)

To add an annotation, select the corresponding tool and click on the map canvas.
An empty balloon is added. Double-click on it and a dialog opens with various
options. This dialog is almost the same for all the annotation types:

* At the top, a file selector to fill with the path to an :file:`html`, :file:`svg`
  or :file:`ui` file depending on the type of annotation. For text annotation,
  you can enter your message in a text box and set its rendering with
  the normal font tools.
* |checkbox| :guilabel:`Fixed map position`: when unchecked, the balloon placement
  is based on a screen position (instead of the map), meaning that it's always shown
  regardless the map canvas extent.
* :guilabel:`Linked layer`: associates the annotation with a map layer, making it
  visible only when that layer is visible.
* :guilabel:`Map marker`: using :ref:`QGIS symbols <symbol-selector>`,
  sets the symbol to display at the balloon anchor position (shown only when
  :guilabel:`Fixed map position` is checked).
* :guilabel:`Frame style`: sets the frame background color, transparency,
  stroke color or width of the balloon using QGIS symbols.
* :guilabel:`Contents margins`: sets interior margins of the annotation frame.

.. _figure_annotation:

.. figure:: img/annotation.png
   :align: center

   Annotation text dialog

Annotations can be selected when an annotation tool is enabled. They can then be
moved by map position (by dragging the map marker) or by moving only the balloon.
The |annotation| :sup:`Move Annotation` tool also allows you to move the
balloon on the map canvas.

To delete an annotation, select it and either press the :kbd:`Del` or :kbd:`Backspace`
button, or double-click it and press the :guilabel:`Delete` button in the properties dialog.

.. note::
   If you press :kbd:`Ctrl+T` while an :guilabel:`Annotation` tool (move annotation,
   text annotation, form annotation) is active, the visibility states of the items
   are inverted.

.. tip:: **Layout the map with annotations**

  You can print or export annotations with your map to various formats using:

  * map canvas export tools available in the :menuselection:`Project` menu
  * :ref:`print layout <create-output>`, in which case you need to check
    :guilabel:`Draw map canvas items` in the corresponding map item properties


.. index::
   pair: Tools; Measure
.. _`sec_measure`:

Measuring
---------

General information
...................

QGIS provides four means of measuring geometries:

* interactive measurement tools |measure|
* measuring in the |calculateField| :sup:`Field Calculator`
* derived measurements in the :ref:`identify` tool
* the vector analysis tool: :menuselection:`Vector --> Geometry Tools -->
  Export/Add Geometry Columns`

Measuring works within projected coordinate systems (e.g., UTM) and unprojected
data. The first three measuring tools behave equally to global project settings:

* Unlike most other GIS, the default measurement metric is
  ellipsoidal, using the ellipsoid defined in
  :menuselection:`Project --> Properties... --> General`. This is true both
  when geographic and projected coordinate systems are defined for the project.
* If you want to calculate the projected/planimetric area or distance using cartesian
  maths, the measurement ellipsoid has to be set to "None/Planimetric"
  (:menuselection:`Project --> Properties... --> General`). However,
  with a geographic (ie unprojected) CRS defined for the data and project, area and
  distance measurement will be ellipsoidal.

However, neither the identify tool nor the field calculator will transform your
data to the project CRS before measuring. If you want to achieve this, you have
to use the vector analysis tool: :menuselection:`Vector --> Geometry Tools -->
Add Geometry Attributes...`. Here, measurement is planimetric, unless
you choose the ellipsoidal measurement.

Measure length, areas and angles interactively
..............................................

Click the |measure| icon in the Attribute toolbar to begin measurements.
The down arrow near the icon switches between
|measure| length, |measureArea| area or |measureAngle| angle.
The default unit used in the dialog is the one set in :menuselection:`Project -->
Properties... --> General` menu.

.. note:: **Configuring the measure tool**

   While measuring length or area, clicking the :guilabel:`Configuration` button
   at the bottom of the widget opens the :menuselection:`Settings -->
   Options --> Map Tools` menu, where you can select the rubberband color, the
   precision of the measurements and the unit behavior. You can also choose your
   preferred measurement or angle units, but keep in mind that those values are
   overridden in the current project by the selection made in the
   :menuselection:`Project --> Properties... --> General` menu, and by the
   selection made in the measurement widget.

All measuring modules use the snapping settings from the digitizing module (see
section :ref:`snapping_tolerance`). So, if you want
to measure exactly along a line feature, or around a polygon feature, first set
its layer snapping tolerance. Now, when using the measuring
tools, each mouse click (within the tolerance setting) will snap to that layer.

.. index::
   single: Measure; Distances
   single: Measure; Areas
   single: Measure; Angles

By default, |measure| :sup:`Measure Line` measures real distances
between given points according to a defined ellipsoid.
The tool then allows you to click points on the map. Each segment length,
as well as the total, shows up in the measure window.
To stop measuring, click the right mouse button.

Note that you can use the drop-down list near the total to change
the measurement units interactively while working with the measure tool ('Meters', 'Kilometers', 'Feet', 'Yards',
'Miles', 'Nautical miles', 'Centimeters', 'Millimeters', 'Degrees', 'Map units').
This unit is retained for the widget until a new project is created or another project
is opened.

The :guilabel:`Info` section in the dialog explains how calculations are made
according to the CRS settings available.

.. %FixMe: currently, validating the Settings --> Options dialog revert any change
   made on units in the measurement dialog (see https://issues.qgis.org/issues/15436
   bug or not? should it be documented?)

.. _figure_measure_length:

.. figure:: img/measure_line.png
   :align: center

   Measure Distance

|measureArea| :sup:`Measure Area`: Areas can also be measured. In the
measure window, the accumulated area size appears. Right-click to stop drawing.
The Info section is also available as well as the ability to switch between
different area units ('Square meters', 'Square kilometers', 'Square feet', 'Square yards',
'Square miles', 'Hectares', 'Acres', 'Square centimeters',
'Square millimeters', 'Square nautical miles', 'Square degrees', 'Map units').

.. _figure_measure_area:

.. figure:: img/measure_area.png
   :align: center

   Measure Area

|measureAngle| :sup:`Measure Angle`: You can also measure angles. The
cursor becomes cross-shaped. Click to draw the first segment of the angle you
wish to measure, then move the cursor to draw the desired angle. The measurement
is displayed in a pop-up dialog.

.. _figure_measure_angle:

.. figure:: img/measure_angle.png
   :align: center

   Measure Angle

Interacting with features
=========================

.. index::
   see: Select; Selection tools
   single: Selection tools; Select all
   single: Selection tools; Invert selection
   single: Selection tools; Select by expression
   single: Selection tools; Select by form
   single: Selection tools; Select by polygon
   single: Selection tools; Select by freehand
   single: Selection tools; Select by rectangle
   single: Selection tools; Select by radius
   pair: Select; Deselect

.. _`sec_selection`:

Selecting features
------------------

QGIS provides several tools to select features on the map canvas. Selection
tools are available in the :menuselection:`Edit --> Select` menu or in the
:guilabel:`Attributes toolbar`.

.. note::

   Selection tools work with the currently active layer.

Selecting manually on the map canvas
....................................

To select one or more features with the mouse, you can use one of the following
tools:

* |selectRectangle| :sup:`Select Features by area or single click`
* |selectPolygon| :sup:`Select Features by Polygon`
* |selectFreehand| :sup:`Select Features by Freehand`
* |selectRadius| :sup:`Select Features by Radius`

.. note:: Other than |selectPolygon| :sup:`Select Features by Polygon`, these
   manual selection tools allow you to select feature(s) on the map canvas with a
   single click.

.. note:: Use the |selectPolygon| :sup:`Select Features by Polygon` tool
   to use an existing polygon to select overlapping features.
   Right-click in the polygon and choose it from the context menu that shows a
   list of all the polygons that contain the clicked point.
   All the overlapping features from the active layer are selected.

.. tip:: Use the :menuselection:`Edit --> Select --> Reselect Features`
   tool to redo your latest selection.
   Very useful when you have painstakingly made a selection, and then click
   somewhere else accidentally and clear your selection.

While using the |selectRectangle| :guilabel:`Select Feature(s)` tool,
holding :kbd:`Shift` or :kbd:`Ctrl` toggles whether a feature is selected
(ie either adds to the current selection or remove from it).

For the other tools, different behaviors can be performed by holding down:

* :kbd:`Shift`: add features to the current selection
* :kbd:`Ctrl`: substract features from the current selection
* :kbd:`Ctrl+Shift`: intersect with current selection, ie only keep
  overlapping features from the current selection
* :kbd:`Alt`: select features that are totally within the selection shape.
  Combined with :kbd:`Shift` or :kbd:`Ctrl` keys, you can add or substract
  features to/from the current selection.

.. _automatic_selection:

Automatic selection
...................

The other selection tools, most of them available from the :ref:`Attribute table
<sec_attribute_table>`, perform a selection based on a feature's attribute
or its selection state (note that attribute table and map canvas show the
same information, so if you select one feature in the attribute table, it will
be selected on the map canvas too):

* |expressionSelect| :sup:`Select By Expression...` select
  features using expression dialog
* |formSelect| :sup:`Select Features By Value...` or press :kbd:`F3`
* |deselectAll| :sup:`Deselect Features from All Layers` or press
  :kbd:`Ctrl+Shift+A` to deselect all selected features in all layers
* |selectAll| :sup:`Select All Features` or press :kbd:`Ctrl+A` to select all
  features in the current layer
* |invertSelection| :sup:`Invert Feature Selection` to invert the selection in
  the current layer


For example, if you want to find regions that are boroughs from
:file:`regions.shp` of the QGIS sample data, you can:

#. Use the |expressionSelect| :sup:`Select features using an Expression` icon
#. Expand the :guilabel:`Fields and Values` group
#. Double-click the field that you want to query ("TYPE_2")
#. Click :guilabel:`All Unique` in the panel that shows up on the right
#. From the list, double-click 'Borough'. In the
   :guilabel:`Expression` editor field, write the following query:

   ::


    "TYPE_2"  =  'Borough'

#. Click :guilabel:`Select Features`

From the expression builder dialog, you can also use :menuselection:`Function
list --> Recent (Selection)` to make a selection that you have used before. The
dialog remembers the last 20 expressions used. See :ref:`vector_expressions`
for more information and examples.


.. tip:: **Save your selection into a new file**

   Users can save selected features into a **New Temporary Scratch Layer** or a
   **New Vector Layer** using :menuselection:`Edit --> Copy Features` and
   :menuselection:`Edit --> Paste Features as` in the desired format.

.. index::
   single: Selection tools; Select by value

.. _select_by_value:

Select Features By Value
........................

This selection tool opens the layer's feature form allowing the user to choose
which value to look for for each field, whether the search should be case-sensitive,
and the operation that should be used. The tool has also autocompletes,
automatically filling the search box with existing values.

.. _figure_filter_form:

.. figure:: img/select_by_value.png
   :align: center

   Filter/Select features using form dialog

Alongside each field, there is a drop-down list with options to
control the search behaviour:

.. tabularcolumns:: |l|c|c|c|

============================================= ============ ============  ============
 Field search option                           String       Numeric       Date
============================================= ============ ============  ============
 :guilabel:`Exclude Field` from the search     |checkbox|   |checkbox|    |checkbox|
 :guilabel:`Equal to (=)`                      |checkbox|   |checkbox|    |checkbox|
 :guilabel:`Not equal to (≠)`                  |checkbox|   |checkbox|    |checkbox|
 :guilabel:`Greater than (>)`                               |checkbox|    |checkbox|
 :guilabel:`Less than (<)`                                  |checkbox|    |checkbox|
 :guilabel:`Greater than or equal to (≥)`                   |checkbox|    |checkbox|
 :guilabel:`Less than or equal to (≤)`                      |checkbox|    |checkbox|
 :guilabel:`Between (inclusive)`                            |checkbox|    |checkbox|
 :guilabel:`Not between (inclusive)`                        |checkbox|    |checkbox|
 :guilabel:`Contains`                          |checkbox|
 :guilabel:`Does not contain`                  |checkbox|
 :guilabel:`Is missing (null)`                 |checkbox|   |checkbox|    |checkbox|
 :guilabel:`Is not missing (not null)`         |checkbox|   |checkbox|    |checkbox|
 :guilabel:`Starts with`                       |checkbox|
 :guilabel:`Ends with`                         |checkbox|
============================================= ============ ============  ============


For string comparisons, it is also possible to use the |checkbox|
:guilabel:`Case sensitive` option.

After setting all search options, click :guilabel:`Select features`
to select the matching features. The drop-down options are:

* :guilabel:`Select features`
* :guilabel:`Add to current selection`
* :guilabel:`Remove from current selection`
* :guilabel:`Filter current selection`

You can also clear all search options using the :guilabel:`Reset form` button.

Once the conditions are set, you can also either:

* :guilabel:`Zoom to features` on the map canvas without the need of a preselection
* :guilabel:`Flash features`, highlighting the matching features. This is a
  handy way to identify a feature without selection or using the Identify tool.
  Note that the flash does not alter the map canvas extent and would be visible only
  if the feature is within the bounds of the current map canvas.

.. index::
   single: Identify features
.. _`identify`:

Identifying Features
--------------------

The Identify tool allows you to interact with the map canvas and get information
on features in a pop-up window. To identify features, use:

* :menuselection:`View --> Identify Features`
* :kbd:`Ctrl+Shift+I` (or |osx| :kbd:`Cmd+Shift+I`),
* |identify| :sup:`Identify Features` icon on the Attributes toolbar

Using the Identify Features tool
................................

QGIS offers several ways to identify features with the |identify|
:sup:`Identify Features` tool:

* **left click** identifies features according to the
  :ref:`selection mode <identify_mode>` and the
  :ref:`selection mask <identify_selection>` set in the
  :guilabel:`Identify Results` panel
* **right click** with :guilabel:`Identify Feature(s)` as
  :ref:`selection mode <identify_mode>` set in the :guilabel:`Identify Results`
  panel fetches all snapped features from all visible layers.
  This opens a context menu, allowing the user to choose more precisely the
  features to identify or the action to execute on them.
* **right click** with :guilabel:`Identify Features by Polygon` as
  :ref:`selection mode <identify_mode>` in the :guilabel:`Identify Results`
  panel identifies the features that overlap with the chosen existing
  polygon, according to the :ref:`selection mask <identify_selection>` set in
  the :guilabel:`Identify Results` panel

.. tip:: **Filter the layers to query with the Identify Features tool**

   Under :guilabel:`Layer Capabilities` in :menuselection:`Project --> Properties...
   --> Data Sources`, uncheck the :guilabel:`Identifiable` column next to a
   layer to avoid it
   being queried when using the |identify| :sup:`Identify Features` tool in a mode
   other than **Current Layer**. This is a handy way to return features from
   only layers that are of interest for you.

If you click on feature(s), the :guilabel:`Identify Results` dialog will list
information about the feature(s) clicked. The default view is a tree view in which
the first item is the name of the layer and its children are its identified feature(s).
Each feature is described by the name of a field along with its value.
This field is the one set in :menuselection:`Layer Properties --> Display`.
All the other information about the feature follows.

Feature information
...................

The Identify Results dialog can be customized to display custom fields, but by
default it will display the following information:

.. index:: Actions

* The feature :ref:`display name <maptips>`;
* **Actions**: Actions can be added to the identify feature windows.
  The action is run by clicking on the action label. By default, only one action
  is added, namely ``View feature form`` for editing. You can define more actions
  in the layer's properties dialog (see :ref:`actions_menu`).
* **Derived**: This information is calculated or derived from other information.
  It includes:

  * general information about the feature's geometry:

    * depending on the geometry type, the cartesian measurements of length,
      perimeter or area in the layer's CRS units
    * depending on the geometry type and if an ellipsoid is set in the project
      properties dialog for :guilabel:`Measurements`, the ellipsoidal values of
      length, perimeter or area using the specified units
    * the count of geometry parts in the feature and the number of the part
      clicked
    * the count of vertices in the feature
  * coordinate information, using the project properties :guilabel:`Coordinates
    display` settings:

    * ``X`` and ``Y`` coordinate values of the point clicked
    * the number of the closest vertex to the point clicked
    * ``X`` and ``Y`` coordinate values of the
      closest vertex (and ``Z``/``M`` if applicable)
    * if you click on a curved segment,
      the radius of that section is also displayed.

* **Data attributes**: This is the list of attribute fields and values for the
  feature that has been clicked.

.. note:: Links in the feature's attributes are clickable from the :guilabel:`Identify
   Results` panel and will open in your default web browser.

.. _figure_identify:

.. figure:: img/identify_features.png
   :align: center

   Identify Results dialog

The Identify Results dialog
...........................

At the top of the window, you have a handful of tools:

* |formView| :sup:`Open Form` of the current feature
* |expandTree| :sup:`Expand tree`
* |collapseTree| :sup:`Collapse tree`
* |expandNewTree| :sup:`Expand New Results by Default` to define whether the next
  identified feature's information should be collapsed or expanded
* |deselectAll| :sup:`Clear Results`
* |editCopy| :sup:`Copy selected feature to clipboard`
* |filePrint| :sup:`Print selected HTML response`

.. _identify_selection:

* selection mode to use to fetch features to identify:

  * |identifyByRectangle| :sup:`Identify Features by area or single click`
  * |identifyByPolygon| :sup:`Identify Features by Polygon`
  * |identifyByFreehand| :sup:`Identify Features by Freehand`
  * |identifyByRadius| :sup:`Identify Features by Radius`

  .. note::
     When using |identifyByPolygon| :sup:`Identify Features by Polygon`, you can
     right-click any existing polygon and use it to identify overlapping
     features in another layer.

.. _identify_mode:

At the bottom of the window are the :guilabel:`Mode` and :guilabel:`View`
combo boxes.
:guilabel:`Mode` defines from which layers features should be identified:

* **Current layer**: only features from the selected layer are identified. The
  layer need not be visible in the canvas.
* **Top down, stop at first**: only features from the upper visible layer.
* **Top down**: all features from the visible layers. The results are shown in
  the panel.
* **Layer selection**: opens a context menu where the user selects the layer to
  identify features from, similar to a right-click. Only the chosen features
  will be shown in the result panel.

The :guilabel:`View` can be set as **Tree**, **Table** or **Graph**.
'Table' and 'Graph' views can only be set for raster layers.

The identify tool allows you to |checkbox|:guilabel:`Auto open form`.
If checked, each time a single feature is identified, a form opens
showing its attributes. This is a handy way to quickly edit a feature's attributes.

Other functions can be found in the context menu of the identified item. For
example, from the context menu you can:

* View the feature form
* Zoom to feature
* Copy feature: Copy all feature geometry and attributes
* Toggle feature selection: Add identified feature to selection
* Copy attribute value: Copy only the value of the attribute that you click on
* Copy feature attributes: Copy the attributes of the feature
* Clear result: Remove results in the window
* Clear highlights: Remove features highlighted on the map
* Highlight all
* Highlight layer
* Activate layer: Choose a layer to be activated
* Layer properties: Open layer properties window
* Expand all
* Collapse all


.. index:: Save properties, Save style, QML, SLD
.. _save_layer_property:

Save and Share Layer Properties
===============================

.. _manage_custom_style:

Managing Custom Styles
-----------------------

When a vector layer is added to the map canvas, QGIS by default uses a random
symbol/color to render its features. However, you can set a default symbol in
:menuselection:`Project --> Properties... --> Default styles` that will be
applied to each newly added layer according to its geometry type.

.. any idea on how it works for raster?

Most of the time, though, you'd rather have a custom and more complex style
that can be applied automatically or manually to the layers (with less effort).
You can achieve this by using the :menuselection:`Style` menu at the bottom
of the Layer Properties dialog. This menu provides you with functions to
create, load and manage styles.

A style stores any information set in the layer properties dialog to render
or interact with the layer (including symbology, labeling, fields and form definitions,
actions, diagrams...) for vector layers, or the pixels (band or color rendering, transparency,
pyramids, histogram ...) for raster.


.. _figure_manage_style:

.. figure:: img/style_combobox.png
   :align: center

   Vector layer style combo box options

By default, the style applied to a loaded layer is named ``default``. Once you
have got the ideal and appropriate rendering for your layer, you can save it by
clicking the |selectString| :menuselection:`Style` combo box and choosing:

* **Rename Current**: The active style is renamed and updated with the current
  options
* **Add**: A new style is created using the current options. By default, it will
  be saved in the QGIS project file. See below to save the style in another file
  or a database
* **Remove**: Delete unwanted style, in case you have more than one style defined
  for the layer.

At the bottom of the Style drop-down list, you can see the styles set for the layer
with the active one checked.

Note that each time you validate the layer properties dialog, the active style
is updated with the changes you've made.

You can create as many styles as you wish for a layer but only one can be active
at a time. In combination with :ref:`Map Themes <map_themes>`,
this offers a quick and powerful way to manage complex projects without the need
to duplicate any layer in the map legend.

.. note::

  Given that whenever you apply modifications to the layer properties, changes
  are stored in the active style, always ensure you are editing the right style
  to avoid mistakenly altering a style used in a :ref:`map theme <map_themes>`.

.. tip:: **Manage styles from layer context menu**

   Right-click on the layer in the :guilabel:`Layers` panel to add, rename
   or remove layer styles.

.. _store_style:

Storing Styles in a File or a Database
--------------------------------------

While styles created from the :guilabel:`Style` combo box are by default saved
inside the project and can be copied and pasted from layer to layer in the project,
it's also possible to save them outside the project so that they can be loaded
in another project.

Save as text file
........................

Clicking the |selectString| :menuselection:`Style --> Save Style`, you can
save the style as a:

* QGIS layer style file (:file:`.qml`)
* SLD file (:file:`.sld`), only available for vector layers

Used on file-based format layers (:file:`.shp`, :file:`.tab`...), :guilabel:`Save
as Default` generates a :file:`.qml` file for the layer (with the same name).
SLDs can be exported from any type of renderer -- single symbol,
categorized, graduated or rule-based -- but when importing an SLD, either a
single symbol or rule-based renderer is created.
This means that categorized or graduated styles are converted to rule-based.
If you want to preserve those renderers, you have to use the QML format.
On the other hand, it can be very handy sometimes to have this easy way of
converting styles to rule-based.

Save in database
.................

Vector layer styles can also be stored in a database if the layer datasource is a
database provider. Supported formats are PostGIS, GeoPackage, SpatiaLite, MSSQL
and Oracle. The layer style is saved inside a table (named :file:`layer_styles`)
in the database. Click on :menuselection:`Save Style... --> Save in database`
then fill in the dialog to define a style name, add a description, a :file:`.ui`
file if applicable and to check if the style should be the default style.

You can save several styles for a single table in the database. However, each
table can have only one default style. Default styles can be saved in the layer
database or in the QGIS local database, a SQLite database in the :file:`~/.qgis2/`
directory (where QGIS stores its local settings).

.. _figure_save_style_database:

.. figure:: img/save_style_database.png
   :align: center

   Save Style in database Dialog

.. tip:: **Sharing style files between databases**

  You can only save your style in a database if the layer comes from such a
  database. You can't mix databases (layer in Oracle and style in MSSQL for
  instance). Use instead a plain text file if you want the style to be shared
  among databases.

.. note::

  You may encounter issues restoring the :file:`layer_styles` table from a
  PostgreSQL database backup. Follow :ref:`layer_style_backup` to fix that.

Load style
...........

When loading a layer in QGIS, if a default style already exists for this layer,
QGIS loads the layer with this style. Also :menuselection:`Style --> Restore Default`
looks for and loads that file, replacing the layer's current style.

:menuselection:`Style --> Load Style` helps you apply any saved style to a
layer. While text-file styles (:file:`.sld` or :file:`.qml`) can be applied
to any layer whatever its format, loading styles stored in a database is only
possible if the layer is from the same database or the style is stored in the
QGIS local database.

The :guilabel:`Database Styles Manager` dialog displays a list of styles related
to the layer found in the database and all the other styles saved in it,
with name and description.

.. tip:: **Quickly share a layer style within the project**

   You can also share layer styles within a project without importing a file or
   database style: right-click on the layer in the :guilabel:`Layers Panel` and,
   from the :guilabel:`Styles` combo box , copy the style of a layer and paste it
   to a group or a selection of layers: the style is applied to all the layers
   that are of the same type (vector vs raster) as the original layer and, in
   the case of vector layers, have the same geometry type (point, line or polygon).

.. index:: Layer Definition File, qlr file
.. _layer_definition_file:

Layer definition file
---------------------

Layer definitions can be saved as a ``Layer Definition File``
(:file:`.qlr`) using
:menuselection:`Export --> Save As Layer Definition File...` in the
active layers' context menu.
A layer definition file (:file:`.qlr`) includes references to the
data source of the layers and their styles.
:file:`.qlr` files are shown in the Browser Panel and can be used to add
the layers (with the saved style) to the Layers Panel.
You can also drag and drop :file:`.qlr` files from the system file manager into the map
canvas.

.. index:: Variables, Expressions
.. _`general_tools_variables`:

Storing values in Variables
===========================

In QGIS, you can use variables to store useful recurrent values (e.g. the
project's title, or the user's full name) that can be used in expressions.
Variables can be defined at the application's global level, project level,
layer level, layout level, and layout item's level. Just like CSS
cascading rules, variables can be overwritten - e.g., a project level
variable will overwrite any application global level variables set with
the same name. You can use these variables to build text strings or other
custom expressions using the ``@`` character before the variable name. For
example in print layout creating a label with this content::

  This map was made using QGIS [% @qgis_version %]. The project file for this
  map is: [% @project_path %]

Will render the label like this::

  This map was made using QGIS 3.4.4-Madeira. The project file for this map is:
  /gis/qgis-user-conference-2019.qgs

Besides the :ref:`preset read-only variables <variables_functions>`, you can
define your own custom variables for any of the levels mentioned above. You can
manage:

* **global variables** from the :menuselection:`Settings --> Options` menu
* **project variables** from the :guilabel:`Project Properties` dialog (see
  :ref:`project_properties`)
* **vector layer variables** from the :guilabel:`Layer Properties` dialog
  (see :ref:`vector_properties_dialog`);
* **layout variables** from the :guilabel:`Layout` panel in the
  Print layout (see :ref:`layout_panel`);
* and **layout item variables** from the :guilabel:`Item Properties`
  panel in the Print layout (see :ref:`layout_item_options`).

To differentiate from editable variables, read-only variable names and
values are displayed in italic. On the other hand, higher level
variables overwritten by lower level ones are strike through.

.. _figure_variables_dialog:

.. figure:: img/options_variables.png
   :align: center

   Variables editor at the project level

.. note:: You can read more about variables and find some examples
   in Nyall Dawson's `Exploring variables in QGIS 2.12, part 1
   <https://nyalldawson.net/2015/12/exploring-variables-in-qgis-2-12-part-1/>`_,
   `part 2 <https://nyalldawson.net/2015/12/exploring-variables-in-qgis-pt-2-project-management/>`_
   and `part 3 <https://nyalldawson
   .net/2015/12/exploring-variables-in-qgis-pt-3-layer-level-variables/>`_
   blog posts.

.. _authentication:

Authentication
==============

QGIS has the facility to store/retrieve authentication credentials in a secure
manner. Users can securely save credentials into authentication configurations,
which are stored in a portable database, can be applied to server or database
connections, and are safely referenced by their ID tokens in project or settings
files. For more information see :ref:`authentication_index`.

A master password needs to be set up when initializing the authentication
system and its portable database.


.. _common_widgets:

Common widgets
==============

In QGIS, there are some options you'll often have to work with. For
convenience, QGIS provides you with special widgets that are presented below.

.. index:: Colors
.. _color-selector:

Color Selector
--------------

The color dialog
................

The :guilabel:`Select Color` dialog will appear whenever you click
the |selectColor| icon to choose a color. The features of this dialog
depend on the state of the :guilabel:`Use native color chooser dialogs` parameter
checkbox in :menuselection:`Settings --> Options... --> General`.
When checked, the color dialog used is the native one of the OS on which QGIS is running. Otherwise,
the QGIS custom color chooser is used.

The custom color chooser dialog has four different tabs which allow you to
select colors by |colorBox| :sup:`Color ramp`, |colorWheel| :sup:`Color wheel`,
|colorSwatches| :sup:`Color swatches` or |colorPicker| :sup:`Color picker`.
With the first two tabs, you can browse to all possible color combinations and
apply your choice to the item.

.. _figure_color_selector_ramp:

.. figure:: img/color_selector_ramp.png
   :align: center

   Color selector ramp tab


In the |colorSwatches| :sup:`Color swatches` tab, you can choose from a
list of color palettes (see :ref:`colors_options` for details).
All but the :guilabel:`Recent colors` palette can be modified with the
|signPlus| :sup:`Add current color` and |signMinus| :sup:`Remove selected color`
buttons at the bottom of the frame.

The :guilabel:`...` button next to the palette combo box also offers several
options to:

* copy, paste, import or export colors
* create, import or remove color palettes
* add the custom palette to the color selector widget with the :guilabel:`Show
  in Color Buttons` item (see figure_color_selector_)

.. _figure_color_selector_swatches:

.. figure:: img/color_selector_recent_colors.png
   :align: center

   Color selector swatches tab

.. index:: Color picker

Another option is to use the |colorPicker| :sup:`Color picker` which allows
you to sample a color from under your mouse cursor at any part of the QGIS UI or even
from another application: press the space bar while the tab is active, move the
mouse over the desired color and click on it or press the space bar again. You
can also click the :guilabel:`Sample Color` button to activate the picker.

Whatever method you use, the selected color is always described through color
sliders for ``HSV`` (Hue, Saturation, Value) and ``RGB`` (Red, Green, Blue)
values. The color is also identifiable in :guilabel:`HTML notation`.

Modifying a color is as simple as clicking on the color wheel or ramp or on any
of the color parameters sliders. You can adjust such parameters with the spinbox
beside or by scrolling the mouse wheel over the corresponding slider. You
can also type the color in HTML notation.
Finally, there is an :guilabel:`Opacity` slider to set transparency level.

The dialog also provides a visual comparison between the
:guilabel:`Old` color (applied to object) and the :guilabel:`Current` one (being selected).
Using drag-and-drop or pressing the |atlasNext| :sup:`Add color to
swatch` button, any of these colors can be saved in a slot for easy access.

.. _quick_color_modification:

.. tip:: **Quick color modification**

  Drag-and-drop a color selector widget onto another one to apply its color.


.. _color_widget:

The color drop-down shortcut
............................

Click the drop-down arrow to the right of the |selectColor| color button
to display a widget for quick color selection. This shortcut provides access
to:

* a color wheel to pick a color from
* an alpha slider to change color opacity
* the color palettes previously set to :guilabel:`Show in Color Buttons`
* copy the current color and paste it into another widget
* pick a color from anywhere on your computer display
* choose a color from the color selector dialog
* drag-and-drop the color from one widget to another for quick modification

.. note:: When the color widget is set to a :ref:`project color <project_colors>`
  through the data-defined override properties, the above functions for
  changing the color are unavailable. You'd first need to :guilabel:`Unlink color`
  or :guilabel:`Clear` the definition.

.. _figure_color_selector:

.. figure:: img/quick_color_selector.png
   :align: center

   Quick color selector menu


.. _color_ramp_widget:

The color ramp drop-down shortcut
.................................

Color ramps are a practical way to apply a set of colors to one or many features.
Their creation is described in the :ref:`color-ramp` section. As for the colors,
pressing the |selectColorRamp| color ramp button opens the corresponding color
ramp type dialog allowing you to change its properties.

.. _figure_colorBrewer_ramp:

.. figure:: img/color_ramp_brewer.png
   :align: center

   Customizing a colorbrewer ramp

The drop-down menu to the right of the button gives quick access to a
wider set of color ramps and options:

* :guilabel:`Invert Color Ramp`
* a preview of the ``gradient`` or ``catalog: cpt-city`` color ramps flagged as
  **Favorites** in the :guilabel:`Style Manager` dialog
* :guilabel:`All Color Ramps` to access the compatible color ramps database
* :guilabel:`Create New Color Ramp...` of any supported type that could be used
  in the current widget (note that this color ramp will not be available elsewhere
  unless you save it in the library)
* :guilabel:`Edit Color Ramp...`, the same as clicking the whole color ramp button
* :guilabel:`Save Color Ramp...`, to save the current color ramp with its
  customizations in the style library

.. _figure_color_ramp_widget:

.. figure:: img/quick_colorramp_selector.png
   :align: center

   Quick color ramp selection widget

.. index:: Symbol
.. _symbol_widget_selector:

Symbol Widget
--------------

The :guilabel:`Symbol` selector widget is a convenient shortcut when you want
to set symbol properties of a feature. Clicking the drop-down arrow shows the
following symbol options, together with the features of the
:ref:`color drop-down widget <color_widget>`:

* :guilabel:`Configure Symbol...`: the same as pressing the symbol selector widget.
  It opens a dialog to set the :ref:`symbol parameters <edit_symbol>`.
* :guilabel:`Copy Symbol` from the current item
* :guilabel:`Paste Symbol` to the current item, speeding configuration

.. index:: Font selection; Text format
.. _font_selector:

Font Selector
--------------

The :guilabel:`Font` selector widget is a convenient shortcut when you want to
set font properties for textual information (feature labels, decoration labels,
map legend text, ...). Clicking the drop-down arrow shows the following options:

.. _figure_fontselector_widget:

.. figure:: img/fontselector_widget.png
   :align: center

   Font selector drop-down menu

* :guilabel:`Font Size` in the associated unit
* :menuselection:`Recent Fonts -->` menu with the active font checked (at the top)
* :guilabel:`Configure Format...`: same as pressing the font selector widget. It
  opens a dialog to set text format parameters. Depending on the context, it can
  be the OS default :guilabel:`Text format` dialog or the QGIS custom dialog
  with advanced formatting options (opacity, orientation, buffer, background,
  shadow, ...) as described in section :ref:`text_format`.
* :guilabel:`Copy Format` of the text
* and :guilabel:`Paste Format` to the text, speeding configuration.


.. index:: Unit selection; Map scale
.. _unit_selector:

Unit Selector
--------------

Size properties of the items (labels, symbols, layout elements, ...) in QGIS are not
necessarily bound to either the project units or the units of a particular layer.
For a large set of properties, the :guilabel:`Unit` selector drop-down menu
allows you to tweak their values according to the rendering you want (based on
screen resolution, paper size, or the terrain). Available units are:

* :guilabel:`Millimeters`
* :guilabel:`Points`
* :guilabel:`Pixels`
* :guilabel:`Inches`
* :guilabel:`Meters at Scale`: This allows you to always set the size in meters,
  regardless of what the underlying map units are (e.g. they can be in inches, feet,
  geographic degrees, ...). The size in meters is calculated based on the current project
  ellipsoid setting and a projection of the distances in meters at the center of the
  current map extent.
* and :guilabel:`Map Units`: The size is scaled according to the map view scale.
  Because this can lead to too big or too small values, use the |options| button
  next to the entry to constrain the size to a range of values based on:

  * The :guilabel:`Minimum scale` and the :guilabel:`Maximum scale`: The value
    is scaled based on the map view scale until you reach any of these scale limits.
    Out of the range of scale, the value at the nearest scale limit is kept.
  * and/or The :guilabel:`Minimum size` and the :guilabel:`Maximum size` in ``mm``:
    The value is scaled based on the map view scale until it reaches any of these
    limits; Then the limit size is kept.

  .. _figure_adjust_scaling_units:

  .. figure:: img/adjust_scaling.png
     :align: center

     Adjust scaling range dialog


.. index::
   single: Rendering effects; Blending modes
.. _blend-modes:

Blending Modes
--------------

QGIS offers different options for special rendering effects with these tools that
you may previously only know from graphics programs. Blending modes can be applied
on layers and features, and also on print layout items:

* **Normal**: This is the standard blend mode, which uses the alpha channel of the top
  pixel to blend with the pixel beneath it. The colors aren't mixed.
* **Lighten**: This selects the maximum of each component from the foreground and
  background pixels. Be aware that the results tend to be jagged and harsh.
* **Screen**: Light pixels from the source are painted over the destination, while
  dark pixels are not. This mode is most useful for mixing the texture of one item
  with another item (such as using a hillshade to texture another layer).
* **Dodge**: Brighten and saturate underlying pixels based on the lightness
  of the top pixel. Brighter top pixels cause the saturation and brightness of
  the underlying pixels to increase. This works best if the top pixels aren't too
  bright. Otherwise the effect is too extreme.
* **Addition**: Adds pixel values of one item to the other.
  In case of values above the maximum value (in the case of RGB), white is displayed.
  This mode is suitable for highlighting features.
* **Darken**: Retains the lowest values of each component of the
  foreground and background pixels. Like lighten, the results tend to be jagged and harsh.
* **Multiply**: Pixel values of the top item are multiplied with
  the corresponding values for the bottom item. The results are darker.
* **Burn**: Darker colors in the top item cause the underlying items to darken.
  Burn can be used to tweak and colorize underlying layers.
* **Overlay**: Combines multiply and screen blending modes.
  Light parts become lighter and dark parts become darker.
* **Soft light**: Very similar to overlay, but instead of using multiply/screen
  it uses color burn/dodge. This is supposed to emulate shining a soft light onto an image.
* **Hard light**: Hard light is also very similar to the overlay mode. It's supposed
  to emulate projecting a very intense light onto an image.
* **Difference**: Subtracts the top pixel from the bottom pixel, or the other
  way around, in order always to get a positive value. Blending with black produces no change,
  as the difference with all colors is zero.
* **Subtract**: Subtracts pixel values of one item from the other.
  In the case of negative values, black is displayed.

.. index:: Data-defined override
.. _data_defined:

Data defined override setup
---------------------------

Next to many options in the vector layer properties dialog or settings in the print
layout, you will find a |dataDefined| :sup:`Data defined override` icon.
Using :ref:`expressions <vector_expressions>` based on layer attributes or item
settings, prebuilt or custom functions and :ref:`variables <general_tools_variables>`,
this tool allows you to set dynamic values for parameters. When enabled,
the value returned by this widget is applied to the parameter regardless of its normal
value (checkbox, textbox, slider...).

The data defined override widget
................................

Clicking the |dataDefined| :sup:`Data defined override` icon shows the following entries:

* :guilabel:`Description...` that indicates if the option is enabled, which input is
  expected, the valid input type and the current definition. Hovering over the
  widget also pops up this information.
* :guilabel:`Store data in the project`: a button allowing  the property to be stored
  using to the :ref:`vector_auxiliary_storage` mechanism.
* :guilabel:`Field type`: an entry to select from the layer's fields that match the
  valid input type.
* :guilabel:`Color`: when the widget is linked to a color property, this menu
  gives access to the colors defined as part of the current :ref:`project's
  colors <project_colors>` scheme.
* :guilabel:`Variable`: a menu to access the available user-defined :ref:`variables
  <general_tools_variables>`
* :guilabel:`Edit...` button to create or edit the expression to apply, using
  the :guilabel:`Expression String Builder` dialog. To help you correctly fill
  in the expression, a reminder of the expected output's format is provided in
  the dialog.
* :guilabel:`Paste` and :guilabel:`Copy` buttons.
* :guilabel:`Clear` button to remove the setup.
* For numeric and color properties, :guilabel:`Assistant...` to rescale
  how the feature data is applied to the property (more details :ref:`below
  <data_defined_assistant>`)

.. tip:: **Use right-click to (de)activate the data override**

 When the data-defined override option is set up correctly the
 icon is yellow |dataDefineOn| or |dataDefineExpressionOn|. If it is broken,
 the icon is red |dataDefineError| or |dataDefineExpressionError|.

 You can enable or disable a configured |dataDefined| :sup:`data-defined
 override` button by simply clicking the widget with the right mouse button.

.. _data_defined_assistant:

Using the data-defined assistant interface
..........................................

When the |dataDefined| :sup:`Data-defined override` button is associated with a
numeric or color parameter, it has an :guilabel:`Assistant...` option that
allows you to change how the data is applied to the parameter for each
feature. The assistant allows you to:

* Define the :guilabel:`Input` data, ie:

  * the attribute to represent, using the Field listbox or the |expression|
    :sup:`Set column expression` function (see :ref:`vector_expressions`)
  * the range of values to represent: you can manually enter the values or use
    the |draw| :sup:`Fetch value range from layer` button to fill
    these fields automatically with the minimum and maximum values returned by the chosen
    attribute or the expression applied to your data
* |unchecked| :guilabel:`Apply transform curve`: by default, output values (see
  below for setting) are applied to input features following a linear scale.
  You can override this logic: enable the transform option, click on the
  graphic to add break point(s) and drag the point(s) to apply a custom
  distribution.
* Define the :guilabel:`Output` values: the options vary according to the
  parameter to define. You can globally set:

  * the minimum and maximum values to apply to the selected property (n case
    of a color setting, you'll need to provide a :ref:`color ramp
    <color-ramp>`)
  * the :guilabel:`Scale method` of representation which can be **Flannery**,
    **Exponential**, **Surface** or **Radius**
  * the :guilabel:`Exponent` to use for data scaling
  * the output value or :ref:`color <color-selector>` to represent features
    with NULL values

When compatible with the property, a live-update preview is displayed in the
right-hand side of the dialog to help you control the value scaling.

.. _figure_symbology_size_assistant:

.. figure:: img/varying_size_assistant.png
   :align: center

   The data-defined size assistant

The values presented in the varying size assistant above will set the size
'Data-defined override' with:
::

 coalesce(scale_exp(Importance, 1, 20, 2, 10, 0.57), 1)


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |3d| image:: /static/common/3d.png
   :width: 1.5em
.. |addGrid| image:: /static/common/add_grid.png
   :width: 1.5em
.. |addGroup| image:: /static/common/mActionAddGroup.png
   :width: 1.5em
.. |addImage| image:: /static/common/mActionAddImage.png
   :width: 1.5em
.. |addMap| image:: /static/common/mActionAddMap.png
   :width: 1.5em
.. |allEdits| image:: /static/common/mActionAllEdits.png
   :width: 1.5em
.. |annotation| image:: /static/common/mActionAnnotation.png
   :width: 1.5em
.. |atlasNext| image:: /static/common/mActionAtlasNext.png
   :width: 1.5em
.. |calculateField| image:: /static/common/mActionCalculateField.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |collapseTree| image:: /static/common/mActionCollapseTree.png
   :width: 1.5em
.. |colorBox| image:: /static/common/mIconColorBox.png
   :width: 1.5em
.. |colorPicker| image:: /static/common/mIconColorPicker.png
   :width: 1.5em
.. |colorSwatches| image:: /static/common/mIconColorSwatches.png
   :width: 1.5em
.. |colorWheel| image:: /static/common/mIconColorWheel.png
   :width: 1.5em
.. |copyrightLabel| image:: /static/common/copyright_label.png
   :width: 1.5em
.. |dataDefineError| image:: /static/common/mIconDataDefineError.png
   :width: 1.5em
.. |dataDefineExpressionError| image:: /static/common/mIconDataDefineExpressionError.png
   :width: 1.5em
.. |dataDefineExpressionOn| image:: /static/common/mIconDataDefineExpressionOn.png
   :width: 1.5em
.. |dataDefineOn| image:: /static/common/mIconDataDefineOn.png
   :width: 1.5em
.. |dataDefined| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |dbManager| image:: /static/common/dbmanager.png
   :width: 1.5em
.. |deleteSelected| image:: /static/common/mActionDeleteSelected.png
   :width: 1.5em
.. |deselectAll| image:: /static/common/mActionDeselectAll.png
   :width: 1.5em
.. |draw| image:: /static/common/mActionDraw.png
   :width: 1.5em
.. |duplicateLayer| image:: /static/common/mActionDuplicateLayer.png
   :width: 1.5em
.. |editCopy| image:: /static/common/mActionEditCopy.png
   :width: 1.5em
.. |editableEdits| image:: /static/common/mIconEditableEdits.png
   :width: 1em
.. |expandNewTree| image:: /static/common/mActionExpandNewTree.png
   :width: 1.5em
.. |expandTree| image:: /static/common/mActionExpandTree.png
   :width: 1.5em
.. |expression| image:: /static/common/mIconExpression.png
   :width: 1.5em
.. |expressionFilter| image:: /static/common/mIconExpressionFilter.png
   :width: 1.5em
.. |expressionSelect| image:: /static/common/mIconExpressionSelect.png
   :width: 1.5em
.. |filePrint| image:: /static/common/mActionFilePrint.png
   :width: 1.5em
.. |filterMap| image:: /static/common/mActionFilterMap.png
   :width: 1.5em
.. |folder| image:: /static/common/mActionFolder.png
   :width: 1.5em
.. |formAnnotation| image:: /static/common/mActionFormAnnotation.png
   :width: 1.5em
.. |formSelect| image:: /static/common/mIconFormSelect.png
   :width: 1.5em
.. |formView| image:: /static/common/mActionFormView.png
   :width: 1.2em
.. |hideAllLayers| image:: /static/common/mActionHideAllLayers.png
   :width: 1.5em
.. |hideDeselectedLayers| image:: /static/common/mActionHideDeselectedLayers.png
   :width: 1.5em
.. |hideSelectedLayers| image:: /static/common/mActionHideSelectedLayers.png
   :width: 1.5em
.. |history| image:: /static/common/mActionHistory.png
   :width: 1.5em
.. |htmlAnnotation| image:: /static/common/mActionHtmlAnnotation.png
   :width: 1.5em
.. |identify| image:: /static/common/mActionIdentify.png
   :width: 1.5em
.. |identifyByFreehand| image:: /static/common/mActionIdentifyByFreehand.png
   :width: 1.5em
.. |identifyByPolygon| image:: /static/common/mActionIdentifyByPolygon.png
   :width: 1.5em
.. |identifyByRadius| image:: /static/common/mActionIdentifyByRadius.png
   :width: 1.5em
.. |identifyByRectangle| image:: /static/common/mActionIdentifyByRectangle.png
   :width: 1.5em
.. |inOverview| image:: /static/common/mActionInOverview.png
   :width: 1.5em
.. |indicatorBadLayer| image:: /static/common/mIndicatorBadLayer.png
   :width: 1.5em
.. |indicatorEmbedded| image:: /static/common/mIndicatorEmbedded.png
   :width: 1.5em
.. |indicatorFilter| image:: /static/common/mIndicatorFilter.png
   :width: 1.5em
.. |indicatorMemory| image:: /static/common/mIndicatorMemory.png
   :width: 1.5em
.. |indicatorNoCRS| image:: /static/common/mIndicatorNoCRS.png
   :width: 1.5em
.. |invertSelection| image:: /static/common/mActionInvertSelection.png
   :width: 1.5em
.. |labeling| image:: /static/common/labelingSingle.png
   :width: 1.5em
.. |mapIdentification| image:: /static/common/mActionMapIdentification.png
   :width: 1.5em
.. |measure| image:: /static/common/mActionMeasure.png
   :width: 1.5em
.. |measureAngle| image:: /static/common/mActionMeasureAngle.png
   :width: 1.5em
.. |measureArea| image:: /static/common/mActionMeasureArea.png
   :width: 1.5em
.. |messageLog| image:: /static/common/mMessageLog.png
   :width: 1.5em
.. |newBookmark| image:: /static/common/mActionNewBookmark.png
   :width: 1.5em
.. |northArrow| image:: /static/common/north_arrow.png
   :width: 1.5em
.. |openTable| image:: /static/common/mActionOpenTable.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |osx| image:: /static/common/osx.png
   :width: 1em
.. |pan| image:: /static/common/mActionPan.png
   :width: 1.5em
.. |rasterHistogram| image:: /static/common/rasterHistogram.png
   :width: 1.5em
.. |removeLayer| image:: /static/common/mActionRemoveLayer.png
   :width: 1.5em
.. |scaleBar| image:: /static/common/mActionScaleBar.png
   :width: 1.5em
.. |selectAll| image:: /static/common/mActionSelectAll.png
   :width: 1.5em
.. |selectColor| image:: /static/common/selectcolor.png
.. |selectColorRamp| image:: /static/common/selectcolorramp.png
.. |selectFreehand| image:: /static/common/mActionSelectFreehand.png
   :width: 1.5em
.. |selectNumber| image:: /static/common/selectnumber.png
   :width: 2.8em
.. |selectPolygon| image:: /static/common/mActionSelectPolygon.png
   :width: 1.5em
.. |selectRadius| image:: /static/common/mActionSelectRadius.png
   :width: 1.5em
.. |selectRectangle| image:: /static/common/mActionSelectRectangle.png
   :width: 1.5em
.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |sharing| image:: /static/common/mActionSharing.png
   :width: 1.5em
.. |sharingExport| image:: /static/common/mActionSharingExport.png
   :width: 1.5em
.. |sharingImport| image:: /static/common/mActionSharingImport.png
   :width: 1.5em
.. |showAllLayers| image:: /static/common/mActionShowAllLayers.png
   :width: 1.5em
.. |showBookmarks| image:: /static/common/mActionShowBookmarks.png
   :width: 1.5em
.. |showMapTheme| image:: /static/common/mActionShowPresets.png
   :width: 1.5em
.. |showSelectedLayers| image:: /static/common/mActionShowSelectedLayers.png
   :width: 1.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |stylePreset| image:: /static/common/stylepreset.png
   :width: 1.5em
.. |svgAnnotation| image:: /static/common/mActionSvgAnnotation.png
   :width: 1.5em
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
.. |textAnnotation| image:: /static/common/mActionTextAnnotation.png
   :width: 1.5em
.. |titleLabel| image:: /static/common/title_label.png
   :width: 1.5em
.. |toggleEditing| image:: /static/common/mActionToggleEditing.png
   :width: 1.5em
.. |transparency| image:: /static/common/transparency.png
   :width: 1.5em
.. |unchecked| image:: /static/common/checkbox_unchecked.png
   :width: 1.3em
.. |zoomActual| image:: /static/common/mActionZoomActual.png
   :width: 1.5em
.. |zoomIn| image:: /static/common/mActionZoomIn.png
   :width: 1.5em
.. |zoomOut| image:: /static/common/mActionZoomOut.png
   :width: 1.5em
.. |zoomToBookmark| image:: /static/common/mActionZoomToBookmark.png
   :width: 1.5em
.. |zoomToLayer| image:: /static/common/mActionZoomToLayer.png
   :width: 1.5em
