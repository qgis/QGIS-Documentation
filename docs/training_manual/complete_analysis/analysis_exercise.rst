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

* It grows on east-facing slopes.
* It grows on slopes with a gradient between 15% and 60%.
* It grows in areas that have a total annual rainfall of > 1000 mm.
* It will only be found at least 250 m away from any human settlement.
* The area of vegetation in which it occurs should be at least 6000 m^2 in area.

As a student at the University, you have agreed to search for the plant in four different 
suitable areas of land.  You want those four suitable areas to be the ones that are closest 
to the University of Cape Town where you live. Use your GIS skills to determine where you 
should look.

Solution Outline
-------------------------------------------------------------------------------

The data for this exercise can be found in the
:file:`exercise_data/more_analysis` folder.
You are going to find the four suitable areas that are closest to the University
of Cape Town.
The solution will involve:

#. analysing the DEM to find the east facing slopes and the slopes with the
   correct gradients;
#. analysing the rainfall raster to find the areas with the correct amount of
   rainfall;
#. analysing the Zoning vector layer to find areas that are away from human
   settlement and are of the correct size.

Setting up the Map
-------------------------------------------------------------------------------

#. Click on the |projectionEnabled| :sup:`Current CRS` button in the lower right corner of the
   screen. Under the :guilabel:`CRS` tab of the screen that appears, use 
   the "Filter" tool to search for "33S". Select 
   the entry :guilabel:`WGS 84 / UTM zone 33S` (with the EPSG code ``32733``). 
#. Click :guilabel:`OK`. The map is now in the ``UTM33S`` coordinate
   reference system.
#. Save the map by clicking on the |fileSave| :sup:``Save Project`` toolbar button,
   or use the :menuselection:`File --> Save As...` menu item.
#. Save the map in a new directory called :file:`Rasterprac` that you should create
   somewhere on your computer. You will save whatever layers you create in this
   directory as well. Save the map as ``your_name_fynbos``.

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
   automatically assigned. You will change it later.
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
   the order they appear in on the map so that you can see as many of the layers
   as possible.

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
#. In the :guilabel:`Input file` dropdown list, select the :guilabel:`DEM` layer.
#. In the :guilabel:`Mask layer` dropdown list, select the :guilabel:`Districts` layer.
#. Scroll down and specify an output location in the :guilabel:`Clipped (mask)` 
   text field by clicking the :guilabel:`...` button.
#. Navigate to your :file:`Rasterprac` directory.
#. Enter :file:`DEM_clipped` as your file name.
#. Save the file. 
#. Make sure the :guilabel:`Open output file after running algorithm` box is checked
#. Click :guilabel:`Run`.
#. After the clipping operation is completed, DO NOT CLOSE the
   :guilabel:`Clip by Mask Layer` dialog box, yet. 
#. Select the :guilabel:`Rainfall` raster in the :guilabel:`Input file`
   dropdown list and save your output as :file:`Rainfall_clipped`.
#. Do not change any other options. Leave everything the same and click
   :guilabel:`Run`.
#. After the second clipping operation has completed, you may close the
   :guilabel:`Clip Raster by Mask Layer` dialog.
#. Save the map.

In order to properly see what's going on, the symbology for the layers needs to
be changed.

Changing the symbology of vector layers
-------------------------------------------------------------------------------

#. In the :guilabel:`Layers` panel, right-click on the :guilabel:`Streets` layer.
#. Select :guilabel:`Properties` from the menu that appears.
#. Switch to the :guilabel:`Symbology` tab in the dialog that appears.
#. Click on the :guilabel:`Color` dropdown.
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

#. In the :guilabel:`Layers` panel, ensure that the :guilabel:`DEM_clipped` is the 
   active layer (i.e., it is highlighted by having been clicked on).
#. Click on the :menuselection:`Raster --> Analysis --> Hillshade` menu
   item to open the :guilabel:`Hillshade` dialog.
#. Scroll down to :guilabel:`Hillshade` and save the output in your :file:`Rasterprac`
   directory as :file:`hillshade`. 
#. Make sure that the :guilabel:`Open output file after running algorithm` box is checked.
#. Click :guilabel:`Run`.
#. Wait for it to finish processing.

The new :guilabel:`hillshade` layer has appeared in your :guilabel:`Layers` panel.

#. Right-click on the :guilabel:`hillshade` layer in your :guilabel:`Layers` panel
   and bring up the :guilabel:`Properties` dialog.
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
   can be expressed in different units (percent or degrees).  Our criteria suggest 
   that the plant of interest grows on slopes with a gradient between 15% and 60%. 
   So we need to make sure to our slope data is expressed as a percent.
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
:guilabel:`slope`, it will be listed as :guilabel:`slope@1`. Indicating band 1 
of the slope raster.

