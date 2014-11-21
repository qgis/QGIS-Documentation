Random points inside polygons (variable)
========================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: polygon]
  <put parameter description here>

``Sampling strategy`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Points count
  * 1 --- Points density

  Default: *0*

``Number field`` [tablefield: numeric]
  <put parameter description here>

``Minimum distance`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
-------

``Random points`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:randompointsinsidepolygonsvariable', vector, strategy, field, min_distance, output)

See also
--------

