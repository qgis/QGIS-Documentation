TrainImagesClassifier (gbt)
===========================

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

  * 0 --- gbt

  Default: *0*

``Number of boosting algorithm iterations`` [number]
  <put parameter description here>

  Default: *200*

``Regularization parameter`` [number]
  <put parameter description here>

  Default: *0.01*

``Portion of the whole training set used for each algorithm iteration`` [number]
  <put parameter description here>

  Default: *0.8*

``Maximum depth of the tree`` [number]
  <put parameter description here>

  Default: *3*

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

  processing.runalg('otb:trainimagesclassifiergbt', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.gbt.w, -classifier.gbt.s, -classifier.gbt.p, -classifier.gbt.max, -rand, -io.confmatout, -io.out)

See also
--------

