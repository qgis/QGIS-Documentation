TrainImagesClassifier (boost)
=============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image List`` [multipleinput: rasters]
  <put parameter description here>

``Input Vector Data List`` [multipleinput: any vectors]
  <put parameter description here>

``Input XML image statistics file`` [file]
  Optional.

  <put parameter description here>

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

``Maximum training sample size per class`` [number]
  <put parameter description here>

  Default: *1000*

``Maximum validation sample size per class`` [number]
  <put parameter description here>

  Default: *1000*

``On edge pixel inclusion`` [boolean]
  <put parameter description here>

  Default: *True*

``Training and validation sample ratio`` [number]
  <put parameter description here>

  Default: *0.5*

``Name of the discrimination field`` [string]
  <put parameter description here>

  Default: *Class*

``Classifier to use for the training`` [selection]
  <put parameter description here>

  Options:

  * 0 --- boost

  Default: *0*

``Boost Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- discrete
  * 1 --- real
  * 2 --- logit
  * 3 --- gentle

  Default: *1*

``Weak count`` [number]
  <put parameter description here>

  Default: *100*

``Weight Trim Rate`` [number]
  <put parameter description here>

  Default: *0.95*

``Maximum depth of the tree`` [number]
  <put parameter description here>

  Default: *1*

``set user defined seed`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Output confusion matrix`` [file]
  <put output description here>

``Output model`` [file]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:trainimagesclassifierboost', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.boost.t, -classifier.boost.w, -classifier.boost.r, -classifier.boost.m, -rand, -io.confmatout, -io.out)

See also
--------

