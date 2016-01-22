|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not up-to-date with release

.. _general_tools:

*************
General Tools
*************

.. _`shortcuts`:

Keyboard shortcuts
==================

.. index::
   single:Keyboard shortcuts

|qg| provides default keyboard shortcuts for many features. You can find them in
section :ref:`label_menubar`. Additionally, the menu option
:menuselection:`Settings --> Configure Shortcuts...` allows you to change the default
keyboard shortcuts and add new keyboard shortcuts to |qg| features.

.. _figure_shortcuts:

.. only:: html

   **Figure Shortcuts 1:**

.. figure:: /static/user_manual/introduction/shortcuts.png
   :align: center

   Define shortcut options

Configuration is very simple. Just select a feature from the list and click
on :

* **[Change]** and press the new combination you want to assign as new shortcut
* **[Set none]** to clear any assigned shortcut
* or **[Set default]** to backup the shortcut to its original and default value.

Once you have finished your configuration, you can save it as an XML file
and load it to another |qg| installation.

.. _`context_help`:

Context help
============

.. index::
   single:Context help

When you need help on a specific topic, you can access context help via the
**[Help]** button available in most dialogs --- please note that third-party
plugins can point to dedicated web pages.

.. _`redraw_events`:

Rendering
=========

.. index::
   single:Rendering

By default, |qg| renders all visible layers whenever the map canvas is
refreshed. The events that trigger a refresh of the map canvas include:

*  Adding a layer
*  Panning or zooming
*  Resizing the |qg| window
*  Changing the visibility of a layer or layers

|qg| allows you to control the rendering process in a number of ways.

.. _`label_scaledepend`:

Scale Dependent Rendering
-------------------------
.. index::
   single:Rendering scale dependent

Scale-dependent rendering allows you to specify the minimum and maximum scales
at which a layer will be visible. To set scale-dependent rendering, open the
:guilabel:`Properties` dialog by double-clicking on the layer in the legend. On
the :guilabel:`General` tab, click on the |checkbox| :guilabel:`Scale
dependent visibility` checkbox to activate the feature, then set the minimum and
maximum scale values.

You can determine the scale values by first zooming to the level you want to
use and noting the scale value in the |qg| status bar.

.. index::
   single:Scale

.. _`label_controlmap`:

Controlling Map Rendering
-------------------------

Map rendering can be controlled in the various ways, as described below.

.. _`label_suspendrender`:

Suspending Rendering
....................

.. index::`rendering!suspending`

To suspend rendering, click the |checkbox| :guilabel:`Render` checkbox in the
lower right corner of the status bar. When the |checkbox| :guilabel:`Render`
checkbox is not checked, |qg| does not redraw the canvas in response to any of
the events described in section :ref:`redraw_events`. Examples of when you
might want to suspend rendering include:

* Adding many layers and symbolizing them prior to drawing
* Adding one or more large layers and setting scale dependency before drawing
* Adding one or more large layers and zooming to a specific view before drawing
* Any combination of the above

Checking the |checkbox| :guilabel:`Render` checkbox enables rendering and
causes an immediate refresh of the map canvas.

.. _`label_settinglayer`:

Setting Layer Add Option
........................

.. index::`rendering!options`
.. index::`layers!initial visibility`

You can set an option to always load new layers without drawing them. This
means the layer will be added to the map, but its visibility checkbox in the
legend will be unchecked by default. To set this option, choose menu option
:menuselection:`Settings --> Options` and click on the :guilabel:`Rendering`
tab. Uncheck the |checkbox| :guilabel:`By default new layers added to the map
should be displayed` checkbox. Any layer subsequently added to the map will be off
(invisible) by default.

Stopping Rendering
..................

.. index::
   single:Rendering halting

.. _label_stoprender:

To stop the map drawing, press the :kbd:`ESC` key. This will halt the refresh of
the map canvas and leave the map partially drawn. It may take a bit of time
between pressing :kbd:`ESC` and the time the map drawing is halted.

