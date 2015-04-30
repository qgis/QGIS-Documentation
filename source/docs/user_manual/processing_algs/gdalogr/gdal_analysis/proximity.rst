Proximity (raster distance)
===========================

Description
-----------

The proximity algorithm generates a raster proximity map indicating the distance from the center of each pixel
to the center of the nearest pixel identified as a target pixel. Target pixels are those in the source raster for which
the raster pixel value is in the set of target pixel values.

Parameters
----------

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
-------

``Output layer`` [raster]
  Raster file in output

Console usage
-------------

::

  processing.runalg('gdalogr:proximity', input, values, units, max_dist, nodata, buf_val, rtype, output)

See also
--------
`GDAL proximity algorithm <http://www.gdal.org/gdal_proximity.html>`_
