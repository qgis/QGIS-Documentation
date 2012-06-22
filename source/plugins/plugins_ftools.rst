.. _`ftools`: 

fTools Plugin
===============================

.. % when the revision of a section has been finalized, 
.. % comment out the following line:
.. % \updatedisclaimer

The goal of the fTools python plugin is to provide a one-stop resource for
many common vector-based GIS tasks, without the need for additional software, 
libraries, or complex workarounds. It provides a growing suite of spatial 
data management and analysis functions that are both fast and functional. 

fTools is now automatically installed and enabled in new versions of QGIS, and 
as with all plugins, it can be disabled and enabled using the Plugin Manager 
(See Section :ref:`sec:managing_plugins`).  When enabled, the fTools plugin 
adds a :menuselection:`Vector` menu to QGIS, providing functions ranging from 
Analysis and Research Tools to Geometry and Geoprocessing Tools, as well as 
several useful Data Management Tools.

.. _`ftools_function`:
fTools functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Tables :ref:`tab:ftool_analysis` through :ref:`tab:fTool_data_management` list 
the functions available via the fTools plugin, along with a brief description 
of each function. For further information on an individual fTools function, 
click the :menuselection:`fTools Information` menu item in the 
:menuselection:`Vector` menu.

:index:`Analysis tools`

+---------------------+-----------------+--------------------------------------+
| **Analysis tools available via the fTools plugin**                           |
+---------------------+-----------------+--------------------------------------+
| **Icon**            | **Tool**        | **Purpose**                          |
+=====================+=================+======================================+
| |matrix|            | Distance Matrix | Measure distances between two point  |
|                     |                 | layers, and output results as a)     |
|                     |                 | Square distance matrix, b) Linear    |
|                     |                 | distance matrix, or c) Summary of    |
|                     |                 | distances. Can limit distances to    |
|                     |                 | the k nearest features.              |
+---------------------+-----------------+--------------------------------------+
| |sum_lines|         | Sum line length | Calculate the total sum of line      |
|                     |                 | lengths for each polygon of a polygon|
|                     |                 | vector layer.                        |
+---------------------+-----------------+--------------------------------------+
| |sum_points|        | Points in       | Count the number of points that occur|
|                     | polygon         | in each polygon of an input polygon  |
|                     |                 | vector layer.                        |
+---------------------+-----------------+--------------------------------------+
| |unique|            | List unique     | List all unique values in an input   |
|                     | values          | vector layer field                   |
+---------------------+-----------------+--------------------------------------+
| |basic_statistics|  | Basic statistic | Compute basic statistics (mean, std  |
|                     |                 | dev, N, sum, CV) on an input field.  |
+---------------------+-----------------+--------------------------------------+
| |neighbor|          | Nearest         | Compute nearest neighbor statistics  |
|                     | Neighbor        | assess the level of clustering in a  |
|                     | analysis        | point vector layer                   |
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

.. \caption{fTools Analysis tools}\label{tab:ftool_analysis}


:index:`Research tools`

+---------------------+-----------------+--------------------------------------+
| **Research tools available via the fTools plugin**                           |
+---------------------+-----------------+--------------------------------------+
| **Icon**            | **Tool**        | **Purpose**                          |
+=====================+=================+======================================+
| |random_selection|  | Random selection| Randomly select n number of          |
|                     |                 | features, or n percentage of features|
+---------------------+-----------------+--------------------------------------+
| |sub_selection|     | Random selection| Randomly select features within      |
|                     | within subsets  | subsets based on a unique ID field.  |
+---------------------+-----------------+--------------------------------------+
| |random_points|     | Random points   | Generate pseudo-random points over a |
|                     |                 | given input layer.                   |
+---------------------+-----------------+--------------------------------------+
| |regular_points|    | Regular points  | Generate a regular grid of points    |
|                     |                 | over a specified region and export   |
|                     |                 | them as a point shapefile.           |
+---------------------+-----------------+--------------------------------------+
| |vector_grid|       | Vector grid     | Generate a line or polygon grid      |
|                     |                 | based on user specified grid spacing.|
+---------------------+-----------------+--------------------------------------+
| |select_location|   | Select by       | Select features based on their       |
|                     | location        | location relative to another layer   |
|                     |                 | to form a new selection, or add or   |
|                     |                 | subtract from the current selection. |
+---------------------+-----------------+--------------------------------------+
| |layer_extent|      | Polygon from    | Create a single rectangular          |
|                     | layer extent    | polygon layer from the extent of an  |
|                     |                 | input raster or vector layer.        |
+---------------------+-----------------+--------------------------------------+

.. \caption{fTools Research tools}\label{tab:ftool_research}

