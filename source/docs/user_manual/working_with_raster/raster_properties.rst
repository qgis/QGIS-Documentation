|updatedisclaimer|

Raster Properties Dialog
========================

To view and set the properties for a raster layer, double click on the layer name
in the map legend, or right click on the layer name and choose :guilabel:`Properties`
from the context menu. This will open the :guilabel:`Raster Layer Properties` dialog (see figure_raster_1_).

There are several menus in the dialog:

* :guilabel:`General`
* :guilabel:`Style`
* :guilabel:`Transparency`
* :guilabel:`Pyramids`
* :guilabel:`Histogram`
* :guilabel:`Metadata`


.. _figure_raster_1:

.. only:: html

   **Figure Raster 1:**

.. figure:: /static/user_manual/working_with_raster/rasterPropertiesDialog.png
   :align: center

   Raster Layers Properties Dialog |nix|

.. _label_generaltab:

General Menu
-------------

Layer Info
..........

The :guilabel:`General` menu displays basic information about the selected raster,
including the layer source path, the display name in the legend (which can be
modified), and the number of columns, rows and no-data values of the raster. 

Coordinate reference system
...........................

Here, you find the coordinate reference system (CRS) information printed as a 
PROJ.4 string. If this setting is not correct, it can be modified by clicking 
the **[Specify]** button.

Scale Dependent visibility
..........................

Additionally scale-dependent visibility can be set in this tab. You will need to
check the checkbox and set an appropriate scale where your data will be
displayed in the map canvas.

At the bottom, you can see a thumbnail of the layer, its legend symbol, and the palette.

.. index:: Symbology, Single_Band_Raster, Three_Band_Color_Raster, Multi_Band_Raster

.. _label_symbology:

Style Menu
----------

Band rendering
..............

|qg| offers four different :guilabel:`Render types`. The renderer chosen is dependent on the
data type.

#. Multiband color - if the file comes as a multiband with several bands (e.g., used with a satellite image
   with several bands)
#. Paletted - if a single band file comes with an indexed palette (e.g., used with a digital topographic map)
#. Singleband gray - (one band of) the image will be rendered as gray; |qg| will choose this renderer
   if the file has neither multibands nor an indexed palette nor a continous palette
   (e.g., used with a shaded relief map)
#. Singleband pseudocolor - this renderer is possible for files with a continuous palette,
   or color map (e.g., used with an elevation map)


.. _multiband_color:

**Multiband color**

With the multiband color renderer, three selected bands from the image will be rendered, each band
representing the red, green or blue component that will be used to create a color image. You can
choose several :guilabel:`Contrast enhancement` methods: 'No enhancement', 'Stretch to MinMax',
'Stretch and clip to MinMax' and 'Clip to min max'.

.. _figure_raster_2:

.. only:: html

   **Figure Raster 2:**

.. figure:: /static/user_manual/working_with_raster/rasterMultibandColor.png
   :align: center

   Raster Renderer - Multiband color |nix|

This selection offers you a wide range of options to modify the appearance
of your raster layer. First of all, you have to get the data range from your
image. This can be done by choosing the :guilabel:`Extent` and pressing
**[Load]**. |qg| can |radiobuttonon| :guilabel:`Estimate (faster)` the
:guilabel:`Min` and :guilabel:`Max` values of the bands or use the
|radiobuttonoff| :guilabel:`Actual (slower)` :guilabel:`Accuracy`.

Now you can scale the colors with the help of the :guilabel:`Load min/max values` section.
A lot of images have a few very low and high data. These outliers can be eliminated
using the |radiobuttonon| :guilabel:`Cumulative count cut` setting. The standard data range is set
from 2% to 98% of the data values and can be adapted manually. With this
setting, the gray character of the image can disappear.
With the scaling option |radiobuttonoff| :guilabel:`Min/max`, |qg| creates a color table with all of
the data included in the original image (e.g., |qg| creates a color table
with 256 values, given the fact that you have 8 bit bands).
You can also calculate your color table using the |radiobuttonoff| :guilabel:`Mean +/- standard deviation x` |selectnumber|.
Then, only the values within the standard deviation or within multiple standard deviations
are considered for the color table. This is useful when you have one or two cells
with abnormally high values in a raster grid that are having a negative impact on
the rendering of the raster.

