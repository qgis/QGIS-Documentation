Color relief
============

Description
-----------

Generates a color relief map from any GDAL-supported elevation raster.
Color reliefs can particularly be used to depict elevations.
The Algorithm outputs a 4-band raster with values computed from the elevation
and a text-based color configuration file. By default, the colors between the given
elevation values are blended smoothly and the result is a nice colorized elevation raster.

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

``Color configuration file`` [file]
  A text-based color configuration file.

``Matching mode`` [selection]
  The "0,0,0,0" RGBA mode results in color interpolation whereas the Exact color and
  Nearest color modes avoid interpolation of values that don't match an index of the
  color configuration file.

  Options:

  * 0 --- "0,0,0,0" RGBA
  * 1 --- Exact color
  * 2 --- Nearest color

  Default: *0*

Outputs
-------

``Output file`` [raster]
  A 4-band output raster.

Console usage
-------------

::

  processing.runalg('gdalogr:colorrelief', input, band, compute_edges, color_table, match_mode, output)

See also
--------

