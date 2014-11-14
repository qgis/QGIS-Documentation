|updatedisclaimer|

.. _`label_printcomposer`:

**************
Print Composer
**************
.. index:: Create_Maps, Layout_Maps, Compose_Maps

With the Print Composer you can create nice maps and atlasses that can be printed or saved as PDF-file, an image or an SVG-file. This is a powerfull way to share geographical information produced with |qg| that can be included in reports or published.

The Print Composer provides growing layout and printing capabilities. It allows
you to add elements such as the |qg| map canvas, text labels, images, legends, scale bars, basic
shapes, arrows, attribute tables and HTML frames. You can size, group, align and position each
element and adjust the properties to create your layout. The layout can be printed
or exported to image formats, PostScript, PDF or to SVG (export to SVG is not
working properly with some recent Qt4 versions; you should try and check
individually on your system). You can save the layout as a template and load it again
in another session. Finally, generating several maps based on a template can be done through the atlas generator.
See a list of tools in table_composer_1_:

.. index::
   single: print_composer;tools

.. _table_composer_1:
 

+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| Icon                     | Purpose                               | Icon                       | Purpose                                  |
+==========================+=======================================+============================+==========================================+
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionFileSave|        | Save Project                          | |mActionNewComposer|       | New Composer                             |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionDupComposer|     | Duplicate Composer                    | |mActionComposerManager|   | Composer Manager                         |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionFileOpen|        | Load from template                    | |mActionFileSaveAs|        | Save as template                         |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionFilePrint|       | Print or export as PostScript         | |mActionSaveMapAsImage|    | Export to an image format                |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionSaveAsSVG|       | Export print composition to SVG       | |mActionSaveAsPDF|         | Export as PDF                            |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionUndo|            | Revert last change                    | |mActionRedo|              | Restore last change                      |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionZoomFullExtent|  | Zoom to full extent                   | |mActionZoomActual|        | Zoom to 100%                             |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionZoomIn|          | Zoom in                               | |mActionZoomIn|            | Zoom out                                 |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionDraw|            | Refresh View                          |                            |                                          |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionPan|             | Pan                                   | |mActionZoomToSelected|    | Zoom to specific region                  |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionSelect|          | Select/Move item in print composition | |mActionMoveItemContent|   | Move content within an item              |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAddMap|          | Add new map from |qg| map canvas      | |mActionAddImage|          | Add image to print composition           |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionLabel|           | Add label to print composition        | |mActionAddLegend|         | Add new legend to print composition      |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionScaleBar|        | Add scale bar to print composition    | |mActionAddBasicShape|     | Add basic shape to print composition     |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAddArrow|        | Add arrow to print composition        | |mActionOpenTable|         | Add attribute table to print composition |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAddHtml|         | Add an HTML frame                     |                            |                                          |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionGroupItems|      | Group items of print composition      | |mActionUngroupItems|      | Ungroup items of print composition       |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
|                          | Lock Selected Items                   |                            | Unlock All items                         |
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
| |mIconAtlas|             | Preview Atlas                         | |mActionAtlasFirst|        | First Feature                            |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAtlasPrev|       | Previous Feature                      |  |mActionAtlasNext|        | Next Feature                             |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionAtlasLast|       | Last feature                          |  |mActionFilePrint|        | Print Atlas                              |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+
| |mActionSaveMapAsImage|  | Export Atlas as Image                 |  |mActionAtlasSettings|    | Atlas Settings                           |
+--------------------------+---------------------------------------+----------------------------+------------------------------------------+

Table Composer 1: Print Composer Tools

All Print Composer tools are available in menus and as icons in a toolbar. The
toolbar can be switched off and on using the right mouse button over the toolbar.

.. index::
   single:Composer_Template
.. index::
   single:Map_Template

First steps
===========

Open a new Print Composer Template
----------------------------------

Before you start to work with the Print Composer, you need to load some raster
and vector layers in the |qg| map canvas and adapt their properties to suit your
own convenience. After everything is rendered and symbolized to your liking,
click the |mActionNewComposer| :sup:`New Print Composer` icon in the toolbar or
choose :menuselection:`File --> New Print Composer`. You will be prompted to
choose a title for the new Composer. For the first session give it the name 'Sample session'.

Overview of the Print Composer
--------------------

Opening the Print Composer provides you with a blank canvas that represents the paper surface when print. Initially you can find on the buttons on the left beside the panel to add map composer items; the current |qg| map canvas, text labels, images, legends, scale bars, basic shapes, arrows, attribute tables and HTML frames. In this toolbar you also find the toolbar buttons to navigate, zoomin on a part of the canvas and pan the view on the composer, the button to select the map composer item and the button the move the contents of the map item.  

Figure_composer_1_ shows the initial view of the Print Composer before any elements are added.

.. _Figure_composer_1:

.. only:: html

   **Figure Composer 1:**

.. figure:: /static/user_manual/print_composer/print_composer_blank.png
   :align: center

   Print Composer |nix|

On the right beside the canvas you find two panels.
The upper panel holds the tabs :guilabel:`Items` and :guilabel:`Command History` and the lower panel holds the tabs :guilabel:`Composition`,  :guilabel:`Item properties` and :guilabel:`Atlas generation`. 

* The :guilabel:`Items` tab provides a list of all map composer items added to the canvas.
* The :guilabel:`Command history` tab displays a history of all changes applied
  to the Print Composer layout. With a mouse click, it is possible to undo and
  redo layout steps back and forth to a certain status.
* The :guilabel:`Composition` tab allows you to set paper size, orientation, the page
  background, number of pages and print quality for the output file in dpi. Furthermore, you 
  can also activate the |checkbox| :guilabel:`Print as raster` checkbox. This means
  all elements will be rastered before printing or saving as PostScript or PDF.
  In this tab, you can also customize settings for grid and smart guides.
* The :guilabel:`Item Properties` tab displays the properties for the selected
  item element. Click the |mActionSelect| :sup:`Select/Move item` icon to select
  an element (e.g., legend, scale bar or label) on the canvas. Then click the
  :guilabel:`Item Properties` tab and customize the settings for the selected
  element.
* The :guilabel:`Atlas generation` tab allows you to enable the generation of an
  atlas for the current Composer and gives access to its parameters.
* Finally, you can save your print composition with the |mActionFileSave| :sup:`Save Project` button. 

In the bottom part of the Print Composer window, you can find a status bar with 
mouse position, current page number and a combo box to set the zoom level.

You can add multiple elements to the Composer. It is also possible to have more
than one map view or legend or scale bar in the Print Composer canvas, on one or
several pages. Each element has its own properties and, in the case of the map,
its own extent. If you want to remove any elements from the Composer canvas you
can do that with the :kbd:`Delete` or the :kbd:`Backspace` key.

Navigation tools
^^^^^^^^^^^^^^^^

To navigate in the canvas layout, the Print Composer provides some general tools:

* |mActionZoomIn| :sup:`Zoom in`
* |mActionZoomOut| :sup:`Zoom out`
* |mActionZoomFullExtent| :sup:`Zoom to full extent`
* |mActionZoomActual| :sup:`Zoom to 100%`
* |mActionDraw| :sup:`Refresh the view` (if you find the view in an inconsistent
  state)
* |mActionPan| :sup:`Pan composer`
* |mActionZoomToSelected| :sup:`Marquee zoom mode` (zoom to a specific region of the Composer)

You can change the zoom level also using the mouse wheel or the combo box in the status
bar. If you need to switch to pan mode while working in the Composer area, you can
hold the :kbd:`Spacebar` or the the mouse wheel.
With :kbd:`Ctrl+Spacebar`, you can temporarily switch to marquee zoom mode, and with 
:kbd:`Ctrl+Shift+Spacebar`, to zoom out mode.

Sample Session
--------------


