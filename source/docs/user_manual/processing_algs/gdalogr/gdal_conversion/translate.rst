Translate (convert format)
==========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Set the size of the output file (In pixels or %)`` [number]
  <put parameter description here>

  Default: *100*

``Output size is a percentage of input size`` [boolean]
  <put parameter description here>

  Default: *True*

``Nodata value, leave as none to take the nodata value from input`` [string]
  <put parameter description here>

  Default: *none*

``Expand`` [selection]
  <put parameter description here>

  Options:

  * 0 --- none
  * 1 --- gray
  * 2 --- rgb
  * 3 --- rgba

  Default: *0*

``Output projection for output file [leave blank to use input projection]`` [crs]
  <put parameter description here>

  Default: *None*

``Subset based on georeferenced coordinates`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Copy all subdatasets of this file to individual output files`` [boolean]
  <put parameter description here>

  Default: *False*

``Additional creation parameters`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

``Output raster type`` [selection]
  <put parameter description here>

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
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:translate', input, outsize, outsize_perc, no_data, expand, srs, projwin, sds, extra, rtype, output)

See also
--------

