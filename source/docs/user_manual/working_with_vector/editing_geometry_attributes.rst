|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

Editing
=======

|qg| supports various capabilities for :index:`editing` OGR, PostGIS and
SpatiaLite vector layers.

.. note::
   The procedure for editing GRASS layers is different - see Section
   :ref:`grass_digitizing` for details.

.. _tip_concurrent_edits:

.. tip:: **Concurrent Edits**

   This version of |qg| does not track if somebody else is editing a feature
   at the same time as you. The last person to save their edits wins.

.. index:: Snapping, Snapping_Tolerance

.. _`snapping_tolerance`:

Setting the Snapping Tolerance and Search Radius
------------------------------------------------

Before we can edit vertices, we must set the snapping tolerance and search
radius to a value that allows us an optimal editing of the vector layer
geometries.

Snapping tolerance
..................

Snapping tolerance is the distance |qg| uses to ``search`` for the closest
vertex and/or segment you are trying to connect when you set a new vertex or
move an existing vertex. If you aren't within the snapping tolerance, |qg|
will leave the vertex where you release the mouse button, instead of snapping
it to an existing vertex and/or segment.
The snapping tolerance setting affects all tools which work with tolerance.

#. A general, project wide snapping tolerance can be defined choosing
   :menuselection:`Settings -->` |mActionOptions| :menuselection:`Options`.
   On Mac: go to :menuselection:`QIS -->` |mActionOptions|
   :menuselection:`Preferences...`, on Linux: :menuselection:`Edit -->`
   |mActionOptions| :menuselection:`Options`. In the :guilabel:`Digitizing`
   tab you can select between to vertex, to segment or to vertex and segment
   as default snap mode. You can also define a default snapping tolerance and
   a search radius for vertex edits. The tolerance can be set either in map
   units or in pixels. The advantage of choosing pixels, is that the snapping
   tolerance doesn't have to be changed after zoom operations. In our small
   digitizing project (working with the Alaska dataset), we define the
   snapping units in feet. Your results may vary, but something on the order
   of 300ft should be fine at a scale of 1:10 000 should be a reasonable
   setting.
#. A layer based snapping tolerance can be defined by choosing
   :menuselection:`Settings -->` (or :menuselection:`File -->`)
   :menuselection:`Snapping options...` to enable and adjust snapping mode
   and tolerance on a layer basis (see figure_edit_1_ ).

Note that this layer based snapping overrides the global snapping option
set in the Digitizing tab. So if you need to edit one layer, and snap its
vertices to another layer, then enable snapping only on the ``snap to``
layer, then decrease the global snapping tolerance to a smaller value.
Furthermore, snapping will never occur to a layer which is not checked in
the snapping options dialog, regardless of the global snapping tolerance.
So be sure to mark the checkbox for those layers that you need to snap to.

.. _figure_edit_1:

.. only:: html

   **Figure Edit 1:**

.. figure:: /static/user_manual/working_with_vector/editProjectSnapping.png
   :width: 40em
   :align: center

   Edit snapping options on a layer basis |nix|

.. index:: Search_Radius

Search radius
.............

Search radius is the distance |qg| uses to ``search`` for the closest vertex
you are trying to move when you click on the map. If you aren't within the
search radius, |qg| won't find and select any vertex for editing and it will
pop up an annoying warning to that effect.
Snap tolerance and search radius are set in map units or pixels, so you may
find you need to experiment to get them set right. If you specify too big of
a tolerance, |qg| may snap to the wrong vertex, especially if you are dealing
with a large number of vertices in close proximity. Set search radius too
small and it won't find anything to move.

The search radius for vertex edits in layer units can be defined in the
:guilabel:`Digitizing` tab under :menuselection:`Settings -->` |mActionOptions|
:menuselection:`Options`. The same place where you define the general, project
wide snapping tolerance.

.. index:: Zoom_In Zoom_Out, Pan, Map_Navigation

Zooming and Panning
-------------------

Before editing a layer, you should zoom in to your area of interest.
This avoids waiting while all the vertex markers are rendered across the
entire layer.

Apart from using the |mActionPan| :sup:`pan` and |mActionZoomIn|
:sup:`zoom-in` / |mActionZoomOut| :sup:`zoom-out` icons on the toolbar
with the mouse, navigating can also be done with the mouse wheel, spacebar
and the arrow keys.

Zooming and panning with the mouse wheel
........................................

