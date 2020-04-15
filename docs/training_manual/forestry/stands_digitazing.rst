|LS| Digitizing Forest Stands
===============================================================================

Unless you are going to use your georeferenced map as a simple background image,
the next natural step is to digitize elements from it. You have already done so
in the exercises about creating vector data in :doc:`../create_vector_data/create_new_vector`,
when you digitized the school fields. In this lesson, you are going to digitize
the forest stands' borders that appear in the map as green lines but instead of
doing it using an aerial image, you will use your georeferenced map.

**The goal for this lesson:** Learn a technique to help the digitizing task,
digitizing forest stands and finally adding the inventory data to them.

|basic| |FA| Extracting the Forest Stands Borders
-------------------------------------------------------------------------------

Open your :kbd:`map_digitizing.qgs` project in QGIS, that you saved from the previous lesson.

Once you have scanned and georeferenced your map you could start to digitize
directly by looking at the image as a guide. That would most likely be the way
to go if the image you are going to digitize from is, for example, an aerial
photograph.

If what you are using to digitize is a good map, as it is in our case, it is
likely that the information is clearly displayed as lines with different colors
for each type of element. Those colors can be relatively easy extracted as
individual images using an image processing software like `GIMP <https://www.gimp.org/>`_.
Such separate images can be used to assist the digitizing, as you will see below.

The first step will be to use GIMP to obtain an image that contains only the
forest stands, that is, all those greenish lines that you could see in the
original scanned map:

* Open GIMP (if you don't have it installed yet, download it from the internet
  or ask your teacher).
* Open the original map image, :menuselection:`File --> Open`, :kbd:`rautjarvi_map.tif`
  in the :kbd:`exercise_data/forestry` folder. Note that the forest stands are
  represented as green lines (with the number of the stand also in green inside
  each polygon). 

.. figure:: img/gimp_map.png
   :align: center

Now you can select the pixels in the image that are making up the forest stands'
borders (the greenish pixels):

* Open the tool :menuselection:`Select --> By color`.
* With the tool active, zoom into the image (:guilabel:`Ctrl + mouse wheel`)
  so that a forest stand line is close enough to differentiate the pixels forming
  the line. See the left image below.
* Click and drag the mouse cursor in the middle of the line so that the tool
  will collect several pixel color values.
* Release the mouse click and wait a few seconds. The pixels matching the colors
  collected by the tool will be selected through the whole image.
* Zoom out to see how the greenish pixels have been selected throughout the image.
* If you are not happy with the result, repeat the click and drag operation.
* Your pixel selection should look something like the right image below.

.. figure:: img/green_px_selected.png
   :align: center

Once you are done with the selection you need to copy this selection as a new
layer and then save it as separate image file:

* Copy (:guilabel:`Ctr+C`) the selected pixels.
* And paste the pixels directly (:guilabel:`Ctr+V`), GIMP will display the pasted
  pixels as a new temporary layer in the :guilabel:`Layers - Brushes` panel as a
  :guilabel:`Floating Selection (Pasted Layer)`.
* Right click that temporary layer and select :guilabel:`To New Layer`.
* Click the "eye" icon next to the original image layer to switch it off, so that
  only the :guilabel:`Pasted Layer` is visible:

.. figure:: img/saving_green_px.png
   :align: center
   
* Finally, select :menuselection:`File --> Export...`, set :guilabel:`Select
  File Type (By Extension)` as a :guilabel:`TIFF image`, select the
  :kbd:`digitizing` folder and name it :kbd:`rautjarvi_map_green.tif`.
  Select no compression when asked.

You could do the same process with other elements in the image, for example
extracting the black lines that represent roads or the brown ones that represent
the terrain' contour lines. But for us, the forest stands is enough.

|basic| |TY| Georeference the Green Pixels Image
-------------------------------------------------------------------------------

As you did in the previous lesson, you need to georeference this new image to
be able to use it with the rest of your data.

Note that you don't need to digitize the ground control points any more because
this image is basically the same image as the original map image, as far as the
Georeferencer tool is concerned. Here are some things you should remember:

* This image is also, of course, in :kbd:`KKJ / Finland zone 2` CRS.
* You should use the ground control points you saved, :menuselection:`File --> Load GCP points`.
* Remember to review the :guilabel:`Transformation settings`.
* Name the output raster as :kbd:`rautjarvi_green_georef.tif` in the :kbd:`digitizing` folder.

Check that the new raster is fitting nicely with the original map.


|basic| |FA| Creating Supporting Points for Digitizing
-------------------------------------------------------------------------------

Having in mind the digitizing tools in QGIS, you might already be thinking that
it would be helpful to snap to those green pixels while digitizing. That is
precisely what you are going to do next create points from those pixels to use
them later to help you follow the forest stands' borders when digitizing, by
using the snapping tools available in QGIS.

* Use the :menuselection:`Raster --> Conversion --> Polygonize (Raster to Vector)`
  tool to vectorize your green lines to polygons. If you don't remember how, you
  can review it in :doc:`../complete_analysis/raster_to_vector`.
