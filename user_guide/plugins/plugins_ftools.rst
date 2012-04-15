%  !TeX  root  =  user_guide.tex 

fTools Plugin}\label{sec:ftools
===============================


% when the revision of a section has been finalized, 
% comment out the following line:
% \updatedisclaimer

The goal of the fTools python plugin is to provide a one-stop resource for
many common vector-based GIS tasks, without the need for additional software, 
libraries, or complex workarounds. It provides a growing suite of spatial 
data management and analysis functions that are both fast and functional. 

fTools is now automatically installed and enabled in new versions of QGIS, and as with all plugins, it can 
be disabled and enabled using the Plugin Manager (See Section \ref{sec:managing_plugins}).
When enabled, the fTools plugin adds a \mainmenuopt{Vector} menu to QGIS, providing functions ranging from 
Analysis and Research Tools to Geometry and Geoprocessing Tools, as well as several useful Data Management Tools.

fTools functions}\label{ftool_functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Tables \ref{tab:ftool_analysis} through \ref{tab:fTool_data_management} list the 
functions available via the fTools plugin, along with a brief description of 
each function. For further information on an individual fTools function, please 
click the \dropmenuopt{fTools Information} menu item in the \mainmenuopt{Vector} menu.

\begin{table}[ht]:index:`Analysis tools`
\centering
 \begin{tabular}{|m{1cm}|m{3cm}|m{12cm}|}
\hline \multicolumn{3}{|c|}{**Analysis tools available via the fTools plugin}** \\
 \hline **Icon} & \textbf{Tool} & \textbf{Purpose** \\
 \hline \includegraphics[width=0.7cm]{matrix} & Distance Matrix &
Measure distances between two point layers, and output results as a) Square
distance matrix, b) Linear distance matrix, or c) Summary of distances. Can
limit distances to the k nearest features. \\ 
 \hline \includegraphics[width=0.7cm]{sum_lines} & Sum line length & Calculate
the total sum of line lengths for each polygon of a polygon vector layer. \\
 \hline \includegraphics[width=0.7cm]{sum_points} & Points in polygon & Count
the number of points that occur in each polygon of an input polygon vector
layer. \\
 \hline \includegraphics[width=0.7cm]{unique} & List unique values & List
all unique values in an input vector layer field. \\
 \hline \includegraphics[width=0.7cm]{basic_statistics} & Basic statistic & Compute
basic statistics (mean, std dev, N, sum, CV) on an input field. \\ 
 \hline \includegraphics[width=0.7cm]{neighbour} & Nearest Neighbor analysis
& Compute nearest neighbour statistics to assess the level of clustering in a
point vector layer. \\
 \hline \includegraphics[width=0.7cm]{mean} & Mean coordinate(s) &
Compute either the normal or weighted mean center of an entire vector layer,
or multiple features based on a unique ID field. \\ 
 \hline \includegraphics[width=0.7cm]{intersections} & Line intersections &
Locate intersections between lines, and output results as a point shapefile.
Useful for locating road or stream intersections, ignores line intersections
with length > 0. \\
 \hline
\end{tabular}
\caption{fTools Analysis tools}\label{tab:ftool_analysis}
\end{table}

