Classification Map Regularization
=================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input classification image`` [raster]
  <put parameter description here>

``Structuring element radius (in pixels)`` [number]
  <put parameter description here>

  Default: *1*

``Multiple majority: Undecided(X)/Original`` [boolean]
  <put parameter description here>

  Default: *True*

``Label for the NoData class`` [number]
  <put parameter description here>

  Default: *0*

``Label for the Undecided class`` [number]
  <put parameter description here>

  Default: *0*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
-------

``Output regularized image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:classificationmapregularization', -io.in, -ip.radius, -ip.suvbool, -ip.nodatalabel, -ip.undecidedlabel, -ram, -io.out)

See also
--------