* Save as :kbd:`rautjarvi_green_polygon.shp` inside the :kbd:`digitizing` folder.

Zoom in and see what the polygons look like. You will get something like this:

.. figure:: img/green_polygons.png
   :align: center

Next one option to get points out of those polygons is to get their centroids:

* Open :menuselection:`Vector --> Geometry tools --> Polygon centroids`.
* Set the polygon layer you just got as the input file for the tool.
* Name the output as :kbd:`green_centroids.shp` inside the :kbd:`digitizing` folder.
* Check :menuselection:`Add result to canvas`.
* Run the tool to calculate the centroids for the polygons.

.. figure:: img/green_points.png
   :align: center

Now you can remove the :guilabel:`rautjarvi_green_polygon` layer from the TOC.

Change the symbology of the centroids layer as:

* Open the :guilabel:`Layer Properties` for :guilabel:`green_centroids`.
* Go to the :guilabel:`Symbology` tab.
* Set the :guilabel:`Unit` to Map unit.
* Set the :guilabel:`Size` to 1.

It is not necessary to differentiate points from each other, you just need them
to be there for the snapping tools to use them. You can use those points now to
follow the original lines much easily than without them.

|basic| |FA| Digitize the Forest Stands
-------------------------------------------------------------------------------

Now you are ready to start with the actual digitizing work. You would start by
creating a vector file of :guilabel:`polygon type`, but for this exercise,
there is a shapefile with part of the area of interest already digitized. You
will just finish digitizing the half of the forest stands that are left between
the main roads (wide pink lines) and the lake:

.. figure:: img/forest_stands_to_digitize.png
   :align: center

* Go to the :kbd:`digitizing` folder using your file manager browser.
* Drag and drop the :kbd:`forest_stands.shp` vector file to your map.

Change the new layer's symbology so that it will be easier to see what polygons
have already been digitized:

* The filling of the polygon to green.
* The polygons' borders to 1 mm.
* and set the transparency to 50%.

Now, if you remember past modules, we have to set up and activate the snapping options:

* Go to :menuselection:`Project --> Snapping options...`.
* Activate the snapping for the :kbd:`green_centroids` and the :kbd:`forest_stands` layers.
* Set their :guilabel:`Tolerance` to 5 map units.
* Check the :guilabel:`Avoid Int.` box for the :kbd:`forest_stands` layer.
* Check :guilabel:`Enable topological editing`.
* Click :guilabel:`Apply`.

.. figure:: img/snapping_settings_forest.png
   :align: center

With these snapping settings, whenever you are digitizing and get close enough
to one of the points in the centroids layer or any vertex of your digitized
polygons, a pink cross will appear on the point that will be snapped to. 

Finally, turn off the visibility of all the layers except :kbd:`forest_stands`
and :kbd:`rautjarvi_georef`. Make sure that the map image has not transparency any more.

A couple of important things to note before you start digitizing:

* Don't try to be too accurate with the digitizing of the borders.
* If a border is a straight line, digitize it with just two nodes. In general,
  digitize using as few nodes as possible.
* Zoom in to close ranges only if you feel that you need to be accurate, for
  example, at some corners or when you want a polygon to connect with another
  polygon at a certain node.
* Use the mouse's middle button to zoom in/out and to pan as you digitize.
* Digitize only one polygon at a time.
* After digitizing one polygon, write the forest stand id that you can see from the map.

Now you can start digitizing:

* Locate the forest stand number 357 in the map window.
* Enable editing for the :kbd:`forest_stands.shp` layer.
* Select the :guilabel:`Add feature` tool.
* Start digitizing the stand :kbd:`357` by connecting some of the dots.
* Note the pink crosses indicating the snapping.

.. figure:: img/dgitizing_357_1.png
   :align: center

* When you are done, right click to end digitizing that polygon.
* Enter the forest stand :kbd:`id` (in this case 357).
* Click :guilabel:`OK`.

If you were not prompted for the polygon :kbd:`id` when you finished digitizing it,
go to :menuselection:`Settings --> Options --> Digitizing` and make sure that the
:guilabel:`Suppress attribute form pop-up after feature creation` is not checked.

Your digitized polygon will look like this:

.. figure:: img/dgitizing_357_3.png
   :align: center

Now for the second polygon, pick up the stand number 358. Make sure that the
:guilabel:`Avoid int.` is checked for the :kbd:`forest_stands` layer. This
option does not allow intersecting polygons at digitizing, so that if you
digitize  over an existing polygon, the new polygon will be trimmed to meet
the border of the already existing polygons. You can use this characteristic
to automatically obtain a common border.

* Begin digitizing the stand 358 at one of the common corners with the stand 357. 
* Then continue normally until you get to the other common corner for both stands.
* Finally, digitize a few points inside polygon 357 making sure that the common
  border is not intersected. See left image below.
