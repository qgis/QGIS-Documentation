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

In order to solve this problem, you will have to use the available data
(available in :kbd:`exercise_data/more_analysis`) to find the candidate area
that is closest to your house.  If you don't live in Cape Town (where this
problem is based) you can choose any house in the Cape Town region. The
solution will involve:

* analysing the DEM to find the east facing slopes and the slopes with the
  correct gradients;
* analysing the rainfall raster to find the areas with the correct amount of
  rainfall;
* analysing the Zoning vector layer to find areas that are away from human
  settlement and are of the correct size.

Setting up the Map
-------------------------------------------------------------------------------

* Click on the "CRS status" button in the extreme lower right corner of the
  screen. Under the :guilabel:`CRS` tab of the screen that appears, you will
  see the box :guilabel:`Coordinate reference systems of the world.`
* In this box, navigate to :menuselection:`Projected Coordinate Systems -->
  Universal Transverse Mercator (UTM)`.
* Select the entry :guilabel:`WGS 84 / UTM zone 33S` (with the EPSG code
  :kbd:`32733`).
* Click :guilabel:`OK`. The map is now in the :kbd:`UTM33S` coordinate
  reference system.
* Save the map by clicking on the :guilabel:`Save Project As` toolbar button,
  or use the :menuselection:`File --> Save Project As...` menu item.
* Save the map in a directory called :kbd:`Rasterprac` that you should create
  somewhere on your computer. You will save whatever layers you create in this
  directory as well.

Loading Data into the Map
-------------------------------------------------------------------------------

In order to process the data, you will need to load the necessary layers
(street names, zones, rainfall, DEM) into the map canvas.

For vectors ...
...............................................................................

* Click on the :guilabel:`Add Vector Layer` button, or use the
  :menuselection:`Layer --> Add Vector Layer...` menu item.
* In the dialog that appears, ensure that the :guilabel:`File` radio button is
  selected.
* Click on the :guilabel:`Browse` button.
* In the dialog that appears, open the
  :guilabel:`exercise_data/more_analysis/streets` directory.
* Select the file :guilabel:`Street_Names_UTM33S.shp`.
* Click :guilabel:`Open`.

The dialog closes and shows the original dialog, with the file path specified
in the text field next to the :guilabel:`Browse` button. This allows you to
ensure that the correct file is selected. It is also possible to enter the file
path in this field manually, should you wish to do so.

* Click :guilabel:`Open`. The vector layer will load in your map. Its color is
  automatically assigned. It will be changed later.
* Rename the layer to :kbd:`Streets`.
* Right-click on it in the :guilabel:`Layers list` (by default, the pane along
  the left-hand side of the screen).
* Click :guilabel:`Rename` in the dialog that appears and rename it, pressing
  the :guilabel:`Enter` key when done.
* Repeat the vector adding process, but this time select the
  :guilabel:`Generalised_Zoning_Dissolve_UTM33S.shp` file in the
  :guilabel:`Zoning` directory.
* Rename it to :kbd:`Zoning`.

For rasters ...
...............................................................................

* Click on the :guilabel:`Add Raster Layer` button, or use the
  :menuselection:`Layer --> Add Raster Layer...` menu item.
* Navigate to the appropriate file, select it, and click :guilabel:`Open`.
* Do this for each of the two raster files. The files you want are
  :guilabel:`DEM/reproject/DEM` and
  :guilabel:`Rainfall/reprojected/rainfall.tif`.
* Rename the rainfall raster to :kbd:`Rainfall` (with an initial capital).
  Initially when you load them, the images will be gray rectangles. Don't
  worry, this will be changed later.
* Save the map.

In order to properly see what's going on, the symbology for the layers needs to
be changed.

Changing the symbology of vector layers
-------------------------------------------------------------------------------

* In the :guilabel:`Layers list`, right-click on the :guilabel:`Streets` layer.
* Select :guilabel:`Properties` from the menu that appears.
* Switch to the :guilabel:`Style` tab in the dialog that appears.
* Click on the button labelled :guilabel:`Change`, with a square showing the
  current color of the :guilabel:`Streets` layer.
* Select a new color in the dialog that appears.
* Click :guilabel:`OK`.
* Click :guilabel:`OK` again in the :guilabel:`Layer Properties` dialog. This
  will change the color of the :guilabel:`Streets` layer.
