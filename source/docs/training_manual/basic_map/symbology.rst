.. only:: html

   |updatedisclaimer|

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

|basic| |FA| Changing Colors
-------------------------------------------------------------------------------

To change a layer's symbology, open its :guilabel:`Layer Properties`. Let's
begin by changing the color of the :guilabel:`landuse` layer.

* Right-click on the :guilabel:`landuse` layer in the Layers list.
* Select the menu item :guilabel:`Properties` in the menu that appears.

.. note:: By default, you can also access a layer's properties by
   double-clicking on the layer in the Layers list.

In the :guilabel:`Properties` window:

* Select the :guilabel:`Style` tab at the extreme left:

.. image:: img/layer_properties_style.png
   :align: center

* Click the color select button next to the :guilabel:`Color` label.

A standard color dialog will appear.

* Choose a gray color and click :guilabel:`OK`.
* Click :guilabel:`OK` again in the :guilabel:`Layer Properties` window, and
  you will see the color change being applied to the layer.

.. _backlink-symbology-colors-1:


|basic| |TY|
-------------------------------------------------------------------------------

Change the :guilabel:`water` layer to a light blue color.

:ref:`Check your results <symbology-colors-1>`


|basic| |FA| Changing Symbol Structure
-------------------------------------------------------------------------------

This is good stuff so far, but there's more to a layer's symbology than just
its color. Next we want to eliminate the lines between the different land use
areas so as to make the map less visually cluttered.

* Open the :guilabel:`Layer Properties` window for the :guilabel:`landuse`
  layer.

Under the :guilabel:`Style` tab, you will see the same kind of dialog as
before. This time, however, you're doing more than just quickly changing the
color.

* In the :guilabel:`Symbol Layers` panel, expand the :guilabel:`Fill` dropdown
  (if necessary) and select the :guilabel:`Simple fill` option:


.. image:: img/simple_fill_selected.png
   :align: center


* Click on the :guilabel:`Border style` dropdown. At the moment, it should be
  showing a short line and the words :guilabel:`Solid Line`.
* Change this to :guilabel:`No Pen`.
* Click :guilabel:`OK`.

Now the :guilabel:`landuse` layer won't have any lines between areas.


.. _backlink-symbology-structure-1:

|basic| |TY|
-------------------------------------------------------------------------------

* Change the :guilabel:`water` layer's symbology again so that it is has a
  darker blue outline.
* Change the :guilabel:`rivers` layer's symbology to a sensible representation
  of waterways.

:ref:`Check your results <symbology-structure-1>`

|moderate| |FA| Scale-Based Visibility
-------------------------------------------------------------------------------

Sometimes you will find that a layer is not suitable for a given scale. For
example, a dataset of all the continents may have low detail, and not be very
accurate at street level. When that happens, you want to be able to hide the
dataset at inappropriate scales.

In our case, we may decide to hide the buildings from view at small scales. This
map, for example ...

.. image:: img/buildings_small_scale.png
   :align: center

... is not very useful. The buildings are hard to distinguish at that scale.

To enable scale-based rendering:

* Open the :guilabel:`Layer Properties` dialog for the :guilabel:`buildings`
  layer.
* Activate the :guilabel:`Rendering` tab.
* Enable scale-based rendering by clicking on the checkbox labelled
  :guilabel:`Scale dependent visibility`:

.. image:: img/scale_dependent_visibility.png
   :align: center

* Change the :guilabel:`Minimum` value to :kbd:`1:10,000`.
* Click :guilabel:`OK`.

Test the effects of this by zooming in and out in your map, noting when the
:guilabel:`buildings` layer disappears and reappears.

.. note::  You can use your mouse wheel to zoom in increments.
   Alternatively, use the zoom tools to zoom to a window:

   |zoomIn| |zoomOut|

|moderate| |FA| Adding Symbol Layers
-------------------------------------------------------------------------------

Now that you know how to change simple symbology for layers, the next step is
to create more complex symbology. QGIS allows you to do this using symbol
layers.

* Go back to the :guilabel:`landuse` layer's symbol properties panel (by clicking
  :guilabel:`Simple fill` in the :guilabel:`Symbol layers` panel).


In this example, the current symbol has no outline (i.e., it uses the
:guilabel:`No Pen` border style).

Select the :guilabel:`Fill` in the :guilabel:`Symbol layers` panel. Then click
the :guilabel:`Add symbol layer` button:

.. image:: img/add_symbol_layer_button.png
   :align: center

* Click on it and the dialog will change to look somewhat like this:

.. image:: img/new_symbol_layer.png
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

With the new :guilabel:`Simple Fill` layer selected:

* Set the border style to :guilabel:`No Pen`, as before.
* Change the fill style to something other than :guilabel:`Solid` or
  :guilabel:`No brush`. For example:

.. image:: img/new_fill_settings.png
   :align: center

* Click :guilabel:`OK`. Now you can see your results and tweak them as needed.

You can even add multiple extra symbol layers and create a kind of texture for
your layer that way.

.. image:: img/multiple_symbol_layers.png
   :align: center

