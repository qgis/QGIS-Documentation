.. index:: Georeferencing images
   single: Raster; Georeference
.. _`georef`:

Georeferencer
=============

.. only:: html

   .. contents::
      :local:

The |georefRun| Georeferencer is a tool for generating world files for rasters.
It allows you to reference rasters to geographic or projected coordinate systems by
creating a new GeoTiff or by adding a world file to the existing image. The basic
approach to georeferencing a raster is to locate points on the raster for which
you can accurately determine coordinates.

**Features**

.. index::
   single: Tools; Georeferencer tools

.. _table_georeferencer_tools:

+--------------------------------+------------------------------+-------------------------------+----------------------------+
| Icon                           | Purpose                      | Icon                          | Purpose                    |
+================================+==============================+===============================+============================+
| |addRasterLayer|               | Open raster                  | |start|                       | Start georeferencing       |
+--------------------------------+------------------------------+-------------------------------+----------------------------+
| |gdalScript|                   | Generate GDAL Script         | |loadGCPpoints|               | Load GCP Points            |
+--------------------------------+------------------------------+-------------------------------+----------------------------+
| |saveGCPPointsAs|              | Save GCP Points As           | |transformSettings|           | Transformation settings    |
+--------------------------------+------------------------------+-------------------------------+----------------------------+
| |addGCPPoint|                  | Add Point                    | |deleteGCPPoint|              | Delete Point               |
+--------------------------------+------------------------------+-------------------------------+----------------------------+
| |moveGCPPoint|                 | Move GCP Point               | |pan|                         | Pan                        |
+--------------------------------+------------------------------+-------------------------------+----------------------------+
| |zoomIn|                       | Zoom In                      | |zoomOut|                     | Zoom Out                   |
+--------------------------------+------------------------------+-------------------------------+----------------------------+
| |zoomToLayer|                  | Zoom To Layer                | |zoomLast|                    | Zoom Last                  |
+--------------------------------+------------------------------+-------------------------------+----------------------------+
| |zoomNext|                     | Zoom Next                    | |linkGeorefToQGis|            | Link Georeferencer to QGIS |
+--------------------------------+------------------------------+-------------------------------+----------------------------+
| |linkQGisToGeoref|             | Link QGIS to Georeferencer   | |fullHistogramStretch|        | Full histogram stretch     |
+--------------------------------+------------------------------+-------------------------------+----------------------------+
| |localHistogramStretch|        | Local histogram stretch      |                               |                            |
+--------------------------------+------------------------------+-------------------------------+----------------------------+

Table Georeferencer: Georeferencer Tools

Usual procedure
---------------

As X and Y coordinates (DMS (dd mm ss.ss), DD (dd.dd) or projected coordinates
(mmmm.mm)), which correspond with the selected point on the image, two
alternative procedures can be used:

* The raster itself sometimes provides crosses with coordinates "written" on the
  image. In this case, you can enter the coordinates manually.
* Using already georeferenced layers. This can be either vector or raster data
  that contain the same objects/features that you have on the image that you want
  to georeference and with the projection that you want for your image. In this case,
  you can enter the coordinates by clicking on the reference dataset loaded in the
  QGIS map canvas.

The usual procedure for georeferencing an image involves selecting multiple
points on the raster, specifying their coordinates, and choosing a relevant
transformation type. Based on the input parameters and data, the Georeferencer will
compute the world file parameters. The more coordinates you provide, the better
the result will be.

The first step is to start QGIS and click on :menuselection:`Raster -->` |georefRun|
:menuselection:`Georeferencer`, which appears in the QGIS menu bar. The Georeferencer
dialog appears as shown in figure_georeferencer_dialog_.

For this example, we are using a topo sheet of South Dakota from SDGS. It can
later be visualized together with the data from the GRASS :file:`spearfish60`
location. You can download the topo sheet here:
https://grass.osgeo.org/sampledata/spearfish_toposheet.tar.gz.

