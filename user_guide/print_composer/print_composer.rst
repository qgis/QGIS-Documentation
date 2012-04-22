.. _`label_printcomposer`:

:index:`print composer`

--------------
Print Composer
--------------

The print composer provides growing layout and printing capabilities. It
allows you to add elements such as the QGIS map canvas, legend, scalebar,
images, basic shapes, arrows and text labels. You can size, group, align
and position each element and adjust the properties to create your layout.
The layout can be printed or exported to image formats, Postscript, PDF
or to SVG [1]_ and you can save the layout as template and load it again
in another session. See a list of tools in table~\ref{tab:printcomposer_tools}:

.. _`printcomposer_tools`:

..index:: Print composer; tools
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| Icon                     | Purpose                               | Icon                       | Purpose                                  |
+==========================+=======================================+============================+==========================================+
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionFolder|          | Load from template                    | |mActionFileSaveAs|        | Save as template                         |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionExportMapServer| | Export to an image format             | |mActionSaveAsPDF|         | Export as PDF                            |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionSaveAsSVG|       | Export print composition to SVG       | |mActionFilePrint|         | Print or export as Postscript            |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionZoomFullExtent|  | Zoom to full extent                   | |mActionZoomIn|            | Zoom in                                  |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionZoomOut|         | Zoom out                              | |mActionDraw|              | Refresh view                             |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionUndo|            | Revert last change                    | |mActionRedo|              | Restore last change                      |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAddMap|          | Add new map from QGIS map canvas      | |mActionSaveMapAsImage|    | Add image to print composition           |
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

All Print Composer tools are availabe in menus and as icons in a toolbar.
The toolbar can be switched off and on using the right mouse button holding
the mouse over the toolbar.

Open a new Print Composer Template
==================================

Before you start to work with the print composer, you need to load some
raster and vector layers in the QGIS map canvas and adapt their properties
to suite your own convenience. After everything is rendered and symbolized
to your liking you click the |mActionNewComposer| :guilabel:`New Print
Composer` icon in the toolbar or choose :menuselection:`File --> New Print
Composer`.

Using Print Composer
====================

.. `print_composer_blank`:

.. figure::img/en/print_composer_blank.png
   :align: center
   :width: 12 em

   Print Composer |nix|

Opening the print composer provides you with a blank canvas to which you
can add the current QGIS map canvas, legend, scalebar, images, basic
shapes, arrows and text. Figure `print_composer_blank`_ shows the initial
view of the print composer with an activated |checkbox| Snap to grid mode
but before any elements are added. The print composer provides three tabs:

* The |tab| General tab allows you to set paper size, orientation, the
  print quality for the output file in dpi and to activate snapping to a
  grid of a defined resolution. Please note, the |checkbox| Snap to grid
  feature only works, if you define a grid resolution > 0. Furthermore you
  can also activate the |checkbox| Print as raster checkbox. This means all
  elements will be rastered before printing or saving as Postscript of PDF.
* The |tab| Item tab displays the properties for the selected map element.
  Click the |mActionSelectPan| :guilabel:`Select/Move item` icon to select
  an element (e.g. legend, scalebar or label) on the canvas. Then click the
  |tab| Item tab and customize the settings for the selected element.
* The |tab| Command history tab displays a history of all changes applied
  to the print composer layout. With a mouse click it is possible to undo
  and redo layout steps back and forth to a certain status.

You can add multiple elements to the composer. It is also possible to have
more than one map view or legend or scalebar in the print composer canvas.
Each element has its own properties and in the case of the map, its own
extent. If you want to remove an elements from the composer canvas. you can
do that with the kbd:`Delete` or the kbd:`Backspace` key.

Adding a current QGIS map canvas to the Print Composer
======================================================

To add the QGIS map canvas, click on the |mActionAddMap| :guilabel:`Add
new map from QGIS map canvas` button in the print composer toolbar and
drag a rectangle on the composer canvas with the left mouse button to
add the map. To display the current map, you can choose between three
different modes in the map |tab| Item tab:

* |selectstring| Preview Rectangle is the default setting. It only
  displays an empty box with a message **Map will be printed here**.
