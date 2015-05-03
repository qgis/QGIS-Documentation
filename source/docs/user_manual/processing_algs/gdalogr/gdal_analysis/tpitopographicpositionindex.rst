TPI (Topographic Position Index)
================================

Description
-----------
This command outputs a single-band raster with values computed from the elevation. 
TPI stands for Topographic Position Index, which is defined as the difference between a central pixel and the mean 
of its surrounding cells 

Parameters
----------

``Input layer`` [raster]
  Elevation raster layer

``Band number`` [number]
  The number of a band containing elevation values

  Default: *1*

``Compute edges`` [boolean]
  Generates edges from the elevation raster

  Default: *False*

Outputs
-------

``Output file`` [raster]
  TPI raster in output

Console usage
-------------

::

  processing.runalg('gdalogr:tpitopographicpositionindex', input, band, compute_edges, output)

See also
--------
`GDAL DEM utility <http://www.gdal.org/gdaldem.html#gdaldem_TPI>`_

