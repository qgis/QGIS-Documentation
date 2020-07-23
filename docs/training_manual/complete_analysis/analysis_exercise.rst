|LS| Supplementary Exercise
===============================================================================

In this lesson, you will be guided through a complete GIS analysis in QGIS.

.. note:: Lesson developed by Linfiniti and S Motala (Cape Peninsula University
   of Technology)

Problem Statement
-------------------------------------------------------------------------------

You are tasked with finding areas in and around the Cape Peninsula that are a
suitable habitat for a rare fynbos plant species. The extent of your area of
investigation in the Cape Peninsula is: south of Melkbosstrand, west of Strand.
Botanists have provided you with the following preferences exhibited by the
species in question:

* It grows on east facing slopes.
* It grows on slopes with a gradient between 15% and 60%.
* It grows in areas that have a total annual rainfall of > 1200 mm.
* It will only be found at least 250 m away from any human settlement.
* The area of vegetation in which it occurs should be at least 6000m2 in area.

As a volunteer for Cape Nature, you have agreed to search for the plant on the
closest suitable piece of land to your house. Use your GIS skills to determine
where you should go to look.

Solution Outline
-------------------------------------------------------------------------------

The data for this exercise can be found in the
:file:`exercise_data/more_analysis` folder.
You are going to find the candidate area that is closest to a house of your choice.
The solution will involve:

#. analysing the DEM to find the east facing slopes and the slopes with the
   correct gradients;
#. analysing the rainfall raster to find the areas with the correct amount of
   rainfall;
#. analysing the Zoning vector layer to find areas that are away from human
   settlement and are of the correct size.

Setting up the Map
-------------------------------------------------------------------------------

#. Click on the "EPSG" button in the extreme lower right corner of the
   screen. Under the :guilabel:`CRS` tab of the screen that appears, use 
   the "Filter" tool to search for :guilabel:`WGS 84 / UTM zone 33S`. Select 
   the entry :guilabel:`WGS 84 / UTM zone 33S` (with the EPSG code ``32733``). 
#. Click :guilabel:`OK`. The map is now in the ``UTM33S`` coordinate
   reference system.
#. Save the map by clicking on the :guilabel:`Save Project` toolbar button,
   or use the :menuselection:`File --> Save As...` menu item.
#. Save the map in a new directory called :file:`Rasterprac` that you should create
   somewhere on your computer. You will save whatever layers you create in this
   directory as well. Save the map as :file:`your_name_fynbos`

   .. it could be worth indicating a real location for this output folder as
    it's later reused in exercises.

Loading Data into the Map
-------------------------------------------------------------------------------

In order to process the data, you will need to load the necessary layers
(street names, zones, rainfall, DEM) into the map canvas.

For vectors...
...............................................................................

#. Click on the |dataSourceManager| :sup:`Open Data Source Manager` button and
   enable the |addOgrLayer| :guilabel:`Vector` tab in the dialog that appears,
   or use the :menuselection:`Layer --> Add Layer -->` |addOgrLayer|
   :menuselection:`Add Vector Layer...` menu item.
#. Ensure that the :guilabel:`File` radio button is selected.
#. Click on the :guilabel:`...` button to browse for :guilabel:`Vector dataset(s)`.
#. In the dialog that appears, open the :file:`exercise_data/more_analysis/streets`
   directory.
#. Select the file :file:`Street_Names_UTM33S.shp`.
#. Click :guilabel:`Open`.

   The dialog closes and shows the original dialog, with the file path specified
   in the text field next to the :guilabel:`Vector dataset(s)` button. This allows
   you to ensure that the correct file is selected. It is also possible to enter
   the file path in this field manually, should you wish to do so.

#. Click :guilabel:`Add`. The vector layer will load in your map. Its color is
   automatically assigned. It will be changed later.
