|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _heatmap_plugin:

Heatmap Plugin
==============

The `Heatmap` plugin uses Kernel Density Estimation to create a density (heatmap)
raster of an input point vector layer.  The density is calculated based on the
number of points in a location, with larger numbers of clustered points resulting
in larger values. Heatmaps allow easy identification of "hotspots" and
clustering of points.

Activate the Heatmap plugin
---------------------------

First this core plugin needs to be activated using the Plugin Manager (see
:ref:`load_core_plugin`). After activation, the heatmap icon |heatmap|
can be found in the Raster Toolbar, and under the :menuselection:`Raster --> Heatmap`
menu.

Select the menu :menuselection:`View --> Toolbars --> Raster` to show the
Raster Toolbar if it is not visible.

Using the Heatmap plugin
------------------------

Clicking the |heatmap| `Heatmap` tool button opens the Heatmap plugin dialog
(see figure_heatmap_2_).

The dialog has the following options:

* **Input point layer**: Lists all the vector point layers in the current project
  and is used to select the layer to be analysed.
* **Output raster**: Allows you to use the |browsebutton| button to select the folder and
  filename for the output raster the Heatmap plugin generates. A file extension
  is not required.
* **Output format**: Selects the output format. Although all formats supported
  by GDAL can be choosen, in most cases GeoTIFF is the best format to choose.
* **Radius**: Is used to specify the heatmap search radius (or kernel bandwidth) in meters
  or map units. The radius specifies the distance around a point at which the influence
  of the point will be felt. Larger values result in greater smoothing, but smaller
  values may show finer details and variation in point density.

When the |checkbox| :guilabel:`Advanced` checkbox is checked, additional options
will be available:

* **Rows** and **Columns**: Used to change the dimensions of the output raster.
  These values are also linked to the **Cell size X** and **Cell size Y** values.
  Increasing the number of rows or columns will decrease the cell size and increase the
  file size of the output file. The values in Rows and Columns are also linked, so doubling
  the number of rows will automatically double the number of columns and the cell sizes will
  also be halved. The geographical area of the output raster will remain the same!
* **Cell size X** and **Cell size Y**: Control the geographic size of each pixel in the output
  raster. Changing these values will also change the number of Rows and Columns in the output
  raster.

* **Kernel shape**: The kernel shape controls the rate at which the influence of a point
  decreases as the distance from the point increases. Different kernels decay at
  different rates, so a triweight kernel gives features greater weight for distances closer
  to the point then the Epanechnikov kernel does. Consequently, triweight results in "sharper"
  hotspots, and Epanechnikov results in "smoother" hotspots. A number of standard kernel functions
  are available in |qg|, which are described and illustrated on Wikipedia_.

* **Decay ratio**: Can be used with Triangular kernels to further control how heat from
  a feature decreases with distance from the feature.

  - A value of 0 (=minimum) indicates that the heat will be concentrated in the centre of the
    given radius and completely extinguished at the edge.
  - A value of 0.5 indicates that pixels at the edge of the radius will be given half the heat
    as pixels at the centre of the search radius.
  - A value of 1 means the heat is spread evenly over the whole search radius circle. (This
    is equivalent to the 'Uniform' kernel.)
  - A value greater than 1 indicates that the heat is higher towards the edge of the search radius
    than at the centre.

The input point layer may also have attribute fields which can affect how they influence
the heatmap:

* **Use radius from field**: Sets the search radius for each feature from an attribute field in the input layer.
* **Use weight from field**: Allows input features to be weighted by an attribute field. This can be used to
  increase the influence certain features have on the resultant heatmap.

When an output raster file name is specified, the **[OK]** button can be used to create the
heatmap.

Tutorial: Creating a Heatmap
----------------------------

For the following example, we will use the ``airports`` vector point layer from
the |qg| sample dataset (see :ref:`label_sampledata`). Another exellent |qg|
tutorial on making heatmaps can be found at `http://qgis.spatialthoughts.com
<http://qgis.spatialthoughts.com/2012/07/tutorial-making-heatmaps-using-qgis-and.html>`_.

In Figure_Heatmap_1_, the airports of Alaska are shown.

.. _figure_heatmap_1:

.. only:: html

   **Figure Heatmap 1:**

.. figure:: /static/user_manual/plugins/heatmap_start.png
   :align: center

   Airports of Alaska |nix|


#. Select the |heatmap| `Heatmap` tool button to open the Heatmap dialog
   (see Figure_Heatmap_2_).
#. In the :guilabel:`Input point layer` |selectstring| field, select ``airports``
   from the list of point layers loaded in the current project.
#. Specify an output filename by clicking the |browsebutton| button next to the
   :guilabel:`Output raster` field. Enter the filename ``heatmap_airports`` (no
   file extension is necessary).
#. Leave the :guilabel:`Output format` as the default format, ``GeoTIFF``.
#. Change the :guilabel:`Radius` to ``1000000`` meters.
#. Click on **[OK]**  to create and load the airports heatmap (see Figure_Heatmap_3_).

.. _figure_heatmap_2:

.. only:: html

   **Figure Heatmap 2:**

.. figure:: /static/user_manual/plugins/heatmap_dialog.png
   :align: center

   The Heatmap Dialog |nix|

|qg| will generate the heatmap and add the results to your map window. By default, the heatmap
is shaded in greyscale, with lighter areas showing higher concentrations of airports. The heatmap
can now be styled in |qg| to improve its appearance.

.. _figure_heatmap_3:

.. only:: html

   **Figure Heatmap 3:**

.. figure:: /static/user_manual/plugins/heatmap_loaded_grey.png
   :align: center

   The heatmap after loading looks like a grey surface |nix|


#. Open the properties dialog of the ``heatmap_airports`` layer (select the layer
   ``heatmap_airports``, open the context menu with the right mouse button and select
   :guilabel:`Properties`).
#. Select the :guilabel:`Style` tab.
#. Change the :guilabel:`Render type` |selectstring| to 'Singleband pseudocolor'.
#. Select a suitable :guilabel:`Color map` |selectstring|, for instance ``YlOrRed``.
#. Click the **[Load]** button to fetch the minimum and maximum values from the raster,
   then click the **[Classify]** button.
#. Press **[OK]** to update the layer.

The final result is shown in Figure_Heatmap_4_.

.. _figure_heatmap_4:

.. only:: html

   **Figure Heatmap 4:**

.. figure:: /static/user_manual/plugins/heatmap_loaded_colour.png
   :align: center

   Styled heatmap of airports of Alaska |nix|

.. _Wikipedia: http://en.wikipedia.org/wiki/Kernel_(statistics)#Kernel_functions_in_common_use
