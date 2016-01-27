|updatedisclaimer|

.. index:: Digitizing

.. _sec_edit_existing_layer:

******************************
 Digitizing an existing layer
******************************

By default, QGIS loads layers read-only. This is a safeguard to avoid
accidentally editing a layer if there is a slip of the mouse.
However, you can choose to edit any layer as long as the data provider
supports it, and the underlying data source is writable (i.e., its files are
not read-only).

.. note::
   The procedure for editing GRASS layers is different - see section
   :ref:`grass_digitizing` for details.

.. _tip_concurrent_edits:

.. tip:: **Concurrent Edits**

   This version of QGIS does not track if somebody else is editing a feature
   at the same time as you are. The last person to save their edits wins.

Digitizing Tools
================

In general, tools for editing vector layers are divided into a digitizing and an advanced
digitizing toolbar, described in section :ref:`sec_advanced_edit`. You can
select and unselect both under :menuselection:`View --> Toolbars -->`.
Using the basic digitizing tools, you can perform the following functions:

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
| |mActionEditPaste|      | Paste Features                   | |mActionSaveEdits|      | Save layer edits                 |
+-------------------------+----------------------------------+-------------------------+----------------------------------+

Table Editing: Vector layer basic editing toolbar

Note that while using any of the digitizing tools, you can still :ref:`zoom or pan 
<zoom-pan>` in the map canvas without loosing the focus on the tool.

All editing sessions start by choosing the |mActionToggleEditing|
:sup:`Toggle editing` option. This can be found in the context menu
after right clicking on the legend entry for a given layer.

Alternatively, you can use the |mActionToggleEditing| :sup:`Toggle editing` 
button from the digitizing toolbar to start or stop the editing mode.
Once the layer is in edit mode, markers will appear at the vertices,
and additional tool buttons on the editing toolbar will become available.

.. _tip_save_regularly:

.. tip:: **Save Regularly**

   Remember to |mActionSaveEdits| :sup:`Save Layer Edits` regularly. This will also
   check that your data source can accept all the changes.

Adding Features
---------------

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
the new feature. Figure_edit_1_ shows setting attributes for a fictitious new
river in Alaska. In the :guilabel:`Digitizing` menu under the
:menuselection:`Settings --> Options` menu, you can also activate |checkbox|
:guilabel:`Suppress attributes pop-up windows after each created feature` and
|checkbox| :guilabel:`Reuse last entered attribute values`.

.. _figure_edit_1:

.. only:: html

   **Figure Edit 1:**

.. figure:: /static/user_manual/working_with_vector/editDigitizing.png
   :align: center

   Enter Attribute Values Dialog after digitizing a new vector
   feature |nix|

With the |mActionMoveFeature| :sup:`Move Feature(s)` icon on the toolbar, you can
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
-------------

This feature allows the digitization of multiple layers. Choose
|mActionFileSaveAs| :guilabel:`Save for Selected Layers` to save all changes
you made in multiple layers. You also have the opportunity to
|mActionRollbackEdits| :guilabel:`Rollback for Selected Layers`, so that the
digitization may be withdrawn for all selected layers.
If you want to stop editing the selected layers, |mActionCancelEdits| 
:guilabel:`Cancel for Selected Layer(s)` is an easy way.

The same functions are available for editing all layers of the project.

.. index:: Node_Tool

Node Tool
---------

For shapefile-based layers as well as SpatialLite, PostgreSQL/PostGIS, MSSQL
Spatial, and Oracle Spatial tables, the |mActionNodeTool| :sup:`Node Tool` 
provides manipulation capabilities of feature vertices similar to CAD programs. 
It is possible to simply select multiple vertices at once and to move, 
add or delete them altogether.
The node tool also works with 'on the fly' projection turned on, and it supports
the topological editing feature. This tool is, unlike other tools in
|qg|, persistent, so when some operation is done, selection stays
active for this feature and tool. If the node tool is unable to find any
features, a warning will be displayed.

It is important to set the property :menuselection:`Settings -->` |mActionOptions|
:menuselection:`Options --> Digitizing -->` :guilabel:`Search Radius:`
|selectnumber| to a number greater than zero (i.e., 10). Otherwise, |qg| will
not be able to tell which vertex is being edited.

