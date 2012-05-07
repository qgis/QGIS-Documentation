.. %  !TeX  root  =  user_guide.tex                                             

.. index:: `label_raster`

--------------------------------------------
Working with Raster Data
--------------------------------------------

.. index:: `raster layers`

.. % when the revision of a section has been finalized,
.. % comment out the following line:
.. %\updatedisclaimer

This Section describes how to visualize and set raster layer properties.
|qg| uses the GDAL library to read and write raster data formats
GRASS raster support is supplied by a native QGIS data provider 
plugin. [1]_ , including Arc/Info Binary Grid 
.. index:: `Arc/Info Binary Grid`
, Arc/Info ASCII Grid 
.. index:: `Arc/Info ASCII Grid`
, GeoTIFF 
.. index:: `GeoTIFF`
, Erdas Imagine 
.. index:: `Erdas Img.` 
and many more. 

At the date of this document, more than 100 raster formats are supported 
by the GDAL library FIXME\cite{GDALweb}. A complete list is available at 
http://www.gdal.org/formats_list.html.

**Note** Not all of the listed formats may work in QGIS for various 
reasons. For example, some require external commercial libraries or 
the GDAL installation of your OS was not built to support the format you want
to use. Only those formats that have been well tested will appear in the list
of file types when loading a raster into QGIS. Other untested formats can 
be loaded by selecting *.*.

Working with GRASS raster data is described in Section :ref:`sec:grass`.

.. index:: `label_whatsraster`

What is raster data?
=============================================

.. index:: `raster layers!definition`

Raster data in GIS are matrices of discrete cells that represent features on,
above or below the earth's surface. Each cell in the raster grid is the same
size, and cells are usually rectangular (in QGIS they will always be
rectangular). Typical raster datasets include remote sensing data such as
aerial photography or satellite imagery and modelled data such as an elevation
matrix.

Unlike vector data, raster data typically do not have an associated database
record for each cell. They are geocoded by its pixel resolution and the x/y
coordinate of a corner pixel of the raster layer. This allows QGIS to position
the data correctly in the map canvas.

QGIS makes use of georeference information inside the raster layer (e.g. GeoTiff)
or in an appropriate world file to properly display the data.

.. index:: `raster layers!georeferenced`

.. index:: `label_loadraster`

Loading raster data in QGIS
===================================================

Raster layers are loaded either by clicking on the |mActionAddRasterLayer| 
:guilabel:`Load Raster` icon or by selecting the :guilabel:`View` --> 
|mActionAddRasterLayer| :guilabel:`Add Raster Layer` menu option. More than one 
layer can be loaded at the same time by holding down the :kbd:`Control` or 
:kbd:`Shift` key and clicking on multiple items in the dialog 
:guilabel:`Open a GDAL Supported Raster Data Source`. 
.. index:: `raster layers!loading`

Once a raster layer is loaded in the map legend you can click on the layer name with the
right mouse button to select and activate layer specific features or to open
a dialog to set raster properties for the layer.

Right mouse button menu for raster layers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. [label=--]

* :guilabel:`Zoom to layer extent`
* :guilabel:`Zoom to best scale (100\%)`
* :guilabel:`Show in overview`
* :guilabel:`Remove`
* :guilabel:`Set layer CRS`
* :guilabel:`Set project CRS from layer`
* :guilabel:`Properties`
* :guilabel:`Rename`
* :guilabel:`Add Group`
* :guilabel:`Expand all`
* :guilabel:`Collapse all`


.. index:: `label_rasterprop`

Raster Properties Dialog
================================================

To view and set the properties for a raster layer, double click
on the layer name in the map legend or right click on the layer name and choose
:guilabel:`Properties` from the context menu: 
.. index:: `raster layers!context menu`
Figure :ref:`fig:raster_properties` shows the :guilabel:`Raster Layer Properties` dialog.
There are several tabs on the dialog:

.. [label=--]

* |tab| :guilabel:`Style`
* |tab| :guilabel:`Transparency`
* |tab| :guilabel:`Colormap`
* |tab| :guilabel:`General`
* |tab| :guilabel:`Metadata`
* |tab| :guilabel:`Pyramids`
* |tab| :guilabel:`Histogram`


.. \begin{figure}[h]
..   \centering
..    \includegraphics[clip=true, width=14cm]{rasterPropertiesDialog}
..    \caption{Raster Layers Properties Dialog \nixcaption}\label{fig:raster_properties}
.. \end{figure}

.. index:: `label_symbology`	

Style Tab
********************************

QGIS can render raster layers in two different way: 
.. index:: `raster layers!supported channels`

.. [label=--]
* Single band - one band of the image will be rendered as gray or in 
  pseudocolor or a freak out.
* Three band color - three bands from the image will be rendered, each
  band representing the red, green or blue component that will be used to create
  a color image.


Within both render types you can invert the color output using the
|checkbox| :guilabel:`Invert color map` checkbox.