It's fun! But it probably has too many colors to use in a real map...

.. _backlink-symbology-layers-1:

|moderate| |TY|
-------------------------------------------------------------------------------

* Remembering to zoom in if necessary, create a simple, but not distracting
  texture for the :guilabel:`buildings` layer using the methods above.

:ref:`Check your results <symbology-layers-1>`


|moderate| |FA| Ordering Symbol Levels
-------------------------------------------------------------------------------

When symbol layers are rendered, they are also rendered in a sequence, similar
to the way the different map layers are rendered. This means that in some cases,
having many symbol layers in one symbol can cause unexpected results.

* Give the :guilabel:`roads` layer an extra symbol layer (using the method
  for adding symbol layers demonstrated above).
* Give the base line a :guilabel:`Pen width` of :kbd:`0.3`, a white color
  and select :guilabel:`Dashed Line` from the :guilabel:`Pen Style` dropdown.
* Give the new, uppermost layer a thickness of :kbd:`1.3` and ensure that it is
  a :guilabel:`Solid Line`.

You'll notice that this happens:

.. image:: img/bad_roads_symbology.png
   :align: center

Well that's not what we want at all!

To prevent this from happening, you can sort the symbol levels and thereby
control the order in which the different symbol layers are rendered.

To change the order of the symbol layers, select the :guilabel:`Line` layer in
the :guilabel:`Symbol layers` panel, then click
:menuselection:`Advanced --> Symbol levels...` in the
bottom right-hand corner of the window. This will open a dialog like this:

.. image:: img/symbol_levels_dialog.png
   :align: center

Select :guilabel:`Enable symbol levels`. You can then set the layer ordering
of each symbol by entering the corresponding level number. 0 is the bottom
layer.

In our case, we want to reverse the ordering, like this:

.. image:: img/correct_symbol_layers.png
   :align: center

This will render the dashed, white line above the thick black line.

* Click :guilabel:`OK` twice to return to the map.

The map will now look like this:

.. image:: img/better_roads_symbology.png
   :align: center

Also note that the meeting points of roads are now "merged", so that one road is
not rendered above another.

When you're done, remember to save the symbol itself so as not to lose your
work if you change the symbol again in the future. You can save your current
symbol style by clicking the :guilabel:`Save Style ...` button under the
:guilabel:`Style` tab of the :guilabel:`Layer Properties` dialog. Generally, you
should save as :guilabel:`QGIS Layer Style File`.

Save your style under :kbd:`exercise_data/styles`.  You can load a
previously saved style at any time by clicking the :guilabel:`Load Style ...`
button. Before you change a style, keep in mind that any unsaved style you are
replacing will be lost.

.. _backlink-symbology-levels-1:

|moderate| |TY|
-------------------------------------------------------------------------------

* Change the appearance of the :guilabel:`roads` layer again.

The roads must be narrow and mid-gray, with a thin, pale yellow outline. Remember
that you may need to change the layer rendering order via the
:menuselection:`Advanced --> Symbol levels...` dialog.

.. image:: img/target_road_symbology.png
   :align: center

:ref:`Check your results <symbology-levels-1>`


.. _backlink-symbology-levels-2:

|hard| |TY|
-------------------------------------------------------------------------------

Symbol levels also work for classified layers (i.e., layers having multiple
symbols).  Since we haven't covered classification yet, you will work with some
rudimentary pre-classified data.

* Create a new map and add only the :guilabel:`roads` dataset.
* Apply the style :kbd:`advanced_levels_demo.qml` provided in
  :kbd:`exercise_data/styles`.
* Zoom in to the |majorUrbanName| area.
* Using symbol layers, ensure that the outlines of layers flow into one another
  as per the image below:

.. image:: img/correct_advanced_levels.png
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

Point Symbol Layer Types
...............................................................................

* Open your :guilabel:`basic_map` project.
* Change the symbol properties for the :guilabel:`places` layer:

.. image:: img/places_layer_properties.png
     :align: center

* You can access the various symbol layer types by selecting the
  :guilabel:`Simple marker` layer in the :guilabel:`Symbol layers` panel, then
  click the :guilabel:`Symbol layer type` dropdown:


.. image:: img/marker_type_dropdown.png
   :align: center


* Investigate the various options available to you, and choose a symbol with
  styling you think is appropriate.
* If in doubt, use a round :guilabel:`Simple marker` with a white border and
  pale green fill, with a :guilabel:`size` of :kbd:`3,00` and an
  :guilabel:`Outline width` of :kbd:`0.5`.


Line Symbol Layer Types
...............................................................................

To see the various options available for line data:

* Change the symbol layer type for the :guilabel:`roads` layer's topmost
  symbol layer to :guilabel:`Marker line`:

.. image:: img/change_to_marker_line.png
   :align: center


* Select the :guilabel:`Simple marker` layer in the :guilabel:`Symbol layers`
  panel. Change the symbol properties to match this dialog:


.. image:: img/simple_marker_line_properties.png
   :align: center


* Change the interval to :kbd:`1,00`:


.. image:: img/marker_line_interval.png
   :align: center


* Ensure that the symbol levels are correct (via the
  :menuselection:`Advanced --> Symbol levels` dialog we used earlier) before
  applying the style.


Once you have applied the style, take a look at its results on the map. As you
can see, these symbols change direction along with the road but don't always
bend along with it. This is useful for some purposes, but not for others. If
you prefer, you can change the symbol layer in question back to the way it was
before.

Polygon Symbol Layer Types
...............................................................................

To see the various options available for polygon data:

* Change the symbol layer type for the :guilabel:`water` layer, as before for
  the other layers.
* Investigate what the different options on the list can do.
* Choose one of them that you find suitable.
* If in doubt, use the :guilabel:`Point pattern fill` with the following
  options:

.. image:: img/pattern_fill_size.png
   :align: center

.. image:: img/pattern_fill_distances.png
   :align: center

* Add a new symbol layer with a normal :guilabel:`Simple fill`.
* Make it the same light blue with a darker blue border.
* Move it underneath the point pattern symbol layer with the :guilabel:`Move
  down` button:

.. image:: img/simple_fill_move_down.png
   :align: center

As a result, you have a textured symbol for the water layer, with the added
benefit that you can change the size, shape and distance of the individual dots
that make up the texture.

|hard| |FA| Creating a Custom SVG Fill
-------------------------------------------------------------------------------

.. note::  To do this exercise, you will need to have the free vector editing
   software `Inkscape <https://inkscape.org/>`_ installed.

* Start the Inkscape program.

You will see the following interface:

.. image:: img/inkscape_default.png
   :align: center

You should find this familiar if you have used other vector image editing
programs, like Corel.

First, we'll change the canvas to a size appropriate for a small texture.

* Click on the menu item :menuselection:`File --> Document Properties`. This
  will give you the :guilabel:`Document Properties` dialog.
* Change the :guilabel:`Units` to :guilabel:`px`.
* Change the :guilabel:`Width` and :guilabel:`Height` to :kbd:`100`.
* Close the dialog when you are done.
* Click on the menu item :menuselection:`View --> Zoom --> Page` to see the
  page you are working with.
* Select the :guilabel:`Circle` tool:

.. image:: img/inkscape_circle_tool.png
   :align: center

* Click and drag on the page to draw an ellipse. To make the ellipse turn into
  a circle, hold the :kbd:`Ctrl` button while you're drawing it.
* Right-click on the circle you just created and open its :guilabel:`Fill and
  Stroke` options. You can modify its rendering, such as:

  * Change the :guilabel:`Fill` color to a somehow pale grey-blue,
  * Assign to the border a darker color in :guilabel:`Stroke paint` tab,
  * And reduce the border thickness under :guilabel:`Stroke style` tab.

.. image:: img/inkscape_stroke_fill.png
   :align: center

* Draw a line using the :guilabel:`Pencil` tool:

  * Click once to start the line. Hold :kbd:`ctrl` to make it snap to increments
    of 15 degrees.
  * Move the pointer horizontally and place a point with a simple click.
  * Click and snap to the vertex of the line and trace a vertical line, ended
    by a simple click.
  * Now join the two end vertices. 
  * Change the color and width of the triangle symbol to match the circle's stroke
    and move it around as necessary, so that you end up with a symbol like this one:

.. image:: img/inkscape_final_symbol.png
   :align: center

* If the symbol you get satisfies you, then save it as :guilabel:`landuse_symbol`
  under the directory that the course is in, under :kbd:`exercise_data/symbols`,
  as SVG file.

In QGIS:

* Open the :guilabel:`Layer Properties` for the :file:`landuse` layer.
* In the :guilabel:`Style` tab, change the symbol structure by selecting ``SVG Fill``
  as :guilabel:`Symbol Layer Type` option, as shown below.
* Click the |browseButton| :guilabel:`Browse` button to select your SVG image.
  It's added to the symbol tree and you can now customize its different
  characteristics (colors, angle, effects, units...).


.. image:: img/svg_symbol_settings.png
   :align: center

You may also wish to update the svg layer's border (see below):

.. image:: img/svg_layer_border.png
   :align: center

Once you validate the dialog, features in :file:`landuse` layer should now
be covered by a set of symbols, showing a texture like the one on the
following map. If textures are not visible, you may need to zoom in the map
canvas or set in the layer properties a bigger :guilabel:`Texture width`.

.. image:: img/svg_symbol_result.png
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


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |FR| replace:: Further Reading
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |TY| replace:: Try Yourself
.. |WN| replace:: What's Next?
.. |basic| image:: /static/global/basic.png
.. |browseButton| image:: /static/common/browsebutton.png
   :width: 2.3em
.. |hard| image:: /static/global/hard.png
.. |majorUrbanName| replace:: Swellendam
.. |moderate| image:: /static/global/moderate.png
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
.. |zoomIn| image:: /static/common/mActionZoomIn.png
   :width: 1.5em
.. |zoomOut| image:: /static/common/mActionZoomOut.png
   :width: 1.5em