To demonstrate how to create a map please follow the next instructions.

#. On the left site, select the |mActionAddMap| :sup:`Add new map` toolbar button and draw a rectangle on the canvas holding down the left mouse button. Inside de drawn rectangle the |qg| map view to the canvas.
#. Select the |mActionScaleBar| :sup:`Add new scalebar` toolbar button and place the map item with the left mouse button on the Print Composer canvas. A scalebar will be added to the canvas.
#. Select the |mActionAddLegend| :sup:`Add new legend` toolbar button and draw a rectangle on the canvas holding down the left mouse button. Inside the drawn rectangle the legend will be drawn.
#. Select the |mActionSelect| :sup:`Select/Move item` icon to select the map on the canvas and move it a bit.
#. While the map item is still selected you can also change the size of the map item. Click while holding down the left mouse button, in a white little rectangle in one of the corners of the map item and draw it to a new location to change it's size. 
#. Click the :guilabel:`Item Properties` tab on the left lower panel and find the setting for the orientation. Change it the value of the setting :guilabel:`Map orientation` to '15.00\ |degrees| '. You should see the orientation of the map item change.
#. Finally, you can save your print composition with the |mActionFileSave| :sup:`Save Project` button. 
 

Print Composer Options
----------------------

From :menuselection:`Settings --> Composer Options` you can set some options that will be
used as default during your work.

* :guilabel:`Compositions defaults` let you specify the default font to use.
* With :guilabel:`Grid appearance`, you can set the grid style and its color.
* :guilabel:`Grid defaults` defines spacing, offset and tolerance of the grid. 
  There are three types of grid: **Dots**, **Solid** lines and **Crosses**.
* :guilabel:`Guide defaults` defines the tolerance for the guides.



Composition tab --- General composition setup
---------------------------------------------

In the :guilabel:`Composition` tab, you can define the global settings of your composition.

* You can choose one of the :guilabel:`Presets` for your paper sheet, or enter your custom :guilabel:`width` and :guilabel:`height`.
* Composition can now be divided into several pages. For instance, a first page can show a map canvas, and a second
  page can show the attribute table associated with a layer, while a third one shows an HTML frame linking to your organization website.
  Set the :guilabel:`Number of pages` to the desired value. You can choose the page :guilabel:`Orientation` and its :guilabel:`Exported resolution`. When checked, |checkbox| :guilabel:`print as raster` means all elements will be rasterized before printing or saving as PostScript or
  PDF.
* :guilabel:`Grid` lets you customize grid settings like :guilabel:`spacings`, :guilabel:`offsets` and :guilabel:`tolerance` to your need.
* In :guilabel:`Snap to alignments`, you can change the :guilabel:`Tolerance`, which is the maximum distance below which an item is snapped to smart guides.

Snap to grid and/or to smart guides can be enabled from the :menuselection:`View` menu. In this menu, you can also hide or show the grid and smart guides.

Composer items general options
------------------------------

Composer items have a set of common properties you will find on the bottom of the :guilabel:`Item Properties` tab: Position and size, Rotation, Frame,
Background, Item ID and Rendering (See figure_composer_2_).

.. _Figure_composer_2:

.. only:: html

   **Figure Composer 2:**

.. figure:: /static/user_manual/print_composer/print_composer_common_properties.png
   :align: center

   Common Item properties Dialogs |nix|

.. _Frame_Dialog:

* The :guilabel:`Position and size` dialog lets you define size and position of the frame that contains the item. You can also choose
  which :guilabel:`Reference point` will be set at the **X** and **Y** coordinates previously defined.
* The :guilabel:`Rotation` sets the rotation of the element (in degrees).
* The |checkbox| :guilabel:`Frame` shows or hides the frame around the label.
  Click on the **[Color]** and **[Thickness]** buttons to adjust those properties.
* The |checkbox| :guilabel:`Background` enables or disables a background color.
  Click on the **[Color...]** button to display a dialog where you can pick a color or choose from a custom setting.
  Transparency can also be adjusted throught the **alpha** field.
* Use the :guilabel:`Item ID` to create a relationship to other Print Composer items. This is used with |qg| server and any potential web 
  client. You can set an ID on an item (e.g., a map and a label), and then the web client can send data to set a property 
  (e.g., label text) for that specific item. The GetProjectSettings command will list what items and which IDs are available in a layout.
* :guilabel:`Rendering` mode can be selected in the option field. See Rendering_Mode_.

.. note:: If you checked |checkbox| :guilabel:`Use live-updating color chooser dialogs` in the QGIS general options, the color button will 
    update as soon as you choose a new color from **Color Dialog** windows. If not, you need to close the **Color Dialog**.

.. _Rendering_Mode:

.. index:: Rendering_Mode

Rendering mode
==============

|qg| now allows advanced rendering for Composer items just like vector and raster layers.

.. _figure_composer_3:

.. only:: html

   **Figure Composer 3:**

.. figure:: /static/user_manual/print_composer/rendering_mode.png
   :align: center

   Rendering mode |nix|

* :guilabel:`Transparency` |slider|: You can make the underlying item in the Composer
  visible with this tool. Use the slider to adapt the visibility of your item to your needs.
  You can also make a precise definition of the percentage of visibility in the the menu beside the slider.
* |checkbox| :guilabel:`Exclude item from exports`: You can decide to make an item not visible in all exports. After activating this checkbox, the item will not be included in PDF's, prints etc.. 
* :guilabel:`Blending mode`: You can achieve special rendering effects with these tools that you
  previously only may know from graphics programs. The pixels of your overlaying and underlaying items are mixed
  through the settings described below.

    * Normal: This is the standard blend mode, which uses the alpha channel of the 
      top pixel to blend with the pixel beneath it; the colors aren't mixed.
    * Lighten: This selects the maximum of each component from the foreground and 
      background pixels. Be aware that the results tend to be jagged and harsh.
    * Screen: Light pixels from the source are painted over the destination, while 
      dark pixels are not. This mode is most useful for mixing the texture of one layer 
      with another layer (e.g., you can use a hillshade to texture another layer).
    * Dodge: Dodge will brighten and saturate underlying pixels based on the lightness 
      of the top pixel. So, brighter top pixels cause the saturation and brightness of the 
      underlying pixels to increase. This works best if the top pixels aren't too bright; 
      otherwise the effect is too extreme.
    * Addition: This blend mode simply adds pixel values of one layer with pixel values of 
      the other. In case of values above 1 (as in the case of RGB), white is displayed. This 
      mode is suitable for highlighting features.
    * Darken: This creates a resultant pixel that retains the smallest components of the 
      foreground and background pixels. Like lighten, the results tend to be jagged and harsh.
    * Multiply: Here, the numbers for each pixel of the top layer are multiplied with the numbers 
      for the corresponding pixel of the bottom layer. The results are darker pictures.
    * Burn: Darker colors in the top layer cause the underlying layers to darken. Burn can be 
      used to tweak and colorise underlying layers.
    * Overlay: This mode combines the multiply and screen blending modes. In the resulting picture, 
      light parts become lighter and dark parts become darker.
    * Soft light: This is very similar to overlay, but instead of using multiply/screen it uses 
      color burn/dodge. This mode is supposed to emulate shining a soft light onto an image.
    * Hard light: Hard light is very similar to the overlay mode. It's supposed to emulate projecting 
      a very intense light onto an image.
    * Difference: Difference subtracts the top pixel from the bottom pixel, or the other way 
      around, to always get a positive value. Blending with black produces no change, as the 
      difference with all colors is zero.
    * Subtract: This blend mode simply subtracts pixel values of one layer with pixel values of 
      the other. In case of negative values, black is displayed.

Composer Items
==============

The Map item
------------

Click on the |mActionAddMap| :sup:`Add new map` toolbar button in the Print
Composer toolbar to add the |qg| map canvas. Now, drag a rectangle onto the Composer
canvas with the left mouse button to add the map. To display the current map, you
can choose between three different modes in the map :guilabel:`Item Properties`
tab:

