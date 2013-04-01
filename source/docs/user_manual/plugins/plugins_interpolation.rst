.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _`interpol`:

Interpolation Plugin
====================

The Interplation plugin can be used to generate a TIN or IDW interpolation of a
point vector layer. It is very simple to handle and provides an intuitive graphical
user interface for creating interpolated raster layers (See Figure_interpolation_1_).
The plugin requires the following parameters to be specified before running:

* **Input vector layer**: Specify the input point vector layer(s) from a list of
  loaded point layers. If several layers are specified, then data from all layers
  is used for interpolation. Note: It is possible to insert lines or polygons as
  constraints for the triangulation, by specifying either "points", "structure
  lines" or "break lines" in the :guilabel:`Type` |selectstring| combobox.
* **Interpolation attribute**: Select attribute column to be used for interpolation
  or enable the |checkbox| :guilabel:`Use Z-Coordinate` checkbox to use the layers
  stored Z values.
* **Interpolation Method**: Select interpolation method. This can be either
  'Triangulated Irregular Network (TIN)' or 'Inverse Distance Weighted (IDW)'.
* **Number of columns/rows**: Specify the number row and colums for the output
  raster file.
* **Output file**: Specify a name for the output raster file.

.. _figure_interpolation_1:

.. only:: html

   **Figure Interpolation 1:**

.. figure:: /static/user_manual/plugins/interpolate_dialog.png
   :align: center
   :width: 30em

   Interpolation Plugin |nix|


.. _`interpolation_usage`:

Using the plugin
----------------

#. Start QGIS and load a point vector layer (e.g., :file:`elevp.csv`).
#. Load the Interpolation plugin in the Plugin Manager (see Section
   :ref:`load_core_plugin`) and click on the |raster-interpolate| :sup:`Interpolation`
   icon which appears in the QGIS toolbar menu. The Interpolation plugin dialog
   appears as shown in Figure_interpolation_1_.
#. Select an input layer (e.g., :guilabel:`elevp` |selectstring|) and column
   (e.g., ``ELEV``) for interpolation.
#. Select an interpolation method (e.g. 'Triangulated Irregular Network (TIN)'),
   and specify a cellsize of 5000 as well as the raster output filename (e.g.,
   :file:`elevation_tin`).
#. Click **[OK]**.
#. For the current example, double click :file:`elevation_tin` in the layer list
   to open the raster :guilabel:`Layer Properties` dialog and select 'Pseudocolor'
   as :guilabel:`Color Map` |selectstring| in the :guilabel:`Symbology` tab. Or
   you can define a new color table as described in section :ref:`working_with_raster`.
