|updatedisclaimer|

Editing
=======

.. contents::
   :local:

QGIS supports various capabilities for :index:`editing` OGR,
SpatiaLite, PostGIS, MSSQL Spatial and Oracle Spatial vector layers and tables.

.. note::
   The procedure for editing GRASS layers is different - see section
   :ref:`grass_digitizing` for details.

.. _tip_concurrent_edits:

.. tip:: **Concurrent Edits**

   This version of QGIS does not track if somebody else is editing a feature
   at the same time as you are. The last person to save their edits wins.

.. index:: Snapping, Snapping_Tolerance

.. _`snapping_tolerance`:

Setting the Snapping Tolerance and Search Radius
------------------------------------------------

Before we can edit vertices, we must set the snapping tolerance and search
radius to a value that allows us an optimal editing of the vector layer
geometries.

Snapping tolerance
..................

Snapping tolerance is the distance QGIS uses to ``search`` for the closest
vertex and/or segment you are trying to connect to when you set a new vertex or
move an existing vertex. If you aren't within the snapping tolerance, QGIS
will leave the vertex where you release the mouse button, instead of snapping
it to an existing vertex and/or segment.
The snapping tolerance setting affects all tools that work with tolerance.

#. A general, project-wide snapping tolerance can be defined by choosing
   :menuselection:`Settings -->` |options| :menuselection:`Options`.
   On Mac, go to :menuselection:`QGIS -->` |options|
   :menuselection:`Preferences...`. On Linux: :menuselection:`Edit -->`
   |options| :menuselection:`Options`. In the :guilabel:`Digitizing`
   tab, you can select between 'to vertex', 'to segment' or 'to vertex and segment'
   as default snap mode. You can also define a default snapping tolerance and
   a search radius for vertex edits. The tolerance can be set either in map
   units or in pixels. The advantage of choosing pixels is that the snapping
   tolerance doesn't have to be changed after zoom operations. In our small
   digitizing project (working with the Alaska dataset), we define the
   snapping units in feet. Your results may vary, but something on the order
   of 300 ft at a scale of 1:10000 should be a reasonable
   setting.
#. A layer-based snapping tolerance can be defined by choosing
   :menuselection:`Settings -->` (or :menuselection:`File -->`)
   :menuselection:`Snapping options...` to enable and adjust snapping mode
   and tolerance on a layer basis (see figure_edit_1_ ).

Note that this layer-based snapping overrides the global snapping option
set in the Digitizing tab. So, if you need to edit one layer and snap its
vertices to another layer, then enable snapping only on the ``snap to``
layer, then decrease the global snapping tolerance to a smaller value.
Furthermore, snapping will never occur to a layer that is not checked in
the snapping options dialog, regardless of the global snapping tolerance.
So be sure to mark the checkbox for those layers that you need to snap to.

.. _figure_edit_1:

.. only:: html

   **Figure Edit 1:**

.. figure:: /static/user_manual/working_with_vector/editProjectSnapping.png
   :align: center

   Edit snapping options on a layer basis (Advanced mode) |nix|

.. index:: Search_Radius

The :guilabel:`Snapping options` enables you to make a quick and simple general setting
for all layers in the project so that the pointer snaps to all existing vertices and/or
segments when using the 'All layers' snapping mode. In most cases it is sufficient to use
this snapping mode.

It is important to consider that the per-layer tolerance in
'map units' was actually in layer units. So if working with a layer in
WGS84 reprojected to UTM, setting tolerance to 1 map unit (i.e. 1 meter)
wouldn't work correctly because the units would be actually degrees. So now
the 'map units' has been relabeled to 'layer units' and the new entry 'map
units' operates with units of the map view. While working with 'on-the-fly' CRS transformation
it is now possible to use a snapping tolerance that refers to either the units of the reprojected
layer (setting 'layer units') or the units of the map view (setting 'map units').


Search radius
.............

Search radius is the distance QGIS uses to ``search`` for the closest vertex
you are trying to move when you click on the map. If you aren't within the
search radius, QGIS won't find and select any vertex for editing, and it will
pop up an annoying warning to that effect.
Snap tolerance and search radius are set in map units or pixels, so you may
find you need to experiment to get them set right. If you specify too big of
a tolerance, QGIS may snap to the wrong vertex, especially if you are dealing
with a large number of vertices in close proximity. Set search radius too
small, and it won't find anything to move.

The search radius for vertex edits in layer units can be defined in the
:guilabel:`Digitizing` tab under :menuselection:`Settings -->` |options|
:menuselection:`Options`. This is the same place where you define the general, project-
wide snapping tolerance.


.. Index:: Topological_Editing

Topological editing
-------------------

Besides layer-based snapping options, you can also define topological
functionalities in the :guilabel:`Snapping options...` dialog in the
:menuselection:`Settings` (or :menuselection:`File`) menu. Here, you can
define |checkbox| :guilabel:`Enable topological editing`,
and/or for polygon layers, you can activate the column |checkbox|
:guilabel:`Avoid Int.`, which avoids intersection of new polygons.

.. index:: Shared_Polygon_Boundaries

Enable topological editing
..........................

The option |checkbox| :guilabel:`Enable topological editing` is for editing
and maintaining common boundaries in polygon mosaics. QGIS 'detects' a
shared boundary in a polygon mosaic, so you only have to move the vertex
once, and QGIS will take care of updating the other boundary.

.. Index:: Avoid_Intersections_Of_Polygons

Avoid intersections of new polygons
...................................