.. _tip_vertex_markers:

.. tip:: **Vertex Markers**

   The current version of |qg| supports three kinds of vertex markers:
   'Semi-transparent circle', 'Cross' and 'None'. To change the marker style,
   choose |mActionOptions| :menuselection:`Options` from the
   :menuselection:`Settings` menu, click on the :guilabel:`Digitizing`
   tab and select the appropriate entry.

Basic operations
----------------

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
Undo dialog. Remember that all operations support topological editing when
this is turned on. On-the-fly projection is also supported, and the node
tool provides tooltips to identify a vertex by hovering the pointer over it.

Cutting, Copying and Pasting Features
-------------------------------------

Selected features can be cut, copied and pasted between layers in the same
|qg| project, as long as destination layers are set to |mActionToggleEditing|
:sup:`Toggle editing` beforehand.

.. index:: CSV, WKT

Features can also be pasted to external applications as text. That is, the
features are represented in CSV format, with the geometry data appearing in
the OGC Well-Known Text (WKT) format.

However, in this version of |qg|, text features from outside |qg| cannot be
pasted to a layer within |qg|. When would the copy and paste function come
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
want to make sure everything - the feature and its attributes - gets copied,
make sure the schemas match.

.. _tip_projections_and_pasting:

.. tip:: **Congruency of Pasted Features**

   If your source and destination layers use the same projection, then the
   pasted features will have geometry identical to the source layer. However,
   if the destination layer is a different projection, then |qg| cannot
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
--------------------------

If we want to delete an entire polygon, we can do that by first selecting the
polygon using the regular |mActionSelect| :sup:`Select Single Feature` tool. You
can select multiple features for deletion. Once you have the selection set,
use the |mActionDeleteSelected| :sup:`Delete Selected` tool to delete the
features.

The |mActionEditCut| :sup:`Cut Features` tool on the digitizing toolbar can
also be used to delete features. This effectively deletes the feature but
also places it on a "spatial clipboard". So, we cut the feature to delete.
We could then use the |mActionEditPaste| :sup:`Paste Features` tool to put it back,
giving us a one-level undo capability. Cut, copy, and paste work on the
currently selected features, meaning we can operate on more than one at a time.

Saving Edited Layers
--------------------

When a layer is in editing mode, any changes remain in the memory of |qg|.
Therefore, they are not committed/saved immediately to the data source or disk.
If you want to save edits to the current layer but want to continue editing
without leaving the editing mode, you can click the |mActionSaveEdits|
:sup:`Save Layer Edits` button. When you turn editing mode off with
|mActionToggleEditing| :sup:`Toggle editing` (or quit |qg| for that matter),
you are also asked if you want to save your changes or discard them.

If the changes cannot be saved (e.g., disk full, or the attributes have values
that are out of range), the |qg| in-memory state is preserved. This allows
you to adjust your edits and try again.

.. _tip_data_integrity:

.. tip:: **Data Integrity**

   It is always a good idea to back up your data source before you start
   editing. While the authors of |qg| have made every effort to preserve the
   integrity of your data, we offer no warranty in this regard.

.. _sec_advanced_edit:

Advanced digitizing
===================

.. following provides space between header and table!!

\

\

.. _table_advanced_editing:

+----------------------------------+---------------------------------------+-----------------------------+-------------------------+
| Icon                             | Purpose                               | Icon                        | Purpose                 |
+==================================+=======================================+=============================+=========================+
| |mActionUndo|                    | Undo                                  | |mActionRedo|               | Redo                    |
+----------------------------------+---------------------------------------+-----------------------------+-------------------------+
| |mActionRotateFeature|           | Rotate Feature(s)                     | |mActionSimplify|           | Simplify Feature        |
+----------------------------------+---------------------------------------+-----------------------------+-------------------------+
| |mActionAddRing|                 | Add Ring                              | |mActionAddPart|            | Add Part                |
+----------------------------------+---------------------------------------+-----------------------------+-------------------------+
| |mActionFillRing|                | Fill Ring                             | |mActionDeleteRing|         | Delete Ring             |
+----------------------------------+---------------------------------------+-----------------------------+-------------------------+
| |mActionDeletePart|              | Delete Part                           | |mActionReshape|            | Reshape Features        |
+----------------------------------+---------------------------------------+-----------------------------+-------------------------+
| |mActionOffsetCurve|             | Offset Curve                          | |mActionSplitFeatures|      | Split Features          |
+----------------------------------+---------------------------------------+-----------------------------+-------------------------+
| |mActionSplitParts|              | Split Parts                           | |mActionMergeFeatures|      | Merge Selected Features |
+----------------------------------+---------------------------------------+-----------------------------+-------------------------+
| |mActionMergeFeatAttributes|     | Merge Attributes of Selected Features | |mActionRotatePointSymbols| | Rotate Point Symbols    |
+----------------------------------+---------------------------------------+-----------------------------+-------------------------+

