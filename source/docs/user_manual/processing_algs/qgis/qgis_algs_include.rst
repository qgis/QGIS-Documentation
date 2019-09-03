:orphan:

.. The following section is included in network analysis algorithms, ie
 qgisserviceareafrompoint, qgisserviceareafromlayer, qgisshortestpathlayertopoint,
 qgisshortestpathpointtolayer and qgisshortestpathpointtopoint

**network_advanced_parameters**

``Direction field`` [tablefield: string]
  Optional

  The field used to specify directions for the network edges.

  The values used in this field are specified with the three parameters ``Value for
  forward direction``, ``Value for backward direction`` and ``Value for both directions``.
  Forward and reverse directions correspond to a one-way edge, "both directions"
  indicates a two-way edge.

  If a feature does not have a value in this field, or no field is set then the
  default direction setting (provided with the ``Default direction`` parameter)
  is used.

``Value for forward direction`` [string]
  Optional

  Value set in the direction field to identify edges with a forward direction.

``Value for backward direction`` [string]
  Optional

  Value set in the direction field to identify edges with a backward direction.

``Value for both directions`` [string]
  Optional

  Value set in the direction field to identify bidirectional edges.

``Default direction`` [enumeration]
  If a feature has no value set in the direction field or if no direction field is set,
  then this direction value is used.

  Available options are:

  * 0 --- Forward direction
  * 1 --- Backward direction
  * 2 --- Both directions

  Default: *2*

``Speed field`` [tablefield: string]
  Optional

  Field providing the speed value (in ``km/h``) for the edges of the network when
  looking for the fastest path.

  If a feature does not have a value in this field, or no field is set then the
  default speed value (provided with the ``Default speed`` parameter) is used.

  ``Default speed (km/h)`` [number]
    Value to use to calculate the travel time if no speed field is provided for an edge.

    Default: *50.0*

  ``Topology tolerance`` [number]
    Two lines with nodes closer than the specified tolerance are considered connected.

    Default: *0.0*

**end_network_advanced_parameters**
