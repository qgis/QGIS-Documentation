.. only:: html

   |updatedisclaimer|

Interpolation
=============

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgisheatmapkerneldensityestimation:

Heatmap (kernel density estimation)
-----------------------------------
Creates a density (heatmap) raster of an input point vector layer using kernel
density estimation.

The density is calculated based on the number of points in a location, with larger
numbers of clustered points resulting in larger values. Heatmaps allow easy identification
of *hotspots* and clustering of points.


Parameters
..........

``Point layer`` [vector: point]
  Point vector layer to use for the heatmap

``Radius (layer units)`` [number]
  Heatmap search radius (or kernel bandwidth) in map units. The radius
  specifies the distance around a point at which the influence of the point will
  be felt.
  Larger values result in greater smoothing, but smaller values may show finer
  details and variation in point density.

``Output raster size`` [number]
  Allows to add the output heatmap raster layer size by specifying the rows and columns
  **or** the X and Y pixel size.

  Increasing the number of rows or columns will decrease the cell size and increase
  the file size of the output file. At the same time, the values in ``Rows`` and
  ``Columns`` will also be updated, so doubling the number of rows will automatically
  double the number of columns and the cell sizes will also be halved.
  The extent of the output raster will remain the same.

``Radius from field`` [tablefield: numeric]
  Optional

  Sets the search radius for each feature from an attribute field in the input layer.

``Weight from field`` [tablefield: numeric]
  Optional

  Allows input features to be weighted by an attribute field. This can be used to
  increase the influence certain features have on the resultant heatmap.

``Kernel shape`` [selection]
  Controls the rate at which the influence of a point decreases as the distance
  from the point increases. Different kernels decay at different rates, so a triweight
  kernel gives features greater weight for distances closer to the point then the
  Epanechnikov kernel does. Consequently, triweight results in “sharper” hotspots
  and Epanechnikov results in “smoother” hotspots.

  There are many shapes available (please see the `Wikipedia page <https://en.wikipedia.org/wiki/Kernel_(statistics)#Kernel_functions_in_common_use>`_
  for further information):

  * Quartic
  * Triangular
  * Uniform
  * Triweight
  * Epanechnikov

  Default: *Quartic*

``Decay ratio (Triangular kernels only)`` [number]
  Optional

  Can be used with Triangular kernels to further control how heat from a feature
  decreases with distance from the feature.

  * A value of 0 (=minimum) indicates that the heat will be concentrated in the
    center of the given radius and completely extinguished at the edge.
  * A value of 0.5 indicates that pixels at the edge of the radius will be given
    half the heat as pixels at the center of the search radius.
  * A value of 1 means the heat is spread evenly over the whole search radius circle.
    (This is equivalent to the ‘Uniform’ kernel.)
  * A value greater than 1 indicates that the heat is higher towards the edge of
    the search radius than at the center.

``Output value scaling`` [selection]
  Allow to change the values of the output heatmap raster.

  Options:

  * Raw
  * Scaled

  Default: *Raw*

Output
......
``Heatmap`` [raster]
  Raster layer with kernel density values


Example: Creating a Heatmap
...........................
For the following example, we will use the ``airports`` vector point layer from
the QGIS sample dataset (see :ref:`label_sampledata`). Another excellent QGIS
tutorial on making heatmaps can be found at `http://qgistutorials.com
<http://www.qgistutorials.com/en/docs/creating_heatmaps.html>`_.

In Figure_Heatmap_data_processing_, the airports of Alaska are shown.

.. _figure_heatmap_data_processing:

.. figure:: img/heatmap_start.png
   :align: center

   Airports of Alaska


#. Open the Heatmap algorithm from the Interpolation group
#. In the :guilabel:`Point layer` |selectString| field, select ``airports``
   from the list of point layers loaded in the current project.
#. Change the :guilabel:`Radius` to ``1000000`` meters.
#. Change the :guilabel:`Pixel size X` to ``1000``. The :guilabel:`Pixel size Y`,
    :guilabel:`Rows` and :guilabel:`Columns` will be automatically updated.
#. Click on **[Run in Background]**  to create and load the airports heatmap (see Figure_Heatmap_created_processing_).

.. _figure_heatmap_settings_processing:

.. figure:: img/heatmap_dialog.png
   :align: center

   The Heatmap Dialog

QGIS will generate the heatmap and add the results to your map window. By default, the heatmap
is shaded in greyscale, with lighter areas showing higher concentrations of airports. The heatmap
can now be styled in QGIS to improve its appearance.

