TrainImagesClassifier (dt)
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

  * 0 --- dt

  Default: *0*

``Maximum depth of the tree`` [number]
  <put parameter description here>

  Default: *65535*

``Minimum number of samples in each node`` [number]
  <put parameter description here>

  Default: *10*

``Termination criteria for regression tree`` [number]
  <put parameter description here>

  Default: *0.01*

``Cluster possible values of a categorical variable into K <= cat clusters to find a suboptimal split`` [number]
  <put parameter description here>

  Default: *10*

``K-fold cross-validations`` [number]
  <put parameter description here>

  Default: *10*

``Set Use1seRule flag to false`` [boolean]
  <put parameter description here>

  Default: *True*

``Set TruncatePrunedTree flag to false`` [boolean]
  <put parameter description here>

  Default: *True*

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

  processing.runalg('otb:trainimagesclassifierdt', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.dt.max, -classifier.dt.min, -classifier.dt.ra, -classifier.dt.cat, -classifier.dt.f, -classifier.dt.r, -classifier.dt.t, -rand, -io.confmatout, -io.out)

See also
--------

