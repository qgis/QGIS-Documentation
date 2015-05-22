|updatedisclaimer|

Stereo
======

Stereo Framework
----------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input images list`` [multipleinput: rasters]
  <put parameter description here>

``Couples list`` [string]
  Optional.

  <put parameter description here>

  Default: *None*

``Image channel used for the block matching`` [number]
  <put parameter description here>

  Default: *1*

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

``Output resolution`` [number]
  <put parameter description here>

  Default: *1*

``NoData value`` [number]
  <put parameter description here>

  Default: *-32768*

``Method to fuse measures in each DSM cell`` [selection]
  <put parameter description here>

  Options:

  * 0 --- max
  * 1 --- min
  * 2 --- mean
  * 3 --- acc

  Default: *0*

``Parameters estimation modes`` [selection]
  <put parameter description here>

  Options:

  * 0 --- fit
  * 1 --- user

  Default: *0*

``Upper Left X`` [number]
  <put parameter description here>

  Default: *0.0*

``Upper Left Y`` [number]
  <put parameter description here>

  Default: *0.0*

``Size X`` [number]
  <put parameter description here>

  Default: *0*

``Size Y`` [number]
  <put parameter description here>

  Default: *0*

``Pixel Size X`` [number]
  <put parameter description here>

  Default: *0.0*

``Pixel Size Y`` [number]
  <put parameter description here>

  Default: *0.0*

``Output Cartographic Map Projection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- utm
  * 1 --- lambert2
  * 2 --- lambert93
  * 3 --- wgs
  * 4 --- epsg

  Default: *3*

``Zone number`` [number]
  <put parameter description here>

  Default: *31*

``Northern Hemisphere`` [boolean]
  <put parameter description here>

  Default: *True*

``EPSG Code`` [number]
  <put parameter description here>

  Default: *4326*

``Step of the deformation grid (in pixels)`` [number]
  <put parameter description here>

  Default: *16*

``Sub-sampling rate for epipolar grid inversion`` [number]
  <put parameter description here>

  Default: *10*

``Block-matching metric`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ssdmean
  * 1 --- ssd
  * 2 --- ncc
  * 3 --- lp

  Default: *0*

``p value`` [number]
  <put parameter description here>

  Default: *1*

``Radius of blocks for matching filter (in pixels)`` [number]
  <put parameter description here>

  Default: *2*

``Minimum altitude offset (in meters)`` [number]
  <put parameter description here>

  Default: *-20*

``Maximum altitude offset (in meters)`` [number]
  <put parameter description here>

  Default: *20*

``Use bijection consistency in block matching strategy`` [boolean]
  <put parameter description here>

  Default: *True*

``Use median disparities filtering`` [boolean]
  <put parameter description here>

  Default: *True*

``Correlation metric threshold`` [number]
  <put parameter description here>

  Default: *0.6*

``Input left mask`` [raster]
  Optional.

  <put parameter description here>

``Input right mask`` [raster]
  Optional.

  <put parameter description here>

``Discard pixels with low local variance`` [number]
  <put parameter description here>

  Default: *50*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Output DSM`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:stereoframework', -input.il, -input.co, -input.channel, -elev.default, -output.res, -output.nodata, -output.fusionmethod, -output.mode, -output.mode.user.ulx, -output.mode.user.uly, -output.mode.user.sizex, -output.mode.user.sizey, -output.mode.user.spacingx, -output.mode.user.spacingy, -map, -map.utm.zone, -map.utm.northhem, -map.epsg.code, -stereorect.fwdgridstep, -stereorect.invgridssrate, -bm.metric, -bm.metric.lp.p, -bm.radius, -bm.minhoffset, -bm.maxhoffset, -postproc.bij, -postproc.med, -postproc.metrict, -mask.left, -mask.right, -mask.variancet, -ram, -output.out)

See also
........

