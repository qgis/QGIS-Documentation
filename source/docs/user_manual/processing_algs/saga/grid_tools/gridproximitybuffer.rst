Grid proximity buffer
=====================

Description
-----------

<put algortithm description here>

Parameters
----------

``Source Grid`` [raster]
  <put parameter description here>

``Buffer distance`` [number]
  <put parameter description here>

  Default: *500.0*

``Equidistance`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
-------

``Distance Grid`` [raster]
  <put output description here>

``Allocation Grid`` [raster]
  <put output description here>

``Buffer Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:gridproximitybuffer', source, dist, ival, distance, alloc, buffer)

See also
--------

