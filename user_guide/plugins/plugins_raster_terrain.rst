..  !TeX  root  =  user_guide.tex

.. _`rasterrain`:

Raster Terrain Modelling Plugin
===============================


.. when the revision of a section has been finalized, 
.. comment out the following line:
.. \updatedisclaimer

The Raster Terrain Modelling plugin can be used to calculate the slope, aspect, 
ruggedness, and total curvature for digital elevation models (DEM). It is very 
simple to handle and provides an intiuitive graphical user interface for 
creating new raster layers (See Figure \ref{fig:raster_terrain_dialog}).
The plugin requires the following parameters to be specified before running:

.. FIXME: need to define rst style for [label=--]
*  **Analysis**: Can be one of slope, aspect, ruggedness, or total curvature.
*  **Input layer**: Specify the input raster from a list of loaded raster layers.
*  **Output layer**: Specify a name and path for the output raster file.
*  **Output format**: Specify a format type for the output raster file. (Default is GeoTiff).



Description of the analysis:

.. FIXME: need to define rst style for [label=--]
*  **Slope**: Calculates slope angle for each cell in degrees (based on first order derivative estimation).
*  **Aspect**: Exposition (starting with 0 for north direction, in degrees counterclockwise).
*  **Ruggedness factor**: A quantitative measurement of terrain heterogeneity.
*  **Total curvature**: A curvature measure that combines plan- and profile curvature.

.. _ `raster_terrain_dialog`:
.. figure:: img/en/plugins_raster_terrain/raster_terrain_dialog.png
   :align: center
   :width: 40em

Raster Terrain Modelling Plugin

.. Using the plugin}\label{raster_terrain_usage

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




  #.  Start QGIS and load a DEM raster layer. 
  #.  Load the Raster Terrain Modelling plugin in the Plugin Manager (see Section 
      \ref{sec:load_core_plugin}) and click on the \toolbtntwo{raster_terrain}{Raster Terrain
      Modelling} icon which appears in the QGIS toolbar menu. The Raster Terrain Modelling plugin dialog
      appears as shown in Figure \ref{fig:raster_terrain_dialog}.
  #.  Select an analysis method (e.g. \dropmenuopt{Slope}).
  #.  Specify an output file
      path, and an output file type.
  #.  Click \button{Ok}.



\FloatBarrier
