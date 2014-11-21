Watershed basins
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Channel Network`` [raster]
  <put parameter description here>

``Sink Route`` [raster]
  Optional.

  <put parameter description here>

``Min. Size`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Watershed Basins`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:watershedbasins', elevation, channels, sinkroute, minsize, basins)

See also
--------

