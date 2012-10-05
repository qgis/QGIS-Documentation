
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
  constraints for the triangulation, by specifying either "structure lines" or 
  "break lines" in the :menuselection:`Type -->` dropdown menu.
* **Interpolation attribute**: Select attribute column to be used for interpolation 
  or enable the |checkbox| :guilabel:`Use Z-Coordinate` checkbox to use the layers stored Z values.
* **Interpolation Method**: Select interpolation method. This can be either 
  :guilabel:`Triangulated Irregular Network (TIN)` |selectstring| or 
  :guilabel:`Inverse Distance Weighted (IDW)` |selectstring|.
* **Number of columns/rows**: Specify the number row and colums for the output raster file. 
* **Output file**: Specify a name for the output raster file.

.. _figure_interpolation_1:

.. figure:: img/en/plugins_interpolation/interpolate_dialog.png
   :align: center
   :width: 40em

   Figure Interpolation 1: Interpolation Plugin |nix|


.. _`interpolation_usage`:

**Using the plugin**

#.  Start QGIS and load a point vector layer (e.g., :file:`elevp.csv`). 
#.  Load the Interpolation plugin in the Plugin Manager (see Section :ref:`load_core_plugin`) 
    and click on the |interpolation| :sup:`Interpolation` icon which appears in the QGIS 
    toolbar menu. The Interpolation plugin dialog appears as shown in Figure_interpolation_1_.
#.  Select an input layer (e.g., :guilabel:`elevp` |selectstring|) and column (e.g., ``ELEV``) 
    for interpolation.
#.  Select an interpolation method (e.g. :guilabel:`Triangular interpolation` |selectstring|), 
    and specify a cellsize of 5000 as well as the raster output filename (e.g., :file:`elevation\_tin`).
#.  Click **[OK]**.
#.  For the current example, double click :file:`elevation\_tin` in the layer list to open the 
    Raster Layer Properties dialog and select :guilabel:`Pseudocolor` |selectstring| as Color Map 
    in the :guilabel:`Symbology` tab. Or you can define a new color table as described in section 
    :ref:`working_with_raster`.


In figure_interpolation_2_ you see the TIN interpolation result with a 998 cols x 812 rows (5 km) 
resolution for the :file:`elevp.csv` data visualized using the Pseudocolor color table. 
The processing only takes a few minutes, and covers the northern part of Alaska.

.. _figure_interpolation_2:

.. figure:: img/en/plugins_interpolation/interpolate_tin.png
   :align: center
   :width: 30em

   Figure Interpolation 2: Interpolation of elevp data using TIN method |nix|


