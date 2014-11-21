FusionOfClassifications (dempstershafer)
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

  * 0 --- dempstershafer

  Default: *0*

``Confusion Matrices`` [multipleinput: files]
  <put parameter description here>

``Mass of belief measurement`` [selection]
  <put parameter description here>

  Options:

  * 0 --- precision
  * 1 --- recall
  * 2 --- accuracy
  * 3 --- kappa

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

  processing.runalg('otb:fusionofclassificationsdempstershafer', -il, -method, -method.dempstershafer.cmfl, -method.dempstershafer.mob, -nodatalabel, -undecidedlabel, -out)

See also
--------

