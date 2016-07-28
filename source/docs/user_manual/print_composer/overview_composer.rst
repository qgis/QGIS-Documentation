|updatedisclaimer|

.. _overview_composer:

********************************
 Overview of the Print Composer
********************************

.. only:: html

   .. contents::
      :local:

The Print Composer provides growing layout and printing capabilities. It allows
you to add elements such as the QGIS map canvas, text labels, images, legends,
scale bars, basic shapes, arrows, attribute tables and HTML frames. You can size,
group, align, position and rotate each element and adjust their properties to
create your layout. The layout can be printed or exported to image formats,
PostScript, PDF or to SVG (export to SVG is not working properly with some
recent Qt4 versions; you should try and check individually on your system).
You can save the layout as a template and load it again in another session. Finally,
generating several maps based on a template can be done through the atlas generator.


.. index::
   single:Composer_Template
.. index::
   single:Map_Template



Sample Session
==============

Before you start to work with the Print Composer, you need to load some raster
or vector layers in the QGIS map canvas and adapt their properties to suit your
own convenience. After everything is rendered and symbolized to your liking,
click the |newComposer| :sup:`New Print Composer` icon in the toolbar or
choose :menuselection:`File --> New Print Composer`. You will be prompted to
choose a title for the new Composer.


To demonstrate how to create a map please follow the next instructions.

#. On the left side, select the |addMap| :sup:`Add new map` toolbar button
   and draw a rectangle on the canvas holding down the left mouse button.
   Inside the drawn rectangle the QGIS map view to the canvas.
#. Select the |scaleBar| :sup:`Add new scalebar` toolbar button and click
   with the left mouse button on the Print Composer canvas. A scalebar will be
   added to the canvas.
#. Select the |addLegend| :sup:`Add new legend` toolbar button and draw a
   rectangle on the canvas holding down the left mouse button.
   Inside the drawn rectangle the legend will be drawn.
#. Select the |select| :sup:`Select/Move item` icon to select the map on
   the canvas and move it a bit.
#. While the map item is still selected you can also change the size of the map item.
   Click while holding down the left mouse button, in a white little rectangle in one
   of the corners of the map item and drag it to a new location to change it's size.
#. Click the :guilabel:`Item Properties` tab on the left lower panel and find the setting
   for the orientation. Change the value of the setting :guilabel:`Map orientation` to
   '15.00\ |degrees| '. You should see the orientation of the map item change.
#. Now, you can print or export your print composition to image formats, PDF or to SVG
   with the export tools in Composer menu.
#. Finally, you can save your print composition within the project file with the
   |fileSave| :sup:`Save Project` button.


You can add multiple elements to the Composer. It is also possible to have more
than one map view or legend or scale bar in the Print Composer canvas, on one or
several pages. Each element has its own properties and, in the case of the map,
its own extent. If you want to remove any elements from the Composer canvas you
can do that with the :kbd:`Delete` or the :kbd:`Backspace` key.


.. index:: Composer_Manager

.. _composer_manager:

The Composer Manager
====================

The Composer Manager is the main window to manage print composers in the project.
It helps you add new print composer, duplicate an existing one, rename or delete it.
To open the composer manager dialog, click on the |composerManager|
:sup:`Composer Manager` button in the toolbar or choose :menuselection:`Composer
--> Composer Manager`. It can also be reached from the main window of QGIS with
:menuselection:`Project --> Composer Manager`.


.. _figure_composer_manager:

.. only:: html

   **Figure Composer Manager:**

.. figure:: /static/user_manual/print_composer/print_composer_manager.png
   :align: center

   The Print Composer Manager


The composer manager lists in its upper part all the available print composers in the project.
The bottom part shows tools that help to:

* show the selected composer(s): you can open multiple print composers in one-click
* duplicate the selected composer (available only if one print composer is selected):
  it creates a new composer using the selected composer as template.
  You'll be prompted to choose a new title for the new composer