* Follow a similar process for the :guilabel:`Zoning` layer and choose an
  appropriate color for it.

Changing the symbology of raster layers
-------------------------------------------------------------------------------

Raster layer symbology is somewhat different.

* Open the :guilabel:`Properties` dialog for the :guilabel:`Rainfall` raster.
* Switch to the :guilabel:`Style` tab. You'll notice that this style dialog is
  very different from the version used for vector layers.
* Ensure that the button :guilabel:`Use standard deviation` is selected.
* Change the value in the associated box to :kbd:`2.00` (it should be set to
  :kbd:`0.00` by default).
* Under the heading :guilabel:`Contrast enhancement`, change the value of the
  :guilabel:`Current` dropdown list to :guilabel:`Stretch to MinMax`.
* Click :guilabel:`OK`. The "Rainfall" raster, if visible, should change
  colors, allowing you to see different brightness values for each pixel.
* Repeat this process for the DEM, but set the standard deviations used for
  stretching to :kbd:`4.00`.

Changing the layer order
-------------------------------------------------------------------------------

* In the :guilabel:`Layers list`, click and drag layers up and down to change
  the order they appear in on the map.
* Newer versions of QGIS may have a :guilabel:`Control rendering order`
  checkbox beneath the :guilabel:`Layers list`. Ensure that it is checked.

Now that all the data is loaded and properly visible, the analysis can begin.
It is best if the clipping operation is done first. This is so that no
processing power is wasted on computing values in areas that aren't going to be
used anyway.

Find the Correct Districts
-------------------------------------------------------------------------------

* Load the vector layer :kbd:`admin_boundaries/Western_Cape_UTM33S.shp` into
  your map.
* Rename it to :kbd:`Districts`.
* Right-click on the :guilabel:`Districts` layer in the :guilabel:`Layers list`.
* In the menu that appears,  select the :guilabel:`Query...` menu item. The
  :guilabel:`Query Builder` dialog appears.

You will now build a query to select only the following list of districts:

* :kbd:`Bellville`,
* :kbd:`Cape`,
* :kbd:`Goodwood`,
* :kbd:`Kuils River`,
* :kbd:`Mitchells Plain`,
* :kbd:`Simons Town`, and
* :kbd:`Wynberg`.

* In the :guilabel:`Fields` list, double-click on the :guilabel:`NAME_2`
  field. It appears in the :guilabel:`SQL where clause` text field below.
* Click the :guilabel:`=` button; an :kbd:`=` sign is added to the SQL query.
* Click the :guilabel:`All` button below the (currently empty)
  :guilabel:`Values` list. After a short delay, this will populate the
  :guilabel:`Values` list with the values of the selected field
  (:guilabel:`NAME_2`).
* Double-click the value :guilabel:`Bellville` in the :guilabel:`Values`
  list. As before, this will be added to the SQL query.

In order to select more than one district, you'll need to use the :kbd:`OR`
boolean operator.

* Click the :guilabel:`OR` button and it will be added to the SQL query.
* Using a process similar to the above, add the following to the existing SQL
  query:

  ::
  
    "NAME_2" = 'Cape'

* Add another :kbd:`OR` operator, then work your way through the list of
  districts above in a similar fashion.
* The final query should be

  ::
  
    "NAME_2" = 'Bellville' OR "NAME_2" = 'Cape' OR "NAME_2" = 'Goodwood' OR
    "NAME_2" = 'Kuils River' OR "NAME_2" = 'Mitchells Plain' OR "NAME_2" =
    'Simons Town' OR "NAME_2" = 'Wynberg'

* Click :guilabel:`OK`. The districts shown in your map are now limited to
  those in the list above.

Clip the Rasters
-------------------------------------------------------------------------------

Now that you have an area of interest, you can clip the rasters to this area.

* Ensure that the only layers that are visible are the :guilabel:`DEM`,
  :guilabel:`Rainfall` and :guilabel:`Districts` layers.
* :guilabel:`Districts` must be on top so that they are visible.
* Open the clipping dialog by selecting the menu item :menuselection:`Raster
  --> Extraction --> Clipper`.
* In the :guilabel:`Input file (raster)` dropdown list, select the
  :guilabel:`DEM` layer.