Table Advanced Editing: Vector layer advanced editing toolbar


Undo and Redo
-------------

The |mActionUndo| :sup:`Undo` and |mActionRedo| :sup:`Redo` tools allows you
to undo or redo vector editing operations. There is also a dockable
widget, which shows all operations in the undo/redo history (see
Figure_edit_2_). This widget is not displayed by default; it can be
displayed by right clicking on the toolbar and activating the Undo/Redo
checkbox. Undo/Redo is however active, even if the widget is not displayed.

.. _figure_edit_2:

.. only:: html

   **Figure Edit 2:**

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
-----------------

Use |mActionRotateFeature|:sup:`Rotate Feature(s)` to rotate one or multiple features
in the map canvas. Press the |mActionRotateFeature|:sup:`Rotate Feature(s)` icon and then
click on the feature to rotate. Either click on the map to place the rotated feature or
enter an angle in the user input widget. If you want to rotate several features,
they shall be selected first.

If you enable the map tool with feature(s) selected, its (their) centroid appears
and will be the rotation anchor point. If you want to move the anchor point,
hold the :kbd:`Ctrl` button  and click on the map to place it.

If you hold :kbd:`Shift` before clicking on the map, the rotation will be done
in 45 degree steps, which can be modified afterwards in the user input widget.

Simplify Feature
----------------

The |mActionSimplify| :sup:`Simplify Feature` tool allows you to reduce the
number of vertices of a feature, as long as the geometry doesn't change. With the
tool you can also simplify multi-part features.
First, drag a rectangle over the feature. The vertices will be highlighted in red while the color of the
feature will change and a dialog where you can define a tolerance in map units or pixels
will appear. |qg| calculates the amount of vertices that can be deleted while maintaining the
geometry using the given tolerance. The higher the tolerance is the more vertices can be deleted. After
gaining the statistics about the simplification just klick the :guilabel:`OK` button.
The tolerance you used will be saved when leaving a project or when leaving an edit session.
So you can go back to the same tolerance the next time when simplifying a feature.

Add Ring
--------

You can create :index:`ring polygons` using the |mActionAddRing|
:sup:`Add Ring` icon in the toolbar. This means that inside an existing area, it
is possible to digitize further polygons that will occur as a 'hole', so
only the area between the boundaries of the outer and inner polygons remains
as a ring polygon.

Add Part
--------

You can |mActionAddPart| :sup:`add part` polygons to a selected
:index:`multipolygon`. The new part polygon must be digitized outside
the selected multi-polygon.

Fill Ring
---------

You can use the |mActionFillRing| :sup:`Fill Ring` function to add a ring to
a polygon and add a new feature to the layer at the same time. Thus you need not
first use the |mActionAddRing| :sup:`Add Ring` icon and then the
|mActionCapturePolygon| :sup:`Add feature` function anymore.

Delete Ring
------------

The |mActionDeleteRing| :sup:`Delete Ring` tool allows you to delete ring polygons
inside an existing area. This tool only works with polygon layers. It doesn't
change anything when it is used on the outer ring of the polygon. This tool
can be used on polygon and multi-polygon features. Before you select the
vertices of a ring, adjust the vertex edit tolerance.

Delete Part
-----------

The |mActionDeletePart| :sup:`Delete Part` tool allows you to delete parts from
multifeatures (e.g., to delete polygons from a multi-polygon feature). It won't
delete the last part of the feature; this last part will stay untouched. This
tool works with all multi-part geometries: point, line and polygon. Before you
select the vertices of a part, adjust the vertex edit tolerance.

