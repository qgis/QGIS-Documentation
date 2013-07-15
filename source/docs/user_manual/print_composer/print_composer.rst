|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. index::
   single:Create_Maps
.. index::
   single:Layout_Maps
.. index::
   single:Compose_Maps

.. _`label_printcomposer`:

**************
Print Composer
**************

The print composer provides growing layout and printing capabilities. It allows
you to add elements such as the QGIS map canvas, text labels, images, legends, scalebars, basic
shapes, arrows, attribute tables and HTML frames. You can size, group, align and position each
element and adjust the properties to create your layout. The layout can be printed
or exported to image formats, Postscript, PDF or to SVG (export to SVG is not
working properly with some recent Qt4 versions. You should try and check
individual on your system). You can save the layout as template and load it again
in another session. Finally, generating several maps based on a template can be done throught the Atlas generator
See a list of tools in table_composer_1_:

.. index::
   single: print_composer;tools

.. _table_composer_1:

+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| Icon                     | Purpose                               | Icon                       | Purpose                                  |
+==========================+=======================================+============================+==========================================+
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionFolder|          | Load from template                    | |mActionFileSaveAs|        | Save as template                         |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionSaveMapAsImage|  | Export to an image format             | |mActionSaveAsPDF|         | Export as PDF                            |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionSaveAsSVG|       | Export print composition to SVG       | |mActionFilePrint|         | Print or export as Postscript            |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionZoomFullExtent|  | Zoom to full extent                   | |mActionZoomIn|            | Zoom in                                  |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionZoomOut|         | Zoom out                              | |mActionDraw|              | Refresh view                             |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionUndo|            | Revert last change                    | |mActionRedo|              | Restore last change                      |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAddMap|          | Add new map from QGIS map canvas      | |mActionAddImage|          | Add image to print composition           |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionLabel|           | Add label to print composition        | |mActionAddLegend|         | Add new legend to print composition      |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionScaleBar|        | Add new scalebar to print composition | |mActionAddBasicShape|     | Add basic shape to print composition     |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAddArrow|        | Add arrow to print composition        | |mActionOpenTable|         | Add attribute table to print composition |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionSelectPan|       | Select/Move item in print composition | |mActionMoveItemContent|   | Move content within an item              |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionGroupItems|      | Group items of print composition      | |mActionUngroupItems|      | Ungroup items of print composition       |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionRaiseItems|      | Raise selected items                  | |mActionLowerItems|        | Lower selected items                     |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionMoveItemsToTop|  | Move selected items to top            | |mActionMoveItemsToBottom| | Move selected items to bottom            |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAlignLeft|       | Align selected items left             | |mActionAlignRight|        | Align selected items right               |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAlignHCenter|    | Align selected items center           | |mActionAlignVCenter|      | Align selected items center vertical     |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAlignTop|        | Align selected items top              | |mActionAlignBottom|       | Align selected items bottom              |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+

Table Composer 1: Print Composer Tools

All Print Composer tools are available in menus and as icons in a toolbar. The
toolbar can be switched off and on using the right mouse button over the toolbar.

.. index::
   single:Composer_Template
.. index::
   single:Map_Template

Open a new Print Composer Template
==================================

Before you start to work with the print composer, you need to load some raster
and vector layers in the QGIS map canvas and adapt their properties to suit your
own convenience. After everything is rendered and symbolized to your liking,
click the |mActionNewComposer| :sup:`New Print Composer` icon in the toolbar or
choose :menuselection:`File --> New Print Composer`.

Using Print Composer
====================

Opening the print composer provides you with a blank canvas to which you can add
the current QGIS map canvas, text labels, images, legends, scalebars, basic
shapes, arrows, attribute tables and HTML frames. Figure_composer_1_ shows the initial view of the print composer with an
activated |checkbox| :guilabel:`Snap to grid` mode but before any elements are
added.

.. _Figure_composer_1:

.. only:: html

   **Figure Composer 1:**

.. figure:: /static/user_manual/print_composer/print_composer_blank.png
   :align: center
   :width: 30em

   Print Composer |nix|

