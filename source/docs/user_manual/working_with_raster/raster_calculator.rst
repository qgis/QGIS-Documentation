.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _sec_raster_calc:

Raster Calculator
=================

.. index:: Raster_Calculator

The :menuselection:`Raster Calculator` in the :menuselection:`Raster` menu 
(see figure_raster_2_) allows to perform calculations on basis of existing 
raster pixel values. 
The results are written to a new raster layer with a GDAL supported format. 

.. _figure_raster_2:

.. only:: html

   **Figure Raster 2:**

.. figure:: /static/user_manual/working_with_raster/raster_calculator.png
   :align: center
   :width: 30em

   Raster Calculator |nix|


The **Raster bands** list contains all loaded raster layers that can be used. 
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

With the |checkbox| :guilabel:`Add result to project` checkbox the result layer will 
automatically added to the legend area and can be visualized.


Examples
--------

**Convert elevation values from meter to feet**

Creating an elevation raster feet from a raster in meter, you need to use the 
conversion factor for meters to feet: 3.28. The expression is:

::

 elevation@1 * 3.28

**Using a mask**

If you want to mask out parts of a raster, because you are only interested in 
elevations above 0 meter, you can use following expression to create a mask 
and apply the result to a raster in one step.

::

  (elevation@1 >= 0) * elevation@1

For every cell greater than or equal to 0, set its value to 1, otherwise set 
it to 0. This creates the mask on the fly.


**Replace values with conditional statements**

::

  le( elevation@1, 50, 200 )

All cells in the elevation raster with a value less or equal (le) then 50 will 
be replaced with the value 200. 

::

  eq( elevation@1, raster@4, 150 )

All cells in the elevation raster with value equal (eq) to the appropriate pixels 
in fourth band of the layer raster will be replaced with the value 150.

::

  gt( elevation@1, raster@4, baselayer@2 )

All cells in the elevation raster with value greater than (gt) the appropriate 
pixels in fourth band of the layer raster will be replaced with the appropriate 
pixels from the second band of the baselayer raster. 

Available conditional statements are:

::

  lt()	-> less than
  le()	-> less or equal
  gt()  -> greater than
  ge()  -> greater or equal
  eq()  -> equal
  ne()  -> not equal









