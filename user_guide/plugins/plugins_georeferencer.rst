.. _`georef`:

Georeferencer Plugin
<<<<<<< HEAD
======================================

.. % when the revision of a section has been finalized, 
.. % comment out the following line:
.. % \updatedisclaimer
=======
====================
>>>>>>> upstream/master

The Georeferencer Plugin is a tool for generating world files for rasters.
It allows you to reference rasters to geographic or projected coordinate
systems by creating a new GeoTiff or by adding a world file to the existing
image. The basic approach to georeferencing a raster is to locate points
on the raster for which you can accurately determine their coordinates.

Features
<<<<<<< HEAD
~~~~~~~~


+---------------------------+----------------------------+---------------------------+----------------------------+
| **Icon**                  | **Purpose**                | **Icon**                  | **Purpose**                |
+===========================+============================+===========================+============================+
| |mActionAddRasterLayer|   | Open raster                | |mActionStartGeoref|      | Start georeferencing       |
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionGDALScript|       |  Generate GDAL script      | |mActionFileOpen|         | Load GCP Points            |
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionFileSave|         | Save GCP Points as         | |mActionOptions|          | Transformation settings    |
=======
--------

..index:: Georeferencer, tools

.. _`georeferencer_tools`:

+---------------------------+----------------------------+---------------------------+----------------------------+
| Icon                      | Purpose                    | Icon                      | Purpose                    |
+===========================+============================+===========================+============================+
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionAddRasterLayer|   | Open raster                | |mActionStartGeoref|      | Start georeferencing       |
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionGDALScript|       | Generate GDAL Script       | |mActionFileOpen|         | Load GCP Points            |
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionFileSave|         | Save GCP Points As         | |mActionOptions|          | Transformation settings    |
>>>>>>> upstream/master
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionCapturePoint|     | Add Point                  | |mActionDeleteSelected|   | Delete Point               |
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionMoveFeature|      | Move GCP Point             | |mActionPan|              | Pan                        |
+---------------------------+----------------------------+---------------------------+----------------------------+
<<<<<<< HEAD
| |mActionZoomIn|           | Zoom in                    | |mActionZoomOut|          | Zoom out                   |
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionZoomToLayer|      | Zoom to layer              | |mActionZoomLast|         | Zoom Last                  |
=======
| |mActionZoomIn|           | Zoom In                    | |mActionZoomOut|          | Zoom Out                   |
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionZoomToLayer|      | Zoom To Layer              | |mActionZoomLast|         | Zoom Last                  |
>>>>>>> upstream/master
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionZoomNext|         | Zoom Next                  | |mActionLinkGeorefToQGis| | Link Georeferencer to QGIS |
+---------------------------+----------------------------+---------------------------+----------------------------+
| |mActionLinkQGisToGeoref| | Link QGIS to Georeferencer |                           |                            |
+---------------------------+----------------------------+---------------------------+----------------------------+
<<<<<<< HEAD
.. \caption{Georeferencer Tools}\label{tab:georeferencer_tools}

Usual procedure
~~~~~~~~~~~~~~~

