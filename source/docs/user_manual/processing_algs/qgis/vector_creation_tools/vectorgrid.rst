Vector grid
===========

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``X spacing`` [number]
  <put parameter description here>

  Default: *0.0001*

``Y spacing`` [number]
  <put parameter description here>

  Default: *0.0001*

``Grid type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Output grid as polygons
  * 1 --- Output grid as lines

  Default: *0*

Outputs
-------

``Grid`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:vectorgrid', extent, step_x, step_y, type, output)

See also
--------

