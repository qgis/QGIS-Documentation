|LS| The Label Tool
===============================================================================

Labels can be added to a map to show any information about an object. Any
vector layer can have labels associated with it. These labels rely on the
attribute data of a layer for their content.

.. note::  The :guilabel:`Layer Properties` dialog does have a
   :guilabel:`Labels` tab, but for this example we will not be using it. It has
   too few options and may be difficult to work with, which is why it will
   probably be taken out of new versions of QGIS (after 1.8). Instead, for this
   lesson we'll use the separate :guilabel:`Label tool`, which has more options
   and is more user-friendly.

**The goal for this lesson:** To apply useful and good-looking labels to a
layer.

|basic| |FA| Using labels
-------------------------------------------------------------------------------

Before being able to access the Label tool, you will need to ensure that it has
been activated.

* Go to the menu item :menuselection:`View --> Toolbars`.
* Ensure that the :guilabel:`Label` item has a check mark next to it. If it
  doesn't, click on the :guilabel:`Label` item, and it will be activated.
* Click on the :guilabel:`places` layer in the :guilabel:`Layers list`, so that
  it is highlighted.
* Click on the following toolbar button:

.. image:: ../_static/labels/001.png
   :align: center

This gives you the :guilabel:`Layer labeling settings` dialog.

* Check the box next to :guilabel:`Label this layer with...`.

.. image:: ../_static/labels/003.png
   :align: center

You'll need to choose which field in the attributes will be used for the
labels. In the previous lesson, you decided that the :kbd:`NAME` field was the
most suitable one for this purpose.

* Select :guilabel:`NAME` from the list:

.. image:: ../_static/labels/004.png
   :align: center

* Click :guilabel:`OK`.
  
The map should now have labels like this:

.. image:: ../_static/labels/005.png
   :align: center

|basic| |FA| Changing label options
-------------------------------------------------------------------------------

What we have so far is good, but as you can see, the labels are overlapping the
points that they are associated with. That doesn't look very nice. The text is
also a bit larger than it needs to be. Let's fix these problems!

* Open the :guilabel:`Label tool` again by clicking on its button as before.
* Click on the ellipsis (:guilabel:`...`) button to change the text properties:

.. image:: ../_static/labels/006.png
   :align: center

A standard text change dialog appears, similar to those in many other programs.
Change the font to :kbd:`Arial` size :kbd:`9`. Your labels will now look like
this:

.. image:: ../_static/labels/007.png
   :align: center

That's the font problem solved! Now let's look at the problem of the labels
overlapping the points, but before we do that, let's take a look at the
:guilabel:`Buffer` option.

* Open the :guilabel:`Label tool` dialog.
* Deactivate the label buffer by clicking on the checkbox next to the text that
  says :guilabel:`Buffer`.
* Click :guilabel:`Apply`.
  
Note the effects in the map:

.. image:: ../_static/labels/008.png
   :align: center

Now you can see why we usually need label buffers!

* Reactivate the buffers by clicking in the same checkbox as before, and then
  clicking :guilabel:`Apply`.

Back to the problem of the labels that overlap points.

* In the :guilabel:`Label tool` dialog, go to the :guilabel:`Advanced` tab.
* Change the value of :guilabel:`Label distance` to :kbd:`2`.

.. image:: ../_static/labels/009.png
   :align: center

* Click :guilabel:`Apply`.
  
This is the result:

.. image:: ../_static/labels/010.png
   :align: center

|moderate| |FA| Using labels instead of layer symbology
-------------------------------------------------------------------------------

In many cases, the location of a point doesn't need to be very specific. For
example, most of the points in the :guilabel:`places` layer refer to entire
towns or suburbs, and the specific point associated with such features is not
that specific on a large scale. In fact, giving a point that is too specific is
often confusing for someone reading a map.

To name an example: on a map of the world, the point given for the European
Union may be somewhere in Poland, for instance. To someone reading the map,
seeing a point labeled *European Union* in Poland, it may seem that the capital
of the European Union is therefore in Poland.

So, to prevent this kind of misunderstanding, it's often useful to deactivate
the point symbols and replace them completely with labels.

In QGIS, you can do this by changing the position of the labels to be rendered
directly over the points they refer to.

* Open the :guilabel:`Layer labeling settings` dialog for the
  :guilabel:`places` layer.
* Go to the :guilabel:`Advanced` tab.
* Click on the :guilabel:`over point` button.

.. image:: ../_static/labels/011.png
   :align: center

* Hide the point symbols by editing the layer style as usual, and setting the
  size of points to :kbd:`0`:

.. image:: ../_static/labels/012.png
   :align: center

* Click :guilabel:`OK` and you'll see this result:

.. image:: ../_static/labels/013.png
   :align: center

As you can see, some of the labels are now missing to prevent overlap (at this
scale). Sometimes this is what you want when dealing with datasets that have
many points, but at other times you will lose useful information this way.
There is another possibility for handling cases like this, which we'll cover in
a later exercise in this lesson.


.. _backlink-label-tool-1:

|moderate| |TY| Customize the labels
-------------------------------------------------------------------------------

* Return the label and symbol settings to the way they were before.