The print composer provides four tabs:

* The :guilabel:`Composition` tab allows you to set paper size, orientation, the
  print quality for the output file in dpi and to activate snapping to a grid of
  a defined resolution. You can also choose the :guilabel:`Number of pages` your composition will have.
  Please note, the |checkbox| :guilabel:`Snap to grid`
  feature only works, if you define a grid resolution > 0. Furthermore you can
  also activate the |checkbox| :guilabel:`Print as raster` checkbox. This means
  all elements will be rastered before printing or saving as Postscript or PDF.
* The :guilabel:`Item Properties` tab displays the properties for the selected
  map element. Click the |mActionSelectPan| :sup:`Select/Move item` icon to select
  an element (e.g. legend, scalebar or label) on the canvas. Then click the
  :guilabel:`Item Properties` tab and customize the settings for the selected
  element.
* The :guilabel:`Command history` tab (hidden by default) displays a history of all changes applied
  to the print composer layout. With a mouse click it is possible to undo and
  redo layout steps back and forth to a certain status.
* The :guilabel:`Atlas generation` tab allows to enable the generation of an
  atlas for the current composer and gives access to its parameters.

You can add multiple elements to the composer. It is also possible to have more
than one map view or legend or scalebar in the print composer canvas, on one or 
several pages. Each element has its own properties and in the case of the map, 
its own extent. If you want to remove any elements from the composer canvas you 
can do that with the :kbd:`Delete` or the :kbd:`Backspace` key.

Composition tab --- General composition setup
=============================================

In the :guilabel:`Composition` tab, you can define the global settings of your composition.

* You can choose one of the :guilabel:`Presets` for your papersheet, or enter your custom :guilabel:`width` and :guilabel:`height`.
* Composition can now be parted on several pages. For instance, a first page can show a map canvas and a second 
  page will show the attribute table associated to a layer while a third ons shows a HTML frame linking to your organization website. 
  Set the :guilabel:`Number of pages` to the desired value. 
* Choose the page :guilabel:`Orientation` and its :guilabel:`Exported resolution`
* When checked, the |checkbox| :guilabel:`print as raster` means all elements will be rasterized before printing or saving as Postscript or PDF. 
* :guilabel:`Snap to grid` and :guilabel:`Snap to alignements` tools make accomplishing some tasks much easier. There's three types of grid : 
  **Dots**, **Solid** lines and **Crosses**. You can adjust :guilabel:`spacings`, :guilabel:`offsets` and :guilabel:`color` to your need.
* :guilabel:`Selection tolerance` defines the maximum distance below which an item is snapped to the grid.
* :guilabel:`Snap to alignements` shows helping lines when the borders or axis of two items are aligned.

Navigation tools
================

To navigate in the canvas layout, the print composer provides 4 general tools:

* |mActionZoomIn| :sup:`Zoom in`
* |mActionZoomOut| :sup:`Zoom out`
* |mActionZoomFullExtent| :sup:`Zoom to full extend`
* |mActionDraw| :sup:`Refresh the view` (if you find the view in an inconsistent
  state)

Adding a current QGIS map canvas to the Print Composer
======================================================

Click on the |mActionAddMap| :sup:`Add new map` toolbar button in the print
composer toolbar to add the QGIS map canvas. Now drag a rectangle on the composer
canvas with the left mouse button to add the map. To display the current map, you
can choose between three different modes in the map :guilabel:`Item Properties`
tab:

* **Rectangle** is the default setting. It only displays an empty box with a
  message 'Map will be printed here'.
* **Cache** renders the map in the current screen resolution. If case you zoom
  in or out the composer window, the map is not rendered again but the image will
  be scaled.
* **Render** means, that if you zoom in or out the composer window, the map will
  be rendered again, but for space reasons, only up to a maximum resolution.

**Cache** is default preview mode for newly added print composer maps.

You can resize the map element by clicking on the |mActionSelectPan|
:sup:`Select/Move item` button, selecting the element, and dragging one of the
blue handles in the corner of the map. With the map selected, you can now adapt
more properties in the map :guilabel:`Item Properties` tab.

