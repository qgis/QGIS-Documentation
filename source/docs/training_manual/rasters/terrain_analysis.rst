|LS| Terrain Analysis
===============================================================================

Certain types of rasters allow you to gain more insight into the terrain that
they represent. Digital Elevation Models (DEMs) are particularly useful in this
regard. In this lesson you will use terrain analysis tools to find out more
about the study area for the proposed residential development from earlier.

**The goal for this lesson:** To use terrain analysis tools for more
information on terrain.

|basic| |FA| Calculating a Hillshade
-------------------------------------------------------------------------------

The DEM you have on your map right now does show you the elevation of the
terrain, but it can sometimes seem a little abstract. It contains all the 3D
information about the terrain that you need, but it doesn't look like a 3D
object. To get a better look at the terrain, it is possible to calculate a
*hillshade*, which is a raster that maps the terrain using light and shadow to
create a 3D-looking image.

To work with DEMs, you should use QGIS' all-in-one :guilabel:`DEM (Terrain
models)` analysis tool.

* Click on the menu item :menuselection:`Raster --> Analysis --> DEM (Terrain
  models)`.
* In the dialog that appears, ensure that the :guilabel:`Input file` is the
  :guilabel:`DEM` layer.
* Set the :guilabel:`Output file` to :kbd:`hillshade.tif` in the directory
  :kbd:`exercise_data/residential_development`.
* Check the box next to :guilabel:`Load into canvas when finished`.
* You may leave all the other options unchanged.
* Click :guilabel:`OK` to generate the hillshade.
* When it tells you that processing is completed, click :guilabel:`OK` on the
  message to get rid of it.
* Click :guilabel:`Close` on the main :guilabel:`DEM (Terrain models)` dialog.

You will now have a new layer called :guilabel:`hillshade` that looks like
this:

.. image:: ../_static/rasters/020.png
   :align: center

That looks nice and 3D, but can we improve on this? On its own, the hillshade
looks like a plaster cast. Can't we use it together with our other, more
colorful rasters somehow? Of course we can, by using the hillshade as an
overlay.

|basic| |FA| Using a Hillshade as an Overlay
-------------------------------------------------------------------------------

A hillshade can provide very useful information about the sunlight at a given
time of day. But it can also be used for aesthetic purposes, to make the map
look better. The key to this is setting the hillshade to being mostly
transparent.

* Change the symbology of the original :guilabel:`DEM` to use the
  :guilabel:`Pseudocolor` scheme.
* Hide all the layers except the :guilabel:`DEM` and :guilabel:`hillshade`
  layers.
* Click and drag the :guilabel:`DEM` to be beneath the :guilabel:`hillshade`
  layer in the :guilabel:`Layers list`. :guilabel:`Control rendering order`
  (beneath the list) should be checked as well.
* Set the :guilabel:`hillshade` layer to be transparent.
* Open its :guilabel:`Layer Properties` and go to the :guilabel:`Transparency`
  tab.
* Set the :guilabel:`Global transparency` to :kbd:`50%`:
* Click :guilabel:`OK` on the :guilabel:`Layer Properties` dialog. You'll get a
  result like this:

  .. image:: ../_static/rasters/023.png
     :align: center

* Switch the :guilabel:`hillshade` layer off and back on in the
  :guilabel:`Layers list` to see the difference it makes.

Using a hillshade in this way, it's possible to enhance the topography of the
landscape. If the effect doesn't seem strong enough to you, you can change the
transparency of the :guilabel:`hillshade` layer; but of course, the brighter
the hillshade becomes, the dimmer the colors behind it will be. You will need
to find a balance that works for you.

Remember to save your map when you are done.

.. note::  For the next two exercises, please use a new map. Load only the
   :kbd:`DEM` raster dataset into it
   (:kbd:`exercise_data/raster/SRTM/srtm_41_19.tif`). This is to simplify
   matters while you're working with the raster analysis tools. Save the map
   as :kbd:`exercise_data/raster_analysis.qgs`.

|moderate| |FA| Calculating the Slope
-------------------------------------------------------------------------------

Another useful thing to know about the terrain is how steep it is. If, as in
our analysis, you want to build houses on the land there, then you need land
that is relatively flat. 

To do this, you need to use the :guilabel:`Slope` mode of the :guilabel:`DEM
(Terain models)` tool.

* Open the tool as before.
* Select the :guilabel:`Mode` option :guilabel:`Slope`:

  .. image:: ../_static/rasters/024.png
     :align: center

* Set the save location to
  :kbd:`exercise_data/residential_development/slope.tif`
* Enable the :guilabel:`Load into canvas...` checkbox.
* Click :guilabel:`OK` and close the dialog when processing is complete. You'll
  see a new raster loaded into your map.
* With the new raster selected in the :guilabel:`Layers list`, click the
  :guilabel:`Stretch Histogram to Full Dataset` button. Now you'll see the
  slope of the terrain, with black pixels being flat terrain and white pixels,
  steep terrain:

  .. image:: ../_static/rasters/025.png
     :align: center

.. _backlink-raster-analysis-1:

|moderate| |TY| calculating the aspect
-------------------------------------------------------------------------------

The *aspect* of terrain refers to the direction it's facing in. Since this
study is taking place in the Southern Hemisphere, properties should ideally be
built on a north-facing slope so that they can remain in the sunlight.

* Use the :guilabel:`Aspect` mode of the :guilabel:`DEM (Terain models)` tool
  to calculate the aspect of the terrain.

:ref:`Check your results <raster-analysis-1>`

|moderate| |FA| Using the Raster Calculator
-------------------------------------------------------------------------------

Think back to the residential property development problem, which we last
addressed in the *Vector Analysis* lesson. So far, you've identified several
farms that would be suitable, but without taking the terrain into account.
Let's say that an ideal farm for development needs to have areas on it that are
north-facing, and with a slope of less than five degrees. But if the slope is
less than 2 degrees, then the aspect doesn't matter.

Fortunately, you already have rasters showing you the slope as well as the
aspect, but you have no way of knowing where both conditions are satisfied at
once. How could this analysis be done?

The answer lies with the :guilabel:`Raster calculator`.

* Click on :menuselection:`Raster > Raster calculator...` to start this tool.
* To make use of the :guilabel:`aspect` dataset, double-click on the item
  :guilabel:`aspect@1` in the :guilabel:`Raster bands` list on the left. It
  will appear in the :guilabel:`Raster calculator expression` text field below.

North is at 0 (zero) degrees, so for the terrain to face north, its aspect
needs to be greater than 270 degrees and less than 90 degrees.

* In the :guilabel:`Raster calculator expression` field, enter this expression:

  :kbd:`aspect@1 <= 90 OR aspect@1 >= 270`

* Set the output file to :kbd:`aspect_north.tif` in the directory
  :kbd:`exercise_data/residential_development/`.
* Ensure that the box :guilabel:`Add result to project` is checked.
* Click :guilabel:`OK` to begin processing.

.. image:: ../_static/rasters/029.png
   :align: center

Your result will be this:

.. image:: ../_static/rasters/030.png
   :align: center


.. _backlink-raster-analysis-2:

|moderate| |TY|
-------------------------------------------------------------------------------

Now that you've done the aspect, create two separate new analyses of the
:guilabel:`DEM` layer.

* The first will be to identify all areas where the slope is less than or equal
  to :kbd:`2` degrees.
* The second is similar, but the slope should be less than or equal to :kbd:`5`
  degrees.
* Save them under :kbd:`exercise_data/residential_development/` as
  :kbd:`slope_lte2.tif` and :kbd:`slope_lte5.tif`.

:ref:`Check your results <raster-analysis-2>`


|moderate| |FA| Combining Raster Analysis Results
-------------------------------------------------------------------------------

Now you have three new analysis rasters of the :guilabel:`DEM` layer:

* :guilabel:`aspect_north`: the terrain faces north
* :guilabel:`slope_lte2`: the slope is at or below 2 degrees
* :guilabel:`slope_lte5`: the slope is at or below 5 degrees

Where the conditions of these layers are met, they are equal to :kbd:`1`.
Elsewhere, they are equal to :kbd:`0`. Therefore, if you multiply one of these
rasters by another one, you will get the areas where both of them are equal to
:kbd:`1`.

The conditions to be met are: at or below 5 degrees of slope, the terrain must
face north; but at or below 2 degrees of slope, the direction that the terrain
faces in does not matter.

Therefore, you need to find areas where the slope is at or below 5 degrees
:kbd:`AND` the terrain is facing north; :kbd:`OR` the slope is at or below 2
degrees. Such terrain would be suitable for development.

To calculate the areas that satisfy these criteria:

* Open your :guilabel:`Raster calculator` again.
* Use the :guilabel:`Raster bands` list, the :guilabel:`Operators` buttons, and
  your keyboard to build this expression in the :guilabel:`Raster calculator
  expression` text area:

  :kbd:`( aspect_north@1 = 1 AND slope_lte5@1 = 1 )  OR slope_lte2@1 = 1`

* Save the output under :kbd:`exercise_data/residential_development/` as
  :kbd:`all_conditions.tif`.
* Click :guilabel:`OK` on the :guilabel:`Raster calculator`. Your results:

  .. image:: ../_static/rasters/034.png
     :align: center


|moderate| |FA| Simplifying the Raster
-------------------------------------------------------------------------------

As you can see from the image above, the combined analysis has left us with
many, very small areas where the conditions are met. But these aren't really
useful for our analysis, since they're too small to build anything on. Let's
get rid of all these tiny unusable areas.

* Open the :guilabel:`Sieve` tool (:menuselection:`Raster --> Analysis -->
  Sieve`).
* Set the :guilabel:`Input file` to :kbd:`all_conditions`, and the
  :guilabel:`Output file` to :kbd:`all_conditions_sieve.tif` (under
  :kbd:`exercise_data/residential_development/`).
* Set both the :guilabel:`Threshold` and :guilabel:`Pixel connections` values
  to :kbd:`8`, then run the tool.

Once processing is done, the new layer will load into the canvas. But when you
try to use the histogram stretch tool to view the data, this happens:

.. image:: ../_static/rasters/036.png
   :align: center

What's going on? The answer lies in the new raster file's metadata.

* View the metadata under the :guilabel:`Metadata` tab of the :guilabel:`Layer
  Properties` dialog.

Whereas this raster, like the one it's derived from, should only
feature the values :kbd:`1` and :kbd:`0`, it has the :kbd:`STATISTICS_MINIMUM`
value of a very large negative number. Investigation of the data shows that
this number acts as a null value. Since we're only after areas that weren't
filtered out, let's set these null values to zero.

* Open the :guilabel:`Raster Calculator` again, and build this expression:

  :kbd:`(all_conditions_sieve@1 <= 0) = 0`

  This will maintain all existing zero values, while also setting the negative
  numbers to zero; which will leave all the areas with value :kbd:`1` intact.
* Save the output under :kbd:`exercise_data/residential_development/` as
  :kbd:`all_conditions_simple.tif`.

Your output looks like this:

.. image:: ../_static/rasters/037.png
   :align: center

This is what was expected: a simplified version of the earlier results.
Remember that if the results you get from a tool aren't what you expected,
viewing the metadata (and vector attributes, if applicable) can prove essential
to solving the problem.

|IC|
-------------------------------------------------------------------------------

You've seen how to derive all kinds of analysis products from a DEM. These
include hillshade, slope and aspect calculations. You've also seen how to use
the raster calculator to further analyze and combine these results.

|WN|
-------------------------------------------------------------------------------

Now you have two analyses: the vector analysis which shows you the potentially
suitable farms, and the raster analysis that shows you the potentially suitable
terrain. How can these be combined to arrive at a final result for this
problem? That's the topic for the next lesson, starting in the next module.