All calculations can also be made for the |radiobuttonoff| :guilabel:`Current` extent.


.. tip:: **Viewing a Single Band of a Multiband Raster**

   If you want to view a single band of a multiband
   image (for example, Red), you might think you would set the Green and Blue bands to
   "Not Set". But this is not the correct way. To display the Red band,
   set the image type to 'Singleband gray', then select Red as the band to use for Gray.

**Paletted**

This is the standard render option for singleband files that already include a color table,
where each pixel value is assigned to a certain color. In that case, the palette is
rendered automatically. If you want to change colors assigned to certain values, just double-click
on the color and the :guilabel:`Select color` dialog appears. Also, in |qg| 2.2. it's now possible
to assign a label to the color values. The label appears in the legend of the raster layer then.

.. _figure_raster_3:

.. only:: html

   **Figure Raster 3:**

.. figure:: /static/user_manual/working_with_raster/rasterPaletted.png
   :align: center

   Raster Renderer - Paletted |nix|

.. index:: Contrast_enhancement

**Contrast enhancement**

.. note::
   When adding GRASS rasters, the option *Contrast enhancement* will always be
   set automatically to *stretch to min max*, regardless of if this is set to another value
   in the |qg| general options.


**Singleband gray**

This renderer allows you to render a single band layer with a :guilabel:`Color gradient`:
'Black to white' or 'White to black'. You can define a :guilabel:`Min`
and a :guilabel:`Max` value by choosing the :guilabel:`Extent` first and
then pressing **[Load]**.  |qg| can |radiobuttonon| :guilabel:`Estimate (faster)` the
:guilabel:`Min` and :guilabel:`Max` values of the bands or use the
|radiobuttonoff| :guilabel:`Actual (slower)` :guilabel:`Accuracy`.

.. _figure_raster_4:

.. only:: html

   **Figure Raster 4:**

.. figure:: /static/user_manual/working_with_raster/rasterSingleBandGray.png
   :align: center

   Raster Renderer - Singleband gray |nix|


With the :guilabel:`Load min/max values` section, scaling of the color table
is possible. Outliers can be eliminated using the |radiobuttonon| :guilabel:`Cumulative count cut` setting.
The standard data range is set from 2% to 98% of the data values and can
be adapted manually. With this setting, the gray character of the image can disappear.
Further settings can be made with |radiobuttonoff| :guilabel:`Min/max` and
|radiobuttonoff| :guilabel:`Mean +/- standard deviation x` |selectnumber|.
While the first one creates a color table with all of the data included in the
original image, the second creates a color table that only considers values
within the standard deviation or within multiple standard deviations.
This is useful when you have one or two cells with abnormally high values in
a raster grid that are having a negative impact on the rendering of the raster.


**Singleband pseudocolor**

This is a render option for single-band files, including a continous palette.
You can also create individual color maps for the single bands here.

.. _figure_raster_5:

.. only:: html

   **Figure Raster 5:**

.. figure:: /static/user_manual/working_with_raster/rasterSingleBandPseudocolor.png
   :align: center

   Raster Renderer - Singleband pseudocolor |nix|

.. _label_colormaptab:

.. index:: Colormap

.. index:: Color_interpolation, Discrete

Three types of color interpolation are available:

#. Discrete
#. Linear
#. Exact