To move layers within the map element select the map element, click the
|mActionMoveItemContent| :sup:`Move item content` icon and move the layers within
the map element frame with the left mouse button. After you found the right place
for an element, you can lock the element position within the print composer
canvas. Select the map element and click on the right mouse button to |mIconLock|
:sup:`Lock` the element position and again to unlock the element. You can lock
the map element also activating the |checkbox| :guilabel:`Lock layers for map
item` checkbox in the :guilabel:`Map` dialog of the :guilabel:`Item Properties`
tab.

.. note::
   QGIS is now able to show labels from the new labeling plugin also in the map
   composer, but it is not yet scaled correctly. So it might be necessary to
   switch back to the standard labeling in some cases.

Main properties
---------------

The :guilabel:`Main properties` dialog of the map :guilabel:`Item Properies` tab provides
following functionalities (see figure_composer_2_):

.. _Figure_composer_2:

.. only:: html

   **Figure Composer 2:**

.. figure:: /static/user_manual/print_composer/print_composer_map1.png
   :align: center
   :width: 20em

   Map Dialog |nix|

* The **Preview** area allows to define the preview modes 'Rectangle', 'Cache'
  and 'Render', as described above. If you change the view on the QGIS map canvas by zooming or panning or changing
  vector or raster properties, you can update the print composer view selecting the
  map element in the print composer and clicking the **[Update preview]** button.
* The field :guilabel:`Scale` |selectnumber| sets a manual scale.
* The field :guilabel:`Rotation` |selectnumber| allows to
  rotate the map element content clockwise in degrees. Note, a coordinate frame
  can only be added with the default value 0.
* The |checkbox| :guilabel:`Draw map canvas items` lets you show annotations that may be placed on the map canvas in the main QGIS window.
* You can choose to lock the layers shown on a map item. Check the |checkbox| :guilabel:`Lock layers for map item`. Any layer that would be displayed or hidden in the main QGIS window after checked on won't appear or be hidden in the map item of the composer. But style and labels of a locked layer is still refreshed accordingly to the main QGIS interface.

Extents
-------

The :guilabel:`Extents` dialog of the map item tab provides following
functionalities (see Figure figure_composer_3_):

.. _Figure_composer_3:

.. only:: html

   **Figure Composer 3:**

.. figure:: /static/user_manual/print_composer/print_composer_map2.png
   :align: center
   :width: 20em

   Extents Dialog |nix|

* The **Map extent** area allow to specify the map extent using Y and X min/max
  values or clicking the **[Set to map canvas extent]** button.

If you change the view on the QGIS map canvas by zooming or panning or changing
vector or raster properties, you can update the print composer view selecting
the map element in the print composer and clicking the **[Update preview]** button
in the map :guilabel:`Item Properties` tab (see Figure figure_composer_2_ a).

.. index::
   single: Grid;Map_Grid

Grid
----

The :guilabel:`Grid` dialog of the map :guilabel:`Item Properties` tab provides
following functionalities (see Figure_composer_4_):

.. _Figure_composer_4:

.. only:: html

   **Figure Composer 4:**

.. figure:: /static/user_manual/print_composer/print_composer_map3.png
   :align: center
   :width: 20em

   Grid Dialog |nix|

* The |checkbox| :guilabel:`Show grid` checkbox allows to overlay a grid to the
  map element. As grid type you can specify to use solid line or cross. Symbology of 
  the grid can be chosen. See Section :ref:`_vector_style_manager`.
  Furthermore you can define an interval in X and Y direction, an X and Y offset,
  and the width used for cross or line grid type.
* You can choose to paint the frame with a Zebra style. If not selected, general frame option is used (See Section :ref:`Frame_dialog`)
  Advanced rendering mode is also available for grids. See Section :ref:`Rendering_mode`)