#. Rename the layer to :guilabel:`Streets`.

   #. Right-click on it in the :guilabel:`Layers` panel (by default, the pane along
      the left-hand side of the screen).
   #. Click :guilabel:`Rename` in the dialog that appears and rename it, pressing
      the :kbd:`Enter` key when done.
#. Repeat the vector adding process, but this time select the
   :file:`Generalised_Zoning_Dissolve_UTM33S.shp` file in the :file:`Zoning`
   directory.
#. Rename it to ``Zoning``.

For rasters...
...............................................................................

#. Click on the |dataSourceManager| :sup:`Open Data Source Manager` button and
   enable the |addRasterLayer| :guilabel:`Raster` tab in the dialog that appears,
   or use the :menuselection:`Layer --> Add Layer -->` |addRasterLayer|
   :menuselection:`Add Raster Layer...` menu item.
#. Ensure that the :guilabel:`File` radio button is selected.
#. Navigate to the appropriate file, select it, and click :guilabel:`Open`.
#. Do this for each of the two raster files. The files you want are
   :file:`DEM/reproject/DEM.tif` and
   :file:`Rainfall/reprojected/rainfall.tif`.
#. Rename the rainfall raster to ``Rainfall`` (with an initial capital).
#. Save the map.

Changing the layer order
-------------------------------------------------------------------------------

#. In the :guilabel:`Layers` panel, click and drag layers up and down to change
   the order they appear in on the map so that you can see all of the layers.

Now that all the data is loaded and properly visible, the analysis can begin.
It is best if the clipping operation is done first. This is so that no
processing power is wasted on computing values in areas that aren't going to be
used anyway.

Clip the Rasters
-------------------------------------------------------------------------------

#. Load the vector layer :file:`Western_Cape_UTM33S/Western_Cape_UTM33S.shp` into
   your map.
#. Rename it to :guilabel:`Districts`.
#. Ensure that the only layers that are visible are the :guilabel:`DEM`,
   :guilabel:`Rainfall` and :guilabel:`Districts` layers.