+---------------------+-----------------+--------------------------------------+
| **Geoprocessing tools available via the fTools plugin**                      |
+---------------------+-----------------+--------------------------------------+
| **Icon**            | **Tool**        | **Purpose**                          |
+=====================+=================+======================================+
| |convex_hull|       | Convex hull(s)  | Create minimum convex hull(s) for an |
|                     |                 | input layer, or based on an ID field.|
+---------------------+-----------------+--------------------------------------+
| |buffer|            | Buffer(s)       | Create buffer(s) around features     |
|                     |                 | based on distance, or distance field.|
+---------------------+-----------------+--------------------------------------+
| |intersect|         | Intersect       | Overlay layers such that output      |
|                     |                 | contains areas where both layers     |
|                     |                 | intersect.                           |
+---------------------+-----------------+--------------------------------------+
| |union|             | Union           | Overlay layers such that output      |
|                     |                 | contains intersecting and            |
|                     |                 | non-intersecting areas.              |
+---------------------+-----------------+--------------------------------------+
| |sym_difference|    | Symmetrical     | Overlay layers such that output      |
|                     | difference      | contains those areas of the input    |
|                     |                 | and difference layers that do not    |
|                     |                 | intersect.                           |
+---------------------+-----------------+--------------------------------------+
| |clip|              | Clip            | Overlay layers such that output      |
|                     |                 | contains areas that intersect the    |
|                     |                 | clip layer.                          |
+---------------------+-----------------+--------------------------------------+
| |difference|        | Difference      | Overlay layers such that output      |
|                     |                 | contains areas not intersecting the  |
|                     |                 | clip layer.                          |
+---------------------+-----------------+--------------------------------------+
| |dissolve|          | Dissolve        | Merge features based on input field. |
|                     |                 | All features with identical input    |
|                     |                 | values are combined to form one      |
|                     |                 | single feature.                      |
+---------------------+-----------------+--------------------------------------+


.. \caption{fTools Geoprocessing tools}\label{tab:ftool_geoprocessing}

+---------------------+-----------------+--------------------------------------+
| **Geometry tools available via the fTools plugin**                           |
+---------------------+-----------------+--------------------------------------+
| **Icon**            | **Tool**        | **Purpose**                          |
+=====================+=================+======================================+
| |check_geometry|    | Check geometry  | Check polygons for intersections,    |
|                     |                 |closed-holes, and fix node ordering.  |
+---------------------+-----------------+--------------------------------------+
| |export_geometry|   | Export/Add      | Add vector layer geometry info to    |
|                     | geometry columns| point (XCOORD, YCOORD), line         |
|                     |                 | (LENGTH), or polygon (AREA,          |
|                     |                 | PERIMETER) layer.                    |
+---------------------+-----------------+--------------------------------------+
| |centroids|         | Polygon         | Calculate the true centroids for     |
|                     | centroids       | each polygon in an input polygon     |
|                     |                 |layer.                                |
+---------------------+-----------------+--------------------------------------+
| |delaunay|          | Delaunay        | Calculate and output (as polygons)   |
|                     | triangulation   | the delaunay triangulation of an     |
|                     |                 | input point vector layer.            |
+---------------------+-----------------+--------------------------------------+
|                     | Voronoi Polygons| Calculate voronoi polygons of an     |
|                     |                 | input point vector layer.            |
+---------------------+-----------------+--------------------------------------+
| |simplify|          | Simplify        | Generalize lines or polygons with a  |
|                     | geometry        | modified Douglas-Peucker algorithm.  |
+---------------------+-----------------+--------------------------------------+
| |multi_to_single|   | Multipart to    | Convert multipart features to        |
|                     | singleparts     | multiple singlepart features.        |
|                     |                 | Creates simple polygons and lines.   |
+---------------------+-----------------+--------------------------------------+
| |single_to_multi|   | Singleparts to  | Merge multiple features to a single  |
|                     | multipart       | multipart feature based on a unique  |
|                     |                 | ID field.                            |
+---------------------+-----------------+--------------------------------------+
| |to_lines|          | Polygons to     | Convert polygons to lines, multipart |
|                     | lines           | polygons to multiple singlepart      |
|                     |                 | lines.                               |
+---------------------+-----------------+--------------------------------------+
| |to_lines|          | Lines to        | Convert lines to polygons, multipart |
|                     | polygons        | lines to multiple singlepart         |
|                     |                 | polygons.                            |
+---------------------+-----------------+--------------------------------------+
| |extract_nodes|     | Extract nodes   | Extract nodes from line and polygon  |
|                     |                 | layers and output them as points.    |
+---------------------+-----------------+--------------------------------------+

.. \caption{fTools Geometry tools}\label{tab:ftool_geometry}

+---------------------+-----------------+--------------------------------------+
| Data management tools available via the fTools plugin**                      |
+---------------------+-----------------+--------------------------------------+
| **Icon**            | **Tool**        | **Purpose**                          |
+=====================+=================+======================================+
| |export_projection| | Export to       | Project features to new CRS and      |
|                     | projection      | export as new shapefile.             |
+---------------------+-----------------+--------------------------------------+
| |define_projection| | Define          | Specify the CRS for shapefiles whose |
|                     | projection      | CRS has not been defined.            |
+---------------------+-----------------+--------------------------------------+
| |join_location|     | Join attributes | Join additional attributes to vector |
|                     | by location     | layer based on spatial relationship. |
|                     |                 | Attributes from one vector layer are |
|                     |                 | appended to the attribute table of   |
|                     |                 | another layer and exported as a      |
|                     |                 | shapefile.                           |
+---------------------+-----------------+--------------------------------------+
| |split_layer|       | Split vector    | Split input layer into multiple      |
|                     | layer           | separate layers based on input field.|
+---------------------+-----------------+--------------------------------------+
| |merge_shapes|      | Merge shapefiles| Merge several shapefiles within a    |
|                     |                 | folder into a new shapefile based on |
|                     |                 | the layer type (point, line, area)   |
+---------------------+-----------------+--------------------------------------+

.. \caption{fTools Data management tools}\label{tab:fTool_data_management}