The slope needs to be between ``15`` and ``60`` percent. Everything less
than ``15`` or greater than ``60`` must therefore be excluded.

#. Using the list items and buttons in the interface, build the following
   expression:

   ::

    ((slope@1 < 15) OR (slope@1 > 60)) = 0

#. Click :guilabel:`OK`.

Now find the correct aspect (east-facing: between ``45`` and ``135``
degrees) using the same approach.

#. Build the following expression:

   ::

    ((aspect@1 < 45) OR (aspect@1 > 135)) = 0

You will know it worked when all of the east-facing slopes are white 
in the resulting raster.  (It's almost as if they are being lit by the 
morning sunlight.)

#. Find the correct rainfall (greater than ``1000mm``) the same way. Build
   the following expression:

   ::

    (rainfall_clipped@1 < 1000) = 0

Now that you have all three criteria each in separate rasters, you need to
combine them to see which areas satisfy all the criteria. To do so, the rasters
will be multiplied with each other. When this happens, all overlapping pixels
with a value of ``1`` will retain the value of ``1`` (i.e. the location meets 
the criteria), but if a pixel in any of the three rasters has the value of ``0`` 
(i.e. the location does not meet the criteria), then it will be ``0`` in
the result. In this way, the result will contain only the overlapping areas
that meet all of the appropriate criteria.
    
Combining rasters
-------------------------------------------------------------------------------

#. Click the :menuselection:`Raster --> Raster calculator` menu item.
#. Build the following expression (with the appropriate names for your layers,
   depending on what you called them):

   ::

    [aspect45_135] * [slope15_60] * [rainfall_1000]

#. Set the output location to the :file:`Rasterprac` directory.
#. Name the output raster :file:`aspect_slope_rainfall.tif`.
#. Click :guilabel:`OK`.
#. The new raster now properly displays the areas where all three criteria 
   are satisfied.
#. Save the map.

The next criterion that needs to be satisfied is that the area must be 
``250m`` away from urban areas. We will satisfy this requirement by ensuring 
that the areas we compute are ``250m`` or more from the edge of a rural area. 
Hence, we need to find all rural areas first.

Finding rural areas
-------------------------------------------------------------------------------

#. Hide all layers in the :guilabel:`Layers` panel.
#. Unhide the :guilabel:`Zoning` vector layer.
#. Right-click on it and bring up the :guilabel:`Attribute Table` dialog.
   Note the many different ways that the land is zoned here.  We want to isolate
   the rural areas.  Close the Attribute table.
#. Right-click on the :guilabel:`Zoning` vector layer again and bring up the 
   :guilabel:`Filter` dialog.
#. Build the following query:

   ::

    "Gen_Zoning" = 'Rural'

#. Click OK. The query should return 1 result.

You should see the rural polygons from the :guilabel:`Zoning` layer. You
will need to save these to a new layer file.

