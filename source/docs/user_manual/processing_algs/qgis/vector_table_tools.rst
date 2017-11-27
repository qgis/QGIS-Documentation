.. only:: html

   |updatedisclaimer|

Vector table
============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgis_add_autoincremental_field:

Add autoincremental field
-------------------------
Adds a new integer field to a vector layer, with a sequential value for each feature.

This field can be used as a unique ID for features in the layer. The new attribute
is not added to the input layer but a new layer is generated instead.

The initial starting value for the incremental series can be specified.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

``Field name`` [string]
  Name of the field with autoincremental values

  Default: *AUTO*

``Start values at`` [number]
  Optional

  Choose the number of the initial incremental count

  Default: *0*

Output
......

``Incremented`` [vector]
  Vector layer with additional field


.. _qgis_add_field_to_attribute_table:

Add field to attributes table
-----------------------------
Adds a new attribute to a vector layer.

The name and characteristics of the attribute are defined as parameters.

The new attribute is not added to the input layer but a new layer is generated
instead.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

``Field name`` [string]
  Name of the new field

  Default: *(not set)*

``Field type`` [selection]
  Type of the new field. You can choose between:

  * Integer
  * Float
  * String

  Default: *Integer*

``Field length`` [number]
  Length of the field

  Default: *10*

``Field precision`` [number]
  Precision of the field. Useful with Float field type

  Default: *0*

Output
......

``Added`` [vector]
  Vector layer with new field added


.. _qgis_add_unique_value_index_field:

Add unique value index field
----------------------------
Takes a vector layer and an attribute and adds a new numeric field.

Values in this field correspond to values in the specified attribute, so features
with the same value for the attribute will have the same value in the new numeric
field.

This creates a numeric equivalent of the specified attribute, which defines the
same classes.

The new attribute is not added to the input layer but a new layer is generated
instead.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

``Class field`` [tablefield: any]
  Name of the new field

  Default: *(not set)*

Output
......

``Layer with index index field``
  Vector layer with the field ``NUM_FIELD`` containing indexes


.. _qgis_advanced_python_calculator:

Advanced Python field calculator
--------------------------------
Adds a new attribute to a vector layer, with values resulting from applying an
expression to each feature.

The expression is defined as a Python function.

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Result field name`` [string]
  name of the new field

  Default: *NewField*

``Field type`` [selection]
  Type of the new field. You can choose between:

  * Integer
  * Float
  * String

  Default: *Integer*

``Field length`` [number]
  Length of the field

  Default: *10*

``Field precision`` [number]
  Precision of the field. Useful with Float field type

  Default: *0*

``Global expression`` [string]
  Optional.

  Option to add a global expression

  Default: *(not set)*

``Formula`` [string]
  Add here the Python formula to evaluate. For example to calculate the area of
  an input polygon layer you can add:

  .. code-block:: python

    value  = $geom.area()

  Default: *value =*

Outpu
.....

``Calculated`` [vector]
  Vector layer with the new calculated field



.. _qgis_dropfield:

Drop field(s)
-------------
Takes a vector layer and generates a new one that has the exact same content but
without the selected columns..

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer

``Fields to drop`` [multiselection]
  Select the field to drop

Output
......

``Fields dropped``
  Vector layer without the field(s) chosen


.. _qgis_field_calculator:

Field calculator
----------------
Opens the field calculator (see :ref:`vector_expressions`). You can use all the
supported expressions and functions.

A new layer is created with the result of the expression.

The field calculator is very useful when used in :ref:`processing.modeler`.

.. figure:: /static/user_manual/processing_algs/qgis/field_calculator.png
  :align: center

  Field calculator dialog


.. _qgis_refactor_fields:

Refactor fields
---------------
Allows editing the structure of the attributes table of a vector layer.

Fields can be modified in their type and name, using a fields mapping.

The original layer is not modified. A new layer is generated, which contains a
modified attribute table, according to the provided fields mapping.

Refactor layer fields allows to:

* Change field names and types
* Add and remove fields
* Reorder fields
* Calculate new fields based on expressions
* Load field list from another layer

Parameters
..........

``Input layer`` [vector: any]
  Input source layer

``Fields mapping`` [fieldsmapping]
  Output fields definitions

``Load fields from layer`` [vector: any]
  Load fields from another vector layer to update the field list

Output
......

``Refactored`` [vector]
  Output layer with refactored fields


.. _qgis_text_to_float:

Text to float
-------------
Modifies the type of a given attribute in a vector layer, converting a text attribute
containing numeric strings into a numeric attribute.

Parameters
..........

``Input Layer`` [vector: any]
  Input vector layer

``Text attribute to convert to float`` [tablefield: string]
  String field to convert in a floating field type

Output
......

``Float from text`` [vector]
  Output vector layer with string field converted into float
