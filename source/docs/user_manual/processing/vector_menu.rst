.. only:: html

   |updatedisclaimer|

.. index:: Vector
.. _vector_menu:

Vector menu
============

.. only:: html

   .. contents::
      :local:

:guilabel:`Vector` menu provides a one-stop resource for many common vector-based GIS tasks.
It provides a growing suite of spatial data management and analysis functions
that are both fast and functional. These features are part of the processing
framework. Note that some plugins can add other features so, in this chapter,
only default features from processing framework will be listed.

Processing framework is automatically installed and, like any plugin, can be
enabled and disabled using the Plugin Manager (see :ref:`managing_plugins`).
When enabled, the Processing plugin adds a :menuselection:`Vector` menu to
QGIS, providing functions ranging from Analysis and Research Tools to Geometry
and Geoprocessing Tools, as well as several useful Data Management Tools.

See :ref:`label_processing` for more information about the processing framework.

.. _`vector_function`:

.. index::
   single: Analysis tools

.. _table_vector_analysis:

Analysis tools
..............
+---------------------+-----------------+--------------------------------------+
| **Icon**            | **Tool**        | **Purpose**                          |
+=====================+=================+======================================+
| |matrix|            | Distance matrix | Measure distances between two point  |
|                     |                 | layers, and output results as a)     |
|                     |                 | Square distance matrix, b) Linear    |
|                     |                 | distance matrix, or c) Summary of    |
|                     |                 | distances. Can limit distances to    |
|                     |                 | the k nearest features.              |
+---------------------+-----------------+--------------------------------------+
| |sumLines|          | Sum line length | Calculate the total sum of line      |
|                     |                 | lengths for each polygon of a polygon|
|                     |                 | vector layer.                        |
+---------------------+-----------------+--------------------------------------+
| |sumPoints|         | Points in       | Count the number of points that occur|
|                     | polygon         | in each polygon of an input polygon  |
|                     |                 | vector layer.                        |
+---------------------+-----------------+--------------------------------------+
| |unique|            | List unique     | List all unique values in an input   |
|                     | values          | vector layer field.                  |
+---------------------+-----------------+--------------------------------------+
| |basicStatistics|   | Basic statistics| Compute basic statistics (mean, std  |
|                     | for text field  | dev, N, sum, CV) on an input text    |
|                     |                 | field.                               |
+---------------------+-----------------+--------------------------------------+
| |basicStatistics|   | Basic statistics| Compute basic statistics (mean, std  |
|                     | for numeric     | dev, N, sum, CV) on an input numeric |
|                     | field           | field                                |
+---------------------+-----------------+--------------------------------------+
| |neighbor|          | Nearest         | Compute nearest neighbor statistics  |
|                     | neighbor        | to assess the level of clustering in |
|                     | analysis        | a point vector layer.                |
+---------------------+-----------------+--------------------------------------+
| |mean|              | Mean            | Compute either the normal or         |
|                     | coordinate(s)   | weighted mean center of an entire    |
|                     |                 | vector layer, or multiple features   |
|                     |                 | based on a unique ID field.          |
+---------------------+-----------------+--------------------------------------+
| |intersections|     | Line            | Locate intersections between lines,  |
|                     | intersections   | and output results as a point        |
|                     |                 | shapefile.  Useful for locating road |
|                     |                 | or stream intersections, ignores     |
|                     |                 | line intersections with length > 0.  |
+---------------------+-----------------+--------------------------------------+

Table tools 1: Default tools in Analysis group

.. index::
   single: Research tools
.. _table_vector_research:

Research tools
..............