* Specify an output location in the :guilabel:`Output file` text field by
  clicking the :guilabel:`Select...` button.
* Navigate to your :kbd:`Rasterprac` directory.
* Enter a file name.
* Save the file. Leave the :guilabel:`No data value` checkbox unchecked.
* Use the :guilabel:`Extent` clipping mode by ensuring the correct radio button
  is selected.
* Click and drag an area in the canvas, so that the area which includes the
  districts is selected.
* Check the :guilabel:`Load into canvas when finished` box.
* Click :guilabel:`OK`.
* After the clipping operation is completed, DO NOT CLOSE the
  :guilabel:`Clipper` dialog. (Doing so would cause you to lose the clipping
  area that you have already defined.)
* Select the :guilabel:`Rainfall` raster in the :guilabel:`Input file (raster)`
  dropdown list and choose a different output file name.
* Do not change any other options. Do not alter the existing clipping area
  which you drew previously. Leave everything the same and click
  :guilabel:`OK`.
* After the second clipping operation has completed, you may close the
  :guilabel:`Clipper` dialog.
* Save the map.

Clean up the map
-------------------------------------------------------------------------------

* Remove the original :guilabel:`Rainfall` and :guilabel:`DEM` layers from the
  :guilabel:`Layers list`: 

* Right-click on these layers and select :guilabel:`Remove`.

  * This will not remove the data from your storage device, it will merely take
    it out of your map.

* Deactivate the labels on the :guilabel:`Streets` layer:

  * Click the :guilabel:`Labeling` button.
  * Uncheck the :guilabel:`Label this layer with` box.
  * Click :guilabel:`OK`.

* Show all the :guilabel:`Streets` again:

  * Right-click on the layer in the :guilabel:`Layers list`.
  * Select :guilabel:`Query`.

* In the :guilabel:`Query` dialog that appears, click the :guilabel:`Clear`
  button, then click :guilabel:`OK`.
* Wait while the data is loaded. All the streets will now be visible.
* Change the raster symbology as before (see *Changing the symbology of raster
  layers*).
* Save the map.
* You can now hide the vector layers by unchecking the box next to them in the
  :guilabel:`Layers list`. This will make the map render faster and will save
  you some time.

In order to create the hillshade, you will need to use a plugin that was
written for this purpose.

Activating the :guilabel:`Raster Terrain Analysis` plugin
-------------------------------------------------------------------------------

This plugin is included by default in QGIS 1.8. However, it may not be
immediately visible. To check if it is accessible on your system:

* Click on the menu item :guilabel:`Plugins --> Manage Plugins...`.
* Ensure that the box next to :guilabel:`Raster Terrain Analysis plugin` is
  selected.
* Click :guilabel:`OK`.

You will now have access to this plugin via the :menuselection:`Raster -->
Terrain analysis` menu item.

Remember that plugins may sometimes depend on certain Python modules being
installed on your system.  Should a plugin refuse to work while complaining of
missing dependencies, please ask your tutor or lecturer for assistance.

Create the hillshade
-------------------------------------------------------------------------------

* In the :guilabel:`Layers list`, ensure that the :guilabel:`DEM` is the active
  layer (i.e., it is highlighted by having been clicked on).
* Click on the :menuselection:`Raster --> Terrain analysis --> Hillshade` menu
  item to open the :guilabel:`Hillshade` dialog.
* Specify an appropriate location for the output layer and call it
  :guilabel:`hillshade`.
* Check the :guilabel:`Add result to project` box.
* Click :guilabel:`OK`.
* Wait for it to finish processing.

The new :guilabel:`hillshade` layer has appeared in your :guilabel:`Layers
list`.

* Right-click on the :guilabel:`hillshade` layer in your :guilabel:`Layers
  list` and bring up the :guilabel:`Properties` dialog.
* Click on the :guilabel:`Transparency` tab and set the transparency slider to
  :kbd:`80%`.
* Click :guilabel:`OK` on the dialog.
* Note the effect when the transparent hillshade is superimposed over the
  clipped DEM.

Slope
-------------------------------------------------------------------------------

* Click on the menu item :menuselection:`Raster --> Terrain analysis`.
* Select the :guilabel:`Slope` analysis type, with the clipped DEM as the input
  layer.
* Specify an appropriate file name and location for output purposes.
* Check the :guilabel:`Add result to project` box.
* Click :guilabel:`OK`.