In the left block, the button |mActionSignPlus| :sup:`Add values manually` adds a value to the
individual color table. The button |mActionSignMinus| :sup:`Remove selected row`
deletes a value from the individual color table, and the
|mActionArrowDown| :sup:`Sort colormap items` button sorts the color table according
to the pixel values in the value column. Double clicking on the value column lets
you insert a specific value. Double clicking on the color column opens the dialog
:guilabel:`Change color`, where you can select a color to apply on that value. Further,
you can also add labels for each color, but this value won't be displayed when you use the identify
feature tool.
You can also click on the button |mActionDraw| :sup:`Load color map from band`,
which tries to load the table from the band (if it has any). And you can use the
buttons |mActionFileOpen| :sup:`Load color map from file` or |mActionFileSaveAs|
:sup:`Export color map to file` to load an existing color table or to save the
defined color table for other sessions.


In the right block, :guilabel:`Generate new color map` allows you to create newly
categorized color maps. For the :guilabel:`Classification mode` |selectstring| 'Equal interval',
you only need to select the :guilabel:`number of classes`
|selectnumber| and press the button :guilabel:`Classify`. You can invert the colors
of the color map by clicking the |checkbox| :guilabel:`Invert`
checkbox. In the case of the :guilabel:`Mode` |selectstring| 'Continous', |qg| creates
classes automatically depending on the :guilabel:`Min` and :guilabel:`Max`.
Defining :guilabel:`Min/Max` values can be done with the help of the :guilabel:`Load min/max values` section.
A lot of images have a few very low and high data. These outliers can be eliminated
using the |radiobuttonon| :guilabel:`Cumulative count cut` setting. The standard data range is set
from 2% to 98% of the data values and can be adapted manually. With this
setting, the gray character of the image can disappear.
With the scaling option |radiobuttonoff| :guilabel:`Min/max`, |qg| creates a color table with all of
the data included in the original image (e.g., |qg| creates a color table
with 256 values, given the fact that you have 8 bit bands).
You can also calculate your color table using the |radiobuttonoff| :guilabel:`Mean +/- standard deviation x` |selectnumber|.
Then, only the values within the standard deviation or within multiple standard deviations
are considered for the color table.


Color rendering
...............

For every :guilabel:`Band rendering`, a :guilabel:`Color rendering` is possible.

You can also achieve special rendering effects for your raster file(s) using one
of the blending modes (see :ref:`vector_properties_dialog`).

Further settings can be made in modifiying the :guilabel:`Brightness`, the
:guilabel:`Saturation` and the :guilabel:`Contrast`. You can also use a :guilabel:`Grayscale`
option, where you can choose between 'By lightness', 'By luminosity' and 'By average'.
For one hue in the color table, you can modify the 'Strength'.

Resampling
..........

The :guilabel:`Resampling` option makes its appearance when you zoom in and out of an
image. Resampling modes can optimize the appearance of the map. They calculate a new gray value
matrix through a geometric transformation.

.. _figure_raster_6:

.. only:: html

   **Figure Raster 6:**

.. figure:: /static/user_manual/working_with_raster/rasterRenderAndRessampling.png
   :align: center

   Raster Rendering - Resampling |nix|


When applying the 'Nearest neighbour' method, the map can have a pixelated structure
when zooming in. This appearance can be improved by using the 'Bilinear' or 'Cubic' method, which cause sharp features
to be blurred. The effect is a smoother image. This method can be applied, for instance, to digital
topographic raster maps.

.. index:: Transparency

Transparency Menu
-----------------

|qg| has the ability to display each raster layer at a different transparency level.
Use the transparency slider |slider| to indicate to what extent the underlying layers
(if any) should be visible though the current raster layer. This is very useful
if you like to overlay more than one raster layer (e.g., a shaded relief map
overlayed by a classified raster map). This will make the look of the map more
three dimensional.

Additionally, you can enter a raster value that should be treated as *NODATA* in
the :guilabel:`Additional no data value` menu.

An even more flexible way to customize the transparency can be done in the
:guilabel:`Custom transparency options` section. The transparency of every pixel
can be set here.