* The |checkbox| :guilabel:`Draw coordinates` checkbox allows to add coordinates
  to the map frame. The annotation can be drawn inside or outside the map frame.
  The annotation direction can be defined as horizontal, vertical, horizontal and
  vertical, or boundary direction, for each border individually. Units can be in meters or in degrees. Finally you can define the grid color, the
  annotation font, the annotation distance from the map frame and the precision
  of the drawn coordinates.

Overview
--------

If the composer has more than one map, you can choose to use a map to show the extents of a second map.
The :guilabel:`Overview` dialog of the map :guilabel:`Item Properties` tab allows to customize the appearance of that feature.

* The :guilabel:`Overview frame` combolist references the map item whose extents will be drawn on the present map item.
* The :guilabel:`Overview Style` allows to change the frame color. See Section :ref:`_vector_style_manager`.
* The :guilabel:`Overview Blend mode` allows different transparency blend modes, to enhance visibility of the frame. See :ref:`Rendering_mode`
* If checked, the |checkbox| :guilabel:`Invert overview` creates a mask around the extents : the referenced map extents are shown clearly whereas everything else is blended with the frame color.

Position and size, Frame, Background, Item ID and Rendering
-----------------------------------------------------------

* The :guilabel:`Position and size` dialog lets you define size and position of the frame that contains the map item. You can also choose which :guilabel:`Reference point` will be set at the **X** and **Y** coordinates previously defined.
* The |checkbox| :guilabel:`Frame` shows or hides the frame around the label. Click on the **[Color]** and **[Thickness]** buttons to adjust those properties.
* the |checkbox| :guilabel:`Background` enables or disables a background color. Click on the **[Color...]** button to display a dialog where you pick a color ou choose frome a custom setting. Transparency can also be adjusted throught the **alpha** field.
* Use the :guilabel:`Item ID` to create a relationship to other print composer items.
* :guilabel:`Rendering` mode can be selected in the option field. See Section :ref:`Rendering_mode`.


Adding a Label item to the Print Composer
=========================================

To add a label, click the |mActionLabel| :sup:`Add label` icon, place the element
with the left mouse button on the print composer canvas and position and customize
its appearance in the label :guilabel:`Item Properties` tab.

The :guilabel:`Item Properties` tab  of a Label item provides following functionalities:

.. _Figure_composer_7:

.. only:: html

   **Figure Composer 7:**

.. figure:: /static/user_manual/print_composer/print_composer_label2.png
   :align: center
   :width: 20em

   General Options Dialog |nix|

Main properties
---------------

* The Main properties dialog is where is inserted the text (html or not) or the expression needed to fill the label added to the composer canvas.
  Labels can be interpreted as html code: check the |checkbox| :guilabel:`Render as HTML`. You can now insert a url, an clickable image that link to a web page or something more complex.
  You can also insert an expression. Click on the **[Insert an expression]** to open a new dialog. Build an expression by clicking the functions available in the left side of the panel. On the right side of the `Insert an expression dialog` is displayed the help file associated with the function selected. Two special categories can be useful, particularly associted with the Atlas functionnality : geometry functions and records functions. On the bottom side, a preview of the expression is shown.
  Define font and font color by clicking on the **[Font]** and **[Font color...]** buttons

Alignment
---------

* You can define the horizontal and vertical alignment in the :guilabel:`Alignment` zone

Display
-------

* In the **Display** tag, you can define a margin in mm and/or a rotation angle in degrees for the text.

Position and size, Frame, Background, Item ID and Rendering
-----------------------------------------------------------

* The :guilabel:`Position and size` area lets you define size and position of the frame that contains the label. You can also choose which :guilabel:`Reference point` will be set at the **X** and **Y** coordinates previously defined.
* The |checkbox| :guilabel:`Frame` shows or hides the frame around the label. Click on the **[Color]** and **[Thickness]** buttons to adjust those properties.
* the |checkbox| :guilabel:`Background` enables or disables a background color. Click on the **[Color...]** button to display a dialog where you pick a color ou choose frome a custom setting. Transparency can also be adjusted throught the **alpha** field.
* Use the :guilabel:`Item ID` to create a relationship to other print composer items.
* :guilabel:`Rendering` mode can be selected in the option field. See Rendering mode chapter below.

