|LS| The Label Tool
===============================================================================

Labels can be added to a map to show any information about an object. Any
vector layer can have labels associated with it. These labels rely on the
attribute data of a layer for their content.

.. note::  The :guilabel:`Layer Properties` dialog does have a
   :guilabel:`Labels` tab, which now offers the same functionality,
   but for this example we'll use the :guilabel:`Label tool`, accessed via a
   toolbar button.

**The goal for this lesson:** To apply useful and good-looking labels to a
layer.

|basic| |FA| Using Labels
-------------------------------------------------------------------------------

Before being able to access the Label tool, you will need to ensure that it has
been activated.

* Go to the menu item :menuselection:`View --> Toolbars`.
* Ensure that the :guilabel:`Label` item has a check mark next to it. If it
  doesn't, click on the :guilabel:`Label` item, and it will be activated.
* Click on the :guilabel:`places` layer in the :guilabel:`Layers list`, so that
  it is highlighted.
* Click on the following toolbar button: |mActionLabeling|

This gives you the :guilabel:`Layer labeling settings` dialog.

* Check the box next to :guilabel:`Label this layer with...`.

You'll need to choose which field in the attributes will be used for the
labels. In the previous lesson, you decided that the :kbd:`NAME` field was the
most suitable one for this purpose.

* Select :guilabel:`name` from the list:

.. image:: /static/training_manual/labels/select_label_with.png
   :align: center

* Click :guilabel:`OK`.

The map should now have labels like this:

.. image:: /static/training_manual/labels/first_place_names.png
   :align: center

|basic| |FA| Changing Label Options
-------------------------------------------------------------------------------

Depending on the styles you chose for your map in earlier lessons, you'll
might find that the labels are not appropriately formatted and either overlap or
are too far away from their point markers.

* Open the :guilabel:`Label tool` again by clicking on its button as before.
* Make sure :guilabel:`Text` is selected in the left-hand options list, then
update the text formatting options to match those shown here:


.. image:: /static/training_manual/labels/label_formatting_options.png
   :align: center

That's the font problem solved! Now let's look at the problem of the labels
overlapping the points, but before we do that, let's take a look at the
:guilabel:`Buffer` option.

* Open the :guilabel:`Label tool` dialog.
* Select :guilabel:`Buffer` from the left-hand options list.
* Select the checkbox next to :guilabel:`Draw text buffer`, then choose options
to match those shown here:


.. image:: /static/training_manual/labels/buffer_options.png
   :align: center

* Click :guilabel:`Apply`.


You'll see that this adds a colored buffer or border to the place labels, making
them easier to pick out on the map:

.. image:: /static/training_manual/labels/buffer_results.png
   :align: center

Now we can address the positioning of the labels in relation to their point
markers.

* In the :guilabel:`Label tool` dialog, go to the :guilabel:`Placement` tab.
* Change the value of :guilabel:`Distance` to :kbd:`2mm` and make sure that
:guilabel:`Around point` is selected:


.. image:: /static/training_manual/labels/offset_placement_settings.png
   :align: center

* Click :guilabel:`Apply`.


You'll see that the labels are no longer overlapping their point markers.


|moderate| |FA| Using Labels Instead of Layer Symbology
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
* Select the :guilabel:`Placement` option from the options list.
* Click on the :guilabel:`Offset from point` button.

This will reveal the :guilabel:`Quadrant` options which you can use to set the
position of the label in relation to the point marker. In this case, we want the
label to be centered on the point, so choose the center quadrant:

.. image:: /static/training_manual/labels/quadrant_offset_options.png
   :align: center

* Hide the point symbols by editing the layer style as usual, and setting the
  size of the :guilabel:`Ellipse marker` width and height to :kbd:`0`:

.. image:: /static/training_manual/labels/hide_point_marker.png
   :align: center

* Click :guilabel:`OK` and you'll see this result:

.. image:: /static/training_manual/labels/hide_point_marker_results.png
   :align: center

If you were to zoom out on the map, you would see that some of the labels
disappear at larger scales to avoid overlapping. Sometimes this is what you
want when dealing with datasets that have
many points, but at other times you will lose useful information this way.
There is another possibility for handling cases like this, which we'll cover in
a later exercise in this lesson.


.. _backlink-label-tool-1:

|moderate| |TY| Customize the Labels
-------------------------------------------------------------------------------

* Return the label and symbol settings to have a point marker and a label offset
  of :kbd:`2.00mm`. You may like to adjust the styling of the point marker or
  labels at this stage.

:ref:`Check your results <label-tool-1>`

* Set the map to the scale :kbd:`1:100000`. You can do this by typing it into
  the :guilabel:`Scale` box in the :guilabel:`Status Bar`.
* Modify your labels to be suitable for viewing at this scale.

:ref:`Check your results <label-tool-2>`


|moderate| |FA| Labeling Lines
-------------------------------------------------------------------------------

