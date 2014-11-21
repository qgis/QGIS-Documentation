Advanced Python field calculator
================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: any]
  <put parameter description here>

``Result field name`` [string]
  <put parameter description here>

  Default: *NewField*

``Field type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Integer
  * 1 --- Float
  * 2 --- String

  Default: *0*

``Field length`` [number]
  <put parameter description here>

  Default: *10*

``Field precision`` [number]
  <put parameter description here>

  Default: *0*

``Global expression`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

``Formula`` [string]
  <put parameter description here>

  Default: *value = *

Outputs
-------

``Output layer`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:advancedpythonfieldcalculator', input_layer, field_name, field_type, field_length, field_precision, global, formula, output_layer)

See also
--------

