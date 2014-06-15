|updatedisclaimer|

.. _`interpol`:

Interpolation Plugin
====================

The Interplation plugin can be used to generate a TIN or IDW interpolation of a
point vector layer. It is very simple to handle and provides an intuitive graphical
user interface for creating interpolated raster layers (see Figure_interpolation_1_).
The plugin requires the following parameters to be specified before running:

* Input **Vector layers**: Specify the input point vector layer(s) from a list of
  loaded point layers. If several layers are specified, then data from all layers
  is used for interpolation. Note: It is possible to insert lines or polygons as
  constraints for the triangulation, by specifying either "points", "structure
  lines" or "break lines" in the :guilabel:`Type` |selectstring| combo box.
* **Interpolation attribute**: Select the attribute column to be used for interpolation
  or enable the |checkbox| :guilabel:`Use Z-Coordinate` checkbox to use the layer's
  stored Z values.
* **Interpolation Method**: Select the interpolation method. This can be either
  'Triangulated Irregular Network (TIN)' or 'Inverse Distance Weighted (IDW)'.
* **Number of columns/rows**: Specify the number of rows and columns for the output
  raster file.
* **Output file**: Specify a name for the output raster file.
* |checkbox| :guilabel:`Add result to project` to load the result into the map canvas.

.. _figure_interpolation_1:

.. only:: html

   **Figure Interpolation 1:**

.. figure:: /static/user_manual/plugins/interpolate_dialog.png
   :align: center

   Interpolation Plugin |nix|


.. _`interpolation_usage`:

Using the plugin
----------------

#. Start |qg| and load a point vector layer (e.g., :file:`elevp.csv`).
#. Load the Interpolation plugin in the Plugin Manager (see
   :ref:`managing_plugins`) and click on the :menuselection:`Raster --> Interpolation -->` |raster-interpolate| :guilabel:`Interpolation`
   , which appears in the |qg| menu bar. The Interpolation plugin dialog
   appears as shown in Figure_interpolation_1_.
#. Select an input layer (e.g., :guilabel:`elevp` |selectstring|) and column
   (e.g., ``ELEV``) for interpolation.
#. Select an interpolation method (e.g., 'Triangulated Irregular Network (TIN)'),
   and specify a cell size of 5000 as well as the raster output filename (e.g.,
   :file:`elevation_tin`).
#. Click **[OK]**.
