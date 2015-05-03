Merge
=====

Description
-----------

Merges raster files in a simple way. Here you can use a pseudocolor
table from an input raster and define the output raster type. All
the images must be in the same coordinate system.
The algorithm is derived from the `GDAL merge utility <http://www.gdal.org/gdal_merge.html>`_ .

Parameters
----------

``Input layers`` [multipleinput: rasters]
  Input raster layers.

``Grab pseudocolor table from first layer`` [boolean]
  The pseudocolor table from the first layer will be used for the
  coloring.

  Default: *False*

``Layer stack`` [boolean]
  If 'True' is chosen each input file will be placed into a separate stacked band. 

  Default: *False*

``Output raster type`` [selection]
  Defines the output raster type. By default this will be 'Float23'.

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
  Output raster layer.

Console usage
-------------

::

  processing.runalg('gdalogr:merge', input, pct, separate, rtype, output)

See also
--------

