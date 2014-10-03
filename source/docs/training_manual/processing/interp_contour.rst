Interpolation and contouring
=============================

Module contributed by Paolo Cavallini - `Faunalia <http://www.faunalia.eu>`_

.. note:: This chapter shows how to use different backends to calculate different interpolations.

Interpolation
---------------

The project shows a gradient in rainfall, from south to north.
Let's use different methods for interpolation, all based on vector ``points.shp``, parameter ``RAIN``:

.. warning:: set cell size to :kbd:`500`

- :menuselection:`GRASS --> v.surf.rst`
- :menuselection:`SAGA --> Multilevel B-Spline Interpolation`
- :menuselection:`SAGA --> Inverse Distance Weighted` [Power: 4; Search range: Global]
- :menuselection:`GDAL --> Grid (Inverse Distance to a power)` [Power:4]
- :menuselection:`GDAL --> Grid (Moving average)` [Radius1&2: 50000]

**TODO:**
   measure concordance between methods, and correlate it with distance to points (areas far from points will have less accurate interpolation)

Contour
---------

Various methods to draw contour lines [always step= 10]:

- :menuselection:`GRASS --> r.contour.step`
- :menuselection:`SAGA --> Contour Lines from Grid`
- :menuselection:`GDAL --> Contour`