* **Rectangle** is the default setting. It only displays an empty box with a
  message 'Map will be printed here'.
* **Cache** renders the map in the current screen resolution. If you zoom
  the Composer window in or out, the map is not rendered again but the image will
  be scaled.
* **Render** means that if you zoom the Composer window in or out, the map will
  be rendered again, but for space reasons, only up to a maximum resolution.

**Cache** is the default preview mode for newly added Print Composer maps.

You can resize the map element by clicking on the |mActionSelect|
:sup:`Select/Move item` button, selecting the element, and dragging one of the
blue handles in the corner of the map. With the map selected, you can now adapt
more properties in the map :guilabel:`Item Properties` tab.

To move layers within the map element, select the map element, click the
|mActionMoveItemContent| :sup:`Move item content` icon and move the layers within
the map element frame with the left mouse button. After you have found the right place
for an element, you can lock the element position within the Print Composer
canvas. Select the map element and click on the right mouse button to |mIconLock|
:sup:`Lock` the element position and again to unlock the element. You can also lock
the map element by activating the |checkbox| :guilabel:`Lock layers for map
item` checkbox in the :guilabel:`Map` dialog of the :guilabel:`Item Properties`
tab.

.. _`composer_main_properties`:

Main properties
^^^^^^^^^^^^^^^

The :guilabel:`Main properties` dialog of the map :guilabel:`Item Properies` tab provides the
following functionalities (see figure_composer_4_):

.. _Figure_composer_4:

.. only:: html

   **Figure Composer 4:**

.. figure:: /static/user_manual/print_composer/print_composer_map1.png
   :align: center
   
   Map Item properties Tab |nix|

* The **Preview** area allows you to define the preview modes 'Rectangle', 'Cache'
  and 'Render', as described above. If you change the view on the |qg| map canvas by changing
  vector or raster properties, you can update the Print Composer view by selecting the
  map element in the Print Composer and clicking the **[Update preview]** button.
* The field :guilabel:`Scale` |selectnumber| sets a manual scale.
* The field :guilabel:`Rotation` |selectnumber| allows you to
  rotate the map element content clockwise in degrees. Note that a coordinate frame
  can only be added with the default value 0.
* |checkbox| :guilabel:`Draw map canvas items` lets you show annotations that may be placed 
  on the map canvas in the main |qg| window.
* You can choose to lock the layers shown on a map item. Check |checkbox| 
  :guilabel:`Lock layers for map item`. 
  After this is checked, any layer that would be displayed or hidden in the main |qg| window 
  will not appear or be hidden in the map item of the Composer. But style and labels of a 
  locked layer are still refreshed according to the main |qg| interface.
* The |mActionShowPresets| button allows you to add quickly all the presets views you 
  have prepared in QGIS. 
  Clicking on the |mActionShowPresets| button you will see the list of all the preset views: 
  just select the preset you want to display. 
  The map canvas will automatically lock the preset layers by enabling the |checkbox| 
  :guilabel:`Lock layers for map item`: if you want to unselect the preset, just uncheck the 
  |checkbox| and press on the |mActionDraw| button. See :ref:`label_legend` to find out how to 
  create presets views.

Extents
^^^^^^^

The :guilabel:`Extents` dialog of the map item tab provides the following
functionalities (see figure_composer_5_):

.. _Figure_composer_5:

.. only:: html

   **Figure Composer 5:**

.. figure:: /static/user_manual/print_composer/print_composer_map2.png
   :align: center

   Map Extents Dialog |nix|

* The **Map extents** area allows you to specify the map extent using X and Y min/max
  values and by clicking the **[Set to map canvas extent]** button. This button sets 
  the map extent of the composer map item to the extent of the current map view in the 
  main |qg| application. The button **[View extent in map canvas]** does exactly the 
  opposite, it updates the extent of the map view in the QGIS application to the extent
  of the composer map item. 

If you change the view on the |qg| map canvas by changing
vector or raster properties, you can update the Print Composer view by selecting
the map element in the Print Composer and clicking the **[Update preview]** button
in the map :guilabel:`Item Properties` tab (see figure_composer_2_).

.. index::
   single: Grid;Grids;Map_Grid

Grids
^^^^

The :guilabel:`Grids` dialog of the map :guilabel:`Item Properties` tab provides the
the possibility to add several grids to a map item.

* With the plus and minus button you can add or remove a selected grid.
* With the up and down button you can move a grid in the list and set the drawing priority.

When you double click on the added grid you can give it another name.

.. _Figure_composer_grid_1:

.. only:: html

   **Figure Composer grid 1:**

.. figure:: /static/user_manual/print_composer/map_grids.png
   :align: center

   Map Grids Dialog |nix|

After you have added a grid, you can active the checkbox |checkbox| :guilabel:`Show grid` to overlay a grid onto the
map element. Expand this option to provides a lot of configuration options, see Figure_composer_grid_2_.

.. _Figure_composer_grid_2:

.. only:: html

   **Figure Composer grid 2:**

.. figure:: /static/user_manual/print_composer/draw_grid.png
   :align: center

   Draw Grid Dialog |nix|

As grid type, you can specify to use a solid line or cross. Symbology of
the grid can be chosen. See section Rendering_Mode_.
Furthermore, you can define an interval in the X and Y directions, an X and Y offset,
and the width used for the cross or line grid type.

.. _Figure_composer_grid_3:

.. only:: html

   **Figure Composer grid 3:**

.. figure:: /static/user_manual/print_composer/grid_frame.png
   :align: center

   Grid Frame Dialog |nix|

* There are different options to style the frame that holds the map. Following options are 
  available: No Frame, Zebra, Interior ticks, Exterior ticks, Interior and Exterior ticks and Lineborder.

* Advanced rendering mode is also available for grids (see section Rendering_mode_).

* The |checkbox| :guilabel:`Draw coordinates` checkbox allows you to add coordinates
  to the map frame. The annotation can be drawn inside or outside the map frame.
  The annotation direction can be defined as horizontal, vertical, horizontal and
  vertical, or boundary direction, for each border individually. Units can be in meters or in degrees. Finally, you can define the grid
  color, the annotation font, the annotation distance from the map frame and the precision of the drawn coordinates.

.. _Figure_composer_grid_4:

.. only:: html

   **Figure Composer grid 4:**

.. figure:: /static/user_manual/print_composer/grid_draw_coordinates.png
   :align: center

   Grid Draw Coordinates dialog |nix|


Overviews
^^^^^^^^^

The :guilabel:`Overviews` dialog of the map :guilabel:`Item Properties` tab provides the
following functionalities:

.. _Figure_composer_7:

.. only:: html

   **Figure Composer 7:**

.. figure:: /static/user_manual/print_composer/print_composer_map4.png
   :align: center

   Map Overviews Dialog |nix|

You can choose to create an overview map, which shows the extents of the other map(s) 
that are available in the composer. First you need to create the map(s) you want to 
include in the overview map. Next you create the map you want to use as the overview 
map, just like a normal map. 

* With the plus and minus button you can add or remove an overview.
* With the up and down button you can move an overview in the list and set the drawing priority.

Open :guilabel:`Overviews` and press the green plus icon-button to add an overview. 
Initially this overview is named 'Overview 1' (see Figure_composer_7_). 
You can change the name when you double-click on the overview item in the list 
named 'Overview 1' and change it to another name. 

When you select the overview item in the list you can customize it.

* The |checkbox| :guilabel:`Draw "<name_overview>" overview` needs to be activated to 
  draw the extent of selected map frame.
* The :guilabel:`Map frame` combo list can be used to select the map item whose extents 
  will be drawn on the present map item.
* The :guilabel:`Frame Style` allows you to change the style of the overview frame.
* The :guilabel:`Blending mode` allows you to set different transparency blend modes. 
  See Rendering_Mode_.
