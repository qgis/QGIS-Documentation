Aggregate point observations
============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Reference Points`` [vector: any]
  <put parameter description here>

``ID`` [tablefield: any]
  <put parameter description here>

``Observations`` [table]
  <put parameter description here>

``X`` [tablefield: any]
  <put parameter description here>

``Y`` [tablefield: any]
  <put parameter description here>

``Track`` [tablefield: any]
  <put parameter description here>

``Date`` [tablefield: any]
  <put parameter description here>

``Time`` [tablefield: any]
  <put parameter description here>

``Parameter`` [tablefield: any]
  <put parameter description here>

``Maximum Time Span (Seconds)`` [number]
  <put parameter description here>

  Default: *60.0*

``Maximum Distance`` [number]
  <put parameter description here>

  Default: *0.002*

Outputs
-------

``Aggregated`` [table]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:aggregatepointobservations', reference, reference_id, observations, x, y, track, date, time, parameter, eps_time, eps_space, aggregated)

See also
--------