+--------------------+-------------------+--------------------------------------+
| **Icon**           | **Tool**          | **Purpose**                          |
+====================+===================+======================================+
| |randomSelection|  | Random selection  | Randomly select n number of features,|
|                    |                   | or n percentage of features.         |
+--------------------+-------------------+--------------------------------------+
| |subSelection|     | Random selection  | Randomly select features within      |
|                    | within subsets    | subsets based on a unique ID field.  |
+--------------------+-------------------+--------------------------------------+
| |randomPoints|     | Random points     | Generate pseudo-random points over a |
|                    | inside polygons   | polygon layer (variable number of    |
|                    |                   | point or fixed number of point).     |
+--------------------+-------------------+--------------------------------------+
| |randomPoints|     | Random points in  | Generate pseudo-random points over a |
|                    | extent            | given extent.                        |
+--------------------+-------------------+--------------------------------------+
| |randomPoints|     | Random points in  | Generate pseudo-random points over   |
|                    | layer bounds      | bounds of a given input layer.       |
+--------------------+-------------------+--------------------------------------+
| |regularPoints|    | Regular points    | Generate a regular grid of points    |
|                    |                   | over a specified region and export   |
|                    |                   | them as a point shapefile.           |
+--------------------+-------------------+--------------------------------------+
| |vectorGrid|       | Vector grid       | Generate a line or polygon grid      |
|                    |                   | based on user-specified grid spacing.|
+--------------------+-------------------+--------------------------------------+
| |selectLocation|   | Select by         | Select features based on their       |
|                    | location          | location relative to another layer   |
|                    |                   | to form a new selection, or add or   |
|                    |                   | subtract from the current selection. |
+--------------------+-------------------+--------------------------------------+
| |layerExtent|      | Polygon from      | Create a single rectangular          |
|                    | layer extent      | polygon layer from the extent of an  |
|                    |                   | input raster or vector layer.        |
+--------------------+-------------------+--------------------------------------+

Table Tools 2: Default tools in Research group

.. index::
   single: Geoprocessing tools
.. _table_vector_geoproc:

Geoprocessing tools
...................

+---------------------+-------------------+--------------------------------------+
| **Icon**            | **Tool**          | **Purpose**                          |
+=====================+===================+======================================+
| |convexHull|        | Convex hull(s)    | Create minimum convex hull(s) for an |
|                     |                   | input layer, or based on an ID field.|
+---------------------+-------------------+--------------------------------------+
| |buffer|            | Buffer with       | Create buffer(s) around features     |
|                     | * fixed distance  | * based on fixed distance            |
|                     | * distance field  | * based on distance field            |
+---------------------+-------------------+--------------------------------------+
| |intersect|         | Intersect         | Overlay layers such that output      |
|                     |                   | contains areas where both layers     |
|                     |                   | intersect.                           |
+---------------------+-------------------+--------------------------------------+
| |union|             | Union             | Overlay layers such that output      |
|                     |                   | contains intersecting and            |
|                     |                   | non-intersecting areas.              |
+---------------------+-------------------+--------------------------------------+
| |symDifference|     | Symmetrical       | Overlay layers such that output      |
|                     | difference        | contains those areas of the input    |
|                     |                   | and difference layers that do not    |
|                     |                   | intersect.                           |
+---------------------+-------------------+--------------------------------------+
| |clip|              | Clip              | Overlay layers such that output      |
|                     |                   | contains areas that intersect the    |
|                     |                   | clip layer.                          |
+---------------------+-------------------+--------------------------------------+
| |difference|        | Difference        | Overlay layers such that output      |
|                     |                   | contains areas not intersecting the  |
|                     |                   | clip layer.                          |
+---------------------+-------------------+--------------------------------------+
| |dissolve|          | Dissolve          | Merge features based on input field. |
|                     |                   | All features with identical input    |
|                     |                   | values are combined to form one      |
|                     |                   | single feature.                      |
+---------------------+-------------------+--------------------------------------+
| |eliminate|         | Eliminate sliver  | Merges selected features with the    |
|                     | polygons          | neighboring polygon with the         |
|                     |                   | largest area or largest common       |
|                     |                   | boundary.                            |
+---------------------+-------------------+--------------------------------------+

Table Tools 3: Default tools in Geoprocessing group

.. index::
   single: Geometry tools
.. _table_vector_geometry:

Geometry tools
..............

