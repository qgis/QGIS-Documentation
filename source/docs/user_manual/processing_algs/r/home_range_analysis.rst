|updatedisclaimer|

Home range
==========

Characteristic hull method
--------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

``Field`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Home_ranges`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:characteristichullmethod', layer, field, home_ranges)

See also
........

Kernel h ref
------------

Description
...........

<put algortithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

``Field`` [tablefield: any]
  <put parameter description here>

``Grid`` [number]
  <put parameter description here>

  Default: *10.0*

``Percentage`` [number]
  <put parameter description here>

  Default: *10.0*

``Folder`` [directory]
  Optional.

  <put parameter description here>

Outputs
.......

``Home_ranges`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:kernelhref', layer, field, grid, percentage, folder, home_ranges)

See also
........

Minimum convex polygon
----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

``Percentage`` [number]
  <put parameter description here>

  Default: *10.0*

``Field`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Home_ranges`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:minimumconvexpolygon', layer, percentage, field, home_ranges)

See also
........

Single-linkage cluster analysis
-------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Layer`` [vector: any]
  <put parameter description here>

``Field`` [tablefield: any]
  <put parameter description here>

``Percentage`` [number]
  <put parameter description here>

  Default: *10.0*

Outputs
.......

``R Plots`` [html]
  <put output description here>

``Home_ranges`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:singlelinkageclusteranalysis', layer, field, percentage, rplots, home_ranges)

See also
........