Now that you know how labeling works, there's an additional problem. Points and
polygons are easy to label, but what about lines? If you label them the same
way as the points, your results would look like this:

.. image:: /static/training_manual/labels/bad_street_labels.png
   :align: center

We will now reformat the :guilabel:`roads` layer labels so that they are easy to
understand.

* Hide the :guilabel:`Places` layer so that it doesn't distract you.
* Activate labels for the :guilabel:`streets` layer as before.
* Set the font :guilabel:`Size` to :kbd:`10` so that you can see more labels.
* Zoom in on the Swellendam town area (or the most built-up area of your dataset).
* In the :guilabel:`Label tool` dialog's :guilabel:`Advanced` tab, choose the
  following settings:

.. image:: /static/training_manual/labels/street_label_settings.png
   :align: center

You'll probably find that the text styling has used default values and the
labels are consequently very hard to read. Set the label text format to have a
dark-grey or black :kbd:`Color` and a light-yellow :kbd:`buffer`.

The map will look somewhat like this, depending on scale:

.. image:: /static/training_manual/labels/street_label_formatted.png
   :align: center

You'll see that some of the road names appear more than once and that's not
always necessary. To prevent this from happening:

* In the :guilabel:`Label labelling settings` dialog, choose the
  :guilabel:`Rendering` option and select the
  :guilabel:`Merge connected lines to avoid duplicate labels`:

.. image:: /static/training_manual/labels/merge_lines_option.png
   :align: center

* Click :guilabel:`OK`

Another useful function is to prevent labels being drawn for features too short
to be of notice.

* In the same :guilabel:`Rendering` panel, set the value of
  :guilabel:`Suppress labeling of features smaller than ...` to :kbd:`5mm`
  and note the results when you click :guilabel:`Apply`.

Try out different :guilabel:`Placement` settings as well. As we've seen before,
the :guilabel:`horizontal` option is not a good idea in this case, so let's
try the :guilabel:`curved` option instead.

* Select the :guilabel:`Curved` option in the :guilabel:`Placement` panel of
  the :guilabel:`Layer labeling settings` dialog.

Here's the result:

.. image:: /static/training_manual/labels/final_street_labels.png
   :align: center

As you can see, this hides a lot of the labels that were previously visible,
because of the difficulty of making some of them follow twisting street lines
and still be legible. You can decide which of these options to use, depending
on what you think seems more useful or what looks better.

|hard| |FA| Data Defined Settings
-------------------------------------------------------------------------------

* Deactivate labeling for the :guilabel:`Streets` layer.
* Reactivate labeling for the :guilabel:`Places` layer.
* Open the attribute table for :guilabel:`Places` via the |attributes| button.

It has one fields which is of interest to us now: :kbd:`place` which defines the
type of urban area for each object. We can use this data to influence the label
styles.

* Navigate to the :guilabel:`Text` panel in the :guilabel:`places`
  :guilabel:`Labels` panel.
* In the :guilabel:`Italic` dropdown, select :kbd:`Edit...` to open the
  :guilabel:`Expression string builder`:

.. image:: /static/training_manual/labels/expression_string_builder.png
   :align: center

In the text input, type: :kbd:`"place"  =  'town'` and click :guilabel:`Ok`
twice:

.. image:: /static/training_manual/labels/expression_builder_settings.png
   :align: center

Notice its effects:

.. image:: /static/training_manual/labels/italic_label_result.png
   :align: center


.. _backlink-label-data-defined-1:

|hard| |TY| Using Data Defined Settings
-------------------------------------------------------------------------------

.. note::  We're jumping ahead a bit here to demonstrate some advanced labeling
   settings. At the advanced level, it's assumed that you'll know what the
   following means. If you don't, feel free to leave out this section and come
   back later when you've covered the requisite materials.

* Open the Attribute Table for :guilabel:`places`.
* Enter edit mode by clicking this button: |edit|

* Add a new column:

.. image:: /static/training_manual/labels/add_column_button.png
   :align: center

* Configure it like this:

.. image:: /static/training_manual/labels/font_size_column.png
   :align: center

* Use this to set custom font sizes for each different type of place (i.e.,
  each key in the :kbd:`PLACE` field).

:ref:`Check your results <label-data-defined-1>`


|hard| Further Possibilities With Labeling
-------------------------------------------------------------------------------

We can't cover every option in this course, but be aware that the
:guilabel:`Label tool` has many other useful functions. You can set scale-based
rendering, alter the rendering priority for labels in a layer, and set every
label option using layer attributes. You can even set the rotation, XY
position, and other properties of a label (if you have attribute fields
allocated for the purpose), then edit these properties using the tools adjacent
to the main :guilabel:`Label tool`:

|mActionLabeling| |mActionShowPinnedLabels| |mActionPinLabels|
|mActionShowHideLabels| |mActionMoveLabel| |mActionRotateLabel|
|mActionChangeLabelProperties|

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
