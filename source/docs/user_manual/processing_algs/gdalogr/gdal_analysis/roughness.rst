Roughness
=========

Description
-----------

Outputs a single-band raster with values computed from the elevation. Roughness
is the degree of irregularity of the surface. It's calculated by the largest inter-cell
difference of a central pixel and its sourrounding cell.
The determination of the roughness plays a role in the analysis of terrain elevation data, 
it's useful for calculations of the river morphology, in climatology and physical geography
in general.


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