The second topological option in the |checkbox| :guilabel:`Avoid Int.`
column, called :guilabel:`Avoid intersections of new polygons`, avoids
overlaps in polygon mosaics. It is for quicker digitizing of adjacent
polygons. If you already have one polygon, it is possible with this option
to digitize the second one such that both intersect, and QGIS then cuts the
second polygon to the common boundary. The advantage is that you don't
have to digitize all vertices of the common boundary.

.. Index:: Snapping_On_Intersections

Enable snapping on intersections
.................................

Another option is to use |checkbox| :guilabel:`Enable snapping on intersection`.
It allows you to snap on an intersection of background layers, even if there's no vertex on
the intersection.


.. index:: Digitizing

.. _sec_edit_existing_layer:

Digitizing an existing layer
----------------------------

By default, QGIS loads layers read-only. This is a safeguard to avoid
accidentally editing a layer if there is a slip of the mouse.
However, you can choose to edit any layer as long as the data provider
supports it, and the underlying data source is writable (i.e., its files are
not read-only).

In general, tools for editing vector layers are divided into a digitizing and an advanced
digitizing toolbar, described in section :ref:`sec_advanced_edit`. You can
select and unselect both under :menuselection:`View --> Toolbars -->`.
Using the basic digitizing tools, you can perform the following functions:

.. _table_editing:

+------------------+----------------------------------+--------------------+----------------------------------+
| Icon             | Purpose                          | Icon               | Purpose                          |
+==================+==================================+====================+==================================+
| |allEdits|       | Current edits                    | |toggleEditing|    | Toggle editing                   |
+------------------+----------------------------------+--------------------+----------------------------------+
| |capturePoint|   | Adding Features: Capture Point   | |captureLine|      | Adding Features: Capture Line    |
+------------------+----------------------------------+--------------------+----------------------------------+
| |capturePolygon| | Adding Features: Capture Polygon | |moveFeature|      | Move Feature                     |
+------------------+----------------------------------+--------------------+----------------------------------+
| |nodeTool|       | Node Tool                        | |deleteSelected|   | Delete Selected                  |
+------------------+----------------------------------+--------------------+----------------------------------+
| |editCut|        | Cut Features                     | |editCopy|         | Copy Features                    |
+------------------+----------------------------------+--------------------+----------------------------------+
| |editPaste|      | Paste Features                   | |saveEdits|        | Save layer edits                 |
+------------------+----------------------------------+--------------------+----------------------------------+

Table Editing: Vector layer basic editing toolbar

Note that while using any of the digitizing tools, you can still :ref:`zoom or pan
<zoom-pan>` in the map canvas without losing the focus on the tool.

All editing sessions start by choosing the |toggleEditing|
:sup:`Toggle editing` option. This can be found in the context menu
after right clicking on the legend entry for a given layer.

Alternatively, you can use the :index:`Toggle Editing` |toggleEditing|
:sup:`Toggle editing` button from the digitizing toolbar to start or stop the
editing mode. Once the layer is in edit mode, markers will appear at the
vertices, and additional tool buttons on the editing toolbar will become
available.

.. _tip_save_regularly:

.. tip:: **Save Regularly**

   Remember to |saveEdits| :sup:`Save Layer Edits` regularly. This will also
   check that your data source can accept all the changes.

Adding Features
...............

You can use the |capturePoint| :sup:`Add Feature`,
|captureLine| :sup:`Add Feature` or |capturePolygon|
:sup:`Add Feature` icons on the toolbar to put the QGIS cursor into
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
river in Alaska. In the :guilabel:`Digitizing` menu under the
:menuselection:`Settings --> Options` menu, you can also activate |checkbox|
:guilabel:`Suppress attributes pop-up windows after each created feature` and
|checkbox| :guilabel:`Reuse last entered attribute values`.

.. _figure_edit_2:

.. only:: html

   **Figure Edit 2:**

.. figure:: /static/user_manual/working_with_vector/editDigitizing.png
   :align: center

   Enter Attribute Values Dialog after digitizing a new vector
   feature |nix|

With the |moveFeature| :sup:`Move Feature(s)` icon on the toolbar, you can
move existing features.

.. _tip_attributes_types:

.. tip:: **Attribute Value Types**

   For editing, the attribute types are validated during
   entry. Because of this, it is not possible to enter a number into
   a text column in the dialog :guilabel:`Enter Attribute Values` or vice
   versa. If you need to do so, you should edit the attributes in a second
   step within the :guilabel:`Attribute table` dialog.

.. index:: Current_Edits

Current Edits
.............

This feature allows the digitization of multiple layers. Choose
|fileSaveAs| :guilabel:`Save for Selected Layers` to save all changes you
made in multiple layers. You also have the opportunity to
|rollbackEdits| :guilabel:`Rollback for Selected Layers`, so that the
digitization may be withdrawn for all selected layers.
If you want to stop editing the selected layers, |cancelEdits| :guilabel:`Cancel for Selected Layer(s)`
is an easy way.

The same functions are available for editing all layers of the project.

.. index:: Node_Tool

Node Tool
.........

For shapefile-based layers as well as SpatialLite, PostgreSQL/PostGIS, MSSQL Spatial, and Oracle Spatial tables, the
|nodeTool| :sup:`Node Tool` provides manipulation capabilities of
feature vertices similar to CAD programs. It is possible to simply select
multiple vertices at once and to move, add or delete them altogether.
The node tool also works with 'on the fly' projection turned on, and it supports
the topological editing feature. This tool is, unlike other tools in
QGIS, persistent, so when some operation is done, selection stays
active for this feature and tool. If the node tool is unable to find any
features, a warning will be displayed.

