FusionOfClassifications (majorityvoting)
========================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input classifications`` [multipleinput: rasters]
  <put parameter description here>

``Fusion method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- majorityvoting

  Default: *0*

``Label for the NoData class`` [number]
  <put parameter description here>

  Default: *0*

``Label for the Undecided class`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``The output classification image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:fusionofclassificationsmajorityvoting', -il, -method, -nodatalabel, -undecidedlabel, -out)

See also
--------

