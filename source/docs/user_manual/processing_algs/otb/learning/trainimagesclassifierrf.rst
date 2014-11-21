TrainImagesClassifier (rf)
==========================

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

  * 0 --- rf

  Default: *0*

``Maximum depth of the tree`` [number]
  <put parameter description here>

  Default: *5*

``Minimum number of samples in each node`` [number]
  <put parameter description here>

  Default: *10*

``Termination Criteria for regression tree`` [number]
  <put parameter description here>

  Default: *0*

``Cluster possible values of a categorical variable into K <= cat clusters to find a suboptimal split`` [number]
  <put parameter description here>

  Default: *10*

``Size of the randomly selected subset of features at each tree node`` [number]
  <put parameter description here>

  Default: *0*

``Maximum number of trees in the forest`` [number]
  <put parameter description here>

  Default: *100*

``Sufficient accuracy (OOB error)`` [number]
  <put parameter description here>

  Default: *0.01*

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

  processing.runalg('otb:trainimagesclassifierrf', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.rf.max, -classifier.rf.min, -classifier.rf.ra, -classifier.rf.cat, -classifier.rf.var, -classifier.rf.nbtrees, -classifier.rf.acc, -rand, -io.confmatout, -io.out)

See also
--------

