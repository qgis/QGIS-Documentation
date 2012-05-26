<<<<<<< HEAD
.. _`interpol`:

Interpolation Plugin
========================================
=======
.. !TeX  root  =  user_guide.tex

.. _`interpol`:
>>>>>>> upstream/master

Interpolation Plugin
====================

<<<<<<< HEAD
.. % when the revision of a section has been finalized, 
.. % comment out the following line:
.. % \updatedisclaimer

The Interpolation plugin can be used to generate a TIN or IDW interpolation of a 
point vector layer. It is very simple to handle and provides an intuitive 
graphical user interface for creating interpolated raster layers (See Figure 
:ref:`fig:interpolation_dialog`). The plugin requires the following parameters 
to be specified before running:

.. [label=--]

* **Input vector layer**: Specify the input point vector layer(s) from a list 
  of loaded point layers. If several layers are specified, then data from all 
  layers is used for interpolation. Note: It is possible to insert lines or 
  polygons as constraints for the triangulation, by specifying either 
  ``structure lines`` or ``break lines`` in the :menuselection:`Type` dropdown 
  menu.
* **Interpolation attribute**: Select attribute column to be used for 
  interpolation or enable the |checkbox| :guilabel:`Use Z-Coordinate` checkbox 
  to use the layers stored Z values.
* **Interpolation Method**: Select interpolation method. This can be either 
  |selectstring| :guilabel:`Triangulated Irregular Network (TIN)` |ldots| or 
  |selectstring| :guilabel:`Inverse Distance Weighted (IDW)` |ldots|.
* **Number of columns/rows**: Specify the number row and columns for the output 
  raster file.
* **Output file**: Specify a name for the output raster file.

.. \begin{figure}[ht]
..   \centering
..   \includegraphics[clip=true, width=14cm]{interpolate_dialog}
..   \caption{Interpolation Plugin \nixcaption}\label{fig:interpolation_dialog}
.. \end{figure}

.. _`interpolation_usage`:
Using the plugin
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Start QGIS and load an point vector layer (e.g., :file:`elevp.csv`). 
#. Load the Interpolation plugin in the Plugin Manager (see Section  
   :ref:`sec:load_core_plugin`) and click on the |interpolation| 
   :guilabel:`Interpolation` icon which appears in the QGIS toolbar menu. The 
   Interpolation plugin dialog appears as shown in Figure 
   :ref:`fig:interpolation_dialog`.
#. Select an input layer (e.g., |selectstring| :guilabel:`elevp` |ldots|) and 
   column (e.g. :file:`ELEV`) for interpolation.
#. Select an interpolation method (e.g. |selectstring|
   :guilabel:`Triangular interpolation` |ldots|, and specify a cell size of 
   5000 as well as the raster output filename (e.g., :file:`elevation_tin`).
#. Click :guilabel:`OK`.
#. For the current example, double-click :file:`elevation_tin` in the layer 
   list to open the Raster Layer Properties dialog and select |selectstring|
   :guilabel:`Pseudocolor` |ldots| as Color Map in the |tab| 
   :guilabel:`Symbology` tab. Or you can define a new color table as described 
   in Section :ref:`label_rasterprop`.

In Figure :ref:`fig:interpolation_idw` you see the TIN interpolation result with 
a 998 cols x 812 rows (5 km) resolution for the :file:`elevp.csv` data 
visualized using the Pseudocolor color table. The processing only takes a few 
minutes, and covers the northern part of Alaska.

.. \begin{figure}[ht]
..   \centering
..   \includegraphics[clip=true, width=10cm]{interpolate_tin}
..   \caption{Interpolation of elevp data using TIN method \nixcaption}\label{fig:interpolation_idw}
.. \end{figure}

=======

.. when the revision of a section has been finalized, 
.. comment out the following line:
.. \updatedisclaimer

The Interplation plugin can be used to generate a TIN or IDW interpolation of a 
point vector layer. It is very simple to handle and provides an intiuitive graphical 
user interface for creating interpolated raster layers (See Figure `plugins/plugins_interpolation/interpolate_dialog`_).
The plugin requires the following parameters to be specified before running:


.. FIXME need to define rst style for [label=--]
* **Input vector layer**: Specify the input point vector layer(s) from a list of loaded point layers. If several layers are specified, then data from all layers is used for interpolation. Note: It is possible to insert lines or polygons as constraints for the triangulation, by specifying either ``structure lines'' or ``break lines'' in the :menuselection:`Type -->` dropdown menu.
* **Interpolation attribute**: Select attribute column to be used for interpolation or enable the |checkbox| 'Use Z-Coordinate' checkbox to use the layers stored Z values.
* **Interpolation Method**: Select interpolation method. This can be either 'Triangulated Irregular Network (TIN)'|selectstring| or 'Inverse Distance Weighted (IDW)'|selectstring|.
* **Number of columns/rows**: Specify the number row and colums for the output raster file. 
* **Output file**: Specify a name for the output raster file.

.. _`plugins/plugins_interpolation/interpolate_dialog`:

.. figure:: img/en/plugins_interpolation/interpolate_dialog.png
   :align: center
   :width: 40em

   Interpolation Plugin


.. _`interpolation_usage`:

**Using the plugin**

#.  Start QGIS and load an point vector layer (e.g., :file:`elevp.csv`). 
#.  Load the Interpolation plugin in the Plugin Manager (see Section :ref:`plugins/plugins/load_core_plugin`) and click on the               |interpolation|:guilabel:`Interpolation` icon which appears in the QGIS toolbar menu. The Interpolation plugin dialog appears as shown in Figure `plugins/plugins_interpolation/interpolate_dialog`_.
#.  Select an input layer (e.g., 'elevp'|selectstring|) and column (e.g., :file:`ELEV`) for interpolation.
#.  Select an interpolation method (e.g. 'Triangular interpolation'|selectstring|), and specify a cellsize of 5000 as well as the raster output filename (e.g., :file:`elevation\_tin`).
#.  Click :guilabel:`Ok`.
#.  For the current example, double click :file:`elevation\_tin` in the layer list to open the Raster Layer Properties dialog and select 'Pseudocolor'|selectstring| as Color Map in the :guilabel:`Symbology` tab. Or you can define a new color table as described in Section \ref{label_rasterprop}.


In Figure `plugins/plugins_interpolation/interpolate_tin`_ you see the TIN interpolation result with a 998 cols x 812 rows (5 km) resolution for the :file:`elevp.csv` data visualized using the Pseudocolor color table. The processing only takes a few minutes, and covers the northern part of Alaska.

.. _`plugins/plugins_interpolation/interpolate_tin`:

.. figure:: img/en/plugins_interpolation/interpolate_tin.png
   :align: center
   :width: 30em

   Interpolation of elevp data using TIN method 

.. \FloatBarrier
>>>>>>> upstream/master