* |selectstring| Preview Cache renders the map in the current screen
  resolution. If case you zoom in or out the composer window, the map is
  not rendered again but the image will be scaled.
* |selectstring| Preview Render means, that if you zoom in or out the
  composer window, the map will be rendered again, but for space reasons,
  only up to a maximum resolution.

**Cache** is default preview mode for newly added print composer maps.

You can resize the map element by clicking on the
|mActionSelectPan| :guilabel:`Select/Move item` button, selecting the
element, and dragging one of the blue handles in the corner of the map.
With the map selected, you can now adapt more properties in the map
|tab| Item tab.

To move layers within the map element select the map element, click
the |mActionMoveItemContent| :guilabel:`Move item content` icon and move
the layers within the map element frame with the left mouse button. After
you found the right place for an element, you can lock the element position
within the print composer canvas. Select the map element and click on the
right mouse button to |mIconLock| :guilabel:`Lock` the element position
and again to unlock the element. You can lock the map element also
activating the |checkbox| Lock layers for map item checkbox in the Map
dialog of the Map Item tab.

**Note:** QGIS \CURRENT is now able to show labels from the new labeling
plugin also in the map composer, but it is not yet scaled correctly. So it
might be necessary to switch back to the standard labeling in some cases.

Map item tab --- Map and Extents dialog
***************************************

.. `mapdialog`:

.. figure:: img/en/print_composer_map1.png
   :align: center
   :width: 12 em

.. figure:: img/en/print_composer_map2.png
   :align: center
   :width: 12 em

   Print Composer map item tab --- Map and Extents dialog |nix|

Map dialog
~~~~~~~~~~

The **Map** dialog of the map item tab provides following functionalities
(see Figure `mapdialog`_ a):

* The **Preview** area allows to define the preview modes Rectangle,
  Cache and Render, as described above. Click on the :guilabel:`Update preview`
  button to apply changes to the map view.
* The **Map** area allows to resize the map element specifying the width
  and height or the scale. The |selectstring| Rotation 0 field allows to
  rotate the map element content clockwise in degrees. Note, a coordinate
  frame can only be added with the default value 0. Furthermore you can
  enable the checkboxes |checkbox| Lock layers for map items and
  |checkbox| Draw map canvas items.

If you change the view on the QGIS map canvas by zooming or panning or
changing vector or raster properties, you can update the print composer
view selecting the map element in the print composer and clicking the
:guilabel:`Update preview` button.

Extents dialog
~~~~~~~~~~~~~~

The **Extents** dialog of the map item tab provides following functionalities
(see Figure `mapdialog`_ b):

* The **Map extent** area allow to specify the map extent using Y and X
  min/max values or clicking the :guilabel:`Set to map canvas extent` button.

If you change the view on the QGIS map canvas by zooming or panning or
changing vector or raster properties, you can update the print composer
view selecting the map element in the print composer and clicking the
:guilabel:`Update preview` button in the map |tab| Item tab (see Figure
`mapdialog`_ a).

Map item tab --- Grid and General options dialog
************************************************

.. `sec_map_dialog`:

.. figure:: img/en/print_composer_map3.png
   :align: center
   :width: 12 em

.. figure:: img/en/print_composer_map4.png
   :align: center
   :width: 12 em

   Print Composer map item tab --- Grid and General options dialog |nix|

Grid dialog
~~~~~~~~~~~

The **Grid** dialog of the map item tab provides following functionalities
(see Figure `sec_map_dialog`_ a):

* The |checkbox| Show grid checkbox allows to overlay a grid to the map
  element. As grid type you can specify to use solid line or cross.
  Furthermore you can define an interval in X and Y direction, an X and
  Y offset, and the width used for cross or line grid type.
* The |checkbox| Draw annotation checkbox allows to add coordinates to
  the map frame. The annotation can be drawn inside or outside the map
  frame. The annotation direction can be defined as horizontal, vertical,
  horizontal and vertical, or boundary direction. And finally you can
  define the grid color, the annotation font, the annotation distance from
  the map frame and the precision of the drawn coordinates.

General options dialog
~~~~~~~~~~~~~~~~~~~~~~

The **General options** dialog of the map item tab provides following
functionalities (see Figure `sec_map_dialog`_ b):

