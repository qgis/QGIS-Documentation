D-Infinity Avalanche Runout
===========================

Description
-----------

Identifies an avalanche's affected area and the flow path length to each cell in
that affacted area. All cells downslope from each source area cell, up to the
point where the slope from the source to the affected area is less than a
threshold angle called the Alpha Angle can be in the affected area. This tool
uses the D-infinity multiple flow direction method for determining flow direction.
This will likely cause very small amounts of flow to be dispersed to some
downslope cells that might overstate the affected area, so a threshold proportion
can be set to avoid this excess dispersion. The flow path length is the distance
from the cell in question to the source cell that has the highest angle.

All points downslope from the source area are potentially in the affected area,
but not beyond a point where the slope from the source to the affected area is
less than a threshold angle called the Alpha Angle.

.. figure:: /static/user_manual/processing_algs/taudem/arexample.gif
   :align: center

Slope is to be measured using the straight line distance from source point to
evaluation point.

It makes more physical sense to me for the angle to be measured along the flow
path. Nevertheless it is equally easy to code straight line angles as angles
along the flow path, so an option that allows switching will be provided. The
most practical way to evaluate avalanche runout is to keep track of the source
point with the greatest angle to each point. Then the recursive upslope flow
algebra approach will look at a grid cell and all its upslope neighbors that flow
to it. Information from the upslope neighbors will be used to calculate the angle
to the grid cell in question and retain it in the runout zone if the angle exceeds
the alpha angle. This procedure makes the assumption that the maximum angle at a
grid cell will be from the set of cells that have maximum angles to the inflowing
neighbors. This will always be true of angle is calculated along a flow path, but
I can conceive of cases where flow paths bend back on themselves where this would
not be the case for straight line angles.

The D-infinity multiple flow direction field assigns flow from each grid cell to
multiple downslope neighbors using proportions (``Pik``) that vary between 0 and
1 and sum to 1 for all flows out of a grid cell. It may be desirable to specify
a threshold ``T`` that this proportion has to exceed before a grid cell is counted
as flowing to a downslope grid cell, e.g. ``Pik > T`` (=0.2 say) to avoid
dispersion to grid cells that get very little flow. ``T`` will be specified as a
user input. If all upslope grid cells are to be used ``T`` may be input as 0.

Avalanche source sites are to be input as a short integer grid (name suffix
:file:`*ass`, e.g. :file:`demass`) comprised of positive values where avalanches
may be triggered and 0 values elsewhere.

The following grids are output:

* rz --- A runout zone indicator with value 0 to indicate that this grid cell is
  not in the runout zone and value > 0 to indicate that this grid cell is in the
  runout zone. Since there may be information in the angle to the associated
  source site, this variable will be assigned the angle to the source site (in
  degrees)
* dm --- Along flow distance from the source site that has the highest angle to
  the point in question

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  A grid giving flow direction by the D-infinity method. Flow direction is
  measured in radians, counter clockwise from east. This can be created  by the
  tool **"D-Infinity Flow Directions"**.

``Pit Filled Elevation Grid`` [raster]
  This input is a grid of elevation values. As a general rule, it is recommended
  that you use a grid of elevation values that have had the pits removed for
  this input. Pits are generally taken to be artifacts that interfere with the
  analysis of flow across them. This grid can be obtained as the output of the
  **"Pit Remove"** tool, in which case it contains elevation values where the
  pits have been filled to the point where they just drain.

``Avalanche Source Site Grid`` [raster]
  This is a grid of source areas for snow avalanches that are commonly
  identified manually using a mix of experience and visual interpretation of
  maps. Avalanche source sites are to be input as a short integer grid (name
  suffix :file:`*ass`, e.g. :file:`demass`) comprised of positive values where
  avalanches may be triggered and 0 values elsewhere.

``Proportion Threshold`` [number]
  This value is a threshold proportion that is used to limit the disperson of
  flow caused by using the D-infinity multiple flow direction method for
  determining flow direction. The D-infinity multiple flow direction method
  often causes very small amounts of flow to be dispersed to some downslope
  cells that might overstate the affected area, so a threshold proportion can
  be set to avoid this excess dispersion.

  Default: *0.2*

``Alpha Angle Threshold`` [number]
  This value is the threshold angle, called the Alpha Angle, that is used to
  determine which of the cells downslope from the source cells are in the
  affected area. Only the cells downslope from each source area cell, up to the
  point where the slope from the source to the affected area is less than a
  threshold angle are in the affected area.

  Default: *18*

``Measure distance along flow path`` [boolean]
  This option selects the method used to measure the distance used to calculate
  the slope angle. If option is *True* then measure it along the flow path,
  where the *False* option causes the slope to be measure along the straight
  line distance from the source cell to the evaluation cell.

  Default: *True*

Outputs
-------

``Runout Zone Grid`` [raster]
  This grid Identifies the avalanche's runout zone (affected area) using a
  runout zone indicator with value 0 to indicate that this grid cell is not in
  the runout zone and value > 0 to indicate that this grid cell is in the
  runout zone. Since there may be information in the angle to the associated
  source site, this variable will be assigned the angle to the source site
  (in degrees).

``Path Distance Grid`` [raster]
  This is a grid of the flow distance from the source site that has the highest
  angle to each cell.

Console usage
-------------

::

  processing.runalg('taudem:dinfinityavalancherunout', -ang, -fel, -ass, -thresh, -alpha, -direct, -rz, -dfs)

See also
--------