It is important to set the property :menuselection:`Settings -->` |options|
:menuselection:`Options --> Digitizing -->` :guilabel:`Search Radius:`
|selectNumber| to a number greater than zero (i.e., 10). Otherwise, QGIS will
not be able to tell which vertex is being edited.

.. _tip_vertex_markers:

.. tip:: **Vertex Markers**

   The current version of QGIS supports three kinds of vertex markers:
   'Semi-transparent circle', 'Cross' and 'None'. To change the marker style,
   choose |options| :menuselection:`Options` from the
   :menuselection:`Settings` menu, click on the :guilabel:`Digitizing`
   tab and select the appropriate entry.

Basic operations
................

.. index:: Nodes, Vertices, Vertex

Start by activating the |nodeTool| :sup:`Node Tool` and selecting a
feature by clicking on it. Red boxes will appear at each vertex of this feature.

.. Perhaps the error message mentioned below is in fact a bug, in which case the
.. bug should be fixed rather than including this note Note that to select a
.. polygon you must click one of its vertices or edges; clicking inside it will
.. produce an error message. Once a feature is selected the following
.. functionalities are available:


* **Selecting vertices**: You can select vertices by clicking on them one
  at a time, by clicking on an edge to select the vertices at both ends, or
  by clicking and dragging a rectangle around some vertices. When a vertex
  is selected, its color changes to blue. To add more vertices to the current
  selection, hold down the :kbd:`Ctrl` key while clicking. Hold down
  :kbd:`Ctrl` or :kbd:`Shift` when clicking to toggle the selection state of
  vertices (vertices that are currently unselected will be selected as usual,
  but also vertices that are already selected will become unselected).
* **Adding vertices**: To add a vertex, simply double click near an edge and
  a new vertex will appear on the edge near to the cursor. Note that the
  vertex will appear on the edge, not at the cursor position; therefore, it
  should be moved if necessary.
* **Deleting vertices**: After selecting vertices for deletion, click the
  :kbd:`Delete` key. Note that you cannot use the |nodeTool|
  :sup:`Node Tool` to delete a complete feature; QGIS will ensure it retains
  the minimum number of vertices for the feature type you are working on.
  To delete a complete feature use the |deleteSelected|
  :sup:`Delete Selected` tool.
* **Moving vertices**: Select all the vertices you want to move. Click on
  a selected vertex or edge and drag in the direction you wish to move. All
  the selected vertices will move together. If snapping is enabled, the whole
  selection can jump to the nearest vertex or line.

Each change made with the node tool is stored as a separate entry in the
Undo dialog. Remember that all operations support topological editing when
this is turned on. On-the-fly projection is also supported, and the node
tool provides tooltips to identify a vertex by hovering the pointer over it.

Cutting, Copying and Pasting Features
.....................................

Selected features can be cut, copied and pasted between layers in the same
QGIS project, as long as destination layers are set to |toggleEditing|
:sup:`Toggle editing` beforehand.

.. index:: CSV, WKT

Features can also be pasted to external applications as text. That is, the
features are represented in CSV format, with the geometry data appearing in
the OGC Well-Known Text (WKT) format.

However, in this version of QGIS, text features from outside QGIS cannot be
pasted to a layer within QGIS. When would the copy and paste function come
in handy? Well, it turns out that you can edit more than one layer at a time
and copy/paste features between layers. Why would we want to do this? Say
we need to do some work on a new layer but only need one or two lakes, not
the 5,000 on our ``big_lakes`` layer. We can create a new layer and use
copy/paste to plop the needed lakes into it.

As an example, we will copy some lakes to a new layer:

#. Load the layer you want to copy from (source layer)
#. Load or create the layer you want to copy to (target layer)
#. Start editing for target layer
#. Make the source layer active by clicking on it in the legend
#. Use the |select| :sup:`Select Single Feature` tool to select the
   feature(s) on the source layer
#. Click on the |editCopy| :sup:`Copy Features` tool
#. Make the destination layer active by clicking on it in the legend
#. Click on the |editPaste| :sup:`Paste Features` tool
#. Stop editing and save the changes

What happens if the source and target layers have different schemas (field
names and types are not the same)? QGIS populates what matches and ignores
the rest. If you don't care about the attributes being copied to the target
layer, it doesn't matter how you design the fields and data types. If you
want to make sure everything - the feature and its attributes - gets copied,
make sure the schemas match.

.. _tip_projections_and_pasting:

.. tip:: **Congruency of Pasted Features**

   If your source and destination layers use the same projection, then the
   pasted features will have geometry identical to the source layer. However,
   if the destination layer is a different projection, then QGIS cannot
   guarantee the geometry is identical. This is simply because there are
   small rounding-off errors involved when converting between projections.

.. _tip_copying_string_attributes:

.. tip:: **Copy string attribute into another**

   If you have created a new column in your attribute table with type 'string'
   and want to paste values from another attribute column that has a greater length
   the length of the column size will be extended to the same amount. This is because
   the GDAL Shapefile driver starting with GDAL/OGR 1.10 knows to auto-extend string
   and integer fields to dynamically accommodate for the length of the data to be inserted.

Deleting Selected Features
..........................

If we want to delete an entire polygon, we can do that by first selecting the
polygon using the regular |select| :sup:`Select Single Feature` tool. You
can select multiple features for deletion. Once you have the selection set,
use the |deleteSelected| :sup:`Delete Selected` tool to delete the
features.

The |editCut| :sup:`Cut Features` tool on the digitizing toolbar can
also be used to delete features. This effectively deletes the feature but
also places it on a "spatial clipboard". So, we cut the feature to delete.
We could then use the |editPaste| :sup:`Paste Features` tool to put it back,
giving us a one-level undo capability. Cut, copy, and paste work on the
currently selected features, meaning we can operate on more than one at a time.

