|updatedisclaimer|

Vector table
============

Add autoincremental field
-------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:addautoincrementalfield', input, output)

See also
........

Add field to attributes table
-----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Field name`` [string]
  <put parameter description here>

  Default: *(not set)*

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

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:addfieldtoattributestable', input_layer, field_name, field_type, field_length, field_precision, output_layer)

See also
........

Advanced Python field calculator
--------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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

  Default: *value =*

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:advancedpythonfieldcalculator', input_layer, field_name, field_type, field_length, field_precision, global, formula, output_layer)

See also
........

Basic statistics for numeric fields
-----------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input vector layer`` [vector: any]
  <put parameter description here>

``Field to calculate statistics on`` [tablefield: numeric]
  <put parameter description here>

Outputs
.......

``Statistics for numeric field`` [html]
  <put output description here>

``Coefficient of Variation`` [number]
  <put output description here>

``Minimum value`` [number]
  <put output description here>

``Maximum value`` [number]
  <put output description here>

``Sum`` [number]
  <put output description here>

``Mean value`` [number]
  <put output description here>

``Count`` [number]
  <put output description here>

``Range`` [number]
  <put output description here>

``Median`` [number]
  <put output description here>

``Number of unique values`` [number]
  <put output description here>

``Standard deviation`` [number]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:basicstatisticsfornumericfields', input_layer, field_name, output_html_file)

See also
........

Basic statistics for text fields
--------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input vector layer`` [vector: any]
  <put parameter description here>

``Field to calculate statistics on`` [tablefield: string]
  <put parameter description here>

Outputs
.......

``Statistics for text field`` [html]
  <put output description here>

``Minimum length`` [number]
  <put output description here>

``Maximum length`` [number]
  <put output description here>

``Mean length`` [number]
  <put output description here>

``Count`` [number]
  <put output description here>

``Number of empty values`` [number]
  <put output description here>

``Number of non-empty values`` [number]
  <put output description here>

``Number of unique values`` [number]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:basicstatisticsfortextfields', input_layer, field_name, output_html_file)

See also
........

Create equivalent numerical field
---------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Class field`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:createequivalentnumericalfield', input, field, output)

See also
........

Delete column
-------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Field to delete`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:deletecolumn', input, column, output)

See also
........

Export/Add geometry columns
---------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input layer`` [vector: any]
  <put parameter description here>

``Calculate using`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Layer CRS
  * 1 --- Project CRS
  * 2 --- Ellipsoidal

  Default: *0*

Outputs
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:exportaddgeometrycolumns', input, calc_method, output)

See also
........

Field calculator
----------------

Description
...........

<put algortithm description here>

Parameters
..........

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
.......

``Output layer`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:fieldcalculator', input_layer, field_name, field_type, field_length, field_precision, new_field, formula, output_layer)

See also
........

List unique values
------------------

Description
...........

Lists unique values of an attribute table field and counts their number.

Parameters
..........

``Input layer`` [vector: any]
  Layer to analyze.

``Target field`` [tablefield: any]
  Field to analyze.

Outputs
.......

``Unique values`` [html]
  Analysis results in HTML format.

``Total unique values`` [number]
  Total number of unique values in given field.

``Unique values`` [string]
  List of all unique values in given field.

Console usage
.............

::

  processing.runalg('qgis:listuniquevalues', input_layer, field_name, output)

See also
........

Number of unique values in classes
----------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``input`` [vector: any]
  <put parameter description here>

``class field`` [tablefield: any]
  <put parameter description here>

``value field`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:numberofuniquevaluesinclasses', input, class_field, value_field, output)

See also
........

Refactor fields
---------------

Description
...........

Refactor layer fields:

* Change field names and types.
* Add and remove fields.
* Reorder fields.
* Calculate new fields based on expressions.
* Load field list from another layer.

Parameters
..........

``Input layer`` [vector: any]
  Source layer.

``Fields mapping`` [fieldsmapping]
  Output fields definitions

Outputs
.......

``Output layer`` [vector]
  Destination layer

Console usage
.............

::

  processing.runalg("qgis:refactorfields",
                    input,
                    [{'name': output_field_name,
                      'type': output_field_type,
                      'length': output_field_length,
                      'precision': output_field_precision,
                      'expression': expression_based_on_input_layer
                    }],
                    output)

See also
........

Statistics by categories
------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input vector layer`` [vector: any]
  <put parameter description here>

``Field to calculate statistics on`` [tablefield: numeric]
  <put parameter description here>

``Field with categories`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Statistics`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:statisticsbycategories', input_layer, values_field_name, categories_field_name, output)

See also
........

Text to float
-------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Layer`` [vector: any]
  <put parameter description here>

``Text attribute to convert to float`` [tablefield: string]
  <put parameter description here>

Outputs
.......

``Output`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('qgis:texttofloat', input, field, output)

See also
........