.. note::
   It is currently not possible to stop rendering --- this was disabled in the Qt4
   port because of User Interface (UI) problems and crashes.

.. _`label_renderquality`:

Influence Rendering Quality
...........................

.. index::
   single:rendering quality

|qg| has an option to influence the rendering quality of the map. Choose menu
option :menuselection:`Settings --> Options`, click on the :guilabel:`Rendering`
tab and select or deselect |checkbox| :guilabel:`Make lines appear less jagged
at the expense of some drawing performance`.

Speed-up rendering
..................

There are some settings that allow you to improve rendering speed. Open the |qg| options
dialog using :menuselection:`Settings --> Options`, go to the :guilabel:`Rendering`
tab and select or deselect the following checkboxes:

* |checkbox| :guilabel:`Use render caching where possible to speed up redraws`
* |checkbox| :guilabel:`Render layers in parallel using many CPU cores` and then
  set the |checkbox| :guilabel:`Max cores to use`.
* The map renders in the background onto a separate image and each
  |checkbox| :guilabel:`Map Update interval`, the content from this
  (off-screen) image will be taken to update the visible screen representation.
  However, if rendering finishes faster than this duration, it will be shown
  instantaneously.
* With |checkbox| :guilabel:`Enable Feature simplification by default for newly
  added layers`, you simplify features' geometry (less nodes) and as  a result,
  they quickly display.
  Be aware that you can also face rendering inconsistencies.


.. index:: Zoom_In Zoom_Out, Pan, Map_Navigation

.. _zoom-pan:

Zooming and Panning
====================

QGIS provides tools to zoom and pan to your area of interest.

Apart from using the |mActionPan| :sup:`pan` and |mActionZoomIn|
:sup:`zoom-in` / |mActionZoomOut| :sup:`zoom-out` icons on the toolbar
with the mouse, navigating can also be done with the mouse wheel, spacebar
and the arrow keys.

Zooming and panning with the mouse wheel
----------------------------------------

You can press the mouse wheel to pan inside of the main
window, and you can roll the mouse wheel to zoom in and out on the map.
For zooming, place the mouse cursor inside the map area and roll it forward
(away from you) to zoom in and backwards (towards you) to zoom out. The mouse
cursor position will be the center of the zoomed area of interest. You can
customize the behaviour of the mouse wheel zoom using the :guilabel:`Map tools`
tab under the :menuselection:`Settings -->` |mActionOptions|
:menuselection:`Options` menu.

Panning with the arrow keys
---------------------------

Panning the map is possible with the arrow keys.
Place the mouse cursor inside the map area, and click on the right arrow key
to pan east, left arrow key to pan west, up arrow key to pan north, and down
arrow key to pan south.

You can also use the space bar to temporarily cause mouse movements to pan
the map. The :kbd:`PgUp` and :kbd:`PgDown` keys on your keyboard will cause
the map display to zoom in or out.

.. _`sec_measure`:

Measuring
=========

.. index::
   single:measure

|qg| provides four means of measuring geometries:

* the interactive measurement tools |mActionMeasure|,
* measuring in the |mActionCalculateField| :sup:`Field Calculator`,
* derived measures in the :ref:`identify` tool,
* and a vector analysis tool: :menuselection:`Vector --> Geometry Tools -->
  Export/Add Geometry Columns`

Measuring works within projected coordinate systems (e.g., UTM) and unprojected
data. The first three measuring tools behave equally to global project settings:

If "on the fly" CRS transformation is enabled, the default measurement metric is
- different from most other GIS - ellipsoidal, using the ellipsoid defined in
:menuselection:`File --> Project properties --> General`. This is true both
when geographic and projected coordinate systems are defined for the project.
If you want to calculate the projected / planimetric area or distance using cartesian
maths, the measurement ellipsoid has to be set to "None / Planimetric"
(:menuselection:`File --> Project properties --> CRS`). However,
with a geographic (= unprojected) CRS defined for the data and project, area and
distance measurement will be ellipsoidal.
If "on the fly" CRS transformation is disabled, the measurement metric is planimetric
when the project coordinate system is projected and ellipsoidal when the project
coordinate system is unprojected / geographic.