#. :guilabel:`Districts` must be on top so that they are visible.
#. Open the clipping dialog by selecting the menu item :menuselection:`Raster
   --> Extraction --> Clip Raster by Mask Layer`.
#. In the :guilabel:`Input file` dropdown list, select the
   :guilabel:`DEM` layer.
#. In the :guilabel:`Mask layer` dropdown list, select the
   :guilabel:`Districts` layer.
#. Scroll down and specify an output location in the :guilabel:`Clipped (mask)` text field by
   clicking the :guilabel:`...` button.
#. Navigate to your :file:`Rasterprac` directory.
#. Enter :file:`DEM_clipped` as your file name.
#. Save the file. 
#. Make sure the :guilabel:`Open output file after running algorithm` box is checked
#. Click :guilabel:`Run`.
#. After the clipping operation is completed, DO NOT CLOSE the
   :guilabel:`Clip by Mask Layer` dialog box. (Doing so would cause you to lose the clipping
   area that you have already defined.)
#. Select the :guilabel:`Rainfall` raster in the :guilabel:`Input file`
   dropdown list and save your output as :file:`Rainfall_clipped`.
#. Do not change any other options. Leave everything the same and click
   :guilabel:`Run`.
#. After the second clipping operation has completed, you may close the
   :guilabel:`Clip by Mask Layer` dialog.
#. Save the map.

In order to properly see what's going on, the symbology for the layers needs to
be changed.

Changing the symbology of vector layers
-------------------------------------------------------------------------------

#. In the :guilabel:`Layers` panel, right-click on the :guilabel:`Streets` layer.
#. Select :guilabel:`Properties` from the menu that appears.
#. Switch to the :guilabel:`Symbology` tab in the dialog that appears.
#. Click on the button labelled :guilabel:`Change`, with a square showing the
   current color of the :guilabel:`Streets` layer.
#. Select a new color in the dialog that appears.
#. Click :guilabel:`OK`.
#. Click :guilabel:`OK` again in the :guilabel:`Layer Properties` dialog. This
   will change the color of the :guilabel:`Streets` layer.
#. Follow a similar process for the :guilabel:`Zoning` layer and choose an
   appropriate color for it.

.. _changing_raster_symbology:

Changing the symbology of raster layers
-------------------------------------------------------------------------------

Raster layer symbology is somewhat different.

#. Open the :guilabel:`Properties` dialog for the :guilabel:`Rainfall_clipped` raster.
#. Switch to the :guilabel:`Symbology` tab. You'll notice that this dialog is
   very different from the version used for vector layers.
#. Open the dropdown "Min/Max Value Settings".
#. Ensure that the button :guilabel:`Mean +/- standard deviation` is selected.
#. Make sure that the value in the associated box is ``2.00``.
#. For :guilabel:`Contrast enhancement`, make sure it says :guilabel:`Stretch to MinMax`.
#. For :guilabel:`Color gradient`, change it to :guilabel:`White to Black`.
#. Click :guilabel:`OK`. The :guilabel:`Rainfall_clipped` raster, if visible, should change
   colors, allowing you to see different brightness values for each pixel.
#. Repeat this process for the DEM, but set the standard deviations used for
   stretching to ``4.00``.

Clean up the map
-------------------------------------------------------------------------------

#. Remove the original :guilabel:`Rainfall` and :guilabel:`DEM` layers from the
   :guilabel:`Layers` panel:
#. Right-click on these layers and select :guilabel:`Remove`.

   .. note:: This will not remove the data from your storage device, it will
    merely take it out of your map.
#. Save the map.
#. You can now hide the vector layers by unchecking the box next to them in the
   :guilabel:`Layers` panel. This will make the map render faster and will save
   you some time.

In order to create the hillshade, you will need to use an algorithm that was
written for this purpose.


Create the hillshade
-------------------------------------------------------------------------------

#. In the :guilabel:`Layers` panel, ensure that the :guilabel:`DEM_clipped` is the active
   layer (i.e., it is highlighted by having been clicked on).
#. Click on the :menuselection:`Raster --> Analysis --> Hillshade` menu
   item to open the :guilabel:`Hillshade` dialog.
#. Scroll down to :guilabel:`Hillshade` and save the output in your :file:`Rasterprac`
   directory as :file:`hillshade`. 
#. Check the :guilabel:`Open output file after running algorithm` box.
#. Click :guilabel:`Run`.
#. Wait for it to finish processing.

The new :guilabel:`hillshade` layer has appeared in your :guilabel:`Layers
list`.

#. Right-click on the :guilabel:`hillshade` layer in your :guilabel:`Layers
   list` and bring up the :guilabel:`Properties` dialog.
#. Click on the :guilabel:`Transparency` tab and set the transparency slider to
   ``80%``.
#. Click :guilabel:`Run` on the dialog.
#. Note the effect when the transparent hillshade is superimposed over the
   clipped DEM.  You may have to change the order of your layers, or click off the
   :guilabel:`rainfall_clipped` layer in order to see the effect.

Slope
-------------------------------------------------------------------------------

#. Click on the menu item :menuselection:`Raster --> Analysis --> Slope`.
#. Select the the clipped DEM as the input layer.
#. Click the :guilabel:`Slope expressed as percent instead of degrees` box. Slope 
   can be expressed as a percent on in degrees.  Our criteria suggest that the plant 
   grows on slopes with a gradient between 15% and 60%. So we need to make sure to our 
   slope data is expressed as a percent.
#. Specify an appropriate file name and location for your output.
#. Make sure the :guilabel:`Open output file after running algorithm` box is checked.
#. Click :guilabel:`Run`.

Aspect
-------------------------------------------------------------------------------

Use the same approach as for calculating the slope, but use the
:guilabel:`Aspect` algorithm.

Remember to save the map periodically.

Reclassifying rasters
-------------------------------------------------------------------------------

#. Click the menu item :menuselection:`Raster --> Raster calculator`.
#. For the Output layer, click on the :guilabel:`...` button, specify your :file:`Rasterprac`
   directory as the location for the output layer, and save it as :file:`slope15_60`

In the :guilabel:`Raster bands` list on the left, you will see all the raster
layers in your :guilabel:`Layers` panel. If your Slope layer is called
:guilabel:`slope`, it will be listed as :guilabel:`slope@1`. Indicating band 1 of the slope raster.

The slope needs to be between ``15`` and ``60`` percent. Everything less
than ``15`` or greater than ``60`` must therefore be excluded.

#. Using the list items and buttons in the interface, build the following
   expression:

   ::

    ((slope@1 < 15) OR (slope@1 > 60)) = 0

#. Click :guilabel:`Run`.

Now find the correct aspect (east-facing: between ``45`` and ``135``
degrees) using the same approach.

#. Build the following expression:

   ::

    ((aspect@1 < 45) OR (aspect@1 > 135)) = 0

#. Find the correct rainfall (greater than ``1200mm``) the same way. Build
   the following expression:

   ::

    (rainfall@1 < 1200) = 0

Now, we can combine all three criteria into one raster.  
    
Combining rasters
-------------------------------------------------------------------------------

#. Click the :menuselection:`Raster --> Raster calculator` menu item.
#. Build the following expression (with the appropriate names for your layers,
   depending on what you called them):

   ::

    [Rural raster] * [Reclassified aspect] * [Reclassified slope] *
    [Reclassified rainfall]

#. Set the output location to the :file:`Rasterprac` directory.
#. Name the output raster :file:`cross_product.tif`.
#. Ensure that the :guilabel:`Open output file after running algorithm` box is
   checked.
#. Click :guilabel:`Run`.
#. Change the symbology of the new raster in the same way as you set the style
   for the other reclassified rasters.  The new raster now properly displays the
   areas where all the criteria are satisfied.

To get the final result, you need to select the areas that are greater than
``6000m^2``. However, computing these areas accurately is only possible for
a vector layer, so you will need to vectorize the raster.

Vectorizing the raster
-------------------------------------------------------------------------------

#. Click on the menu item :menuselection:`Raster --> Conversion --> Polygonize`.
#. Select the :file:`cross_product.tif` raster.
#. Set the output location to :file:`Rasterprac`.
#. Name the file :file:`candidate_areas.shp`.
#. Ensure that :guilabel:`Open output file after running algorithm` is checked.
#. Click :guilabel:`Run`.
#. Close the dialog when processing is complete.

All areas of the raster have been vectorized, so you need to select only the
areas that have a value of ``1``.

#. Open the :guilabel:`Query` dialog for the new vector.
#. Build this query:

   ::

    "DN" = 1

#. Click :guilabel:`OK`.
#. Create a new vector file from the results by saving the
   :guilabel:`candidate_areas` vector after the query is complete (and only the
   areas with a value of ``1`` are visible). Use the :guilabel:`Save as...`
   function in the layer's right-click menu for this.
#. Save the file in the :file:`Rasterprac` directory.
#. Name the file :guilabel:`candidate_areas_only.shp`.
#. Save your map.


The only criterion that remains is that the area must be ``250m`` away from
urban areas. We will satisfy this requirement by ensuring that the areas we
compute are ``250m`` or more from the edge of a rural area. Hence, we need
to find all rural areas first.

Finding rural areas
-------------------------------------------------------------------------------

#. Hide all layers in the :guilabel:`Layers` panel.
#. Unhide the :guilabel:`Zoning` vector layer.
#. Right-click on it and bring up the :guilabel:`Query` dialog.
#. Build the following query:

   ::

    "Gen_Zoning" = 'Rural'

   See the earlier instructions for building the :guilabel:`Streets` query if
   you get stuck.
#. When you're done, close the :guilabel:`Query` dialog.

You should see a collection of polygons from the :guilabel:`Zoning` layer. You
will need to save these to a new layer file.

#. On the right-click menu for :guilabel:`Zoning`, select :guilabel:`Save
   as...`.
#. Save your layer under the :guilabel:`Zoning` directory.
#. Name the output file :file:`rural.shp`.
#. Click :guilabel:`OK`.
#. Add the layer to your map.
#. Click the menu item :menuselection:`Vector --> Geoprocessing Tools -->
   Dissolve`.
#. Select the :guilabel:`rural` layer as your input vector layer, while leaving
   the :guilabel:`Use only selected features` box unchecked.
#. Leave empty the :guilabel:`Dissolve field(s)` option to combine all selected
   features in a single one.
#. Save your layer under the :guilabel:`Zoning` directory.
#. Check the :guilabel:`Open output file after running algorithm` box.
#. Click :guilabel:`Run`.
#. Close the :guilabel:`Dissolve` dialog.
#. Remove the :guilabel:`rural` and :guilabel:`Zoning` layers.
#. Save the map.

Now you need to exclude the areas that are within ``250m`` from the edge of
the rural areas. Do this by creating a negative buffer, as explained below.

Creating a negative buffer
-------------------------------------------------------------------------------

#. Click the menu item :menuselection:`Vector --> Geoprocessing Tools -->
   Buffer(s)`.
#. In the dialog that appears, select the :guilabel:`rural_dissolve` layer as
   your input vector layer (:guilabel:`Use only selected features` should not be
   checked).
#. Select the :guilabel:`Buffer distance` button and enter the value ``-250``
   into the associated field; the negative value means that the buffer must be
   an internal buffer.
#. Check the :guilabel:`Dissolve buffer results` box.
#. Set the output file to the same directory as the other rural vector files.
#. Name the output file :file:`rural_buffer.shp`.
#. Click :guilabel:`Save`.
#. Click :guilabel:`OK` and wait for the processing to complete.
#. Select :guilabel:`Yes` on the dialog that appears.
#. Close the :guilabel:`Buffer` dialog.
#. Remove the :guilabel:`rural_dissolve` layer.
#. Save the map.

In order to incorporate the rural zones into the same analysis with the three
existing rasters, it will need to be rasterized as well. But in order for the
rasters to be compatible for analysis, they will need to be the same size.
Therefore, before you can rasterize, you'll need to clip the vector to the same
area as the three rasters. A vector can only be clipped by another vector, so
you will first need to create a bounding box polygon the same size as the
rasters.

Creating a bounding box vector
-------------------------------------------------------------------------------

#. Click on the menu item :menuselection:`Layer --> New --> New Shapefile Layer...`.
#. Under the :guilabel:`Type` heading, select the :guilabel:`Polygon` button.
#. Click :guilabel:`Specify CRS` and set the coordinate reference system
   :guilabel:`WGS 84 / UTM zone 33S : EPSG:32733`.
#. Click OK.
#. Click :guilabel:`OK` on the :guilabel:`New Vector Layer` dialog as well.
#. Save the vector in the :guilabel:`Zoning` directory.
#. Name the output file :file:`bbox.shp`.
#. Hide all layers except the new :guilabel:`bbox` layer and one of the
   reclassified rasters.
#. Ensure that the :guilabel:`bbox` layer is highlighted in the
   :guilabel:`Layers` panel.
#. Navigate to the :menuselection:`View > Toolbars` menu item and ensure that
   :guilabel:`Digitizing` is selected. You should then see a toolbar icon with a
   pencil or koki on it. This is the :guilabel:`Toggle editing` button.
#. Click the :guilabel:`Toggle editing` button to enter *edit mode*. This allows
   you to edit a vector layer.
#. Click the :guilabel:`Add feature` button, which should be nearby the
   :guilabel:`Toggle editing` button. It may be hidden behind a double arrow
   button; if so, click the double arrows to show the :guilabel:`Digitizing`
   toolbar's hidden buttons.
#. With the :guilabel:`Add feature` tool activated, left-click on the corners of
   the raster. You may need to zoom in with the mouse wheel to ensure that it is
   accurate. To pan across the map in this mode, click and drag in the map with
   the middle mouse button or mouse wheel.
#. For the fourth and final point, right-click to finalize the shape.
#. Enter any arbitrary number for the shape ID.
#. Click :guilabel:`OK`.
#. Click the :guilabel:`Save edits` button.
#. Click the :guilabel:`Toggle editing` button to stop your editing session.
#. Save the map.

Now that you have a bounding box, you can use it to clip the rural buffer
layer.

Clipping a vector layer
-------------------------------------------------------------------------------

#. Ensure that only the :guilabel:`bbox` and :guilabel:`rural_buffer` layers are
   visible, with the latter on top.
#. Click the menu item :menuselection:`Vector > Geoprocessing Tools > Clip`.
#. In the dialog that appears, set the input vector layer to
   :guilabel:`rural_buffer` and the clip layer to :guilabel:`bbox`, with both
   :guilabel:`Use only selected features` boxes unchecked.
#. Put the output file under the :guilabel:`Zoning` directory.
#. Name the output file :guilabel:`rural_clipped`.
#. Click :guilabel:`OK`.
#. When prompted to add the layer to the TOC, click :guilabel:`Yes`.
#. Close the dialog.
#. Compare the three vectors and see the results for yourself.
#. Remove the :guilabel:`bbox` and :guilabel:`rural_buffer` layers, then save
   your map.

Now it's ready to be rasterized.

Rasterizing a vector layer
-------------------------------------------------------------------------------

You'll need to specify a pixel size for a new raster that you create, so first
you'll need to know the size of one of your existing rasters.

#. Open the :guilabel:`Properties` dialog of any of the three existing rasters.
#. Switch to the :guilabel:`Metadata` tab.
#. Make a note of the :guilabel:`X` and :guilabel:`Y` values under the heading
   :guilabel:`Dimensions` in the Metadata table.
#. Close the :guilabel:`Properties` dialog.
#. Click on the :menuselection:`Raster --> Conversion --> Rasterize` menu item.
   You may receive a warning about a dataset being unsupported. Click it away
   and ignore it.
#. Select :guilabel:`rural_clipped` as your input layer.
#. Set an output file location inside the :guilabel:`Zoning` directory.
#. Name the output file :file:`rural_raster.tif`.
#. Check the :guilabel:`New size` box and enter the :guilabel:`X` and
   :guilabel:`Y` values you made a note of earlier.
#. Check the :guilabel:`Load into canvas` box.
#. Click the pencil icon next to the text field which shows the command that
   will be run. At the end of the existing text, add a space and then the text
   ``-burn 1``. This tells the Rasterize function to "burn" the existing
   vector into the new raster and give the areas covered by the vector the new
   value of ``1`` (as opposed to the rest of the image, which will
   automatically be ``0``).
#. Click :guilabel:`OK`.
#. The new raster should show up in your map once it has been computed.
#. The new raster will look like a grey rectangle – you may change the display
   style as you did for the reclassified rasters.
#. Save your map.

Now that you have all four criteria each in a separate raster, you need to
combine them to see which areas satisfy all the criteria. To do so, the rasters
will be multiplied with each other. When this happens, all overlapping pixels
with a value of ``1`` will retain the value of ``1``, but if a pixel has
the value of ``0`` in any of the four rasters, then it will be ``0`` in
the result. In this way, the result will contain only the overlapping areas.


Calculating the area for each polygon
-------------------------------------------------------------------------------

#. Open the new vector layer's right-click menu.
#. Select :guilabel:`Open attribute table`.
#. Click the :guilabel:`Toggle editing mode` button along the bottom of the
   table, or press :kbd:`Ctrl+E`.
#. Click the :guilabel:`Open field calculator` button along the bottom of the
   table, or press :kbd:`Ctrl+I`.
#. Under the :guilabel:`New field` heading in the dialog that appears, enter the
   field name ``area``. The output field type should be an integer, and the
   field width should be ``10``.
#. In :guilabel:`Field calculator expression`, type:

   ::

    $area

   This means that the field calculator will calculate the area of each polygon
   in the vector layer and will then populate a new integer column (called
   :guilabel:`area`) with the computed value.

#. Click :guilabel:`OK`.
#. Do the same thing for another new field called :guilabel:`id`. In
   :guilabel:`Field calculator expression`, type:

   ::

    $id

   This ensures that each polygon has a unique ID for identification purposes.
#. Click :guilabel:`Toggle editing mode` again, and save your edits if prompted
   to do so.

Selecting areas of a given size
-------------------------------------------------------------------------------

Now that the areas are known:

#. Build a query (as usual) to select only the polygons larger than
   ``6000m^2``.  The query is:

   ::

    "area" > 6000

#. Save the selection as a new vector layer called :file:`solution.shp`.

You now have your solution areas, from which you will pick the one nearest to
your house.

Digitize your house
-------------------------------------------------------------------------------

#. Create a new vector layer as before, but this time, select the
   :guilabel:`Type` value as being a :guilabel:`Point`.
#. Ensure that it is in the correct CRS!
#. Name the new layer :file:`house.shp`.
#. Finish creating the new layer.
#. Enter edit mode (while the new layer is selected).
#. Click the point where your house or other current place of residence is,
   using the streets as a guide. You might have to open other layers to help you
   find your house. If you don't live anywhere nearby, just click somewhere
   among the streets where a house could conceivably be.
#. Enter any arbitrary number for the shape ID.
#. Click :guilabel:`OK`.
#. Save your edits and exit edit mode.
#. Save the map.

You will need to find the centroids ("centers of mass") for the solution area
polygons in order to decide which is closest to your house.

Calculate polygon centroids
-------------------------------------------------------------------------------

#. Click on the :menuselection:`Vector --> Geometry Tools --> Centroids`
   menu item.
#. Specify the input layer as :guilabel:`solution.shp`.
#. Provide the output location as :file:`Rasterprac`.
#. Call the destination file :file:`solution_centroids.shp`.
#. Check |checkbox| :guilabel:`Open output file after running algorithm` to add
   the result to the TOC (:guilabel:`Layers` panel).
#. Click :guilabel:`Run` and close the dialog.
#. Drag the new layer to the top of the layer order so that you can see it.

Calculate which centroid is closest to your house
-------------------------------------------------------------------------------

#. Click on the menu item :menuselection:`Vector --> Analysis Tools --> Distance
   matrix`.
#. The input layer should be your house, and the target layer
   :guilabel:`solution_centroids`. Both of these should use the :guilabel:`id`
   field as their unique ID field.
#. The output matrix type should be :guilabel:`linear`.
#. Set an appropriate output location and name.
#. Click :guilabel:`OK`.
#. Open the file in a text editor (or import it into a spreadsheet). Note which
   target ID is associated with the shortest :guilabel:`Distance`. There may be
   more than one at the same distance.
#. Build a query in QGIS to select only the solution areas closest to your house
   (selecting it using the :guilabel:`id` field).

This is the final answer to the research question.

For your submission, include the semi-transparent hillshade layer over an
appealing raster of your choice (such as the :guilabel:`DEM` or the
:guilabel:`slope` raster, for example). Also include the polygon of the closest
solution area(s), as well as your house. Follow all the best practices for
cartography in creating your output map.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |LS| replace:: Lesson:
.. |addOgrLayer| image:: /static/common/mActionAddOgrLayer.png
   :width: 1.5em
.. |addRasterLayer| image:: /static/common/mActionAddRasterLayer.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