* The |checkbox| :guilabel:`Invert overview` creates a mask around the extents when 
  activated: the referenced map extents are shown clearly, whereas everything else 
  is blended with the frame color.
* The |checkbox| :guilabel:`Center on overview` puts the extent of the overview frame in 
  the center of the overview map. You can only activate one overview item to center, when 
  you have added several overviews.



The Label item
--------------

To add a label, click the |mActionLabel| :sup:`Add label` icon, place the element
with the left mouse button on the Print Composer canvas and position and customize
its appearance in the label :guilabel:`Item Properties` tab.

The :guilabel:`Item Properties` tab of a label item provides the following functionality 
for the label item (see Figure_composer_8_):

.. _Figure_composer_8:

.. only:: html

   **Figure Composer 8:**

.. figure:: /static/user_manual/print_composer/print_composer_label1.png
   :align: center

   Label Item properties Tab |nix|

Main properties
^^^^^^^^^^^^^^^

* The main properties dialog is where the text (HTML or not) or the expression 
  needed to fill the label is added to the Composer canvas.
* Labels can be interpreted as HTML code: check |checkbox| :guilabel:`Render as HTML`. 
  You can now insert a URL, a clickable image that links to a web page or something more complex.
* You can also insert an expression. Click on **[Insert an expression]** to open a new dialog. 
  Build an expression by clicking the functions available in the left side of the panel. 
  Two special categories can be useful, particularly associated with the atlas functionality: 
  geometry functions and records functions. At the bottom, a preview of the expression is shown.
* Define :guilabel:`Font` by clicking on the **[Font...]** button or a :guilabel:`Font color` 
  selecting a color using the color selection tool.

Alignment and Display
^^^^^^^^^^^^^^^^^^^^^

* You can define the horizontal and vertical alignment in the :guilabel:`Alignment` zone.
* In the **Display** tag, you can define a margin in mm. This is the margin from the edge of the composer item.


.. _the_image_item:

The Image item
--------------

To add an image, click the |mActionAddImage| :sup:`Add image` icon, place the element
with the left mouse button on the Print Composer canvas and position and customize
its appearance in the image :guilabel:`Item Properties` tab.

.. index::
   single:Picture_database
.. index::
   single:Rotated_North_Arrow

The image :guilabel:`Item Properties` tab provides the following functionalities (see figure_composer_11_):

.. _Figure_composer_11:

.. only:: html

   **Figure Composer 11:**

.. figure:: /static/user_manual/print_composer/print_composer_image1.png
   :align: center

   Image Item properties Tab |nix|


You first have to select the image you want to display. 
There are several ways to set the :guilabel:`image source` in the **Main properties** area. 

#. Use the browse button |browsebutton| of :guilabel:`image source` to select a file on your 
   computer using the browse dialog. The browser will start in the SVG-libraries provided with |qg|.
   Besides :file:`SVG`, you can also select other image formats like :file:`.png` or :file:`.jpg`.
#. You can enter the source directly in the :guilabel:`image source` text field. You can even provide
   a remote URL-address to an image.   
#. From the **Search directories** area you can also select an image from :guilabel:`loading preview..` 
   to set the image source.
#. Use the data defined button |mIconDataDefine| to set the image source from a record or using a 
   regular expression.  
  
With the :guilabel:`Resize mode` option, you can set how the image is displayed when the frame 
is changed, or choose to resize the frame of the image item so it matches the original size of 
the image.

You can select one of the following modes:

* Zoom: Enlarges the image to the frame while maintaining aspect ratio of picture.
* Stretch: Stretches image to fit inside the frame, ignores aspect ratio. 
* Clip: Use this mode for raster images only, it sets the size of the image to original image size 
  without scaling and the frame is used to clip the image, so only the part of the image inside the
  frame is visible. 
* Zoom and resize frame: Enlarges image to fit frame, then resizes frame to fit resultant image.
* Resize frame to image size: Sets size of frame to match original size of image without scaling. 

Selected resize mode can disable the item options 'Placement' and 'Image rotation'. 
The :guilabel:`Image rotation` is active for the resize mode 'Zoom' and 'Clip'.

With :guilabel:`Placement` you can select the position of the image inside it's frame.  
The **Search directories** area allows you to add and remove directories with images in SVG format 
to the picture database. A preview of the pictures found in the selected directories is shown in a
pane and can be used to select and set the image source.

Images can be rotated with the :guilabel:`Image rotation` field.
Activating the |checkbox| :guilabel:`Sync with map` checkbox synchronizes the rotation of a picture 
in the |qg| map canvas (i.e., a rotated north arrow) with the appropriate Print Composer image.

It is also possible to select a north arrow directly. If you first select a north arrow image from 
**Search directories**  and then use the browse button |browsebutton| of the field :guilabel:`Image source`, 
you can now select one of the north arrow from the list as displayed in figure_composer_13_. 

.. note:: 

   Many of the north arrows do not have an 'N' added in the north arrow, this is done on 
   purpose for languages that do not use an 'N' for North, so they can use another letter.

.. _Figure_composer_13:

.. only:: html

   **Figure Composer 13:**

.. figure:: /static/user_manual/print_composer/north_arrows.png
   :align: center

   North arrows available for selection in provided SVG library


.. index::
   single:Map_Legend

The Legend item
---------------

To add a map legend, click the |mActionAddLegend| :sup:`Add new legend` icon,
place the element with the left mouse button on the Print Composer canvas and
position and customize the appearance in the legend :guilabel:`Item Properties`
tab.

The :guilabel:`Item properties` of a legend item tab provides the following
functionalities (see figure_composer_legend_1_):

.. _Figure_composer_legend_1:

.. only:: html

   **Figure Composer Legend 1:**

.. figure:: /static/user_manual/print_composer/print_composer_legend1.png
   :align: center

   Legend Item properties Tab |nix|

Main properties
^^^^^^^^^^^^^^^

The :guilabel:`Main properties` dialog of the legend :guilabel:`Item Properties` tab
provides the following functionalities (see figure_composer_legend_2_):

.. _Figure_composer_legend_2:

.. only:: html

   **Figure Composer Legend 2:**

.. figure:: /static/user_manual/print_composer/print_composer_legend2.png
   :align: center

   Legend Main properties Dialog |nix|

In Main properties you can:

* Change the title of the legend.
* Set the title alignment to Left, Center or Right.
* You can choose which :guilabel:`Map` item the current legend will refer to 
  in the select list.
* You can wrap the text of the legend title on a given character.


Legend items
^^^^^^^^^^^^

The :guilabel:`Legend items` dialog of the legend :guilabel:`Item Properties` tab
provides the following functionalities (see figure_composer_legend_3_):

.. _Figure_composer_legend_3:

.. only:: html

   **Figure Composer Legend 3:**

.. figure:: /static/user_manual/print_composer/print_composer_legend3.png
   :align: center

   Legend Legend Items Dialog |nix|

* The legend will be updated automatically if |checkbox| :guilabel:`Auto-update` is checked.
  When :guilabel:`Auto-update` is unchecked this will give you more control over the legend items.
  The icons below the legend items list will be activated.
* The legend items window lists all legend items and allows you to change item order,
  group layers, remove and restore items in the list, edit layer names and add a filter.
  
  * The item order can be changed using the **[Up]** and **[Down]** buttons or with 'drag-and-drop'
    functionality. The order can not be changed for WMS legend graphics.
  * Use the **[Add group]** button to add a legend group.
  * Use the **[plus]** and **[minus]** button to add or remove layers.
  * The **[Edit]** button is used to edit the layer-, groupname or title, first you need to 
    select the legend item.
  * The **[Sigma]** button adds a feature count for each vector layer.
  * Use the **[filter]** button the filter the legend by map content, only the legend items visible 
    in the map will be listed in the legend.

  After changing the symbology in the |qg| main window, you can click on **[Update]** to 
  adapt the changes in the legend element of the Print Composer. 



