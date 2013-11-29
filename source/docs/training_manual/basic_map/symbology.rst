|LS| Symbology
===============================================================================

The symbology of a layer is its visual appearance on the map.
The basic strength of GIS over other ways of representing data with spatial
aspects is that with GIS, you have a dynamic visual representation of the data
you're working with.

Therefore, the visual appearance of the map (which depends on the symbology of
the individual layers) is very important. The end user of the maps you produce
will need to be able to easily see what the map represents. Equally as
important, you need to be able to explore the data as you're working with it,
and good symbology helps a lot.

In other words, having proper symbology is not a luxury or just nice to have.
In fact, it's essential for you to use a GIS properly and produce maps and
information that people will be able to use.

**The goal for this lesson:** To be able to create any symbology you want for
any vector layer.

|basic| |FA| Changing colors
-------------------------------------------------------------------------------

To change a layer's symbology, open its :guilabel:`Layer Properties`. Let's
begin by changing the color of the :guilabel:`urban` layer.

* Right-click on the :guilabel:`urban` layer in the Layers list.
* Select the menu item :guilabel:`Properties` in the menu that appears.

.. note:: By default, you can also access a layer's properties by
   double-clicking on the layer in the Layers list.

In the :guilabel:`Properties` window:

* Select the :guilabel:`Style` tab at the extreme left:

.. image:: ../_static/symbology/052.png
   :align: center

* Click the :guilabel:`Change` button next to the :guilabel:`Color` label.

A standard color dialog will appear.

* Choose a grey color and click :guilabel:`OK`.
* Click :guilabel:`OK` again in the :guilabel:`Layer Properties` window, and
  you will see the color change being applied to the layer.

.. image:: ../_static/symbology/019.png
   :align: center


.. _backlink-symbology-colors-1:

|basic| |TY|
-------------------------------------------------------------------------------

Change the :guilabel:`rural` layer to a new color that you associate with rural
farming areas.

:ref:`Check your results <symbology-colors-1>`

|basic| |FA| Changing symbol structure
-------------------------------------------------------------------------------

This is good stuff so far, but there's more to a layer's symbology than just
its color. Next we want to change the color of the farms (the :guilabel:`rural`
layer), but we also want to eliminate the lines between the different farms so
as to make the map less visually cluttered.

* Open the :guilabel:`Layer Properties` window for the :guilabel:`rural`
  layer.

Under the :guilabel:`Style` tab, you will see the same kind of dialog as
before. This time, however, you're doing more than just quickly changing the
color.

* Click on the :guilabel:`Change...` button below the color display:

.. image:: ../_static/symbology/053.png
   :align: center

The :guilabel:`Symbol properties` dialog will appear.

* Change the color inside the polygons in the layer by clicking the button next
  to the :guilabel:`Color` label (if you haven't done so already during the
  previous lesson).
* In the dialog that appears, choose a new color (that seems to suit a farm).
* Click :guilabel:`OK`, but only once.

Next, we want to get rid of the lines between all the farms.

* Click on the :guilabel:`Border style` dropdown. At the moment, it should be
  showing a short line and the words :guilabel:`Solid Line`.
* Change this to :guilabel:`No Pen`.
* Click :guilabel:`OK`, and then :guilabel:`OK` again.
  
Now the :guilabel:`rural` layer won't have any lines between farms.


.. _backlink-symbology-structure-1:

|basic| |TY|
-------------------------------------------------------------------------------

* Change the :guilabel:`urban` layer's symbology so that it is gray and without
  outlines.
* Change the :guilabel:`rural` layer again so that it has dotted outlines which
  are just a bit darker than the fill color for that layer.

:ref:`Check your results <symbology-structure-1>`

|moderate| |FA| Scale-based visibility
-------------------------------------------------------------------------------

Sometimes you will find that a layer is not suitable for a given scale. For
example, a dataset of all the continents may have low detail, and not be very
accurate at street level. When that happens, you want to be able to hide the
dataset at inappropriate scales.

