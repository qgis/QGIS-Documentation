Convert geometry type
=====================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: any]
  <put parameter description here>

``New geometry type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Centroids
  * 1 --- Nodes
  * 2 --- Linestrings
  * 3 --- Multilinestrings
  * 4 --- Polygons

  Default: *0*

Outputs
-------

``Output`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:convertgeometrytype', input, type, output)

See also
--------

