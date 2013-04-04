.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. `general_tools`:

*************
General Tools
*************

.. _`shortcuts`:

Keyboard shortcuts
==================

.. index::
   single:Keyboard shortcuts

QGIS provides default keyboard shortcuts for many features. You find them in
Section :ref:`label_menubar`. Additionally the menu option
:menuselection:`Settings --> Configure Shortcuts` allows to
change the default keyboard shortcuts and to add new keyboard shortcuts to QGIS
features.

.. _figure_shortcuts:

.. only:: html

   **Figure Shortcuts 1:**

.. figure:: /static/user_manual/introduction/shortcuts.png
   :align: center
   :width: 20em

   Define shortcut options |nix| (KDE)

Configuration is very simple. Just select a feature from the list and click
on **[Change]**, **[Set none]** or **[Set default]**. Once you
have found your configuration, you can save it as XML file and load it to another
QGIS installation.

.. _`context_help`:

Context help
============

.. index::
   single:Context help

When you need help on a specific topic, you can access context help via the
:guilabel:`Help` button available in most dialogs - please note that third-party
plugins can point to dedicated web pages.

.. _`redraw_events`:

Rendering
=========
.. index::
   single:Rendering

By default, QGIS renders all visible layers whenever the map canvas must be
refreshed. The events that trigger a refresh of the map canvas include:

*  Adding a layer
*  Panning or zooming
*  Resizing the QGIS window
*  Changing the visibility of a layer or layers

QGIS allows you to control the rendering process in a number of ways.

.. `label_scaledepend`:

Scale Dependent Rendering
-------------------------
.. index::
   single:Rendering scale dependent

Scale dependent rendering allows you to specify the minimum and maximum
scales at which a layer will be visible.  To set scale dependency rendering,
open the :guilabel:`Properties` dialog by double-clicking on the layer in the
legend. On the :guilabel:`General` tab, set the minimum and maximum scale values and
then click on the |checkbox|:guilabel:`Use scale dependent rendering` checkbox.

You can determine the scale values by first zooming to the level you want
to use and noting the scale value in the QGIS status bar.

.. index::
   single:Scale

.. _`label_controlmap`:

Controlling Map Rendering
-------------------------

Map rendering can be controlled in the following ways:

.. _`label_suspendrender`:

Suspending Rendering
.......................

.. index::`rendering!suspending`

To suspend rendering, click the |checkbox| :guilabel:`Render` checkbox in the lower right
corner of the statusbar. When the |checkbox| :guilabel:`Render` checkbox is not checked, QGIS
does not redraw the canvas in response to any of the events described in
Section :ref:`redraw_events`. Examples of when you might want to suspend
rendering include:

* Add many layers and symbolize them prior to drawing
* Add one or more large layers and set scale dependency before drawing
* Add one or more large layers and zoom to a specific view before drawing
* Any combination of the above

Checking the |checkbox| :guilabel:`Render` checkbox enables rendering and causes an immediate
refresh of the map canvas.

.. _`label_settinglayer`:

Setting Layer Add Option
...........................

.. index::`rendering!options`
.. index::`layers!initial visibility`

You can set an option to always load new layers without drawing them. This
means the layer will be added to the map, but its visibility checkbox in the
legend will be unchecked by default. To set this option, choose
menu option :menuselection:`Settings --> Options -->` and click on the
:guilabel:`Rendering` tab. Uncheck the |checkbox| :guilabel:`By default new layers
added to the map should be displayed` checkbox. Any layer added to the map will
be off (invisible) by default.

Stopping Rendering
..................

.. index::
   single:Rendering halting

.. _label_stoprender:

To stop the map drawing, press the :kbd:`ESC` key. This will halt the refresh of
the map canvas and leave the map partially drawn. It may take a bit of time
between pressing :kbd:`ESC` and the time the map drawing is halted.

.. note::
   It is currently not possible to stop rendering - this was disabled
   in qt4 port because of User Interface (UI) problems and crashes.

.. _`label_updatemap`:

Updating the Map Display During Rendering
............................................

.. index::
   single:rendering update during drawing

You can set an option to update the map display as features are drawn. By
default, QGIS does not display any features for a layer until the entire
layer has been rendered. To update the display as features are read from the
datastore, choose menu option :menuselection:`Settings --> Options`
click on the :guilabel:`Rendering` tab. Set the feature count to an
appropriate value to update the display during rendering. Setting a value of 0
disables update during drawing (this is the default). Setting a value too low
will result in poor performance as the map canvas is continually updated
during the reading of the features. A suggested value to start with is 500.

.. _`label_renderquality`:

Influence Rendering Quality
..............................

.. index::
   single:rendering quality

To influence the rendering quality of the map you have 2 options. Choose menu
option :menuselection:`Settings --> Options` click on the :guilabel:`Rendering`
tab and select or deselect following checkboxes.


* |checkbox| :guilabel:`Make lines appear less jagged at the expense of some
  drawing performance`
* |checkbox| :guilabel:`Fix problems with incorrectly filled polygons`

.. _`sec_measure`:

Measuring
=========
.. index::
   single:measure

Measuring works within projected coordinate systems (e.g., UTM) and
unprojected data. If the loaded map is defined with a geographic coordinate system
(latitude/longitude), the results from line or area measurements will be
incorrect. To fix this you need to set an appropriate map coordinate system
(See Section :ref:`label_projections`). All measuring modules also use the
snapping settings from the digitizing module. This is useful, if you want to
measure along lines or areas in vector layers.

To select a measure tool click on |mActionMeasure| and select the tool you want
to use.

Measure length, areas and angles
--------------------------------

.. index::
   single:measure;line length
.. index::
   single:measure;areas
.. index::
   single:measure;angles

|mActionMeasure| QGIS is able to measure real distances between given points
according to a defined ellipsoid. To configure this, choose menu option
:menuselection:`Settings --> Options`, click on the :guilabel:`Map tools` tab and
choose the appropriate ellipsoid. There you can also define a rubberband color
and your preferred measurement units (meters or feet) and angle units (degrees,
radians and gon). The tools then allows you to click points on the map. Each
segment-length as well as the total shows up in the measure-window. To stop
measuring click your right mouse button.

.. _figure_measure_length:

.. only:: html

   **Figure Measure 1:**

.. figure:: /static/user_manual/introduction/measure_line.png
   :align: center
   :width: 15em

   Measure Distance |nix| (KDE)

|mActionMeasureArea| Areas can also be measured.  In the measure window the
accumulated area size appears. In addition, the measuring tool will snap to the
currently selected layer, provided that layer has its snapping tolerance set.
(See Section :ref:`snapping_tolerance`).  So if you want to measure exactly along
a line feature, or around a polygon feature, first set its snapping tolerance,
then select the layer. Now, when using the measuring tools, each mouse click
(within the tolerance setting) will snap to that layer.

.. _figure_measure_area:

.. only:: html

   **Figure Measure 2:**

.. figure:: /static/user_manual/introduction/measure_area.png
   :align: center
   :width: 15em

   Measure Area |nix| (KDE)

|mActionMeasureAngle| You can also measure angles, selecting Measure Angle tool.
The cursor becomes cross-shaped. Click to draw the first segment of the angle you
wish to measure, then move the the cursor to draw the desired angle. The measure
is displayed in a popup dialog.

.. _figure_measure_angle:

.. only:: html

   **Figure Measure 3:**

.. figure:: /static/user_manual/introduction/measure_angle.png
   :align: center
   :width: 15em

   Measure Angle |nix| (KDE)

.. _`sec_selection`:

Select and deselect features
----------------------------

The QGIS toolbar provides several tools to select features in the map canvas.
To select one or several features just click on
|mActionSelect| and select your tool:

* |mActionSelect| :sup:`Select single feature`
* |mActionSelectRectangle| :sup:`Select features by rectangle`
* |mActionSelectPolygon| :sup:`Select features by polygon`
* |mActionSelectFreehand| :sup:`Select features by freehand`
* |mActionSelectRadius| :sup:`Select features by radius`

