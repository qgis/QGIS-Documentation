Create graticule
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Extent`` [vector: any]
  Optional.

  <put parameter description here>

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Division Width`` [number]
  <put parameter description here>

  Default: *1.0*

``Division Height`` [number]
  <put parameter description here>

  Default: *1.0*

``Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Lines
  * 1 --- [1] Rectangles

  Default: *0*

Outputs
-------

``Graticule`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:creategraticule', extent, output_extent, distx, disty, type, graticule)

See also
--------

