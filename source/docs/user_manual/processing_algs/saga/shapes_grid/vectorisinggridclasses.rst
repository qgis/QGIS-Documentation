Vectorising grid classes
========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Class Selection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] one single class specified by class identifier
  * 1 --- [1] all classes

  Default: *0*

``Class Identifier`` [number]
  <put parameter description here>

  Default: *0*

``Vectorised class as...`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] one single (multi-)polygon object
  * 1 --- [1] each island as separated polygon

  Default: *0*

Outputs
-------

``Polygons`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:vectorisinggridclasses', grid, class_all, class_id, split, polygons)

See also
--------

