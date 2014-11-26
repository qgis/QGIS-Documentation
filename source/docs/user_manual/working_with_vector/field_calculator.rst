|updatedisclaimer|

.. index:: Field_Calculator, Calculator_Field, Derived_Fields

.. _vector_field_calculator:

Field Calculator
================

The |mActionCalculateField| :sup:`Field Calculator` button in the attribute
table allows you to perform calculations on the basis of existing attribute values or
defined functions, for instance, to calculate length or area of geometry features. The
results can be written to a new attribute field, a virtual field, or 
they can be used to update values in an existing field.

.. tip:: **Virtual Fields**

   * Virtual fields are not permanent and are not saved.
   * To make a field virtual it must be done when the field is made.

The field calculator is now available on any layer that supports edit. 
When you click on the field calculator icon the dialog opens (see 
figure_attributes_3_). If the layer is not in edit mode, a warning is 
displayed and using the field calculator will cause the layer to be put in 
edit mode before the calculation is made.

The quick field calculation bar in top of the attribute table is only 
visible if the layer is editable. 

In quick field calculation bar, you first select the existing field name then open the 
expression dialog to create your expression or write it directly in the field then click 
on **Update All** button.

In the field calculator dialog, you first must select whether you want to only update selected
features, create a new attribute field where the results of the calculation will
be added or update an existing field.

.. _figure_attributes_3:

.. only:: html

   **Figure Attributes 3:**

.. figure:: /static/user_manual/working_with_vector/fieldcalculator.png
   :align: center

   Field Calculator |nix|

If you choose to add a new field, you need to enter a field name, a field type
(integer, real or string), the total field width, and the field precision (see
figure_attributes_3_). For example, if you choose a field width of 10 and a field
precision of 3, it means you have 6 digits before the dot, then the dot and another
3 digits for the precision.

A short example illustrates how the field calculator works. We want to
calculate the length in km of the ``railroads`` layer from the |qg| sample dataset:

#. Load the shapefile :file:`railroads.shp` in |qg| and press |mActionOpenTable|
   :sup:`Open Attribute Table`.
#. Click on |mActionToggleEditing| :sup:`Toggle editing mode` and open the
   |mActionCalculateField| :sup:`Field Calculator` dialog.
#. Select the |checkbox| :guilabel:`Create a new field` checkbox to save the
   calculations into a new field.
#. Add ``length`` as Output field name and ``real`` as Output field type, and
   define Output field width to be 10 and Precision, 3.
#. Now double click on function ``$length`` in the :guilabel:`Geometry` group to add it
   into the Field calculator expression box.
#. Complete the expression by typing ''/ 1000'' in the Field calculator expression box and click **[Ok]**.
#. You can now find a new field ``length`` in the attribute table.

The available functions are listed in :ref:`vector_expressions` chapter.


