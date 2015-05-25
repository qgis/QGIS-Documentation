|updatedisclaimer|

GDAL analysis
=============

Aspect
------

Description
...........

Generates an aspect map from any GDAL-supported elevation raster.
Aspect is the compass direction that a slope faces. The pixels will
have a value from 0-360° measured in degress from north indicating the azimuth.
On the northern hemisphere, the north side of slopes is often shaded (small azimuth from 0°-90°),
while the southern side receives more solar radiation (higher azimuth from 180°-270°).
The algorithm is derived from the `GDAL DEM utility <http://www.gdal.org/gdaldem.html>`_ .

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

  processing.runalg('gdalogr:aspect', input, band, compute_edges, zevenbergen, trig_angle, zero_flat, output)

See also
........


Color relief
------------

Description
...........

Generates a color relief map from any GDAL-supported elevation raster.
Color reliefs can particularly be used to depict elevations.
The Algorithm outputs a 4-band raster with values computed from the elevation
and a text-based color configuration file. By default, the colors between the given
elevation values are blended smoothly and the result is a nice colorized elevation raster.
The algorithm is derived from the `GDAL DEM utility <http://www.gdal.org/gdaldem.html>`_ .

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
.......

``Output file`` [raster]
  A 4-band output raster.

Console usage
.............

::

  processing.runalg('gdalogr:colorrelief', input, band, compute_edges, color_table, match_mode, output)

See also
........


Fill nodata
-----------

Description
...........

Fill raster regions with no data values by interpolation from edges. The values for
the no-data regions are calculated by the sourrounding pixel values using inverse distance
weighting. After the interpolation a smoothing of the results takes placce.
Input can be any GDAL-supported raster layer. This algorithm is generally suitable for
interpolating missing regions of fairly continuously varying rasters (such as elevation
models for instance). It is also suitable for filling small holes and cracks in more irregularly
varying images (like airphotos). It is generally not so great for interpolating a raster
from sparse point data.
The algorithm is derived from the `GDAL fillnodata utility <http://www.gdal.org/gdal_fillnodata.html>`_ .

Parameters
..........

``Input layer`` [raster]
  Raster layer.

``Search distance`` [number]
  The number of pixels to search in all directions to interpolate from.

  Default: *100*

``Smooth iterations`` [number]
  The number of 3x3 filter passes to run (0 or more) to smoothen the results
  of the interpolation.

  Default: *0*

``Band to operate on`` [number]
  The band to operate on. Nodata values must be represented by the value 0.

  Default: *1*

``Validity mask`` [raster]
  Optional.

  A mask that defines which areas are to be filled.

``Do not use default validity mask`` [boolean]
  Activates the user-defined validity mask.

  Default: *False*

Outputs
.......

``Output layer`` [raster]
  Output raster in any GDAL-supported format.

Console usage
.............

::

  processing.runalg('gdalogr:fillnodata', input, distance, iterations, band, mask, no_default_mask, output)

See also
........


Grid (Moving average)
---------------------

Description
...........

The Moving Average is a simple data averaging algorithm. It uses a moving window of elliptic form to search values
and averages all data points within the window. Search ellipse can be rotated by specified angle, the center of ellipse
located at the grid node. Also the minimum number of data points to average can be set, if there are not enough points
in window, the grid node considered empty and will be filled with specified NODATA value.


Parameters
..........

``Input layer`` [vector: point]
  Point vector layer

``Z field`` [tablefield: numeric]
  Field for the interpolation (*Optional*)

``Radius 1`` [number]
  The first radius (X axis if rotation angle is 0) of search ellipse.

  Default: *0.0*

``Radius 2`` [number]
  The second radius (Y axis if rotation angle is 0) of search ellipse.

  Default: *0.0*

``Min points`` [number]
  Minimum number of data points to average.
  If less amount of points found the grid node considered empty and will be filled with NODATA marker.

  Default: *0.0*

``Angle`` [number]
  Angle of ellipse rotation in degrees.
  Ellipse rotated counter clockwise.

  Default: *0.0*

``Nodata`` [number]
  No data marker to fill empty points.

  Default: *0.0*

``Output raster type`` [selection]
  Raster file type

  Options:

  * 0 --- Byte
  * 1 --- Int16
  * 2 --- UInt16
  * 3 --- UInt32
  * 4 --- Int32
  * 5 --- Float32
  * 6 --- Float64
  * 7 --- CInt16
  * 8 --- CInt32
  * 9 --- CFloat32
  * 10 --- CFloat64

  Default: *5*

Outputs
.......

``Output file`` [raster]

Interpolated raster file

Console usage
.............

