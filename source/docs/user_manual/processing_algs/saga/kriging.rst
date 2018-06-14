.. only:: html

   |updatedisclaimer|

Kriging
=======

.. only:: html

   .. contents::
      :local:
      :depth: 1

Ordinary kriging (global)
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Create Variance Grid`` [boolean]
  <put parameter description here>

  Default: *True*

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Variogram Model`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Spherical Model
  * 1 --- [1] Exponential Model
  * 2 --- [2] Gaussian Model
  * 3 --- [3] Linear Regression
  * 4 --- [4] Exponential Regression
  * 5 --- [5] Power Function Regression

  Default: *0*

``Block Kriging`` [boolean]
  <put parameter description here>

  Default: *True*

``Block Size`` [number]
  <put parameter description here>

  Default: *100*

``Logarithmic Transformation`` [boolean]
  <put parameter description here>

  Default: *True*

``Nugget`` [number]
  <put parameter description here>

  Default: *0.0*

``Sill`` [number]
  <put parameter description here>

  Default: *0.0*

``Range`` [number]
  <put parameter description here>

  Default: *0.0*

``Linear Regression`` [number]
  <put parameter description here>

  Default: *1.0*

``Exponential Regression`` [number]
  <put parameter description here>

  Default: *0.1*

``Power Function - A`` [number]
  <put parameter description here>

  Default: *1.0*

``Power Function - B`` [number]
  <put parameter description here>

  Default: *0.5*

``Grid Size`` [number]
  <put parameter description here>

  Default: *1.0*

``Fit Extent`` [boolean]
  <put parameter description here>

  Default: *True*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

Outputs
.......

``Grid`` [raster]
  <put output description here>

``Variance`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:ordinarykrigingglobal', shapes, field, bvariance, target, model, block, dblock, blog, nugget, sill, range, lin_b, exp_b, pow_a, pow_b, user_cell_size, user_fit_extent, output_extent, grid, variance)

See also
........

Ordinary kriging
----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Create Variance Grid`` [boolean]
  <put parameter description here>

  Default: *True*

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Variogram Model`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Spherical Model
  * 1 --- [1] Exponential Model
  * 2 --- [2] Gaussian Model
  * 3 --- [3] Linear Regression
  * 4 --- [4] Exponential Regression
  * 5 --- [5] Power Function Regression

  Default: *0*

``Block Kriging`` [boolean]
  <put parameter description here>

  Default: *True*

``Block Size`` [number]
  <put parameter description here>

  Default: *100*

``Logarithmic Transformation`` [boolean]
  <put parameter description here>

  Default: *True*

``Nugget`` [number]
  <put parameter description here>

  Default: *0.0*

``Sill`` [number]
  <put parameter description here>

  Default: *10.0*

``Range`` [number]
  <put parameter description here>

  Default: *100.0*

``Linear Regression`` [number]
  <put parameter description here>

  Default: *1.0*

``Exponential Regression`` [number]
  <put parameter description here>

  Default: *0.1*

``Power Function - A`` [number]
  <put parameter description here>

  Default: *1*

``Power Function - B`` [number]
  <put parameter description here>

  Default: *0.5*

``Maximum Search Radius (map units)`` [number]
  <put parameter description here>

  Default: *1000.0*

``Min.Number of m_Points`` [number]
  <put parameter description here>

  Default: *4*

``Max. Number of m_Points`` [number]
  <put parameter description here>

  Default: *20*

``Grid Size`` [number]
  <put parameter description here>

  Default: *1.0*

``Fit Extent`` [boolean]
  <put parameter description here>

  Default: *True*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

Outputs
.......

``Grid`` [raster]
  <put output description here>

``Variance`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:ordinarykriging', shapes, field, bvariance, target, model, block, dblock, blog, nugget, sill, range, lin_b, exp_b, pow_a, pow_b, maxradius, npoints_min, npoints_max, user_cell_size, user_fit_extent, output_extent, grid, variance)

See also
........

Universal kriging (global)
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Create Variance Grid`` [boolean]
  <put parameter description here>

  Default: *True*

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Variogram Model`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Spherical Model
  * 1 --- [1] Exponential Model
  * 2 --- [2] Gaussian Model
  * 3 --- [3] Linear Regression
  * 4 --- [4] Exponential Regression
  * 5 --- [5] Power Function Regression

  Default: *0*

``Block Kriging`` [boolean]
  <put parameter description here>

  Default: *True*

``Block Size`` [number]
  <put parameter description here>

  Default: *100*

``Logarithmic Transformation`` [boolean]
  <put parameter description here>

  Default: *True*

``Nugget`` [number]
  <put parameter description here>

  Default: *0.0*

``Sill`` [number]
  <put parameter description here>

  Default: *0.0*

``Range`` [number]
  <put parameter description here>

  Default: *0.0*

``Linear Regression`` [number]
  <put parameter description here>

  Default: *1*

``Exponential Regression`` [number]
  <put parameter description here>

  Default: *0.5*

``Power Function - A`` [number]
  <put parameter description here>

  Default: *1.0*

``Power Function - B`` [number]
  <put parameter description here>

  Default: *0.1*

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Grid Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

``Grid Size`` [number]
  <put parameter description here>

  Default: *1.0*

``Fit Extent`` [boolean]
  <put parameter description here>

  Default: *True*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

Outputs
.......

``Grid`` [raster]
  <put output description here>

``Variance`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:universalkrigingglobal', shapes, field, bvariance, target, model, block, dblock, blog, nugget, sill, range, lin_b, exp_b, pow_a, pow_b, grids, interpol, user_cell_size, user_fit_extent, output_extent, grid, variance)

See also
........

Universal kriging
-----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Create Variance Grid`` [boolean]
  <put parameter description here>

  Default: *True*

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Variogram Model`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Spherical Model
  * 1 --- [1] Exponential Model
  * 2 --- [2] Gaussian Model
  * 3 --- [3] Linear Regression
  * 4 --- [4] Exponential Regression
  * 5 --- [5] Power Function Regression

  Default: *0*

``Block Kriging`` [boolean]
  <put parameter description here>

  Default: *True*

``Block Size`` [number]
  <put parameter description here>

  Default: *100*

``Logarithmic Transformation`` [boolean]
  <put parameter description here>

  Default: *True*

``Nugget`` [number]
  <put parameter description here>

  Default: *0.0*

``Sill`` [number]
  <put parameter description here>

  Default: *0.0*

``Range`` [number]
  <put parameter description here>

  Default: *0.0*

``Linear Regression`` [number]
  <put parameter description here>

  Default: *1.0*

``Exponential Regression`` [number]
  <put parameter description here>

  Default: *0.1*

``Power Function - A`` [number]
  <put parameter description here>

  Default: *1*

``Power Function - B`` [number]
  <put parameter description here>

  Default: *0.5*

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Grid Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

``Min.Number of m_Points`` [number]
  <put parameter description here>

  Default: *4*

``Max. Number of m_Points`` [number]
  <put parameter description here>

  Default: *20*

``Maximum Search Radius (map units)`` [number]
  <put parameter description here>

  Default: *1000.0*

``Grid Size`` [number]
  <put parameter description here>

  Default: *1.0*

``Fit Extent`` [boolean]
  <put parameter description here>

  Default: *True*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

Outputs
.......

``Grid`` [raster]
  <put output description here>

``Variance`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:universalkriging', shapes, field, bvariance, target, model, block, dblock, blog, nugget, sill, range, lin_b, exp_b, pow_a, pow_b, grids, interpol, npoints_min, npoints_max, maxradius, user_cell_size, user_fit_extent, output_extent, grid, variance)

See also
........


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