While digitizing you can press the mouse wheel to pan inside of the main
window and you can roll the mouse wheel to zoom in and out on the map.
For zooming place the mouse cursor inside the map area and roll it forward
(away from you) to zoom in and backwards (towards you) to zoom out. The mouse
cursor position will be the center of the zoomed area of interest. You can
customize the behavior of the mouse wheel zoom using the :guilabel:`Map tools`
tab under the :menuselection:`Settings -->` |mActionOptions|
:menuselection:`Options` menu.

Panning with the arrow keys
...........................

Panning the map during digitizing is possible with the arrow keys.
Place the mouse cursor inside the map area and click on the right arrow key
to pan east, left arrow key to pan west, up arrow key to pan north and down
arrow key to pan south.

You can also use the spacebar to temporarily cause mouse movements to pan
then map. The :kbd:`PgUp` and :kbd:`PgDown` keys on your keyboard will cause
the map display to zoom in or out without interrupting your digitizing session.

.. Index:: Topological_Editing

Topological editing
-------------------

Besides layer based snapping options you can also define some topological
functionalities in the :guilabel:`Snapping options...` dialog in the
:menuselection:`Settings` (or :menuselection:`File`) menu. Here you can
define |checkbox| :guilabel:`Enable topological editing` and/or for
polygon layers you can activate the column |checkbox|
:guilabel:`Avoid Int.` which avoids intersection of new polygons.

.. index:: Shared_Polygon_Boundaries

Enable topological editing
..........................

The option |checkbox| :guilabel:`Enable topological editing` is for editing
and maintaining common boundaries in polygon mosaics. QGIS 'detects' a
shared boundary in a polygon mosaic and you only have to move the vertex
once and |qg| will take care about updating the other boundary.

.. Index:: Avoid_Intersections_Of_Polygons

Avoid intersections of new polygons
...................................

The second topological option in the |checkbox| :guilabel:`Avoid Int.`
column, called :guilabel:`Avoid intersections of new polygons` avoids
overlaps in polygon mosaics. It is for quicker digitizing of adjacent
polygons. If you already have one polygon, it is possible with this option
to digitise the second one such that both intersect and |qg| then cuts the
second polygon to the common boundary. The advantage is that users don't
have to digitize all vertices of the common boundary.

.. Index:: Snapping_On_Intersections

Enable snapping on intersections
.................................
Another option is to use |checkbox| :guilabel:`Enable snapping on intersection`.
It allows to snap on an intersection of background layers, even if there's no vertex on 
the intersection.


.. index:: Digitizing

.. _sec_edit_existing_layer:

Digitizing an existing layer
----------------------------

By default, |qg| loads layers read-only: This is a safeguard to avoid
accidentally editing a layer if there is a slip of the mouse.
However, you can choose to edit any layer as long as the data provider
supports it, and the underlying data source is writable (i.e. its files are
not read-only). Layer editing is most versatile when used on PostgreSQL/PostGIS
data sources.

In general, editing vector layers is divided into a digitizing and an advanced
digitizing toolbar, described in Section :ref:`sec_advanced_edit`. You can
select and unselect both under :menuselection:`Settings --> Toolbars -->`.
Using the basic digitizing tools you can perform the following functions:

.. _table_editing:

+-------------------------+----------------------------------+-------------------------+----------------------------------+
| Icon                    | Purpose                          | Icon                    | Purpose                          |
+=========================+==================================+=========================+==================================+
| |mActionAllEdits|       | Current edits                    | |mActionToggleEditing|  | Toggle editing                   |
+-------------------------+----------------------------------+-------------------------+----------------------------------+
| |mActionCapturePoint|   | Adding Features: Capture Point   | |mActionCaptureLine|    | Adding Features: Capture Line    |
+-------------------------+----------------------------------+-------------------------+----------------------------------+
| |mActionCapturePolygon| | Adding Features: Capture Polygon | |mActionMoveFeature|    | Move Feature                     |
+-------------------------+----------------------------------+-------------------------+----------------------------------+
| |mActionNodeTool|       | Node Tool                        | |mActionDeleteSelected| | Delete Selected                  |
+-------------------------+----------------------------------+-------------------------+----------------------------------+
| |mActionEditCut|        | Cut Features                     | |mActionEditCopy|       | Copy Features                    |
+-------------------------+----------------------------------+-------------------------+----------------------------------+
| |mActionEditPaste|      | Paste Features                   | |mActionFileSave|       | Save edits and continue          |
+-------------------------+----------------------------------+-------------------------+----------------------------------+

Table Editing: Vector layer basic editing toolbar


All editing sessions start by choosing the |mActionToggleEditing|
:sup:`Toggle editing` option. This can be found in the context menu
after right clicking on the legend entry for that layer.