Fonts, Columns, Symbol
^^^^^^^^^^^^^^^^^^^^^^

The :guilabel:`Fonts`, :guilabel:`Columns` and :guilabel:`Symbol` dialogs of the legend 
:guilabel:`Item Properties` tab provide the following functionalities (see figure_composer_legend_4_):

.. _Figure_composer_legend_4:

.. only:: html

   **Figure Composer Legend 4:**

.. figure:: /static/user_manual/print_composer/print_composer_legend4.png
   :align: center

   Legend Fonts, Columns, Symbol and Spacing Dialogs |nix|

* You can change the font of the legend title, group, subgroup and item (layer) in the legend item. 
  Click on a category button to open a **Select font** dialog.
* You provide the labels with a **Color** using the advanced color picker, however the selected 
  color will be given to all font items in the legen..
* Legend items can be arranged over several columns. Set the number of columns in 
  the :guilabel:`Count` |selectnumber| field.

  * |checkbox| :guilabel:`Equal column widths` sets how legend columns should be adjusted.
  * The |checkbox| :guilabel:`Split layers` option allows a categorized or a graduated layer 
    legend to be divided between columns.

* You can change the width and height of the legend symbol in this dialog.


WMS legendGraphic and Spacing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The :guilabel:`WMS legendGraphic` and :guilabel:`Spacing` dialogs of the legend 
:guilabel:`Item Properties` tab provide the following functionalities (see 
figure_composer_legend_5_):

.. _Figure_composer_legend_5:

.. only:: html

   **Figure Composer Legend 5:**

.. figure:: /static/user_manual/print_composer/print_composer_legend5.png
   :align: center

   WMS legendGraphic Dialogs |nix|

When you have added a WMS layer and you insert a legend composer item, a request will be send to the 
WMS server to provide a WMS legend, This Legend will only be shown if the WMS server provides the 
GetLegendGraphic capability. The WMS legend content will be provided as a raster image.

:guilabel:`WMS legendGraphic` is used to be able to adjust the :guilabel:`Legend width` and 
the :guilabel:`legend hight` of the WMS legend raster image.

Spacing around title, group, subgroup, symbol, icon label, box space or column space can be customized 
through this dialog.


.. index::
   single: Scalebar; Map_Scalebar


The Scale Bar item
------------------

To add a scale bar, click the |mActionScaleBar| :sup:`Add new scalebar` icon, place
the element with the left mouse button on the Print Composer canvas and position
and customize the appearance in the scale bar :guilabel:`Item Properties` tab.

The :guilabel:`Item properties` of a scale bar item tab provides the following
functionalities (see figure_composer_scalebar1_):

.. _Figure_composer_scalebar1:

.. only:: html

   **Figure Composer Scalebar 1:**

.. figure:: /static/user_manual/print_composer/print_composer_scalebar1.png
   :align: center

   Scale Bar Item properties Tab |nix|

Main properties
^^^^^^^^^^^^^^^

The :guilabel:`Main properties` dialog of the scale bar :guilabel:`Item Properties` tab
provides the following functionalities (see figure_composer_scalebar_2_):

.. _Figure_composer_scalebar2:

.. only:: html

   **Figure Composer Scalebar 2:**

.. figure:: /static/user_manual/print_composer/print_composer_scalebar2.png
   :align: center

   Scale Bar Main properties Dialog |nix|

* First, choose the map the scale bar will be attached to.
* Then, choose the style of the scale bar. Six styles are available:

  * **Single box** and **Double box** styles, which contain one or two lines of boxes alternating colors.
  * **Middle**, **Up** or **Down** line ticks.
  * **Numeric**, where the scale ratio is printed (i.e., 1:50000).

Units and Segments
^^^^^^^^^^^^^^^^^^

The :guilabel:`Units` and :guilabel:`Segments` dialogs of the scale bar :guilabel:`Item Properties` tab
provide the following functionalities (see figure_composer_scalebar3_):

.. _Figure_composer_scalebar3:

.. only:: html

   **Figure Composer scalebar 3:**

.. figure:: /static/user_manual/print_composer/print_composer_scalebar3.png
   :align: center

   Scale Bar Units and Segments Dialogs |nix|

In these two dialogs, you can set how the scale bar will be represented.

* Select the map units used. There are four possible choices: **Map Units** is the automated unit
  selection; **Meters**, **Feet** or **Nautical Miles** force unit conversions.
* The :guilabel:`Label` field defines the text used to describe the units of the scale bar.
* The :guilabel:`Map units per bar unit` allows you to fix the ratio between a map unit and its representation in the scale bar.
* You can define how many :guilabel:`Segments` will be drawn on the left and on the right side of the scale bar,
  and how long each segment will be (:guilabel:`Size` field). :guilabel:`Height` can also be defined.

Display
^^^^^^^

The :guilabel:`Display` dialog of the scale bar :guilabel:`Item Properties` tab provide the following functionalities (see figure_composer_scalebar_4_):

.. _Figure_composer_scalebar_4:

.. only:: html

   **Figure Composer Scalebar 4:**

.. figure:: /static/user_manual/print_composer/print_composer_scalebar4.png
   :align: center

   Scale Bar Display |nix|

You can define how the scale bar will be displayed in its frame. 

* :guilabel:`Box margin` : space between text and frame borders
* :guilabel:`Labels margin` :  space between text and scale bar drawing
* :guilabel:`Line width` : line widht of the scale bar drawing
* :guilabel:`Join style` : Corners at the end of scalebar in style Bevel, Rounded or Square 
  (only available for Scale bar style Single Box & Double Box)  
* :guilabel:`Cap style` : End of all lines in style Square, Round or Flat
  (only available for Scale bar style Line Ticks Up, Down and Middle)  
* :guilabel:`Alignment` : Puts text on the left, middle or right side of the frame
  (works only for Scale bar style Numeric) 

Fonts and colors
^^^^^^^^^^^^^^^^

The :guilabel:`Fonts and colors` dialog of the scale bar :guilabel:`Item Properties` tab 
provide the following functionalities (see figure_composer_scalebar_5_):

.. _Figure_composer_scalebar_5:

.. only:: html

   **Figure Composer Scalebar 5:**

.. figure:: /static/user_manual/print_composer/print_composer_scalebar5.png
   :align: center

   Scale Bar Fonts and colors Dialogs |nix|

You can define the fonts and colors used for the scale bar.

* Use the **[Font]** button the set the font
* :guilabel:`Font color`: set the font color
* :guilabel:`Fill color`: set the first fill color 
* :guilabel:`Secondary fill color`: set the second fill color 
* :guilabel:`Stroke color`: set the corol of the lines of the Scale Bare

Fill colors are only used for scale box styles Single Box and Double Box. 
To select a color you can use the list option using the dropdown arrow to open 
a simple color selection option or the more advanced color selection option, that is 
started when you click in the colored box in the dialog. 


The Basic Shape Items
---------------------

To add a basic shape (ellipse, rectangle, triangle), click the |mActionAddBasicShape| :sup:`Add basic shape` icon 
or the |mActionAddArrow| :sup:`Add Arrow` icon, place the element holding down the left mouse. Customize the 
appearance in the :guilabel:`Item Properties` tab. 

When you also hold down the :kbd:`Shift` key while placing the basic shape you can create a perfect square, 
circle or triangle. 

.. _figure_composer_22:

.. only:: html

   **Figure Composer 22:**

.. figure:: /static/user_manual/print_composer/print_composer_shape.png
   :align: center

   Shape Item properties Tab |nix|

The :guilabel:`Shape` item properties tab allows you to select if you want to draw an ellipse, 
rectangle or triangle inside the given frame. 