* Here you can define color and outline width for the element frame, set
  a background color and opacity for the map canvas. The :guilabel:`Position`
  button opens the :guilabel:`Set items position` dialog and allows to set
  the map canvas position using reference points or coordinates. Furthermore
  you can select or unselect to display the element frame with the
  |checkbox| Show frame checkbox.

Adding other elements to the Print Composer
===========================================

Besides adding a current QGIS map canvas to the Print Composer, it is also
possible to add, position, move and customize legend, scalebar, images and
label elements.

Label item tab --- Label and General options dialog
***************************************************

To add a label, click the |mActionLabel| :guilabel:`Add label` icon, place
the element with the left mouse button on the print composer canvas and
position and customize their appearance in the label item tab.

.. `label_option`:

.. figure:: img/en/print_composer_label1.png
   :align: center
   :width: 12 em

.. figure:: img/en/print_composer_label2.png
   :align: center
   :width: 12 em

   Print composer label item tab --- Label options and General options dialog |nix|

Label dialog
~~~~~~~~~~~~

The **Label** dialog of the label item tab provides following functionalities
(see Figure `label_option`_ a):

* The **Label** dialog offers to add text labels to the composer canvas.
  You can define the horizontal and vertical alignment, select font and
  fontcolor for the text and it is possible to define a text margin im mm.

General options dialog
~~~~~~~~~~~~~~~~~~~~~~

The **General options** dialog of the label item tab provides following
functionalities (see Figure `label_option`_ b):

* Here you can define color and outline width for the element frame, set
  a background color and opacity for the label. The :guilabel:`Position`
  button opens the :guilabel:`Set items position` dialog and allows to
  set the map canvas position using reference points or coordinates.
  Furthermore you can select or unselect to display the element frame with
  the |checkbox| Show frame checkbox.

Image item tab --- Picture options and General options dialog
*************************************************************

To add an image, click the |mActionSaveMapAsImage| :guilabel:`Add image`
icon, place the element with the left mouse button on the print composer
canvas and position and customize their appearance in the image item tab.

.. `imageoptions`:

.. figure:: img/en/print_composer_image1.png
   :align: center
   :width: 12 em

.. figure:: img/en/print_composer_image2.png
   :align: center
   :width: 12 em

   Print composer image item tab - Picture options and General options |nix|

Picture options dialog
~~~~~~~~~~~~~~~~~~~~~~

The **Picture options** dialog of the image item tab provides following
functionalities (see Figure `imageoptions`_ a):

* The **Search directories** area allows to add and remove directories
  with images in SVG format to the picture database.
* The **Preview** field then shows all pictures stored in the selected
  directories.
* The **Options** area shows the current selected picture and allows to
  define width, height and clockwise rotation of the picture. It is also
  possible to add a user specific SVG path. Activating the
  |checkbox| Sync from map checkbox synchronizes the rotation of a picture
  in the qgis map canvas (i.e. a rotated north arrow) with the appropriate
  print composer image.

General options dialog
~~~~~~~~~~~~~~~~~~~~~~

The **General options** dialog of the image item tab provides following
functionalities (see Figure `imageoptions`_ b):

* Here you can define color and outline width for the element frame, set
  a background color and opacity for the picture. The :guilabel:`Position`
  button opens the :guilabel:`Set items position` dialog and allows to set
  the map canvas position using reference points or coordinates. Furthermore
  you can select or unselect to display the element frame with the
  |checkbox| Show frame checkbox.

Legend item tab --- General, Legend items and Item option dialog
****************************************************************

To add a map legend, click the |mActionAddLegend| : guilabel:`Add new legend`
icon, place the element with the left mouse button on the print composer
canvas and position and customize their appearance in the legend item tab.

.. `legendoptions`:

.. figure:: img/en/print_composer_legend1.png
   :align: center
   :width: 12 em

.. figure:: img/en/print_composer_legend2.png
   :align: center
   :width: 12 em

.. figure:: img/en/print_composer_legend3.png
   :align: center
   :width: 12 em

   Print composer legend item tab --- General, Legend items and Item option dialog |nix|

General dialog
~~~~~~~~~~~~~~

The **General** dialog of the legend item tab provides following
functionalities (see Figure `legendoptions`_ a):