:ref:`Check your results <label-tool-1>`

* Set the map to the scale :kbd:`1:50000`. You can do this by typing it into
  the :guilabel:`Scale` box in the :guilabel:`Status Bar`.
* Modify your labels to be suitable for viewing at this scale.

:ref:`Check your results <label-tool-2>`


|moderate| |FA| Labeling lines
-------------------------------------------------------------------------------

Now that you know how labeling works, there's an additional problem. Points and
polygons are easy to label, but what about lines? If you label them the same
way as the points, your results would look like this:

.. image:: ../_static/labels/017.png
   :align: center

This is not very useful! To make lines behave, we'll need to edit some options.

* Hide the :guilabel:`places` layer so that it doesn't distract you.
* Activate labels for the :guilabel:`streets` layer as before. (Remember to use
  the :guilabel:`Label tool` on the toolbar, not the one in :guilabel:`Label
  Properties`!)
* Set the font :guilabel:`Size` to :kbd:`9` so that you can see more labels.
* Zoom in on the Swellendam town area.
* In the :guilabel:`Label tool` dialog's :guilabel:`Advanced` tab, choose the
  following settings:

.. image:: ../_static/labels/018.png
   :align: center

The map will look somewhat like this, depending on scale:

.. image:: ../_static/labels/019.png
   :align: center

It's better than before, but still not ideal. For starters, some of the names
appear more than once, and that's not always necessary. To prevent that from
happening:

* Enable the option :guilabel:`Merge connected lines to avoid duplicate labels`
  (also under the :guilabel:`Advanced` tab - you may need to scroll down to see
  it).

Another useful function is to prevent labels being drawn for features too short
to be of notice.

* Set the value of :guilabel:`Suppress labeling of features smaller than ...`
  to :kbd:`5mm` and note the results when you click :guilabel:`Apply`.

Try out different :guilabel:`Placement` settings as well (also under the
:guilabel:`Advanced` tab). As we've seen before, the :guilabel:`horizontal`
option is not a good idea in this case, so let's try the :guilabel:`curved`
option instead!

* Select the :guilabel:`curved` option under the :guilabel:`Advanced` tab of
  the :guilabel:`Layer labeling settings` dialog.

Here's the result:

.. image:: ../_static/labels/020.png
   :align: center

As you can see, this hides a lot of the labels that were previously visible,
because of the difficulty of making some of them follow twisting street lines
and still be legible. You can decide which of these options to use, depending
on what you think seems more useful or what looks better.

|hard| |FA| Data defined settings
-------------------------------------------------------------------------------

* Deactivate labeling for the :guilabel:`streets` layer.
* Reactivate labeling for the :guilabel:`places` layer.
* Open the attribute table for :guilabel:`places`.

It has two fields that are of interest to us now: :kbd:`ADDR_CITY` and
:kbd:`IN_SWD`. :kbd:`ADDR_CITY` is the city that the feature is in.
:kbd:`IN_SWD` is derived from it, and tells you whether or not that feature is
in Swellendam (:kbd:`1` if it is, :kbd:`0` if not). We can use this data to
influence the label styles.

* Navigate to the :guilabel:`Data defined settings` tab.
* In the :guilabel:`Italic` dropdown, select :kbd:`IN_SWD` and click
  :guilabel:`Apply`.

Notice its effects:

.. image:: ../_static/labels/022.png
   :align: center


.. _backlink-label-data-defined-1:

|hard| |TY| Using data defined settings
-------------------------------------------------------------------------------

.. note::  We're jumping ahead a bit here to demonstrate some advanced labeling
   settings. At the advanced level, it's assumed that you'll know what the
   following means. If you don't, feel free to leave out this section and come
   back later when you've covered the requisite materials.

* Open the attribute table for :guilabel:`places`.
* Enter edit mode by clicking this button (at the lower edge of the attribute
  table):

.. image:: ../_static/labels/023.png
   :align: center

* Add a new column:

.. image:: ../_static/labels/024.png
   :align: center

* Configure it like this:

.. image:: ../_static/labels/025.png
   :align: center

* Use this to set custom font sizes for each different type of place (i.e.,
  each key in the :kbd:`PLACE` field).

:ref:`Check your results <label-data-defined-1>`


|hard| Further possibilities with labeling
-------------------------------------------------------------------------------

We can't cover every option in this course, but be aware that the
:guilabel:`Label tool` has many other useful functions. You can set scale-based
rendering, alter the rendering priority for labels in a layer, and set every
label option using layer attributes. You can even set the rotation, XY
position, and other properties of a label (if you have attribute fields
allocated for the purpose), then edit these properties using the tools adjacent
to the main :guilabel:`Label tool`:

.. image:: ../_static/labels/028.png
   :align: center

(These tools will be active if the required attribute fields exist and you are
in edit mode.)

Feel free to explore more possibilities of the labeling system.

|IC|
-------------------------------------------------------------------------------

You've learned how to use layer attributes to create dynamic labels. This can
make your map a lot more informative and stylish!

|WN|
-------------------------------------------------------------------------------

Now that you know how attributes can make a visual difference for your map, how
about using them to change the symbology of objects themselves? That's the
topic for the next lesson!