However, neither the identify tool nor the field calculator will transform your
data to the project CRS before measuring. If you want to achieve this, you have
to use the vector analysis tool: :menuselection:`Vector --> Geometry Tools -->
Export/Add Geometry Columns`. Here, measurement is by default planimetric except
if you choose the ellipsoidal measure.

Measure length, areas and angles interactive
----------------------------------------------

All measuring modules use the snapping settings from the digitizing module.
This is useful, if you want to measure along lines or areas in vector layers.

To select a measuring tool, click on |mActionMeasure| and select the tool you want
to use.

.. index::
   single:measure;line length
.. index::
   single:measure;areas
.. index::
   single:measure;angles

By default, |mActionMeasure| :sup:`Measure Line`: |qg| measures real distances
between given points according to a defined ellipsoid. You can define a rubberband
color and your preferred measurement units (meters or feet) and angle units
(degrees, radians and gon) in the menu option
:menuselection:`Settings --> Options --> Map Tools`.
The tool then allows you to click points on the map. Each segment length,
as well as the total, shows up in the measure window.
To stop measuring, click your right mouse button.
Note that you can interactively change the measurement units in the measurement
dialog. It overrides the :guilabel:`Preferred measurement units` in the options.
There is an info section in the dialog that shows which CRS settings are being
used during measurement calculations.

.. _figure_measure_length:

.. only:: html

   **Figure Measure 1:**

.. figure:: /static/user_manual/introduction/measure_line.png
   :align: center

   Measure Distance

|mActionMeasureArea| :sup:`Measure Area`: Areas can also be measured. In the
measure window, the accumulated area size appears. In addition, the measuring
tool will snap to the currently selected layer, provided that layer has its
snapping tolerance set (see section :ref:`snapping_tolerance`). So, if you want
to measure exactly along a line feature, or around a polygon feature, first set
its snapping tolerance, then select the layer. Now, when using the measuring
tools, each mouse click (within the tolerance setting) will snap to that layer.

.. _figure_measure_area:

.. only:: html

   **Figure Measure 2:**

.. figure:: /static/user_manual/introduction/measure_area.png
   :align: center

   Measure Area

|mActionMeasureAngle| :sup:`Measure Angle`: You can also measure angles. The
cursor becomes cross-shaped. Click to draw the first segment of the angle you
wish to measure, then move the cursor to draw the desired angle. The measure
is displayed in a pop-up dialog.

.. _figure_measure_angle:

.. only:: html

   **Figure Measure 3:**

.. figure:: /static/user_manual/introduction/measure_angle.png
   :align: center

   Measure Angle

.. _`sec_selection`:

Select and deselect features
============================

The |qg| toolbar provides several tools to select features in the map canvas.
To select one or several features, just click on |mActionSelect| and select your
tool:

* |mActionSelectRectangle| :sup:`Select Features by area or single click` to
  select feature(s) either by simple click or by rectangle
* |mActionSelectPolygon| :sup:`Select Features by Polygon`
* |mActionSelectFreehand| :sup:`Select Features by Freehand`
* |mActionSelectRadius| :sup:`Select Features by Radius`

To deselect all selected features, click on |mActionDeselectAll| :sup:`Deselect
Features from All Layers`.

|mIconExpressionSelect| :sup:`Select features using an expression` allows user
to select features using expression dialog. See :ref:`vector_expressions`
chapter for some example.

Users can save selected features into a **New Memory Vector Layer** or a
**New Vector Layer** using :menuselection:`Edit --> Copy Features` and
:menuselection:`Edit --> Paste Features as` in the wanted format.

.. _`identify`:

Identify features
=================

.. index::
   single:Identify features

