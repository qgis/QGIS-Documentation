.. comment out this disclaimer (by putting '.. ' in front of it) if file is uptodate with release
|updatedisclaimer|

.. _heatmap_plugin:

Heatmap Plugin
==============


The |heatmap| :sup:`Heatmap` plugin allows to create a heatmap from a point
vector map. A heatmap is a raster map showing the density or magnitude of point
related information. From the result "hotspots" can easily be identified.


Activate the Heatmap plugin
---------------------------

First this core plugin needs to be activated using the Plugin Manager (see
Section :ref:`load_core_plugin`). After activation the heatmap icon |heatmap|
can be found in the Raster Toolbar. 

Select from menu :menuselection:`View -->` :menuselection:`Toolbars -->` :menuselection:`Raster`
to activate the Raster Toolbar when it is not yet activated.


Using the Heatmap plugin
------------------------

The |heatmap| :sup:`Heatmap` toolbutton starts the Dialog of the Heatmap plugin 
(see figure_heatmap_2_).

The dialog has the following options:

* **Input Point dialog**: Provides a selection of loaded point vector maps.
* **Output Raster**: Using the browser button you select the folder 
  and the name of the output raster the heatmap plugin will generate. It is not 
  necessary to give a file extension 
* **Output Format**: Selection of the output format. Although all formats supported by 
  GDAL can be choosen, GeoTIFF is most in cases the best format to choose. This format 
  offers, for example, support for the creation of pyramids for better perfomance, which 
  lacks for other formats.
* **Radius**: can be used to give the radius in meters or mapunit. 
  When the radius is choosen too small you will not get a nice heatmap. In places 
  where more circles around points overlap eachother the brighter hotspots will occur! 
* **Decay Ratio**: is used to show with which ratio the heat dies out from the center. 
  
  * When 0 is given (=minimum) the heat will concentrated in the centre of given radius 
    and be completely extinguished at the edge.  
  * When 10 is given (=maximum) the heat is concentrated at the edge and in the centre 
    it is completely extinguished. Higher given values are allowed but have no effect.
  * When 1 is given the heat is spread evenly over the whole circel.
  * When a negative Decay Ratio is given you will create a Coolmap instead of a Heatmap!


When the |checkbox| :guilabel:`Advanced` checkbox is checked it will give acces to 
additional advanced options.

* **Row** and **Column**, can be used to change the pixelsize of the output raster.
  More rows and colums means a smaller pixelsize and the size of the output file will 
  become bigger and processing a bit slower.
  When doubling the number of rows this will automatically double the size of Columns 
  and the cell sizes will also be halved. The area of the output raster will 
  remain the same! 
* **Cell Size X** and **Cell Size Y** influence the pixelsize of the output raster and 
  will also change the rows and columns.

The point vector layer may have attribute fields that can be used to create a heatmap:

* **Use Radius from Field**: the radius set from an attribute field.
* **Use Weight from field**: the weight factor set from an attribute field. 

When the output raster is given, the **[OK]** button can be used to create a heatmap.
The first result is a grey surface that still needs to be given additional treatment to make it a heatmap.

.. warning:: **Changing the raster size properties**

   When changing the raster size properties, this also changes the resulting output.
   The hotspot areas will become bigger. 

Creating a Heatmap
------------------

For the following example, we will use the ``airports`` vector point layer from the QGIS 
sample dataset (see :ref:`label_sampledata`). Another exellent QGIS tutorial on making 
heatmaps can be found on `http://qgis.spatialthoughts.com <http://qgis.spatialthoughts.com/2012/07/tutorial-making-heatmaps-using-qgis-and.html>`_.

In Figure_Heatmap_1_ the airports of Alaska are shown.

.. only:: html

   Figure Heatmap 1


.. _figure_heatmap_1:
.. figure:: /static/user_manual/plugins/heatmap_start.png
   :width: 40em
   :align: center

   Airports of Alaska |osx|


#. Select the |heatmap| :sup:`Heatmap` toolbutton. 
   The heatmap dialog starts (see Figure_Heatmap_2_).
#. In field :guilabel:`Input Point Vector` select ``airpoirt`` from the list of 
   point layers loaded in current project.
#. In field :guilabel:`Output Raster` five the name and location using the browse 
   button |browsebutton| of the output raster. Give the output raster file the 
   name ``heatmap_airports`` to give an file extension is not necessary. 
#. In field :guilabel:`Output Format` choose ``GeoTIFF``.
#. In the field :guilabel:`Radius` give ``1000000`` meters.
#. The original :guilabel:`Decay Ratio` of ``0.1`` is fine.
#. Click on **[OK]**  to create and load the new raster map (see Figure_Heatmap_3_).

.. only:: html

   Figure Heatmap 2


.. _figure_heatmap_2:
.. figure:: /static/user_manual/plugins/heatmap_dialog.png
   :width: 30em
   :align: center

   The Heatmap Dialog |osx|

The result after loading the heatmap is probably not the result which was expected.
It is still a grey even surface not showing any variation.
First some additional configuration of this layer needs to be done to make 
the heatmap present itself. 

.. only:: html

   Figure Heatmap 3


.. _figure_heatmap_3:
.. figure:: /static/user_manual/plugins/heatmap_loaded_grey.png
   :width: 40em
   :align: center

   The heatmap after loading looks like a grey surface |osx|


#. Open the properties dialog of layer ``heatmap_airports`` 

   Select the layer heatmap_airports and click on the rightmouse button, 
   Select :menuselection:`Properties` from the popup menu).

#. Select the :guilabel:`Style` tab.
#. In section Single band properties chance the field :guilabel:`Color map` from
   ``Grayscale`` to ``Pseudocolor``.
#. Select the **[Apply]** button.
#. Switch to the :guilabel:`Transparency` tab and move the slider of 
   :guilabel:`Global transparency` to 40%. 
#. Select **[OK]** 

The final result is shown in Figure_Heatmap_4_.

.. only:: html

   Figure Heatmap 4


.. _figure_heatmap_4:
.. figure:: /static/user_manual/plugins/heatmap_loaded_colour.png
   :width: 40em
   :align: center

   Final result of heatmap created of airports of Alaska |osx|