Saving Edited Layers
....................

When a layer is in editing mode, any changes remain in the memory of QGIS.
Therefore, they are not committed/saved immediately to the data source or disk.
If you want to save edits to the current layer but want to continue editing
without leaving the editing mode, you can click the |saveEdits|
:sup:`Save Layer Edits` button. When you turn editing mode off with
|toggleEditing| :sup:`Toggle editing` (or quit QGIS for that matter),
you are also asked if you want to save your changes or discard them.

If the changes cannot be saved (e.g., disk full, or the attributes have values
that are out of range), the QGIS in-memory state is preserved. This allows
you to adjust your edits and try again.

.. _tip_data_integrity:

.. tip:: **Data Integrity**

   It is always a good idea to back up your data source before you start
   editing. While the authors of QGIS have made every effort to preserve the
   integrity of your data, we offer no warranty in this regard.

.. _sec_advanced_edit:

Advanced digitizing
-------------------

.. following provides space between header and table!!

\

\

.. _table_advanced_editing:

+---------------------------+-----------------------------------------+------------------------+-------------------------+
| Icon                      | Purpose                                 | Icon                   | Purpose                 |
+===========================+=========================================+========================+=========================+
| |undo|                    | Undo                                    | |redo|                 | Redo                    |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |rotateFeature|           | Rotate Feature(s)                       | |simplifyFeatures|     | Simplify Feature        |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |addRing|                 | Add Ring                                | |addPart|              | Add Part                |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |fillRing|                | Fill Ring                               | |deleteRing|           | Delete Ring             |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |deletePart|              | Delete Part                             | |reshape|              | Reshape Features        |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |offsetCurve|             | Offset Curve                            | |splitFeatures|        | Split Features          |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |splitParts|              | Split Parts                             | |mergeFeatures|        | Merge Selected Features |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |mergeFeatAttributes|     | Merge Attributes of Selected Features   | |rotatePointSymbols|   | Rotate Point Symbols    |
+---------------------------+-----------------------------------------+------------------------+-------------------------+

Table Advanced Editing: Vector layer advanced editing toolbar


Undo and Redo
.............

The |undo| :sup:`Undo` and |redo| :sup:`Redo` tools allows you
to undo or redo vector editing operations. There is also a dockable
widget, which shows all operations in the undo/redo history (see
Figure_edit_3_). This widget is not displayed by default; it can be
displayed by right clicking on the toolbar and activating the Undo/Redo
checkbox. Undo/Redo is however active, even if the widget is not displayed.

.. _figure_edit_3:

.. only:: html

   **Figure Edit 3:**

.. figure:: /static/user_manual/working_with_vector/redo_undo.png
   :align: center

   Redo and Undo digitizing steps |nix|

When Undo is hit, the state of all features and attributes are reverted to
the state before the reverted operation happened. Changes other than normal
vector editing operations (for example, changes done by a plugin), may or may
not be reverted, depending on how the changes were performed.

To use the undo/redo history widget, simply click to select an operation in
the history list. All features will be reverted to the state they were in
after the selected operation.

Rotate Feature(s)
.................

Use |rotateFeature|:sup:`Rotate Feature(s)` to rotate one or multiple features
in the map canvas. Press the |rotateFeature|:sup:`Rotate Feature(s)` icon and then
click on the feature to rotate. Either click on the map to place the rotated feature or
enter an angle in the user input widget. If you want to rotate several features,
they shall be selected first.

If you enable the map tool with feature(s) selected, its (their) centroid appears
and will be the rotation anchor point. If you want to move the anchor point,
hold the :kbd:`Ctrl` button  and click on the map to place it.

If you hold :kbd:`Shift` before clicking on the map, the rotation will be done
in 45 degree steps, which can be modified afterwards in the user input widget.

Simplify Feature
................

The |simplifyFeatures| :sup:`Simplify Feature` tool allows you to reduce the
number of vertices of a feature, as long as the geometry doesn't change. With the
tool you can also simplify multi-part features.
First, drag a rectangle over the feature. The vertices will be highlighted in red while the color of the
feature will change and a dialog where you can define a tolerance in map units or pixels
will appear. QGIS calculates the amount of vertices that can be deleted while maintaining the
geometry using the given tolerance. The higher the tolerance is the more vertices can be deleted. After
gaining the statistics about the simplification just click the **[OK]** button.
The tolerance you used will be saved when leaving a project or when leaving an edit session.
So you can go back to the same tolerance the next time when simplifying a feature.

Add Ring
........

You can create :index:`ring polygons` using the |addRing|
:sup:`Add Ring` icon in the toolbar. This means that inside an existing area, it
is possible to digitize further polygons that will occur as a 'hole', so
only the area between the boundaries of the outer and inner polygons remains
as a ring polygon.

Add Part
........

You can |addPart| :sup:`add part` polygons to a selected
:index:`multipolygon`. The new part polygon must be digitized outside
the selected multi-polygon.

Fill Ring
.........

You can use the |fillRing| :sup:`Fill Ring` function to add a ring to
a polygon and add a new feature to the layer at the same time. Thus you need not
first use the |addRing| :sup:`Add Ring` icon and then the
|capturePolygon| :sup:`Add feature` function anymore.

Delete Ring
...........

The |deleteRing| :sup:`Delete Ring` tool allows you to delete ring polygons
inside an existing area. This tool only works with polygon layers. It doesn't
change anything when it is used on the outer ring of the polygon. This tool
can be used on polygon and multi-polygon features. Before you select the
vertices of a ring, adjust the vertex edit tolerance.