The Identify tool allows you to interact with the map canvas and get information
on features in a pop-up window. To identify features, use :menuselection:`View --> Identify
features` or press :kbd:`Ctrl + Shift + I`, or click on the |mActionIdentify|
:sup:`Identify features` icon in the Menu toolbar.

|qg| offers two ways to identify features with the |mActionIdentify|
:sup:`Identify features`:

* **left click** will identify features according to the mode set in the
  :guilabel:`Identify results` panel
* **right click** will fetch all the snapped features from all the visible layers.
  This will open a context menu, allowing the user to choose more precisely the
  features to identify.

If you click on feature, the :guilabel:`Identify results` dialog will list
informations about the clicked feature(s). The default view is a tree view where
the first item is the name of the layer and its children are its identified feature(s).
Each feature is described by the name of a field with its value.
This field is the one set in :menuselection:`Properties --> Display`.
Then follow all the other informations about the feature.

This window can be customized to display custom fields, but by default it will
display three kinds of information:

* Actions: Actions can be added to the identify feature windows. When clicking
  on the action label, action will be run. By default, only one action is added,
  to view feature form for editing. You can define more actions in the layer's
  properties dialog.
* Derived: This information is calculated or derived from other information.
  You can find clicked coordinate, X and Y coordinates, area in map units and
  perimeter in map units for polygons, length in map units for lines and feature
  ids.
* Data attributes: This is the list of attribute fields from the data.

.. _figure_identify:

.. only:: html

   **Figure Identify 1:**

.. figure:: /static/user_manual/introduction/identify_features.png
   :align: center

   Identify features dialog

At the top of the window, you have five icons:

* |mActionExpandTree| :sup:`Expand tree`
* |mActionCollapseTree| :sup:`Collapse tree`
* |mActionExpandNewTree| :sup:`Default behaviour` to define whether next
  identified features informations should be collapsed or expanded
* |mActionPropertyItem| :sup:`View the feature form`
* |mActionDeselectAll| :sup:`Clear Results`
* |mActionEditCopy| :sup:`Copy selected feature to clipboard`
* |mActionFilePrint| :sup:`Print selected HTML response`

At the bottom of the window, you have the :guilabel:`Mode` and :guilabel:`View`
comboboxes.
With the :guilabel:`Mode` combobox you can define from which layers features
should be identified:

* 'Current layer' : only features from the selected layer are identified. The
  layer may not be visible in the canvas.
* 'Top down, stop at first': for only features from the upper visible layer
* 'Top down': for all features from the visible layers. The results are shown in
  the panel.
* and 'Layer selection': opens a context menu where user selects the layer to
  identify features from. Operates like a right-click. Only the choosen features
  will be shown in the result panel.

The :guilabel:`View` can be set as 'Tree', 'Table' and 'Graph'.
'Table' and 'Graph' views can only be set for raster layers.

The identify tool allows you to |checkbox|:guilabel:`auto open a form`.
If checked, each time a single feature is identified |qg| will open a form
showing its attributes. This is a handy way to quickly edit feature's attributes.


Other functions can be found in the context menu of the identified item. For
example, from the context menu you can:

* View the feature form
* Zoom to feature
* Copy feature: Copy all feature geometry and attributes
* Toggle feature selection: adds identified feature to selection
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

.. _decorations:

Decorations
===========

The Decorations of |qg| include the Grid, the Copyright Label, the North Arrow
and the Scale Bar. They are used to 'decorate' the map by adding cartographic
elements.

Grid
----

|transformed| :sup:`Grid` allows you to add a coordinate grid and coordinate
annotations to the map canvas.

.. _figure_decorations_1:

.. only:: html

   **Figure Decorations 1:**

.. figure:: /static/user_manual/introduction/grid_dialog.png
   :align: center

   The Grid Dialog

#.  Select from menu :menuselection:`View --> Decorations --> Grid`.
    The dialog starts (see figure_decorations_1_).
#.  Activate the |checkbox| :guilabel:`Enable grid` checkbox and set grid
    definitions according to the layers loaded in the map canvas.
