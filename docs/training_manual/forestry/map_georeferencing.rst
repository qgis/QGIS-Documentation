Lesson: Georeferencing a Map
===============================================================================

A common forestry task would be the update of the information for a forestry
area. It is possible that the previous information for that area dates several
years back and was collected analogically (that is, in paper) or perhaps it
was digitized but all you have left is the paper version of that inventory data.

Most likely you would like to use that information in your GIS to, for example,
compare later with later inventories. This means that you will need to digitize
the information at hand using your GIS software. But before you can start the
digitizing, there is an important first step to be done, scanning and
georeferencing your paper map.

**The goal for this lesson:** To learn to use the Georeferencer tool in QGIS.

:abbr:`★☆☆ (Basic level)` Scan the map
-------------------------------------------------------------------------------

The first task you will have to do is to scan your map. If your map is too big,
then you can scan it in different parts but keep in mind that you will have to
repeat preprocessing and georeferencing tasks for each part. So if possible,
scan the map in as few parts as possible.

If you are going to use a different map that the one provided with this manual,
use your own scanner to scan the map as an image file, a resolution of 300 DPI
will do. If your map has colors, scan the image in color so that you can later
use those colors to separate information from your map into different  layers
(for ex., forest stands, contour lines, roads...).

For this exercise you will use a previously scanned map, you can find it as
:file:`rautjarvi_map.tif` in the data folder :file:`exercise_data/forestry`

:abbr:`★☆☆ (Basic level)` Follow Along: Georeferencing the scanned map
-------------------------------------------------------------------------------

#. Open QGIS and set the project's CRS to ``EPSG:3067 - ETRS89 / TM35FIN(E,N)``
   in :menuselection:`Project --> Properties --> CRS`, which is the currently
   used CRS in Finland.

   .. figure:: img/f_1.png
      :align: center

#. Save the QGIS project as :file:`map_digitizing.qgs`.

You will use the georeferencing tool from QGIS named :guilabel:`Georeferencer`.
To georeference the map:

#. Open the georeference tool, :menuselection:`Layer -->` |georefRun|
   :menuselection:`Georeferencer...`.

   .. figure:: img/georeferencer.png
      :align: center

#. Add the map image file, :file:`rautjarvi_map.tif`, as the image to georeference,
   :menuselection:`File --> Open raster`.
#. Click :guilabel:`OK`.

Next you should define the transformation settings for georeferencing the map:

#. Open :menuselection:`Settings --> Transformation settings`.
#. Set the :guilabel:`Transformation type` to ``Linear`` and
   the :guilabel:`Resampling method` to ``Nearest neighbour``.
#. Press the |setProjection| :sup:`Select CRS` button next to
   the :guilabel:`Target SRS` option and select the ``EPSG:2392 - KKJ / Finland zone 2`` CRS;
   it is the CRS that was used in Finland back in 1994 when this map was created.
#. Click the icon next to the :guilabel:`Output raster` box, go to the folder and
   create the folder :file:`exercise_data\\forestry\\digitizing` and name the file
   as :file:`rautjarvi_georef.tif`.
#. Check |checkbox| :guilabel:`Load in QGIS when done`
#. Leave the rest of parameters as default.

   .. figure:: img/Clipboard10.png
      :align: center

#. Click :guilabel:`OK`.

The map contains several cross-hairs marking the coordinates in the map,
we will use those to georeference this image. You can use the zooming and
panning tools as you usually do in QGIS to inspect the image in the
Georeferencer's window.

#. Zoom in to the left lower corner of the map and note that there is a cross-hair
   with a coordinate pair, X and Y, that as mentioned before are in ``KKJ / Finland
   zone 2`` CRS. You will use this point as the first ground control point for the
   georeferencing your map.
#. Select the :guilabel:`Add point` tool and click in the intersection of the
   cross-hairs (pan and zoom as needed).
#. In the :guilabel:`Enter map coordinates` dialogue write the coordinates that
   appear in the map (X: 2557000 and Y: 6786000) and their CRS
   (``EPSG:2392 - KKJ / Finland zone 2``)

   .. figure:: img/fillcoordinates.png
      :align: center

#. Click :guilabel:`OK`.

   The first coordinate for the georeferencing is now ready.

#. Look for other black cross-hairs in the image, they are separated 1000
   meters from each other both in North and East direction. You should be able
   to calculate the coordinates of those points in relation to the first one.

#. Zoom out in the image and move to the right or the top until you find other cross-hair,
   and estimate how many kilometres you have moved. Try to get ground control
   points as far from each other as possible.
#. Digitize at least three more ground control points in the same way you did
   the first one. You should end up with something similar to this:

   .. figure:: img/Clipboard09.png
      :align: center

With already three digitized ground control points you will be able to see the
georeferencing error as a red line coming out of the points. The error in pixels
can be seen also in the :guilabel:`GCP table` in the :guilabel:`dX[pixels]` and
:guilabel:`dY[pixels]` columns. The error in pixels should not be higher than
10 pixels. If it is, you should review the points you have digitized and the
coordinates you have entered to find what the problem is. You can use the image
above as a guide.

Once you are happy with your control points, you can save them for later use:

#. Go to :menuselection:`File --> Save GCP points as...`.
#. In the folder :file:`exercise_data\\forestry\\digitizing`, name the file
   :file:`rautjarvi_map.tif.points`.

Finally, georeference your map:

#. Go to :menuselection:`File --> Start georeferencing`.
#. Note that you named the file already as :file:`rautjarvi_georef.tif`
   when you edited the Georeferencer settings.

   Now you can see the map in QGIS project as a georeferenced raster.
   Note that the raster seems to be slightly rotated, but that is simply because
   the data is in ``KKJ / Finland zone 2`` and your project is in
   ``ETRS89 / TM35FIN(E,N)``.

#. To check that your data is properly georeferenced, you can

   #. Open the aerial image in the :file:`exercise_data\\forestry` folder,
      named :file:`rautjarvi_aerial.tif`.
   #. Your map and this image should match quite well: set the map transparency to 50%
      and compare it to the aerial image.

   .. figure:: img/Clipboard14.png
      :align: center

#. Save the changes to your QGIS project, you will continue from this point for the
   next lesson.

In Conclusion
-------------------------------------------------------------------------------

You have now georeferenced a paper map, making it possible to use it as a map
layer in QGIS.

What's Next?
-------------------------------------------------------------------------------

In the next lesson, you will digitize the forest stands in your map as polygons
and add the inventory data to them.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |georefRun| image:: /static/common/mGeorefRun.png
   :width: 1.5em
.. |setProjection| image:: /static/common/mActionSetProjection.png
   :width: 1.5em
