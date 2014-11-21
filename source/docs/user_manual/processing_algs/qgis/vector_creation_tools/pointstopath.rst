Points to path
==============

Description
-----------

<put algortithm description here>

Parameters
----------

``Input point layer`` [vector: point]
  <put parameter description here>

``Group field`` [tablefield: any]
  <put parameter description here>

``Order field`` [tablefield: any]
  <put parameter description here>

``Date format (if order field is DateTime)`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
-------

``Paths`` [vector]
  <put output description here>

``Directory`` [directory]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:pointstopath', vector, group_field, order_field, date_format, output_lines, output_text)

See also
--------

