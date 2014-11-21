Field calculator
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: any]
  <put parameter description here>

``Result field name`` [string]
  <put parameter description here>

  Default: *(not set)*

``Field type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Float
  * 1 --- Integer
  * 2 --- String
  * 3 --- Date

  Default: *0*

``Field length`` [number]
  <put parameter description here>

  Default: *10*

``Field precision`` [number]
  <put parameter description here>

  Default: *3*

``Create new field`` [boolean]
  <put parameter description here>

  Default: *True*

``Formula`` [string]
  <put parameter description here>

  Default: *(not set)*

Outputs
-------

``Output layer`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:fieldcalculator', input_layer, field_name, field_type, field_length, field_precision, new_field, formula, output_layer)

See also
--------

