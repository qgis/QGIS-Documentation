Aspect
======

Description
-----------

Generates an aspect map from any GDAL-supported elevation raster.
Aspect is the compass direction that a slope faces. The pixels will
have a value from 0-360° measured in degress from north indicating the azimuth.
On the northern hemisphere, the north side of slopes is often shaded (small azimuth from 0°-90°),
while the southern side receives more solar radiation (higher azimuth from 180°-270°).

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

``Return trigonometric angle (instead of azimuth)`` [boolean]
  Activating the trigonometric angle results in different categories: 0° (=East), 90° (North), 180° (=West), 270° (=South).

  Default: *False*

``Return 0 for flat (instead of -9999)`` [boolean]
  Activating this option will insert a 0-value for the value -9999 on flat areas.

  Default: *False*

Outputs
-------

``Output file`` [raster]
  Output raster with angle values in degrees.

Console usage
-------------

::

  processing.runalg('gdalogr:aspect', input, band, compute_edges, zevenbergen, trig_angle, zero_flat, output)

See also
--------

