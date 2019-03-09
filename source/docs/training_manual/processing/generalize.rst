.. only:: html

   |updatedisclaimer|

Vector simplification and smoothing
====================================

Module contributed by Paolo Cavallini - `Faunalia <https://www.faunalia.eu>`_

.. note:: This chapter shows how simplify vectors, and smooth out sharp corners.

Sometimes we need a simplified version of a vector, to have a smaller file size
and get rid of unnecessary details. Many tools do this in a very rough way, and
miss the adjacency and sometimes the topological correctness of polygons. GRASS
is the ideal tool for this: being a topological GIS, adjacency and correctness
are preserved even at very high simplification levels.
In our case, we have a vector resulting from a raster, thus showing a "saw" pattern
at borders. Applying a simplification results in straight lines:

- :menuselection:`GRASS --> v.generalize` [Maximal tolerance value: 30 m]

We can also do the reverse, and make a layer more complex, smoothing out sharp corners:

- :menuselection:`GRASS --> v.generalize` [method: chaiken]

Try to apply this second command both to original vector and to the one from the
first analysis, and see the difference. Note that adjacency is not lost.

This second option can be applied e.g. to contour lines resulting from a coarse
raster, to GPS tracks with sparse vertices, etc.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