.. _figure_georeferencer_dialog:

.. figure:: img/georef.png
   :align: center

   Georeferencer Dialog


.. _`georeferencer_entering`:

Entering ground control points (GCPs)
......................................

#. To start georeferencing an unreferenced raster, we must load it using the
   |addRasterLayer| button. The raster will show up in the main working
   area of the dialog. Once the raster is loaded, we can start to enter reference
   points.
#. Using the |addGCPPoint| :sup:`Add Point` button, add points to the
   main working area and enter their coordinates (see Figure figure_georeferencer_add_points_).
   For this procedure you have three options:

   - Click on a point in the raster image and enter the X and Y coordinates
     manually.
   - Click on a point in the raster image and choose the |pencil|
     :sup:`From map canvas` button to add the X and Y coordinates with the help of a
     georeferenced map already loaded in the QGIS map canvas.
   - With the |moveGCPPoint| button, you can move the GCPs in both windows,
     if they are at the wrong place.

#. Continue entering points. You should have at least four points, and the more
   coordinates you can provide, the better the result will be. There are
   additional tools for zooming and panning the working area in
   order to locate a relevant set of GCP points.

.. _figure_georeferencer_add_points:

.. figure:: img/choose_points.png
   :align: center

   Add points to the raster image


The points that are added to the map will be stored in a separate text file
(:file:`[filename].points`) usually together with the raster image. This allows
us to reopen the Georeferencer at a later date and add new points or delete
existing ones to optimize the result. The points file contains values of the
form: ``mapX, mapY, pixelX, pixelY``. You can use the |loadGCPpoints|
:sup:`Load GCP points` and |saveGCPPointsAs| :sup:`Save GCP points as` buttons to
manage the files.

.. _`georeferencer_transformation`:

Defining the transformation settings
....................................

After you have added your GCPs to the raster image, you need to define the
transformation settings for the georeferencing process.

.. _figure_georeferencer_transform:

.. figure:: img/transformation_settings.png
   :align: center

   Defining the georeferencer transformation settings


Available Transformation algorithms
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Depending on how many ground control points you have captured, you may want
to use different transformation algorithms. Choice of transformation
algorithm is also dependent on the type and quality of input data and the
amount of geometric distortion that you are willing to introduce to the final
result.

Currently, the following :guilabel:`Transformation types` are available:

*  The **Linear** algorithm is used to create a world file and is different
   from the other algorithms, as it does not actually transform the raster.
   This algorithm likely won't be sufficient if you are dealing with scanned
   material.
*  The **Helmert** transformation performs simple scaling and rotation
   transformations.
*  The **Polynomial** algorithms 1-3 are among the most widely used algorithms
   introduced to match source and destination ground control points. The most
   widely used polynomial algorithm is the second-order polynomial transformation,
   which allows some curvature. First-order polynomial transformation (affine)
   preserves collinearity and allows scaling, translation and rotation only.
*  The **Thin Plate Spline** (TPS) algorithm is a more modern georeferencing
   method, which is able to introduce local deformations in the data. This
   algorithm is useful when very low quality originals are being georeferenced.
*  The **Projective** transformation is a linear rotation and translation
   of coordinates.

Define the Resampling method
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The type of resampling you choose will likely depending on your input data
and the ultimate objective of the exercise. If you don't want to change
statistics of the image, you might want to choose 'Nearest neighbour', whereas a
'Cubic resampling' will likely provide a more smoothed result.

It is possible to choose between five different resampling methods:

#. Nearest neighbour
#. Linear
#. Cubic
#. Cubic Spline
#. Lanczos

Define the transformation settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

There are several options that need to be defined for the georeferenced output
raster.

* The |checkbox| :guilabel:`Create world file` checkbox is only available if you
  decide to use the linear transformation type, because this means that the
  raster image actually won't be transformed. In this case, the
  :guilabel:`Output raster` field is not activated, because only a new world file will
  be created.
