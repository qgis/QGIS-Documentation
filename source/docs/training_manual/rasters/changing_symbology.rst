|LS| Changing Raster Symbology
===============================================================================

Not all raster data consists of aerial photographs. There are many other forms
of raster data, and in many of those cases, it's essential to symbolize the
data properly so that it becomes properly visible and useful.

**The goal for this lesson:** To change the symbology for a raster layer.

|basic| |TY|
-------------------------------------------------------------------------------

* Use the :guilabel:`Add Raster Layer` button to load the new raster dataset.
* Into your current map (which, following from the previous lesson, should be
  :kbd:`analysis.qgs`) load the dataset :kbd:`srtm_41_19.tif`, found under the
  directory :kbd:`exercise_data/raster/SRTM/`.
* Once it appears in the :guilabel:`Layers list`, rename it to :kbd:`DEM`.

This dataset is a *Digital Elevation Model (DEM)*. It's a map of the elevation
(altitude) of the terrain, allowing us to see where the mountains and valleys
are, for example.

Once it's loaded, you'll notice that it's basically a gray rectangle. It's seen
here with the vector layers on top:

.. image:: ../_static/rasters/009.png
   :align: center

That's because its symbology hasn't been customized. In a color aerial
photograph, everything is already defined. But if you load a raster and it's
just a gray rectangle, then you know there's no symbology for it yet. It still
needs to be defined. So that's what you should do next.

|basic| |FA| Changing Raster Layer Symbology
-------------------------------------------------------------------------------

* Open the :guilabel:`Layer Properties` dialog for the :guilabel:`SRTM` layer.
* Switch to the :guilabel:`Style` tab.

These are the current settings, and as we've seen, they don't give us much
information on the layer. Does it even have any data in it? Let's see.

* Change the :guilabel:`Color map` to :guilabel:`Pseudocolor`:

.. image:: ../_static/rasters/011.png
   :align: center

* Click :guilabel:`OK`.

You'll see the raster looking like this:

.. image:: ../_static/rasters/012.png
   :align: center

That does tell us what we need to know. There is data in this layer. But maybe
we don't want to symbolize it using these colors.

* Open :guilabel:`Layer Properties` again.
* Switch the :guilabel:`Color map` back to :guilabel:`Grayscale`.

But this time, to prevent it from becoming a gray rectangle again, let's tell
QGIS to "stretch" the color values. This will make QGIS use all of the
available colors (in :guilabel:`Grayscale`, this is black, white and all shades
of gray in between).

* Tell it to use :guilabel:`Custom min / max values`:

.. image:: ../_static/rasters/015.png
   :align: center

* Set the value :guilabel:`Current` of :guilabel:`Contrast enhancement` to
  :guilabel:`Stretch To MinMax`:

.. image:: ../_static/rasters/013.png
   :align: center

But what are the minimum and maximum values that should be used for the
stretch? The ones that are currently under :guilabel:`Custom min / max values`
are the same values that just gave us a gray rectangle before. Instead, we
should be using the minimum and maximum values that are actually in the image,
right? Fortunately, you can determine those values easily by loading the
minimum and maximum values of the raster.

* Under :guilabel:`Load min / max values from band`, select :guilabel:`Estimate
  (faster)`.
* Click the :guilabel:`Load` button:

.. image:: ../_static/rasters/014.png
   :align: center

Notice how the :guilabel:`Custom min / max values` have changed:

.. image:: ../_static/rasters/016.png
   :align: center

* Click :guilabel:`OK`.

You'll see the values of the raster properly displayed, with the darker colors
representing valleys and the lighter ones, mountains:

.. image:: ../_static/rasters/017.png
   :align: center

But isn't there a quicker way?
...............................................................................

Yes, there is! Now that you understand what needs to be done, you'll be glad to
know that there's a tool for doing all of this easily.

* Remove the current DEM from the :guilabel:`Layers list`.
* Load the raster in again, renaming it to :kbd:`DEM` as before. It's a gray
  rectangle again...
* Enable the tool you'll need by enabling :menuselection:`View --> Toolbars -->
  Raster`. These icons will appear in the interface:

  .. image:: ../_static/rasters/018.png
     :align: center

The button on the right will stretch the minimum and maximum values to give you
the best contrast in the local area that you're zoomed into. It's useful for
large datasets. The button on the left will stretch  the minimum and maximum
values to constant values across the whole image.

* Click the button on the left (:guilabel:`Stretch Histogram to Full Dataset`).
  You'll see the data is now correctly represented as before!

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
