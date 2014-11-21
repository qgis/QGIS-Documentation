Dissolve
========

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: polygon, line]
  <put parameter description here>

``Dissolve all (do not use field)`` [boolean]
  <put parameter description here>

  Default: *True*

``Unique ID field`` [tablefield: any]
  Optional.

  <put parameter description here>

Outputs
-------

``Dissolved`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:dissolve', input, dissolve_all, field, output)

See also
--------