The slope image has been calculated and added to the map. However, as usual it
is just a gray rectangle. To properly see what's going on, change the symbology
as follows.

* Open the layer :guilabel:`Properties` dialog (as usual, via the right-click
  menu of the layer).
* Click on the :guilabel:`Style` tab.
* Where it says :guilabel:`Grayscale` (in the :guilabel:`Color map` dropdown
  menu), change it to :guilabel:`Pseudocolor`.
* Ensure that the :guilabel:`Use standard deviation` radio button is selected. 

Aspect
-------------------------------------------------------------------------------

* Use the same approach as for calculating the slope, but select
  :guilabel:`Aspect` in the initial dialog box.

Remember to save the map periodically.

Reclassifying rasters
-------------------------------------------------------------------------------

* Click the menu item :menuselection:`Raster --> Raster calculator`.
* Specify your :kbd:`Rasterprac` directory as the location for the output
  layer.
* Ensure that the :guilabel:`Add result to project` box is selected.
  
In the :guilabel:`Raster bands` list on the left, you will see all the raster
layers in your :guilabel:`Layers list`. If your Slope layer is called
:guilabel:`slope`, it will be listed as :guilabel:`slope@1`.

The slope needs to be between :kbd:`15` and :kbd:`60` degrees. Everything less
than :kbd:`15` or greater than :kbd:`60` must therefore be excluded.

* Using the list items and buttons in the interface, build the following
  expression:

  ::
  
    ((slope@1 < 15) OR (slope@1 > 60)) = 0

* Set the :guilabel:`Output layer` field to an appropriate location and file
  name.
* Click :guilabel:`OK`.

Now find the correct aspect (east-facing: between :kbd:`45` and :kbd:`135`
degrees) using the same approach.

* Build the following expression:
  
  ::
  
    ((aspect@1 < 45) OR (aspect@1 > 135)) = 0

* Find the correct rainfall (greater than :kbd:`1200mm`) the same way. Build
  the following expression:

  ::
  
    (rainfall@1 < 1200) = 0

Having reclassified all the rasters, you will now see them displayed as gray
rectangles in your map (assuming that they have been added to the map
correctly). To properly display raster data with only two classes (:kbd:`1` and
:kbd:`0`, meaning true or false), you will need to change their symbology.

Setting the style for the reclassified layers
-------------------------------------------------------------------------------

* Open the :guilabel:`Style` tab in the layer's :guilabel:`Properties` dialog
  as usual.
* Under the heading :guilabel:`Load min / max values from band`, select the
  :guilabel:`Actual (slower)` radio button.
* Click the :guilabel:`Load` button.

The :guilabel:`Custom min / max values` fields should now populate with
:kbd:`0` and :kbd:`1`, respectively. (If they do not, then there was a mistake
with your reclassification of the data, and you will need to go over that part
again.)

* Under the heading :guilabel:`Contrast enhancement`, set the
  :guilabel:`Current` dropdown list to :guilabel:`Stretch To MinMax`.
* Click :guilabel:`OK`.
* Do this for all three reclassified rasters, and remember to save your work!

The only criterion that remains is that the area must be :kbd:`250m` away from
urban areas. We will satisfy this requirement by ensuring that the areas we
compute are :kbd:`250m` or more from the edge of a rural area. Hence, we need
to find all rural areas first.

Finding rural areas
-------------------------------------------------------------------------------

* Hide all layers in the :guilabel:`Layers list`.
* Unhide the :guilabel:`Zoning` vector layer.
* Right-click on it and bring up the :guilabel:`Query` dialog.
* Build the following query:

  ::
  
    "Gen_Zoning" = 'Rural'

  See the earlier instructions for building the :guilabel:`Streets` query if
  you get stuck.
* When you're done, close the :guilabel:`Query` dialog.

You should see a collection of polygons from the :guilabel:`Zoning` layer. You
will need to save these to a new layer file.

* On the right-click menu for :guilabel:`Zoning`, select :guilabel:`Save
  as...`.
* Save your layer under the :guilabel:`Zoning` directory.
* Name the output file :kbd:`rural.shp`.
* Click :guilabel:`OK`.
* Add the layer to your map.
* Click the menu item :menuselection:`Vector --> Geoprocessing Tools -->
  Dissolve`.
