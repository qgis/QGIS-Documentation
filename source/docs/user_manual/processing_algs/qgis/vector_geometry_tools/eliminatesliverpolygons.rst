Eliminate sliver polygons
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: polygon]
  <put parameter description here>

``Use current selection in input layer (works only if called from toolbox)`` [boolean]
  <put parameter description here>

  Default: *False*

``Selection attribute`` [tablefield: any]
  <put parameter description here>

``Comparison`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ==
  * 1 --- !=
  * 2 --- >
  * 3 --- >=
  * 4 --- <
  * 5 --- <=
  * 6 --- begins with
  * 7 --- contains

  Default: *0*

``Value`` [string]
  <put parameter description here>

  Default: *0*

``Merge selection with the neighbouring polygon with the`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Largest area
  * 1 --- Smallest Area
  * 2 --- Largest common boundary

  Default: *0*

Outputs
-------

``Cleaned layer`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:eliminatesliverpolygons', input, keepselection, attribute, comparison, comparisonvalue, mode, output)

See also
--------

