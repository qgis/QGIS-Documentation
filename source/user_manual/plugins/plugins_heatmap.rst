.. _heatmap_plugin:

Heatmap Plugin
==============


The |heatmap| :sup:`Heatmap` plugin allows to create a heatmap from a point vector map. A heatmap is a raster map showing the density or magnitude of point related information. From the result "hotspots" can easily be identified.


Activate the Heatmap plugin
---------------------------

First this core plugin needs to be activated using the Plugin Manager (see Section 
:ref:`load_core_plugin`). After activation the heatmap icon |heatmap| can be found in the Raster Toolbar. 

Select from menu :menuselection:`View -->` :menuselection:`Toolbars -->` :menuselection:`Raster` to activate the Raster Toolbar when it is not yet activated.


Using the Heatmap plugin
------------------------

The |heatmap| :sup:`Heatmap` toolbutton starts the Dialog of the Heatmap plugin 
(see figure_heatmap_2_).

The dialog has the following options:

* The field :guilabel:`Input Point dialog`: Provides a selection of loaded point 
  vector maps.
* The field :guilabel:`Output Raster`: Using the browser button you select the folder 
  and the name of the output raster the heatmap plugin will generate. It is not 
  necessary to give a file extension 
* The :guilabel:`Output Format` can be selected. Although all formats supported by 
  GDAL can be choosen, GeoTIFF is most in cases the best format to choose. This format 
  offers, for example, support for the creation of pyramids for better perfomance, which 
  lacks for other formats.
* The field :guilabel:`Radius`: can be used to give the radius in meters or mapunit. 
  When the radius is choosen too small you will not get a nice heatmap. In places 
  where more circles around points overlap eachother the brighter hotspots will occur! 
* The field :guilabel:`Decay Ratio`: is used to show with which ratio the fire dies out 
  from the center. when given 0 the heat will be completely extinguished towards at the 
  edge of given Radius of the circel.

When the |checkbox| :guilabel:`Advanced` checkbox is checked it will give acces to 
additional advanced options.

* The fields :guilabel:`Row` and :guilabel:`Column`, can be used to change the size of 
  the output raster.
* The fields :guilabel:`Cell Size X` and :guilabel:`Cell Size Y` influence the pixelsize.

The point vector layer may have attribute fields that can be used to set:

* the radius of an attribute field using :guilabel:`Use Radius from Field`.
* the weight factor of an attribute field using :guilabel:`Use Weight from field`.
  This weight factor will give points more 'heat' when the weight factor is higher.

When the output raster is given, the **[OK]** button can be used to create a heatmap.
The first result is a grey surface that still needs to be given additional treatment to make it a heatmap.


Creating a Heatmap
------------------

We will use in following example the ``airports`` vector point layer from the QGIS 
sample dataset (see :ref:`label_sampledata`).

In figure_heatmap_1_ the airports of Alaska are shown.

.. only:: html

   Figure Heatmap 1

.. _figure_heatmap_1:
.. figure:: /static/user_manual/plugins/heatmap_start.png
   :width: 40em
   :align: center

   Airports of Alaska


#. Select the |heatmap| :sup:`Heatmap` toolbutton. 
   The heatmap dialog starts (see figure_heatmap_2_).
#. In field :guilabel:`Input Point Vector` select ``airpoirt`` from the list of 
   point layers loaded in current project.
#. In field :guilabel:`Output Raster` five the name and location using the browse 
   button |browse| of the output raster. Give the output raster file the 
   name ``heatmap_airports`` to give an file extension is not necessary. 
#. In field :guilabel:`Output Format` choose ``GeoTIFF``.
#. In the field :guilabel:`Radius` give ``1000000`` meters.
#. The original :guilabel:`Decay Ratio` of ``0.1`` is fine.
#. Click on **[OK]**  to create and load the new raster map (see figure_heatmap_3_).


.. only:: html

   Figure Heatmap 2

.. _figure_heatmap_2:
.. figure:: /static/user_manual/plugins/heatmap_dialog.png
   :width: 30em
   :align: center

   The Heatmap Dialog

The result after loading the heatmap is probably not the result which was expected.
It is still a grey even surface not showing any variation.
First some additional configuration of this layer needs to be done to make 
the heatmap present itself. 

.. only:: html

   Figure Heatmap 3

.. _figure_heatmap_3:
.. figure:: /static/user_manual/plugins/heatmap_loaded_grey.png
   :align: center
   :width: 40em


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
   :align: center
   :width: 40em

   Final result of heatmap created of airports of Alaska

