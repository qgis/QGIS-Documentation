TRI (Terrain Ruggedness Index)
==============================

Description
-----------
This command outputs a single-band raster with values computed from the elevation. 
TRI stands for Terrain Ruggedness Index, which is defined as the mean difference between a central pixel and its 
surrounding cells

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
  TRI raster file

Console usage
-------------

::

  processing.runalg('gdalogr:triterrainruggednessindex', input, band, compute_edges, output)

See also
--------
`GDAL DEM utility <http://www.gdal.org/gdaldem.html#gdaldem_TRI>`_
