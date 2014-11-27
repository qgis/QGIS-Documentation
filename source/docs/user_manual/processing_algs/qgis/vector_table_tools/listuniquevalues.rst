List unique values
==================

Description
-----------

Lists unique values of an attribute table field and counts their number.

Parameters
----------

``Input layer`` [vector: any]
  Layer to analyze.

``Target field`` [tablefield: any]
  Field to analyze.

Outputs
-------

``Unique values`` [html]
  Analysis results in HTML format.

``Total unique values`` [number]
  Total number of unique values in given field.

``Unique values`` [string]
  List of all unique values in given field.

Console usage
-------------

::

  processing.runalg('qgis:listuniquevalues', input_layer, field_name, output)

See also
--------