* Select the :guilabel:`rural` layer as your input vector layer, while leaving
  the :guilabel:`Use only selected features` box unchecked.
* Under :guilabel:`Dissolve field`, select :guilabel:`--- Dissolve all ---`.
* Save your layer under the :guilabel:`Zoning` directory.
* Click :guilabel:`OK`. A dialog will appear asking whether you want to add the
  new layer to the TOC ("Table of Contents", referring to the :guilabel:`Layers
  list`).
* Click :guilabel:`Yes`.
* Close the :guilabel:`Dissolve` dialog.
* Remove the :guilabel:`rural` and :guilabel:`Zoning` layers.
* Save the map.

Now you need to exclude the areas that are within :kbd:`250m` from the edge of
the rural areas. Do this by creating a negative buffer, as explained below.

Creating a negative buffer
-------------------------------------------------------------------------------

* Click the menu item :menuselection:`Vector --> Geoprocessing Tools -->
  Buffer(s)`.
* In the dialog that appears, select the :guilabel:`rural_dissolve` layer as
  your input vector layer (:guilabel:`Use only selected features` should not be
  checked).
* Select the :guilabel:`Buffer distance` button and enter the value :kbd:`-250`
  into the associated field; the negative value means that the buffer must be
  an internal buffer.
* Check the :guilabel:`Dissolve buffer results` box.
* Set the output file to the same directory as the other rural vector files.
* Name the output file :kbd:`rural_buffer.shp`.
* Click :guilabel:`Save`.
* Click :guilabel:`OK` and wait for the processing to complete.
* Select :guilabel:`Yes` on the dialog that appears.
* Close the :guilabel:`Buffer` dialog.
* Remove the :guilabel:`rural_dissolve` layer.
* Save the map.

In order to incorporate the rural zones into the same analysis with the three
existing rasters, it will need to be rasterized as well. But in order for the
rasters to be compatible for analysis, they will need to be the same size.
Therefore, before you can rasterize, you'll need to clip the vector to the same
area as the three rasters. A vector can only be clipped by another vector, so
you will first need to create a bounding box polygon the same size as the
rasters.

Creating a bounding box vector
-------------------------------------------------------------------------------

* Click on the menu item :guilabel:`Layer --> New --> New Shapefile Layer...`.
* Under the :guilabel:`Type` heading, select the :guilabel:`Polygon` button.
* Click :guilabel:`Specify CRS` and set the coordinate reference system
  :kbd:`WGS 84 / UTM zone 33S : EPSG:32733`.
* Click OK.
* Click :guilabel:`OK` on the :guilabel:`New Vector Layer` dialog as well.
* Save the vector in the :guilabel:`Zoning` directory.
* Name the output file :kbd:`bbox.shp`.
* Hide all layers except the new :guilabel:`bbox` layer and one of the
  reclassified rasters.
* Ensure that the :guilabel:`bbox` layer is highlighted in the
  :guilabel:`Layers list`.
* Navigate to the :menuselection:`View > Toolbars` menu item and ensure that
  :guilabel:`Digitizing` is selected. You should then see a toolbar icon with a
  pencil or koki on it. This is the :guilabel:`Toggle editing` button.
* Click the :guilabel:`Toggle editing` button to enter *edit mode*. This allows
  you to edit a vector layer.
* Click the :guilabel:`Add feature` button, which should be nearby the
  :guilabel:`Toggle editing` button. It may be hidden behind a double arrow
  button; if so, click the double arrows to show the :guilabel:`Digitizing`
  toolbar's hidden buttons.
* With the :guilabel:`Add feature` tool activated, left-click on the corners of
  the raster. You may need to zoom in with the mouse wheel to ensure that it is
  accurate. To pan across the map in this mode, click and drag in the map with
  the middle mouse button or mouse wheel.
* For the fourth and final point, right-click to finalize the shape.
* Enter any arbitrary number for the shape ID.
* Click :guilabel:`OK`.
* Click the :guilabel:`Save edits` button.
* Click the :guilabel:`Toggle editing` button to stop your editing session.
* Save the map.

Now that you have a bounding box, you can use it to clip the rural buffer
layer.

Clipping a vector layer
-------------------------------------------------------------------------------

