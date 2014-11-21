Random points inside polygons (fixed)
=====================================

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

``Number or density of points`` [number]
  <put parameter description here>

  Default: *1.0*

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

  processing.runalg('qgis:randompointsinsidepolygonsfixed', vector, strategy, value, min_distance, output)

See also
--------

