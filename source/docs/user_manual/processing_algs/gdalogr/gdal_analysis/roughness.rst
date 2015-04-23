Roughness
=========

Description
-----------

Outputs a single-band raster with values computed from the elevation. Roughness
is the largest inter-cell difference of a central pixel and its sourrounding cell. 

Parameters
----------

``Input layer`` [raster]
  Elevation raster layer.

``Band number`` [number]
  The number of a band containing elevation values.

  Default: *1*

``Compute edges`` [boolean]
  Generates edges from the elevation raster.

  Default: *False*

Outputs
-------

``Output file`` [raster]
  Single-band output raster. The value -9999 is used as the output nodata value.

Console usage
-------------

::

  processing.runalg('gdalogr:roughness', input, band, compute_edges, output)

See also
--------

