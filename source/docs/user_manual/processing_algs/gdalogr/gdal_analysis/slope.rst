Slope
=====

Description
-----------

Generate a slope map from any GDAL-supported elevation raster. Slope is the
angle of inclination to the horizontal. You have the option of specifying the
type of slope value you want: degrees or percent slope.
The algorithm is derived from the `GDAL DEM utility <http://www.gdal.org/gdaldem.html>`_ .



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

``Use Zevenbergen&Thorne formula (instead of the Horn's one)`` [boolean]
  Activates Zevenbergen&Thorne formula for smooth landscapes.

  Default: *False*

``Slope expressed as percent (instead of degrees)`` [boolean]
  You have the option to use slope expressed as degrees.

  Default: *False*

``Scale (ratio of vert. units to horiz.)`` [number]
  The ratio of vertical units to horizontal units.

  Default: *1.0*

Outputs
-------

``Output file`` [raster]
  32-bit float output raster.

Console usage
-------------

::

  processing.runalg('gdalogr:slope', input, band, compute_edges, zevenbergen, as_percent, scale, output)

See also
--------