* rename the composer (also available only if one print composer is selected):
  You'll be prompted to choose a new title for the composer. Note that you can
  also rename the composer by double-clicking on its title in the upper part
* remove the composer: the selected print composer(s) will be deleted from the project.

With the Composer Manager, it's also possible to create new print composers as an
empty composer or from a saved template. By default, QGIS will look for templates
in user directory (:file:`~/.qgis2/composer_templates`) or application's one
(:file:`ApplicationFolder/composer_templates`).
QGIS will retrieve all the available templates and propose them in the combobox.
The selected template will be used to create a new composer when clicking
:guilabel:`Add` button.
You can also save composer templates in another folder.
Choosing *specific* in the template list offers the ability to select such
template and use it to create a new print composer.

.. print_composer_menus:

Menus, tools and panels of the print composer
=============================================

Opening the Print Composer provides you with a blank canvas that represents
the paper surface when using the print option. Initially you find buttons on
the left beside the canvas to add map composer items: the current QGIS map canvas,
text labels, images, legends, scale bars, basic shapes, arrows, attribute tables
and HTML frames. In this toolbar you also find toolbar buttons to navigate,
zoom in on an area and pan the view on the composer and toolbar buttons to
select a map composer item and to move the contents of the map item.


Figure_composer_overview_ shows the initial view of the Print Composer before
any elements are added.

.. _Figure_composer_overview:

.. only:: html

   **Figure Composer Overview:**

.. figure:: /static/user_manual/print_composer/print_composer_blank.png
   :align: center

   Print Composer


On the right beside the canvas you find two panels.
The upper panel holds the tabs :guilabel:`Items` and :guilabel:`Command History`
and the lower panel holds the tabs :guilabel:`Composition`, :guilabel:`Item properties`
and :guilabel:`Atlas generation`.

* The :guilabel:`Items` tab provides a list of all map composer items added to the canvas.
* The :guilabel:`Command history` tab displays a history of all changes applied
  to the Print Composer layout. With a mouse click, it is possible to undo and
  redo layout steps back and forth to a certain status.
* The :guilabel:`Composition` tab allows you to set paper size, orientation, the page
  background, number of pages and print quality for the output file in dpi. Furthermore,
  you can also activate the |checkbox| :guilabel:`Print as raster` checkbox. This means
  all items will be converted to raster before printing or saving as PostScript or PDF.
  In this tab, you can also customize settings for grid and smart guides.
* The :guilabel:`Item Properties` tab displays the properties for the selected
  item. Click the |select| :sup:`Select/Move item` icon to select
  an item (e.g., legend, scale bar or label) on the canvas. Then click the
  :guilabel:`Item Properties` tab and customize the settings for the selected
  item.
* The :guilabel:`Atlas generation` tab allows you to enable the generation of an
  atlas for the current Composer and gives access to its parameters.


In the bottom part of the Print Composer window, you can find a status bar with
mouse position, current page number, a combo box to set the zoom level,
the number of selected items if applicable and, in the case of atlas generation,
the number of features.

In the upper part of the Print composer window, you can find menus and other toolbars.
All Print Composer tools are available in menus and as icons in a toolbar.
See a list of tools in table_composer_1_.

The toolbars and the tabs can be switched off and on using the right mouse button
over any toolbar or through :menuselection:`View --> Toolbars` or
:menuselection:`View --> Panels`.


.. index::
   single: print_composer;tools

.. _composer_tools:

Tools
-----

.. _table_composer_1:

+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| Icon                  | Purpose                               | Icon                | Purpose                                  |
+=======================+=======================================+=====================+==========================================+
| |fileSave|            | Save Project                          | |newComposer|       | New Composer                             |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |duplicateComposer|   | Duplicate Composer                    | |composerManager|   | Composer Manager                         |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |fileOpen|            | Load from template                    | |fileSaveAs|        | Save as template                         |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |filePrint|           | Print or export as PostScript         | |saveMapAsImage|    | Export to an image format                |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |saveAsSVG|           | Export print composition to SVG       | |saveAsPDF|         | Export as PDF                            |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |undo|                | Revert last change                    | |redo|              | Restore last change                      |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |zoomFullExtent|      | Zoom to full extent                   | |zoomActual|        | Zoom to 100%                             |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |zoomIn|              | Zoom in                               | |zoomIn|            | Zoom out                                 |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |draw|                | Refresh View                          |                     |                                          |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |pan|                 | Pan                                   | |zoomToArea|        | Zoom to specific region                  |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |select|              | Select/Move item in print composition | |moveItemContent|   | Move content within an item              |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |addMap|              | Add new map from QGIS map canvas      | |addImage|          | Add image to print composition           |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |label|               | Add label to print composition        | |addLegend|         | Add new legend to print composition      |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |scaleBar|            | Add scale bar to print composition    | |addBasicShape|     | Add basic shape to print composition     |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |addArrow|            | Add arrow to print composition        | |openTable|         | Add attribute table to print composition |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |addHtml|             | Add an HTML frame                     | |addNodesShape|     | Add nodes shape to print composition     |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |editNodesShape|      | Edit a nodes shape                    |                     |                                          |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |groupItems|          | Group items of print composition      | |ungroupItems|      | Ungroup items of print composition       |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |locked|              | Lock Selected Items                   | |unlocked|          | Unlock All items                         |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |raiseItems|          | Raise selected items                  | |lowerItems|        | Lower selected items                     |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |moveItemsToTop|      | Move selected items to top            | |moveItemsToBottom| | Move selected items to bottom            |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |alignLeft|           | Align selected items left             | |alignRight|        | Align selected items right               |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |alignHCenter|        | Align selected items center           | |alignVCenter|      | Align selected items center vertical     |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |alignTop|            | Align selected items top              | |alignBottom|       | Align selected items bottom              |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |atlas|               | Preview Atlas                         | |atlasFirst|        | First Feature                            |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |atlasPrev|           | Previous Feature                      |  |atlasNext|        | Next Feature                             |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |atlasLast|           | Last feature                          |  |filePrint|        | Print Atlas                              |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+
| |saveMapAsImage|      | Export Atlas as Image                 |  |atlasSettings|    | Atlas Settings                           |
+-----------------------+---------------------------------------+---------------------+------------------------------------------+

Table Composer 1: Print Composer Tools

Composer Menu
-------------

With the :menuselection:`Composer --> Save Project` action, you can save
the project file directly from the print composer window.
The :menuselection:`Composer` menu also provides actions to:

* Create a new and blank print composer with |newComposer| :sup:`New Composer...`
* |duplicateComposer| :sup:`Duplicate Composer...` : Create a new print composer
  by duplicating the current one
* Open the |composerManager| :sup:`Composer Manager...`
* :guilabel:`Print Composers...` : Open an existing print composer

Once the layout is designed, with |fileSaveAs| :sup:`Save as template`
and |fileOpen| :sup:`Add items from template` icons, you can save
the current state of a Print Composer session as a :file:`.qpt` template
and load its item again in another session.

In the :menuselection:`Composer` menu, there are also powerful ways to share
geographical information produced with QGIS that can be included in reports or
published. These tools are |saveMapAsImage| :sup:`Export as Image...`,
|saveAsPDF| :sup:`Export as PDF...`, |saveAsSVG| :sup:`Export as
SVG...` and |filePrint| :sup:`Print...`.

Settings Menu
-------------

From :menuselection:`Settings --> Composer Options` you can set some options
that will be used as default on any composer during your work.

* :guilabel:`Compositions defaults` let you specify the default font to use.
* With :guilabel:`Grid appearance`, you can set the grid style and its color.
  There are three types of grid: **Dots**, **Solid** lines and **Crosses**.
