|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

Raster Properties Dialog
========================

To view and set the properties for a raster layer, double click on the layer name
in the map legend or right click on the layer name and choose :guilabel:`Properties`
from the context menu:

This will open the :guilabel:`Raster Layer Properties` dialog, (see figure_raster_1_).

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
   :width: 30em

   Raster Layers Properties Dialog |nix|

.. _label_generaltab:

General Menu
-------------

The :guilabel:`General` menu displays basic information about the selected raster,
including the layer source and display name in the legend (which can be
modified). This tab also shows a thumbnail of the layer, its legend symbol,
and the palette.

Additionally scale-dependent visibility can be set in this tab. You need to
check the checkbox and set an appropriate scale where your data will be
displayed in the map canvas.

Also the coordinate reference system (CRS) is printed here as a PROJ.4-string.
This can be modified by hitting the **[Specify]** button.

.. index:: Symbology, Single_Band_Raster, Three_Band_Color_Raster, Multi_Band_Raster

.. _label_symbology:

Style Menu
----------

Band rendering
..............

QGIS renders raster layers -dependent on the datatype- in four different ways:

#. Multiband color - if the file comes as a multi band with several bands (e.g. a satellite image 
   with several bands)
#. Paletted - if a single band file comes with an indexed palette (e.g. a ...)
#. Singleband gray- (one band of) the image will be rendered as gray, QGIS will choose this renderer 
   if the file neither has multi bands, nor has an indexed palette nor has a continous palette 
   (e.g. a ...)
#. Singleband pseudocolor - this renderer is for files with a continuous palette, e.g. the file
   has got a color map (e.g. a ...)


**Multiband color**

three bands from the image will be rendered, each band
representing the red, green or blue component that will be used to create
a color image. You can choose several :guilabel:`Contrast enhancement` methods:
'No enhancement', 'Stretch to MinMax', 'Stretch and clip to MinMax' and 'Clip to min max'.
This selection offers you a wide range of options to modify the appearance
of your rasterlayer. Within both render types you can invert the color output using the
|checkbox| :guilabel:`Invert color map` checkbox.For example you could switch color-bands from the
standard RGB-order to something else.

Also scaling of colors are available.

.. tip:: **Viewing a Single Band of a Multiband Raster**

   If you want to view a single band (for example Red) of a multiband
   image, you might think you would set the Green and Blue bands to
   "Not Set". But this is not the correct way. To display the Red band,
   set the image type to grayscale, then select Red as the band to use for Gray.

**Paletted**


**Singleband gray **

This selection allows you to render a single band with a :guilabel:`Color gradient`
'Black to white' or 'White to black'.
At first you can select which band you like to use for rendering (if the dataset has more than
one band).
You can define a :guilabel:`Min` and a :guilabel:`Max` value

QGIS can restrict the data displayed to only show cells whose values are
within a given number of standard deviations of the mean for the layer.

This is useful when you have one or two cells with abnormally high values in
a raster grid that are having a negative impact on the rendering of the raster.
This option is only available for pseudocolor and freak out images.

**Singleband pseudocolor**

Though this is the standard for single band files including a continous palette  
you can also create individual colormaps for the single bands here.

.. _label_colormaptab:

.. index:: Colormap

.. index:: Color_interpolation, Discrete

Three ways of color interpolation are available:

#. Discrete
#. Linear
#. Exact


The button |mActionSignPlus| :sup:`Add values manually` adds a value to the
individual color table. Button |mActionSignMinus| :sup:`Remove selected row` 
deletes a value from the individual color table and the
|mActionArrowDown| :sup:`Sort colormap items` button sorts the color table according
to the pixel values in the value column. Double clicking on the value-column lets 
you insert a specific value. Double clicking on the color-column opens the dialog
:guilabel:`Change color` where you can select a color to apply on that value. Further
you can also add labels for each color but this value won't be displayed when you use the identify
feature tool.

