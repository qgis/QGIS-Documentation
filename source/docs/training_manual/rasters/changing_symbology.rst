|LS| Changing Raster Symbology
===============================================================================

Not all raster data consists of aerial photographs. There are many other forms
of raster data, and in many of those cases, it's essential to symbolize the
data properly so that it becomes properly visible and useful.

**The goal for this lesson:** To change the symbology for a raster layer.

|basic| |TY|
-------------------------------------------------------------------------------

* Start with the current map from the previous exercise :kbd:`analysis.qgs`.
* Use the :guilabel:`Add Raster Layer` button to load the new raster dataset.
* Load the dataset |srtmFileName|, found under the directory
  :kbd:`exercise_data/raster/SRTM/`.
* Once it appears in the :guilabel:`Layers list`, rename it to :kbd:`DEM`.
* Zoom to the extent of this layer by right-clicking on it in the Layer List
  and selecting :guilabel:`Zoom to Layer Extent`.

This dataset is a *Digital Elevation Model (DEM)*. It's a map of the elevation
(altitude) of the terrain, allowing us to see where the mountains and valleys
are, for example.

Once it's loaded, you'll notice that it's a basic stretched grayscale
representation of the DEM. It's seen here with the vector layers on top:

.. image:: /static/training_manual/rasters/greyscale_dem.png
   :align: center

QGIS has automatically applied a stretch to the image for visualization
purposes, and we will learn more about how this works as we continue.

|basic| |FA| Changing Raster Layer Symbology
-------------------------------------------------------------------------------

* Open the :guilabel:`Layer Properties` dialog for the :guilabel:`SRTM` layer
  by right-clicking on the layer in the Layer tree and selecting
  :guilabel:`Properties` option.
* Switch to the :guilabel:`Style` tab.

.. image:: /static/training_manual/rasters/dem_layer_properties.png
   :align: center

These are the current settings that QGIS applied for us by default. Its just
one way to look at a DEM, so lets explore some others.

* Change the :guilabel:`Render type` to :guilabel:`Singleband pseudocolor`,
  and use the default options presented.
* Click the :guilabel:`Classify` button to generate a new color classification,
  and click :guilabel:`OK` to apply this classification to the DEM.

.. image:: /static/training_manual/rasters/dem_pseudocolor_properties.png
   :align: center

You'll see the raster looking like this:

.. image:: /static/training_manual/rasters/pseudocolor_raster.png
   :align: center

This is an interesting way of looking at the DEM, but maybe we don't want to
symbolize it using these colors.

* Open :guilabel:`Layer Properties` dialog again.
* Switch the :guilabel:`Render Type` back to :guilabel:`Singleband gray`.
* Click :guilabel:`OK` to apply this setting to the raster.

You will now see a totally gray rectangle that isn't very useful at all.

.. image:: /static/training_manual/rasters/singleband_grey_raster.png
   :align: center

This is because we have lost the default settings which "stretch" the color
values to show them contrast.

Let's tell QGIS to again "stretch" the color values based on the range of
data in the DEM. This will make QGIS use  all of the available colors (in
:guilabel:`Grayscale`, this is black, white and all shades of gray in between).

* Specify the :guilabel:`Min` and :guilabel:`Max` values as shown below.
* Set the value :guilabel:`Contrast enhancement` to
  :guilabel:`Stretch To MinMax`:

.. image:: /static/training_manual/rasters/singleband_grey_settings.png
   :align: center

But what are the minimum and maximum values that should be used for the
stretch? The ones that are currently under :guilabel:`Min` and :guilabel:`Max`
values are the same values that just gave us a gray rectangle before. Instead,
we should be using the minimum and maximum values that are actually in the
image, right? Fortunately, you can determine those values easily by loading the
minimum and maximum values of the raster.

* Under :guilabel:`Load min / max values`, select :guilabel:`Min / Max` option.
* Click the :guilabel:`Load` button:

Notice how the :guilabel:`Custom min / max values` have changed to reflect the
actual values in our DEM:

.. image:: /static/training_manual/rasters/grey_custom_min_max.png
   :align: center

* Click :guilabel:`OK` to apply these settings to the image.

You'll now see that the values of the raster are again properly displayed,
with the darker colors representing valleys and the lighter ones, mountains:

.. image:: /static/training_manual/rasters/correct_black_white.png
   :align: center

But isn't there a better or easier way?
...............................................................................

Yes, there is. Now that you understand what needs to be done, you'll be glad to
know that there's a tool for doing all of this easily.

* Remove the current DEM from the :guilabel:`Layers list`.
* Load the raster in again, renaming it to :kbd:`DEM` as before. It's a gray
  rectangle again...
* Enable the tool you'll need by enabling :menuselection:`View --> Toolbars -->
  Raster`. These icons will appear in the interface:

  .. image:: /static/training_manual/rasters/raster_toolbar.png
     :align: center

The third button from the left :guilabel:`Local Histogram Stretch` will
automatically stretch the minimum and  maximum values to give you the
best contrast in the local area that you're  zoomed into. It's useful for large
datasets. The button on the left :guilabel:`Local Cumulative Cut Stretch ...`
will stretch the minimum and maximum values  to constant values across the whole
image.

* Click the fourth button from the left (:guilabel:`Stretch Histogram to Full Dataset`).
  You'll see the data is now correctly represented as before.

You can try the other buttons in this toolbar and see how they alter the
stretch of the image when zoomed in to local areas or when fully zoomed out.

|IC|
-------------------------------------------------------------------------------

These are only the basic functions to get you started with raster symbology.
QGIS also allows you many other options, such as symbolizing a layer using
standard deviations, or representing different bands with different colors in a
multispectral image.

Reference
-------------------------------------------------------------------------------

The SRTM dataset was obtained from `http://srtm.csi.cgiar.org/
<http://srtm.csi.cgiar.org/>`_

|WN|
-------------------------------------------------------------------------------

Now that we can see our data displayed properly, let's investigate how we can
analyze it further.
