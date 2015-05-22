|updatedisclaimer|

Image manipulation
==================

ColorMapping (continuous)
-------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- labeltocolor

  Default: *0*

``Color mapping method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- continuous

  Default: *0*

``Look-up tables`` [selection]
  <put parameter description here>

  Options:

  * 0 --- red
  * 1 --- green
  * 2 --- blue
  * 3 --- grey
  * 4 --- hot
  * 5 --- cool
  * 6 --- spring
  * 7 --- summer
  * 8 --- autumn
  * 9 --- winter
  * 10 --- copper
  * 11 --- jet
  * 12 --- hsv
  * 13 --- overunder
  * 14 --- relief

  Default: *0*

``Mapping range lower value`` [number]
  <put parameter description here>

  Default: *0*

``Mapping range higher value`` [number]
  <put parameter description here>

  Default: *255*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:colormappingcontinuous', -in, -ram, -op, -method, -method.continuous.lut, -method.continuous.min, -method.continuous.max, -out)

See also
........

ColorMapping (custom)
---------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- labeltocolor

  Default: *0*

``Color mapping method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- custom

  Default: *0*

``Look-up table file`` [file]
  <put parameter description here>

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:colormappingcustom', -in, -ram, -op, -method, -method.custom.lut, -out)

See also
........

ColorMapping (image)
--------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- labeltocolor

  Default: *0*

``Color mapping method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- image

  Default: *0*

``Support Image`` [raster]
  <put parameter description here>

``NoData value`` [number]
  <put parameter description here>

  Default: *0*

``lower quantile`` [number]
  <put parameter description here>

  Default: *2*

``upper quantile`` [number]
  <put parameter description here>

  Default: *2*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:colormappingimage', -in, -ram, -op, -method, -method.image.in, -method.image.nodatavalue, -method.image.low, -method.image.up, -out)

See also
........

ColorMapping (optimal)
----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- labeltocolor

  Default: *0*

``Color mapping method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- optimal

  Default: *0*

``Background label`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:colormappingoptimal', -in, -ram, -op, -method, -method.optimal.background, -out)

See also
........

ExtractROI (fit)
----------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Extraction mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- fit

  Default: *0*

``Reference image`` [raster]
  <put parameter description here>

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:extractroifit', -in, -ram, -mode, -mode.fit.ref, -mode.fit.elev.default, -out)

See also
........

ExtractROI (standard)
---------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Extraction mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- standard

  Default: *0*

``Start X`` [number]
  <put parameter description here>

  Default: *0*

``Start Y`` [number]
  <put parameter description here>

  Default: *0*

``Size X`` [number]
  <put parameter description here>

  Default: *0*

``Size Y`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:extractroistandard', -in, -ram, -mode, -startx, -starty, -sizex, -sizey, -out)

See also
........

Images Concatenation
--------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input images list`` [multipleinput: rasters]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:imagesconcatenation', -il, -ram, -out)

See also
........

Image Tile Fusion
-----------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Tile Images`` [multipleinput: rasters]
  <put parameter description here>

``Number of tile columns`` [number]
  <put parameter description here>

  Default: *0*

``Number of tile rows`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:imagetilefusion', -il, -cols, -rows, -out)

See also
........

Read image information
----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Display the OSSIM keywordlist`` [boolean]
  <put parameter description here>

  Default: *True*

``GCPs Id`` [string]
  <put parameter description here>

  Default: *None*

``GCPs Info`` [string]
  <put parameter description here>

  Default: *None*

``GCPs Image Coordinates`` [string]
  <put parameter description here>

  Default: *None*

``GCPs Geographic Coordinates`` [string]
  <put parameter description here>

  Default: *None*

Outputs
.......

Console usage
.............

::

  processing.runalg('otb:readimageinformation', -in, -keywordlist, -gcp.ids, -gcp.info, -gcp.imcoord, -gcp.geocoord)

See also
........

Rescale Image
-------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Output min value`` [number]
  <put parameter description here>

  Default: *0*

``Output max value`` [number]
  <put parameter description here>

  Default: *255*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:rescaleimage', -in, -ram, -outmin, -outmax, -out)

See also
........

Split Image
-----------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Output Image`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:splitimage', -in, -ram, -out)

See also
........

