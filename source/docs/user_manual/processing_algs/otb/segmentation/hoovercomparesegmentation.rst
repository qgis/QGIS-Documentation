Hoover compare segmentation
===========================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Colored ground truth output`` [raster]
  <put output description here>

``Colored machine segmentation output`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:hoovercomparesegmentation', -ingt, -inms, -bg, -th, -rc, -rf, -ra, -rm, -outgt, -outms)

See also
--------