Delete Part
...........

The |deletePart| :sup:`Delete Part` tool allows you to delete parts from
multifeatures (e.g., to delete polygons from a multi-polygon feature). It won't
delete the last part of the feature; this last part will stay untouched. This
tool works with all multi-part geometries: point, line and polygon. Before you
select the vertices of a part, adjust the vertex edit tolerance.

Reshape Features
................

You can reshape line and polygon features using the |reshape|
:sup:`Reshape Features` icon on the toolbar. It replaces the line or polygon
part from the first to the last intersection with the original line. With
polygons, this can sometimes lead to unintended results. It is mainly useful
to replace smaller parts of a polygon, not for major overhauls, and the reshape
line is not allowed to cross several polygon rings, as this would generate an
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
   closed line. So, the point that is represented 'twice' will not be the same
   any more. This may not be a problem for most applications, but it is
   something to consider.


Offset Curves
.............

The |offsetCurve| :sup:`Offset Curve` tool creates parallel shifts of line layers.
The tool can be applied to the edited layer (the geometries are modified)
or also to background layers (in which case it creates copies of the lines / rings and adds them to the the edited layer).
It is thus ideally suited for the creation of distance line layers. The displacement is
shown at the bottom left of the taskbar.

To create a shift of a line layer, you must first go into editing mode and activate the
|offsetCurve| :sup:`Offset Curve` tool. Then click on a feature to shift it.
Move the mouse and click where wanted or enter the desired distance in the user input widget. Your changes may then be saved with the|saveEdits|:sup:`Save Layer Edits` tool.

QGIS options dialog (Digitizing tab then **Curve offset tools** section) allows
you to configure some parameters like **Join style**, **Quadrant segments**,
**Miter limit**.

.. index:: Split_Features

Split Features
..............

You can split features using the |splitFeatures| :sup:`Split Features`
icon on the toolbar. Just draw a line across the feature you want to split.

.. index:: Merge_Selected_Features

Split parts
...........

In QGIS it is possible to split the parts of a multi part feature so that the
number of parts is increased. Just draw a line across the part you want to split using
the |splitParts| :sup:`Split Parts` icon.

Merge selected features
.......................

The |mergeFeatures| :sup:`Merge Selected Features` tool allows you to merge
features. A new dialog will allow you to choose which value to choose between each
selected features or select a function (Minimum, Maximum, Median, Sum, Skip
Attribute) to use for each column. If features don't have a common boundaries,
a multipolygon will be created.

.. index:: Merge_Attributes_of_Selected_Features

Merge attributes of selected features
.....................................

The |mergeFeatAttributes| :sup:`Merge Attributes of Selected Features` tool
allows you to :index:`merge attributes of features` with common boundaries and
attributes without merging their boundaries.
First, select several features at once. Then
press the |mergeFeatAttributes| :sup:`Merge Attributes of Selected Features` button.
Now QGIS asks you which attributes are to be applied to all selected objects.
As a result, all selected objects have the same attribute entries.

.. index:: Rotate_Point_symbols

Rotate Point Symbols
....................

.. % FIXME change, if support in new symbology is available, too

|rotatePointSymbols| :sup:`Rotate Point Symbols` allows you to change the rotation
of point symbols in the map canvas. You must first define a rotation column
from the attribute table of the point layer in the :guilabel:`Advanced` menu of the
:guilabel:`Style` menu of the :guilabel:`Layer Properties`. Also, you will need to
go into the 'SVG marker' and choose :guilabel:`Data defined properties ...`.
Activate |checkbox| :guilabel:`Angle` and choose 'rotation' as field.
Without these settings, the tool is inactive.

.. _figure_edit_4:

.. only:: html

   **Figure Edit 4:**

.. figure:: /static/user_manual/working_with_vector/rotatepointsymbol.png
   :align: center

   Rotate Point Symbols |nix|

To change the rotation, select a point feature in the map canvas and rotate
it, holding the left mouse button pressed. A red arrow with the rotation value
will be visualized (see Figure_edit_4_). When you release the left mouse
button again, the value will be updated in the attribute table.

.. note::
   If you hold the :kbd:`Ctrl` key pressed, the rotation will be done in 15
   degree steps.

The Advanced Digitizing panel
-----------------------------

When capturing new geometries or geometry parts you also have the possibility to use
the Advanced Digitizing panel. You can digitize lines exactly parallel or at a specific angle
or lock lines to specific angles. Furthermore you can enter coordinates directly so that you can
make a precise definition for your new geometry.

.. _figure_advanced_edit 1:

.. only:: html

   **Figure Advanced Edit 1:**

.. figure:: /static/user_manual/working_with_vector/advanced_digitizing.png
   :align: center

   The Advanced Digitizing panel

The tools are not enabled if the map view is in geographic coordinates.


.. index:: Create_New_Layers, New_Shapefile_Layer, New_SpatiaLite_Layer, New_GPX_Layer

.. _sec_create_vector:

Creating new Vector layers
--------------------------

QGIS allows you to create new shapefile layers, new SpatiaLite layers, new
GPX layers and New Temporary Scratch Layers. Creation of a new GRASS layer is supported within the GRASS plugin.
Please refer to section :ref:`creating_new_grass_vectors` for more information
on creating GRASS vector layers.

Creating a new Shapefile layer
..............................

To create a new shape layer for editing, choose :menuselection:`New -->`
|newVectorLayer| :menuselection:`New Shapefile Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New Vector Layer` dialog will be
displayed as shown in Figure_edit_5_. Choose the type of layer (point, line or
polygon) and the CRS (coordinate reference system).

