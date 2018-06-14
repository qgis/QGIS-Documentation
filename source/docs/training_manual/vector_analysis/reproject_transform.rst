.. only:: html

   |updatedisclaimer|

|LS| Reprojecting and Transforming Data
===============================================================================

Let's talk about Coordinate Reference Systems (CRSs) again. We've touched on
this briefly before, but haven't discussed what it means practically.

**The goal for this lesson:** To reproject and transform vector datasets.

|basic| |FA| Projections
-------------------------------------------------------------------------------

The CRS that all the data as well as the map itself are in right now is called
WGS84. This is a very common Geographic Coordinate System (GCS) for
representing data. But there's a problem, as we will see.

* Save your current map.
* Then open the map of the world which you'll find under
  :kbd:`exercise_data/world/world.qgs`.
* Zoom in to South Africa by using the :guilabel:`Zoom In` tool.
* Try setting a scale in the :guilabel:`Scale` field, which is in the
  :guilabel:`Status Bar` along the bottom of the screen. While over South
  Africa, set this value to :kbd:`1:5000000` (one to five million).
* Pan around the map while keeping an eye on the :guilabel:`Scale` field.

Notice the scale changing? That's because you're moving away from the one point
that you zoomed into at :kbd:`1:5000000`, which was at the center of your
screen. All around that point, the scale is different.

To understand why, think about a globe of the Earth. It has lines running along
it from North to South. These longitude lines are far apart at the equator, but
they meet at the poles.

In a GCS, you're working on this sphere, but your screen is flat. When you try
to represent the sphere on a flat surface, distortion occurs, similar to what
would happen if you cut open a tennis ball and tried to flatten it out. What
this means on a map is that the longitude lines stay equally far apart from
each other, even at the poles (where they are supposed to meet). This means
that, as you travel away from the equator on your map, the scale of the objects
that you see gets larger and larger. What this means for us, practically, is
that there is no constant scale on our map!

To solve this, let's use a Projected Coordinate System (PCS) instead. A PCS
"projects" or converts the data in a way that makes allowance for the scale
change and corrects it. Therefore, to keep the scale constant, we should
reproject our data to use a PCS.

|basic| |FA| "On the Fly" Reprojection
-------------------------------------------------------------------------------

QGIS allows you to reproject data "on the fly". What this means is that even if
the data itself is in another CRS, QGIS can project it as if it were in a CRS
of your choice.

* To enable "on the fly" projection, click on the :guilabel:`CRS Status` button
  in the :guilabel:`Status Bar` along the bottom of the QGIS window:

.. image:: img/crs_status_button.png
   :align: center

* In the dialog that appears, check the box next to :guilabel:`Enable 'on the
  fly' CRS transformation`.
* Type the word :kbd:`global` into the :guilabel:`Filter` field. One CRS
  (:guilabel:`NSIDC EASE-Grid Global`) should appear in the list below.
* Click on the :guilabel:`NSIDC EASE-Grid Global` to select it, then click :kbd:`OK`.

* Notice how the shape of South Africa changes. All projections work by
  changing the apparent shapes of objects on Earth.
* Zoom in to a scale of :kbd:`1:5000000` again, as before.
* Pan around the map.
* Notice how the scale stays the same!

"On the fly" reprojection is also used for combining datasets that are in
different CRSs.

* Deactivate "on the fly" re-projection again:

  * Click on the :guilabel:`CRS Status` button again.
  * Un-check the :guilabel:`Enable 'on the fly' CRS transformation` box.
  * Clicking :guilabel:`OK`.

* In QGIS 2.0, the 'on the fly' reprojection is automatically activated when
  layers with different CRSs are loaded in the map. To understand what
  'on the fly' reprojection does, deactivate this automatic setting:

  * Go to :menuselection:`Settings --> Options...`
  * On the left panel of the dialog, select :guilabel:`CRS`.
  * Un-check :guilabel:`Automatically enable 'on the fly' reprojection if layers
    have different CRS`.
  * Click :guilabel:`OK`.

* Add another vector layer to your map which has the data for South Africa
  only.  You'll find it as :kbd:`exercise_data/world/RSA.shp`.

What do you notice?

The layer isn't visible! But that's easy to fix, right?

* Right-click on the :guilabel:`RSA` layer in the :guilabel:`Layers list`.
* Select :guilabel:`Zoom to Layer Extent`.

OK, so now we see South Africa... but where is the rest of the world?

It turns out that we can zoom between these two layers, but we can't ever see
them at the same time. That's because their Coordinate Reference Systems are so
different. The :guilabel:`continents` dataset is in *degrees*, but the
:guilabel:`RSA` dataset is in *meters*. So, let's say that a given point in
Cape Town in the :guilabel:`RSA` dataset is about :kbd:`4 100 000` meters away
from the equator. But in the :guilabel:`continents` dataset, that same point is
about :kbd:`33.9` degrees away from the equator.

This is the same distance - but QGIS doesn't know that. You haven't told it to
reproject the data. So as far as it's concerned, the version of South Africa
that we see in the :guilabel:`RSA` dataset has Cape Town at the correct
distance of :kbd:`4 100 000` meters from the equator. But in the
:guilabel:`continents` dataset, Cape Town is only :kbd:`33.9` *meters* away
from the equator! You can see why this is a problem.

QGIS doesn't know where Cape Town is *supposed* to be - that's what the data
should be telling it. If the data tells QGIS that Cape Town is :kbd:`34` meters
away from the equator and that South Africa is only about :kbd:`12` meters from
north to south, then that is what QGIS will draw.