You can set the style of the shape using the advanced symbol style dialog with which you can 
define its outline and fill color, fill pattern, use markers etcetera.

For the rectangle shape, you can set the value of the corner radius to round of the corners.

.. note::
   Unlike other items, you can not style the frame or the background color of the frame.


The Arrow item
--------------

To add an arrow, click the |mActionAddArrow| :sup:`Add Arrow` icon, place the element holding 
down the left mouse button and drag a line to draw the arrow on the Print Composer canvas and 
position and customize the appearance in the scale bar :guilabel:`Item Properties` tab.

When you also hold down the :kbd:`Shift` key while placing the arrow, it is placed in an angle 
of exactly 45\ |degrees| .

The arrow item can be used to add a line or a simple arrow that can be used, for example, to 
show the relation between other print composer items. To create a north arrow, the image item should 
be considered first. |qg| has a set of North arrows in SVG format. Furthermore you can connect 
an image item with a map so it can rotate automatically with the map (see the_image_item_).

.. _figure_composer_arrow:

.. only:: html

   **Figure Composer Arrow:**

.. figure:: /static/user_manual/print_composer/print_composer_arrow.png
   :align: center

   Arrow Item properties Tab |nix|

Item Properties
^^^^^^^^^^^^^^^

The :guilabel:`Arrow` item properties tab allows you to configure an arrow item.

The  **[Line style ...]** button can be used to set the line style using the line style symbol editor.

In :guilabel:`Arrows markers` you can select one of three radio buttons.
 
* :guilabel:`Default` : To draw a regular arrow, gives you options to style the arrow head 
* :guilabel:`None` : To draw a line without arrow head
* :guilabel:`SVG Marker` : To draw a line with an SVG :guilabel:`Start marker` and/or :guilabel:`End marker`

For :guilabel:`Default` Arrow marker you can use following options to style the arrow head.

* :guilabel:`Arrow outline color` : Set the outline color of the arrow head
* :guilabel:`Arrow fill color` : Set the fill color of the arrow head
* :guilabel:`Arrow outline width` : Set the outline width of the arrow head
* :guilabel:`Arrow head width`: Set the size of the arrow head
  
For :guilabel:`SVG Marker` you can use following options. 

* :guilabel:`Start marker` : Choose an SVG image to draw at the beginning of the line
* :guilabel:`End marker` : Choose an SVG image to draw at the end of the line
* :guilabel:`Arrow head width`: Sets the size of Start and/or headmarker

SVG images are automatically rotated with the line. The color of the SVG image can not be changed.


.. index:: Attribute_Table


The Attribute Table item
------------------------

It is possible to add parts of a vector attribute table to the Print Composer
canvas: Click the |mActionOpenTable| :sup:`Add attribute table` icon, place the 
element with the left mouse button on the Print Composer canvas, and position and 
customize the appearance in the :guilabel:`Item Properties` tab.

The :guilabel:`Item properties` of an attribute table item tab provides the following
functionalities (see figure_composer_table_1_):

.. _Figure_composer_table_1:

.. only:: html

   **Figure Composer Attribute Table 1:**

.. figure:: /static/user_manual/print_composer/print_composer_attribute1.png
   :align: center

   Attribute table Item properties Tab |nix|


Main properties
^^^^^^^^^^^^^^^

The :guilabel:`Main properties` dialogs of the attribute table :guilabel:`Item Properties` 
tab provide the following functionalities  (see figure_composer_table_2_):

.. _Figure_composer_table_2:

.. only:: html

   **Figure Composer Attribute Table 2:**

.. figure:: /static/user_manual/print_composer/print_composer_attribute2.png
   :align: center

   Attribute table Main properties Dialog |nix|

* For :guilabel:`Source` you can normally select only 'Layer features'. 
* With :guilabel:`Layer` you can choose from the vector layers loaded in the project.
* The button **[Refresh table data]** can be used to refresh the table when the actual 
  contents of the table has changed.
* The button **[Attributes...]** starts the :guilabel:`Select attributes` menu, see 
  figure_composer_table_3_, that can be used to change the visible contents of the table.
  After making changes use the **[OK]** button to apply changes to the table.

  In the :guilabel:`Columns` section you can:
  
  * Remove an attribute, just select an attribute row by clicking anywhere in a row and press
    the minus button to remove the selected attribute. 
  * Add a new attribute use the plus button. At the end a new empty row appears and you can 
    select empty cell of the column :guilabel:`Attribute`. You can select a field attribute from 
    the list or you can select to build a new attribute using a regular expression.
  * Use the up and down arrows to change the order of the attributes in the table.
  * Select a cel in the Headings column to change the Heading, just type a new name.
  * Select a cel in the Alignment column and you can choose between Left, Center or Right alignment.
  * Select a cel in the Width column and you can change it from Automatic to a width in mm, just 
    type a number. When you want to change it back to Automatic, use the cross.
  * The **[Reset]** button can allways be used to restore it to the original attribute settings.

  In the :guilabel:`Sorting` section you can:

  * Add an attribute to sort the table with. Select an attribute and set the sorting order to 'Ascending' 
    or 'Descending' and press the plus button. A new line is added to the sort order list.
  * select a row in the list and use the up and down button to change the sort priority on attribute level.
  * use the minus button to remove an attribute from the sort order list.


.. _Figure_composer_table_3:

.. only:: html

   **Figure Composer Attribute Table 3:**

.. figure:: /static/user_manual/print_composer/print_composer_attribute3.png
   :align: center

   Attribute table Select attributes Dialog |nix|


Feature filtering
^^^^^^^^^^^^^^^^^

The :guilabel:`Feature filtering` dialogs of the attribute table :guilabel:`Item Properties` 
tab provide the following functionalities  (see figure_composer_table_4_):

.. _Figure_composer_table_4:

.. only:: html

   **Figure Composer Attribute Table 4:**

.. figure:: /static/user_manual/print_composer/print_composer_attribute4.png
   :align: center

   Attribute table Feature filtering Dialog |nix|

You can: 

* define the :guilabel:`Maximum rows` to be displayed.
* Check |checkbox| :guilabel:`Remove duplicate rows from table` to show unique records only 
* Check |checkbox| :guilabel:`Show only visible features within a map` and select the 
  corresponding :guilabel:`Composer map` to display the attributes of features only visible 
  on selected map. 


Appearance
^^^^^^^^^^

The :guilabel:`Appearance` dialogs of the attribute table :guilabel:`Item Properties` 
tab provide the following functionalities  (see figure_composer_table_5_):

.. _Figure_composer_table_5:

.. only:: html

   **Figure Composer Attribute Table 5:**

.. figure:: /static/user_manual/print_composer/print_composer_attribute5.png
   :align: center

   Attribute table appearance Dialog |nix|

You can define the :guilabel:`margin` around text.


Show grid
^^^^^^^^^

The :guilabel:`Show grid` dialog of the attribute table :guilabel:`Item Properties` tab
provide the following functionalities (see figure_composer_table_6_):

   .. _Figure_composer_table_6:

.. only:: html

   **Figure Composer Attribute Table 6:**

.. figure:: /static/user_manual/print_composer/print_composer_attribute6.png
   :align: center

   Attribute table Show grid Dialog |nix|

You can define the grid characteristics of the table (:guilabel:`Stroke width` and :guilabel:`Color` of the grid) 


Fonts and text styling
^^^^^^^^^^^^^^^^^^^^^^

The :guilabel:`Fonts and text styling` dialog of the attribute table :guilabel:`Item Properties` tab
provide the following functionalities (see figure_composer_table_7_):

   .. _Figure_composer_table_7:

.. only:: html

   **Figure Composer Attribute Table 7:**

.. figure:: /static/user_manual/print_composer/print_composer_attribute7.png
   :align: center

   Attribute table Fonts and text styling Dialog |nix|

You can define the header and content font.


Frames
^^^^^^