Single Band Rendering
~~~~~~~~~~~~~~~~~~~~~

This selection offers you two possibilites to choose. At first you can
select which band you like to use for rendering (if the dataset has more than
one band).

The second option offers a selection of available colortables for rendering.

The following settings are available through the dropdownbox
|selectstring| :guilabel:`color map` :guilabel:`Grayscale`, where grayscale is 
the default setting.
Also available are

.. [label=--]
* :guilabel:`Pseudocolor`
* :guilabel:`Freak Out`
* :guilabel:`Colormap`


When selecting the entry |selectstring| :guilabel:`Colormap`, the tab
|tab| :guilabel:`Colormap` becomes available. See more on that at chapter
:ref:`label_colormaptab`.

QGIS can restrict the data displayed to only show cells whose values are
within a given number of standard deviations of the mean for the
layer. 
.. index:: `raster layers!standard deviation` 
This is useful when you have one or two cells with abnormally high values in 
a raster grid that are having a negative impact on the rendering of the raster. 
This option is only available for pseudocolor and freak out images.

Three band color
~~~~~~~~~~~~~~~~

This selection offers you a wide range of options to modify the appearance
of your rasterlayer. For example you could switch color-bands from the
standard RGB-order to something else.

Also scaling of colors are available.

.. tip::  
   **Viewing a Single Band of a Multiband Raster**
   If you want to view a single band (for example Red) of a multiband
   image, you might think you would set the Green and Blue bands to 
   ``Not Set''. But this is not the correct way. To display the Red band,
   set the image type to grayscale, then select Red as the band to use for Gray.

.. index:: `rastertab:transparency`

Transparency Tab
***********************************************

QGIS has the ability to display each raster layer at varying transparency
levels. .. index:: `raster layers!transparency` Use the transparency slider to 
indicate  to what extent the underlying layers (if any) should be visible 
though the current raster layer.  This is very useful, if you like to overlay 
more than one rasterlayer, e.g. a shaded relief-map overlayed by a classified 
rastermap. This will make the look of the map more three dimensional.

Additionally you can enter a rastervalue, which should be treated as
*NODATA*. This can be done manually or with the 
|mActionContextHelp| :guilabel:`Add values from display` icon.

An even more flexible way to customize the transparency can be done in the
:guilabel:`Custom transparency options` section.
The transparency of every pixel can be set in this tab.

As an example we want to set the water of our example rasterfile
:file:`landcover.tif` to a transparency of 20 %. The following steps
are neccessary:


#. Load the rasterfile :file:`landcover`.
#. Open the :guilabel:`Properties` dialog by double-clicking on the raster 
   filename in the legend or by right-clicking and choosing :guilabel:`Properties` 
   from the popup menu.
#. Select the |tab| :guilabel:`Transparency` tab
#. Click the |mActionNewAttribute| :guilabel:`Add values manually`
   button. A new row will appear in the pixel-list.
#. Enter the raster-value (we use 0 here) and adjust the transparency to 20 %.
#. Press the :guilabel:`Apply` button and have a look at the map.


You can repeat the steps :ref:`enum:add` and :ref:`enum:transp` to adjust
more values with custom transparency.

As you can see this is quite easy to set custom transparency, but it can be
quite a lot of work. Therefore you can use the button |mActionFileSave|
:guilabel:`Export to file` to save your transparency-list to a file. The button
|mActionFolder| :guilabel:`Import from file` loads your transparency-settings 
and applies them to the current rasterlayer.

.. index:: `label_colormaptab`

Colormap
**********************************

The |tab| :guilabel:`Colormap` tab is only available, when you have selected a
single-band-rendering within the |tab| :guilabel:`Style` tab 
(see chapt. :ref:`label_sombology`).

Three ways of color interpolation are available:

.. [label=--]

* :guilabel:`Discrete`
* :guilabel:`Linear`
* :guilabel:`Exact`


The button :guilabel:`Add Entry` adds a color to the individual color-table. 
:guilabel:`Delete Entry` deletes a color from the individual color-table and the 
:guilabel:`Sort` sorts the color table according to the pixel values in the 
value column. Double-Clicking on the value-column lets you insert a 
specific value. Double clicking on the color-column opens the dialog 
:guilabel:`Select color` where you can select a color to apply on that value. 
Further you can also add labels for each color but this value won't be displayed 
when you use the identify feature tool.   

Alternatively you can click on the button |mActionNewAttribute|
:guilabel:`Load colormap from Band`, which tries to load the table from the band 
(if it has any).

The block :guilabel:`Generate new color map` allows you to create newly
categorized colormaps. You only need to select the |selectnumber| 
:guilabel:`number of classes 15` and press the button :guilabel:`Classify`. Currently
only one |selectstring| :guilabel:`Classification mode Equal Interval` is
supported 
.. index:: `raster layer!classify`.

..index:: `label_generaltab` 

General Tab
***********************************

