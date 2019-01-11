.. only:: html

   |updatedisclaimer|

|LS| Changing Raster Symbology
===============================================================================

Not all raster data consists of aerial photographs. There are many other forms
of raster data, and in many of those cases, it's essential to symbolize the
data properly so that it becomes properly visible and useful.

**The goal for this lesson:** To change the symbology for a raster layer.

|basic| |TY|
-------------------------------------------------------------------------------

#. Use the :guilabel:`Browser` Panel to load the new raster dataset;
#. Load the dataset |srtmFileName|, found under the directory
   :file:`exercise_data/raster/SRTM/`;
#. Once it appears in the :guilabel:`Layers` Panel, rename it to ``DEM``;
#. Zoom to the extent of this layer by right-clicking on it in the Layer List
   and selecting :guilabel:`Zoom to Layer`.

This dataset is a *Digital Elevation Model (DEM)*. It's a map of the elevation
(altitude) of the terrain, allowing us to see where the mountains and valleys
are, for example.

While each pixel of dataset of the previous section contained color information,
in a *DEM* file, each pixel contains elevation values.

Once it's loaded, you'll notice that it's a basic stretched grayscale
representation of the DEM:

.. image:: img/greyscale_dem.png
   :align: center

QGIS has automatically applied a stretch to the image for visualization
purposes, and we will learn more about how this works as we continue.

|basic| |FA| Changing Raster Layer Symbology
-------------------------------------------------------------------------------

You have basically two different options to change the raster symbology:

#. Within the :guilabel:`Layer Properties` dialog for the :guilabel:`DEM` layer
   by right-clicking on the layer in the Layer tree and selecting
   :guilabel:`Properties` option. Then switch to the :guilabel:`Symbology` tab;
#. By clicking on the |symbology| button right above the :guilabel:`Layers` Panel.
   This will open the :guilabel:`Layer Styling` anel where you can switch to the
   :guilabel:`Symbology` tab.

Choose the method you prefer to work with.

|basic| |FA| Singleband gray
-------------------------------------------------------------------------------

When you load a raster file, if it is not a photo image like the ones of the previous
section, the default style is set to a grayscale gradient.

Let's explore some of the features of this renderer.

.. image:: img/dem_layer_properties.png
   :align: center

The default :guilabel:`Color gradient` is set to ``Black to white``, meaning
that low pixel values are black and while high values are white. Try to invert
this setting to ``White to black`` and see the results.

Very important is the :guilabel:`Contrast enhancement` parameter: by default it
is set to ``Stretch to MinMax`` meaning that the grayscale is stretched to the
minimum and maximum values.

Look at the difference with the enhancement (left) and without (right):

.. image:: img/enhancement.png
   :align: center

But what are the minimum and maximum values that should be used for the
stretch? The ones that are currently under :guilabel:`Min / Max Value Settings`.
There are many ways that you can use to calculate the minimum and maximum values
and use them for the stretch:

#. **User Defined**: you choose both minimum and maximum values manually;
#. **Cumulative count cut**: this is useful when you have few extreme low or high
   values. It *cuts* the ``2%`` (or the value you choose) of these values;
#. **Min / max**: the *real* minimum and maximum values of the raster;
#. **Mean +/- standard deviation**: the values will be calculated according to
   the mean value and the standard deviation.


|basic| |FA| Singleband pseudocolor
-------------------------------------------------------------------------------

Grayscales are not always great styles for raster layers. Let's try to make the
:guilabel:`DEM` layer more colorful.

* Change the :guilabel:`Render type` to :guilabel:`Singleband pseudocolor`:
  if you don't like the default colors loaded, click on :guilabel:`Color ramp`
  and change them;
* Click the :guilabel:`Classify` button to generate a new color classification;
* If it is not generated automatically click on the :guilabel:`OK` button to
  apply this classification to the DEM.

.. image:: img/dem_pseudocolor_properties.png
   :align: center

You'll see the raster looking like this:

.. image:: img/pseudocolor_raster.png
   :align: center

This is an interesting way of looking at the DEM. You'll now see that the values
of the raster are again properly displayed, with the darker colors representing
valleys and the lighter ones, mountains.


|FA| Changing the transparency
-------------------------------------------------------------------------------

Sometimes changing the transparency of the whole raster layer can help you to
see other layers covered by the raster itself and better understand the study
area.

To change the transparency of the whole raster switch to the :guilabel:`Transparency`
tab and use the slider of the :guilabel:`Global Opacity` to lower the opacity:

.. image:: img/global_transparency.png
   :align: center

More interesting is changing the transparency of single pixels. For example in
the raster we used you can see an homogeneous color at the corners:

.. image:: img/corner_values.png
   :align: center

To set this values as transparent, the :guilabel:`Custom Transparency Options`
menu in :guilabel:`Transparency` has some useful methods:

* By clicking on the |signPlus| button you can add a range of values and set the
  transparency percentage of each range chosen;
* For single values the |contextHelp| button is more useful;
* Click on the |contextHelp| button. The dialog disappearing and you can
  interact with the map;
* Click on a corner of the raster file;
* You will see that the transparency table will be automatically filled with the
  clicked values:

  .. image:: img/click_transparency.png
     :align: center

* Click on :guilabel:`OK` to close the dialog and see the changes.

  .. image:: img/good_raster.png
     :align: center

  See? The corners are now 100% transparent.


|IC|
-------------------------------------------------------------------------------

These are only the basic functions to get you started with raster symbology.
QGIS also allows you many other options, such as symbolizing a layer using
paletted/unique values, representing different bands with different colors in
a multispectral image or making an automatic hillshade effect (useful only with
DEM raster files).

Reference
-------------------------------------------------------------------------------

The SRTM dataset was obtained from `http://srtm.csi.cgiar.org/
<http://srtm.csi.cgiar.org/>`_

|WN|
-------------------------------------------------------------------------------

Now that we can see our data displayed properly, let's investigate how we can
analyze it further.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |TY| replace:: Try Yourself
.. |WN| replace:: What's Next?
.. |basic| image:: /static/global/basic.png
.. |contextHelp| image:: /static/common/mActionContextHelp.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |srtmFileName| replace:: :file:`srtm_41_19_4326.tif`
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