Adding an Image item to the Print Composer
=========================================

To add an image, click the |mActionImage| :sup:`Add image` icon, place the element
with the left mouse button on the print composer canvas and position and customize
its appearance in the image :guilabel:`Item Properties` tab.

.. index::
   single:Picture_database
.. index::
   single:Rotated_North_Arrow

The :guilabel:`Picture options` dialog of the image :guilabel:`Item Properties`
tab provides following functionalities (see figure_composer_5_ a):

.. _Figure_composer_8:

.. only:: html

   **Figure Composer 8:**

.. figure:: /static/user_manual/print_composer/print_composer_image1.png
   :align: center
   :width: 20em

   Picture Options Dialog Dialog |nix|

Main properties
---------------

* The **Main properties** dialog shows the current image that is displayed in the image item. 
  Click on the **[...]** button to select a file on your computer.

Search directories
------------------
* This dialog shows all pictures stored in the selected directories.
* The **Search directories** area allows to add and remove directories with
  images in SVG format to the picture database.

Rotation
--------
* The **Options** area shows the current selected picture and allows to define
  width, height and clockwise rotation of the picture. It is also possible to
  add a user specific SVG path. Activating the |checkbox| :guilabel:`Sync with
  map` checkbox synchronizes the rotation of a picture in the QGIS map canvas
  (i.e. a rotated north arrow) with the appropriate print composer image.

**General options dialog**

The :guilabel:`General options` dialog of the image :guilabel:`Item Properties`
tab provides following functionalities:

.. _Figure_composer_9:

.. only:: html

   **Figure Composer 9:**

.. figure:: /static/user_manual/print_composer/print_composer_image2.png
   :align: center
   :width: 20em

   General Options Dialog Dialog |nix|

* Here you can define color and outline width for the element frame, set a
  background color and opacity for the picture. The **[Position and size]**
  button opens the :guilabel:`Set item position` dialog and allows to set the
  map canvas position using reference points or coordinates. Furthermore you can
  select or unselect to display the element frame with the |checkbox|
  :guilabel:`Show frame` checkbox. With the :guilabel:`Item ID` you can create
* The :guilabel:`Rendering option` introduces the new overlay mode. You can choose how the label frame will be blend to the underlying elements.


Adding a Legend item to the Print Composer
==========================================

.. index::
   single:Map_Legend

To add a map legend, click the |mActionAddLegend| :sup:`Add new legend` icon,
place the element with the left mouse button on the print composer canvas and
position and customize their appearance in the legend :guilabel:`Item Properties`
tab.

**General dialog**

The :guilabel:`General` dialog of the legend item tab provides following
functionalities (see figure_composer_10_):

.. _Figure_composer_10:

.. only:: html

   **Figure Composer 10:**

.. figure:: /static/user_manual/print_composer/print_composer_legend1.png
   :align: center
   :width: 20em

   General Dialog |nix|

* Here you can adapt the legend title. You can change the font of the legend
  title, layer and item name. You can change width and height of the legend symbol
  and you can add layer, symbol, icon label and box space. Since QGIS 1.8, you
  can wrap the text of the legend title to a given character.

**Legend items dialog**

The :guilabel:`Legend items` dialog of the legend :guilabel:`Item Properties` tab
provides following functionalities (see figure_composer_11_):

.. _Figure_composer_11:

.. only:: html

   **Figure Composer 11:**

.. figure:: /static/user_manual/print_composer/print_composer_legend2.png
   :align: center
   :width: 20em

   Legend Items Dialog |nix|

* The legend items window lists all legend items and allows to change item order,
  edit layer names,group layers, remove and restore items of the list. After changing the
  symbology in the QGIS main window you can click on **[Update]** to adapt the
  changes in the legend element of the print composer. The item order can be
  changed using the **[Up]** and **[Down]** buttons or with 'drag and drop'
  functionality.

**General options dialog**

The :guilabel:`General options` dialog of the legend :guilabel:`Item Properties`
tab provides following functionalities (see figure_composer_12_):

