How to add column with area [m²]
================================

Module contributed by Carlos López Quintanilla and Salvatore Fiandaca

.. note:: This chapter shows how to add column with area [m²].

Let's take an example, geopackage with polygon vector:

.. figure:: img/area_field/add_col_a1.png

.. |mActionOpenTable| image:: img/_common/mActionOpenTable.png  

Select the layer (present in the Layer Panel), right mouse button 'Open attributes table' or click on the |mActionOpenTable| or function key F6

.. figure:: img/area_field/add_col_a2.png

.. |mActionCalculateField| image:: img/_common/mActionCalculateField.png  

#. Activate editing;
#. Open Field calculator |mActionCalculateField|
#. Create new field;
#. Type **area** field name;
#. Real output field type;
#. Outlet length 10 and 2;

.. figure:: img/area_field/add_col_a3.png

#. In the search box we type the name of the function: **area**
#. Double click on the **$area** function to add it;
#. OK to execute;

.. figure:: img/area_field/add_col_a4.png

The area column will be added and populated with the **$area** function.