Note that QGIS does not yet support creation of 2.5D features (i.e., features
with X,Y,Z coordinates).

.. _figure_edit_5:

.. only:: html

   **Figure Edit 5:**

.. figure:: /static/user_manual/working_with_vector/editNewVector.png
   :align: center

   Creating a new Shapefile layer Dialog |nix|

To complete the creation of the new shapefile layer, add the desired attributes
by clicking on the **[Add to attributes list]** button and specifying a name and type for the
attribute. A first 'id' column is added as default but can be removed, if not
wanted. Only :guilabel:`Type: real` |selectString|, :guilabel:`Type: integer`
|selectString|, :guilabel:`Type: string` |selectString| and :guilabel:`Type:date` |selectString|
attributes are supported. Additionally and according to the attribute type, you can also define
the width and precision of the new attribute column. Once you are happy with
the attributes, click **[OK]** and provide a name for the shapefile. QGIS will
automatically add a :file:`.shp` extension to the name you specify. Once the
layer has been created, it will be added to the map, and you can edit it in the
same way as described in section :ref:`sec_edit_existing_layer` above.

.. index:: New_Spatialite_Layer

.. _vector_create_spatialite:

Creating a new SpatiaLite layer
...............................

To create a new SpatiaLite layer for editing, choose :menuselection:`New -->`
|newSpatiaLiteLayer| :menuselection:`New SpatiaLite Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New SpatiaLite Layer` dialog will
be displayed as shown in Figure_edit_6_.

.. _figure_edit_6:

.. only:: html

   **Figure Edit 6:**

.. figure:: /static/user_manual/working_with_vector/editNewSpatialite.png
   :align: center

   Creating a New SpatiaLite layer Dialog |nix|

The first step is to select an existing SpatiaLite database or to create a new
SpatiaLite database. This can be done with the browse button |browseButton| to
the right of the database field. Then, add a name for the new layer, define
the layer type, and specify the coordinate reference system with **[Specify CRS]**.
If desired, you can select |checkbox| :guilabel:`Create an autoincrementing primary key`.

To define an attribute table for the new SpatiaLite layer, add the names of
the attribute columns you want to create with the corresponding column type, and
click on the **[Add to attribute list]** button. Once you are happy with the
attributes, click **[OK]**. QGIS will automatically add the new layer to the
legend, and you can edit it in the same way as described in section
:ref:`sec_edit_existing_layer` above.

Further management of SpatiaLite layers can be done with the DB Manager. See
:ref:`dbmanager`.

.. index:: New_GPX_Layer
.. _vector_create_gpx:

Creating a new GPX layer
.........................

To create a new GPX file, you need to load the GPS plugin first. :menuselection:`Plugins -->`
|showPluginManager| :menuselection:`Plugin Manager...` opens the Plugin Manager Dialog.
Activate the |checkbox| :guilabel:`GPS Tools` checkbox.

When this plugin is loaded, choose :menuselection:`New -->` |createGPX|
:menuselection:`Create new GPX Layer...` from the :menuselection:`Layer` menu.
In the :guilabel:`Save new GPX file as` dialog, you can choose where to save the
new GPX layer.

.. index:: New_Temporary_Scratch_Layer
.. _vector_new_scratch_layer:

Creating a new Temporary Scratch Layer
......................................

Empty, editable memory layers can be defined using :menuselection:`Layer --> Create Layer --> New Temporary Scratch Layer`.
Here you can even create |radioButtonOff| :guilabel:`Multipoint`, |radioButtonOff|:guilabel:`Multiline`
and |radioButtonOff|:guilabel:`Multipolygon` Layers beneath |radioButtonOn|:guilabel:`Point`,
|radioButtonOff|:guilabel:`Line` and |radioButtonOff|:guilabel:`Polygon` Layers.
Temporary Scratch Layers are not saved and will be discarded when QGIS is closed.
See also paste_into_layer_ .

.. index:: Work_with_Attribute_Table
.. _sec_attribute_table:

Working with the Attribute Table
--------------------------------

The :index:`attribute table` displays features of a selected layer. Each row
in the table represents one map feature, and each column contains a particular
piece of information about the feature. Features in the table can be searched,
selected, moved or even edited.

To open the attribute table for a vector layer, make the layer active by
clicking on it in the map legend area. Then, from the main
:menuselection:`Layer` menu, choose |openTable| :menuselection:`Open Attribute
Table`. It is also possible to right click on the layer and choose
|openTable| :menuselection:`Open Attribute Table` from the drop-down menu,
and to click on the |openTable| :guilabel:`Open Attribute Table` button
in the Attributes toolbar.

This will open a new window that displays the feature attributes for the
layer (figure_attributes_1_). The number of features and the number of
selected features are shown in the attribute table title.

.. _figure_attributes_1:

.. only:: html

   **Figure Attributes 1:**

.. figure:: /static/user_manual/working_with_vector/vectorAttributeTable.png
   :align: center

   Attribute Table for regions layer |nix|

The buttons at the top of the attribute table window provide the
following functionality:

* |toggleEditing| :sup:`Toggle editing mode` to enable editing functionalities
  (also with :kbd:`Ctrl+e`)
* |saveEdits| :sup:`Save Edits` (also with :kbd:`Ctrl+s`)
* |draw| :sup:`Reload the table`
* |newTableRow| :sup:`Add feature`
* |deleteSelected| :sup:`Delete selected features` (also with
  :kbd:`Ctrl+d`)
