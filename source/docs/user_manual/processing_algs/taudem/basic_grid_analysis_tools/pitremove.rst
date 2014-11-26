Pit Remove
==========

Description
-----------

Identifies all pits in the DEM and raises their elevation to the level of the
lowest pour point around their edge. Pits are low elevation areas in digital
elevation models (DEMs) that are completely surrounded by higher terrain. They
are generally taken to be artifacts that interfere with the routing of flow
across DEMs, so are removed by raising their elevation to the point where they
drain off the edge of the domain. The pour point is the lowest point on the
boundary of the "watershed" draining to the pit. This step is not essential if
you have reason to believe that the pits in your DEM are real. If a few pits
actually exist and so should not be removed, while at the same time others are
believed to be artifacts that need to be removed, the actual pits should have
NODATA elevation values inserted at their lowest point. NODATA values serve
to define edges in the domain, and elevations are only raised to where flow is
off an edge, so an internal NODATA value will stop a pit from being removed,
if necessary.

Parameters
----------

``Elevation Grid`` [raster]
  A digital elevation model (DEM) grid to serve as the base input for the
  terrain analysis and stream delineation.

Outputs
-------

``Pit Removed Elevation Grid`` [raster]
  A grid of elevation values with pits removed so that flow is routed off of
  the domain.

Console usage
-------------

::

  processing.runalg('taudem:pitremove', -z, -fel)

See also
--------