* Here you can adapt the legend title. You can change the font of the
  legend title, layer and item name. You can change width and height of
  the legend symbol and you can add layer, symbol, icon label and box space.

Legend items dialog
~~~~~~~~~~~~~~~~~~~

The **Legend items** dialog of the legend item tab provides following
functionalities (see Figure `legendoptions`_ b):

* The legend items window lists all legend items and allows to change
  item order, edit layer names, remove and restore items of the list.
  After changing the symbology in the QGIS main window you can click on
  :guilabel:`Update` to adapt the changes in the legend element of the
  print composer. The item order can be changed using the :guilabel:`Up`
  and :guilabel:`Down` buttons or with Drag and Drop functionality.

Item options dialog
~~~~~~~~~~~~~~~~~~~

The **Item options** dialog of the legend item tab provides following
functionalities (see Figure `legendoptions`_ c):

* Here you can define color and outline width for the element frame, set
  a background color and opacity for the legend. The :guilabel:`Position`
  button opens the :guilabel:`Set items position` dialog and allows to set
  the map canvas position using reference points or coordinates. Furthermore
  you can select or unselect to display the element frame with the
  |checkbox| Show frame checkbox.

Scalebar item tab --- Scalebar and General options dialog
*********************************************************

To add a scalebar, click the |mActionScaleBar| :guilabel:`Add new scalebar`
icon, place the element with the left mouse button on the print composer
canvas and position and customize their appearance in the scalebar item tab.

.. `scalebaroptions`:

.. figure:: img/en/print_composer_scalebar1.png
   :align: center
   :width: 12 em

.. figure:: img/en/print_composer_scalebar2.png
   :align: center
   :width: 12 em

   Print composer scalebar item tab - Scalebar and General options dialog |nix|

Scalebar dialog
~~~~~~~~~~~~~~~

The **Scalebar** dialog of the scalebar item tab provides following
functionalities (see Figure `scalebaroptions`_ a):

* The scalebar dialog allows to define the segment size of the scalebar
  in map units, the map units used per bar units, and how many left and
  right segments units from 0 should be used.
* You can define the scalebar style, available is single and double box,
  line ticks middle, up and down and a numeric style.
* Furthermore you can define height, line width, label and box space of
  the scale bar. Add a unit label and define the scalebar font and color.

General options dialog
~~~~~~~~~~~~~~~~~~~~~~

The **General options** dialog of the scalebar item tab provides following
features (see Figure `scalebaroptions`_ b):

* Here you can define color and outline width for the element frame, set
  a background color and opacity for the scalebar. The :guilabel:`Position`
  button opens the \dialog{Set items position} dialog and allows to set
  the map canvas position using reference points or coordinates. Furthermore
  you can select or unselect to display the element frame with the
  |checkbox| Show frame checkbox.

Navigation tools
================

For map navigation the print composer provides 4 general tools:

* |mActionZoomIn| :guilabel:`Zoom in`,
* |mActionZoomOut| :guilabel:`Zoom out`,
* |mActionZoomFullExtent| :guilabel:`Zoom to full extend` and
* |mActionDraw| :guilabel:`Refresh the view`, if you find the view in an
  inconsistent state.

Revert and Restore tools
========================

During the layout process it is possible to revert and restore changes.
This can be done with the revert and restore tools:

* |mActionUndo| :guilabel:`Revert last changes`,
* |mActionRedo| :guilabel:`Restore last changes`.

or by mouse click within the |tab| Command history tab (see figure
`commandhist`_).

.. `commandhist`:

.. figure:: img/en/command_hist.png
   :align: center
   :width: 12 em

   Command history in the Print Composer |nix|

Add Basic shape and Arrow
=========================

It is possible to add basic shapes (Ellipse, Rectangle, Triangle) and arrows
to the print composer canvas.

.. `shapearrow`:

.. figure:: img/en/print_composer_shape.png
   :align: center
   :width: 12 em

.. figure:: img/en/print_composer_arrow.png
   :align: center
   :width: 12 em

   Print composer basic shape and arrow item tab --- Shape and Arrow options dialog |nix|

