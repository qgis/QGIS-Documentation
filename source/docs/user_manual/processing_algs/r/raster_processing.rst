.. only:: html

   |updatedisclaimer|

Raster processing
=================

.. only:: html

   .. contents::
      :local:
      :depth: 1

Advanced raster histogram
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer`` [raster]
  <put parameter description here>

``Dens or Hist`` [string]
  <put parameter description here>

  Default: *Hist*

Outputs
.......

``R Plots`` [html]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:advancedrasterhistogram', layer, dens_or_hist, rplots)

See also
........

Raster histogram
----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Layer`` [raster]
  <put parameter description here>

Outputs
.......

``R Plots`` [html]
  <put output description here>

Console usage
.............

::

  processing.runalg('r:rasterhistogram', layer, rplots)

See also
........


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