#. On the right-click menu for :guilabel:`Zoning`, select :guilabel:`Export --> Save
   Feature as...`.
#. Save your layer under the :guilabel:`Rasterprac` directory.
#. Name the output file :file:`rural.gpkg`.
#. Save the map.

Now you need to exclude the areas that are within ``250m`` from the edge of
the rural areas. Do this by creating a negative buffer, as explained below.

Creating a negative buffer
-------------------------------------------------------------------------------

#. Click the menu item :menuselection:`Vector --> Geoprocessing Tools -->
   Buffer`.
#. In the dialog that appears, select the :guilabel:`rural` layer as
   your input vector layer (:guilabel:`Selected features only` should not be
   checked).
#. In :guilabel:`Distance` and enter the value ``-250`` into the associated field; 
   the negative value means that the buffer must be an internal buffer.  
   Make sure that the units are meters in the dropdown menu.
#. Check the :guilabel:`Dissolve result` box.
#. In :guilabel:`Buffered`, set the output file to the :file:`Rasterprac` directory.
#. Name the output file :file:`rural_buffer.gpkg`.
#. Click :guilabel:`Save`.
#. Click :guilabel:`Run` and wait for the processing to complete.
#. Close the :guilabel:`Buffer` dialog.  Make sure that your buffer worked correctly 
   by noting how the :guilabel:`rural_buffer` layer is different than the :guilabel:`rural` 
   layer. You may need to change the drawing order in order to observe the difference.
#. Remove the :guilabel:`rural` layer.
#. Save the map.

Now, you need to combine your :guilabel:`rural_buffer` vector layer with the 
:guilabel:`aspect_slope_rainfall` raster.  To combine them, we will need to change 
the data format of one of the layers. In this case, you will vectorize the raster.

Vectorizing the raster
-------------------------------------------------------------------------------

#. Click on the menu item 
   :menuselection:`Raster --> Conversion --> Polygonize(Raster to  Vector`.
#. For the Input layer, select the :file:`aspect_slope_rainfall` raster.
#. Save the output. Under :guilabel:`Vectorized`, select :guilabel:`Save file as`. 
   Set the location to:file:`Rasterprac` and name the file
   :file:`aspect_slope_rainfall_all.gpkg`.
#. Ensure that :guilabel:`Open output file after running algorithm` is checked.
#. Click :guilabel:`Run`.
#. Close the dialog when processing is complete.

All areas of the raster have been vectorized, so you need to select only the
areas that have a value of ``1``.

#. Open the :guilabel:`Filter` dialog for the new vector.
#. Build this query:

   ::

    "DN" = 1

#. Click :guilabel:`OK`.
#. After you are sure the query is complete (and only the areas that meet all three criteria,
   i.e. with a value of ``1`` are visible), create a new vector file from the results by using
   the :guilabel:`Export --> Save file as...` function in the layer's right-click menu for this.
#. Save the file in the :file:`Rasterprac` directory.
#. Name the file :file:`aspect_slope_rainfall_1.gpkg`.
#. Remove the :guilabel:`aspect_slope_rainfall_all` layer from your map.
#. Save your map.

When we use an algorithm to vectorize a raster, sometimes the algorithm yields what is
called "Invalid geometry", i.e. there are empty polygons, or polygons with mistakes in them, that
will be difficult to analyze in the future.  So, we need to use the "Fix Geometry" tool.

Fixing geometry
-------------------------------------------------------------------------------

#. In the :guilabel:`Processing Toolbox`, search for "Fix geometries", and open the dialog box.
#. For the Input layer, select the :guilabel:`aspect_slope_rainfall_1`.
#. Under :guilabel:`Fixed geometries`, select :guilabel:`Save file as`. and save the output
   to :file:`Rasterprac` and name the file :file:`fixed_aspect_slope_rainfall.gpkg`.
#. Ensure that :guilabel:`Open output file after running algorithm` is checked.
#. Click :guilabel:`Run`.
#. Close the dialog when processing is complete.

Now that you have vectorized the raster, and fixed the resulting geometry, you can combine the 
aspect, slope, and rainfall criteria, with the distance from human settlement criteria by finding 
the intersection of the :guilabel:`fixed_aspect_slope_rainfall` layer and the 
:guilabel:`rural_buffer` layer.

Determining the Intersection of vectors
-------------------------------------------------------------------------------

#. Click the menu item :menuselection:`Vector --> Geoprocessing Tools -->
   Intersection`.
#. In the dialog that appears, for your Input layer, select the :guilabel:`rural_buffer` layer.
#. For the Overlay layer Select the :guilabel:`fixed_aspect_slope_rainfall` layer.
#. In :guilabel:`Insersection`, set the output file to the :file:`Rasterprac` directory.
#. Name the output file :file:`rural_aspect_slope_rainfall.gpkg`.
#. Click :guilabel:`Save`.
#. Click :guilabel:`Run` and wait for the processing to complete.
#. Close the :guilabel:`Intersection` dialog.  Make sure that your intersection worked correctly 
   by noting that only the overlapping areas remain. 
#. Save the map.

The last criteria on the list is that the area must be greater than ``6000m^2``. 
You will now calculate the polygon areas in order to identify the areas that are 
the appropriate size for this project. 

Calculating the area for each polygon
-------------------------------------------------------------------------------

#. Open the new vector layer's right-click menu.
#. Select :guilabel:`Open attribute table`.
#. Click the :guilabel:`Toggle editing mode` button in the top left corner of the
   table, or press :kbd:`Ctrl+E`.
#. Click the :guilabel:`Open field calculator` button in the toolbar along the top 
   of the table, or press :kbd:`Ctrl+I`.
#. In the dialog that appears, make sure that the :guilabel:`Create new field` box is checked, enter the
   Output field name ``area``. The output field type should be a Whole number (integer).
#. In :guilabel:`Expression`, type:

   ::

    $area

   This means that the field calculator will calculate the area of each polygon
   in the vector layer and will then populate a new integer column (called
   :guilabel:`area`) with the computed value.

#. Click :guilabel:`OK`.

#. Click :guilabel:`Toggle editing mode` again, and save your edits if prompted
   to do so.

Selecting areas of a given size
-------------------------------------------------------------------------------

Now that the areas are known:

#. Build a query (as usual) to select only the polygons larger than
   ``6000m^2``.  The query is:

   ::

    "area" > 6000

#. Save the in the selection in the :file:`Rasterprac` directory as a new vector 
layer called :file:`suitable_areas.gpkg`.

You now have the suitable areas that meet all of the habitat criteria for the 
rare fynbos plant, from which you will pick the four areas that are nearest to the 
University of Cape Town.

Digitize the University of Cape Town
-------------------------------------------------------------------------------

#. Click on the menu item :menuselection:`Layer --> Create --> New GeoPackage Layer...`.
#. Next to Database, click the :guilabel:`...` button, and save the new vector in the 
   :file:`Rasterprac` directory as :file:`university.gpkg`.
#. Under the :guilabel:`Geometry type` heading, select :guilabel:`Point`.
#. In the dropdown menu, choose :guilabel:`Project CRS:EPSG:32733 - WGS 84 / UTM zone 33S` 
   to set the coordinate reference system.
#. Click :guilabel:`OK`.
#. Hide all layers except the new :guilabel:`university` layer and the :guilabel:`streets` 
   layer.
   
Using your internet browser, look up the location of the University of Cape Town.  Given 
Cape Town's unique topography, the university is in a very recognizable location.  
Before you return to QGIS, take note of where the university is located, and what is nearby.
   
#. Ensure that the :guilabel:`Streets` layer clicked on, and that the :guilabel:`university`
   layer is highlighted in the :guilabel:`Layers` panel.
#. Navigate to the :menuselection:`View > Toolbars` menu item and ensure that
   :guilabel:`Digitizing` is selected. You should then see a toolbar icon with a
   pencil on it. This is the :guilabel:`Toggle editing` button.
#. Click the :guilabel:`Toggle editing` button to enter *edit mode*. This allows
   you to edit a vector layer.
#. Click the :guilabel:`Add Point feature` button, which should be nearby the
   :guilabel:`Toggle editing` button. 
#. With the :guilabel:`Add feature` tool activated, left-click on your best estimate of the
   location of the University of Cape Town
#. Allow the id to be Autogenerated.
#. Click :guilabel:`OK`.
#. Click the :guilabel:`Save edits` button.
#. Click the :guilabel:`Toggle editing` button to stop your editing session.
#. Save the map.

Now you will need to find the centroids ("centers of mass") for the suitable area
polygons in order to decide which four areas are closest to the University of Cape Town.

Calculate polygon centroids
-------------------------------------------------------------------------------

#. Click on the :menuselection:`Vector --> Geometry Tools --> Centroids`
   menu item.
#. Specify the input layer as :guilabel:`suitable_areas.gpkg`.
#. Provide the output location as :file:`Rasterprac`.
#. Call the destination file :file:`suitable_area_centroids.gpkg`.
#. Make sure that :guilabel:`Open output file after running algorithm` is checked.
#. Click :guilabel:`Run` and close the dialog.
#. Drag the new layer to the top of the layer order so that you can see it.

Calculate which centroids are closest to the University of Cape Town
-------------------------------------------------------------------------------

#. Click on the menu item :menuselection:`Vector --> Analysis Tools --> Distance
   matrix`.
#. The input layer should be the university, and the target layer
   :guilabel:`suitable_area_centroids`. Both of these should use the :guilabel:`fid`
   field as the :guilabel:`Target unique ID field.`
#. The output matrix type should be the default :guilabel:`Linear (N*k x 3) distance matrix`.
#. Set an appropriate Distance matrix output location and name.
#. Click :guilabel:`Run`.
#. Open the attribute table of the new layer. Note which target IDs are associated with the shortest
   :guilabel:`Distance`. We want to identify the four points that are closest to the University of Cape Town.
#. Build a filter in QGIS to select only the four points that are closest to the University of Cape 
   Town.

This is the final answer to the research question.

For your submission, create a fully labeled layout that includes the semi-transparent hillshade layer 
over an appealing raster of your choice (such as the :guilabel:`DEM` or the :guilabel:`slope` raster, 
for example). Also include the polygons of all of suitable areas, the streets layer, the University, and
the four points that indicate the four suitable areas that are closest to the University of Cape Town. 
Follow all the best practices for cartography in creating your output map.


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
.. |fileSave| image:: /static/common/mActionFileSave.png
   :width: 1.5em
.. |projectionEnabled| image:: /static/common/mIconProjectionEnabled.png
   :width: 1.5em