::

  processing.runalg('gdalogr:gridaverage', input, z_field, radius_1, radius_2, min_points, angle, nodata, rtype, output)

See also
........

 `GDAL grid tutorial <http://www.gdal.org/grid_tutorial.html>`_

Grid (Data metrics)
-------------------

Description
...........

This algorith computes some data metrics using the specified window and output grid geometry.

Parameters
..........

``Input layer`` [vector: point]
  Point vector layer

``Z field`` [tablefield: numeric]
  Field for the interpolation (*Optional*)

``Metrics`` [selection]
  List of available metrics:

  Options:

  * 0 --- Minimum, minimum value found in grid node search ellipse.
  * 1 --- Maximum, maximum value found in grid node search ellipse
  * 2 --- Range, a difference between the minimum and maximum values found in grid node search ellipse
  * 3 --- Count, a number of data points found in grid node search ellipse
  * 4 --- Average distance, an average distance between the grid node (center of the search ellipse) and all of the data points found in grid node search ellipse
  * 5 --- Average distance between points, an average distance between the data points found in grid node search ellipse. The distance between each pair of points within ellipse is calculated and average of all distances is set as a grid node value

  Default: *0*

``Radius 1`` [number]
  The first radius (X axis if rotation angle is 0) of search ellipse. Set this parameter to zero to use whole point array

  Default: *0.0*

``Radius 2`` [number]
  The second radius (Y axis if rotation angle is 0) of search ellipse. Set this parameter to zero to use whole point array

  Default: *0.0*

``Min points`` [number]
  Minimum number of data points to use. If less amount of points found the grid node considered empty and will be filled with NODATA marker.

  This is only used if search ellipse is set (both radii are non-zero)

  Default: *0.0*

``Angle`` [number]
  Angle of search ellipse rotation in degrees (counter clockwise)

  Default: *0.0*

``Nodata`` [number]
  NODATA marker to fill empty points

  Default: *0.0*

``Output raster type`` [selection]
  Raster file type

  Options:

  * 0 --- Byte
  * 1 --- Int16
  * 2 --- UInt16
  * 3 --- UInt32
  * 4 --- Int32
  * 5 --- Float32
  * 6 --- Float64
  * 7 --- CInt16
  * 8 --- CInt32
  * 9 --- CFloat32
  * 10 --- CFloat64

  Default: *5*

Outputs
.......

``Output file`` [raster]
  Interpolated raster file

Console usage
.............

::

  processing.runalg('gdalogr:griddatametrics', input, z_field, metric, radius_1, radius_2, min_points, angle, nodata, rtype, output)

See also
........
`GDAL grid tutorial <http://www.gdal.org/grid_tutorial.html>`_

Grid (Inverse distance to a power)
----------------------------------

Description
...........

The Inverse Distance to a Power gridding method is a weighted average interpolator.

You should supply the input arrays with the scattered data values including coordinates of every data point and output
grid geometry. The function will compute interpolated value for the given position in output grid.

Parameters
..........

``Input layer`` [vector: point]
  Point vector layer

``Z field`` [tablefield: numeric]
  Field for the interpolation (*Optional*).

``Power`` [number]
  Weighting power

  Default: *2.0*

``Smothing`` [number]
  Smoothing parameter

  Default: *0.0*

``Radius 1`` [number]
  The first radius (X axis if rotation angle is 0) of search ellipse

  Default: *0.0*

``Radius 2`` [number]
  The second radius (Y axis if rotation angle is 0) of search ellipse

  Default: *0.0*

``Max points`` [number]
  Maximum number of data points to use.

  Do not search for more points than this number. If less amount of points found the grid node considered empty and
  will be filled with NODATA marker

  Default: *0.0*

``Min points`` [number]
  Minimum number of data points to use.

  If less amount of points found the grid node considered empty and will be filled with NODATA marker

  Default: *0.0*

``Angle`` [number]
  Angle of ellipse rotation in degrees.

  Ellipse rotated counter clockwise.

  Default: *0.0*

``Nodata`` [number]
  No data marker to fill empty points

  Default: *0.0*

``Output raster type`` [selection]
  Raster file type

  Options:

  * 0 --- Byte
  * 1 --- Int16
  * 2 --- UInt16
  * 3 --- UInt32
  * 4 --- Int32
  * 5 --- Float32
  * 6 --- Float64
  * 7 --- CInt16
  * 8 --- CInt32
  * 9 --- CFloat32
  * 10 --- CFloat64

  Default: *5*

Outputs
.......

``Output file`` [raster]
  Interpolated raster file

Console usage
.............

::

  processing.runalg('gdalogr:gridinvdist', input, z_field, power, smothing, radius_1, radius_2, max_points, min_points, angle, nodata, rtype, output)