In our case, we may decide to hide the streets from view at small scales. This
map, for example ...

.. image:: ../_static/symbology/049.png
   :align: center

... is not very useful. The streets are just a blob at that scale.

To enable scale-based rendering:

* Open the :guilabel:`Layer Properties` dialog for the :guilabel:`streets`
  layer.
* Activate the :guilabel:`General` tab.
* Enable scale-based rendering by clicking on the checkbox labeled
  :guilabel:`Use scale dependent rendering`:

.. image:: ../_static/symbology/050.png
   :align: center

* Change the :guilabel:`Maximum` value to :kbd:`100000`.
* Click :guilabel:`OK`.

Test the effects of this by zooming in and out in your map, noting when the
:guilabel:`streets` layer disappears and reappears.

.. note::  You can use your mouse wheel to zoom in increments.
   Alternatively, use the zoom tools to zoom to a window:
   
   .. image:: ../_static/symbology/051.png
      :align: center

|moderate| |FA| Adding symbol layers
-------------------------------------------------------------------------------

Now that you know how to change simple symbology for layers, the next step is
to create more complex symbology. QGIS allows you to do this using symbol
layers.

* Go back to the :guilabel:`rural` layer's :guilabel:`Symbol properties` dialog
  as before.

In this example, the current symbol has no outline (i.e., it uses the
:guilabel:`No Pen` border style).

.. image:: ../_static/symbology/054.png
   :align: center

Note the highlighted button.

* Click on it and the dialog will change to look somewhat like this:

.. image:: ../_static/symbology/010.png
   :align: center

(It may appear somewhat different in color, for example, but you're going to
change that anyway.)

Now there's a second symbol layer. Being a solid color, it will of course
completely hide the previous kind of symbol. Plus, it has a :guilabel:`Solid
Line` border style, which we don't want. Clearly this symbol has to be changed.

.. note::  It's important not to get confused between a map layer and a symbol
   layer. A map layer is a vector (or raster) that has been loaded into the
   map. A symbol layer is part of the symbol used to represent a map layer.
   This course will usually refer to a map layer as just a layer, but a symbol
   layer will always be called a symbol layer, to prevent confusion.

* Set the border style to :guilabel:`No Pen`, as before.
* Change the fill style to something other than :guilabel:`Solid` or
  :guilabel:`No brush`. For example:

.. image:: ../_static/symbology/011.png
   :align: center

* Click :guilabel:`OK` in this dialog and :guilabel:`Apply` in the one after
  that. Now you can see your results and tweak them as needed.

You can even add multiple extra symbol layers and create a kind of texture for
your layer that way.

.. image:: ../_static/symbology/012.png
   :align: center

It's fun! But it probably has too many colors to use in a real map...

.. _backlink-symbology-layers-1:

|moderate| |TY|
-------------------------------------------------------------------------------

* Create a simple, but not distracting texture for the :guilabel:`rural` layer
  using the methods above.

:ref:`Check your results <symbology-layers-1>`


|moderate| |FA| Enabling symbol levels
-------------------------------------------------------------------------------

When symbol layers are rendered, they are also rendered in a sequence, similar
to how the different map layers are rendered. This means that in some cases,
having many symbol layers in one symbol can cause unexpected results.

* Give the :guilabel:`streets` layer an extra symbol layer (using the methid
  for adding symbol layers demonstrated above).
* Give the base line a thickness of :kbd:`2.0`.
* Give the top layer a thickness of :kbd:`0.5`.

You'll notice that this happens:

.. image:: ../_static/symbology/014.png
   :align: center

Well that's not what we want at all!

To prevent this from happening, you can enable symbol levels, which will
control the order in which the different symbol layers are rendered.

* In the :guilabel:`Layer Properties` dialog, click on :menuselection:`Advanced
  --> Symbol levels`:

.. image:: ../_static/symbology/055.png
   :align: center

The :guilabel:`Symbol Levels` dialog will appear.

* Alter its values to match this example:

.. image:: ../_static/symbology/016.png
   :align: center

* Click :guilabel:`OK`, then :guilabel:`OK` again.

The map will now look like this:

.. image:: ../_static/symbology/017.png
   :align: center

When you're done, remember to save the symbol itself so as not to lose your
work if you change the symbol again in the future. You can save your current
symbol style by clicking the :guilabel:`Save Style ...` button under the
:guilabel:`Style` tab of the :guilabel:`Layer Properties` dialog. Save your
style under :kbd:`exercise_data/styles`.  You can load a previously saved style
at any time by clicking the :guilabel:`Load Style ...` button. Before you
change a style, keep in mind that any unsaved style you are replacing will be
lost.


.. _backlink-symbology-levels-1:

|moderate| |TY|
-------------------------------------------------------------------------------

* Change the appearance of the :guilabel:`streets` layer again.

The roads must be dark gray or black, with a thin yellow outline, and a dashed
white line running in the middle to make them resemble a real road.

.. image:: ../_static/symbology/027.png
   :align: center

:ref:`Check your results <symbology-levels-1>`


.. _backlink-symbology-levels-2:

|hard| |TY|
-------------------------------------------------------------------------------

Symbol levels also work for classified layers (i.e., layers having multiple
symbols).  Since we haven't covered classification yet, you will work with some
rudimentary preclassified data.

* Create a new map and add only the :guilabel:`streets` dataset.
* Apply the style :kbd:`advanced_levels_demo.qml` provided in :kbd:`exercise_data/styles`.
* Zoom to the Swellendam area (the cluster of roads near the center of the
  layer).
* Using symbol layers, ensure that the outlines of layers flow into one another
  as per the image below:

.. image:: ../_static/symbology/025.png
   :align: center

:ref:`Check your results <symbology-levels-2>`


|moderate| |FA| Symbol layer types
-------------------------------------------------------------------------------

In addition to setting fill colors and using predefined patterns, you can use
different symbol layer types entirely. The only type we've been using up to now
was the *Simple Fill* type. The more advanced symbol layer types allow you to
customize your symbols even further.

Each type of vector (point, line and polygon) has its own set of symbol layer
types. First we will look at the types available for points.

Point symbol layer types
...............................................................................

* Change the symbol properties for the :guilabel:`places` layer:

.. image:: ../_static/symbology/028.png
   :align: center

* You can access the various symbol layer types here:

.. image:: ../_static/symbology/029.png
   :align: center

* Investigate the various options available to you, and choose a symbol layer
  type other than the default :guilabel:`Simple Marker`.
* If in doubt, use an :guilabel:`Ellipse Marker`.
* Choose a white outline and black fill, with a :guilabel:`symbol width` of
  :kbd:`2,00` and :guilabel:`symbol height` of :kbd:`4,00`.

Line symbol layer types
...............................................................................

To see the various options available for line data:

* Change the symbol layer type for the :guilabel:`street` layer's topmost
  symbol layer:

.. image:: ../_static/symbology/030.png
   :align: center

* Click on the :guilabel:`Change` button next to the :guilabel:`Marker` label.
* Change the symbol properties to match this dialog:

.. image:: ../_static/symbology/031.png
   :align: center

* Change the interval to :kbd:`2,00`:

.. image:: ../_static/symbology/032.png
   :align: center

* Ensure that the symbol levels are correct before applying the style.

Once you have applied the style, take a look at its results on the map. As you
can see, these symbols change direction along with the road but don't always
bend along with it. This is useful for some purposes, but not for others. If
you prefer, you can change the symbol layer in question back to the way it was
before.

Polygon symbol layer types
...............................................................................

To see the various options available for polygon data:

* Change the symbol layer type for the :guilabel:`urban` layer, as before for
  the other layers.
