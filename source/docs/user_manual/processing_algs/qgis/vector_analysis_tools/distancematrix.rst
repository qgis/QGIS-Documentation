Distance matrix
===============

Description
-----------

<put algortithm description here>

Parameters
----------

``Input point layer`` [vector: point]
  <put parameter description here>

``Input unique ID field`` [tablefield: any]
  <put parameter description here>

``Target point layer`` [vector: point]
  <put parameter description here>

``Target unique ID field`` [tablefield: any]
  <put parameter description here>

``Output matrix type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Linear (N*k x 3) distance matrix
  * 1 --- Standard (N x T) distance matrix
  * 2 --- Summary distance matrix (mean, std. dev., min, max)

  Default: *0*

``Use only the nearest (k) target points`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Distance matrix`` [table]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:distancematrix', input_layer, input_field, target_layer, target_field, matrix_type, nearest_points, distance_matrix)

See also
--------

