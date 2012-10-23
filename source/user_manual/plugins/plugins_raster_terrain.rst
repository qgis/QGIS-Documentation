.. comment out this disclaimer (by putting '.. ' in front of it) if file is uptodate with release

|updatedisclaimer|

.. _`rasterrain`:

Raster Terrain Modelling Plugin
===============================


The Raster Terrain Modelling plugin can be used to calculate the slope, aspect, 
ruggedness, and total curvature for digital elevation models (DEM). It is very 
simple to handle and provides an intuitive graphical user interface for 
creating new raster layers (See Figure_raster_terrain_1_).
The plugin requires the following parameters to be specified before running:

*  **Analysis**: Can be one of slope, aspect, ruggedness, or total curvature.
*  **Input layer**: Specify the input raster from a list of loaded raster 
   layers.
*  **Output layer**: Specify a name and path for the output raster file.
*  **Output format**: Specify a format type for the output raster file. 
   (Default is GeoTiff).



Description of the analysis:

*  **Slope**: Calculates slope angle for each cell in degrees (based on 
   first order derivative estimation).
*  **Aspect**: Exposition (starting with 0 for north direction, in degrees 
   counterclockwise).
*  **Ruggedness factor**: A quantitative measurement of terrain heterogeneity.
*  **Total curvature**: A curvature measure that combines plan- and profile 
   curvature.

.. _figure_raster_terrain_1:

.. only:: html

   **Figure Raster Terrain 1:**

.. figure:: /static/user_manual/plugins/raster_terrain_dialog.png
   :align: center
   :width: 40em

   Raster Terrain Modelling Plugin

.. _`raster_terrain_usage`:

Using the plugin
----------------

#.  Start QGIS and load a DEM raster layer. 
#.  Load the Raster Terrain Modelling plugin in the Plugin Manager see 
    Section :ref:`load_core_plugin` and click on the |raster_terrain| 
    :sup:`Raster Terrain Modelling` icon which appears in the QGIS toolbar 
    menu. The Raster Terrain Modelling plugin dialog appears as shown in 
    Figure_raster_terrain_1_.
#.  Select an analysis method (e.g. :menuselection:`Slope -->`).
#.  Specify an output file path, and an output file type.
#.  Click **[OK]**.