.. _Figure_composer_12:

.. only:: html

   **Figure Composer 12:**

.. figure:: /static/user_manual/print_composer/print_composer_legend3.png
   :align: center
   :width: 20em

   General Options Dialog |nix|

* Here you can define color and outline width for the element frame, set a
  background color and opacity for the legend. The **[Position and size]** button
  opens the :guilabel:`Set item position` dialog and allows to set the map canvas
  position using reference points or coordinates. Furthermore you can select or
  unselect to display the element frame with the |checkbox| :guilabel:`Show frame`
  checkbox. Use the :guilabel:`Item ID` to create a relationship to other print
  composer items.
* The :guilabel:`Rendering option` introduces the new overlay mode. You can choose how the label frame will be blend to the underlying elements.

Adding a Scalebar item to the Print Composer
============================================

.. index::
   single: Scalebar; Map_Scalebar

To add a scalebar, click the |mActionScaleBar| :sup:`Add new scalebar` icon, place
the element with the left mouse button on the print composer canvas and position
and customize their appearance in the scalebar :guilabel:`Item Properties` tab.

**Scalebar dialog**

The :guilabel:`Scalebar` dialog of the scalebar :guilabel:`Item Properties` tab
provides following functionalities (see figure_composer_13_):

.. _Figure_composer_13:

.. only:: html

   **Figure Composer 13:**

.. figure:: /static/user_manual/print_composer/print_composer_scalebar1.png
   :align: center
   :width: 20em

   Scalebar Options Dialog |nix|

* The :guilabel:`Scalebar` dialog allows to define the segment size of the
  scalebar in map units, the map units used per bar units, and how many left and
  right segments units from 0 should be used.
* You can define the scalebar style, available is single and double box, line
  ticks middle, up and down and a numeric style.
* Furthermore you can define height, line width, label and box space of the
  scalebar. Add a unit label and define the scalebar font and color.

**General options dialog**

The :guilabel:`General options` dialog of the scalebar :guilabel:`Item Properties`
tab provides following features (see figure_composer_7_ b):

.. _Figure_composer_14:

.. only:: html

   **Figure Composer 14:**

.. figure:: /static/user_manual/print_composer/print_composer_scalebar2.png
   :align: center
   :width: 20em

   General Options Dialog |nix|

* Here you can define color and outline width for the element frame, set a
  background color and opacity for the scalebar. The **[Position and size]**
  button opens the :guilabel:`Set items position` dialog and allows to set the
  map canvas position using reference points or coordinates. Furthermore you can
  select or unselect to display the element frame with the |checkbox|
  :guilabel:`Show frame` checkbox. With the :guilabel:`Item ID` you can create
  a relationship to the other print composer items.
* The :guilabel:`Rendering option` introduces the new overlay mode. You can choose how the label frame will be blend to the underlying elements.

Adding a Basic shape or Arrow item to the Print Composer
========================================================

It is possible to add basic shapes (Ellipse, Rectangle, Triangle) and arrows
to the print composer canvas.

The :guilabel:`Shape` dialog allows to draw an ellipse, rectangle, or triangle
in the print composer canvas. You can define its outline and fill color, the
outline width and a clockwise rotation.

.. _figure_composer_18:

.. only:: html

   **Figure Composer 18:**

.. figure:: /static/user_manual/print_composer/print_composer_shape.png
   :align: center
   :width: 20em

   Shape Dialog |nix|

The :guilabel:`Arrow` dialog allows to draw an arrow in the print composer canvas.
You can define color, outline and arrow width and it is possible to use a default
marker and no marker and a SVG marker. For the SVG marker you can additionally
add a SVG start and end marker from a directory on your computer.

.. _figure_composer_19:

.. only:: html

   **Figure Composer 19:**

.. figure:: /static/user_manual/print_composer/print_composer_arrow.png
   :align: center
   :width: 20em

   Arrow Dialog |nix|

.. index:: Attribute_Table

Add attribute table values to the Print Composer
================================================

It is possible to add parts of a vector attribute table to the print composer
canvas.

**Table dialog**