* Right click to finish editing the forest stand 358.
* Enter the :kbd:`id` as 358.
* Click :guilabel:`OK`, your new polygon should show a common border with the
  stand 357 as you can see in the image on the right.

.. figure:: img/dgitizing_358_5.png
   :align: center

The part of the polygon that was overlapping the existing polygon has been
automatically trimmed out and you are left with a common border, as you intended
it to be.


|basic| |TY| Finish Digitizing the Forest Stands
-------------------------------------------------------------------------------

Now you have two forest stands ready. And a good idea on how to proceed.
Continue digitizing on your own until you have digitized all the forest stands
that are limited by the main road and the lake.

It might look like a lot of work, but you will soon get used to digitizing the
forest stands. It should take you about 15 minutes.

During the digitizing you might need to edit or delete nodes, split or merge polygons.
You learned about the necessary tools in :doc:`../create_vector_data/topo_editing`,
now is probably a good moment to go read about them again.

Remember that having :guilabel:`Enable topological editing` activated,
allows you to move nodes common to two polygons so that the common border is
edited at the same time for both polygons.

Your result will look like this:

.. figure:: img/stands_fully_digitized.png
   :align: center

|basic| |FA| Joining the Forest Stand Data
-------------------------------------------------------------------------------

It is possible that the forest inventory data you have for you map is also
written in paper. In that case, you would have to first write that data to a text
file or a spreadsheet. For this exercise, the information from the inventory for
1994 (the same inventory as the map) is ready as a comma separated text (csv) file.

Open the :kbd:`rautjarvi_1994.csv` file from the :kbd:`exercise_data\\forestry`
directory in a text editor and note that the inventory data file has an attribute
called :kbd:`ID` that has the numbers of the forest stands. Those numbers are
the same as the forest stands ids you have entered for your polygons and can be
used to link the data from the text file to your vector file. You can see the
metadata for this inventory data in the file :kbd:`rautjarvi_1994_legend.txt`
in the same folder.

* Open the :kbd:`.csv` in QGIS with the :menuselection:`Layer --> Add Delimited
  Text Layer...` tool. In the dialog, set it as follows:

.. figure:: img/inventory_csv_import.png
   :align: center

To add the data from the :kbd:`.csv` file:

* Open the Layer Properties for the :kbd:`forest_stands` layer.
* Go to the :guilabel:`Joins` tab.
* Click the plus sign on the bottom of the dialog box.
* Select :kbd:`rautjarvi_1994.csv` as the :guilabel:`Join layer` and :kbd:`ID`
  as the :guilabel:`Join` field.
* Make sure that the :guilabel:`Target` field is also set to :kbd:`id`.
* Click :guilabel:`OK` two times.

The data from the text file should be now linked to your vector file. To see
what has happened, open the attribute table for the :kbd:`forest_stands` layer.
You can see that all the attributes from the inventory data file are now linked
to your digitized vector layer.

|basic| |TY| Renaming Attribute Names and Adding Area and Perimeter 
-------------------------------------------------------------------------------

The data from the :kbd:`.csv` file is just linked to your vector file. To make
this link permanent, so that the data is actually recorded to the vector file
you need to save the :kbd:`forest_stands` layer as a new vector file. Close the
attribute table and right click the forest_stands layer to save it as
:kbd:`forest_stands_1994.shp`.

Open your new :kbd:`forest_stands_1994.shp` in your map if you did not added yet.
Then open the attribute table. You notice that the names of the columns that you
just added are no very useful. To solve this:

* Add the plugin :guilabel:`Table Manager` as you have done with other plugins before.
* Make sure the plugin is activated.
* In the TOC select the layer :kbd:`forest_stands_1994.shp`.
* Then, go to :menuselection:`Vector --> Table Manager --> Table manager`.
* Use the dialogue box to edit the names of the columns to match the ones in the :kbd:`.csv` file.

.. figure:: img/forestry_table_manager.png
   :align: center

* Click on :guilabel:`Save`.
* Select :guilabel:`Yes` to keep the layer style.
* Close the :guilabel:`Table Manager` dialogue.

To finish gathering the information related to these forest stands, you might
calculate the area and the perimeter of the stands. You calculated areas for
polygons in :doc:`../complete_analysis/analysis_exercise`. Go back to that
lesson if you need to and calculate the areas for the forest stands, name the
new attribute :kbd:`Area` and make sure that the values calculated are in hectares.

Now your :kbd:`forest_stands_1994.shp` layer is ready and packed with all the
available information.

Save your project to keep the current map presentation in case you need to come
back later to it.

|IC|
-------------------------------------------------------------------------------

It has taken a few clicks of the mouse but you now have your old inventory data
in digital format and ready for use in QGIS.

|WN|
-------------------------------------------------------------------------------

You could start doing different analysis with your brand new dataset, but you
might be more interested in performing analysis in a dataset more up to date.
The topic of the next lesson will be the creation of forest stands using current
aerial photos and the addition of some relevant information to your dataset.


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
.. |basic| image:: /static/common/basic.png
