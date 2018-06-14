.. only:: html

   |updatedisclaimer|

Table calculus
==============

.. only:: html

   .. contents::
      :local:
      :depth: 1

Fill gaps in records
--------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Table`` [table]
  <put parameter description here>

``Order`` [tablefield: any]
  <put parameter description here>

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbour
  * 1 --- [1] Linear
  * 2 --- [2] Spline

  Default: *0*

Outputs
.......

``Table without Gaps`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fillgapsinrecords', table, order, method, nogaps)

See also
........

Principle components analysis
-----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Table`` [table]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] correlation matrix
  * 1 --- [1] variance-covariance matrix
  * 2 --- [2] sums-of-squares-and-cross-products matrix

  Default: *0*

``Number of Components`` [number]
  <put parameter description here>

  Default: *3*

Outputs
.......

``Principle Components`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:principlecomponentsanalysis', table, method, nfirst, pca)

See also
........

Running average
---------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input`` [table]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Number of Records`` [number]
  <put parameter description here>

  Default: *10*

Outputs
.......

``Output`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:runningaverage', input, field, count, output)

See also
........


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
