|updatedisclaimer|

.. _`rasterrain`:

Raster Terrain Analysis Plugin
==============================

|dem_analysis| The Raster Terrain Analysis Plugin can be used to calculate the
slope, aspect, hillshade, ruggedness index and relief for digital elevation
models (DEM). It is very simple to handle and provides an intuitive graphical
user interface for creating new raster layers (see Figure_raster_terrain_1_).

Description of the analysis:

* **Slope**: Calculates the slope angle for each cell in degrees (based on first-
  order derivative estimation).
* **Aspect**: Exposition (starting with 0 for north direction, in degrees
  counterclockwise).
* **Hillshade**: Creates a shaded map using light and shadow to provide a more
  three-dimensional appearance for a shaded relief map.
* **Ruggedness Index**: A quantitative measurement of terrain heterogeneity as
  described by Riley et al. (1999). It is calculated for every location by
  summarizing the change in elevation within the 3x3 pixel grid.
* **Relief**: Creates a shaded relief map from digital elevation data.
  Implemented is a method to choose the elevation colors by analysing the frequency
  distribution.

.. _figure_raster_terrain_1:

.. only:: html

   **Figure Raster Terrain 1:**

.. figure:: /static/user_manual/plugins/raster_terrain_dialog.png
   :align: center

   Raster Terrain Modelling Plugin (slope calculation)

.. _`raster_terrain_usage`:

Using the plugin
----------------

#. Start |qg| and load the :file:`gtopo30` raster layer from the GRASS sample
   location.
#. Load the Raster Terrain Analysis plugin in the Plugin Manager (see
   :ref:`managing_plugins`).
#. Select an analysis method from the menu (e.g., :menuselection:`Raster --> Terrain Analysis -->
   Slope`). The :guilabel:`Slope` dialog appears as shown in Figure_raster_terrain_1_.
#. Specify an output file path, and an output file type.
#. Click **[OK]**.
