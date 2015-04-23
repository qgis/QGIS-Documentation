Hillshade
=========

Description
-----------

Outputs a raster with a nice shaded relief effect. It’s very useful for visualizing
the terrain. You can optionally specify the azimuth and altitude of the light source, a vertical
exaggeration factor and a scaling factor to account for differences between vertical and horizontal units.

Parameters
----------

``Input layer`` [raster]
  Elevation raster layer.

``Band number`` [number]
  Band containing the elevation information.

  Default: *1*

``Compute edges`` [boolean]
  Generates edges from the elevation raster.

  Default: *False*

``Use Zevenbergen&Thorne formula (instead of the Horn's one)`` [boolean]
  Activates Zevenbergen&Thorne formula for smooth landscapes.

  Default: *False*

``Z factor (vertical exaggeration)`` [number]
  The factor exaggerates the height of the output elevation raster.

  Default: *1.0*

``Scale (ratio of vert. units to horiz.)`` [number]
  The ratio of vertical units to horizontal units.

  Default: *1.0*

``Azimuth of the light`` [number]
  Defines the azimuth of the light shining on the elevation raster in degrees.
  If it comes from the top of the raster the value is 0, if it comes from the east
  it is 90 a.s.o. . 

  Default: *315.0*

``Altitude of the light`` [number]
  Defines the altitude of the light, in degrees. 90 if the light comes from above the elevation
  raster, 0 if it is raking light. 
   
  Default: *45.0*

Outputs
-------

``Output file`` [raster]
  Output raster.

Console usage
-------------

::

  processing.runalg('gdalogr:hillshade', input, band, compute_edges, zevenbergen, z_factor, scale, azimuth, altitude, output)

See also
--------