#.  Activate the |checkbox| :guilabel:`Draw annotations` checkbox and set
    annotation definitions according to the layers loaded in the map canvas.
#.  Click **[Apply]** to verify that it looks as expected.
#.  Click **[OK]** to close the dialog.

Copyright Label
---------------

|copyright_label| :sup:`Copyright label` adds a copyright label using the text
you prefer to the map.

.. _figure_decorations_2:

.. only:: html

   **Figure Decorations 2:**

.. figure:: /static/user_manual/introduction/copyright.png
   :align: center

   The Copyright Dialog


#.  Select from menu :menuselection:`View --> Decorations --> Copyright Label`.
    The dialog starts (see figure_decorations_2_).
#.  Enter the text you want to place on the map. You can use HTML as
    shown in the example.
#.  Choose the placement of the label from the :guilabel:`Placement`
    |selectstring| combo box.
#.  Make sure the |checkbox| :guilabel:`Enable Copyright Label` checkbox is
    checked.
#.  Click **[OK]**.

In the example above, which is the default, |qg| places a copyright symbol
followed by the date in the lower right-hand corner of the map canvas.

North Arrow
-----------

|north_arrow| :sup:`North Arrow` places a simple north arrow on the map canvas.
At present, there is only one style available. You can adjust the angle of the
arrow or let |qg| set the direction automatically. If you choose to let |qg|
determine the direction, it makes its best guess as to how the arrow should be
oriented. For placement of the arrow, you have four options, corresponding to
the four corners of the map canvas.

.. _figure_decorations_3:

.. only:: html

   **Figure Decorations 3:**

.. figure:: /static/user_manual/introduction/north_arrow_dialog.png
   :align: center

   The North Arrow Dialog


Scale Bar
---------

|scale_bar| :sup:`Scale Bar` adds a simple scale bar to the map canvas. You
can control the style and placement, as well as the labelling of the bar.

.. _figure_decorations_4:

.. only:: html

   **Figure Decorations 4:**

.. figure:: /static/user_manual/introduction/scale_bar_dialog.png
   :align: center

   The Scale Bar Dialog


|qg| only supports displaying the scale in the same units as your map frame.
So if the units of your layers are in meters, you can't create a scale bar in
feet. Likewise, if you are using decimal degrees, you can't create a scale
bar to display distance in meters.

To add a scale bar:

#.  Select from menu :menuselection:`View --> Decorations --> Scale Bar`.
    The dialog starts (see figure_decorations_4_).
#.  Choose the placement from the :guilabel:`Placement` |selectstring| combo box.
#.  Choose the style from the :guilabel:`Scale bar style` |selectstring|
    combo box.
#.  Select the color for the bar :guilabel:`Color of bar` |selectcolor| or use
    the default black color.