The :guilabel:`Table` dialog of the attribute table item tab provides following
functionalities (see figure_composer_20_):

.. _figure_composer_20:

.. only:: html

   **Figure Composer 20:**

.. figure:: /static/user_manual/print_composer/print_composer_attribute1.png
   :align: center
   :width: 20em

   Table Dialog |nix|

* The :guilabel:`Table` dialog allows to select the vector layer and columns of
  the attribute table. Attribute columns can be sorted and you can define to show
  its values ascending or descending.
* You can define the maximum number of rows to be displayed and if attributes are
  only shown for visible features of the current composer canvas.
* Additionally you can define the grid characteristics of the table and the header
  and content font.

**General options dialog**

The :guilabel:`General options` dialog of the attribute table item tab provides
following functionalities (see figure_composer_21_):

.. _figure_composer_21:

.. only:: html

   **Figure Composer 21:**

.. figure:: /static/user_manual/print_composer/print_composer_attribute2.png
   :align: center
   :width: 20em

   General Options Dialog |nix|

* Here you can define color and outline width for the element frame, set a
  background color and opacity for the table. The **[Position and size]** button
  opens the :guilabel:`Set item position` dialog and allows to set the map canvas
  position using reference points or coordinates. Furthermore you can select or
  unselect to display the element frame with the |checkbox| :guilabel:`Show frame`
  checkbox. Use the Item ID to create a relationship to the other print composer\
  items.

.. index:: HTML_Frame

Add a HTML frame to the Print Composer
======================================

It is possible to add a clickable frame, linked to an URL.

.. index:: Elements_Alignment

Raise, lower and align elements
===============================

Raise or lower functionalities for elements are inside the |mActionRaiseItems|
:sup:`Raise selected items` pulldown menu. Choose an element on the print composer
canvas and select the matching functionality to raise or lower the selected
element compared to the other elements (see table_composer_1_).

There are several alignment functionalities available within the |mActionAlignLeft|
:sup:`Align selected items` pulldown menu (see table_composer_1_). To use an
alignment functionality , you first select some elements and then click on the
matching alignment icon. All selected will then be aligned within to their common
bounding box.

.. index:: Revert_Layout_Actions

Revert and Restore tools
========================

During the layout process it is possible to revert and restore changes. This can
be done with the revert and restore tools:

* |mActionUndo| :sup:`Revert last changes`
* |mActionRedo| :sup:`Restore last changes`

or by mouse click within the :guilabel:`Command history` tab (see figure_composer_9_).

.. _figure_composer_16:

.. only:: html

   **Figure Composer 16:**

.. figure:: /static/user_manual/print_composer/command_hist.png
   :align: center
   :width: 30 em

   Command history in the Print Composer |nix|

.. index:: Rendering_Mode

Rendering mode
==============

|qg| now allow advanced rendering modes for composer items.

.. index:: Atlas_Generation

Atlas generation
================

The print composer includes generation functions that allow to create map books
in an automated way. The concept is to use a coverage layer, which contains
geometries and fields. For each geometry in the coverage layer, a new output
will be generated where the content of some canvas maps will be moved to
highlight the current geometry. Fields associated to this geometry can be used
within text labels.

There can only be one atlas map by print composer but this can contain multiple pages. 
Every pages will be generated  with each feature. To enable the generation
of an atlas and access generation parameters, refer to the `Atlas generation`
tab. This tab contains the following widgets (see Figure_composer_15_):

.. _figure_composer_15:

.. only:: html

   **Figure Composer 15:**

.. figure:: /static/user_manual/print_composer/print_composer_atlas.png
   :align: center
   :width: 20em

   Atlas generation tab |nix|

* A |checkbox| :guilabel:`Generate an atlas` enables or disables the atlas generation.
* A combobox :guilabel:`Composer map` |selectstring| that allows to choose
  which map item will be used as the atlas map, i.e. on which map geometries from
  the coverage layer will be iterated over and displayed.
* A combobox :guilabel:`Coverage layer` |selectstring| that allows to choose the
  (vector) layer containing the geometries on which to iterate over.