* |expressionSelect| :sup:`Select features using an Expression`
* |selectAll| :sup:`Select all` (also with :kbd:`Ctrl+a`)
* |invertSelection| :sup:`Invert selection` (also with :kbd:`Ctrl+r`)
* |unselectAttributes| :sup:`Unselect all` (also with :kbd:`Ctrl+u`)
* |selectedToTop| :sup:`Move selected to top` (also with :kbd:`Ctrl+t`)
* |panToSelected| :sup:`Pan map to the selected rows` (also with :kbd:`Ctrl+p`)
* |zoomToSelected| :sup:`Zoom map to the selected rows` (also with
  :kbd:`Ctrl+j`)
* |copySelected| :sup:`Copy selected rows to clipboard` (also with
  :kbd:`Ctrl+c`)
* |editPaste| :sup:`Paste from clipboard to a new row` (also with
  :kbd:`Ctrl+v`)
* |deleteAttribute| :sup:`Delete Column` for PostGIS layers and for OGR
  layers with GDAL version >= 1.9 (also with :kbd:`Ctrl+l`)
* |newAttribute| :sup:`New Column` for PostGIS layers and for OGR
  layers with GDAL version >= 1.6 (also with :kbd:`Ctrl+w`)
* |calculateField| :sup:`Open field calculator` (also with :kbd:`Ctrl+i`)

Below these buttons is the Field Calculator bar (enabled only in editing mode),
which allows calculations to be quickly applied to either all or selected features
attributes in the table. This bar uses the same expressions as the |calculateField|
:sup:`Field Calculator` (see :ref:`vector_field_calculator`).

.. tip:: **Skip WKT geometry**

   If you want to use attribute data in external programs (such as Excel), use the
   |copySelected| :sup:`Copy selected rows to clipboard` button.
   You can copy the information without vector geometries if you deactivate
   :menuselection:`Settings --> Options -->` Data sources menu |checkbox|
   :guilabel:`Copy geometry in WKT representation from attribute table`.


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

For a **simple search by attributes** on only one column, choose the
:menuselection:`Column filter -->` from the menu in the bottom left corner.
Select the field (column) on which the search should be
performed from the drop-down menu, and hit the **[Apply]** button. Then, only
the matching features are shown in the attribute table.

To make a selection, you have to use the |expressionSelect| :sup:`Select features using an Expression`
icon on top of the attribute table.
|expressionSelect| :sup:`Select features using an Expression` allows you
to define a subset of a table using a :guilabel:`Function List` like in the
|calculateField| :sup:`Field Calculator` (see :ref:`vector_field_calculator`).
The query result can then be saved as a new vector layer.
For example, if you want to find regions that are boroughs from :file:`regions.shp`
of the QGIS sample data, you have to open the :guilabel:`Fields and Values` menu
and choose the field that you want to query. Double-click the field 'TYPE_2' and also
**[Load all unique values]** . From the list, choose and double-click 'Borough'.
In the :guilabel:`Expression` field, the following query appears:

::

 "TYPE_2"  =  'Borough'

Here you can also use the :menuselection:`Function list --> Recent (Selection)` to
make a selection that you used before. The expression builder remembers the last 20
used expressions.

The matching rows will be selected, and the total number of matching rows will
appear in the title bar of the attribute table, as well as in the status bar of
the main window. For searches that display only selected features on the map,
use the Query Builder described in section :ref:`vector_query_builder`.

To show selected records only, use :guilabel:`Show Selected Features` from the menu
at the bottom left. See next section for more information on filter feature.

The field calculator bar allows you to make calculations on the selected rows only.
For example, you can alter the number of the ID field of the file:`regions.shp` with
the expression

::

 ID+5

as shown in figure_attributes_1_ .

Filter features
................

At the bottom of the attribute table, you have a dropdown list of different
filter:

* Show All Features;
* Show Selected Features;
* Show Features visible on map;
* Show Edited and New Features;
* Field Filter;
* Advanced filter (Expression);

The first four are self explanatory, the two last are expression filters. Field
Filter allows user to choose a column name in the list and add a simple form to
the right of the drop-down list to filter with a *like* expression parameter.
This filter will create an expression filter as an :guilabel:`Advanced filter`.
The last kind of filter will open an expression window, see :ref:`vector_expressions`
for more information.


Tab/form mode
...............

By default the attribute window displays a table layout. In some case one
should prefer to use a form layout to help edit some features more easily.

You can switch to form layout by clicking in the bottom right, on |openForm|
and switch back to table layout with |openTable|.

Zoom to feature
.................

To zoom into a feature, without having to select it, right-click on the feature
you want to zoom in, within the attribute table, and select :guilabel:`Zoom to feature`.

Save selected features as new layer
...................................

The selected features can be saved as any OGR-supported vector format and
also transformed into another coordinate reference system (CRS). Just open
the right mouse menu of the layer and click on :menuselection:`Save
as` to define the name of the output file, its format and CRS (see section
:ref:`label_legend`). To save the selection ensure that the |checkbox|
:menuselection:`Save only selected features` is selected.
It is also possible to specify OGR creation options within the dialog.

.. _paste_into_layer:

Paste into new layer
....................

Features that are on the clipboard may be pasted into a new
layer.  To do this, first make a layer editable.  Select some features, copy them to the
clipboard, and then paste them into a new layer using
:menuselection:`Edit --> Paste Features as` and choosing
:menuselection:`New vector layer` or :menuselection:`New memory
layer`.

This applies to features selected and copied within QGIS and
also to features from another source defined using well-known text (WKT).

.. index:: Non_Spatial_Attribute_Tables

Working with non spatial attribute tables
.........................................