#.  Set the size of the bar and its label :guilabel:`Size of bar` |selectnumber|.
#.  Make sure the |checkbox| :guilabel:`Enable scale bar` checkbox is checked.
#.  Optionally, check |checkbox| :guilabel:`Automatically snap to round number
    on resize`.
#.  Click **[OK]**.


.. tip::

   **Settings of Decorations**

   When you save a :file:`.qgs` project, any changes you have made to Grid,
   North Arrow, Scale Bar and Copyright will be saved in the project and restored
   the next time you load the project.

.. _sec_annotations:

.. index::
   single: annotation

Annotation Tools
================

The |mActionTextAnnotation| :sup:`Text Annotation` tool in the attribute
toolbar provides the possibility to place formatted text in a balloon on the
|qg| map canvas. Use the :guilabel:`Text Annotation` tool and click into the
map canvas.

.. _annotation:

.. only:: html

   **Figure annotation 1:**

.. figure:: /static/user_manual/introduction/annotation.png
   :align: center

   Annotation text dialog

Double clicking on the item opens a dialog with various options. There is the
text editor to enter the formatted text and other item settings. For instance,
there is the choice of having the item placed on a map position (displayed by
a marker symbol) or to have the item on a screen position (not related to the
map). The item can be moved by map position (by dragging the map marker) or by
moving only the balloon. The icons are part of the GIS theme, and they are used
by default in the other themes, too.

The |mActionAnnotation| :sup:`Move Annotation` tool allows you to move the
annotation on the map canvas.

Html annotations
----------------

The |mActionFormAnnotation| :sup:`Html Annotation` tools in the attribute
toolbar provides the possibility to place the content of an html file in a
balloon on the |qg| map canvas. Using the :guilabel:`Html Annotation` tool,
click into the map canvas and add the path to the html file into the dialog.

SVG annotations
---------------

The |mActionSaveAsSVG| :sup:`SVG Annotation` tool in the attribute toolbar
provides the possibility to place an SVG symbol in a balloon on the |qg| map
canvas. Using the :guilabel:`SVG Annotation` tool, click into the map canvas and
add the path to the SVG file into the dialog.

Form annotations
----------------

.. index::`annotations`
.. index::`form annotation|\see{annotations}`

Additionally, you can also create your own annotation forms. The
|mActionFormAnnotation| :sup:`Form Annotation` tool is useful to display
attributes of a vector layer in a customized Qt Designer form (see
figure_custom_annotation_). This is similar to the designer forms for the
:guilabel:`Identify features` tool, but displayed in an annotation item.
Also see this video https://youtu.be/0pDBuSbQ02o?t=2m25s from
Tim Sutton for more information.

.. _figure_custom_annotation:

.. only:: html

   **Figure annotation 2:**

.. figure:: /static/user_manual/introduction/custom_annotation.png
   :align: center

   Customized qt designer annotation form

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
it later. Bookmarks are saved on the computer, meaning that they are available
from any project in the same computer.

Creating a Bookmark
-------------------

To create a bookmark:

#. Zoom or pan to the area of interest.
#. Select the menu option :menuselection:`View --> New Bookmark` or press
   :kbd:`Ctrl-B`. The Spatial Bookmark panel opens with the newly created bookmark.
#. Enter a descriptive name for the bookmark (up to 255 characters).
#. Press :kbd:`Enter` to add the bookmark or click elsewhere.

Note that you can have multiple bookmarks with the same name.

Working with Bookmarks
----------------------

To use or manage bookmarks, select the menu option
:menuselection:`View --> Show Bookmarks`. The :guilabel:`Spatial Bookmarks`
panel allows you to:

* Zoom to a Bookmark: select the desired bookmark and then click
  :guilabel:`Zoom To Bookmark`. You can also zoom to a bookmark by
  double-clicking on it.
* Delete a Bookmark: select the bookmark and click :guilabel:`Delete Bookmark`.
  Confirm your choice.
* Import or Export a bookmark: To share or transfer your bookmarks between
  computers you can use the :guilabel:`Import/Export Bookmarks` pull down menu
  in the :guilabel:`Spatial Bookmarks` dialog. All the bookmarks are transfered.

.. _nesting_projects:

Nesting Projects
================

.. index:: nesting projects

If you want to embed content from other project files into your project, you can
choose :menuselection:`Layer --> Embed Layers and Groups`.

Embedding layers
----------------

The following dialog allows you to embed layers from other projects. Here is a
small example:

#. Press |browsebutton| to look for another project from the Alaska dataset.
#. Select the project file :file:`relations.qgs`. You can see the content of the
   project (see figure_embed_dialog_).
#. Press :kbd:`Ctrl` and click on the layers :file:`airports` and
   :file:`regions`. Press **[OK]**. The selected layers are embedded in the map
   legend and the map view now.

.. _figure_embed_dialog:

.. only:: html

   **Figure Nesting 1:**

.. figure:: /static/user_manual/introduction/embed_dialog.png
   :align: center

   Select layers and groups to embed

While the embedded layers are editable, you can't change their properties like
style and labeling.

Removing embedded layers
------------------------

Right-click on the embedded layer and choose |mActionRemoveLayer| :sup:`Remove`.
