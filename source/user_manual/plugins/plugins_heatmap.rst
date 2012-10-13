.. _heatmap_plugin:

Heatmap Plugin
==============


The |heatmap| :sup:`Heatmap` plugin allows to create a heatmap from a point vector map. A heatmap is a raster map showing the density or magnitude of point related information. From the result "hotspots" can easily be identified.


How to use the plugin
---------------------

First this core plugin needs to be activated using the Plugin Manager (see Section 
:ref:`load_core_plugin`). After activation the heatmap icon |heatmap| can be found in the Raster Toolbar. Select from menu :menuselection:`View -->` :menuselection:`Toolbars -->` :menuselection:`Raster` to activate the Raster Toolbar when it is not yet activated.

As an example we will use the ``airports`` point vector layer from the QGIS sample dataset (see :ref:`label_sampledata`).

In figure_heatmap_1_ the airports of Alaska are shown which will be used for the example.

.. only:: html

   Figure Heatmap 1

.. figure:: /static/user_manual/plugins/heatmap_start.png
   :width: 40em
   :align: center

   Airports of Alaska

Creating the heatmap

#. Select the |heatmap| :sup:`Heatmap` toolbutton. 
   The heatmap dialog starts (see figure_heatmap_2_).
#. In field :guilabel:`Input Point Vector` select ``airpoirt`` from the list of 
   point layers loaded in current project.
#. In field :guilabel:`Output Raster` select the place and name used to create 
   the output file using the browse button |browse|. Give the output raster file the 
   name ``heatmap_airports`` to give an file extension is not necessary. 
#. In field :guilabel:`Output Format` GeoTIFF is an excellent choice.
#. In the field radius give 1000000 meters for Radius.
#. The original :guilabel:`Decay Ratio` of ``0.1`` is fine
#. Click on **[OK]**  the new raster map is created and loaded (see figure_heatmap_3_).


.. only:: html

   Figure Heatmap 2

.. _figure_heatmap_2:

.. figure:: /static/user_manual/plugins/heatmap_dialog.png
   :width: 25em
   :align: center

   The Heatmap Dialog

The result after loading the heatmap is not the result which was expected.
It is still a grey even surface not showing any variation.
First some additional configuration of this layer needs to be done to make 
the heatmap present itself. 

.. only:: html

   Figure Heatmap 3

.. _figure_heatmap_3:

.. figure:: /static/user_manual/plugins/heatmap_loaded_grey.png
   :width: 40em
   :align: center

   The heatmap after loading looks like a grey surface

# Open the properties dialog of layer ``heatmap_airports`` 

   Select the layer heatmap_airports and click on the rightmouse button, 
   Select :menuselection:`Properties` from the popup menu).

# Select the :guilabel:`Style` tab.
# In section Single band properties chance the field :guilabel:`Color map` from
  ``Grayscale`` to ``Pseudocolor``.
# Select the **[Apply]** button.
# Switch to the :guilabel:`Transparency` tab and move the slider of 
  :guilabel:`Global transparency` to 40%. 
# Select **[OK]** 

The final result is shown in figure_heatmap_4_.

.. only:: html

   Figure Heatmap 4

.. _figure_heatmap_4:

.. figure:: /static/user_manual/plugins/heatmap_loaded_colour.png
   :width: 40em
   :align: center

   Final result of heatmap created of airports of Alaska