Reshape Features
----------------

You can reshape line and polygon features using the |mActionReshape|
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
-------------

The |mActionOffsetCurve| :sup:`Offset Curve` tool creates parallel shifts of line layers.
The tool can be applied to the edited layer (the geometries are modified)
or also to background layers (in which case it creates copies of the lines / rings and adds them to the the edited layer).
It is thus ideally suited for the creation of distance line layers. The displacement is
shown at the bottom left of the taskbar.

To create a shift of a line layer, you must first go into editing mode and activate the
|mActionOffsetCurve| :sup:`Offset Curve` tool. Then click on a feature to shift it.
Move the mouse and click where wanted or enter the desired distance in the user input widget. Your changes may then be saved with the|mActionSaveEdits|:sup:`Save Layer Edits` tool.

|qg| options dialog (Digitizing tab then **Curve offset tools** section) allows
you to configure some parameters like **Join style**, **Quadrant segments**,
**Miter limit**.

.. index:: Split_Features

Split Features
--------------

You can split features using the |mActionSplitFeatures| :sup:`Split Features`
icon on the toolbar. Just draw a line across the feature you want to split.

.. index:: Merge_Selected_Features

Split parts
-----------

In |qg| 2.0 it is now possible to split the parts of a multi part feature so that the
number of parts is increased. Just draw a line across the part you want to split using
the |mActionSplitParts| :sup:`Split Parts` icon.

Merge selected features
-----------------------

The |mActionMergeFeatures| :sup:`Merge Selected Features` tool allows you to merge
features. A new dialog will allow you to choose which value to choose between each 
selected features or select a function (Minimum, Maximum, Median, Sum, Skip 
Attribute) to use for each column. If features don't have a common boundaries, 
a multipolygon will be created.

.. index:: Merge_Attributes_of_Selected_Features

Merge attributes of selected features
-------------------------------------

The |mActionMergeFeatAttributes| :sup:`Merge Attributes of Selected Features` tool
allows you to :index:`merge attributes of features` with common boundaries and
attributes without merging their boundaries.
First, select several features at once. Then
press the |mActionMergeFeatAttributes| :sup:`Merge Attributes of Selected Features` button.
Now |qg| asks you which attributes are to be applied to all selected objects.
As a result, all selected objects have the same attribute entries.

.. index:: Rotate_Point_symbols

Rotate Point Symbols
--------------------

.. % FIXME change, if support in new symbology is available, too

|mActionRotatePointSymbols| :sup:`Rotate Point Symbols` allows you to change the rotation
of point symbols in the map canvas. You must first define a rotation column
from the attribute table of the point layer in the :guilabel:`Advanced` menu of the
:guilabel:`Layer Properties --> Style` menu. Also, you will need to
go into the 'SVG marker' and choose :guilabel:`Data defined properties ...`.
Activate |checkbox| :guilabel:`Angle` and choose 'rotation' as field.
Without these settings, the tool is inactive.

.. _figure_edit_3:

.. only:: html

   **Figure Edit 3:**

.. figure:: /static/user_manual/working_with_vector/rotatepointsymbol.png
   :align: center

   Rotate Point Symbols |nix|

To change the rotation, select a point feature in the map canvas and rotate
it, holding the left mouse button pressed. A red arrow with the rotation value
will be visualized (see Figure_edit_3_). When you release the left mouse
button again, the value will be updated in the attribute table.

.. note::
   If you hold the :kbd:`Ctrl` key pressed, the rotation will be done in 15
   degree steps.

The Advanced Digitizing panel
=============================

When capturing new geometries or geometry parts you also have the possibility
to use the Advanced Digitizing panel. You can digitize lines exactly parallel
or at a specific angle or lock lines to specific angles.
Furthermore you can enter coordinates directly so that you can make a precise 
definition for your new geometry.

The tools are not enabled if the map view is in geographic coordinates.

.. _figure_advanced_edit_1:

.. only:: html

   **Figure Advanced Edit 1:**

.. figure:: /static/user_manual/working_with_vector/advanced_digitizing.png
   :align: center

   The Advanced Digitizing panel |nix|