Alternately, you can use the :index:`Toggle Editing` |mActionToggleEditing|
:sup:`Toggle editing` button from the digitizing toolbar to start or stop the
editing mode. Once the layer is in edit mode, markers will appear at the
vertices, and additional tool buttons on the editing toolbar will become
available.

.. _tip_save_regularly:

.. tip:: **Save Regularly**

   Remember to |mActionFileSave| :sup:`Save Edits` regularly. This will also
   check that your data source can accept all the changes.

Adding Features
...............

You can use the |mActionCapturePoint| :sup:`Add Feature`,
|mActionCaptureLine| :sup:`Add Feature` or |mActionCapturePolygon|
:sup:`Add Feature` icons on the toolbar to put the |qg| cursor into
digitizing mode.

For each feature, you first digitize the geometry, then enter its attributes.
To digitize the geometry, left-click on the map area to create the first
point of your new feature.

For lines and polygons, keep on left-clicking for each additional point you
wish to capture. When you have finished adding points, right-click anywhere
on the map area to confirm you have finished entering the geometry of that
feature.

The attribute window will appear, allowing you to enter the information for
the new feature. Figure_edit_2_ shows setting attributes for a fictitious new
river in Alaska. In the :guilabel:`Digitizing` tab under the
:menuselection:`Settings --> Options` menu, you can also activate |checkbox|
:guilabel:`Suppress attributes pop-up windows after each created feature`
|checkbox| :guilabel:`Reuse last entered attribute values`.

.. _figure_edit_2:

.. only:: html

   **Figure Edit 2:**

.. figure:: /static/user_manual/working_with_vector/editDigitizing.png
   :width: 20em
   :align: center

   Enter Attribute Values Dialog after digitizing a new vector
   feature |nix|

With the |mActionMoveFeature| :sup:`Move Feature(s)` icon on the toolbar you can
move existing features.

.. _tip_attributes_types:

.. tip:: **Attribute Value Types**

   For editing the attribute types are validated during
   the entry. Because of this, it is not possible to enter a number into
   the text-column in the dialog :guilabel:`Enter Attribute Values` or vice
   versa. If you need to do so, you should edit the attributes in a second
   step within the :guilabel:`Attribute table` dialog.

.. index:: Current_Edits

Current Edits
.............

This new feature allows the digitization of multiple layers. Choose 
|mActionFileSaveAs| :guilabel:`Save for Selected Layers` to save all changes you 
made in multiple layers. You also have the opportunity to 
|mActionRollbackEdits| :guilabel:`Rollback for Selected Layers` so that the
digitization is then withdrawn for all layers. 
If you want to stop editing the selected layers the |mActionCancelEdits| :guilabel:`Cancel for Selected Layer(s)`
is an easy way.

.. index:: Node_Tool

Node Tool
.........

For both PostgreSQL/PostGIS and shapefile-based layers, the
|mActionNodeTool| :sup:`Node Tool` provides manipulation capabilites of
feature vertices similar to CAD programs. It is possible to simply select
multiple vertices at once and to move, add or delete them alltogether.
The node tool also works with 'on the fly' projection turned on and supports
the topological editing feature. This tool is, unlike other tools in
Quantum GIS, persistent, so when some operation is done, selection stays
active for this feature and tool. If the node tool couldn't find any
features, a warning will be displayed.

Important is to set the property :menuselection:`Settings -->` |mActionOptions|
:menuselection:`Options --> Digitizing -->` :guilabel:`Search Radius:`
|selectnumber| to a number greater than zero (i.e. 10). Otherwise |qg| will
not be able to tell which vertex is being edited.

.. _tip_vertex_markers:

.. tip:: **Vertex Markers**

   The current version of |qg| supports three kinds of vertex-markers:
   Semi transparent circle, Cross and None. To change the marker style,
   choose |mActionOptions| :menuselection:`Options` from the
   :menuselection:`Settings` menu and click on the :guilabel:`Digitizing`
   tab and select the appropriate entry.

Basic operations
................

.. index:: Nodes, Vertices, Vertex

Start by activating the |mActionNodeTool| :sup:`Node Tool` and selecting a
feature by clicking on it. Red boxes will appear at each vertex of this feature.

.. Perhaps the error message mentioned below is in fact a bug, in which case the
.. bug should be fixed rather than including this note Note that to select a
.. polygon you must click one of its vertices or edges; clicking inside it will
.. produce an error message. Once a feature is selected the following
.. functionalities are available:


* **Selecting vertices**: You can select vertices by clicking on them one
  at a time, by clicking on an edge to select the vertices at both ends, or
  by clicking and dragging a rectangle around some vertices. When a vertex
  is selected its color changes to blue. To add more vertices to the current
  selection, hold down the :kbd:`Ctrl` key while clicking. Hold down
  :kbd:`Ctrl` or :kbd:`Shift` when clicking to toggle the selection state of
  vertices (vertices that are currently unselected will be selected as usual,
  but also vertices that are already selected will become unselected).
* **Adding vertices**: To add a vertex simply double click near an edge and
  a new vertex will appear on the edge near to the cursor. Note that the
  vertex will appear on the edge, not at the cursor position, therefore it
  has to be moved if necessary.
* **Deleting vertices**: After selecting vertices for deletion, click the
  :kbd:`Delete` key. Note that you cannot use the |mActionNodeTool|
  :sup:`Node Tool` to delete a complete feature; |qg| will ensure it retains
  the minimum number of vertices for the feature type you are working on.
  To delete a complete feature use the |mActionDeleteSelected|
  :sup:`Delete Selected` tool.
* **Moving vertices**: Select all the vertices you want to move. Click on
  a selected vertex or edge and drag in the direction you wish to move. All
  the selected vertices will move together. If snapping is enabled, the whole
  selection can jump to the nearest vertex or line.

Each change made with the node tool is stored as a separate entry in the
undo dialog. Remember that all operations support topological editing when
this is turned on. On the fly projection is also supported, and the node
tool provides tooltips to identify a vertex by hovering the pointer over it.

Cutting, Copying and Pasting Features
.....................................

Selected features can be cut, copied and pasted between layers in the same
|qg| project, as long as destination layers are set to |mActionToggleEditing|
:sup:`Toggle editing` beforehand.

.. index:: CSV, WKT

Features can also be pasted to external applications as text: That is, the
features are represented in CSV format with the geometry data appearing in
the OGC Well-Known Text (WKT) format.

However in this version of |qg|, text features from outside |qg| cannot be
pasted to a layer within |qg|. When would the copy and paste function come
in handy? Well, it turns out that you can edit more than one layer at a time
and copy/paste features between layers. Why would we want to do this? Say
we need to do some work on a new layer but only need one or two lakes, not
the 5,000 on our ``big_lakes`` layer. We can create a new layer and use
copy/paste to plop the needed lakes into it.

As an example we are copying some lakes to a new layer:

#. Load the layer you want to copy from (source layer)
#. Load or create the layer you want to copy to (target layer)
#. Start editing for target layer
#. Make the source layer active by clicking on it in the legend
#. Use the |mActionSelect| :sup:`Select Single Feature` tool to select the
   feature(s) on the source layer
#. Click on the |mActionEditCopy| :sup:`Copy Features` tool
#. Make the destination layer active by clicking on it in the legend
#. Click on the |mActionEditPaste| :sup:`Paste Features` tool
#. Stop editing and save the changes

What happens if the source and target layers have different schemas (field
names and types are not the same)? |qg| populates what matches and ignores
the rest. If you don't care about the attributes being copied to the target
layer, it doesn't matter how you design the fields and data types. If you
want to make sure everything - feature and its attributes - gets copied,
make sure the schemas match.

.. _tip_projections_and_pasting:

.. tip:: **Congruency of Pasted Features**

   If your source and destination layers use the same projection, then the
   pasted features will have geometry identical to the source layer. However
   if the destination layer is a different projection then |qg| cannot
   guarantee the geometry is identical. This is simply because there are
   small rounding-off errors involved when converting between projections.

Deleting Selected Features
..........................

If we want to delete an entire polygon, we can do that by first selecting the
polygon using the regular |mActionSelect| :sup:`Select Single Feature` tool. You
can select multiple features for deletion. Once you have the selection set,
use the |mActionDeleteSelected| :sup:`Delete Selected` tool to delete the
features.

The |mActionEditCut| :sup:`Cut Features` tool on the digitizing toolbar can
also be used to delete features. This effectively deletes the feature but
also places it on a "spatial clipboard". So we cut the feature to delete.
We could then use the |mActionEditPaste| :sup:`Paste Features` tool to put it back,
giving us a one-level undo capability. Cut, copy, and paste work on the
currently selected features, meaning we can operate on more than one at a time.

.. _tip_deleting_features:

.. tip:: **Feature Deletion Support**

   When editing ESRI shapefiles, the deletion of features only works if |qg| is
   linked to a GDAL version 1.3.2 or greater. The OS X and Windows versions of
   |qg| available from the download site are built using GDAL 1.3.2 or higher.