The :guilabel:`Frames` dialog of the attribute table :guilabel:`Item Properties` tab
provide the following functionalities (see figure_composer_table_8_):

   .. _Figure_composer_table_8:

.. only:: html

   **Figure Composer Attribute Table 8:**

.. figure:: /static/user_manual/print_composer/print_composer_attribute8.png
   :align: center

   Attribute table Frames Dialog |nix|


.. index:: HTML_Frame

The HTML frame item
-------------------

It is possible to add a frame that displays the contents of a website or even create and style
your own HTML page and display it!
 
Click the |mActionAddHtml| :sup:`Add HTML frame` icon, place the element by dragging a 
rectangle holding down the left mouse button on the Print Composer canvas and position 
and customize the appearance in the :guilabel:`Item Properties` tab 
(see figure_composer_html_1_).

.. _Figure_composer_html_1:

.. only:: html

   **Figure Composer HTML 1:**

.. figure:: /static/user_manual/print_composer/print_composer_html1.png
   :align: center

   HTML frame, the item properties Tab |nix|


HTML Source
^^^^^^^^^^^

As an HTML source, you can either set a URL and activate the URL radiobutton or 
enter the HTML source directly in the textbox provided and activate the Source radiobutton. 

The :guilabel:`HTML Source` dialog of the HTML frame :guilabel:`Item Properties` tab
provides the following functionalities (see figure_composer_html_2_):

.. _Figure_composer_html_2:

.. only:: html

   **Figure Composer HTML 2:**

.. figure:: /static/user_manual/print_composer/print_composer_html2.png
   :align: center

   HTML frame, the HTML Source properties |nix|

* In :guilabel:`URL` you can enter the URL of a webpage you copied from your internet 
  browser or select an HTML file using the browse button |browsebutton|. There is also the 
  option to use the Data defined override button, to provide an URL from the contents of an 
  attribute field of a table or using a regular expression. 
* In :guilabel:`Source` you can enter text in the textbox with some HTML tags or provide a full 
  HTML page.
* The **[insert an expression]** button can be used to insert an expression like 
  ``[%Year($now)%]`` in the Source textbox to display the current year. This button is only 
  activated when radiobutton :guilabel:`Source` is selected. After inserting the expression 
  click somewhere in the textbox before refreshing the HTML frame, otherwise you will 
  lose the expression.
* Activate |checkbox| :guilabel:`Evaluate QGIS expressions in HTML code` to see the result of 
  the expression you have included, otherwise you will see the expression instead. 
* Use the **[Refresh HTML]** button to refresh the HTML frame(s) to see the result of
  changes.


Frames
^^^^^^

The :guilabel:`Frames` dialog of the HTML frame :guilabel:`Item Properties` tab
provides the following functionalities (see figure_composer_html_3_):

.. _Figure_composer_html_3:

.. only:: html

   **Figure Composer HTML 3:**

.. figure:: /static/user_manual/print_composer/print_composer_html3.png
   :align: center

   HTML frame, the Frames properties |nix|

* With :guilabel:`Resize mode` you can select how to render the HTML contents:

  * **Use existing frames** displays the result in the first frame and added frames only.
  * **Extent to next page** will create as many frames (and corresponding pages) as 
    necessary to render the height of the web page. Each frame can be moved around on 
    the layout. If you resize a frame, the webpage will be divided up between the 
    other frames. The last frame will be trimmed to fit the web page.
  * **Repeat on every page** will repeat the upper left of the web page on every page 
    in frames of the same size.
  * **Repeat until finished** will also create as many frames as the 
    **Extend to next page** option, except all frames will have the same size.

* Use the **[Add Frame]** button to add another frame with the same size as selected 
  frame. The result of the HTML page that will not fit in the first frame will continue 
  in the next frame when you use the Resize mode **Use existing frames**. 
* Activate |checkbox| :guilabel:`Don't export page if frame is empty` prevents the page 
  to be exported when the frame has no HTML contents. This means all other composer items, 
  maps, scalebars, legends etc. will not be visible in the result.  
* Activate |checkbox| :guilabel:`Don't draw background if frame is empty` prevents the 
  background to be drawn when the frame has no HTML contents.


Use smart page breaks and User style sheet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The :guilabel:`Use smart page breaks` dialog and :guilabel:`Use style sheet` dialog of 
the HTML frame :guilabel:`Item Properties` tab provides the following functionalities 
(see figure_composer_html_4_):

.. _Figure_composer_html_4:

.. only:: html

   **Figure Composer HTML 4:**

.. figure:: /static/user_manual/print_composer/print_composer_html4.png
   :align: center

   HTML frame, Use smart page breaks and User stylesheet properties |nix|

* Activate |checkbox| :guilabel:`Use smart page breaks` to prevent the html frame contents 
  from breaking mid-way a line of text so it continues nice and smooth in the next frame. 
* Set the :guilabel:`Maximum distance` allowed when calculating where to place page 
  breaks in the html. This distance is the maximum amount of empty space allowed at the 
  bottom of a frame after calculating the optimum break location. Setting a larger value 
  will result in better choice of page break location, but more wasted space at the bottom 
  of frames. This is only used when :guilabel:`Use smart page breaks` is activated.
* Activate |checkbox| :guilabel:`User stylesheet` to apply HTML styles that often is provided 
  in cascading style sheet. An example of style code is provide below to set the fontsize 
  of text included in paragraph tags ``<p>`` to 20 pixels.

  .. 

     p {
        font-size: 20px;
       }

* Use the **[Update HTML]** button to see the result of the stylesheet settings.


.. index:: Elements_Alignment

Manage items
============

Size and position
-----------------

Each item inside the Composer can be moved/resized to create a perfect layout.
For both operations the first step is to activate the |mActionSelect| :sup:`Select/Move item` 
tool and to click on the item; you can then move it using the mouse while holding the left button. 
If you need to constrain the movements to the horizontal or the vertical axis, just hold 
the :kbd:`Shift` while moving the mouse.
If you need a better precision, you can move a selected item using the :kbd:`Arrow keys` on the keyboard; 
if the movement is too slow, you can speed up it by holding :kbd:`Shift`.

A selected item will show squares on its boundaries; moving one of them with the mouse, will resize the item
in the corresponding direction.
While resizing, holding :kbd:`Shift` will maintain the aspect ratio. Holding :kbd:`Ctrl` will resize from 
the item center.

The correct position for an item can be obtained using snapping to grid or smart guides. If you need to 
disable the snap on the fly just hold :kbd:`Ctrl` while moving the mouse.

You can choose multiple items with the |mActionSelect| :sup:`Select/Move item` button. 
Just hold the :kbd:`Shift` button and click on all the items you need. You can then resize/move
this group just like a single item.

Once you have found the correct position for an item, you can lock it by clicking with the
right mouse button. Press the same button another time to unlock it. You can also lock/unlock
items using the icons on the toolbar.

To unselect an item, just click on it holding the :kbd:`Shift` button.

Inside the :menuselection:`Edit` menu, you can find actions to select all the items, to clear all selections or 
to invert the current selection.

Alignment
--------------

Raising or lowering functionalities for elements are inside the |mActionRaiseItems|
:sup:`Raise selected items` pull-down menu. Choose an element on the Print Composer
canvas and select the matching functionality to raise or lower the selected
element compared to the other elements (see table_composer_1_).

.. _figure_composer_28:

.. only:: html

   **Figure Composer 28:**

.. figure:: /static/user_manual/print_composer/alignment_lines.png
   :align: center

   Alignment helper lines in the Print Composer |nix|

There are several alignment functionalities available within the |mActionAlignLeft|
:sup:`Align selected items` pull-down menu (see table_composer_1_). To use an
alignment functionality, you first select some elements and then click on the
matching alignment icon. All selected elements will then be aligned within to their common
bounding box.
When moving items on the Composer canvas, alignment helper lines appear when borders, centers or corners are aligned.

