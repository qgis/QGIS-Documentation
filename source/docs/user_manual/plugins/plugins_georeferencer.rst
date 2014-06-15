|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _`georef`:

Georeferencer Plugin
====================

The Georeferencer Plugin is a tool for generating world files for rasters. It
allows you to reference rasters to geographic or projected coordinate systems by
creating a new GeoTiff or by adding a world file to the existing image. The basic
approach to georeferencing a raster is to locate points on the raster for which
you can accurately determine coordinates.

**Features**

.. index::
   single:Georeferencer tools

.. _table_georeferencer_1:

+--------------------------------+----------------------------+-------------------------------+----------------------------+
| Icon                           | Purpose                    | Icon                          | Purpose                    |
+================================+============================+===============================+============================+
+--------------------------------+----------------------------+-------------------------------+----------------------------+
| |mActionAddRasterLayer|        | Open raster                | |mActionStartGeoref|          | Start georeferencing       |
+--------------------------------+----------------------------+-------------------------------+----------------------------+
| |mActionGDALScript|            | Generate GDAL Script       | |mActionloadGCPpoints|        | Load GCP Points            |
+--------------------------------+----------------------------+-------------------------------+----------------------------+
| |mActionSaveGCPpointsAs|       | Save GCP Points As         | |mActionTransformSettings|    | Transformation settings    |
+--------------------------------+----------------------------+-------------------------------+----------------------------+
| |mActionAddGCPPoint|           | Add Point                  | |mActionDeleteGCPPoint|       | Delete Point               |
+--------------------------------+----------------------------+-------------------------------+----------------------------+
| |mActionMoveGCPPoint|          | Move GCP Point             | |mActionPan|                  | Pan                        |
+--------------------------------+----------------------------+-------------------------------+----------------------------+
| |mActionZoomIn|                | Zoom In                    | |mActionZoomOut|              | Zoom Out                   |
+--------------------------------+----------------------------+-------------------------------+----------------------------+
| |mActionZoomToLayer|           | Zoom To Layer              | |mActionZoomLast|             | Zoom Last                  |
+--------------------------------+----------------------------+-------------------------------+----------------------------+
| |mActionZoomNext|              | Zoom Next                  | |mActionLinkGeorefToQGis|     | Link Georeferencer to |qg| |
+--------------------------------+----------------------------+-------------------------------+----------------------------+
| |mActionLinkQGisToGeoref|      | Link |qg| to Georeferencer | |mActionFullHistogramStretch| | Full histogram stretch     |
+--------------------------------+----------------------------+-------------------------------+----------------------------+
| |mActionLocalHistogramStretch| | Local histogram stretch    |                               |                            |
+--------------------------------+----------------------------+-------------------------------+----------------------------+

Table Georeferencer 1: Georeferencer Tools

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
  |qg| map canvas.

The usual procedure for georeferencing an image involves selecting multiple
points on the raster, specifying their coordinates, and choosing a relevant
transformation type. Based on the input parameters and data, the plugin will
compute the world file parameters. The more coordinates you provide, the better
the result will be.

The first step is to start |qg|, load the Georeferencer Plugin (see
:ref:`managing_plugins`) and click on :menuselection:`Raster --> Georeferencer`
, which appears in the |qg| menu bar. The Georeferencer Plugin dialog
appears as shown in figure_georeferencer_1_.

For this example, we are using a topo sheet of South Dakota from SDGS. It can
later be visualized together with the data from the GRASS :file:`spearfish60`
location. You can download the topo sheet here:
http://grass.osgeo.org/sampledata/spearfish_toposheet.tar.gz.

.. _figure_georeferencer_1:

.. only:: html

   **Figure Georeferencer 1:**

.. figure:: /static/user_manual/plugins/georefplugin.png
   :align: center

   Georeferencer Plugin Dialog |nix|


.. _`georeferencer_entering`:

Entering ground control points (GCPs)
......................................

#. To start georeferencing an unreferenced raster, we must load it using the
   |mActionAddRasterLayer| button. The raster will show up in the main working
   area of the dialog. Once the raster is loaded, we can start to enter reference
   points.
#. Using the |mActionAddGCPPoint| :sup:`Add Point` button, add points to the
   main working area and enter their coordinates (see Figure figure_georeferencer_2_).
   For this procedure you have three options:

   - Click on a point in the raster image and enter the X and Y coordinates
     manually.
   - Click on a point in the raster image and choose the |pencil|
     :sup:`From map canvas` button to add the X and Y coordinates with the help of a
     georeferenced map already loaded in the |qg| map canvas.
   - With the |mActionMoveGCPPoint| button, you can move the GCPs in both windows,
     if they are at the wrong place.

#. Continue entering points. You should have at least four points, and the more
   coordinates you can provide, the better the result will be. There are
   additional tools on the plugin dialog to zoom and pan the working area in
   order to locate a relevant set of GCP points.

.. _figure_georeferencer_2:

.. only:: html

   **Figure Georeferencer 2:**

.. figure:: /static/user_manual/plugins/choose_points.png
   :align: center

   Add points to the raster image |nix|


The points that are added to the map will be stored in a separate text file
(:file:`[filename].points`) usually together with the raster image. This allows
us to reopen the Georeferencer plugin at a later date and add new points or delete
existing ones to optimize the result. The points file contains values of the
form: ``mapX, mapY, pixelX, pixelY``. You can use the |mActionloadGCPpoints|
:sup:`Load GCP points` and |mActionSaveGCPPointsAs| :sup:`Save GCP points as` buttons to
manage the files.

.. _`georeferencer_transformation`:

Defining the transformation settings
....................................

After you have added your GCPs to the raster image, you need to define the
transformation settings for the georeferencing process.

.. _figure_georeferencer_3:

.. only:: html

   **Figure Georeferencer 3:**

.. figure:: /static/user_manual/plugins/transformation_settings.png
   :align: center

   Defining the georeferencer transformation settings |nix|


Available Transformation algorithms
...................................

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
   preserves colliniarity and allows scaling, translation and rotation only.
*  The **Thin Plate Spline** (TPS) algorithm is a more modern georeferencing
   method, which is able to introduce local deformations in the data. This
   algorithm is useful when very low quality originals are being georeferenced.
*  The **Projective** transformation is a linear rotation and translation
   of coordinates.

Define the Resampling method
............................

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
..................................

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
  automatically into the |qg| map canvas when the transformation is done.

Show and adapt raster properties
................................

Clicking on the :guilabel:`Raster properties` dialog in the :guilabel:`Settings`
menu opens the raster properties of the layer that you want to georeference.

Configure the georeferencer
...........................

* You can define whether you want to show GCP coordiniates and/or IDs.
* As residual units, pixels and map units can be chosen.
* For the PDF report, a left and right margin can be defined and you can also
  set the paper size for the PDF map.
* Finally, you can activate to |checkbox| :guilabel:`Show Georeferencer window docked`.

.. _`georeferencer_running`:

Running the transformation
..........................

After all GCPs have been collected and all transformation settings are defined,
just press the |mActionStartGeoref| :sup:`Start georeferencing` button to create
the new georeferenced raster.