Saving Edited Layers
....................

When a layer is in editing mode, any changes remain in the memory of |qg|.
Therefore they are not committed/saved immediately to the data source or disk.
If you want to save edits to the current layer but want to continue editing
without leaving the editing mode, you can click the |mActionFileSave|
:sup:`Save Edits` button. When you turn editing mode off with the
|mActionToggleEditing| :sup:`Toggle editing` (or quit |qg| for that matter),
you are also asked if you want to save your changes or discard them.

If the changes cannot be saved (e.g. disk full, or the attributes have values
that are out of range), the |qg| in-memory state is preserved. This allows
you to adjust your edits and try again.

.. _tip_data_integrity:

.. tip:: **Data Integrity**

   It is always a good idea to back up your data source before you start
   editing. While the authors of |qg| have made every effort to preserve the
   integrity of your data, we offer no warranty in this regard.

.. _sec_advanced_edit:

Advanced digitizing
-------------------

.. following provides space between header and table!!

\

\

.. _table_advanced_editing:

+-----------------------------+----------------------+-------------------------+---------------------------------------+
| Icon                        | Purpose              | Icon                    | Purpose                               |
+=============================+======================+=========================+=======================================+
| |mActionUndo|               | Undo                 | |mActionRedo|           | Redo                                  |
+-----------------------------+----------------------+-------------------------+---------------------------------------+
| |mActionRotateFeature|      | Rotate Feature(s)    | |mActionSimplify|       | Simplify Feature                      |
+-----------------------------+----------------------+-------------------------+---------------------------------------+
| |mActionAddRing|            | Add Ring             | |mActionAddIsland|      | Add Part                              |
+-----------------------------+----------------------+-------------------------+---------------------------------------+
| |mActionDeleteRing|         | Delete Ring          | |mActionDeletePart|     | Delete Part                           |
+-----------------------------+----------------------+-------------------------+---------------------------------------+
| |mActionReshape|            | Reshape Features     | |mActionOffsetCurve|    | Offset Curve                          |
+-----------------------------+----------------------+-------------------------+---------------------------------------+
| |mActionSplitFeatures|      | Split Features       | |mActionMergeFeatures|  | Merge Selected Features               | 
+-----------------------------+----------------------+-------------------------+---------------------------------------+
| |mActionRotatePointSymbols| | Rotate Point Symbols | |mActionMergeFeatures|  | Merge Attributes of Selected Features |
+-----------------------------+----------------------+-------------------------+---------------------------------------+

Table Advanced Editing: Vector layer advanced editing toolbar


Undo and Redo
.............

The |mActionUndo| :sup:`Undo` and |mActionRedo| :sup:`Redo` tools allow the
user to undo or redo vector editing operations. There is also a dockable
widget, which shows all operations in the undo/redo history (see
Figure_edit_3_). This widget is not displayed by default; it can be
displayed by right clicking on the toolbar and activating the Undo/Redo
check box. Undo/Redo is however active, even if the widget is not displayed.

.. _figure_edit_3:

.. only:: html

   **Figure Edit 3:**

.. figure:: /static/user_manual/working_with_vector/redo_undo.png
   :width: 15em
   :align: center

   Redo and Undo digitizing steps |nix|

When Undo is hit, the state of all features and attributes are reverted to
the state before the reverted operation happened. Changes other than normal
vector editing operations (for example changes done by a plugin), may or may
not be reverted, depending on how the changes were performed.

To use the undo/redo history widget simply click to select an operation in
the history list; all features will be reverted to the state they were in
after the selected operation.

Rotate Feature(s)
.................

Use the |mActionRotatePointSymbols|:sup:`Rotate Feature(s)` to rotate one or multiple
selected features in the map canvas. You first need to select the features
and then press the |mActionRotatePointSymbols|:sup:`Rotate Feature(s)` Icon. Then the
centroid of the feature appears and will be the rotation anchor point. If you selected
multiple features the rotation anchor point will be the common center of the features.
Press and drag the left mouse button in the desired direction to rotate the 
selected features.


It's also possible to create a user-defined rotation anchor point by which the selected feature will rotate.
Select the features to rotate and activate the |mActionRotatePointSymbols|:sup:`Rotate Feature(s)` Tool.
Press and hold the :kbd:`Ctrl` button and move the mouse pointer (without pressing the mouse button)
to the place where you want the rotation anchor to be moved. Release the :kbd:`Ctrl` button 
when the desired rotation anchor point is reached. Now press and drag the left mouse button
in the desired direction to rotate the selected feature(s).
 