To deselect all selected features click on |mActionDeselectAll| :sup:`Deselect
features from all layers`.


.. _decorations:

Decorations
===========


The Decorations of QGIS includes the Copyright Label, the North Arrow and
the Scale Bar. They are used to 'decorate' the map by adding cartographic
elements.

.. note::
   Before QGIS 1.8 the same functionality was provided by the Decoration
   Plugin.


Copyright Label
---------------


|copyright_label| :guilabel:`Copyright label` adds a Copyright label
using the text you prefer to the map.

.. _figure_decorations_1:

.. only:: html

   **Figure Decorations 1:**

.. figure:: /static/user_manual/introduction/copyright.png
   :align: center
   :width: 15em

   The copyright Dialog |nix|


#.  Select from menu :menuselection:`View --> Decorations --> Copyright Label`.
    The dialog starts (see figure_decorations_1_).
#.  Enter the text you want to place on the map. You can use HTML as
    shown in the example
#.  Choose the placement of the label from the :guilabel:`Placement`
    'Bottom Right' drop-down box
#.  Make sure the |checkbox| :guilabel:`Enable Copyright Label` checkbox is
    checked
#.  Click **[OK]**


In the example above (default) QGIS places a copyright symbol followed by the
date in the lower right hand corner of the map canvas.


North Arrow
-----------


|north_arrow| :guilabel:`North Arrow` places a simple north arrow on the
map canvas. At present there is only one style available. You can adjust the
angle of the arrow or let QGIS set the direction automatically. If you choose
to let QGIS determine the direction, it makes its best guess as to how the
arrow should be oriented. For placement of the arrow you have four options,
corresponding to the four corners of the map canvas.

.. _figure_decorations_2:

.. only:: html

   **Figure Decorations 2:**

.. figure:: /static/user_manual/introduction/north_arrow_dialog.png
   :align: center
   :width: 20em

   The North Arrow Dialog |nix|


Scale Bar
---------


|scale_bar| :guilabel:`Scale Bar` adds a simple scale bar to the map
canvas. You control the style and placement, as well as the labeling of the bar.

.. _figure_decorations_3:

.. only:: html

   **Figure Decorations 3:**

.. figure:: /static/user_manual/introduction/scale_bar_dialog.png
   :align: center
   :width: 20em

   The Scale Bar Dialog |nix|


QGIS only supports displaying the scale in the same units as your map frame.
So if the units of your layers are in meters, you can't create a scale bar in
feet. Likewise if you are using decimal degrees, you can't create a scale
bar to display distance in meters.

To add a scale bar:


#.  Select from menu :menuselection:`View --> Decorations --> Scale Bar`
    The dialog starts (see figure_decorations_3_)
#.  Choose the placement from the :guilabel:`Placement` 'Bottom Left'
    drop-down list
#.  Choose the style from the :guilabel:`Scale bar style` 'Tick Down' list
#.  Select the color for the bar :guilabel:`Color of bar` 'black' or use
    the default black color
#.  Set the size of the bar and its label :guilabel:`Size of bar` '30 degrees'
#.  Make sure the |checkbox| :guilabel:`Enable scale bar` checkbox is checked
#.  Optionally choose to automatically snap to a round number when the
    canvas is resized |checkbox| :guilabel:`Automatically snap to round number
    on resize`
#.  Click **[OK]**


.. tip::

   **Settings of Decorations**

   When you save a .qgs project, any changes you have made to NorthArrow,
   ScaleBar and Copyright will be saved in the project and restored
   the next time you load the project.

.. _`sec_annotations`:

.. index::
   single: annotation

Annotation Tools
================


The |mActionTextAnnotation| :guilabel:`Text Annotation` tools in the attribute toolbar
provides the possibility to place formatted text in a balloon on the QGIS map
canvas. Use the :guilabel:`Text Annotation` tool and click into the map canvas.

