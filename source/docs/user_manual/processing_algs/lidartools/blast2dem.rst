blast2dem
---------

Description
...........

This tool can turn billions of points with via seamless Delaunay triangulation implemented using streaming into large elevation, intensity, or RGB rasters. For more info see the `blast2dem <http://rapidlasso.com/blast2dem>`_ page and its online `README <http://lastools.org/blast2dem_README.txt>`_ file.

Parameters
..........

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
.......

``Output file`` [raster]
  Output raster with angle values in degrees.

Console usage
.............

::

  processing.runalg('blast2dem', input, band, compute_edges, zevenbergen, trig_angle, zero_flat, output)

See also
........
