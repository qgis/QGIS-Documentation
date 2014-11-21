Fill sinks (wang & liu)
=======================

Description
-----------

<put algortithm description here>

Parameters
----------

``DEM`` [raster]
  <put parameter description here>

``Minimum Slope [Degree]`` [number]
  <put parameter description here>

  Default: *0.01*

Outputs
-------

``Filled DEM`` [raster]
  <put output description here>

``Flow Directions`` [raster]
  <put output description here>

``Watershed Basins`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:fillsinkswangliu', elev, minslope, filled, fdir, wshed)

See also
--------

