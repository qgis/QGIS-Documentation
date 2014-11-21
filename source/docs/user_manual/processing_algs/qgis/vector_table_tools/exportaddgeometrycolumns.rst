Export/Add geometry columns
===========================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Output layer`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:exportaddgeometrycolumns', input, calc_method, output)

See also
--------

