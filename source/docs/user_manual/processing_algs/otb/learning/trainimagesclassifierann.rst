TrainImagesClassifier (ann)
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

  * 0 --- ann

  Default: *0*

``Train Method Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- reg
  * 1 --- back

  Default: *0*

``Number of neurons in each intermediate layer`` [string]
  <put parameter description here>

  Default: *None*

``Neuron activation function type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ident
  * 1 --- sig
  * 2 --- gau

  Default: *1*

``Alpha parameter of the activation function`` [number]
  <put parameter description here>

  Default: *1*

``Beta parameter of the activation function`` [number]
  <put parameter description here>

  Default: *1*

``Strength of the weight gradient term in the BACKPROP method`` [number]
  <put parameter description here>

  Default: *0.1*

``Strength of the momentum term (the difference between weights on the 2 previous iterations)`` [number]
  <put parameter description here>

  Default: *0.1*

``Initial value Delta_0 of update-values Delta_{ij} in RPROP method`` [number]
  <put parameter description here>

  Default: *0.1*

``Update-values lower limit Delta_{min} in RPROP method`` [number]
  <put parameter description here>

  Default: *1e-07*

``Termination criteria`` [selection]
  <put parameter description here>

  Options:

  * 0 --- iter
  * 1 --- eps
  * 2 --- all

  Default: *2*

``Epsilon value used in the Termination criteria`` [number]
  <put parameter description here>

  Default: *0.01*

``Maximum number of iterations used in the Termination criteria`` [number]
  <put parameter description here>

  Default: *1000*

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

  processing.runalg('otb:trainimagesclassifierann', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.ann.t, -classifier.ann.sizes, -classifier.ann.f, -classifier.ann.a, -classifier.ann.b, -classifier.ann.bpdw, -classifier.ann.bpms, -classifier.ann.rdw, -classifier.ann.rdwm, -classifier.ann.term, -classifier.ann.eps, -classifier.ann.iter, -rand, -io.confmatout, -io.out)

See also
--------

