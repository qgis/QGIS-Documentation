|updatedisclaimer|

Segmentation
============

Connected Component Segmentation
--------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Mask expression`` [string]
  Optional.

  <put parameter description here>

  Default: *None*

``Connected Component Expression`` [string]
  <put parameter description here>

  Default: *None*

``Minimum Object Size`` [number]
  <put parameter description here>

  Default: *2*

``OBIA Expression`` [string]
  Optional.

  <put parameter description here>

  Default: *None*

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Output Shape`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:connectedcomponentsegmentation', -in, -mask, -expr, -minsize, -obia, -elev.default, -out)

See also
........

Exact Large-Scale Mean-Shift segmentation, step 2
-------------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Filtered image`` [raster]
  <put parameter description here>

``Spatial image`` [raster]
  Optional.

  <put parameter description here>

``Range radius`` [number]
  <put parameter description here>

  Default: *15*

``Spatial radius`` [number]
  <put parameter description here>

  Default: *5*

``Minimum Region Size`` [number]
  <put parameter description here>

  Default: *0*

``Size of tiles in pixel (X-axis)`` [number]
  <put parameter description here>

  Default: *500*

``Size of tiles in pixel (Y-axis)`` [number]
  <put parameter description here>

  Default: *500*

``Directory where to write temporary files`` [file]
  Optional.

  <put parameter description here>

``Temporary files cleaning`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:exactlargescalemeanshiftsegmentationstep2', -in, -inpos, -ranger, -spatialr, -minsize, -tilesizex, -tilesizey, -tmpdir, -cleanup, -out)

See also
........

Exact Large-Scale Mean-Shift segmentation, step 3 (optional)
------------------------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input image`` [raster]
  <put parameter description here>

``Segmented image`` [raster]
  <put parameter description here>

``Minimum Region Size`` [number]
  <put parameter description here>

  Default: *50*

``Size of tiles in pixel (X-axis)`` [number]
  <put parameter description here>

  Default: *500*

``Size of tiles in pixel (Y-axis)`` [number]
  <put parameter description here>

  Default: *500*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:exactlargescalemeanshiftsegmentationstep3optional', -in, -inseg, -minsize, -tilesizex, -tilesizey, -out)

See also
........

Exact Large-Scale Mean-Shift segmentation, step 4
-------------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Segmented image`` [raster]
  <put parameter description here>

``Size of tiles in pixel (X-axis)`` [number]
  <put parameter description here>

  Default: *500*

``Size of tiles in pixel (Y-axis)`` [number]
  <put parameter description here>

  Default: *500*

Outputs
.......

``Output GIS vector file`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:exactlargescalemeanshiftsegmentationstep4', -in, -inseg, -tilesizex, -tilesizey, -out)

See also
........

Hoover compare segmentation
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input ground truth`` [raster]
  <put parameter description here>

``Input machine segmentation`` [raster]
  <put parameter description here>

``Background label`` [number]
  <put parameter description here>

  Default: *0*

``Overlapping threshold`` [number]
  <put parameter description here>

  Default: *0.75*

``Correct detection score`` [number]
  <put parameter description here>

  Default: *0.0*

``Over-segmentation score`` [number]
  <put parameter description here>

  Default: *0.0*

``Under-segmentation score`` [number]
  <put parameter description here>

  Default: *0.0*

``Missed detection score`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Colored ground truth output`` [raster]
  <put output description here>

``Colored machine segmentation output`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:hoovercomparesegmentation', -ingt, -inms, -bg, -th, -rc, -rf, -ra, -rm, -outgt, -outms)

See also
........

Segmentation (cc)
-----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Segmentation algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- cc

  Default: *0*

``Condition`` [string]
  <put parameter description here>

  Default: *None*

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
.......

``Output vector file`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:segmentationcc', -in, -filter, -filter.cc.expr, -mode, -mode.vector.outmode, -mode.vector.inmask, -mode.vector.neighbor, -mode.vector.stitch, -mode.vector.minsize, -mode.vector.simplify, -mode.vector.layername, -mode.vector.fieldname, -mode.vector.tilesize, -mode.vector.startlabel, -mode.vector.ogroptions, -mode.vector.out)

See also
........

Segmentation (edison)
---------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Segmentation algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- edison

  Default: *0*

``Spatial radius`` [number]
  <put parameter description here>

  Default: *5*

``Range radius`` [number]
  <put parameter description here>

  Default: *15*

``Minimum region size`` [number]
  <put parameter description here>

  Default: *100*

``Scale factor`` [number]
  <put parameter description here>

  Default: *1*

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
.......

``Output vector file`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:segmentationedison', -in, -filter, -filter.edison.spatialr, -filter.edison.ranger, -filter.edison.minsize, -filter.edison.scale, -mode, -mode.vector.outmode, -mode.vector.inmask, -mode.vector.neighbor, -mode.vector.stitch, -mode.vector.minsize, -mode.vector.simplify, -mode.vector.layername, -mode.vector.fieldname, -mode.vector.tilesize, -mode.vector.startlabel, -mode.vector.ogroptions, -mode.vector.out)

See also
........

Segmentation (meanshift)
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Output vector file`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:segmentationmeanshift', -in, -filter, -filter.meanshift.spatialr, -filter.meanshift.ranger, -filter.meanshift.thres, -filter.meanshift.maxiter, -filter.meanshift.minsize, -mode, -mode.vector.outmode, -mode.vector.inmask, -mode.vector.neighbor, -mode.vector.stitch, -mode.vector.minsize, -mode.vector.simplify, -mode.vector.layername, -mode.vector.fieldname, -mode.vector.tilesize, -mode.vector.startlabel, -mode.vector.ogroptions, -mode.vector.out)

See also
........

Segmentation (mprofiles)
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Segmentation algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- mprofiles

  Default: *0*

``Profile Size`` [number]
  <put parameter description here>

  Default: *5*

``Initial radius`` [number]
  <put parameter description here>

  Default: *1*

``Radius step.`` [number]
  <put parameter description here>

  Default: *1*

``Threshold of the final decision rule`` [number]
  <put parameter description here>

  Default: *1*

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
.......

``Output vector file`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:segmentationmprofiles', -in, -filter, -filter.mprofiles.size, -filter.mprofiles.start, -filter.mprofiles.step, -filter.mprofiles.sigma, -mode, -mode.vector.outmode, -mode.vector.inmask, -mode.vector.neighbor, -mode.vector.stitch, -mode.vector.minsize, -mode.vector.simplify, -mode.vector.layername, -mode.vector.fieldname, -mode.vector.tilesize, -mode.vector.startlabel, -mode.vector.ogroptions, -mode.vector.out)

See also
........

Segmentation (watershed)
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Segmentation algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- watershed

  Default: *0*

``Depth Threshold`` [number]
  <put parameter description here>

  Default: *0.01*

``Flood Level`` [number]
  <put parameter description here>

  Default: *0.1*

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
.......

``Output vector file`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:segmentationwatershed', -in, -filter, -filter.watershed.threshold, -filter.watershed.level, -mode, -mode.vector.outmode, -mode.vector.inmask, -mode.vector.neighbor, -mode.vector.stitch, -mode.vector.minsize, -mode.vector.simplify, -mode.vector.layername, -mode.vector.fieldname, -mode.vector.tilesize, -mode.vector.startlabel, -mode.vector.ogroptions, -mode.vector.out)

See also
........