Simplify Feature
................

The |mActionSimplify| :sup:`Simplify Feature` tool allows to reduce the
number of vertices of a feature, as long as the geometry doesn't change.
You need to select a feature, it will be highlighted by a red rubber band
and a slider appears. Moving the slider, the red rubber band is changing
its shape to show how the feature is being simplified. Clicking **[OK]**
the new, simplified geometry will be stored. If a feature cannot be simplified
(e.g. MultiPolygons), a message shows up.

Add Ring
........

You can create :index:`ring polygons` using the |mActionAddRing|
:sup:`Add Ring` icon in the toolbar. This means inside an existing area it
is possible to digitize further polygons, that will occur as a 'hole', so
only the area in between the boundaries of the outer and inner polygons remain
as a ring polygon.

Add Part
........

You can |mActionAddIsland| :sup:`add part` polygons to a selected
:index:`multipolygon`. The new part polygon has to be digitized outside
the selected multipolygon.

Delete Ring
...........

The |mActionDeleteRing| :sup:`Delete Ring` tool allows to delete ring polygons
inside an existing area. This tool only works with polygon layers. It doesn't
change anything when it is used on the outer ring of the polygon. This tool
can be used on polygon and multi-polygon features. Before you select the
vertices of a ring, adjust the vertex edit tolerance.

Delete Part
...........

The |mActionDeletePart| :sup:`Delete Part` tool allows to delete parts from
multifeatures (e.g. to delete polygons from a multipolygon feature). It won't
delete the last part of the feature, this last part will stay untouched. This
tool works with all multi-part geometries point, line and polygon. Before you
select the vertices of a part, adjust the vertex edit tolerance.

Reshape Features
................

You can reshape line and polygon features using the |mActionReshape|
:sup:`Reshape Features` icon on the toolbar. It replaces the line or polygon
part from the first to the last intersection with the original line. With
polygons this can sometimes lead to unintended results. It is mainly useful
to replace smaller parts of a polygon, not major overhauls and the reshape
line is not allowed to cross several polygon rings as this would generate an
invalid polygon.

For example, you can edit the boundary of a polygon with this tool. First,
click in the inner area of the polygon next to the point where you want to
add a new vertex. Then, cross the boundary and add the vertices outside the
polygon. To finish, right-click in the inner area of the polygon. The tool
will automatically add a node where the new line crosses the border. It is
also possible to remove part of the area from the polygon, starting the new
line outside the polygon, adding vertices inside, and ending the line outside
the polygon with a right click.

.. note::
   The reshape tool may alter the starting position of a polygon ring or a
   closed line. So the point that is represented 'twice' will not be the same
   any more. This may not be a problem for most applications, but it is
   something to consider.


Offset Curves
.............

The |mActionOffsetCurve| :sup:`Offset Curve` tool is a new editing tool. It
creates parallel shifts of lines and polygon rings. The tool can be applied to
the edited layer (the geometries are modified) or also to background layers
(creates copies of the lines / rings and adds it to the the edited layer). It is
thus ideally suited for the creation of distance line layers.The displacement is
shown at the bottom left of the taskbar.

.. index:: Split_Features

Split Features
..............

You can split features using the |mActionSplitFeatures| :sup:`Split Features`
icon on the toolbar. Just draw a line across the feature you want to split.

.. index:: Merge_Selected_Features

Merge selected features
.......................

The |mActionMergeFeatures| :sup:`Merge Selected Features` tool allows to merge
features that have common boundaries and the same attributes.

.. index:: Merge_Attributes_of_Selected_Features

Merge attributes of selected features
.....................................

The |mActionMergeFeatures| :sup:`Merge Attributes of Selected Features` tool
allows to :index:`merge attributes of features` with common boundaries and
attributes without merging their boundaries.

.. index:: Rotate_Point_symbols

Rotate Point Symbols
....................

.. % FIXME change, if support in new symbology is available, too

The |mActionRotatePointSymbols| :sup:`Rotate Point Symbols` tool is currently
only supported by the old symbology engine. It allows to change the rotation
of point symbols in the map canvas, if you have defined a rotation column
from the attribute table of the point layer in the :guilabel:`Style` tab of
the :guilabel:`Layer Properties`. Otherwise the tool is inactive.

.. _figure_edit_4:

.. only:: html

   **Figure Edit 4:**

.. figure:: /static/user_manual/working_with_vector/rotatepointsymbol.png
   :width: 15em
   :align: center

   Rotate Point Symbols |nix|