See also
.........

`GDAL grid tutorial <http://www.gdal.org/grid_tutorial.html>`_

Grid (Nearest neighbor)
-----------------------

Description
...........

The Nearest Neighbor method doesn't perform any interpolation or smoothing, it just takes the value of nearest point
found in grid node search ellipse and returns it as a result. If there are no points found, the specified NODATA value
will be returned.

Parameters
..........

``Input layer`` [vector: point]
  Point vector layer

``Z field`` [tablefield: numeric]
  Field for the interpolation (*Optional*).

``Radius 1`` [number]
  The first radius (X axis if rotation angle is 0) of search ellipse.

  Default: *0.0*

``Radius 2`` [number]
  The second radius (Y axis if rotation angle is 0) of search ellipse.

  Default: *0.0*

``Angle`` [number]
  Angle of ellipse rotation in degrees.
  Ellipse rotated counter clockwise.

  Default: *0.0*

``Nodata`` [number]
  No data marker to fill empty points.

  Default: *0.0*

``Output raster type`` [selection]

  Raster file type

  Options:

  * 0 --- Byte
  * 1 --- Int16
  * 2 --- UInt16
  * 3 --- UInt32
  * 4 --- Int32
  * 5 --- Float32
  * 6 --- Float64
  * 7 --- CInt16
  * 8 --- CInt32
  * 9 --- CFloat32
  * 10 --- CFloat64

  Default: *5*

Outputs
.......

``Output file`` [raster]
  Interpolated raster file

Console usage
.............

::

  processing.runalg('gdalogr:gridnearestneighbor', input, z_field, radius_1, radius_2, angle, nodata, rtype, output)

See also
........

`GDAL grid tutorial <http://www.gdal.org/grid_tutorial.html>`_

Hillshade
---------

Description
...........

Outputs a raster with a nice shaded relief effect. It’s very useful for visualizing
the terrain. You can optionally specify the azimuth and altitude of the light source, a vertical
exaggeration factor and a scaling factor to account for differences between vertical and horizontal units.
The algorithm is derived from the `GDAL DEM utility <http://www.gdal.org/gdaldem.html>`_ .

Parameters
..........

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
.......

``Output file`` [raster]
  Output raster.

Console usage
.............

::

  processing.runalg('gdalogr:hillshade', input, band, compute_edges, zevenbergen, z_factor, scale, azimuth, altitude, output)

See also
........


Near black
----------

Description
...........

Convert nearly black/white borders to black.

This utility will scan an image and try to set all pixels that are nearly or exactly black, white or one or more custom
colors around the collar to black or white. This is often used to "fix up" lossy compressed airphotos so that color
pixels can be treated as transparent when mosaicking

Parameters
..........

``Input layer`` [raster]
  Raster file in input

``How far from black (white)`` [number]
  Select how far from black, white or custom colors the pixel values can be and still considered near black, white or custom color

  Default: *15*

``Search for nearly white pixels instead of nearly black`` [boolean]
  Search for nearly white (255) pixels instead of nearly black pixels

  Default: *False*

Outputs
.......

``Output layer`` [raster]
  Raster file in output

Console usage
.............

::

  processing.runalg('gdalogr:nearblack', input, near, white, output)

See also
........

 `GDAL nearblack <http://www.gdal.org/nearblack.html>`_

Proximity (raster distance)
---------------------------

Description
...........

The proximity algorithm generates a raster proximity map indicating the distance from the center of each pixel
to the center of the nearest pixel identified as a target pixel. Target pixels are those in the source raster for which
the raster pixel value is in the set of target pixel values.

Parameters
..........

``Input layer`` [raster]
  Raster in input

``Values`` [string]
  A list of target pixel values in the source image to be considered target pixels. If not specified, all non-zero
  pixels will be considered target pixels.

  Default: *(not set)*

``Dist units`` [selection]
  Indicate whether distances generated should be in pixel or georeferenced coordinates.

  Options:

  * 0 --- GEO
  * 1 --- PIXEL

  Default: *0*

``Max dist (negative value to ignore)`` [number]
  The maximum distance to be generated. The nodata value will be used for pixels beyond this distance. If a nodata
  value is not provided, the output band will be queried for its nodata value.

  If the output band does not have a nodata value, then the value 65535 will be used.
  Distance is interpreted in pixels unless *distunits* GEO is specified

  Default: *-1*

``No data (negative value to ignore)`` [number]
  Specify a nodata value to use for the destination proximity raster

  Default: *-1*

``Fixed buf val (negative value to ignore)`` [number]
  Specify a value to be applied to all pixels that are within the -maxdist of target pixels
  (including the target pixels) instead of a distance value

  Default: *-1*

