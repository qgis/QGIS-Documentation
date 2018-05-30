.. only:: html

   |updatedisclaimer|

Imagery RGA
===========

.. only:: html

   .. contents::
      :local:
      :depth: 1

Fast region growing algorithm
-----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Grids`` [multipleinput: rasters]
  <put parameter description here>

``Seeds Grid`` [raster]
  <put parameter description here>

``Smooth Rep`` [raster]
  Optional.

  <put parameter description here>

Outputs
.......

``Segmente`` [raster]
  <put output description here>

``Mean`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fastregiongrowingalgorithm', input, start, rep, result, mean)

See also
........


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