As X and Y coordinates (DMS (dd mm ss.ss), DD (dd.dd) or projected coordinates 
(mmmm.mm) which correspond with the selected point on the image, two 
alternative procedures can be used: 

#. The raster itself sometimes provides crosses with coordinates written on 
   the image. In this case you can enter the coordinates manually.
#. Using already georeferenced layers, this can be either vector or 
   raster data that contain the same objects/features that you have on 
   the image that you want to georeference and the projection you want to 
   have your image. In this case you can enter the coordinates by 
   clicking on the reference dataset loaded in QGIS map canvas.


The usual procedure for georeferencing an image involves selecting multiple 
points on the raster, specifying their coordinates, and choosing a relevant 
transformation type. Based on the input parameters and data, the plugin will 
compute the world file parameters. The more coordinates you provide, the 
better the result will be.

The first step is to start QGIS, load the Georeferencer Plugin (see Section 
:ref:`load_core_plugin`) and click on the |georeferencer| 
:guilabel:`Georeferencer` icon which appears in the QGIS toolbar menu. The 
Georeferencer Plugin dialog appears as shown in Figure :ref:`georefplugin`.
  
For this example, we are using a topo sheet of South Dakota from SDGS. 
It can later be visualized together with the data from the GRASS spearfish60 
location. You can download the topo sheet here: 
http://grass.osgeo.org/sampledata/spearfish_toposheet.tar.gz

.. \begin{figure}[ht]
.. \centering
..   \includegraphics[clip=true, width=12cm]{georefplugin}
..   \caption{Georeferencer Plugin Dialog \nixcaption}\label{fig:georefplugin}
.. \end{figure}
=======

Usual procedure
---------------

As X and Y coordinates (DMS (dd mm ss.ss), DD (dd.dd) or projected coordinates
(mmmm.mm) which correspond with the selected point on the image, two
alternative procedures can be used:

* The raster itself sometimes provides crosses with coordinates `written'
  on the image. In this case you can enter the coordinates manually.
* Using already georeferenced layers, this can be either vector or raster
  data that contain the same objects/features that you have on the image
  that you want to georeference and the projection you want to have your
  image. In this case you can enter the coordinates by clicking on the
  reference dataset loaded in QGIS map canvas.

The usual procedure for georeferencing an image involves selecting multiple
points on the raster, specifying their coordinates, and choosing a relevant
transformation type. Based on the input parameters and data, the plugin
will compute the world file parameters. The more coordinates you provide,
the better the result will be.

The first step is to start QGIS, load the Georeferencer Plugin (see Section
:ref:`load_core_plugin`) and click on the |georeferencer| :guilabel:`Georeferencer`
icon which appears in the QGIS toolbar menu. The Georeferencer Plugin
dialog appears as shown in Figure `georefplugin`_.

For this example, we are using a topo sheet of South Dakota from SDGS.
It can later be visualized together with the data from the GRASS spearfish60
location. You can download the topo sheet here:
:download:`http://grass.osgeo.org/sampledata/spearfish\_toposheet.tar.gz`

.. _`georefplugin`:

.. figure:: img/en/plugins_georeferencer/georefplugin.png
   :align: center
   :width: 30em

   Georeferencer Plugin Dialog |nix|

>>>>>>> upstream/master

.. _`georeferencer_entering`:

Entering ground control points (GCPs)
<<<<<<< HEAD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. To start georeferencing an unreferenced raster, we must load it using the 
   |mActionAddRasterLayer} :guilabel:`Add raster` button. The raster will show 
   up in the main working area of the dialog. Once the raster is loaded, we 
   can start to enter reference points.
#. Using the |mActionCapturePoint| :guilabel:`Add Point`} button, add points to 
   the main working area and enter their coordinates (See Figure 
   :ref:`choose_points`).  For this procedure you have two options:

   #. Click on a point in the raster image and enter the X and Y coordinates 
      manually
   #. Click on a point in the raster image and choose the button
      |pencil| :Guilabel:`from map canvas` to add the X and Y coordinates with 
      the help of a georeferenced map already loaded in the QGIS map canvas.
   #. With the |mActionMoveFeature| button, you can move the GCPs in both 
      windows, if they are at the wrong place. 
#. Continue entering points. You should have at least 4 points, and the more 
   coordinates you can provide, the better the result will be. There are 
   additional tools on the plugin dialog to zoom and pan the working area in 
   order to locate a relevant set of GCP points.

.. \begin{figure}[ht]
.. \centering
..   \includegraphics[clip=true,width=5cm]{choose_points}
..   \caption{Add points to the raster image \nixcaption}\label{fig:choose_points}
.. \end{figure}

The points that are added to the map will be stored in a separate text 
file ([filename].points) usually together with the raster image. 
This allows us to reopen the Georeferencer plugin at a later date and add 
new points or delete existing ones to optimize the result. The points file 
contains values of the form: mapX, mapY, pixelX, pixelY. You can use the 
|mActionFileOpen| :guilabel:`Load GCP Points` and 
|mActionFileSave| :guilabel:`Save GCP Points` buttons to 
manage the files. Within the GCP table you can click on a column header and 
therewith enable e.g. numerical sorting. The GCP list is automatically updated.

.. _`georeferencer_transformation`:
Defining the transformation settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After you have added your GCPs to the raster image, you need to define the 
transformation settings for the georeferencing process. 

.. \begin{figure}[ht]
.. \centering
..   \includegraphics[clip=true,width=5cm]{transformation_settings}
..   \caption{Defining the georeferencer transformation settings \nixcaption}\label{fig:georef_transform}
.. \end{figure}

Available Transformation algorithms
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Depending on how many ground control point you have captured, you may want 
to use different transformation algorithms. Choice of transformation 
algorithm is also dependent on the type and quality of input data and 
the amount of geometric distortion that you are willing to introduce 
to final result.

Currently, following algorithms are available: 

.. [label=--]
* The **Linear algorithm** is used to create a world-file, and is different 
  from the other algorithms, as it does not actually transform the raster. 
  This algorithm likely won't be sufficient if you are dealing with scanned 
  material.
* The **Helmert transformation** performs simple scaling and rotation 
  transformations. 
* The **Polynomial algorithms** 1-3 are among the most widely 
  used algorithms for georeferencing, and each one differs by the degree of 
  distortion introduced to match source and destination ground control points. 
  The most widely used polynomial algorithm is the second order polynomial 
  transformation, which allows some curvature. First order polynomial 
  transformation (affine) preserves colliniarity and allows scaling, 
  translation and rotation only.
* The **Thin plate spline (TPS) algorithm** is a more modern georeferencing 
  method, which is able to introduce local deformations in the data. This 
  algorithm is useful when very low quality originals are being georeferenced.
* The **Projective transformation** is a linear rotation and 
  translation of coordinates.


Define the Resampling method
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=======
-------------------------------------

#.  To start georeferencing an unreferenced raster, we must load it using
    the |mActionAddRasterLayer| button. The raser will show up in the main
    working area of the dialog. Once the raster is loaded, we can start to
    enter reference points.
#.  Using the |mActionCapturePoint| :giulabel:`Add Point` button, add
    points to the main working area and enter their coordinates (see Figure
    `choose_points`_). For this procedure you have two options:

    #.  Click on a point in the raster image and enter the X and Y coordinates
        manually
    #.  Click on a point in the raster image and choose the button
        |pencil| :guilabel:`from map canvas` to add the X and Y coordinates
        with the help of a georeferenced map already loaded in the QGIS
        map canvas.

#.  With the |mActionMoveFeature| button, you can move the GCPs in both
    windows, if they are at the wrong place.

Continue entering points. You should have at least 4 points, and the more
coordinates you can provide, the better the result will be. There are
additional tools on the plugin dialog to zoom and pan the working area in
order to locate a relevant set of GCP points.

.. _`choose_points`:

.. figure:: img/en/plugins_georeferencer/choose_points.png
   :align: center
   :width: 30em

   Add points to the raster image |nix|


The points that are added to the map will be stored in a separate text
file ([filename].points) usually together with the raster image. This
allows us to reopen the Georeferencer plugin at a later date and add new
points or delete existing ones to optimize the result. The points file
contains values of the form: mapX, mapY, pixelX, pixelY. You can use the
|mActionFileOpen| :guilabel:`Load GCP Points` and
|mActionFileSave| :guilabel:`Save GCP Points` buttons to manage the files.
Within the GCP table you can click on a column header and therewith enable
e.g. numerical sorting. The GCP list is automatically updated.

.. _`georeferencer_transformation`:

Defining the transformation settings
------------------------------------

After you have added your GCPs to the raster image, you need to define the
transformation settings for the georeferencing process.

.. _`georef_transform`:

.. figure:: img/en/plugins_georeferencer/transformation_settings.png
   :align: center
   :width: 30em

   Defining the georeferencer transformation settings |nix|


Available Transformation algorithms
-----------------------------------

Depending on how many ground control point you have captured, you may want
to use different transformation algorithms. Choice of transformation
algorithm is also dependent on the type and quality of input data and the
amount of geometric distortion that you are willing to introduce to final
result.

Currently, following algorithms are available:

*  The **Linear algorithm** is used to create a world-file, and is different
   from the other algorithms, as it does not actually transform the raster.
   This algorithm likely won't be sufficient if you are dealing with scanned
   material.
*  The **Helmert transformation** performs simple scaling and rotation
   transformations.
*  The **Polynomial algorithms** 1-3 are among the most widely used algorithms
   for georeferencing, and each one differs by the degree of distortion
   introduced to match source and destination ground control points. The
   most widely used polynomial algorithm is the second order polynomial
   transformation, which allows some curvature. First order polynomial
   transformation (affine) preserves colliniarity and allows scaling,
   translation and rotation only.
*  The **Thin plate spline (TPS) algorithm** is a more modern georeferencing
   method, which is able to introduce local deformations in the data. This
   algorithm is useful when very low quality originals are being georeferenced.
*  The **Projective transformation** is a linear rotation and translation
   of coordinates.

Define the Resampling method
----------------------------
>>>>>>> upstream/master

The type of resampling you choose will likely depending on your input data
and the ultimate objective of the exercise. If you don't want to change
statistics of the image, you might want to choose Nearest neighbor,
whereas a Cubic resampling will likely provide a more smoothed result.

<<<<<<< HEAD
It is possible to choose between five different resampling methods.

#. Nearest neighbor
#. Linear
#. Cubic
#. Cubic Spline
#. Lanczos


Define the transformation settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are several options that need to be defined for the georeferenced output 
raster. 

.. [label=--]
* The checkbox |checkbox| :guilabel:`Create world file` is only available, if 
  you decide to use the linear transformation type, because this means that 
  the raster image actually won't be transformed. In this case, the field 
  Output raster is not activated, because only a new world-file will be 
  created.
* For all other transformation type you have to define an ``Output raster``. 
  As default a new file (``[filename]_modified``) will be created in the same 
  folder together with the original raster image.   
* As a next step you have to define the **Target SRS** (Spatial Reference 
  System) for the georeferenced raster (see section :ref:`label_projections`). 
* If you like, you can **generate a pdf map** and also ``a pdf report``. 
  The report includes information about the used transformation 
  parameters. An image of the residuals and a list with all GCPs and their 
  RMS errors.
* Furthermore you can activate the |checkbox| :guilabel:`Set Target Resolution` 
  checkbox and define pixel resolution of the output raster. Default horizontal 
  and vertical resolution is 1,      
* The |checkbox| :guilabel:`Use 0 for transparency when needed` can be 
  activated, if pixels with the value 0 shall be visualized transparent. In 
  our example toposheet all white areas would be transparent.
* Finally |checkbox| :guilabel:`Load in QGIS when done` loads the output raster 
  automatically into the QGIS map canvas when the transformation is done.


Show and adapt raster properties
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Clicking on the :guilabel:`Raster properties` dialog in the 
:menuselection:`Settings` menu opens the raster properties of the layer that 
you want to georeference.   

Configure the georeferencer
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. [label=--]
* You can define if you want to show GCP coordinates and/or IDs.
* As residual units pixels and map units can be chosen.
* For the PDF report a left and right margin can be defined and you can 
  also set the paper size for the PDF map.
* Finally you can activate to |checkbox| 
  :guilabel:`show georeferencer window docked`. 


.. _`georeferencer_running`
Running the transformation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After all GCPs have been collected and all transformation settings are 
defined, just press the |mActionStartGeoref| 
:guilabel:`Start georeferencing` button to create the new georeferenced raster.
=======
It is prossible to choose between five different resampling methods.

#.  Nearest neighbour
#.  Linear
#.  Cubic
#.  Cubic Spline
#.  Lanczos

Define the transformation settings
----------------------------------

There are several options that need to be defined for the georeferenced output
raster.

*  The checkbox |checkbox| Create world file is only available, if you
   decide to use the linear transformation type, because this means that
   the raster image actually won't be transformed. In this case, the field
   Output raster is not activated, because only a new world-file will be
   created.
*  For all other transformation type you have to define an **Output
   raster**. As default a new file ([filename]_modified) will be created
   in the same folder together with the original raster image.
*  As a next step you have to define the **Target SRS** (Spatial Reference
   System) for the georeferenced raster (see section :ref:`label_projections`).
*  If you like, you can **generate a pdf map** and also **a pdf report**.
   The report includes information about the used transformation parameters.
   An image of the residuals and a list with all GCPs and their RMS errors.
*  Furthermore you can activate the |checkbox| Set Target Resolution
   checkbox and define pixel resolution of the output raster. Default horizontal
   and vertical resolution is 1,
*  The |checkbox| Use 0 for transparency when needed can be activated, if
   pixels with the value 0 shall be visualized transparent. In our example
   toposheet all white areas would be transparent.
*  Finally |checkbox| Load in QGIS when done loads the output raster
   automatically into the QGIS map canvas when the transformation is done.

Show and adapt raster properties
--------------------------------

Clicking on the :guilabel:`Raster properties` dialog in the :guilabel:`Settings`
menu opens the raster properties of the layer that you want to georeference.

Configure the georeferencer
---------------------------

*  You can define if you want to show GCP coordiniates and/or IDs.
*  As residual units pixels and map units can be chosen.
*  For the PDF report a left and right margin can be defined and you can
   also set the paper size for the PDF map.
*  Finally you can activate to |checkbox| show georeferencer window docked.

.. _`georeferencer_running`:
>>>>>>> upstream/master

Running the transformation
--------------------------

After all GCPs have been collected and all transformation settings are
defined, just press the button |mActionStartGeoref| :guilabel:`Start
georeferencing` to create the new georeferenced raster.