The |tab| :guilabel:`General` tab displays basic information about the selected raster,
including the layer source and  display name in the legend (which can be
modified). This tab also shows a thumbnail of the layer, its legend symbol,
and the palette.

.. index:: `raster layers!properties`

Additionally scale-dependent visability can be set in this tab. You need to
check the checkbox and set an appropriate scale where your data will be
displayed in the map canvas.

Also the coordinate reference system (CRS) is printed here as a PROJ.4-string.
This can be modified by hitting the :guilabel:`Specify` button.

.. index:: `label_metatab`

Metadata Tab
*********************************

The |tab| :guilabel:`Metadata` tab displays a wealth of information about the raster layer,
including statistics about each band in the current raster layer. Statistics
are gathered on a 'need to know' basis, so it may well be that a given layers
statistics have not yet been collected.

.. index:: `raster layers!metadata`

This tab is mainly for information. You cannot change any values printed
inside this tab. To update the statistics you need to change to tab
|tab| :guilabel:`Histogram` and press the button :guilabel:`Refresh` on the bottom right,
(see ch. :ref:`label_histogram`.

.. index:: `raster_pyramids`

Pyramids Tab
***********************************

Large resolution raster layers can slow navigation in QGIS. By creating lower
resolution copies of the data (pyramids), performance can be considerably
improved as QGIS selects the most suitable resolution to use depending on the
level of zoom.
.. index:: `raster layers!pyramids`
.. index:: `raster layers!resolution pyramids`

You must have write access in the directory where the original data is stored
to build pyramids. 

Several resampling methods can be used to calculate the pyramids:

.. [label=--]
* :guilabel:`Average`
* :guilabel:`Nearest Neighbour`


When checking the checkbox |checkbox| 
:guilabel:`Build pyramids internally if possible` 
QGIS tries to build pyramids internally.

Please note that building pyramids may alter the original data file and once
created they cannot be removed. If you wish to preserve a 'non-pyramided'
version of your raster, make a backup copy prior to building pyramids.

.. index:: `label_histogram`

Histogram Tab
************************************

The |tab| :guilabel:`Histogram` tab allows you to view the distribution
.. index:: `raster layers!histogram` of the bands or colors in your raster. It is 
generated automaticaly when you open |tab| :guilabel:`Histogram` tab. You can 
choose which bands to display by selecting them in the list box at the bottom 
left of the tab. 

.. %% FIXME not supported at the moment
.. %Two different chart types are allowed:

.. [label=--]
.. %*  Bar chart
.. %*  Line graph

.. %You can define the number of chart columns to use and decide whether you want
.. %to \checkbox{Allow approximation} or display \checkbox{out of range} values
.. %Once you view the histogram, you'll notice that the band statistics have been
.. %populated on the |tab| :guilabel:`metadata} tab... index:: `raster layers!metadata)`


.. tip::
   **Gathering Raster Statistics**

   To gather statistics for a layer, select pseudocolor rendering and
   click the :guilabel:`Apply` button. Gathering statistics for a layer can be time
   consuming. Please be patient while QGIS examines your data!

   .. index:: `raster layers!statistics`

.. index:: `sec:raster_calc`

Raster Calculator
========================================

.. index:: `Raster!raster calculator`
.. index:: `Raster calculator`

The :guilabel:`Raster Calculator` in the :guilabel:`Layer` menu allows to 
perform calculations on basis of existing raster pixel values. The results 
are written to a new raster layer with a GDAL supported format. 

.. \begin{figure}[ht]
..  \centering
..    \includegraphics[clip=true, width=11.5cm]{raster_calculator}
..    \caption{Raster Calculator \nixcaption}\label{fig:raster_calculator}
.. \end{figure}

The **Fields list** contains all loaded raster layers that can be used. 
To add a raster to the raster calculator expression field, double
click its name in the Fields list. You can then use the operators to construct 
calculation expressions or you can just type it into the box.

In the **Result layer** section you have to define an output layer. You can 
then define the extent of the calculation area based on an input raster layer or 
based on X,Y coordinates and on Columns and Rows to set the resolution of the 
output layer. If the input layer has a different resolution, the values will be 
resampled with nearest neighbor algorithm.  

The **Operators section** contains all usable operators. To add an operator
to the raster calculator expression box, click the appropriate button. Mathematical
calculations ( + , - , * , ... ) and trigonometric functions ( sin, cos, tan, ... ) 
are available. Stay tuned for more operators to come!

With the |checkbox| :guilabel:`Result to project` checkbox the result layer will 
automatically added to the legend area and can be visualized. 

.. index:: `sec:raster_analysis`

Raster Analysis
==========================================

.. index:: `Raster!raster analysis`
.. index:: `Raster analysis`

Apart from the raster calculator, additional raster analysis in |qg| 1.7 is provided 
by the GDALTools core plugin. Please refer to section :ref:`label_plugingdaltools` 
for more information.

.. [1] GRASS raster suppor t is supplied by a native QGIS data provider plugin. 