* An optional |checkbox| :guilabel:`Hidden coverage layer`, that if checked, will
  hide the coverage layer (but not the other ones) during the generation.
* An optional |checkbox| :guilabel:`Features sorting` that, if checked, allows to
  sort features of the coverage layer. The associated combobox allows to choose
  which column will be used as the sorting key. Sort order (either ascending or
  descending) is set by a two-state button that displays an up or a down arrow.
* An optional :guilabel:`Feature filtering` text area that allows to specify an
  expression for filtering features from the coverage layer. If the expression
  is not empty, only features that evaluate to ``True`` will be selected. The
  button on the right allows to display the expression builder.
* An input box :guilabel:`Scaling` that allows to select the amount
  of space added around each geometry within the allocated map. Its value is
  meaningful only when using the autoscaling mode.
* A |checkbox| :guilabel:`Fixed scale` that allows to toggle between auto-scale
  and fixed-scale mode. In fixed scale mode, the map will only be translated for
  each geometry to be centered. In auto-scale mode, the map's extents are computed
  in such a way that each geometry will appear in its whole.
* An :guilabel:`Output filename expression` textbox that is used to generate a
  filename for each geometry if needed. It is based on expressions. This field is
  meaningful only for rendering to multiple files.
* A |checkbox| :guilabel:`Single file export when possible` that allows to force
  the generation of a single file if this is possible by the chosen output format
  (PDF for instance). If this field is checked, the value of the
  :guilabel:`Output filename expression` field is meaningless.

Generation
----------

The atlas generation is done when the user asks for a print or an export. The
behaviour of these functions will be slightly changed if an atlas map has been
selected.

For instance, when the user asks for an export to PDF, if an atlas map is defined,
the user will be asked for a directory where to save all the generated PDF files
(except if the |checkbox| :guilabel:`Single file export when possible` has been
selected).

.. index::
   single:Printing; Export_Map

Creating Output
===============

Figure_composer_22_ shows the print composer with an example print layout
including each type of map element described in the sections above.

.. _figure_composer_22:

.. only:: html

   **Figure Composer 22:**

.. figure:: /static/user_manual/print_composer/print_composer_complete.png
   :align: center
   :width: 40 em

   Print Composer with map view, legend, scalebar, coordinates and text added |nix|

.. index:: Export_as_image, Export_as_PDF, Export_as_SVG

The print composer allows you to create several output formats and it is possible
to define the resolution (print quality) and paper size:

* The |mActionFilePrint| :sup:`Print` icon allows to print the layout to a
  connected printer or a Postscript file depending on installed printer drivers.
* The |mActionSaveMapAsImage| :sup:`Export as image` icon exports the composer
  canvas in several image formats such as PNG, BPM, TIF, JPG,...
* The |mActionSaveAsPDF| :sup:`Export as PDF` saves the defined print composer
  canvas directly as a PDF.
* The |mActionSaveAsSVG| :sup:`Export as SVG` icon saves the print composer canvas
  as a SVG (Scalable Vector Graphic).

.. note::

   Currently the SVG output is very basic. This is not a QGIS problem, but a
   problem of the underlaying Qt library. This will hopefully be sorted out in
   future versions.
   Export big raster can sometimes fail, even if there seems to be enough memory. 
   This is also a problem of the underlaying Qt management of raster. 

.. index:: Composer_Manager

Saving and loading a print composer layout
==========================================

With the |mActionFileSaveAs| :sup:`Save as template` and |mActionFolder|
:sup:`Load from template` icons you can save the current state of a print composer
session as a  :file:`.qpt` template and load the template again in another session.

The  |mActionComposerManager| :sup:`Composer Manager` button in the QGIS toolbar
and in :menuselection:`Composer --> Composer Manager` allows to add a new composer
template or to manage already existing templates.

.. _figure_composer_23:

.. only:: html

   **Figure Composer 23:**

.. figure:: /static/user_manual/print_composer/print_composer_manager.png
   :align: center
   :width: 20 em

   The Print Composer Manager |nix|
