|updatedisclaimer|


Overview of the Print Composer
==============================

Opening the Print Composer provides you with a blank canvas that represents the paper surface when using the print option. Initially you find buttons on the left beside the canvas to add map composer items: the current |qg| map canvas, text labels, images, legends, scale bars, basic shapes, arrows, attribute tables and HTML frames. In this toolbar you also find toolbar buttons to navigate, zoom in on an area and pan the view on the composer and toolbar buttons to select a map composer item and to move the contents of the map item.  

Figure_composer_overview_ shows the initial view of the Print Composer before any elements are added.

.. _Figure_composer_overview:

.. only:: html

   **Figure Composer Overview:**

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
  all items will be converted to raster before printing or saving as PostScript or PDF.
  In this tab, you can also customize settings for grid and smart guides.
* The :guilabel:`Item Properties` tab displays the properties for the selected
  item. Click the |mActionSelect| :sup:`Select/Move item` icon to select
  an item (e.g., legend, scale bar or label) on the canvas. Then click the
  :guilabel:`Item Properties` tab and customize the settings for the selected
  item.
* The :guilabel:`Atlas generation` tab allows you to enable the generation of an
  atlas for the current Composer and gives access to its parameters.


In the bottom part of the Print Composer window, you can find a status bar with 
mouse position, current page number, a combo box to set the zoom level, the number of selected items if applicable and, in the case of atlas generation, the number of features.

In the upper part of the Print composer window, you can find menus and other toolbars. All Print Composer tools are available in menus and as icons in a toolbar. 
See a list of tools in table_composer_1_.

The toolbars and the tabs can be switched off and on using the right mouse button over any toolbar or through :menuselection:`View --> Toolbars` or :menuselection:`View --> Panels`. 


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
| |locked|                 | Lock Selected Items                   | |unlocked|                 | Unlock All items                         |
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

Items tab
----------

The Items tab lists all the items added to the print composer canvas. For each element, you can set it visible or not, lock or unlock its position.
Once you have found the correct position for an item, you can lock it by ticking the box in |locked| column. Locked items are **not** selectable on the canvas. 

Locked items can be unlocked by selecting the item in the 
:menuselection:`Items` tab and unchecking the tickbox or you can use the icons 
on the toolbar.


.. index:: Revert_Layout_Actions

Command History tab : Revert and Restore tools
----------------------------------------------

During the layout process, it is possible to revert and restore changes). This can
be done with the revert and restore tools:

* |mActionUndo| :sup:`Revert last change`
* |mActionRedo| :sup:`Restore last change`

This can also be done by mouse click within the :guilabel:`Command history` tab (see figure_composer_1_). The History tab lists the last actions done within the composer.
Just select the point you want to revert to and once you do new action all the actions done after the selected one will be removed.

.. _figure_composer_1:

.. only:: html

   **Figure Composer 1:**

.. figure:: /static/user_manual/print_composer/command_hist.png
   :align: center

   Command history in the Print Composer |nix|



Composition tab --- General composition setup
---------------------------------------------

In the :guilabel:`Composition` tab, you can define the global settings of the current composition.

* You can choose one of the :guilabel:`Presets` for your paper sheet, or enter your custom :guilabel:`width` and :guilabel:`height`.
* Composition can now be divided into several pages. For instance, a first page can show a map canvas, and a second
  page can show the attribute table associated with a layer, while a third one shows an HTML frame linking to your organization website.
  Set the :guilabel:`Number of pages` to the desired value. You can choose the page :guilabel:`Orientation` and its :guilabel:`Exported resolution`. When checked, |checkbox| :guilabel:`print as raster` means all elements will be rasterized before printing or saving as PostScript or
  PDF.
* :guilabel:`Grid and guides` lets you customize grid settings like :guilabel:`spacings`, :guilabel:`offsets` and :guilabel:`tolerance` to your need. The tolerance
  is the maximum distance below which an item is snapped to smart guides.

Snap to grid and/or to smart guides can be enabled from the :menuselection:`View` menu. In this menu, you can also hide or show the grid and smart guides.


Menu and tools in the composer
-------------------------------

Print Composer Options
^^^^^^^^^^^^^^^^^^^^^^

From :menuselection:`Settings --> Composer Options` you can set some options that will be
used as default on any composer during your work.

* :guilabel:`Compositions defaults` let you specify the default font to use.
* With :guilabel:`Grid appearance`, you can set the grid style and its color.
  There are three types of grid: **Dots**, **Solid** lines and **Crosses**.
* :guilabel:`Grid and guide defaults` defines spacing, offset and tolerance of the grid. 


Copy/Cut and Paste items
^^^^^^^^^^^^^^^^^^^^^^^^

The print composer includes actions to use the common Copy/Cut/Paste functionality for the items
in the layout. As usual first you need to select the items using one of the options seen above;
at this point the actions can be found in the :menuselection:`Edit` menu. When using the Paste action, the elements
will be pasted according to the current mouse position.
When using the :menuselection:`Edit --> Paste in Place` action, the elements will be pasted in the current page, according to their position in their initial page. It ensures to copy/paste items at the same place, from page to page.

.. note::
   HTML items can not be copied in this way. As a workaround, use the **[Add Frame]** button in the :menuselection:`Item Properties` tab.

Hide and show panels
^^^^^^^^^^^^^^^^^^^^

To maximise the space available to interact with a composition you can use :menuselection:`View -->`
|checkbox| :guilabel:`Hide panels` or press :kbd:`F10`.

.. note::

   It's also possible to switch to a full screen mode to have more space to interact by pressing
   :kbd:`F11` or using :menuselection:`View -->` |checkbox| :guilabel:`Toggle full screen`.


Navigation tools
^^^^^^^^^^^^^^^^

To navigate in the canvas layout, the Print Composer provides some general tools:

* |mActionZoomIn| :sup:`Zoom in`
* |mActionZoomOut| :sup:`Zoom out`
* |mActionZoomFullExtent| :sup:`Zoom full`
* |mActionZoomActual| :sup:`Zoom to 100%`
* |mActionDraw| :sup:`Refresh view` (if you find the view in an inconsistent
  state)
* |mActionPan| :sup:`Pan composer`
* |mActionZoomToSelected| :sup:`Zoom` (zoom to a specific region of the Composer)

You can change the zoom level also using the mouse wheel or the combo box in the status
bar. If you need to switch to pan mode while working in the Composer area, you can
hold the :kbd:`Spacebar` or the mouse wheel.
With :kbd:`Ctrl+Spacebar`, you can temporarily switch to zoom in mode, and with 
:kbd:`Ctrl+Shift+Spacebar`, to zoom out mode.
