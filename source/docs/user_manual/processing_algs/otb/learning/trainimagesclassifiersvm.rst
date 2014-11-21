TrainImagesClassifier (svm)
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

  * 0 --- svm

  Default: *0*

``SVM Model Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- csvc
  * 1 --- nusvc
  * 2 --- oneclass

  Default: *0*

``SVM Kernel Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- linear
  * 1 --- rbf
  * 2 --- poly
  * 3 --- sigmoid

  Default: *0*

``Cost parameter C`` [number]
  <put parameter description here>

  Default: *1*

``Parameter nu of a SVM optimization problem (NU_SVC / ONE_CLASS)`` [number]
  <put parameter description here>

  Default: *0*

``Parameter coef0 of a kernel function (POLY / SIGMOID)`` [number]
  <put parameter description here>

  Default: *0*

``Parameter gamma of a kernel function (POLY / RBF / SIGMOID)`` [number]
  <put parameter description here>

  Default: *1*

``Parameter degree of a kernel function (POLY)`` [number]
  <put parameter description here>

  Default: *1*

``Parameters optimization`` [boolean]
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

  processing.runalg('otb:trainimagesclassifiersvm', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.svm.m, -classifier.svm.k, -classifier.svm.c, -classifier.svm.nu, -classifier.svm.coef0, -classifier.svm.gamma, -classifier.svm.degree, -classifier.svm.opt, -rand, -io.confmatout, -io.out)

See also
--------