* :guilabel:`Grid and guide defaults` defines spacing, offset and tolerance of the grid.


Edit Menu
---------

Copy/Cut and Paste Items
........................

The print composer includes actions to use the common Copy/Cut/Paste functionality
for the items in the layout. As usual first you need to select the items using
one of the options seen above; at this point the actions can be found in the
:menuselection:`Edit` menu.
When using the Paste action, the elements will be pasted according to the current
mouse position. Using the :menuselection:`Edit --> Paste in Place` action or
pressing :kbd:`Ctrl+Shift+V` will paste the items into the current page, at the
same position they were in their initial page. It ensures to copy/paste items at
the same place, from page to page.

.. note::
   HTML items can not be copied in this way. As a workaround, use the **[Add Frame]**
   button in the :menuselection:`Item Properties` tab.


View Menu
---------

Navigation Tools
................

To navigate in the canvas layout, the Print Composer provides some general tools:

* |zoomIn| :sup:`Zoom In`
* |zoomOut| :sup:`Zoom Out`
* |zoomFullExtent| :sup:`Zoom Full`
* |zoomActual| :sup:`Zoom to 100%`
* |draw| :sup:`Refresh view` (if you find the view in an inconsistent state)
* `Show Grid` behind items.
* `Snap Grid` to snap items on the grid.
* `Show Guides` to help user to align items. These are red line that you can
  click in the rule (above or at the left side of the layout) and drag and drop
  to the desired location.
* `Snap Guides`: allows user to snap items to the guides,
* `Smart Guides`: uses other composer items as guides to dynamically snap to as user
  moves or reshapes an item.
* `Clear Guides` to remove all current guides.
* `Show Bounding box` around the items.
* `Show Rules` around the layout.
* `Show Pages` or set up pages to transparent. Often composer is used
  to create non-print layouts, e.g. for inclusion in presentations or other
  documents, and it's desirable to export the composition using a totally
  transparent background. It's sometimes referred to as "infinite canvas" in
  other editing packages.
* `Toggle Full Screen` makes the composer window to full screen.
* `Hide Panels` hides/shows the right panel
* `Panels` lists all panels available to hide/show them.
* `Toolbars` same as above for toolbars.

You can change the zoom level also using the mouse wheel or the combo box in the status bar.
If you need to switch to pan mode while working in the Composer area, you can hold
the :kbd:`Spacebar` or the mouse wheel.
With :kbd:`Ctrl+Spacebar`, you can temporarily switch to Zoom In mode,
and with :kbd:`Ctrl+Shift+Spacebar`, to Zoom Out mode.


Hide and Show Panels
.....................

To maximise the space available to interact with a composition you can use
:menuselection:`View -->` |checkbox| :guilabel:`Hide panels` or press :kbd:`F10`.


.. note::

   It's also possible to switch to a full screen mode to have more space to
   interact by pressing :kbd:`F11` or using :menuselection:`View -->` |checkbox|
   :guilabel:`Toggle full screen`.


Composition Tab
---------------

Page size and settings
......................

In the :guilabel:`Composition` tab, you can define the global settings of the
current composition.


.. _figure_composition_1:

.. only:: html

   **Figure Composition 1:**

.. figure:: /static/user_manual/print_composer/composition_settings.png
   :align: center

   Composition settings in the Print Composer

You can choose one of the :guilabel:`Presets` formats for your paper sheet,
or enter your custom :guilabel:`width`, :guilabel:`height` and :guilabel:`units`.
You can also choose the page :guilabel:`Orientation` to use.

Composition can be divided into several pages. For instance, a first page can show
a map canvas, and a second page can show the attribute table associated with a
layer, while a third one shows an HTML frame linking to your organization website.
Set the :guilabel:`Number of pages` to the desired value. you can also custom the
:guilabel:`Page Background` with the color or the symbol you want.