To correct this:

* Click on the :guilabel:`CRS Status` button again and switch
  :guilabel:`Enable 'on the fly' CRS transformation` on again as before.
* Zoom to the extents of the :guilabel:`RSA` dataset.

Now, because they're made to project in the same CRS, the two datasets fit
perfectly:

.. image:: img/with_reprojection.png
   :align: center

When combining data from different sources, it's important to remember that
they might not be in the same CRS. "On the fly" reprojection helps you to
display them together.

Before you go on, you probably want to have the 'on the fly' reprojection to be
automatically activated whenever you open datasets having different CRS:

* Open again :menuselection:`Settings --> Options...` and select :guilabel:`CRS`.
* Activate :guilabel:`Automatically enable 'on the fly' reprojection if
  layers have different CRS`.

|moderate| |FA| Saving a Dataset to Another CRS
-----------------------------------------------

Remember when you calculated areas for the buildings in the
:guilabel:`Classification` lesson? You did it so that you could classify the
buildings according to area.

* Open your usual map again (containing the |majorUrbanName| data).
* Open the attribute table for the :guilabel:`buildings` layer.
* Scroll to the right until you see the :kbd:`AREA` field.

Notice how the areas are all very small; probably zero. This is because
these areas are given in degrees - the data isn't in a Projected Coordinate
System. In order to calculate the area for the farms in square meters, the data
has to be in square meters as well. So, we'll need to reproject it.

But it won't help to just use 'on the fly' reprojection. 'On the fly' does what
it says - it doesn't change the data, it just reprojects the layers as they
appear on the map. To truly reproject the data itself, you need to export it to
a new file using a new projection.

* Right-click on the :guilabel:`buildings` layer in the :guilabel:`Layers list`.
* Select :guilabel:`Save As...` in the menu that appears. You will be shown the
  :guilabel:`Save vector layer as...` dialog.
* Click on the :guilabel:`Browse` button next to the :guilabel:`Save as` field.
* Navigate to :kbd:`exercise_data/` and specify the name of the new layer as
  :kbd:`buildings_reprojected.shp`.
* Leave the :guilabel:`Encoding` unchanged.
* Change the value of the :guilabel:`Layer CRS` dropdown to :guilabel:`Selected
  CRS`.
* Click the :guilabel:`Browse` button beneath the dropdown.
* The :guilabel:`CRS Selector` dialog will now appear.
* In its :guilabel:`Filter` field, search for :kbd:`34S`.
* Choose :guilabel:`WGS 84 / UTM zone 34S` from the list.
* Leave the :guilabel:`Symbology export` unchanged.

The :guilabel:`Save vector layer as...` dialog now looks like this:

.. image:: img/save_vector_dialog.png
   :align: center

* Click :guilabel:`OK`.

* Start a new map and load the reprojected layer you just created.

Refer back to the lesson on :guilabel:`Classification` to remember how you
calculated areas.

* Update (or add) the :kbd:`AREA` field by running the same expression as before:

.. image:: img/new_area_field.png
   :align: center

This will add an :kbd:`AREA` field with the size of each building
in square meters

* To calculate the area in another unit of measurement, for example hectares,
  use the :kbd:`AREA` field to create a second column:

.. image:: img/new_hectare_field.png
   :align: center

Look at the new values in your attribute table. This is much more useful, as
people actually quote building size in meters, not in degrees. This is why it's
a good idea to reproject your data, if necessary, before calculating areas,
distances, and other values that are dependent on the spatial properties of the
layer.

|hard| |FA| Creating Your Own Projection
-------------------------------------------------------------------------------

There are many more projections than just those included in QGIS by default.
You can also create your own projections.

* Start a new map.
* Load the :kbd:`world/oceans.shp` dataset.
* Go to :menuselection:`Settings --> Custom CRS...` and you'll see this dialog:

.. image:: img/custom_crs.png
   :align: center

* Click on the :guilabel:`Add new CRS` button to create a new projection.

An interesting projection to use is called :kbd:`Van der Grinten I`.

* Enter its name in the :guilabel:`Name` field.

This projection represents the Earth on a circular field instead of a
rectangular one, as most other projections do.

* For its parameters, use the following string:

:kbd:`+proj=vandg +lon_0=0 +x_0=0 +y_0=0 +R_A +a=6371000 +b=6371000 +units=m +no_defs`

.. image:: img/new_crs_parameters.png
   :align: center

* Click :guilabel:`OK`.
* Enable "on the fly" reprojection.
* Choose your newly defined projection (search for its name in the
  :guilabel:`Filter` field).
* On applying this projection, the map will be reprojected thus:

.. image:: img/van_grinten_projection.png
   :align: center

|IC|
-------------------------------------------------------------------------------

Different projections are useful for different purposes. By choosing the
correct projection, you can ensure that the features on your map are being
represented accurately.

|FR|
-------------------------------------------------------------------------------

Materials for the *Advanced* section of this lesson were taken from `this
article <http://tinyurl.com/75b92np>`_.

Further information on Coordinate Reference Systems is available `here
<http://linfiniti.com/dla/worksheets/7_CRS.pdf>`_.

|WN|
-------------------------------------------------------------------------------

In the next lesson you'll learn how to analyze vector data using QGIS' various
vector analysis tools.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |FR| replace:: Further Reading
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |WN| replace:: What's Next?
.. |basic| image:: /static/global/basic.png
.. |hard| image:: /static/global/hard.png
.. |majorUrbanName| replace:: Swellendam
.. |moderate| image:: /static/global/moderate.png
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
