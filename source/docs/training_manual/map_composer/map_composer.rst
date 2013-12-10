|LS| Using Map Composer
===============================================================================

Now that you've got a map, you need to be able to print it or to export it to a
document. The reason is, a GIS map file is not an image! Rather, it saves the
state of the GIS program, with references to all the layers, their labels,
colors, etc. So for someone who doesn't have the data or the same GIS program
(such as QGIS), the map file will be useless. Luckily, QGIS can export its map
file to a format that anyone's computer can read, as well as printing out the
map if you have a printer connected. Both exporting and printing is handled via
the Map Composer.

**The goal for this lesson:** To use the QGIS Map Composer to create a basic
map with all the required settings.

|basic| |FA| The Composer Manager
-------------------------------------------------------------------------------

QGIS allows you to create multiple maps using the same map file. For this
reason, it has a tool called the :guilabel:`Composer Manager`.

* Click on the :menuselection:`File --> Composer Manager` menu entry to open
  this tool.  You'll see a blank :guilabel:`Composer manager` dialog appear.
* Click the :guilabel:`Add` button and a new composer will be added called
  :guilabel:`Composer 1` (it may be another number if you have tried using the
  :guilabel:`Composer Manager` before now).
* With your new composer selected, click on the :guilabel:`Rename` button and
  rename it to :kbd:`Swellendam`.
* Click :guilabel:`OK`.
* Click the :guilabel:`Show` button.

(You could also close the dialog and navigate to a composer via the
:menuselection:`File --> Print Composers` menus, as in the image below.)

.. image:: /static/training_manual/map_composer/print_composer_menu.png
   :align: center

Whichever route you take to get there, you will now see the :guilabel:`Print
Composer` window:

.. image:: /static/training_manual/map_composer/print_composer_dialog.png
   :align: center


|basic| |FA| Basic Map Composition
-------------------------------------------------------------------------------

In this example, the composition was already the way we wanted it. Ensure that
yours is as well.

* In the :guilabel:`Print Composer` window, check that the values under
  :menuselection:`Composition --> Paper and Quality` are set to the following:

- :guilabel:`Size`: :kbd:`A4 (210x297mm)`
- :guilabel:`Orientation`: :kbd:`Landscape`
- :guilabel:`Quality`: :kbd:`300dpi`

Now you've got the page layout the way you wanted it, but this page is still
blank. It clearly lacks a map. Let's fix that!

* Click on the :guilabel:`Add New Map` button: |mActionAddMap|

With this tool activated, you'll be able to place a map on the page.

* Click and drag a box on the blank page:

.. image:: /static/training_manual/map_composer/drag_add_map.png
   :align: center

The map will appear on the page.

* Move the map by clicking and dragging it around:

.. image:: /static/training_manual/map_composer/move_map.png
   :align: center

* Resize it by clicking and dragging the boxes in the corners:

.. image:: /static/training_manual/map_composer/resize_map.png
   :align: center

.. note::  Your map may look a lot different, of course! This depends on how
   your own project is set up. But not to worry! These instructions are
   general, so they will work the same regardless of what the map itself looks
   like.

* Be sure to leave margins along the edges, and a space along the top for the
  title.

* Zoom in and out on the page (but not the map!) by using these buttons:

  |mActionZoomFullExtent| |mActionZoomIn| |mActionZoomOut|

* Zoom and pan the map in the main QGIS window. You can also pan the map using
  the :guilabel:`Move item content` tool: |mActionMoveItemContent|

When zooming in, the map view will not refresh by itself. This is so that it
doesn't waste your time redrawing the map while you're zooming the page to
where you want it, but it also means that if you zoom in or out, the map will
be at the wrong resolution and will look ugly or unreadable.

* Force the map to refresh by clicking this button:

.. image:: /static/training_manual/map_composer/refresh_button.png
   :align: center

Remember that the size and position you've given the map doesn't need to be
final. You can always come back and change it later if you're not satisfied.
For now, you need to ensure that you've saved your work on this map. Because a
:guilabel:`Composer` in QGIS is part of the main map file, you'll need to save
your main project. Go to the main QGIS window (the one with the
:guilabel:`Layers list` and all the other familiar elements you were working
with before), and save your project from there as usual.

|basic| |FA| Adding a Title
-------------------------------------------------------------------------------

Now your map is looking good on the page, but your readers/users are not being
told what's going on yet. They need some context, which is what you'll provide
for them by adding map elements. First, let's add a title.

* Click on this button: |mActionLabel|

* Click on the page, above the map, and a label will appear:

.. image:: /static/training_manual/map_composer/add_label.png
   :align: center

* Resize it and place it in the top center of the page. It can be resized and
  moved in the same way that you resized and moved the map.

.. image:: /static/training_manual/map_composer/resize_label.png
   :align: center

As you move the title, you'll notice that guidelines appear to help you
position the title in the center of the page.

However, there is also a tool to help position the title relative to the map
(not the page):

|mActionAlignLeft|

* Click the map to select it.
* Hold in :kbd:`shift` on your keyboard and click on the label so that both the
  map and the label are selected.
* Look for the :guilabel:`Align` button |mActionAlignLeft| and click on the
  dropdown arrow next to it to reveal the positioning options and click
  :guilabel:`Align center`:

.. image:: /static/training_manual/map_composer/align_center_dropdown.png
   :align: center

To make sure that you don't accidentally move these elements around now that
you've aligned them:

* Right-click on both the map and the label.

A small lock icon will appear in the corner to tell you that an element can't
be dragged right now. You can always right-click on an element again to unlock
it, though.

.. image:: /static/training_manual/map_composer/title_map_locked.png
   :align: center

Now the label is centered to the map, but not the contents. To center the
contents of the label:

* Select the label by clicking on it.
* Click on the :guilabel:`Item Properties` tab in the side panel of the
  :guilabel:`Composer` window.
* Change the text of the label to "Swellendam":

* Use this interface to set the font and alignment options:

.. image:: /static/training_manual/map_composer/title_font_alignment.png
   :align: center

* Choose a large but sensible font (the example will use the default font with
  a size of :kbd:`48`) and set the :guilabel:`Horizontal Alignment` to
  :guilabel:`Center`.

You can also change the font color, but it's probably best to keep it black as
per the default.

The default setting is not to add a frame to the title's text box. However, if
you wish to add a frame, you can do so:

* In the :guilabel:`Item Properties` tab, scroll down until you see the
  :guilabel:`Frame` option.
* Click the :guilabel:`Frame` checkbox to enable the frame. You can also change
  the frame's color and width.

In this example, we won't enable the frame, so here is our page so far:

.. image:: /static/training_manual/map_composer/page_so_far.png
   :align: center

|basic| |FA| Adding a Legend
-------------------------------------------------------------------------------

The map reader also needs to be able to see what various things on the map
actually mean. In some cases, like the place names, this is quite obvious. In
other cases, it's more difficult to guess, like the colors of the farms. Let's
add a new legend.

* Click on this button: |mActionAddLegend|

* Click on the page to place the legend, and move it to where you want it:

.. image:: /static/training_manual/map_composer/legend_added.png
   :align: center

|moderate| |FA| Customizing Legend Items
-------------------------------------------------------------------------------

Not everything on the legend is necessary, so let's remove some unwanted items.

* In the :guilabel:`Item Properties` tab, you'll find the
  :guilabel:`Legend items` panel.
* Select the :guilabel:`places` entry.
* Delete it from the legend by clicking the :guilabel:`minus` button:
  |mActionSignMinus|

You can also rename items.

* Select a layer from the same list.
* Click the :guilabel:`Edit` button: |edit|

* Rename the layers to :kbd:`Roads and Streets`, :kbd:`Surface Water`,
  :kbd:`Urban Areas`, and :kbd:`Farms`.
* Click the down arrow next to any item with multiple classes to rename the
  classes (using the same method as above).

In the example, the :guilabel:`Farms` layer's areas were computed in units that
aren't easy to convert to land area directly.  If your farms are classified by
area or some other criteria, you should rename those classes to something that
would make sense to the map reader. In the example, we renamed the smallest
class :kbd:`Small Area` and the largest one :kbd:`Large Area`, with the one in
the middle :kbd:`Moderate Area`.

As the legend will likely be widened by the new layer names, you may wish to
move and resize the legend and or map. This is the result:

.. image:: /static/training_manual/map_composer/map_composer_result.png
   :align: center

|basic| |FA| Exporting Your Map
-------------------------------------------------------------------------------

.. note::  Did you remember to save your work often?

Finally the map is ready for export! You'll see the export buttons near the top
left corner of the :guilabel:`Composer` window:

  |mActionFilePrint| |mActionSaveMapAsImage| |mActionSaveAsSVG|
  |mActionSaveAsPDF|

The button on the left is the :guilabel:`Print` button, which interfaces with
a printer. Since the printer options will differ depending on the model of
printer that you're working with, it's probably better to consult the printer
manual or a general guide to printing for more information on this topic.

The other three buttons allow you to export the map page to a file. There are
three export formats to choose from:

- :guilabel:`Export as Image`
- :guilabel:`Export as SVG`
- :guilabel:`Export as PDF`

Exporting as an image will give you a selection of various common image formats
to choose from. This is probably the simplest option, but the image it creates
is "dead" and difficult to edit.

The other two options are more common.

If you're sending the map to a cartographer (who may want to edit the map for
publication), it's best to export as an SVG. SVG stands for "Scalable Vector
Graphic", and can be imported to programs like Inkscape or other vector image
editing software.

If you need to send the map to a client, it's most common to use a PDF, because
it's easier to set up printing options for a PDF. Some cartographers may prefer
PDF as well, if they have a program that allows them to import and edit this
format.

For our purposes, we're going to use PDF.

* Click the :guilabel:`Export as PDF` button: |mActionSaveAsPDF|

* Choose a save location and a file name as usual.
* Click :guilabel:`Save`.

|IC|
-------------------------------------------------------------------------------

* Close the :guilabel:`Composer` window.
* Save your map.
* Find your exported PDF using your operating system's file manager.
* Open it.
* Bask in its glory.

Congratulations on your first completed QGIS map project!

|WN|
-------------------------------------------------------------------------------

On the next page, you will be given an assignment to complete. This will allow
you to practice the techniques you have learned so far.
