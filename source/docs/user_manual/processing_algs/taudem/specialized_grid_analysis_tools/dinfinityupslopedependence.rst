D-Infinity Upslope Dependence
=============================

Description
-----------

The D-Infinity Upslope Dependence tool quantifies the amount each grid cell in
the domain contributes to a destination set of grid cells. D-Infinity flow
directions proportion flow from each grid cell between multiple downslope grid
cells. Following this flow field downslope the amount of flow originating at
each grid cell that reaches the destination zone is defined. Upslope influence
is evaluated using a downslope recursion, examining grid cells downslope from
each grid cell, so that the map produced identifies the area upslope where flow
through the destination zone originates, or the area it depends on, for its flow.

The figures below illustrate the amount each source point in the domain ``x``
(blue) contributes to the destination point or zone ``y`` (red). If the indicator
weighted contributing area function is denoted ``I(y; x)`` giving the weighted
contribution using a unit value (1) from specific grid cells ``y`` to grid cells
``x``, then the upslope dependence is: ``D(x; y) = I(y; x)``.

.. figure:: /static/user_manual/processing_algs/taudem/dependence.gif
   :align: center

This is useful for example to track where flow or a flow related substance or
contaminant that enters a destination area may come from.

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  A grid giving flow direction by the D-Infinity method where the flow
  direction angle is determined as the direction of the steepest downward slope
  on the eight triangular facets formed in a 3x3 grid cell window centered on
  the grid cell of interest. This grid can be produced using the
  **"D-Infinity Flow Direction"** tool.

``Destination Grid`` [raster]
  A grid that encodes the destination zone that may receive flow from upslope.
  This grid must be 1 inside the zone y and 0 over the rest of the domain.

Outputs
-------

``Output Upslope Dependence Grid`` [raster]
  A grid quantifing the amount each source point in the domain contributes to
  the zone defined by the destination grid.

Console usage
-------------

::

  processing.runalg('taudem:dinfinityupslopedependence', -ang, -dg, -dep)

See also
--------

