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

.. image:: ../_static/vector_analysis/001.png
   :align: center

* In the dialog that appears, check the box next to :guilabel:`Enable 'on the
  fly' CRS transformation`. 
* Type the word :kbd:`global` into the :guilabel:`Filter` field. One CRS
  (:guilabel:`NSIDC EASE-Grid Global`) will appear in the list below.
* Click on it to select it, then click :kbd:`OK`.

* Notice how the shape of South Africa changes. All projections work by
  changing the apparent shapes of objects on Earth.
* Zoom in to a scale of :kbd:`1:5000000` again, as before.
* Pan around the map.
* Notice how the scale stays the same!

"On the fly" reprojection is also used for combining datasets that are in
different CRSs.

* Deactivate "on the fly" reprojection again:

  * Click on the :guilabel:`CRS Status` button again.
  * Uncheck the :guilabel:`Enable 'on the fly' CRS transformation` box.
  * Clicking :guilabel:`OK`.

* Add another vector layer to your map which has the data for South Africa
  only.  You'll find it as :kbd:`exercise_data/world/RSA.shp`.

What do you notice?

The layer isn't visible! But that's easy to fix, right?

* Right-click on the layer in the :guilabel:`Layers list`.
* Select :guilabel:`Zoom to Layer Extent`.

OK, so now we see South Africa... but where is the rest of the world?

It turns out that we can zoom between these two layers, but we can't ever see
them at the same time. That's because their Coordinate Reference Systems are so
different. The :guilabel:`continents` dataset is in *degrees*, but the
:guilabel:`RSA` dataset is in *meters*. So, let's say that a given point in
Cape Town in the :guilabel:`RSA` dataset is about :kbd:`4 100 000` meters away
from the equator. But in the :guilabel:`continents` dataset, that same point is
about :kbd:`33.9` degrees away from the equator.

This is the same distance - but QGIS doesn't know that! You haven't told it to
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

* Switch :guilabel:`Enable 'on the fly' CRS transformation` on again as before.
* Zoom to the extents of the :guilabel:`RSA` dataset.

Now, because they're made to project in the same CRS, the two datasets fit
perfectly:

.. image:: ../_static/vector_analysis/002.png
   :align: center

When combining data from different sources, it's important to remember that
they might not be in the same CRS. "On the fly" reprojection helps you to
display them together.

|moderate| |FA| Saving a Dataset to Another CRS
-------------------------------------------------------------------------------

Remember when you calculated areas for the farms in the
:guilabel:`Classification` lesson? You did it so that you could classify the
farms according to area.

* Open your usual map again (containing the Swellendam data).
* Open the attribute table for the :guilabel:`rural` layer.
* Scroll to the right until you see the :kbd:`AREA` field.

Notice how the areas are all very small; basically zero. This is because
these areas are given in degrees - the data isn't in a Projected Coordinate
System. In order to calculate the area for the farms in square meters, the data
has to be in square meters as well. So, we'll need to reproject it.

But it won't help to just use "on the fly" reprojection. "On the fly" does what
it says - it doesn't change the data, it just reprojects the layers as they
appear on the map. To truly reproject the data itself, you need to export it to
a new file using a new projection.

* Right-click on the :guilabel:`rural` layer in the :guilabel:`Layers list`.
* Select :guilabel:`Save As...` in the menu that appears. You will be shown the
  :guilabel:`Save vector layer as...` dialog.
* Click on the :guilabel:`Browse` button next to the :guilabel:`Save as` field.
* Navigate to :kbd:`exercise_data/` and specify the name of the new layer as
  :kbd:`rural_reprojected.shp`.
* Leave the :guilabel:`Encoding` unchanged.
* Change the value of the :guilabel:`Layer CRS` dropdown to :guilabel:`Selected
  CRS`.
* Click the :guilabel:`Browse` button beneath the dropdown.
* The :guilabel:`CRS Selector` dialog will now appear.
* In its :guilabel:`Filter` field, search for :kbd:`33S`.
* Choose :guilabel:`WGS 84 / UTM zone 33S` from the list.
* Click :guilabel:`OK`.
  
The :guilabel:`Save vector layer as...` dialog now looks like this:

.. image:: ../_static/vector_analysis/004.png
   :align: center

* Click :guilabel:`OK` and after an instant, you should be presented with:

.. image:: ../_static/vector_analysis/005.png
   :align: center

* Click :guilabel:`OK`.
* Start a new map:

.. image:: ../_static/vector_analysis/006.png
   :align: center

Refer back to the lesson on :guilabel:`Classification` to remember how you
calculated areas.

* Update the :kbd:`AREAS` field by running the same expression as before:

.. image:: ../_static/vector_analysis/007.png
   :align: center

This will update the :kbd:`AREAS` field with the areas of the farms in square
meters.

* To calculate the area in hectares, do this:

.. image:: ../_static/vector_analysis/008.png
   :align: center

Look at the new values in your attribute table. This is much more useful, as
people actually quote property areas in hectares, not in degrees. And
projecting the data in an appropriate projection before calculating the area
will actually give you the area in hectares. This is why it's a good idea to
reproject your data, if necessary, before calculating areas, distances, and
other values that are dependent on the spatial properties of the layer.

|hard| |FA| Creating Your Own Projection
-------------------------------------------------------------------------------

There are many more projections than just those included in QGIS by default.
You can also create your own projections.

* Start a new map.
* Load the :kbd:`world/oceans.shp` dataset.
* Go to :menuselection:`Settings --> Custom CRS...` and you'll see this dialog:

.. image:: ../_static/vector_analysis/009.png
   :align: center

* Click on the button with the star icon to create a new projection. You'll
  notice that the name and parameters are now blank.

An interesting projection to use is called :kbd:`Van der Grinten I`.

* Enter its name in the :guilabel:`Name` field.

This projection represents the Earth on a circular field instead of a
rectangular one, as most other projections do. 

* For its parameters, use the following string:

:kbd:`+proj=vandg +lon_0=0 +x_0=0 +y_0=0 +R_A +a=6371000 +b=6371000 +units=m
+no_defs`

* Click the :guilabel:`Save` button:

.. image:: ../_static/vector_analysis/010.png
   :align: center

* Click :guilabel:`OK`.
* Enable "on the fly" reprojection.
* Choose your newly defined projection (search for its name in the
  :guilabel:`Filter` field).
* On applying this projection, the map will be reprojected thus:

.. image:: ../_static/vector_analysis/011.png
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