* For all other transformation types, you have to define an :guilabel:`Output
  raster`. As default, a new file ([filename]_modified) will be created in the
  same folder together with the original raster image.
* As a next step, you have to define the :guilabel:`Target SRS` (Spatial Reference
  System) for the georeferenced raster (see :ref:`label_projections`).
* If you like, you can **generate a pdf map** and also **a pdf report**.
  The report includes information about the used transformation parameters,
  an image of the residuals and a list with all GCPs and their RMS errors.
* Furthermore, you can activate the |checkbox| :guilabel:`Set Target Resolution`
  checkbox and define the pixel resolution of the output raster. Default horizontal
  and vertical resolution is 1.
* The |checkbox| :guilabel:`Use 0 for transparency when needed` can be activated,
  if pixels with the value 0 shall be visualized transparent. In our example
  toposheet, all white areas would be transparent.
* Finally, |checkbox| :guilabel:`Load in QGIS when done` loads the output raster
  automatically into the QGIS map canvas when the transformation is done.

Show and adapt raster properties
................................

Clicking on the :guilabel:`Raster properties` option in the :guilabel:`Settings`
menu opens the :ref:`Layer properties <raster_properties_dialog>` dialog of the
raster file that you want to georeference.

.. _configure_georeferencer:

Configure the georeferencer
...........................

* You can define whether you want to show GCP coordinates and/or IDs.
* As residual units, pixels and map units can be chosen.
* For the PDF report, a left and right margin can be defined and you can also
  set the paper size for the PDF map.
* Finally, you can activate to |checkbox| :guilabel:`Show Georeferencer window docked`.

.. _`georeferencer_running`:

Running the transformation
..........................

After all GCPs have been collected and all transformation settings are defined,
just press the |start| :sup:`Start georeferencing` button to create
the new georeferenced raster.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addGCPPoint| image:: /static/common/mActionAddGCPPoint.png
   :width: 1.5em
.. |addRasterLayer| image:: /static/common/mActionAddRasterLayer.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |deleteGCPPoint| image:: /static/common/mActionDeleteGCPPoint.png
   :width: 1.5em
.. |fullHistogramStretch| image:: /static/common/mActionFullHistogramStretch.png
   :width: 1.5em
.. |gdalScript| image:: /static/common/mActionGDALScript.png
   :width: 1.5em
.. |georefRun| image:: /static/common/mGeorefRun.png
   :width: 1.5em
.. |linkGeorefToQGis| image:: /static/common/mActionLinkGeorefToQGis.png
   :width: 2.5em
.. |linkQGisToGeoref| image:: /static/common/mActionLinkQGisToGeoref.png
   :width: 2.5em
.. |loadGCPpoints| image:: /static/common/mActionLoadGCPpoints.png
   :width: 1.5em
.. |localHistogramStretch| image:: /static/common/mActionLocalHistogramStretch.png
   :width: 1.5em
.. |moveGCPPoint| image:: /static/common/mActionMoveGCPPoint.png
   :width: 1.5em
.. |pan| image:: /static/common/mActionPan.png
   :width: 1.5em
.. |pencil| image:: /static/common/pencil.png
   :width: 1.5em
.. |saveGCPPointsAs| image:: /static/common/mActionSaveGCPpointsAs.png
   :width: 1.5em
.. |start| image:: /static/common/mActionStart.png
   :width: 1.5em
.. |transformSettings| image:: /static/common/mActionTransformSettings.png
   :width: 1.5em
.. |zoomIn| image:: /static/common/mActionZoomIn.png
   :width: 1.5em
.. |zoomLast| image:: /static/common/mActionZoomLast.png
   :width: 1.5em
.. |zoomNext| image:: /static/common/mActionZoomNext.png
   :width: 1.5em
.. |zoomOut| image:: /static/common/mActionZoomOut.png
   :width: 1.5em
.. |zoomToLayer| image:: /static/common/mActionZoomToLayer.png
   :width: 1.5em