.. _annotation:

.. only:: html

   **Figure annotation 1:**

.. figure:: /static/user_manual/introduction/annotation.png
   :align: center
   :width: 25em

   Annotation text dialog |nix|

Double click on the item opens a dialog with various options. There is the
text editor to enter the formatted text and other item settings. E.g. there
is the choice of having the item placed on a map position (displayed by
a marker symbol) or to have the item on a screen position (not related
to the map). The item can be moved by map position (drag the map marker)
or by moving only the balloon. The icons are part of GIS theme, and are used
by default in the other themes too.

The |mActionAnnotation| :guilabel:`Move Annotation` tool allows to move the annotation on the
map canvas.

Form annotations
----------------

.. index::`annotations`
.. index::`form annotation|\see{annotations}`

Additionally you can also create your own annotation forms. The
|mActionFormAnnotation| :guilabel:`Form Annotation` tool is useful to display attributes of
a vector layer in a customized qt designer form (see figure_custom_annotation_). It is similar to the
designer forms for the
:guilabel:`Identify features` tool, but displayed in an annotation item.
Also see QGIS blog http://blog.qgis.org/node/143 for more information.

.. _figure_custom_annotation:

.. only:: html

   **Figure annotation 2:**

.. figure:: /static/user_manual/introduction/custom_annotation.png
   :align: center
   :width: 25em

   Customized qt designer annotation form |nix|

.. note::
   If you press :kbd:`Ctrl+T` while an :guilabel:`Annotation` tool is active
   (move annotation, text annotation, form annotation), the visibility states
   of the items are inverted.

.. _`sec_bookmarks`:

Spatial Bookmarks
=================

.. index::
   single:bookmarks
.. index::
   single:spatial bookmarks;see bookmarks

Spatial Bookmarks allow you to "bookmark" a geographic location and return to
it later.

Creating a Bookmark
-------------------

To create a bookmark:

#. Zoom or pan to the area of interest.
#. Select the menu option :menuselection:`View --> New Bookmark` or press :kbd:`Ctrl-B`.
#. Enter a descriptive name for the bookmark (up to 255 characters).
#. Press :kbd:`Enter` to add the bookmark or **[Delete]** to remove the bookmark.

Note that you can have multiple bookmarks with the same name.

Working with Bookmarks
----------------------

To use or manage bookmarks, select the menu option
:menuselection:`View --> Show Bookmarks`. The
:guilabel:`Geospatial Bookmarks` dialog allows you to zoom to or delete a
bookmark. You can not edit the bookmark name or coordinates.

Zooming to a Bookmark
---------------------

From the :guilabel:`Geospatial Bookmarks` dialog, select the desired
bookmark by clicking on it, then click **[Zoom To]**.
You can also zoom to a bookmark by double-clicking on it.

Deleting a Bookmark
-------------------

To delete a bookmark from the :guilabel:`Geospatial Bookmarks`
dialog, click on it then click **[Delete]**.
Confirm your choice by clicking **[Yes]** or cancel the
delete by clicking **[No]**.

.. _nesting_projects:

Nesting Projects
================

.. index:: nesting projects

If you want to embed content from other project files into your project you can choose
:menuselection:`Layer --> Embed Layers and Groups`.

Embedding layers
----------------

The following dialog allows you to embed layers from other projects:

#. Press |browsebutton| to look for another project from the Alaska dataset.
#. Select the project file grassland. You can see the content of the project (see figure_embed_dialog_).
#. Press :kbd:`Ctrl` and klick on the layers grassland and regions.
   The layers are embedded in the map legend and the map view now.

.. _figure_embed_dialog:

.. only:: html

   **Figure Nesting 1:**

.. figure:: /static/user_manual/introduction/embed_dialog.png
   :align: center
   :width: 20em

   Select layers and groups to embed |nix|

While the embedded layers are editable you can't change it's properties like Style and Labeling.

**Removing embedded layers**

Right-click on the embedded layer and choose |mActionRemoveLayer| :menuselection:`Remove` .

