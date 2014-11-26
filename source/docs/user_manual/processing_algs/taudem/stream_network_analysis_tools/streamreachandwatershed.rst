Stream Reach and Watershed
==========================

Description
-----------

This tool produces a vector network and shapefile from the stream raster grid.
The flow direction grid is used to connect flow paths along the stream raster.
The Strahler order of each stream segment is computed. The subwatershed draining
to each stream segment (reach) is also delineated and labeled with the value
identifier that corresponds to the WSNO (watershed number) attribute in the
Stream Reach Shapefile.

This tool orders the stream network according to the Strahler ordering system.
Streams that don't have any other streams draining in to them are order 1. When
two stream reaches of different order join the order of the downstream reach is
the order of the highest incoming reach. When two reaches of equal order join
the downstream reach order is increased by 1. When more than two reaches join
the downstream reach order is calculated as the maximum of the highest incoming
reach order or the second highest incoming reach order + 1. This generalizes the
common definition to cases where more than two reaches join at a point. The
network topological connectivity is stored in the Stream Network Tree file, and
coordinates and attributes from each grid cell along the network are stored in
the Network Coordinates file.

The stream raster grid is used as the source for the stream network, and the flow
direction grid is used to trace connections within the stream network. Elevations
and contributing area are used to determine the elevation and contributing area
attributes in the network coordinate file. Points in the outlets shapefile are
used to logically split stream reaches to facilitate representing watersheds
upstream and downstream of monitoring points. The program uses the attribute field
"id" in the outlets shapefile as identifiers in the Network Tree file. This tool
then translates the text file vector network representation in the Network Tree
and Coordinates files into a shapefile. Further attributes are also evaluated.
The program has an option to delineate a single watershed by representing the
entire area draining to the Stream Network as a single value in the output
watershed grid.

Parameters
----------

``Pit Filled Elevation Grid`` [raster]
  A grid of elevation values. This is usually the output of the
  **"Pit Remove"** tool, in which case it is elevations with pits removed.

``D8 Flow Direction Grid`` [raster]
  A grid of D8 flow directions which are defined, for each cell, as the
  direction of the one of its eight adjacent or diagonal neighbors with the
  steepest downward slope. This grid can be obtained as the output of the
  **"D8 Flow Directions"** tool.

``D8 Drainage Area`` [raster]
  A grid giving the contributing area value in terms of the number of grid
  cells (or the summation of weights) for each cell taken as its own
  contribution plus the contribution from upslope neighbors that drain in to it
  using the D8 algorithm. This is usually the output of the
  **"D8 Contributing Area"** tool and is used to determine the contributing area
  attribute in the Network Coordinate file.

``Stream Raster Grid`` [raster]
  An indicator grid indicating streams, by using a grid cell value of 1 on
  streams and 0 off streams. Several of the **"Stream Network Analysis"** tools
  produce this type of grid. The Stream Raster Grid is used as the source for
  the stream network.

``Outlets Shapefile as Network Nodes`` [vector: point]
  Optional.

  A point shape file defining points of interest. If this file is used, the
  tool will only deliiniate the stream network upstream of these outlets.
  Additionally, points in the Outlets Shapefile are used to logically split
  stream reaches to facilitate representing watersheds upstream and downstream
  of monitoring points. This tool REQUIRES THAT THERE BE an integer attribute
  field "id" in the Outlets Shapefile, because the "id" values are used as
  identifiers in the Network Tree file.

``Delineate Single Watershed`` [boolean]
  This option causes the tool to delineate a single watershed by representing
  the entire area draining to the Stream Network as a single value in the output
  watershed grid. Otherwise a seperate watershed is delineated for each stream
  reach. Default is *False* (seperate watershed).

  Default: *False*

Outputs
-------

``Stream Order Grid`` [raster]
  The Stream Order Grid has cells values of streams ordered according to the
  Strahler order system. The Strahler ordering system defines order 1 streams
  as stream reaches that don't have any other reaches draining in to them. When
  two stream reaches of different order join the order of the downstream reach
  is the order of the highest incoming reach. When two reaches of equal order
  join the downstream reach order is increased by 1. When more than two reaches
  join the downstream reach order is calculated as the maximum of the highest
  incoming reach order or the second highest incoming reach order + 1. This
  generalizes the common definition to cases where more than two flow paths
  reaches join at a point.

