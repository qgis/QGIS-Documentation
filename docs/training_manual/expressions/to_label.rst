How to label using geometry
===========================

Module contributed by Carlos López Quintanilla and Salvatore Fiandaca

.. note:: This chapter shows how to label using geometry.

The geometry attribute is the only field not visible in the attribute table, but there is !!!
The geometry is expressed in a way that is not understandable by man and therefore it is avoided to show it, this attribute brings with it other implicit attributes to the geometry itself such as:

* in the case of geometry (MULTI)POINT(ZM): the x, y, z, m coordinates;
* in the case of geometry (MULTI)LINESTRING(ZM): length of the line and coordinates of the nodes/vertices;
* in the case of geometry (MULTI)POLYGON(ZM): area, perimeter and coordinates of the vertex;

The characteristics can always be recalled (if present, that is, if it has a Z or m) and therefore they do not need to be explicitly stated, indeed if explicit they create a redontacted dataset.

One way to recall them is through labeling:
* case (MULTI)POINT(ZM):

Expression to be written in the field calculator

::

   'x= ' || to_int($x)   || '\n'  || 
   'y= ' || to_int($y)   || '\n'  || 
   'z= ' || z($geometry) || '\n'  || 
   'm= ' || m($geometry)

.. figure:: img/to_label/etichette1.png



.. |mActionOpenTable| image:: img/_common/mActionOpenTable.png  

Select the layer (present in the Layer Panel), right mouse button 'Open attributes table' or click on the |mActionOpenTable| or function key F6


.. |mActionCalculateField| image:: img/_common/mActionCalculateField.png  

#. Activate editing;
#. Open Field calculator |mActionCalculateField|
#. Create Virtual field and type **height**;
#. Real output field type and length 10 and 2;
#. Search the function: **z**
#. Double click on the **z** function to add it;
#. Add the function **start_point** and then **$geometry** as arguments to **z** 
#. **z(start_point($geometry))**;
#. OK to execute;

.. figure:: img/dimension_z_field/quotaz2.png

The **height** column populated will be added

.. note:: 
#. In case of PointZ → **z($geometry)**
#. In case of (Multi) LinestringZ → **z(start_point($geometry))** for contour line;
#. In case of PoligonZ **z(point_n($geometry, 1))**