QGIS allows you also to load non-spatial tables. This currently includes tables
supported by OGR and delimited text, as well as the PostgreSQL, MSSQL and Oracle provider.
The tables can be used for field lookups or just generally browsed and edited using the table
view. When you load the table, you will see it in the legend field. It can be
opened with the |openTable| :sup:`Open Attribute Table` tool and
is then editable like any other layer attribute table.

As an example, you can use columns of the non-spatial table to define attribute
values, or a range of values that are allowed, to be added to a specific vector
layer during digitizing. Have a closer look at the edit widget in section
:ref:`vector_attributes_menu` to find out more.


.. index:: conditional_formatting

Conditional formatting of Table Cells
......................................

You can enable the conditional formatting panel clicking on
|rendererCategorizedSymbol| at the top right of the attributes window in table
wiew, not in form mode.

The new panel allows user to add new rules for conditional formatting of field
or full row in regard of the expression on field. Adding new rule open a form
to define:

* the name of the rule,
* a condition from expression window,
* a preset formatting
* some other parameters to improve, change or setup the formatting:

  * background and text colors,
  * use of icon,
  * bold, italic underline, or strikeout,
  * text field,
  * font.

.. TODO: Screenshot!

.. index:: Relations
.. _vector_relations:

Creating one to many relations
-------------------------------

Relations are a technique often used in databases. The concept is, that
features (rows) of different layers (tables) can belong to each other.

As an example you have a layer with all regions of alaska (polygon)
which provides some attributes about its name and region type and a
unique id (which acts as primary key).

Foreign keys
............

Then you get another point layer or table with information about airports
that are located in the regions and you also want to keep track of these. If
you want to add them to the region layer, you need to create a one to many
relation using foreign keys, because there are several airports in most regions.

.. _figure_relations_1:

.. only:: html

   **Figure Relations 1:**

.. figure:: /static/user_manual/working_with_vector/relations1.png
   :align: center

   Alaska region with airports |nix|

In addition to the already existing attributes in the airports attribute table
another field fk_region which acts as a foreign key (if you have a database, you will
probably want to define a constraint on it).

This field fk_region will always contain an id of a region. It can be seen
like a pointer to the region it belongs to. And you can design a custom edit
form for the editing and QGIS takes care about the setup. It works with different
providers (so you can also use it with shape and csv files) and all you have
to do is to tell QGIS the relations between your tables.

Layers
......

QGIS makes no difference between a table and a vector layer. Basically, a vector
layer is a table with a geometry. So can add your table as a vector layer. To
demonstrate you can load the 'region' shapefile (with geometries) and the 'airport'
csv table (without geometries) and a foreign key (fk_region) to the layer
region. This means, that each airport belongs to exactly one region while each
region can have any number of airports (a typical one to many relation).


Definition (Relation Manager)
.............................

The first thing we are going to do is to let QGIS know about the relations between the layer.
This is done in :menuselection:`Project --> Project Properties`.
Open the :guilabel:`Relations` menu and click on :guilabel:`Add`.

* **name** is going to be used as a title. It should be a human readable string, describing, what the relation is used for. We will just call say "Airports" in this case.
* **referencing layer** is the one with the foreign key field on it. In our case this is the airports layer
* **referencing field** will say, which field points to the other layer so this is fk_region in this case
* **referenced layer** is the one with the primary key, pointed to, so here it is the regions layer
* **referenced field** is the primary key of the referenced layer so it is ID
* **id** will be used for internal purposes and has to be unique. You may need it to build custom forms once this is supported. If you leave it empty, one will be generated for you but you can assign one yourself to get one that is easier to handle.

.. _figure_relations_2:

.. only:: html

   **Figure Relations 2:**

.. figure:: /static/user_manual/working_with_vector/relations2.png
   :align: center

   Relation Manager |nix|


Forms
.....

Now that QGIS knows about the relation, it will be used to improve the
forms it generates. As we did not change the default form method (autogenerated)
it will just add a new widget in our form. So let's select the layer region in
the legend and use the identify tool. Depending on your settings, the form might
open directly or you will have to choose to open it in the identification dialog
under actions.

.. _figure_relations_3:

.. only:: html

   **Figure Relations 3:**

.. figure:: /static/user_manual/working_with_vector/relations3.png
   :align: center

   Identification dialog regions with relation to airports |nix|

As you can see, the airports assigned to this particular region are all shown in a
table. And there are also some buttons available. Let's review them shortly

* The |toggleEditing| button is for toggling the edit mode. Be aware that it toggles the edit mode of the airport layer, although we are in the feature form of a feature from the region layer. But the table is representing features of the airport layer.
* The |signPlus| button will add a new feature to the airport layer. And it will assign the new airport to the current region by default.
* The |remove| button will delete the selected airport permanently.
* The |link| symbol will open a new dialog where you can select any existing airport which will then be assigned to the current region. This may be handy if you created the airport on the wrong region by accident.
* The |unlink| symbol will unlink the selected airport from the current region, leaving them unassigned (the foreign key is set to NULL) effectively.
* The two buttons to the right switch between table view and form view where the later let's you view all the airports in their respective form.

If you work on the airport table, a new widget type is available which lets you
embed the feature form of the referenced region on the feature form of the airports.
It can be used when you open the layer properties of the airports table, switch to
the :menuselection:`Fields` menu and change the widget type of the foreign key field 'fk_region' to
Relation Reference.

If you look at the feature dialog now, you will see, that the form of the region
is embedded inside the airports form and will even have a combobox, which allows you
to assign the current airport to another region.

.. _figure_relations_4:

.. only:: html

   **Figure Relations 4:**

.. figure:: /static/user_manual/working_with_vector/relations4.png
   :align: center

   Identification dialog airport with relation to regions |nix|