.. index:: Revert_Layout_Actions

Copy/Cut and Paste items
------------------------
The print composer includes actions to use the common Copy/Cut/Paste functionality for the items
in the layout. As usual first you need to select the items using one of the options seen above;
at this point the actions can be found in the :menuselection:`Edit` menu. When using the Paste action, the elements
will be pasted according to the current mouse position.

Revert and Restore tools
========================

During the layout process, it is possible to revert and restore changes. This can
be done with the revert and restore tools:

* |mActionUndo| :sup:`Revert last changes`
* |mActionRedo| :sup:`Restore last changes`

This can also be done by mouse click within the :guilabel:`Command history` tab (see figure_composer_29_).

.. _figure_composer_29:

.. only:: html

   **Figure Composer 29:**

.. figure:: /static/user_manual/print_composer/command_hist.png
   :align: center

   Command history in the Print Composer |nix|

.. index:: Atlas_Generation

Atlas generation
================

The Print Composer includes generation functions that allow you to create map books
in an automated way. The concept is to use a coverage layer, which contains
geometries and fields. For each geometry in the coverage layer, a new output
will be generated where the content of some canvas maps will be moved to
highlight the current geometry. Fields associated with this geometry can be used
within text labels.

Every page will be generated with each feature. To enable the generation
of an atlas and access generation parameters, refer to the `Atlas generation`
tab. This tab contains the following widgets (see Figure_composer_30_):

.. _figure_composer_30:

.. only:: html

   **Figure Composer 30:**

.. figure:: /static/user_manual/print_composer/print_composer_atlas.png
   :align: center

   Atlas generation tab |nix|

* |checkbox| :guilabel:`Generate an atlas`, which enables or disables the atlas generation.
* A :guilabel:`Coverage layer` |selectstring| combo box that allows you to choose the
  (vector) layer containing the geometries on which to iterate over.
* An optional |checkbox| :guilabel:`Hidden coverage layer` that, if checked, will
  hide the coverage layer (but not the other ones) during the generation.
* An optional :guilabel:`Filter with` text area that allows you to specify an
  expression for filtering features from the coverage layer. If the expression
  is not empty, only features that evaluate to ``True`` will be selected. The
  button on the right allows you to display the expression builder.
* An :guilabel:`Output filename expression` textbox that is used to generate a
  filename for each geometry if needed. It is based on expressions. This field is
  meaningful only for rendering to multiple files.
* A |checkbox| :guilabel:`Single file export when possible` that allows you to force
  the generation of a single file if this is possible with the chosen output format
  (PDF, for instance). If this field is checked, the value of the
  :guilabel:`Output filename expression` field is meaningless.
* An optional |checkbox| :guilabel:`Sort by` that, if checked, allows you to
  sort features of the coverage layer. The associated combo box allows you to choose
  which column will be used as the sorting key. Sort order (either ascending or
  descending) is set by a two-state button that displays an up or a down arrow.


You can use multiple map items with the atlas generation; each map will be rendered according
to the coverage features. To enable atlas generation for a specific map item, you need to check
|checkbox|:guilabel:`Controlled by Atlas` under the item properties of the map item. Once checked, you can set:

* An input box :guilabel:`Margin around feature` that allows you to select the amount
  of space added around each geometry within the allocated map. Its value is
  meaningful only when using the auto-scaling mode.
* A |checkbox| :guilabel:`Fixed scale` that allows you to toggle between auto-scale
  and fixed-scale mode. In fixed-scale mode, the map will only be translated for
  each geometry to be centered. In auto-scale mode, the map's extents are computed
  in such a way that each geometry will appear in its entirety.

Labels
------

In order to adapt labels to the feature the atlas plugin iterates over, use a label with this special notation
`[%expression using field_name%]`.
For example, for a city layer with fields CITY_NAME and ZIPCODE, you could insert this:

"`[% 'The area of ' || upper(CITY_NAME) || ',' || ZIPCODE || ' is ' format_number($area/1000000,2) || ' km2' %]`"

That would result in the generated atlas as

"`The area of PARIS,75001 is 1.94 km2`".


Preview
-------

Once the atlas settings have been configured and map items selected, you can create a preview of all the pages by
clicking on :menuselection:`Atlas --> Preview Atlas` and using the arrows, in the same menu, to navigate
through all the features.

Generation
----------

The atlas generation can be done in different ways. For example, with :menuselection:`Atlas --> Print Atlas`, you can directly print it. You can also create a PDF using :menuselection:`Atlas --> Export Atlas as PDF`: The user will be asked for a directory for saving all the generated PDF files (except if the |checkbox| :guilabel:`Single file export when possible` has been selected).
If you need to print just a page of the atlas, simply start the preview function, select the page you need and click on :menuselection:`Composer --> Print` (or create a PDF).

.. index::
   single:Printing; Export_Map

Creating Output
===============

Figure_composer_31_ shows the Print Composer with an example print layout,
including each type of map element described in the sections above.

.. _figure_composer_31:

.. only:: html

   **Figure Composer 31:**

.. figure:: /static/user_manual/print_composer/print_composer_complete.png
   :align: center

   Print Composer with map view, legend, image, scale bar, coordinates, text and HTML frame added |nix|

.. index:: Export_as_image, Export_as_PDF, Export_as_SVG

The Print Composer allows you to create several output formats, and it is possible
to define the resolution (print quality) and paper size:

* The |mActionFilePrint| :sup:`Print` icon allows you to print the layout to a
  connected printer or a PostScript file, depending on installed printer drivers.
* The |mActionSaveMapAsImage| :sup:`Export as image` icon exports the Composer
  canvas in several image formats, such as PNG, BPM, TIF, JPG,...
* |mActionSaveAsPDF| :sup:`Export as PDF` saves the defined Print Composer
  canvas directly as a PDF.
* The |mActionSaveAsSVG| :sup:`Export as SVG` icon saves the Print Composer canvas
  as an SVG (Scalable Vector Graphic).

If you need to export your layout as a **georeferenced image** (i.e., to load back
inside |qg|), you need to enable this feature under the Composition tab. Check 
|checkbox| :guilabel:`World file on` and choose the map item to use. With this option, the
'Export as image' action will create also a world file.

.. note::

   Currently, the SVG output is very basic. This is not a |qg| problem, but a
   problem with the underlying Qt library. This will hopefully be sorted out in
   future versions.
   Exporting big rasters can sometimes fail, even if there seems to be enough memory.
   This is also a problem with the underlying Qt management of rasters.

.. index:: Composer_Manager

Manage the Composer
===================

With the |mActionFileSaveAs| :sup:`Save as template` and |mActionFileOpen|
:sup:`Load from template` icons, you can save the current state of a Print Composer
session as a  :file:`.qpt` template and load the template again in another session.

The  |mActionComposerManager| :sup:`Composer Manager` button in the |qg| toolbar
and in :menuselection:`Composer --> Composer Manager` allows you to add a new Composer
template, create a new composition based on a previously saved template or to manage 
already existing templates.

.. _figure_composer_32:

.. only:: html

   **Figure Composer 32:**

.. figure:: /static/user_manual/print_composer/print_composer_manager.png
   :align: center

   The Print Composer Manager |nix|

By default, the Composer manager searches for user templates in ~/.qgis2/composer_template.

The |mActionNewComposer| :sup:`New Composer` and |mActionDupComposer| :sup:`Duplicate Composer` 
buttons in the |qg| toolbar and in :menuselection:`Composer --> New Composer` and  
:menuselection:`Composer --> Duplicate Composer` allow you to open a new Composer dialog, or to 
duplicate an existing composition from a previously created one.

Finally, you can save your print composition with the |mActionFileSave| :sup:`Save Project` button. 
This is the same feature as in the |qg| main window. All changes will be saved in a |qg| project 
file.  