+---------------------+-----------------+--------------------------------------+
| **Icon**            | **Tool**        | **Purpose**                          |
+=====================+=================+======================================+
| |checkGeometry|     | Check geometry  | Check polygons for intersections,    |
|                     | validity        | closed holes, and fix node ordering. |
|                     |                 | You can choose the engine used by the|
|                     |                 | in the options dialog, digitizing tab|
|                     |                 | Change the Validate geometries value.|
|                     |                 | There is two engines: QGIS and GEOS  |
|                     |                 | which have pretty different          |
|                     |                 | behavior. Another tools exists which |
|                     |                 | shows different result as well:      |
|                     |                 | Topology Checker plugin and 'must not|
|                     |                 | have invalid geometries' rule.       |
+---------------------+-----------------+--------------------------------------+
| |exportGeometry|    | Export/Add      | Add vector layer geometry info to    |
|                     | geometry columns| point (XCOORD, YCOORD), line         |
|                     |                 | (LENGTH), or polygon (AREA,          |
|                     |                 | PERIMETER) layer.                    |
+---------------------+-----------------+--------------------------------------+
| |centroids|         | Polygon         | Calculate the true centroids for     |
|                     | centroids       | each polygon in an input polygon     |
|                     |                 | layer.                               |
+---------------------+-----------------+--------------------------------------+
| |delaunay|          | Delaunay        | Calculate and output (as polygons)   |
|                     | triangulation   | the Delaunay triangulation of an     |
|                     |                 | input point vector layer.            |
+---------------------+-----------------+--------------------------------------+
|                     | Voronoi polygons| Calculate Voronoi polygons of an     |
|                     |                 | input point vector layer.            |
+---------------------+-----------------+--------------------------------------+
| |simplify|          | Simplify        | Generalize lines or polygons with a  |
|                     | geometry        | modified Douglas-Peucker algorithm.  |
+---------------------+-----------------+--------------------------------------+
|                     | Densify         | Densify lines or polygons by adding  |
|                     | geometry        | vertices.                            |
+---------------------+-----------------+--------------------------------------+
| |multiToSingle|     | Multipart to    | Convert multipart features to        |
|                     | singleparts     | multiple singlepart features.        |
|                     |                 | Creates simple polygons and lines.   |
+---------------------+-----------------+--------------------------------------+
| |singleToMulti|     | Singleparts to  | Merge multiple features to a single  |
|                     | multipart       | multipart feature based on a unique  |
|                     |                 | ID field.                            |
+---------------------+-----------------+--------------------------------------+
| |toLines|           | Polygons to     | Convert polygons to lines, multipart |
|                     | lines           | polygons to multiple singlepart      |
|                     |                 | lines.                               |
+---------------------+-----------------+--------------------------------------+
| |toLines|           | Lines to        | Convert lines to polygons, multipart |
|                     | polygons        | lines to multiple singlepart         |
|                     |                 | polygons.                            |
+---------------------+-----------------+--------------------------------------+
| |extractNodes|      | Extract nodes   | Extract nodes from line and polygon  |
|                     |                 | layers and output them as points.    |
+---------------------+-----------------+--------------------------------------+

Table Tools 4: Default tools in Geometry group

.. note::

   The *Simplify geometry* tool can be used to remove duplicate nodes in line and
   polygon geometries. Just set the *Simplify tolerance* parameter to 0 and this
   will do the trick.

.. index::
   single: Data Management tools


.. _table_vector_data:

Data management tools
.....................

+---------------------+-----------------+--------------------------------------+
| **Icon**            | **Tool**        | **Purpose**                          |
+=====================+=================+======================================+
| |defineProjection|  | Define current  | Specify the CRS for shapefiles whose |
|                     | projection      | CRS has not been defined.            |
+---------------------+-----------------+--------------------------------------+
| |joinLocation|      | Join attributes | Join additional attributes to vector |
|                     | by location     | layer based on spatial relationship. |
|                     |                 | Attributes from one vector layer are |
|                     |                 | appended to the attribute table of   |
|                     |                 | another layer and exported as a      |
|                     |                 | shapefile.                           |
+---------------------+-----------------+--------------------------------------+
| |splitLayer|        | Split vector    | Split input layer into multiple      |
|                     | layer           | separate layers based on input field.|
+---------------------+-----------------+--------------------------------------+
| |mergeShapes|       | Merge shapefiles| Merge several shapefiles within a    |
|                     | to one          | folder into a new shapefile based on |
|                     |                 | the layer type (point, line, area).  |
+---------------------+-----------------+--------------------------------------+
|                     | Create spatial  | Create a spatial index for OGR-      |
|                     | index           | supported formats.                   |
+---------------------+-----------------+--------------------------------------+

Table Tools 5: Default tools in Data management group

