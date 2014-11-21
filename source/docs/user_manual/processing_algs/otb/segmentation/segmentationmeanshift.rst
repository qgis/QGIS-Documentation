Segmentation (meanshift)
========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Segmentation algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- meanshift

  Default: *0*

``Spatial radius`` [number]
  <put parameter description here>

  Default: *5*

``Range radius`` [number]
  <put parameter description here>

  Default: *15*

``Mode convergence threshold`` [number]
  <put parameter description here>

  Default: *0.1*

``Maximum number of iterations`` [number]
  <put parameter description here>

  Default: *100*

``Minimum region size`` [number]
  <put parameter description here>

  Default: *100*

``Processing mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- vector

  Default: *0*

``Writing mode for the output vector file`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ulco
  * 1 --- ovw
  * 2 --- ulovw
  * 3 --- ulu

  Default: *0*

``Mask Image`` [raster]
  Optional.

  <put parameter description here>

``8-neighbor connectivity`` [boolean]
  <put parameter description here>

  Default: *True*

``Stitch polygons`` [boolean]
  <put parameter description here>

  Default: *True*

``Minimum object size`` [number]
  <put parameter description here>

  Default: *1*

``Simplify polygons`` [number]
  <put parameter description here>

  Default: *0.1*

``Layer name`` [string]
  <put parameter description here>

  Default: *layer*

``Geometry index field name`` [string]
  <put parameter description here>

  Default: *DN*

``Tiles size`` [number]
  <put parameter description here>

  Default: *1024*

``Starting geometry index`` [number]
  <put parameter description here>

  Default: *1*

``OGR options for layer creation`` [string]
  Optional.

  <put parameter description here>

  Default: *None*

Outputs
-------

``Output vector file`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:segmentationmeanshift', -in, -filter, -filter.meanshift.spatialr, -filter.meanshift.ranger, -filter.meanshift.thres, -filter.meanshift.maxiter, -filter.meanshift.minsize, -mode, -mode.vector.outmode, -mode.vector.inmask, -mode.vector.neighbor, -mode.vector.stitch, -mode.vector.minsize, -mode.vector.simplify, -mode.vector.layername, -mode.vector.fieldname, -mode.vector.tilesize, -mode.vector.startlabel, -mode.vector.ogroptions, -mode.vector.out)

See also
--------

