.. comment out this disclaimer (by putting '.. ' in front of it) if file is uptodate with release
|updatedisclaimer|

.. _sec_raster_calc:

Raster Calculator
=================

.. index:: Raster_Calculator

The :menuselection:`Raster Calculator` in the :menuselection:`Layer` menu 
(see figure_raster_2_) allows to perform calculations on basis of existing 
raster pixel values. 
The results are written to a new raster layer with a GDAL supported format. 

.. _figure_raster_2:

.. only:: html

   **Figure Raster 2:**

.. figure:: /static/user_manual/working_with_raster/raster_calculator.png
   :align: center
   :width: 38em

   Raster Calculator |nix|


The **Fields list** contains all loaded raster layers that can be used. 
To add a raster to the raster calculator expression field, double
click its name in the Fields list. You can then use the operators to construct 
calculation expressions or you can just type it into the box.

In the **Result layer** section you have to define an output layer. You can 
then define the extent of the calculation area based on an input raster layer or 
based on X,Y coordinates and on Columns and Rows to set the resolution of the 
output layer. If the input layer has a different resolution, the values will be 
resampled with nearest neighbor algorithm.  

The **Operators section** contains all usable operators. To add an operator
to the raster calculator expression box, click the appropriate button. Mathematical
calculations ( + , - , * , ... ) and trigonometric functions ( sin, cos, tan, ... ) 
are available. Stay tuned for more operators to come!

With the |checkbox| :guilabel:`Result to project` checkbox the result layer will 
automatically added to the legend area and can be visualized. 

