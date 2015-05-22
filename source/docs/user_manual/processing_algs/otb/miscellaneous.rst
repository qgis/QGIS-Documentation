|updatedisclaimer|

Miscellaneous
=============

Band Math
---------

Description
...........

<put algortithm description here>

Parameters
..........

``Input image list`` [multipleinput: rasters]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Expression`` [string]
  <put parameter description here>

  Default: *None*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:bandmath', -il, -ram, -exp, -out)

See also
........

ComputeModulusAndPhase-one (OneEntry)
-------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Number Of inputs`` [selection]
  <put parameter description here>

  Options:

  * 0 --- one

  Default: *0*

``Input image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Modulus`` [raster]
  <put output description here>

``Phase`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:computemodulusandphaseoneoneentry', -nbinput, -nbinput.one.in, -ram, -mod, -pha)

See also
........

ComputeModulusAndPhase-two (TwoEntries)
---------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Number Of inputs`` [selection]
  <put parameter description here>

  Options:

  * 0 --- two

  Default: *0*

``Real part input`` [raster]
  <put parameter description here>

``Imaginary part input`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Modulus`` [raster]
  <put output description here>

``Phase`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:computemodulusandphasetwotwoentries', -nbinput, -nbinput.two.re, -nbinput.two.im, -ram, -mod, -pha)

See also
........

Images comparaison
------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Reference image`` [raster]
  <put parameter description here>

``Reference image channel`` [number]
  <put parameter description here>

  Default: *1*

``Measured image`` [raster]
  <put parameter description here>

``Measured image channel`` [number]
  <put parameter description here>

  Default: *1*

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

Console usage
.............

::

  processing.runalg('otb:imagescomparaison', -ref.in, -ref.channel, -meas.in, -meas.channel, -roi.startx, -roi.starty, -roi.sizex, -roi.sizey)

See also
........

Image to KMZ Export
-------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input image`` [raster]
  <put parameter description here>

``Tile Size`` [number]
  <put parameter description here>

  Default: *512*

``Image logo`` [raster]
  Optional.

  <put parameter description here>

``Image legend`` [raster]
  Optional.

  <put parameter description here>

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Output .kmz product`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:imagetokmzexport', -in, -tilesize, -logo, -legend, -elev.default, -out)

See also
........