* Investigate what the different options on the list can do.
* Choose one of them that you find suitable.
* If in doubt, use the :guilabel:`Point pattern fill` with the following
  options:

.. image:: ../_static/symbology/033.png
   :align: center

.. image:: ../_static/symbology/034.png
   :align: center

* Add a new symbol layer with a normal :guilabel:`Simple fill`.
* Make it gray with no outlines. 
* Move it underneath the point pattern symbol layer with the :guilabel:`Move
  down` button:

.. image:: ../_static/symbology/035.png
   :align: center

As a result, you have a textured symbol for the urban layer, with the added
benefit that you can change the size, shape and distance of the individual dots
that make up the texture.

|hard| |FA| Creating a custom SVG fill
-------------------------------------------------------------------------------

.. note::  To do this exercise, you will need to have the free vector editing
   software Inkscape installed.

* Start the Inkscape program.

You will see the following interface:

.. image:: ../_static/symbology/036.png
   :align: center

You should find this familiar if you have used other vector image editing
programs, like Corel.

* Change the canvas to a size appropriate for a small texture.
* Click on the menu item :menuselection:`File --> Document Properties`. This
  will give you the :guilabel:`Document Properties` dialog.
* Change the :guilabel:`Units` to :guilabel:`px`.
* Change the :guilabel:`Width` and :guilabel:`Height` to :kbd:`100`.
* Close the dialog when you are done.
* Click on the menu item :menuselection:`View --> Zoom --> Page` to see the
  page you are working with.
* Select the :guilabel:`Circle` tool:

.. image:: ../_static/symbology/038.png
   :align: center

* Click and drag on the page to draw an ellipse. To make the ellipse turn into
  a circle, hold the :kbd:`ctrl` button while you're drawing it.
* Right-click on the circle you just created and open its :guilabel:`Fill and
  Stroke`:

.. image:: ../_static/symbology/039.png
   :align: center

* Change the :guilabel:`Stroke paint` to green:

.. image:: ../_static/symbology/040.png
   :align: center

* Change the :guilabel:`Stroke style` to a thicker line:

.. image:: ../_static/symbology/041.png
   :align: center

* Draw a line using the :guilabel:`Line` tool:

.. image:: ../_static/symbology/042.png
   :align: center

* Click once to start the line. Hold :kbd:`ctrl` to make it snap to increments
  of 15 degrees.
* Click once to end the line segment, then right-click to finalize the line.
* Change its color and width as before and move it around as necessary, so that
  you end up with a symbol like this one:

.. image:: ../_static/symbology/044.png
   :align: center

* Save it under the directory that the course is in, under
  :kbd:`exercise_data/symbols`, as an SVG file.

In QGIS:

* Open the :guilabel:`Layer Properties` for the :guilabel:`rural` layer.
* Change the symbol structure to the following:

.. image:: ../_static/symbology/045.png
   :align: center

* Find your SVG image via the :guilabel:`Browse` button:

.. image:: ../_static/symbology/046.png
   :align: center

* Change the settings as shown:

.. image:: ../_static/symbology/047.png
   :align: center

Your rural layer should now have a texture like the one on this map:

.. image:: ../_static/symbology/048.png
   :align: center

|IC|
-------------------------------------------------------------------------------

Changing the symbology for the different layers has transformed a collection of
vector files into a legible map. Not only can you see what's happening, it's
even nice to look at!

|FR|
-------------------------------------------------------------------------------

`Examples of Beautiful Maps <http://gis.stackexchange.com/questions/3083/examples-of-beautiful-maps>`_

|WN|
-------------------------------------------------------------------------------

Changing symbols for whole layers is useful, but the information contained
within each layer is not yet available to someone reading these maps. What are
the streets called? Which administrative regions do certain areas belong to?
What are the relative surface areas of the farms? All of this information is
still hidden. The next lesson will explain how to represent this data on your
map.

.. note::  Did you remember to save your map recently?
