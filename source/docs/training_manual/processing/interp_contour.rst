.. only:: html

   |updatedisclaimer|

Interpolation and contouring
=============================

Module contributed by Paolo Cavallini - `Faunalia <https://www.faunalia.eu>`_

.. note:: This chapter shows how to use different backends to calculate different interpolations.

Interpolation
---------------

The project shows a gradient in rainfall, from south to north.
Let's use different methods for interpolation, all based on vector ``points.shp``, parameter ``RAIN``:

.. warning:: Set cell size to :kbd:`500` for all analyses.

- :menuselection:`GRASS --> v.surf.rst`
- :menuselection:`SAGA --> Multilevel B-Spline Interpolation`
- :menuselection:`SAGA --> Inverse Distance Weighted` [Inverse distance to a power; Power: 4; Search radius: Global; Search range: all points]
- :menuselection:`GDAL --> Grid (Inverse Distance to a power)` [Power:4]
- :menuselection:`GDAL --> Grid (Moving average)` [Radius1&2: 50000]

Then measure variation among methods and correlate it with distance to points:

- :menuselection:`GRASS --> r.series` [Unselect Propagate NULLs, Aggregate operation: stddev]
- :menuselection:`GRASS --> v.to.rast.value` on ``points.shp``
- :menuselection:`GDAL --> Proximity`
- :menuselection:`GRASS --> r.covar` to show the correlation matrix; check the
  significance of the correlation e.g. with http://vassarstats.net/rsig.html.
 
Thus, areas far from points will have less accurate interpolation.

Contour
---------

Various methods to draw contour lines [always step= 10] on the *stddev* raster:

- :menuselection:`GRASS --> r.contour.step`
- :menuselection:`GDAL --> Contour`
- :menuselection:`SAGA --> Contour lines from grid` [**NB:** in some older SAGA versions, output shp is not valid, known bug]


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
