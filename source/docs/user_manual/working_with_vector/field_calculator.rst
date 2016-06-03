|updatedisclaimer|

.. index:: Field_Calculator, Calculator_Field, Derived_Fields

.. _vector_field_calculator:

Field Calculator
================

.. contents::
   :local:

The |calculateField| :sup:`Field Calculator` button in the attribute
table allows you to perform calculations on the basis of existing attribute values or
defined functions, for instance, to calculate length or area of geometry features. The
results can be written to a new attribute field, a virtual field, or
they can be used to update values in an existing field.

A :index:`virtual field` is a field based on an expression calculated on the fly,
meaning that its value is automatically updated as soon as the underlying parameter
changes. The expression is set once; you no longer need to recalculate the field
each time underlying values change.
For example, you may want to use a virtual field if you need area to be evaluated
as you digitize features or to automatically calculate a duration between dates
that may change (e.g., using ``now()`` function).

.. note:: **Use of Virtual Fields**

   * Virtual fields are not permanent in the layer attributes, meaning that
     they're only saved and available in the project file they've been created.
   * A field can be set virtual only at its creation and the expression used
     can't be changed later: you'll need to delete and recreate that field.

The :index:`field calculator` is available on any layer that supports edit.
When you click on the field calculator icon the dialog opens (see
figure_attributes_3_). If the layer is not in edit mode, a warning is
displayed and using the field calculator will cause the layer to be put in
edit mode before the calculation is made.

The quick field calculation bar on top of the attribute table is only
visible if the layer is in edit mode.

In quick field :index:`calculation bar`, you first select the existing field name
then open the expression dialog to create your expression or write it directly
in the field then click on **[Update All]**, **[Update Selected]** or
**[Update Filtered]** button according to your need.

Expression tab
--------------

Based on the :ref:`Expression Builder <functions_list>` dialog, the field calculator
dialog offers a complete interface to define an expression and apply it to an
existing or a newly created field.
To use the field calculator dialog, you first must select whether you want to only
update selected features, create a new attribute field where the results of the
calculation will be added or update an existing field.

.. _figure_attributes_3:

.. only:: html

   **Figure Attributes 3:**

.. figure:: /static/user_manual/working_with_vector/fieldcalculator.png
   :align: center

   Field Calculator

If you choose to add a new field, you need to enter a field name, a field type
(integer, real or string), the total field width, and the field precision (see
figure_attributes_3_). For example, if you choose a field width of 10 and a field
precision of 3, it means you have 6 digits before the dot, then the dot and another
3 digits for the precision.

A short example illustrates how field calculator works when using the
:guilabel:`Expression` tab. We want to calculate the length in km of the
``railroads`` layer from the QGIS sample dataset:

#. Load the shapefile :file:`railroads.shp` in QGIS and press |openTable|
   :sup:`Open Attribute Table`.
#. Click on |toggleEditing| :sup:`Toggle editing mode` and open the
   |calculateField| :sup:`Field Calculator` dialog.
#. Select the |checkbox| :guilabel:`Create a new field` checkbox to save the
   calculations into a new field.
#. Add ``length`` as Output field name and ``real`` as Output field type, and
   define Output field width to be 10 and Precision, 3.
#. Now double click on function ``$length`` in the :guilabel:`Geometry` group
   to add it into the Field calculator expression box.
#. Complete the expression by typing ``/ 1000`` in the Field calculator
   expression box and click **[Ok]**.
#. You can now find a new field ``length`` in the attribute table.

The available functions are listed in :ref:`vector_expressions` chapter.

Function Editor tab
-------------------
With the Function Editor you are able to define your own Python custom functions
in a comfortable way. See also :ref:`vector_expressions` for more informations.

