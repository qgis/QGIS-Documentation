Variable distance buffer
========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: any]
  <put parameter description here>

``Distance field`` [tablefield: any]
  <put parameter description here>

``Segments`` [number]
  <put parameter description here>

  Default: *5*

``Dissolve result`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
-------

``Buffer`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:variabledistancebuffer', input, field, segments, dissolve, output)

See also
--------

