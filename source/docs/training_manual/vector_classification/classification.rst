|LS| Classification
===============================================================================

Labels are a good way to communicate information such as the names of
individual places, but they can't be used for everything. For example, let's
say that someone wants to know what each :guilabel:`landuse` area is used for.
Using labels, you'd get this:

.. image:: /static/training_manual/classification/bad_landuse_labels.png
   :align: center

This makes the map's labeling difficult to read and even overwhelming if there
are numerous different landuse areas on the map.

**The goal for this lesson:** To learn how to classify vector data effectively.

|basic| |FA| Classifying Nominal Data
-------------------------------------------------------------------------------

* Open the :guilabel:`Layer Properties` dialog for the :guilabel:`landuse` layer.
* Go to the :guilabel:`Style` tab.
* Click on the dropdown that says :guilabel:`Single Symbol` and change it to
:guilabel:`Categorized`:

.. image:: /static/training_manual/classification/categorised_styles.png
   :align: center

* In the new panel, change the :guilabel:`Column` to :guilabel:`landuse`
  and the :guilabel:`Color ramp` to :guilabel:`Greens`:

.. image:: /static/training_manual/classification/categorised_style_settings.png
   :align: center

* Click the button labeled :guilabel:`Classify` and then click :guilabel:`OK`.

You'll see something like this:

.. image:: /static/training_manual/classification/categorisation_result.png
   :align: center

* Click the arrow (or plus sign) next to :guilabel:`landuse` in the
  :guilabel:`Layer list`, you'll see the categories explained:

.. image:: /static/training_manual/classification/categories_explained.png
   :align: center

Now our landuse polygons are appropriately colored and are classified so that
areas with the same land use are the same color. You may wish to remove the
black border from the :guilabel:`landuse` layer:

* Open :guilabel:`Layer Properties`, go to the :guilabel:`Style` tab and select
  :guilabel:`Symbol`.
* Change the symbol by removing the border from the :guilabel:`Simple Fill`
  layer and click :guilabel:`OK`.

You'll see that the landuse polygon outlines have been removed, leaving just our new
fill colours for each categorisation.

* If you wish to, you can change the fill color for each landuse area by
  double-clicking the relevant color block:

.. image:: /static/training_manual/classification/change_layer_color.png
   :align: center

Notice that there is one category that's empty:

.. image:: /static/training_manual/classification/empty_category.png
   :align: center

This empty category is used to color any objects which do not have a landuse
value defined or which have a *NULL* value. It is important to keep this empty
category so that areas with a *NULL* value are still represented on the map. You
may like to change the color to more obviously represent a blank or *NULL* value.

Remember to save your map now so that you don't lose all your hard-earned
changes!

|basic| |TY| More Classification
-------------------------------------------------------------------------------

If you're only following the basic-level content, use the knowledge you gained
above to classify the :guilabel:`buildings` layer. Set the categorisation against
the :guilabel:`building` column and use the :guilabel:`Spectral` color ramp.

.. note:: Remember to zoom into an urban area to see the results.

|moderate| |FA| Ratio Classification
-------------------------------------------------------------------------------

There are four types of classification: *nominal*, *ordinal*, *interval* and
*ratio*.

In nominal classification, the categories that objects are classified into are
name-based; they have no order. For example: town names, district codes, etc.

In ordinal classification, the categories are arranged in a certain order. For
example, world cities are given a rank depending on their importance for world
trade, travel, culture, etc.

In interval classification, the numbers are on a scale with positive, negative
and zero values. For example: height above/below sea level, temperature
above/below freezing (0 degrees Celsius), etc.

In ratio classification, the numbers are on a scale with only positive and zero
values. For example: temperature above absolute zero (0 degrees Kelvin),
distance from a point, the average amount of traffic on a given street per
month, etc.

In the example above, we used nominal classification to assign each farm to the
town that it is administered by. Now we will use ratio classification to
classify the farms by area.

* Save your landuse symbology (if you want to keep it) by clicking on the
  :guilabel:`Save Style ...` button in the :guilabel:`Style` dialog.

We're going to reclassify the layer, so existing classes will be lost if not
saved.

* Close the :guilabel:`Style` dialog.
* Open the Attributes Table for the :guilabel:`landuse` layer.

We want to classify the landuse areas by size, but there's a problem: they don't
have a size field, so we'll have to make one.

* Enter edit mode by clicking this button:

|edit|
    :align: center

* Add a new column with this button:

.. image:: /static/training_manual/labels/add_column_button.png
   :align: center

* Set up the dialog that appears, like this:

.. image:: /static/training_manual/classification/add_area_column.png
   :align: center

* Click :guilabel:`OK`.

The new field will be added (at the far right of the table; you may need to
scroll horizontally to see it). However, at the moment it is not populated, it
just has a lot of :kbd:`NULL` values.

To solve this problem, we'll need to calculate the areas.

* Open the field calculator:

|mActionCalculateField|
    :align: center

You'll get this dialog:

.. image:: /static/training_manual/classification/calculate_field_dialog.png
   :align: center

* Change the values at the top of the dialog to look like this:

.. image:: /static/training_manual/classification/field_calculator_top.png
   :align: center

* In the :guilabel:`Function List`, select :menuselection:`Geometry --> $area`:

.. image:: /static/training_manual/classification/geometry_area_select.png
   :align: center

* Double-click on it so that it appears in the :guilabel:`Expression` field.
* Click :guilabel:`OK`.

Now your :kbd:`AREA` field is populated with values (you may need to click the
column header to refresh the data). Save the edits and click :guilabel:`Ok`.

.. note::  These areas are in degrees. Later, we will compute them in
   square meters.

* Open the :guilabel:`Layer properties` dialog's :guilabel:`Style` tab.
* Change the classification style from :guilabel:`Categorized` to
  :guilabel:`Graduated`.

* Change the :guilabel:`Column` to :guilabel:`AREA`:

* Under :guilabel:`Color ramp`, choose the option :guilabel:`New color ramp...`
  to get this dialog:

.. image:: /static/training_manual/classification/area_gradient_select.png
   :align: center

* Choose :guilabel:`Gradient` (if it's not selected already) and click
  :guilabel:`OK`. You'll see this:

.. image:: /static/training_manual/classification/gradient_color_select.png
   :align: center

You'll be using this to denote area, with small areas as :guilabel:`Color 1`
and large areas as :guilabel:`Color 2`.

* Choose appropriate colors.

In the example, the result looks like this:

.. image:: /static/training_manual/classification/gradient_color_example.png
   :align: center

* Click :guilabel:`OK`.
* Choose a suitable name for the new color ramp.
* Click :guilabel:`OK` after filling in the name.

Now you'll have something like this:

.. image:: /static/training_manual/classification/landuse_gradient_selected.png
   :align: center

Leave everything else as-is.

* Click :guilabel:`Ok`:

.. image:: /static/training_manual/classification/gradient_result_map.png
   :align: center


.. _backlink-classification-refine-1:

|moderate| |TY| Refine the Classification
-------------------------------------------------------------------------------

* Get rid of the lines between the classes.
* Change the values of :guilabel:`Mode` and :guilabel:`Classes` until you get a
  classification that makes sense.

:ref:`Check your results <classification-refine-1>`

|hard| |FA| Rule-based Classification
-------------------------------------------------------------------------------

It's often useful to combine multiple criteria for a classification, but
unfortunately normal classification only takes one attribute into account.
That's where rule-based classification comes in handy.

* Open the :guilabel:`Layer Properties` dialog for the :guilabel:`landuse` layer.
* Switch to the :guilabel:`Style` tab.
* Switch the classification style to :guilabel:`Rule-based`. You'll get this:

.. image:: /static/training_manual/classification/rule_based_classification.png
   :align: center

* Click the :guilabel:`Add rule` button: |mActionSignPlus|.
* A new dialog then appears.
* Click the ellipsis :guilabel:`...` button next to the :guilabel:`Filter` text area.
* Using the query builder that appears, enter the criterion
  :kbd:`"landuse" = 'residential' AND "name" != 'Swellendam'` ,
  click :guilabel:`Ok` and choose a pale blue-grey for it and
  remove the border:

.. image:: /static/training_manual/classification/query_builder_example.png
   :align: center

.. image:: /static/training_manual/classification/rule_style_result.png
   :align: center

* Add a new criterion :kbd:`"landuse" != 'residential' AND AREA >= 0.00005`
  and choose a mid-green color.
* Add another new criterion :kbd:`"name"  =  'Swellendam'` (or the name of the
  most important town in your dataset) and assign it a
  darker grey-blue color in order to indicate the town's importance in the
  region.
* Click and drag this criterion to the top of the list.

These filters are exclusive, in that they collectively exclude some areas on the
map (i.e. those which are smaller that 0.00005, are not residential and are not
'Swellendam'). This means that the exlucded polygons take the style of the
default :guilabel:`(no filter)` category.

We know that the excluded polygons on our map cannot be residential areas, so
give the default category a suitable pale green color.

Your dialog should now look like this:

.. image:: /static/training_manual/classification/criterion_refined_list.png
   :align: center

* Apply this symbology.

Your map will look something like this:

.. image:: /static/training_manual/classification/rule_based_map_result.png
   :align: center

Now you have a map with Swellendam the most prominent residential area and other
non-residential areas colored according to their size.

|IC|
-------------------------------------------------------------------------------

Symbology allows us to represent the attributes of a layer in an easy-to-read
way. It allows us as well as the map reader to understand the significance of
features, using any relevant attributes that we choose. Depending on the
problems you face, you'll apply different classification techniques to solve
them.

|WN|
-------------------------------------------------------------------------------

Now we have a nice-looking map, but how are we going to get it out of QGIS and
into a format we can print out, or make into an image or PDF? That's the topic
of the next lesson!