To change the rotation, select a point feature in the map canvas and rotate
it holding the left mouse button pressed. A red arrow with the rotation value
will be visualized (see Figure_edit_4_). When you release the left mouse
button again, the value will be updated in the attribute table.

.. note::
   If you hold the :kbd:`Ctrl` key pressed, the rotation will be done in 15
   degree steps.

.. index:: Create_New_Layers, New_Shapefile_Layer

.. _sec_create_shape:

Creating a new Vector layer
---------------------------

|qg| allows to create new Shapefile layers and new SpatiaLite layers. Creation
of a new GRASS layer is supported within the GRASS-plugin. Please refer to
section :ref:`creating_new_grass_vectors` for more information on creating
GRASS vector layers.

Creating a new Shapefile layer
..............................

To create a new Shape layer for editing, choose :menuselection:`New -->`
|mActionNewVectorLayer| :menuselection:`New Shapefile Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New Vector Layer` dialog will be
displayed as shown in Figure_edit_5_. Choose the type of layer (point, line or
polygon) and the CRS (Coordinate Reference System).

Note that |qg| does not yet support creation of 2.5D features (i.e. features
with X,Y,Z coordinates).

.. _figure_edit_5:

.. only:: html

   **Figure Edit 5:**

.. figure:: /static/user_manual/working_with_vector/editNewVector.png
   :width: 20em
   :align: center

   Creating a new Shapefile layer Dialog |nix|

To complete the creation of the new Shapefile layer, add the desired attributes
by clicking on the **[Add]** button and specifying a name and type for the
attribute. A first 'id' column is added as default but can be removed, if not
wanted. Only :guilabel:`Type: real` |selectstring|, :guilabel:`Type: integer`
|selectstring|, and :guilabel:`Type: string` |selectstring| attributes are
supported. Additionally and according to the attribute type you can also define
the width and precision of the new attribute column. Once you are happy with
the attributes, click **[OK]** and provide a name for the shapefile. |qg| will
automatically add a :file:`.shp` extension to the name you specify. Once the
layer has been created, it will be added to the map and you can edit it in the
same way as described in Section :ref:`sec_edit_existing_layer` above.

.. index:: New_Spatialite_Layer

.. _vector_create_spatialite:

Creating a new SpatiaLite layer
...............................

To create a new SpatiaLite layer for editing, choose :menuselection:`New -->`
|mActionNewVectorLayer| :menuselection:`New SpatiaLite Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New SpatiaLite Layer` dialog will
be displayed as shown in Figure_edit_6_.

.. _figure_edit_6:

.. only:: html

   **Figure Edit 6:**

.. figure:: /static/user_manual/working_with_vector/editNewSpatialite.png
   :width: 20em
   :align: center

   Creating a New SpatiaLite layer Dialog |nix|

First step is to select an existing SpatiaLite database or to create a new
SpatiaLite database. This can be done with the browse button |browsebutton| to
the right of the database field. Then add a name for the new layer and define
the layer type and the EPSG SRID. If desired you can select to |checkbox|
:guilabel:`Create an autoincrementing primary key`.

To define an attribute table for the new SpatiaLite layer, add the names of
the attribute columns you want to create with the according column type and
click on the **[Add to attribute list]** button. Once you are happy with the
attributes, click **[OK]**. |qg| will automatically add the new layer to the
legend and you can edit it in the same way as described in Section
:ref:`sec_edit_existing_layer` above.

Further management of SpatiaLite-Layers can be done with the DB Manager see 
:ref:`dbmanager`.

.. index:: Work_with_Attribute_Table

.. _sec_attribute_table:

Working with the Attribute Table
--------------------------------

The :index:`attribute table` displays features of a selected layer. Each row
in the table represents one map feature and each column contains a particular
piece of information about the feature. Features in the table can be searched,
selected, moved or even edited.

To open the attribute table for a vector layer, make the layer active by
clicking on it in the map legend area. Then from the main menu
:menuselection:`Layer` choose |mActionOpenTable| :menuselection:`Open Attribute
Table`. It is also possible to rightclick on the layer and choose
|mActionOpenTable| :menuselection:`Open Attribute Table` from the dropdown menu.

This will open a new window which displays the feature attributes in the
layer (figure_attributes_1_). The number of features and the number of
selected features are shown in the attribute table title.

.. _figure_attributes_1:

.. only:: html

   **Figure Attributes 1:**

.. figure:: /static/user_manual/working_with_vector/vectorAttributeTable.png
   :width: 30em
   :align: center

   Attribute Table for Alaska layer |nix|