.. _figure_heatmap_created_processing:

.. figure:: img/heatmap_loaded_grey.png
   :align: center

   The heatmap after loading looks like a grey surface


#. Open the properties dialog of the ``heatmap_airports`` layer (select the layer
   ``heatmap_airports``, open the context menu with the right mouse button and select
   :guilabel:`Properties`).
#. Select the :guilabel:`Symbology` tab.
#. Change the :guilabel:`Render type` |selectString| to 'Singleband pseudocolor'.
#. Select a suitable :guilabel:`Color map` |selectString|, for instance ``YlOrRed``.
#. Click the **[Classify]** button.
#. Press **[OK]** to update the layer.

The final result is shown in Figure_Heatmap_styled_processing_.

.. _figure_heatmap_styled_processing:

.. figure:: img/heatmap_loaded_colour.png
   :align: center

   Styled heatmap of airports of Alaska

.. _Wikipedia: http://en.wikipedia.org/wiki/Kernel_(statistics)#Kernel_functions_in_common_use


.. _qgisidwinterpolation:

IDW Interpolation
-----------------
Generates an Inverse Distance Weighted (IDW) interpolation of a point vector layer.

Sample points are weighted during interpolation such that the influence of one point
relative to another declines with distance from the unknown point you want to create.

The IDW interpolation method also has some disadvantages: the quality of the interpolation
result can decrease, if the distribution of sample data points is uneven.

Furthermore, maximum and minimum values in the interpolated surface can only occur
at sample data points.

Parameters
..........

``Vector layer`` [vector: point]
  Point vector layer to use for the interpolation

``Interpolation attribute`` [tablefield: numeric]
  Field used for the interpolation. Once you have chosen the layer and the field
  click on the |signPlus| button to add the layer and the field to the list.
  Click on the |signMinus| button to remove the layer from the list.
  It is possible to insert lines or polygons as constraints for the interpolation,
  by specifying either ``Points``, ``Structure lines`` or ``Break lines`` in the
  ``Type`` column of the table.

``Use Z-coordinate for interpolation`` [checkbox]
  Uses the layer's stored Z values

``Distance coefficient Power`` [number]
  Sets the distance coefficient for the interpolation

  Default: *2.0*

``Number of columns`` [number]
  Total number of columns of the output raster layer.

``Number of rows`` [number]
  Total number of rows of the output raster layer.

``Extent (xmin, xmax, ymin, ymax)`` [extent]
  Extent of the output raster layer. You have to declare the output extent by
  either choosing it from the map canvas, selecting it from another layer or type
  it manually.

Output
......
``Interpolated`` [raster]
  Raster layer of interpolated values


.. _qgistininterpolation:

TIN Interpolation
-----------------
Generates a Triangulated Irregular Network (TIN) interpolation of a point vector layer.

With the TIN method you can create a surface formed by triangles of nearest neighbor
points. To do this, circumcircles around selected sample points are created and
their intersections are connected to a network of non overlapping and as compact
as possible triangles. The resulting surfaces are not smooth.

The algorithm creates both the raster layer of the interpolated values and the
vector line layer with the triangulation boundaries.

Parameters
..........

``Vector layer`` [vector: point]
  Point vector layer to use for the interpolation

``Interpolation attribute`` [tablefield: numeric]
  Field used for the interpolation. Once you have chosen the layer and the field
  click on the |signPlus| button to add the layer and the field to the list.
  Click on the |signMinus| button to remove the layer from the list.
  It is possible to insert lines or polygons as constraints for the triangulation,
  by specifying either ``Points``, ``Structure lines`` or ``Break lines`` in the
  ``Type`` column of the table.

``Use Z-coordinate for interpolation`` [checkbox]
  Uses the layer's stored Z values

``Interpolation method`` [selection]
  There are two different choices:

  * Linear
  * Clough-Toucher (cubic)

  Default: *Linear*

``Number of columns`` [number]
  Total number of columns of the output raster layer.

``Number of rows`` [number]
  Total number of rows of the output raster layer.

``Extent (xmin, xmax, ymin, ymax)`` [extent]
  Extent of the output raster layer. You have to declare the output extent by
  either choosing it from the map canvas, selecting it from another layer or type
  it manually.

Output
......
``Interpolated`` [raster]
  Raster layer of triangulated values

``Triangulation`` [vector: lines]
  Triangulation lines as vector layer


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
