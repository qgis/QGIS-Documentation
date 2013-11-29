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

.. image:: ../_static/map_composer/003.png
   :align: center

Whichever route you take to get there, you will now see the :guilabel:`Print
Composer` window.

|basic| |FA| Basic Map Composition
-------------------------------------------------------------------------------

In this example, the composition was already the way we wanted it. Ensure that
yours is as well.

* Check that the values under :menuselection:`General --> Composition --> Paper
  and Quality` are set to the following:

- :guilabel:`Size`: :kbd:`A4 (210x297mm)`
- :guilabel:`Orientation`: :kbd:`Landscape`
- :guilabel:`Quality`: :kbd:`300dpi`

Now you've got the page layout the way you wanted it, but this page is still
blank. It clearly lacks a map. Let's fix that!

* Click on the :guilabel:`Add New Map` button:

.. image:: ../_static/map_composer/005.png
   :align: center

With this tool activated, you'll be able to place a map on the page.

* Click and drag a box on the blank page:

.. image:: ../_static/map_composer/006.png
   :align: center

The map will appear on the page.

* Move the map by clicking and dragging it around:

.. image:: ../_static/map_composer/007.png
   :align: center

* Resize it by clicking and dragging the boxes in the corners:

.. image:: ../_static/map_composer/008.png
   :align: center

.. note::  Your map may look a lot different, of course! This depends on how
   your own project is set up. But not to worry! These instructions are
   general, so they will work the same regardless of what the map itself looks
   like.

* Be sure to leave margins along the edges, and a space along the top for the
  title:

.. image:: ../_static/map_composer/009.png
   :align: center

* Zoom in and out on the page (but not the map!) by using these buttons:

.. image:: ../_static/map_composer/010.png
   :align: center

* Zoom and pan the map in the main QGIS window. You can also pan the map using
  the :guilabel:`Move item content` tool:

.. image:: ../_static/map_composer/023.png
   :align: center

When zooming in, the map view will not refresh by itself. This is so that it
doesn't waste your time redrawing the map while you're zooming the page to
where you want it, but it also means that if you zoom in or out, the map will
be at the wrong resolution and will look ugly or unreadable.

* Force the map to refresh by clicking this button:

.. image:: ../_static/map_composer/011.png
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

Now your map is looking good on the page, but the reader is not being told
what's going on yet. They need some context, which is what you'll provide for
them by adding map elements. First, let's add a title.

* Click on this button:

.. image:: ../_static/map_composer/012.png
   :align: center

* Click on the page, and a label will appear:

.. image:: ../_static/map_composer/013.png
   :align: center

* Resize it and place it in the top center of the page. It can be resized and
  moved in the same way that you resized and moved the map.

.. image:: ../_static/map_composer/014.png
   :align: center

But if you tried it, you'll see that it's difficult to align the label to be
completely centered to the map! Luckily, there's a tool for that.

* Click the map to select it. 
* Hold in :kbd:`shift` on your keyboard and click on the label.
* Look for this tool (but don't click it yet):

.. image:: ../_static/map_composer/015.png
   :align: center

* Click on the downwards arrow next to the button. 
* Click :guilabel:`Align center`:

.. image:: ../_static/map_composer/016.png
   :align: center

To make sure that you don't accidentally move these elements around now that
you've aligned them:

* Right-click on both the map and the label.

A small lock icon will appear in the corner to tell you that an element can't
be dragged right now. You can always right-click on an element again to unlock
it, though.

Now the label is centered to the map, but not the contents. To center the
contents of the label:

* Select the label by clicking on it.
* Click on the :guilabel:`Item` tab in the side panel of the
  :guilabel:`Composer` window.
* Change the text of the label to "Swellendam":

.. image:: ../_static/map_composer/017.png
   :align: center

* Use this interface to set the font and alignment options:

.. image:: ../_static/map_composer/018.png
   :align: center

* Choose a large but sensible font (the example will use the default font with
  a size of :kbd:`48`), and keep the color subdued.

In fact, it's probably best to keep it black as per the default. The key is
that the font should not be distracting, otherwise people who see the page will
be looking at the heading instead of reading the map!

* Set the :guilabel:`Horizontal Alignment` to :guilabel:`Center`, so that the
  heading is properly centered within the label.

.. image:: ../_static/map_composer/019.png
   :align: center

This is progressing nicely, but the label still has an unnecessary frame around
it:

.. image:: ../_static/map_composer/020.png
   :align: center

Let's get rid of it.

* Click on the :guilabel:`General options` slider at the bottom of the
  :guilabel:`Item` tab. The :guilabel:`Label` slider will slide away and you
  will see a new interface.
* Click the :guilabel:`Show frame` checkbox to disable the frame:

.. image:: ../_static/map_composer/021.png
   :align: center

Here is our page so far:

.. image:: ../_static/map_composer/022.png
   :align: center

|basic| |FA| Adding a Legend
-------------------------------------------------------------------------------

The map reader also needs to be able to see what various things on the map
actually mean. In some cases, like the place names, this is quite obvious. In
other cases, it's more difficult to guess, like the colors of the farms. Let's
add a new legend.

* Click on this button:

.. image:: ../_static/map_composer/024.png
   :align: center

* Click on the page to place the legend, and move it to where you want it:

.. image:: ../_static/map_composer/025.png
   :align: center

|moderate| |FA| Customizing Legend Items
-------------------------------------------------------------------------------

Not everything on the legend is necessary, so let's remove some unwanted items.

* In the :guilabel:`Item` tab, click on the :guilabel:`Legend items` slider.
* Select the :guilabel:`places` entry.
* Delete it from the legend by clicking the :guilabel:`minus` button:

.. image:: ../_static/map_composer/026.png
   :align: center

You can also rename items.

* Select a layer from the same list.
* Click the :guilabel:`Edit` button:

.. image:: ../_static/map_composer/027.png
   :align: center

* Rename the layers to :kbd:`Roads and Streets`, :kbd:`Surface Water`,
  :kbd:`Urban Areas`, and :kbd:`Farms`.
* Click the down arrow next to any item with multiple classes to rename the
  classes (using the same method as above).

In the example, the :guilabel:`Farms` layer's areas were computed in units that
aren't easy to convert to land area directly.  If your farms are classified by
area or some other criteria, you should rename those classes to something that
would make sense to the map reader. In the example, we renamed the smallest
class :kbd:`small area` and the largest one :kbd:`large area`, with the one in
the middle :kbd:`moderate area` and the rest blanked out.

This is the result:

.. image:: ../_static/map_composer/028.png
   :align: center

|basic| |FA| Exporting Your Map
-------------------------------------------------------------------------------

.. note::  Did you remember to save your work often?

Finally the map is ready for export! You'll see the export buttons near the top
left corner of the :guilabel:`Composer` window:

.. image:: ../_static/map_composer/029.png
   :align: center

The button on the right is the :guilabel:`Print` button, which interfaces with
a printer. Since the printer options will differ depending on the model of
printer that you're working with, it's probably better to consult the printer
manual or a general guide to printing for more information on this topic.

The other three buttons allow you to export the map page to a file. There are
three export formats to choose from:

- :guilabel:`Export as Image`
- :guilabel:`Export as PDF`
- :guilabel:`Export as SVG`

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

* Click the :guilabel:`Export as PDF` button:

.. image:: ../_static/map_composer/030.png
   :align: center

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