.. index:: Attribute_Table_Selection

Selecting features in an attribute table
........................................

**Each selected row** in the attribute table displays the attributes of a
selected feature in the layer. If the set of features selected in the main
window is changed, the selection is also updated in the attribute table.
Likewise, if the set of rows selected in the attribute table is changed, the
set of features selected in the main window will be updated.

Rows can be selected by clicking on the row number on the left side of the
row. **Multiple rows** can be marked by holding the :kbd:`Ctrl` key.
A **continuous selection** can be made by holding the :kbd:`Shift` key and
clicking on several row headers on the left side of the rows. All rows
between the current cursor position and the clicked row are selected.
Moving the cursor position in the attribute table, by clicking a cell in the
table, does not change the row selection. Changing the selection in the main
canvas does not move the cursor position in the attribute table.

The table can be sorted by any column, by clicking on the column header. A
small arrow indicates the sort order (downward pointing means descending
values from the top row down, upward pointing means ascending values from
the top row down).

For a **simple search by attributes** on only one column the :guilabel:`Look for`
field can be used. Select the field (column) from which the search should be
performed from the dropdown menu and hit the **[Search]** button. The
matching rows will be selected and the total number of matching rows will
appear in the title bar of the attribute table, and in the status bar of
the main window. For more complex searches use the Advanced search button
|browsebutton|, which will launch the Search Query Builder described in
Section :ref:`vector_query_builder`.

To show selected records only, use the checkbox |checkbox|
:guilabel:`Show selected only`.
To search selected records only, use the checkbox |checkbox|
:guilabel:`Search selected only`. The |checkbox| :guilabel:`Case sensitive`
checkbox allows to select case sensitive.
The other buttons at the bottom left of the attribute table window provide
following functionality:

* |mActionOpenTable| :sup:`Unselect all` also with :kbd:`Ctrl+U`
* |mActionSelectedToTop| :sup:`Move selected to top` also with :kbd:`Ctrl+T`
* |mActionInvertSelection| :sup:`Invert selection` also with :kbd:`Ctrl+S`
* |mActionCopySelected| :sup:`Copy selected rows to clipboard` also with
  :kbd:`Ctrl+C`
* |mActionZoomToSelected| :sup:`Zoom map to the selected rows` also with
  :kbd:`Ctrl+J`
* |PanToSelected| :sup:`Pan map to the selected rows` also with :kbd:`Ctrl+P`
* |mActionToggleEditing| :sup:`Toggle editing mode` to edit single values
  and to enable functionalities described below also with
  :kbd:`Ctrl+E`
* |mActionDeleteSelected| :sup:`Delete selected features` also with
  :kbd:`Ctrl+D`
* |mActionNewAttribute| :sup:`New Column` for PostGIS layers and for OGR
  layers with GDAL version >= 1.6 also with :kbd:`Ctrl+W`
* |mActionDeleteAttribute| :sup:`Delete Column` for PostGIS layers and for OGR
  layers with GDAL version >= 1.9 also with :kbd:`Ctrl+L`
* |mActionCalculateField| :sup:`Open field calculator` also with :kbd:`Ctrl+I`

.. tip:: **Skip WKT geometry**

   If you want to use attribute data in external programs (such as Excel) use the
   |mActionCopySelected| :sup:`Copy selected rows to clipboard` button.
   You can copy the information without vector geometries if you deactivate
   :menuselection:`Settings --> Options -->` General tab |checkbox|
   :guilabel:`Copy geometry in WKT representation from attribute table`.

Save selected features as new layer
...................................

The selected features can be saved as any OGR supported vector format and
also transformed into another Coordinate Reference System (CRS). Just open
the right mouse menu of the layer and click on :menuselection:`Save selection
as -->` to define the name of the output file, its format and CRS (see Section
:ref:`label_legend`). It is also possible to specify OGR creation options
within the dialog.

.. index:: Non_Spatial_Attribute_Tables

Working with non spatial attribute tables
.........................................

QGIS allows also to load non spatial tables. This includes currently tables
supported by OGR, delimited text and the PostgreSQL provider. The tables can
be used for field lookups or just generally browsed and edited using the table
view. When you load the table you will see it in the legend field. It can be
opened e.g. with the |mActionOpenTable| :sup:`Open Attribute Table` tool and
is then editable like any other layer attribute table.

As an example you can use columns of the non spatial table to define attribute
values or a range of values that are allowed to be added to a specific vector
layer during digitizing. Have a closer look at the edit widget in section
:ref:`vector_attributes_tab` to find out more.