* Ensure that only the :guilabel:`bbox` and :guilabel:`rural_buffer` layers are
  visible, with the latter on top.
* Click the menu item :menuselection:`Vector > Geoprocessing Tools > Clip`.
* In the dialog that appears, set the input vector layer to
  :guilabel:`rural_buffer` and the clip layer to :guilabel:`bbox`, with both
  :guilabel:`Use only selected features` boxes unchecked.
* Put the output file under the :guilabel:`Zoning` directory.
* Name the output file :kbd:`rural_clipped`.
* Click :guilabel:`OK`.
* When prompted to add the layer to the TOC, click :guilabel:`Yes`.
* Close the dialog.
* Compare the three vectors and see the results for yourself.
* Remove the :guilabel:`bbox` and :guilabel:`rural_buffer` layers, then save
  your map.

Now it's ready to be rasterized.

Rasterizing a vector layer
-------------------------------------------------------------------------------

You'll need to specify a pixel size for a new raster that you create, so first
you'll need to know the size of one of your existing rasters.

* Open the :guilabel:`Properties` dialog of any of the three existing rasters.
* Switch to the :guilabel:`Metadata` tab.
* Make a note of the :kbd:`X` and :kbd:`Y` values under the heading
  :guilabel:`Dimensions` in the Metadata table.
* Close the :guilabel:`Properties` dialog.
* Click on the :menuselection:`Raster --> Conversion --> Rasterize` menu item.
  You may receive a warning about a dataset being unsupported. Click it away
  and ignore it.
* Select :guilabel:`rural_clipped` as your input layer.
* Set an output file location inside the :guilabel:`Zoning` directory.
* Name the output file :kbd:`rural_raster.tif`.
* Check the :guilabel:`New size` box and enter the :kbd:`X` and :kbd:`Y` values
  you made a note of earlier.
* Check the :guilabel:`Load into canvas` box.
* Click the pencil icon next to the text field which shows the command that
  will be run. At the end of the existing text, add a space and then the text
  :kbd:`-burn 1`. This tells the Rasterize function to "burn" the existing
  vector into the new raster and give the areas covered by the vector the new
  value of :kbd:`1` (as opposed to the rest of the image, which will
  automatically be :kbd:`0`).
* Click :guilabel:`OK`.
* The new raster should show up in your map once it has been computed.
* The new raster will look like a grey rectangle – you may change the display
  style as you did for the reclassified rasters.  
* Save your map.

Now that you have all four criteria each in a separate raster, you need to
combine them to see which areas satisfy all the criteria. To do so, the rasters
will be multiplied with each other. When this happens, all overlapping pixels
with a value of :kbd:`1` will retain the value of :kbd:`1`, but if a pixel has
the value of :kbd:`0` in any of the four rasters, then it will be :kbd:`0` in
the result. In this way, the result will contain only the overlapping areas.

Combining rasters
-------------------------------------------------------------------------------

* Click the :menuselection:`Raster --> Raster calculator` menu item.
* Build the following expression (with the appropriate names for your layers,
  depending on what you called them):

  ::
  
    [Rural raster] * [Reclassified aspect] * [Reclassified slope] *
    [Reclassified rainfall]

* Set the output location to the :kbd:`Rasterprac` directory.
* Name the output raster :kbd:`cross_product.tif`.
* Ensure that the :guilabel:`Add result to project` box is checked.
* Click OK.
* Change the symbology of the new raster in the same way as you set the style
  for the other reclassified rasters.  The new raster now properly displays the
  areas where all the criteria are satisfied.

To get the final result, you need to select the areas that are greater than
:kbd:`6000m^2`. However, computing these areas accurately is only possible for
a vector layer, so you will need to vectorize the raster.

Vectorizing the raster
-------------------------------------------------------------------------------

* Click on the menu item :menuselection:`Raster --> Conversion --> Polygonize`.
* Select the :guilabel:`cross_product` raster.
* Set the output location to :kbd:`Rasterprac`.
* Name the file :kbd:`candidate_areas.shp`.
* Ensure that :guilabel:`Load into canvas when finished` is checked.
* Click OK.
* Close the dialog when processing is complete.

All areas of the raster have been vectorized, so you need to select only the
areas that have a value of :kbd:`1`.

* Open the :guilabel:`Query` dialog for the new vector.
* Build this query:

  ::
  
    "DN" = 1

