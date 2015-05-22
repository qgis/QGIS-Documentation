|updatedisclaimer|

Image filtering
===============

DimensionalityReduction (ica)
-----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ica

  Default: *0*

``number of iterations`` [number]
  <put parameter description here>

  Default: *20*

``Give the increment weight of W in [0, 1]`` [number]
  <put parameter description here>

  Default: *1*

``Number of Components`` [number]
  <put parameter description here>

  Default: *0*

``Normalize`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

`` Inverse Output Image`` [raster]
  <put output description here>

``Transformation matrix output`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:dimensionalityreductionica', -in, -method, -method.ica.iter, -method.ica.mu, -nbcomp, -normalize, -out, -outinv, -outmatrix)

See also
........

DimensionalityReduction (maf)
-----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- maf

  Default: *0*

``Number of Components.`` [number]
  <put parameter description here>

  Default: *0*

``Normalize.`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

``Transformation matrix output`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:dimensionalityreductionmaf', -in, -method, -nbcomp, -normalize, -out, -outmatrix)

See also
........

DimensionalityReduction (napca)
-------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- napca

  Default: *0*

``Set the x radius of the sliding window.`` [number]
  <put parameter description here>

  Default: *1*

``Set the y radius of the sliding window.`` [number]
  <put parameter description here>

  Default: *1*

``Number of Components.`` [number]
  <put parameter description here>

  Default: *0*

``Normalize.`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

`` Inverse Output Image`` [raster]
  <put output description here>

``Transformation matrix output`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:dimensionalityreductionnapca', -in, -method, -method.napca.radiusx, -method.napca.radiusy, -nbcomp, -normalize, -out, -outinv, -outmatrix)

See also
........

DimensionalityReduction (pca)
-----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- pca

  Default: *0*

``Number of Components.`` [number]
  <put parameter description here>

  Default: *0*

``Normalize.`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

`` Inverse Output Image`` [raster]
  <put output description here>

``Transformation matrix output`` [file]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:dimensionalityreductionpca', -in, -method, -nbcomp, -normalize, -out, -outinv, -outmatrix)

See also
........

Mean Shift filtering (can be used as Exact Large-Scale Mean-Shift segmentation, step 1)
---------------------------------------------------------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Spatial radius`` [number]
  <put parameter description here>

  Default: *5*

``Range radius`` [number]
  <put parameter description here>

  Default: *15*

``Mode convergence threshold`` [number]
  <put parameter description here>

  Default: *0.1*

``Maximum number of iterations`` [number]
  <put parameter description here>

  Default: *100*

``Range radius coefficient`` [number]
  <put parameter description here>

  Default: *0*

``Mode search.`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Filtered output`` [raster]
  <put output description here>

``Spatial image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:meanshiftfilteringcanbeusedasexactlargescalemeanshiftsegmentationstep1', -in, -spatialr, -ranger, -thres, -maxiter, -rangeramp, -modesearch, -fout, -foutpos)

See also
........

Smoothing (anidif)
------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Smoothing Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- anidif

  Default: *2*

``Time Step`` [number]
  <put parameter description here>

  Default: *0.125*

``Nb Iterations`` [number]
  <put parameter description here>

  Default: *10*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:smoothinganidif', -in, -ram, -type, -type.anidif.timestep, -type.anidif.nbiter, -out)

See also
........

Smoothing (gaussian)
--------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Smoothing Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- gaussian

  Default: *2*

``Radius`` [number]
  <put parameter description here>

  Default: *2*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:smoothinggaussian', -in, -ram, -type, -type.gaussian.radius, -out)

See also
........

Smoothing (mean)
----------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Smoothing Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- mean

  Default: *2*

``Radius`` [number]
  <put parameter description here>

  Default: *2*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:smoothingmean', -in, -ram, -type, -type.mean.radius, -out)

See also
........

