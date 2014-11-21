Random terrain generation
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Radius (cells)`` [number]
  <put parameter description here>

  Default: *10*

``Iterations`` [number]
  <put parameter description here>

  Default: *10*

``Target Dimensions`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] User defined

  Default: *0*

``Grid Size`` [number]
  <put parameter description here>

  Default: *1.0*

``Cols`` [number]
  <put parameter description here>

  Default: *100*

``Rows`` [number]
  <put parameter description here>

  Default: *100*

Outputs
-------

``Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:randomterraingeneration', radius, iterations, target_type, user_cell_size, user_cols, user_rows, target_grid)

See also
--------