* Click :guilabel:`OK`.
* Create a new vector file from the results by saving the
  :guilabel:`candidate_areas` vector after the query is complete (and only the
  areas with a value of :kbd:`1` are visible). Use the :guilabel:`Save as...`
  function in the layer's right-click menu for this.
* Save the file in the :kbd:`Rasterprac` directory.
* Name the file :guilabel:`candidate_areas_only.shp`.
* Save your map.

Calculating the area for each polygon
-------------------------------------------------------------------------------

* Open the new vector layer's right-click menu.
* Select :guilabel:`Open attribute table`.
* Click the :guilabel:`Toggle editing mode` button along the bottom of the
  table, or press :kbd:`Ctrl+E`.
* Click the :guilabel:`Open field calculator` button along the bottom of the
  table, or press :kbd:`Ctrl+I`.
* Under the :guilabel:`New field` heading in the dialog that appears, enter the
  field name :kbd:`area`. The output field type should be an integer, and the
  field width should be :kbd:`10`.
* In :guilabel:`Field calculator expression`, type:

  ::
  
    $area

  This means that the field calculator will calculate the area of each polygon
  in the vector layer and will then populate a new integer column (called
  :guilabel:`area`) with the computed value.

* Click :guilabel:`OK`.
* Do the same thing for another new field called :guilabel:`id`. In
  :guilabel:`Field calculator expression`, type:

  ::
  
    $id

  This ensures that each polygon has a unique ID for identification purposes.
* Click :guilabel:`Toggle editing mode` again, and save your edits if prompted
  to do so.

Selecting areas of a given size
-------------------------------------------------------------------------------

Now that the areas are known:

* Build a query (as usual) to select only the polygons larger than
  :kbd:`6000m^2`.  The query is:

  ::
  
    "area" > 6000

* Save the selection as a new vector layer called :guilabel:`solution.shp`.

You now have your solution areas, from which you will pick the one nearest to
your house.

Digitize your house
-------------------------------------------------------------------------------

* Create a new vector layer as before, but this time, select the
  :guilabel:`Type` value as being a :guilabel:`Point`.
* Ensure that it is in the correct CRS!
* Name the new layer :kbd:`house.shp`.
* Finish creating the new layer.
* Enter edit mode (while the new layer is selected).
* Click the point where your house or other current place of residence is,
  using the streets as a guide. You might have to open other layers to help you
  find your house. If you don't live anywhere nearby, just click somewhere
  among the streets where a house could conceivably be.
* Enter any arbitrary number for the shape ID.
* Click :guilabel:`OK`.
* Save your edits and exit edit mode.
* Save the map.

You will need to find the centroids ("centers of mass") for the solution area
polygons in order to decide which is closest to your house.

Calculate polygon centroids
-------------------------------------------------------------------------------

* Click on the :menuselection:`Vector --> Geometry Tools --> Polygon centroids`
  menu item.
* Specify the input layer as :guilabel:`solution.shp`.
* Provide the output location as :kbd:`Rasterprac`.
* Call the destination file :kbd:`solution_centroids.shp`.
* Click :guilabel:`OK` and add the result to the TOC (:guilabel:`Layers list`),
  then close the dialog.
* Drag the new layer to the top of the layer order so that you can see it.

Calculate which centroid is closest to your house
-------------------------------------------------------------------------------

* Click on the menu item :guilabel:`Vector --> Analysis Tools --> Distance
  matrix`.
* The input layer should be your house, and the target layer
  :guilabel:`solution_centroids`. Both of these should use the :kbd:`id` field
  as their unique ID field.
* The output matrix type should be :guilabel:`linear`.
* Set an appropriate output location and name.
* Click :guilabel:`OK`.
* Open the file in a text editor (or import it into a spreadsheet). Note which
  target ID is associated with the shortest :guilabel:`Distance`. There may be
  more than one at the same distance.
* Build a query in QGIS to select only the solution areas closest to your house
  (selecting it using the :kbd:`id` field).

This is the final answer to the research question.

For your submission, include the semi-transparent hillshade layer over an
appealing raster of your choice (such as the :guilabel:`DEM` or the
:guilabel:`slope` raster, for example). Also include the polygon of the closest
solution area(s), as well as your house. Follow all the best practices for
cartography in creating your output map.
