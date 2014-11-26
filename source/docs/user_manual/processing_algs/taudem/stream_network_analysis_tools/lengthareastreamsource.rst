Length Area Stream Source
=========================

Description
-----------

Creates an indicator grid (1, 0) that evaluates ``A >= (M)(Ly)`` based on upslope
path length, D8 contributing area grid inputs, and parameters ``M`` and ``y``.
This grid indicates likely stream source grid cells. This is an experimental
method with theoretical basis in Hack's law which states that for streams
``L ~ A 0.6``. However for hillslopes with parallel flow ``L ~ A``. So a transition
from hillslopes to streams may be represented by ``L ~ A 0.8`` suggesting
identifying grid cells as stream cells if ``A > M (L (1/0.8))``.

Parameters
----------

``Length Grid`` [raster]
  A grid of the maximum upslope length for each cell. This is calculated as the
  length of the flow path from the furthest cell that drains to each cell.
  Length is measured between cell centers taking into account cell size and
  whether the direction is adjacent or diagonal. It is this length (``L``) that
  is used in the formula, ``A >(M)(Ly)``, to determine which cells are
  considered stream cells. This grid can be obtained as an output from the
  **"Grid Network"** tool.

``Contributing Area Grid`` [raster]
  A grid of contributing area values for each cell that were calculated using
  the D8 algorithm. The contributing area for a cell is the sum of its own
  contribution plus the contribution from all upslope neighbors that drain to
  it, measured as a number of cells. This grid is typically obtained as the
  output of the **"D8 Contributing Area"** tool. In this tool, it is the
  contributing area (``A``) that is compared in the formula ``A > (M)(Ly)`` to
  determine the transition to a stream.

``Threshold`` [number]
  The multiplier threshold (``M``) parameter which is used in the formula:
  ``A > (M)(Ly)``, to identify the beginning of streams.

  Default: *0.03*

``Exponent`` [number]
  The exponent (``y``) parameter which is used in the formula: ``A > (M)(Ly)``,
  to identify the beginning of streams. In branching systems, Hack's law
  uggests that ``L = 1/M A(1/y)`` with ``1/y = 0.6`` (or 0.56) (``y`` about 1.7).
  In parallel flow systems ``L`` is proportional to ``A`` (``y`` about 1). This
  method tries to identify the transition between these two paradigms by using
  an exponent ``y`` somewhere in between (``y`` about 1.3).

  Default: *1.3*

Outputs
-------

``Stream Source Grid`` [raster]
  An indicator grid (1,0) that evaluates A >= (M)(L^y), based on the maximum
  upslope path length, the D8 contributing area grid inputs, and parameters ``M``
  and ``y``. This grid indicates likely stream source grid cells.

Console usage
-------------

::

  processing.runalg('taudem:lengthareastreamsource', length_grid, contrib_area_grid, threshold, exponent, stream_source_grid)

See also
--------