\begin{table}[ht]:index:`Research tools`
\centering
 \begin{tabular}{|m{1cm}|m{3cm}|m{12cm}|}
 \hline \multicolumn{3}{|c|}{**Research tools available via the fTools plugin}** \\
 \hline **Icon} & \textbf{Tool} & \textbf{Purpose** \\
 \hline \includegraphics[width=0.7cm]{random_selection} & Random selection & Randomly 
select n number of features, or n percentage of features \\
 \hline \includegraphics[width=0.7cm]{sub_selection} & Random selection within 
subsets & Randomly select features within subsets based on a unique ID field. \\
 \hline \includegraphics[width=0.7cm]{random_points} & Random points & Generate 
pseudo-random points over a given input layer. \\
 \hline \includegraphics[width=0.7cm]{regular_points} & Regular points & Generate 
a regular grid of points over a specified region and export them as a point shapefile. \\
 \hline \includegraphics[width=0.7cm]{vector_grid} & Vector grid & Generate a 
line or polygon grid based on user specified grid spacing. \\
 \hline \includegraphics[width=0.7cm]{select_location} & Select by location & 
Select features based on their location relative to another layer to form a 
new selection, or add or subtract from the current selection. \\
\hline \includegraphics[width=0.7cm]{layer_extent} & Polygon from layer extent & 
Create a single rectangular polygon layer from the extent of an input raster or vector layer. \\
 \hline
\end{tabular}
\caption{fTools Research tools}\label{tab:ftool_research}
\end{table}

\begin{table}[ht]:index:`Geoprocessing tools`
\centering
 \begin{tabular}{|m{1cm}|m{3cm}|m{12cm}|}
 \hline \multicolumn{3}{|c|}{**Geoprocessing tools available via the fTools plugin}** \\
 \hline **Icon} & \textbf{Tool} & \textbf{Purpose** \\
 \hline \includegraphics[width=0.7cm]{convex_hull} & Convex hull(s) & Create 
minimum convex hull(s) for an input layer, or based on an ID field. \\
 \hline \includegraphics[width=0.7cm]{buffer} & Buffer(s) & Create 
buffer(s) around features based on distance, or distance field. \\
 \hline \includegraphics[width=0.7cm]{intersect} & Intersect & Overlay 
layers such that output contains areas where both layers intersect. \\
 \hline \includegraphics[width=0.7cm]{union} & Union & Overlay layers such 
that output contains intersecting and non-intersecting areas. \\
 \hline \includegraphics[width=0.7cm]{sym_difference} & Symetrical difference & 
Overlay layers such that output contains those areas of the input and 
difference layers that do not intersect. \\
 \hline \includegraphics[width=0.7cm]{clip} & Clip & Overlay layers such 
that output contains areas that intersect the clip layer. \\
 \hline \includegraphics[width=0.7cm]{difference} & Difference & Overlay layers 
such that output contains areas not intersecting the clip layer. \\
 \hline \includegraphics[width=0.7cm]{dissolve} & Dissolve & Merge features 
based on input field. All features with indentical input values are combined 
to form one single feature. \\
 \hline
\end{tabular}
\caption{fTools Geoprocessing tools}\label{tab:ftool_geoprocessing}
\end{table}

\begin{table}[ht]:index:`Geometry tools`
\centering
\begin{tabular}{|m{1cm}|m{3cm}|m{12cm}|}
 \hline \multicolumn{3}{|c|}{**Geometry tools available via the fTools plugin}** \\
 \hline **Icon} & \textbf{Tool} & \textbf{Purpose** \\
 \hline \includegraphics[width=0.7cm]{check_geometry} & Check geometry & 
Check polygons for intersections, closed-holes, and fix node ordering. \\
 \hline \includegraphics[width=0.7cm]{export_geometry} & Export/Add geometry 
columns & Add vector layer geometry info to point (XCOORD, YCOORD), 
line (LENGTH), or polygon (AREA, PERIMETER) layer. \\
 \hline \includegraphics[width=0.7cm]{centroids} & Polygon centroids & 
Calculate the true centroids for each polygon in an input polygon layer. \\
 \hline \includegraphics[width=0.7cm]{delaunay} & Delaunay triangulation & 
Calculate and output (as polygons) the delaunay triangulation of an input point vector layer. \\
 \hline  & Voronoi Polygons & 
Calculate voronoi polygons of an input point vector layer. \\
 \hline \includegraphics[width=0.7cm]{simplify} & Simplify geometry & 
Generalise lines or polygons with a modified Douglas-Peucker algorithm. \\
 \hline \includegraphics[width=0.7cm]{multi_to_single} & Multipart to 
singleparts & Convert multipart features to multiple singlepart features. 
Creates simple polygons and lines. \\
 \hline \includegraphics[width=0.7cm]{single_to_multi} & Singleparts to 
multipart & Merge multiple features to a single multipart feature based 
on a unique ID field. \\
 \hline \includegraphics[width=0.7cm]{to_lines} & Polygons to lines 
& Convert polygons to lines, multipart polygons to multiple singlepart lines. \\
 \hline \includegraphics[width=0.7cm]{to_lines} & Lines to polygons 
& Convert lines to polygons, multipart lines to multiple singlepart polygons. \\
 \hline \includegraphics[width=0.7cm]{extract_nodes} & Extract nodes & 
Extract nodes from line and polygon layers and output them as points. \\
 \hline
\end{tabular}
\caption{fTools Geometry tools}\label{tab:ftool_geometry}
\end{table}

\begin{table}[ht]:index:`Data management tools`
\centering
\begin{tabular}{|m{1cm}|m{3cm}|m{12cm}|}
 \hline \multicolumn{3}{|c|}{**Data management tools available via the fTools plugin}** \\
 \hline **Icon} & \textbf{Tool} & \textbf{Purpose** \\
 \hline \includegraphics[width=0.7cm]{export_projection} & Export to projection & 
Project features to new CRS and export as new shapefile. \\
 \hline \includegraphics[width=0.7cm]{define_projection} & Define projection & 
Specify the CRS for shapefiles whose CRS has not been defined. \\
 \hline \includegraphics[width=0.7cm]{join_location} & Join attributes by 
location & Join additional attributes to vector layer based on spatial 
relationship. Attributes from one vector layer are appended to the attribute 
table of another layer and exported as a shapefile \\
 \hline \includegraphics[width=0.7cm]{split_layer} & Split vector layer & 
Split input layer into multiple separate layers based on input field. \\
 \hline \includegraphics[width=0.7cm]{merge_shapes} & Merge shapefiles &
Merge several shapefiles within a folder into a new shapefile based on the 
layer type (point, line, area) \\
 \hline
\end{tabular}
\caption{fTools Data management tools}\label{tab:fTool_data_management}
\end{table}

\FloatBarrier