``Watershed Grid`` [raster]
  This output grid identified each reach watershed with a unique ID number, or
  in the case where the delineate single watershed option was checked, the
  entire area draining to the stream network is identified with a single ID.

``Stream Reach Shapefile`` [vector]
  This output is a polyline shapefile giving the links in a stream network. The
  columns in the attribute table are:

  * LINKNO --- Link Number. A unique number associated with each link (segment
    of channel between junctions). This is arbitrary and will vary depending on
    number of processes used
  * DSLINKNO --- Link Number of the downstream link. -1 indicates that this does
    not exist
  * USLINKNO1 --- Link Number of first upstream link. (-1 indicates no link
    upstream, i.e. for a source link)
  * USLINKNO2 --- Link Number of second upstream link. (-1 indicates no second
    link upstream, i.e. for a source link or an internal monitoring point where
    the reach is logically split but the network does not bifurcate)
  * DSNODEID --- Node identifier for node at downstream end of stream reach. This
    identifier corresponds to the "id" attribute from the Outlets shapefile used
    to designate nodes
  * Order --- Strahler Stream Order
  * Length --- Length of the link. The units are the horizontal map units of the
    underlying DEM grid
  * Magnitude --- Shreve Magnitude of the link. This is the total number of
    sources upstream
  * DS_Cont_Ar --- Drainage area at the downstream end of the link. Generally
    this is one grid cell upstream of the downstream end because the drainage
    area at the downstream end grid cell includes the area of the stream being
    joined
  * Drop --- Drop in elevation from the start to the end of the link
  * Slope --- Average slope of the link (computed as drop/length)
  * Straight_L --- Straight line distance from the start to the end of the link
  * US_Cont_Ar --- Drainage area at the upstream end of the link
  * WSNO --- Watershed number. Cross reference to the :file:`*w.shp` and
    :file:`*w` grid files giving the identification number of the watershed
    draining directly to the link
  * DOUT_END --- Distance to the eventual outlet (i.e. the most downstream point
    in the stream network) from the downstream end of the link
  * DOUT_START --- Distance to the eventual outlet from the upstream end of the
    link
  * DOUT_MID --- Distance to the eventual outlet from the midpoint of the link

``Network Connectivity Tree`` [file]
  This output is a text file that details the network topological connectivity
  is stored in the Stream Network Tree file. Columns are as follows:

  * Link Number (Arbitrary --- will vary depending on number of processes used)
  * Start Point Number in Network coordinates (:file:`*coord.dat)` file
    (Indexed from 0)
  * End Point Number in Network coordinates (:file:`*coord.dat`) file
    (Indexed from 0)
  * Next (Downstream) Link Number. Points to Link Number. -1 indicates no links
    downstream, i.e. a terminal link
  * First Previous (Upstream) Link Number. Points to Link Number. -1 indicates
    no upstream links
  * Second Previous (Upstream) Link Numbers. Points to Link Number. -1 indicates
    no upstream links. Where only one previous link is -1, it indicates an
    internal monitoring point where the reach is logically split, but the network
    does not bifurcate
  * Strahler Order of Link
  * Monitoring point identifier at downstream end of link. -1 indicates
    downstream end is not a monitoring point
  * Network magnitude of the link, calculated as the number of upstream sources
    (following Shreve)

``Network Coordinates`` [file]
  This output is a text file that contains the coordinates and attributes of
  points along the stream network. Columns are as follows:

  * X coordinate
  * Y Coordinate
  * Distance along channels to the downstream end of a terminal link
  * Elevation
  * Contributing area

Console usage
-------------

::

  processing.runalg('taudem:streamreachandwatershed', -fel, -p, -ad8, -src, -o, -sw, -ord, -w, -net, -tree, -coord)

See also
--------

