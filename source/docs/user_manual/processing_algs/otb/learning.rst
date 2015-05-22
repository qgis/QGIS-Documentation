|updatedisclaimer|

Learning
========

Classification Map Regularization
---------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Output regularized image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:classificationmapregularization', -io.in, -ip.radius, -ip.suvbool, -ip.nodatalabel, -ip.undecidedlabel, -ram, -io.out)

See also
........

ComputeConfusionMatrix (raster)
-------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Ground truth`` [selection]
  <put parameter description here>

  Options:

  * 0 --- raster

  Default: *0*

``Input reference image`` [raster]
  <put parameter description here>

``Value for nodata pixels`` [number]
  <put parameter description here>

  Default: *0*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Matrix output`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:computeconfusionmatrixraster', -in, -ref, -ref.raster.in, -nodatalabel, -ram, -out)

See also
........

ComputeConfusionMatrix (vector)
-------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Ground truth`` [selection]
  <put parameter description here>

  Options:

  * 0 --- vector

  Default: *0*

``Input reference vector data`` [file]
  <put parameter description here>

``Field name`` [string]
  Optional.

  <put parameter description here>

  Default: *Class*

``Value for nodata pixels`` [number]
  <put parameter description here>

  Default: *0*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Matrix output`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:computeconfusionmatrixvector', -in, -ref, -ref.vector.in, -ref.vector.field, -nodatalabel, -ram, -out)

See also
........

Compute Images second order statistics
--------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input images`` [multipleinput: rasters]
  <put parameter description here>

``Background Value`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Output XML file`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:computeimagessecondorderstatistics', -il, -bv, -out)

See also
........

FusionOfClassifications (dempstershafer)
----------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``The output classification image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:fusionofclassificationsdempstershafer', -il, -method, -method.dempstershafer.cmfl, -method.dempstershafer.mob, -nodatalabel, -undecidedlabel, -out)

See also
........

FusionOfClassifications (majorityvoting)
----------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``The output classification image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:fusionofclassificationsmajorityvoting', -il, -method, -nodatalabel, -undecidedlabel, -out)

See also
........

Image Classification
--------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Input Mask`` [raster]
  Optional.

  <put parameter description here>

``Model file`` [file]
  <put parameter description here>

``Statistics file`` [file]
  Optional.

  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:imageclassification', -in, -mask, -model, -imstat, -ram, -out)

See also
........

SOM Classification
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``InputImage`` [raster]
  <put parameter description here>

``ValidityMask`` [raster]
  Optional.

  <put parameter description here>

``TrainingProbability`` [number]
  <put parameter description here>

  Default: *1*

``TrainingSetSize`` [number]
  <put parameter description here>

  Default: *0*

``StreamingLines`` [number]
  <put parameter description here>

  Default: *0*

``SizeX`` [number]
  <put parameter description here>

  Default: *32*

``SizeY`` [number]
  <put parameter description here>

  Default: *32*

``NeighborhoodX`` [number]
  <put parameter description here>

  Default: *10*

``NeighborhoodY`` [number]
  <put parameter description here>

  Default: *10*

``NumberIteration`` [number]
  <put parameter description here>

  Default: *5*

``BetaInit`` [number]
  <put parameter description here>

  Default: *1*

``BetaFinal`` [number]
  <put parameter description here>

  Default: *0.1*

``InitialValue`` [number]
  <put parameter description here>

  Default: *0*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``set user defined seed`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``OutputImage`` [raster]
  <put output description here>

``SOM Map`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:somclassification', -in, -vm, -tp, -ts, -sl, -sx, -sy, -nx, -ny, -ni, -bi, -bf, -iv, -ram, -rand, -out, -som)

See also
........

TrainImagesClassifier (ann)
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Output confusion matrix`` [file]
  <put output description here>