* The **Shape** dialog allows to draw an ellipse, rectangle, or triangle
  in the print composer canvas. You can define its outline and fill color,
  the outline width and a clockwise rotation.
* The **Arrow** dialog allows to draw an arrow in the print composer canvas.
  You can define color, outline and arrow width and it is possible to use
  a default marker and no marker and a SVG marker. For the SVG marker you
  can additionally add a SVG start and end marker from a directory on your
  computer.

Add attribute table values
==========================

It is possible to add parts of a vector attribute table to the print composer
canvas.

.. `attrcomp`:

.. figure:: img/en/print_composer_attribute1.png
   :align: center
   :width: 12 em

.. figure:: img/en/print_composer_attribute2.png
   :align: center
   :width: 12 em

   Print composer attribute table item tab --- Table and General options dialog |nix|

Table dialog
~~~~~~~~~~~~

The **Table** dialog of the attribute table item tab provides following
functionalities (see Figure `attrcomp`_ a):

* The **Table** dialog allows to select the vector layer and columns of
  the attribute table. Attribute columns can be sorted and you can define
  to show its values ascending or descending.
* You can define the maximum number of rows to be displayed and if
  attributes are only shown for visible features of the current composer
  canvas.
* Additionally you can define the grid characteristics of the table and
  the header and content font.

General options dialog
~~~~~~~~~~~~~~~~~~~~~~

The **General options** dialog of the attribute table item tab provides
following functionalities (see Figure `attrcomp`_ b):

* Here you can define color and outline width for the element frame, set
  a background color and opacity for the table. The :guilabel:`Position`
  button opens the :guilabel:`Set items position` dialog and allows to set
  the map canvas position using reference points or coordinates. Furthermore
  you can select or unselect to display the element frame with the
  |checkbox| Show frame checkbox.

Raise, lower and align elements
===============================

Raise or lower functionalities for elements are inside the |mActionRaiseItems|
:guilabel:`Raise selected items` pulldown menu. Choose an element on the
print composer canvas and select the matching functionality to raise or
lower the selected element compared to the other elements (see table
`printcomposer_tools`_).

There are several alignment functionalities available within the
|mActionAlignLeft| :guilabel:`Align selected items` pulldown menu (see
table `printcomposer_tools`_). To use an alignment functionality , you
first select some elements and then click on the matching alignment icon.
All selected will then be aligned within to their common bounding box.

Creating Output
===============

Figure `print_composer_complete`_ shows the print composer with an example
print layout including each type of map element described in the sections
above.

.. `print_composer_complete`:

.. figure:: img/en/print_composer_complete.png
   :align: center
   :width: 12 em

   Print Composer with map view, legend, scalebar, coordinates and text added |nix|

The print composer allows you to create several output formats and it is
possible to define the resolution (print quality) and paper size:

* The |mActionFilePrint| :guilabel:`Print` icon allows to print the layout
  to a connected printer or a Postscript file depending on installed printer
  drivers.
* The |mActionExportMapServer| :guilabel:`Export as image` icon exports
  the composer canvas in several image formats such as PNG, BPM, TIF, JPG,...
* The |mActionSaveAsPDF| :guilabel:`Export as PDF` saves the defined
  print composer canvas directly as a PDF.
* The |mActionSaveAsSVG| :guilabel:`Export as SVG` icon saves the print
  composer canvas as a SVG (Scalable Vector Graphic). **Note:** Currently
  the SVG output is very basic. This is not a QGIS problem, but a problem
  of the underlaying Qt library. This will hopefully be sorted out in
  future versions.

Saving and loading a print composer layout
==========================================

With the |mActionFileSaveAs| :guilabel:`Save as template` and
|mActionFolder| :guilabel:`Load from template` icons you can save the
current state of a print composer session as a  *.qpt template and load
the template again in another session.

The  |mActionComposerManager| :guilabel:`Composer Manager` button in the
toolbar and in :menuselection:`File --> Composer Manager` allows to
add a new composer template or to manage already existing templates.

.. `print_composer_manager`:

.. figure:: img/en/print_composer_manager.png
   :align: center
   :width: 12 em

   Composer Manager |nix|

.. [1] Export to SVG supported, but it is not working properly with some
recent Qt4 versions. You should try and check individual on your system
