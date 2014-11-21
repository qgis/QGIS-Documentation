Burn stream network into dem
============================

Description
-----------

<put algortithm description here>

Parameters
----------

``DEM`` [raster]
  <put parameter description here>

``Streams`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] simply decrease cell's value by epsilon
  * 1 --- [1] lower cell's value to neighbours minimum value minus epsilon

  Default: *0*

``Epsilon`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
-------

``Processed DEM`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:burnstreamnetworkintodem', dem, stream, method, epsilon, burn)

See also
--------