You can also click on the button |mActionDraw| :sup:`Load color map from band`,
which tries to load the table from the band (if it has any). And you can use the
buttons |mActionFileOpen| :sup:`Load color map from file` or |mActionFileSaveAs|
:sup:`Export color map to file` to load an existing color table or to save the
defined color table for other sessions.

The block :guilabel:`Generate new color map` allows you to create newly
categorized colormaps. You only need to select the :guilabel:`number of entries`
|selectnumber| and press the button :guilabel:`Classify`. Currently
as :guilabel:`Classification mode` |selectstring| 'Continous' and 'Equal interval' 
are possible. 

--> invert color !

Color rendering
...............

.. index:: Contrast_enhancement

**Contrast enhancement**

.. note::
   When adding GRASS rasters the option *Contrast enhancement* will be
   always set to automatically to *stretch to min max* regardless if
   the QGIS general options this is set to another value.


Resampling
..........


.. index:: Transparency

Transparency Menu
-----------------

QGIS has the ability to display each raster layer at varying transparency levels.
Use the transparency slider |slider| to indicate to what extent the underlying layers
(if any) should be visible though the current raster layer. This is very useful,
if you like to overlay more than one rasterlayer, e.g. a shaded relief map
overlayed by a classified rastermap. This will make the look of the map more
three dimensional.

Additionally you can enter a rastervalue, which should be treated as *NODATA* in
the :guilabel:`Additional no data value` menu.

An even more flexible way to customize the transparency can be done in the
:guilabel:`Custom transparency options` section. The transparency of every pixel
can be set here.

As an example we want to set the water of our example raster file :file:`landcover.tif`
to a transparency of 20 %. The following steps are neccessary:

#. Load the rasterfile :file:`landcover`.
#. Open the :guilabel:`Properties` dialog by double-clicking on the raster
   name in the legend or by right-clicking and choosing :menuselection:`Properties`
   from the popup menu.
#. Select the :guilabel:`Transparency` menu
#. From the :guilabel:`Transparency band` menu choose 'None'.
#. Click the |mActionSignPlus| :sup:`Add values manually`
   button. A new row will appear in the pixel-list.
#. Enter the raster-value (we use 0 here) in the 'From' and 'To' column and adjust the transparency to 20 %.
#. Press the **[Apply]** button and have a look at the map.

You can repeat the steps 5 and 6 to adjust more values with custom transparency.

As you can see this is quite easy to set custom transparency, but it can be
quite a lot of work. Therefore you can use the button |mActionFileSave|
:sup:`Export to file` to save your transparency list to a file. The button
|mActionFileOpen| :sup:`Import from file` loads your transparency settings and
applies them to the current raster layer.


.. index:: Pyramids

Pyramids Menu
-------------

Large resolution raster layers can slow navigation in QGIS. By creating lower
resolution copies of the data (pyramids), performance can be considerably
improved as QGIS selects the most suitable resolution to use depending on the
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

If you choose 'Internal (if possible)' from the :guilabel:`Overview format` menu 
QGIS tries to build pyramids internally. You can also choose 'External' and 
'External (Erdas Imagine)'.

Please note that building pyramids may alter the original data file and once
created they cannot be removed. If you wish to preserve a 'non-pyramided'
version of your raster, make a backup copy prior to building pyramids.

.. _label_histogram:

Histogram Menu
---------------

.. index:: Histogram

The :guilabel:`Histogram` menu allows you to view the distribution of the bands
or colors in your raster. It is generated automatically when you open
:guilabel:`Histogram` menu. All existing bands will be displayed together. You can
save the histogram as an image with the |mActionFileSave| button.


.. index:: Metadata

Metadata Menu
-------------

The :guilabel:`Metadata` tab displays a wealth of information about the raster layer,
including statistics about each band in the current raster layer. Statistics
are gathered on a 'need to know' basis, so it may well be that a given layers
statistics have not yet been collected.

This menu is mainly for information. You cannot change any values printed
inside this tab. 

.. To update the statistics you need to change to tab
   :guilabel:`Histogram` and press the button **[Refresh]** on the bottom right,
   (see :ref:`label_histogram`).