``Output model`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:trainimagesclassifierann', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.ann.t, -classifier.ann.sizes, -classifier.ann.f, -classifier.ann.a, -classifier.ann.b, -classifier.ann.bpdw, -classifier.ann.bpms, -classifier.ann.rdw, -classifier.ann.rdwm, -classifier.ann.term, -classifier.ann.eps, -classifier.ann.iter, -rand, -io.confmatout, -io.out)

See also
........

TrainImagesClassifier (bayes)
-----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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

  * 0 --- bayes

  Default: *0*

``set user defined seed`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Output confusion matrix`` [file]
  <put output description here>

``Output model`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:trainimagesclassifierbayes', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -rand, -io.confmatout, -io.out)

See also
........

TrainImagesClassifier (boost)
-----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Output confusion matrix`` [file]
  <put output description here>

``Output model`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:trainimagesclassifierboost', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.boost.t, -classifier.boost.w, -classifier.boost.r, -classifier.boost.m, -rand, -io.confmatout, -io.out)

See also
........

TrainImagesClassifier (dt)
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Output confusion matrix`` [file]
  <put output description here>

``Output model`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:trainimagesclassifierdt', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.dt.max, -classifier.dt.min, -classifier.dt.ra, -classifier.dt.cat, -classifier.dt.f, -classifier.dt.r, -classifier.dt.t, -rand, -io.confmatout, -io.out)

See also
........

TrainImagesClassifier (gbt)
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Output confusion matrix`` [file]
  <put output description here>

``Output model`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:trainimagesclassifiergbt', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.gbt.w, -classifier.gbt.s, -classifier.gbt.p, -classifier.gbt.max, -rand, -io.confmatout, -io.out)

See also
........

TrainImagesClassifier (knn)
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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

  * 0 --- knn

  Default: *0*

``Number of Neighbors`` [number]
  <put parameter description here>

  Default: *32*

``set user defined seed`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Output confusion matrix`` [file]
  <put output description here>

``Output model`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:trainimagesclassifierknn', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.knn.k, -rand, -io.confmatout, -io.out)

See also
........

TrainImagesClassifier (libsvm)
------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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

  * 0 --- libsvm

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

``Parameters optimization`` [boolean]
  <put parameter description here>

  Default: *True*

``set user defined seed`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Output confusion matrix`` [file]
  <put output description here>

``Output model`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:trainimagesclassifierlibsvm', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.libsvm.k, -classifier.libsvm.c, -classifier.libsvm.opt, -rand, -io.confmatout, -io.out)

See also
........

TrainImagesClassifier (rf)
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Output confusion matrix`` [file]
  <put output description here>

``Output model`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:trainimagesclassifierrf', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.rf.max, -classifier.rf.min, -classifier.rf.ra, -classifier.rf.cat, -classifier.rf.var, -classifier.rf.nbtrees, -classifier.rf.acc, -rand, -io.confmatout, -io.out)

See also
........

TrainImagesClassifier (svm)
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Output confusion matrix`` [file]
  <put output description here>

``Output model`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:trainimagesclassifiersvm', -io.il, -io.vd, -io.imstat, -elev.default, -sample.mt, -sample.mv, -sample.edg, -sample.vtr, -sample.vfn, -classifier, -classifier.svm.m, -classifier.svm.k, -classifier.svm.c, -classifier.svm.nu, -classifier.svm.coef0, -classifier.svm.gamma, -classifier.svm.degree, -classifier.svm.opt, -rand, -io.confmatout, -io.out)

See also
........

Unsupervised KMeans image classification
----------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Validity Mask`` [raster]
  Optional.

  <put parameter description here>

``Training set size`` [number]
  <put parameter description here>

  Default: *100*

``Number of classes`` [number]
  <put parameter description here>

  Default: *5*

``Maximum number of iterations`` [number]
  <put parameter description here>

  Default: *1000*

``Convergence threshold`` [number]
  <put parameter description here>

  Default: *0.0001*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

``Centroid filename`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:unsupervisedkmeansimageclassification', -in, -ram, -vm, -ts, -nc, -maxit, -ct, -out, -outmeans)

See also
........