``Output raster type`` [selection]
  Raster file type

  Options:

  * 0 --- Byte
  * 1 --- Int16
  * 2 --- UInt16
  * 3 --- UInt32
  * 4 --- Int32
  * 5 --- Float32
  * 6 --- Float64
  * 7 --- CInt16
  * 8 --- CInt32
  * 9 --- CFloat32
  * 10 --- CFloat64

  Default: *5*

Outputs
.......

``Output layer`` [raster]
  Raster file in output

Console usage
.............

::

  processing.runalg('gdalogr:proximity', input, values, units, max_dist, nodata, buf_val, rtype, output)

See also
........

`GDAL proximity algorithm <http://www.gdal.org/gdal_proximity.html>`_

Roughness
---------

Description
...........

Outputs a single-band raster with values computed from the elevation. Roughness
is the degree of irregularity of the surface. It's calculated by the largest inter-cell
difference of a central pixel and its sourrounding cell.
The determination of the roughness plays a role in the analysis of terrain elevation data,
it's useful for calculations of the river morphology, in climatology and physical geography
in general.
The algorithm is derived from the `GDAL DEM utility <http://www.gdal.org/gdaldem.html>`_ .


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

Outputs
.......

``Output file`` [raster]
  Single-band output raster. The value -9999 is used as the output nodata value.

Console usage
.............

::

  processing.runalg('gdalogr:roughness', input, band, compute_edges, output)

See also
........

Sieve
-----

Description
...........

Removes raster polygons smaller than a provided threshold size (in pixels) and
replaces them with the pixel value of the largest neighbour polygon. It is
useful if you have a large amount of small areas on your raster map.
The algorithm is derived from the `GDAL sieve utility <http://www.gdal.org/gdal_sieve.html>`_ .

Parameters
..........

``Input layer`` [raster]
  Raster layer.

``Threshold`` [number]
  Only raster polygons smaller than this size will be removed.

  Default: *2*

``Pixel connection`` [selection]
  Either four connectedness or eight connectedness should be used when determining.

  Options:

  * 0 --- 4
  * 1 --- 8

  Default: *0*

Outputs
.......

``Output layer`` [raster]
  Output raster layer.

Console usage
.............

::

  processing.runalg('gdalogr:sieve', input, threshold, connections, output)

See also
........

Slope
-----

Description
...........

Generate a slope map from any GDAL-supported elevation raster. Slope is the
angle of inclination to the horizontal. You have the option of specifying the
type of slope value you want: degrees or percent slope.
The algorithm is derived from the `GDAL DEM utility <http://www.gdal.org/gdaldem.html>`_ .

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

``Slope expressed as percent (instead of degrees)`` [boolean]
  You have the option to use slope expressed as degrees.

  Default: *False*

``Scale (ratio of vert. units to horiz.)`` [number]
  The ratio of vertical units to horizontal units.

  Default: *1.0*

Outputs
.......

``Output file`` [raster]
  32-bit float output raster.

Console usage
.............

::

  processing.runalg('gdalogr:slope', input, band, compute_edges, zevenbergen, as_percent, scale, output)

See also
........

TPI (Topographic Position Index)
--------------------------------

Description
...........
This command outputs a single-band raster with values computed from the elevation.
TPI stands for Topographic Position Index, which is defined as the difference between a central pixel and the mean
of its surrounding cells

Parameters
..........

``Input layer`` [raster]
  Elevation raster layer

``Band number`` [number]
  The number of a band containing elevation values

  Default: *1*

``Compute edges`` [boolean]
  Generates edges from the elevation raster

  Default: *False*

Outputs
.......

``Output file`` [raster]
  TPI raster in output

Console usage
.............

::

  processing.runalg('gdalogr:tpitopographicpositionindex', input, band, compute_edges, output)

See also
........

`GDAL DEM utility <http://www.gdal.org/gdaldem.html#gdaldem_TPI>`_


TRI (Terrain Ruggedness Index)
------------------------------

Description
...........

This command outputs a single-band raster with values computed from the elevation.
TRI stands for Terrain Ruggedness Index, which is defined as the mean difference between a central pixel and its
surrounding cells

Parameters
..........

``Input layer`` [raster]
  Elevation raster layer

``Band number`` [number]
  The number of a band containing elevation values

  Default: *1*

``Compute edges`` [boolean]
  Generates edges from the elevation raster

  Default: *False*

Outputs
.......

``Output file`` [raster]
  TRI raster file

Console usage
.............

::

  processing.runalg('gdalogr:triterrainruggednessindex', input, band, compute_edges, output)

See also
........
`GDAL DEM utility <http://www.gdal.org/gdaldem.html#gdaldem_TRI>`_