As an example, we want to set the water of our example raster file :file:`landcover.tif`
to a transparency of 20%. The following steps are neccessary:

#. Load the raster file :file:`landcover.tif`.
#. Open the :guilabel:`Properties` dialog by double-clicking on the raster
   name in the legend, or by right-clicking and choosing :menuselection:`Properties`
   from the pop-up menu.
#. Select the :guilabel:`Transparency` menu.
#. From the :guilabel:`Transparency band` menu, choose 'None'.
#. Click the |mActionSignPlus| :sup:`Add values manually`
   button. A new row will appear in the pixel list.
#. Enter the raster value in the 'From' and 'To' column (we use 0 here), and adjust the transparency to 20%.
#. Press the **[Apply]** button and have a look at the map.

You can repeat steps 5 and 6 to adjust more values with custom transparency.

As you can see, it is quite easy to set custom transparency, but it can be
quite a lot of work. Therefore, you can use the button |mActionFileSave|
:sup:`Export to file` to save your transparency list to a file. The button
|mActionFileOpen| :sup:`Import from file` loads your transparency settings and
applies them to the current raster layer.


.. index:: Pyramids

Pyramids Menu
-------------

Large resolution raster layers can slow navigation in |qg|. By creating lower
resolution copies of the data (pyramids), performance can be considerably
improved, as |qg| selects the most suitable resolution to use depending on the
level of zoom.

You must have write access in the directory where the original data is stored
to build pyramids.

Several resampling methods can be used to calculate the pyramids:

* Nearest Neighbour
* Average
* Gauss
* Cubic
* Mode
* None

If you choose 'Internal (if possible)' from the :guilabel:`Overview format` menu,
|qg| tries to build pyramids internally. You can also choose 'External' and
'External (Erdas Imagine)'.

.. _figure_raster_7:

.. only:: html

   **Figure Raster 7:**

.. figure:: /static/user_manual/working_with_raster/rasterPyramids.png
   :align: center

   The Pyramids Menu |nix|

Please note that building pyramids may alter the original data file, and once
created they cannot be removed. If you wish to preserve a 'non-pyramided'
version of your raster, make a backup copy prior to building pyramids.

.. _label_histogram:

Histogram Menu
---------------

.. index:: Histogram

The :guilabel:`Histogram` menu allows you to view the distribution of the bands
or colors in your raster. The histogram is generated automatically when you open the
:guilabel:`Histogram` menu. All existing bands will be displayed together. You can
save the histogram as an image with the |mActionFileSave| button.
With the :guilabel:`Visibility` option in the |mAction| :guilabel:`Prefs/Actions` menu,
you can display histograms of the individual bands. You will need to select the option
|radiobuttonoff| :guilabel:`Show selected band`.
The :guilabel:`Min/max options` allow you to 'Always show min/max markers', to 'Zoom
to min/max' and to 'Update style to min/max'.
With the :guilabel:`Actions` option, you can 'Reset' and 'Recompute histogram' after
you have chosen the :guilabel:`Min/max options`.

.. _figure_raster_8:

.. only:: html

   **Figure Raster 8:**

.. figure:: /static/user_manual/working_with_raster/rasterHistogram.png
   :align: center

   Raster Histogram |nix|

.. index:: Metadata

Metadata Menu
-------------

The :guilabel:`Metadata` menu displays a wealth of information about the raster layer,
including statistics about each band in the current raster layer. From this menu, entries may be
made for the :guilabel:`Description`, :guilabel:`Attribution`, :guilabel:`MetadataUrl` and
:guilabel:`Properties`. In :guilabel:`Properties`, statistics are gathered on a 'need to know'
basis, so it may well be that a given layer's statistics have not yet been collected.

.. _figure_raster_9:

.. only:: html

   **Figure Raster 9:**

.. figure:: /static/user_manual/working_with_raster/rasterMetadata.png
   :align: center

   Raster Metadata |nix|
