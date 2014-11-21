Shapes to grid
==============

Description
-----------

<put algortithm description here>

Parameters
----------

``Shapes`` [vector: any]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Method for Multiple Values`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] first
  * 1 --- [1] last
  * 2 --- [2] minimum
  * 3 --- [3] maximum
  * 4 --- [4] mean

  Default: *0*

``Method for Lines`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] thin
  * 1 --- [1] thick

  Default: *0*

``Preferred Target Grid Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Integer (1 byte)
  * 1 --- [1] Integer (2 byte)
  * 2 --- [2] Integer (4 byte)
  * 3 --- [3] Floating Point (4 byte)
  * 4 --- [4] Floating Point (8 byte)

  Default: *0*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Cellsize`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
-------

``Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:shapestogrid', input, field, multiple, line_type, grid_type, output_extent, user_size, user_grid)

See also
--------