The Page size options apply to all the pages in the composition. However, you can
modify the values using the data defined override options (see :ref:`atlas_data_defined_override`).

A custom page size can also be set, using the :guilabel:`Resize page` tool.
This creates an unique page composition, resizes the page to fit the current
contents of the composition (with optional margins).


Export settings
...............

You can define a resolution to use for all exported maps in :guilabel:`Export
resolution`. This setting can however be overridden each time you are exporting a map.
When checked, |checkbox| :guilabel:`print as raster` means all elements will be
rasterized before printing or saving as PostScript or PDF.

While exporting to an image file format, you can choose to generate a world file
by checking |checkbox| :guilabel:`World file on` and select a map item.
The world file is created beside the exported map, has same name and contains
information to easily georeference it.

.. _figure_composition_2:

.. only:: html

   **Figure Composition 2:**

.. figure:: /static/user_manual/print_composer/composition_export.png
   :align: center

   Export Settings in the Print Composer

Grid and guides
...............

You can put some reference marks on your composition paper sheet to help you
place some items. These marks can be:

* simple lines (called **Guides**) put at the position you want. To do that,
  ensure that :guilabel:`Show Rulers` and :guilabel:`Show Guides` in :menuselection:`View`
  menu are checked. Then, click and drag from within the ruler to the paper sheet.
  A vertical or horizontal line is added to the paper and you can set its position
  following the coordinates displayed at the left bottom of the composer dialog.
* or regular **Grid**.

Whether grids or guides should be shown is set in :menuselection:`View` menu.
There, you can also decide if they might be used to snap composer items. The
:guilabel:`Grid and guides` section lets you customize grid settings like
:guilabel:`Grid spacing`, :guilabel:`Grid offset` and :guilabel:`Snap tolerance`
to your need. The tolerance is the maximum distance below which an item is snapped
to a grid or a guide.

.. _figure_composition_3:

.. only:: html

   **Figure Composition 3:**

.. figure:: /static/user_manual/print_composer/composition_guides.png
   :align: center

   Snapping to grids in the Print Composer

In the :menuselection:`Options --> Composer` menu in QGIS main canvas, you can
also set the spacing, offset and snap tolerance of the grid as much as its style
and color. These options are applied by default to any new print composer.


.. index:: Revert_Layout_Actions

Command History Tab: Revert and Restore actions
-----------------------------------------------

During the layout process, it is possible to revert and restore changes.
This can be done with the revert and restore tools:

* |undo| :sup:`Revert last change`
* |redo| :sup:`Restore last change`

This can also be done by mouse click within the :guilabel:`Command history` tab
(see figure_composer_1_). The History tab lists the last actions done within the composer.
Just select the point you want to revert to and once you do new action all
the actions done after the selected one will be removed.

.. _figure_composer_1:

.. only:: html

   **Figure Composer 1:**

.. figure:: /static/user_manual/print_composer/command_hist.png
   :align: center

   Command history in the Print Composer


Items Tab
---------

The :menuselection:`Items` tab offers some options to manage selection and
visibility of items.
All the items added to the print composer canvas are shown in a list and
selecting an item makes the corresponding row selected in the list as well as
selecting a row does select the corresponding item in the print composer canvas.
This is thus a handy way to select an item placed behind another one.
Note that a selected row is shown as bold.

For any selected item, you can :

* |showAllLayers| set it visible or not,
* |locked| lock or unlock its position,
* order its Z position. You can move up and down each item in the list with a
  click and drag. The upper item in the list will be brought to the foreground
  in the print composer canvas.
  By default, a newly created item is placed in the foreground.
* change the name by double-clicking the text.

Once you have found the correct position for an item, you can lock it by ticking
the box in |locked| column. Locked items are **not** selectable on the canvas.
Locked items can be unlocked by selecting the item in the :menuselection:`Items`
tab and unchecking the tickbox or you can use the icons on the toolbar.

