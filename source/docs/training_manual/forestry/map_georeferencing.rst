|LS| Georeferencing a Map
===============================================================================

A common forestry task would be the update of the information for a forestry area. It is possible that the previous information for that area dates several years back and was collected analogically (that is, in paper) or perhaps it was digitized but all you have left is the paper version of that inventory data.

Most likely you would like to use that information in your GIS to, for example, compare later with later inventories. This means that you will need to digitize the information at hand using your GIS software. But before you can start the digitizing, there is an important first step to be done, scanning and georeferencing your paper map.

**The goal for this lesson:** To learn to use the Georeferencer tool in QGIS.

|basic| Scan the map
-------------------------------------------------------------------------------

The first task you will have to do is to scan your map. If your map is too big, then you can scan it in different parts but keep in mind that you will have to repeat preprocessing and georeferencing tasks for each part. So if possible, scan the map in as few parts as possible.

If you are going to use a different map that the one provided with this manual, use your own scanner to scan the map as an image file, a resolution of 300 DPI will do. If your map has colors, scan the image in color so that you can later use those colors to separate information from your map into different  layers (for ex., forest stands, contour lines, roads...).

For this exercise you will use a previously scanned map, you can find it as :kbd:`rautjarvi_map.tif` in the data folder :kbd:`exercise_data/forestry`

|basic| |FA| Georeferencing the scanned map
-------------------------------------------------------------------------------

Open QGIS and set the project's CRS to :kbd:`ETRS89 / ETRS-TM35FIN` in :menuselection:`Project --> Project Properties --> CRS`, which is the currently used CRS in Finland. Make sure that :guilabel:`Enable 'on the fly' CRS transformation` is checked, since we will be working with old data that is another CRS.

.. image:: /static/training_manual/forestry/f_1.png
   :align: center

Save the QGIS project as :kbd:`map_digitizing.qgs`.

You will use the georeferencing plugin from QGIS, the plugin is already installed in QGIS. Activate the plugin using the plugin manager as you have done in previous modules. The plugin is named :guilabel:`Georeferencer GDAL`.

To georeference the map:

* Open the georeference tool, :menuselection:`Raster --> Georeferencer --> Georeferencer`.
* Add the map image file, :kbd:`rautjarvi_map.tif`, as the image to georeferenciate, :menuselection:`File --> Open raster`.
* When prompted find and select the :kbd:`KKJ / Finland zone 2` CRS, it is the CRS that was used in Finland back in 1994 when this map was created.
* Click :guilabel:`OK`.

Next you should define the transformation settings for georeferencing the map:

* Open :menuselection:`Settings --> Transformation settings`.
* Click the icon next to the :kbd:`Output raster` box, go to the folder and create the folder :kbd:`exercise_data\\forestry\\digitizing` and name the file as :kbd:`rautjarvi_georef.tif`.
* Set the rest of parameters as shown below.

.. image:: /static/training_manual/forestry/Clipboard10.png
   :align: center
   
* Click :guilabel:`OK`.
   
The map contains several cross-hairs marking the coordinates in the map, we will use those to georeferenciate this image. You can use the zooming and panning tools as you usually do in QGIS to inspect the image in the Georeferencer's window.

* Zoom in to the left lower corner of the map and note that there is a cross-hair with a coordinate pair, x and y, that as mentioned before are in :kbd:`KKJ / Finland zone 2` CRS. You will use this point as the first ground control point for the georeferencing your map.
* Select the :guilabel:`Add point` tool and click in the intersection of the cross-hairs (pan and zoom as needed).
* In the :guilabel:`Enter map coordinates` dialogue write the coordinates that appear in the map (X: 2557000 and Y: 6786000).
* Click :guilabel:`OK`.

The first coordinate for the georeferencing is now ready.

Look for other cross-hairs in the black lines image, they are separated 1000 meters from each other both in North and East direction. You should be able to calculate the coordinates of those points in relation to the first one.

Zoom out in the image and move to the right until you find other cross-hair, and estimate how many kilometres you have moved. Try to get ground control points as far from each other as possible. Digitize at least three more ground control points in the same way you did the first one. You should end up with something similar to this:

.. image:: /static/training_manual/forestry/Clipboard09.png
   :align: center
   
With already three digitized ground control points you will be able to see the georeferencing error as a red line coming out of the points. The error in pixels can be seen also in the :guilabel:`GCP table` in the :guilabel:`dX[pixels]` and :guilabel:`dY[pixels]` columns. The error in pixels should not be higher than 10 pixels, if it is you should review the points you have digitized and the coordinates you have entered to find what the problem is. You can use the image above as a guide.

Once you are happy with your control points save your ground control points, in case that you will need them later, and you will:

* :menuselection:`File --> Save GCP points as...`.
* In the folder :kbd:`exercise_data\\forestry\\digitizing`, name the file :kbd:`rautjarvi_map.tif.points`.

Finally, georeference you map:

* :menuselection:`File --> Start georeferencing`.
* Note that you named the file already as :kbd:`rautjarvi_georef.tif` when you edited the Georeferencer settings.

Now you can see the map in QGIS project as a georeferenced raster. Note that the raster seems to be slightly rotated, but that is simply because the data is :kbd:`KKJ / Finland zone 2` and your project is in :kbd:`ETRS89 / ETRS-TM35FIN`.

To check that your data is properly georeferenced you can open the aerial image in the :kbd:`exercise_data\\forestry` folder, named :kbd:`rautjarvi_aerial.tif`. Your map and this image should match quite well. Set the map transparency to 50% and compare it to the aerial image.

.. image:: /static/training_manual/forestry/Clipboard14.png
   :align: center

Save the changes to your QGIS project, you will continue from this point for the next lesson.

|IC|
-------------------------------------------------------------------------------

As you have seen, georeferencing a paper map is a relatively straight forward operation.

|WN|
-------------------------------------------------------------------------------

In the next lesson, you will digitize the forest stands in your map as polygons and add the inventory data to them
