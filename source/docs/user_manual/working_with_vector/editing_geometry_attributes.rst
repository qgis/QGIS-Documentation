.. only:: html

   |updatedisclaimer|

.. _editingvector:

*********
 Editing
*********

.. only:: html

   .. contents::
      :local:

QGIS supports various capabilities for editing OGR,
SpatiaLite, PostGIS, MSSQL Spatial and Oracle Spatial vector layers and tables.

.. note::
   The procedure for editing GRASS layers is different - see section
   :ref:`grass_digitizing` for details.

.. _tip_concurrent_edits:

.. tip:: **Concurrent Edits**

   This version of QGIS does not track if somebody else is editing the same feature
   at the same time as you are. The last person to save its edits wins.


.. index:: Snapping
   single: Digitizing; Snapping

.. _`snapping_tolerance`:

Setting the Snapping Tolerance and Search Radius
================================================

For an optimal and accurate edit of the vector layer geometries, we need to set
an appropriate value of snapping tolerance and search radius for features vertices.


.. index:: Snapping tolerance

Snapping tolerance
------------------

Snapping tolerance is the distance QGIS uses to ``search`` for the closest
vertex and/or segment you are trying to connect to when you set a new vertex or
move an existing vertex. If you aren't within the snapping tolerance, QGIS
will leave the vertex where you release the mouse button, instead of snapping
it to an existing vertex and/or segment.
The snapping tolerance setting affects all tools that work with tolerance.

#. A general, project-wide snapping tolerance can be defined by choosing
   :menuselection:`Settings -->` |options| :menuselection:`Options...`,
   :guilabel:`Digitizing` tab.
   You can select between 'To vertex', 'To segment' or 'To vertex and segment'
   as default snap mode. You can also define a default snapping tolerance and
   a search radius for vertex edits. The tolerance can be set either in map
   units or in pixels. The advantage of choosing pixels is that the snapping
   tolerance doesn't have to be changed after zoom operations. In our small
   digitizing project (working with the Alaska dataset), we define the
   snapping units in feet. Your results may vary, but something on the order
   of 300 ft at a scale of 1:10000 should be a reasonable setting.
#. A layer-based snapping tolerance that overrides the global snapping options
   can be defined by choosing :menuselection:`Settings --> Snapping options`.
   It enables and adjusts snapping mode
   and tolerance on a layer basis (see figure_edit_snapping_ ). This dialog offers
   three different modes to select the layer(s) to snap to:

   * :guilabel:`Current layer`: only the active layer is used, a convenient way
     to ensure topology within the layer being edited
   * :guilabel:`All layers`: a quick and simple setting for all visible layers
     in the project so that the pointer snaps to all vertices and/or segments.
     In most cases it is sufficient to use this snapping mode.
   * :guilabel:`Advanced`: if you need to edit a layer and snap its vertices to another
     layer, ensure the target layer is checked and increase the snapping tolerance
     to a greater value. Furthermore, snapping will never occur to a layer that
     is not checked in the snapping options dialog, regardless of the global
     snapping tolerance. So be sure to mark the checkbox for those layers that
     you need to snap to.


.. _figure_edit_snapping:

.. figure:: /static/user_manual/working_with_vector/editProjectSnapping.png
   :align: center

   Edit snapping options on a layer basis (Advanced mode)

.. tip:: **Control the list of layers to snap**

   The :guilabel:`Snapping Options` dialog is by default populated with parameters
   (mode, tolerance, units) set in the global :guilabel:`Digitizing` tab.
   To avoid layers being checked by default in the **Advanced** mode and hence
   set snappable, define the :guilabel:`Default Snap mode` to ``Off``.

Snapping tolerance can be set in ``pixels`` or ``map units`` (the units of the
map view). While in the **Advanced** layer selection mode, it is possible to use
a snapping tolerance that refers to ``layer units``, the units of the reprojected
layer when 'on-the-fly' CRS transformation is on.


.. index:: Search radius

Search radius
--------------

Search radius is the distance QGIS uses to ``search`` for the closest vertex
you are trying to select when you click on the map. If you aren't within the
search radius, QGIS won't find and select any vertex for editing.
Snap tolerance and search radius are set in map units or pixels, so you may
find you need to experiment to get them set right. If you specify too big of
a tolerance, QGIS may snap to the wrong vertex, especially if you are dealing
with a large number of vertices in close proximity. Set search radius too
small, and it won't find anything to move.

The search radius for vertex edits in layer units can be defined in the
:guilabel:`Digitizing` tab under :menuselection:`Settings -->` |options|
:menuselection:`Options`. This is the same place where you define the general,
project-wide snapping tolerance.


.. index:: Topological editing
   single: Digitizing; Topology

Topological editing
===================

Besides layer-based snapping options, you can also define topological
functionalities in the :guilabel:`Snapping options...` dialog in the
:menuselection:`Settings` (or :menuselection:`File`) menu. Here, you can
define |checkbox| :guilabel:`Enable topological editing`, and/or for polygon
layers, activate the |checkbox| :guilabel:`Avoid Intersections` option.


.. index:: Shared polygon boundaries
   seealso: Shared polygon boundaries; Topology

Enable topological editing
--------------------------

The option |checkbox| :guilabel:`Enable topological editing` is for editing
and maintaining common boundaries in features mosaics. QGIS 'detects'
shared boundary by the features, so you only have to move a common vertex/segment
once, and QGIS will take care of updating the neighboring features.

.. index:: Avoid intersections
   seealso: Avoid intersections; Topology

Avoid intersections of new polygons
-----------------------------------

A second topological option called |checkbox| :guilabel:`Avoid intersections`
prevents you to draw new features that overlap an existing one.
It is for quicker digitizing of adjacent
polygons. If you already have one polygon, it is possible with this option
to digitize the second one such that both intersect, and QGIS then cuts the
second polygon to the boundary of the existing one. The advantage is that you
don't have to digitize all vertices of the common boundary.

.. note:: If the new geometry is totally covered by existing ones, it gets cleared
   and the new feature will have no geometry when allowed by the provider, otherwise
   saving modifications will make QGIS pop-up an error message.

.. warning:: **Use cautiously the** :guilabel:`Avoid Intersections` **option**

   Because the option cuts or clears geometry of any overlaping feature from
   any polygon layer, do not forget to uncheck this option once you no longer
   need it otherwise, you can get unexpected geometries.


.. index:: Snapping on intersections

Enable snapping on intersections
---------------------------------

Another option is to use |checkbox| :guilabel:`Enable snapping on intersection`.
It allows you to snap on an intersection of background layers, even if there's no vertex on
the intersection.

Geometry Checker
-----------------

A core plugin can help the user to find the geometry invalidity. You can find
more information on this plugin at :ref:`geometry_checker`.

.. index:: Digitizing, Digitizing tools
   see: Editing; Digitizing
   seealso: Digitizing; Attribute table

.. _sec_edit_existing_layer:

Digitizing an existing layer
============================

By default, QGIS loads layers read-only. This is a safeguard to avoid
accidentally editing a layer if there is a slip of the mouse.
However, you can choose to edit any layer as long as the data provider
supports it (see :ref:`supported_format`), and the underlying data source is writable
(i.e., its files are not read-only).

.. tip:: **Restrict edit permission on layers within a project**

   From the :menuselection:`Project --> Project properties --> Identify` tab,
   You can choose to set any layer read-only regardless the provider permission.
   This can be a handy way, in a multi-users environment to avoid unauthorized users
   to mistakenly edit layers (e.g., shapefile), hence potentially corrupt data.
   Note that this setting only applies inside the current project.


In general, tools for editing vector layers are divided into a digitizing and an advanced
digitizing toolbar, described in section :ref:`sec_advanced_edit`. You can
select and unselect both under :menuselection:`View --> Toolbars -->`.
Using the basic digitizing tools, you can perform the following functions:


.. _table_editing:

+------------------------------+-----------------------------------+--------------------------+----------------------------------+
| Icon                         | Purpose                           | Icon                     | Purpose                          |
+==============================+===================================+==========================+==================================+
| |allEdits|                   | Current edits                     | |toggleEditing|          | Toggle editing                   |
+------------------------------+-----------------------------------+--------------------------+----------------------------------+
| |capturePoint|               | Add Feature: Capture Point        | |captureLine|            | Add Feature: Capture Line        |
+------------------------------+-----------------------------------+--------------------------+----------------------------------+
| |capturePolygon|             | Add Feature: Capture Polygon      | |moveFeature|            | Move Feature                     |
+------------------------------+-----------------------------------+--------------------------+----------------------------------+
| |circularStringCurvePoint|   | Add Circular String               | |circularStringRadius|   | Add Circular String By Radius    |
+------------------------------+-----------------------------------+--------------------------+----------------------------------+
| |nodeTool|                   | Node Tool                         | |deleteSelected|         | Delete Selected                  |
+------------------------------+-----------------------------------+--------------------------+----------------------------------+
| |editCut|                    | Cut Features                      | |editCopy|               | Copy Features                    |
+------------------------------+-----------------------------------+--------------------------+----------------------------------+
| |editPaste|                  | Paste Features                    | |saveEdits|              | Save layer edits                 |
+------------------------------+-----------------------------------+--------------------------+----------------------------------+

Table Editing: Vector layer basic editing toolbar

Note that while using any of the digitizing tools, you can still :ref:`zoom or pan
<zoom_pan>` in the map canvas without losing the focus on the tool.

All editing sessions start by choosing the |toggleEditing| :sup:`Toggle editing`
option found in the context menu of a given layer, from the attribute table dialog, the
digitizing toolbar or the :menuselection:`Edit` menu.

Once the layer is in edit mode, additional tool buttons on the editing toolbar
will become available and markers will appear at the vertices of all features
unless :guilabel:`Show markers only for selected features` option under
:menuselection:`Settings --> Options... --> Digitizing` menu is checked.

.. _tip_save_regularly:

.. tip:: **Save Regularly**

   Remember to |saveEdits| :sup:`Save Layer Edits` regularly. This will also
   check that your data source can accept all the changes.

.. index:: Adding features

Adding Features
---------------

You can use the |capturePoint| :sup:`Add Feature`,
|captureLine| :sup:`Add Feature` or |capturePolygon|
:sup:`Add Feature` icons on the toolbar to add new feature (point, line and
polygon) into the current layer.

The next buttons |circularStringCurvePoint| :sup:`Add circular string` or
|circularStringRadius| :sup:`Add circular string by radius` allow users to add
line or polygon features with a circular geometry.

To create features with these tools, you first digitize the geometry
then enter its attributes.
To digitize the geometry, left-click on the map area to create the first
point of your new feature.

For linear or curved geometries, keep on left-clicking for each additional
point you wish to capture or use :ref:`automatic tracing <tracing>` capability
to accelerate the digitization. You can switch back and forth between linear
:guilabel:`Add feature` tool and curved :guilabel:`Add circular string...` tools
to create compound curved geometry. Pressing :kbd:`Delete` or :kbd:`Backspace` key
reverts the last node you add. When you have finished adding points, right-click
anywhere on the map area to confirm you have finished entering the geometry of
that feature.

.. note:: **Curved geometries are stored as such only in compatible data provider**

   Although QGIS allows to digitize curved geometries within any editable
   data format, you need to be using a data provider (e.g. PostGIS, GML or WFS)
   that supports curves to have features stored as curved, otherwise QGIS
   segmentizes the circular arcs. The memory layer provider also supports curves.

.. index:: Rubber band

.. tip:: **Customize the digitizing rubber band**

   While capturing polygon, the by-default red rubber band can hide underlying
   features or places you'd like to capture a point. This can be fixed by setting
   a lower opacity (or alpha channel) to the rubber band's :guilabel:`Fill Color`
   in :menuselection:`Settings --> Options --> Digitizing` menu.
   You can also avoid the use of the rubber band by checking :guilabel:`Don't
   update rubber band during node editing`.

The attribute window will appear, allowing you to enter the information for
the new feature. Figure_edit_values_ shows setting attributes for a fictitious new
river in Alaska. However, in the :guilabel:`Digitizing` menu under the
:menuselection:`Settings --> Options` menu, you can also activate:

* |checkbox| :guilabel:`Suppress attributes pop-up windows after each created
  feature` to avoid the form opening
* or |checkbox| :guilabel:`Reuse last entered attribute values` to have fields
  automatically filled at the opening of the form and just have to type changing values.

.. _figure_edit_values:

.. figure:: /static/user_manual/working_with_vector/editDigitizing.png
   :align: center

   Enter Attribute Values Dialog after digitizing a new vector feature

With the |moveFeature| :sup:`Move Feature(s)` icon on the toolbar, you can
move existing features.


.. index:: Node tool

Node Tool
---------

For shapefile-based or MapInfo layers as well as SpatiaLite, PostgreSQL/PostGIS,
MSSQL Spatial, and Oracle Spatial tables, the
|nodeTool| :sup:`Node Tool` provides manipulation capabilities of
feature vertices similar to CAD programs. It is possible to simply select
multiple vertices at once and to move, add or delete them altogether.
The node tool also works with 'on the fly' projection turned on and supports
the topological editing feature. This tool is, unlike other tools in
QGIS, persistent, so when some operation is done, selection stays
active for this feature and tool.

It is important to set the property :menuselection:`Settings -->` |options|
:menuselection:`Options --> Digitizing -->` :guilabel:`Search Radius:`
|selectNumber| to a number greater than zero. Otherwise, QGIS will
not be able to tell which vertex is being edited and will display a warning.

.. _tip_vertex_markers:

.. tip:: **Vertex Markers**

   The current version of QGIS supports three kinds of vertex markers:
   'Semi-transparent circle', 'Cross' and 'None'. To change the marker style,
   choose |options| :menuselection:`Options` from the
   :menuselection:`Settings` menu, click on the :guilabel:`Digitizing`
   tab and select the appropriate entry.

Basic operations
................

.. index:: Nodes, Vertices, Vertex, Geometryless feature

Start by activating the |nodeTool| :sup:`Node Tool` and selecting a
feature by clicking on it. Red boxes will appear at each vertex of this feature.


* **Selecting vertices**: You can select vertices by clicking on them one
  at a time, by clicking on an edge to select the vertices at both ends, or
  by clicking and dragging a rectangle around some vertices. When a vertex
  is selected, its color changes to blue. To add more vertices to the current
  selection, hold down the :kbd:`Ctrl` key while clicking. Hold down
  :kbd:`Ctrl` when clicking to toggle the selection state of
  vertices (vertices that are currently unselected will be selected as usual,
  but also vertices that are already selected will become unselected).
* **Adding vertices**: To add a vertex, simply double click near an edge and
  a new vertex will appear on the edge near to the cursor. Note that the
  vertex will appear on the edge, not at the cursor position; therefore, it
  should be moved if necessary.
* **Deleting vertices**: Select the vertices and click the
  :kbd:`Delete` key. Deleting all the vertices of a feature generates, if
  compatible with the datasource, a geometryless feature. Note that
  this doesn't delete the complete feature, just the geometry part;
  To delete a complete feature use the |deleteSelected| :sup:`Delete Selected` tool.
* **Moving vertices**: Select all the vertices you want to move, click on
  a selected vertex or edge and drag in the direction you wish to move. All
  the selected vertices will move together. If snapping is enabled, the whole
  selection can jump to the nearest vertex or line.

Each change made with the node tool is stored as a separate entry in the
:guilabel:`Undo` dialog. Remember that all operations support topological editing when
this is turned on. On-the-fly projection is also supported, and the node
tool provides tooltips to identify a vertex by hovering the pointer over it.

.. _move_all_vertex:

.. tip:: **Move features with precision**

   The |moveFeature| :guilabel:`Move Feature` tool doesn't currently allow to
   snap features while moving. Using the |nodeTool| :sup:`Node Tool`, select ALL
   the vertices of the feature, click a vertex, drag and snap it to a target vertex:
   the whole feature is moved and snapped to the other feature.

.. index:: Vertex editor

The Vertex Editor
..................

With activating the :guilabel:`Node Tool` on a feature, QGIS opens the
:guilabel:`Vertex Editor` panel listing all the vertices of the feature with
their x, y (z, m if applicable) coordinates and r (for the radius, in case of
circular geometry). Simply select a row in the table does select the corresponding
vertex in the map canvas, and vice versa. Simply change a coordinate in the table
and your vertex position is updated. You can also select multiple rows and delete
them altogether.

.. _figure_edit_vertex:

.. figure:: /static/user_manual/working_with_vector/vertex_editor_panel.png
   :align: center

   Vertex editor panel showing selected nodes


Cutting, Copying and Pasting Features
-------------------------------------

Selected features can be cut, copied and pasted between layers in the same
QGIS project, as long as destination layers are set to |toggleEditing|
:sup:`Toggle editing` beforehand.

.. index:: Polygon to line, Line to polygon

.. _tip_polygon_to_line:

.. tip:: **Transform polygon into line and vice-versa using copy/paste**

   Copy a line feature and paste it in a polygon layer: QGIS pastes in the target
   layer a polygon whose boundary corresponds to the closed geometry of the line
   feature. This is a quick way to generate different geometries of the same data.

.. index:: CSV, WKT

Features can also be pasted to external applications as text. That is, the
features are represented in CSV format, with the geometry data appearing in
the OGC Well-Known Text (WKT) format. WKT features from outside QGIS can also be
pasted to a layer within QGIS.

When would the copy and paste function come
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
#. Use the |selectRectangle| :sup:`Select Features by area or single click`
   tool to select the feature(s) on the source layer
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

.. note:: **Congruency of Pasted Features**

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
--------------------------

If we want to delete an entire feature (attribute and geometry), we can do that
by first selecting the geometry using the regular |selectRectangle| :sup:`Select
Features by area or single click` tool. Selection can also be done from the attribute
table. Once you have the selection set, press :kbd:`Delete` or :kbd:`Backspace`
key or use the |deleteSelected| :sup:`Delete Selected` tool to delete the
features. Multiple selected features can be deleted at once.

The |editCut| :sup:`Cut Features` tool on the digitizing toolbar can
also be used to delete features. This effectively deletes the feature but
also places it on a "spatial clipboard". So, we cut the feature to delete.
We could then use the |editPaste| :sup:`Paste Features` tool to put it back,
giving us a one-level undo capability. Cut, copy, and paste work on the
currently selected features, meaning we can operate on more than one at a time.

Saving Edited Layers
--------------------

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

.. index:: Current edits

Saving multiple layers at once
...............................

This feature allows the digitization of multiple layers. Choose
|fileSaveAs| :guilabel:`Save for Selected Layers` to save all changes you
made in multiple layers. You also have the opportunity to
|rollbackEdits| :guilabel:`Rollback for Selected Layers`, so that the
digitization may be withdrawn for all selected layers.
If you want to stop editing the selected layers, |cancelEdits| :guilabel:`Cancel
for Selected Layer(s)` is an easy way.

The same functions are available for editing all layers of the project.

.. tip:: **Use transaction group to edit, save or rollback multiple layers changes at once**

   When working with layers from the same PostGreSQL database, activate the
   :guilabel:`Automatically create transaction groups where possible` option in
   :menuselection:`Project --> Project Properties --> Data Sources` to sync their
   behavior (enter or exit the edit mode, save or rollback changes at the same time).

.. _sec_advanced_edit:

Advanced digitizing
===================

.. following provides space between header and table!!

\

\

.. _table_advanced_editing:

+---------------------------+-----------------------------------------+------------------------+-------------------------+
| Icon                      | Purpose                                 | Icon                   | Purpose                 |
+===========================+=========================================+========================+=========================+
| |cad|                     | Enable Advanced Digitizing Tools        | |tracing|              | Enable Tracing          |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |undo|                    | Undo                                    | |redo|                 | Redo                    |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |rotateFeature|           | Rotate Feature(s)                       | |simplifyFeatures|     | Simplify Feature        |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |addRing|                 | Add Ring                                | |addPart|              | Add Part                |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |fillRing|                | Fill Ring                               |                        |                         |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |deleteRing|              | Delete Ring                             | |deletePart|           | Delete Part             |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |offsetCurve|             | Offset Curve                            | |reshape|              | Reshape Features        |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |splitParts|              | Split Parts                             | |splitFeatures|        | Split Features          |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |mergeFeatAttributes|     | Merge Attributes of Selected Features   | |mergeFeatures|        | Merge Selected Features |
+---------------------------+-----------------------------------------+------------------------+-------------------------+
| |rotatePointSymbols|      | Rotate Point Symbols                    | |offsetPointSymbols|   | Offset Point Symbols    |
+---------------------------+-----------------------------------------+------------------------+-------------------------+

Table Advanced Editing: Vector layer advanced editing toolbar


.. index::
   single: Digitizing tools; Undo
   single: Digitizing tools; Redo

Undo and Redo
-------------

The |undo| :sup:`Undo` and |redo| :sup:`Redo` tools allows you
to undo or redo vector editing operations. There is also a dockable
widget, which shows all operations in the undo/redo history (see
Figure_edit_undo_). This widget is not displayed by default; it can be
displayed by right clicking on the toolbar and activating the Undo/Redo
checkbox. Undo/Redo is however active, even if the widget is not displayed.

.. _figure_edit_undo:

.. figure:: /static/user_manual/working_with_vector/redo_undo.png
   :align: center

   Redo and Undo digitizing steps

When Undo is hit or :kbd:`Ctrl+Z` (or :kbd:`Cmd+Z`) pressed, the state of all
features and attributes are reverted to
the state before the reverted operation happened. Changes other than normal
vector editing operations (for example, changes done by a plugin) may or may
not be reverted, depending on how the changes were performed.

To use the undo/redo history widget, simply click to select an operation in
the history list. All features will be reverted to the state they were in
after the selected operation.


.. index::
   single: Digitizing tools; Rotate Feature
.. _rotate_feature:

Rotate Feature(s)
-----------------

Use |rotateFeature| :sup:`Rotate Feature(s)` to rotate one or multiple features
in the map canvas. Press the |rotateFeature| :sup:`Rotate Feature(s)` icon and then
click on the feature to rotate. Either click on the map to place the rotated feature or
enter an angle in the user input widget. If you want to rotate several features,
they shall be selected first.

If you enable the map tool with feature(s) selected, its (their) centroid appears
and will be the rotation anchor point. If you want to move the anchor point,
hold the :kbd:`Ctrl` button  and click on the map to place it.

If you hold :kbd:`Shift` before clicking on the map, the rotation will be done
in 45 degree steps, which can be modified afterwards in the user input widget.

To abort feature rotation, you need to click on |rotateFeature| :sup:`Rotate
Feature(s)` icon.

.. index::
   single: Digitizing tools; Simplify Feature

Simplify Feature
----------------

The |simplifyFeatures| :sup:`Simplify Feature` tool allows you to reduce the
number of vertices of a feature, as long as the geometry remains valid. With the
tool you can also simplify many features at once or multi-part features.

First, click on the feature or drag a rectangle over the features. A dialog where
you can define a tolerance in ``map units``, ``layer units`` or ``pixels`` pops up
and a colored and simplified copy of the feature(s), using the given tolerance,
appears over them. QGIS calculates the amount of vertices that can be deleted
while maintaining the geometry.
The higher the tolerance is the more vertices can be deleted. When the expected
geometry fits your needs just click the **[OK]** button.
The tolerance you used will be saved when leaving a project or when leaving an edit session.
So you can go back to the same tolerance the next time when simplifying a feature.

To abort feature simplification, you need to click on |simplifyFeatures|
:sup:`Simplify Feature` icon.

.. note:: Unlike the feature simplification option in :menuselection:`Settings -->
   Options --> Rendering` menu which simplifies the geometry just for rendering,
   the |simplifyFeatures| :sup:`Simplify Feature` tool permanently modifies
   feature's geometry in data source.


.. index:: Geometryless feature, Multipoint, Multiline, Multipolygon
   single: Digitizing tools; Add Part

Add Part
--------

You can |addPart| :sup:`Add Part` to a selected feature generating a
multipoint, multiline or multipolygon feature. The new part must be digitized
outside the existing one which should be selected beforehand.

The |addPart| :sup:`Add Part` can also be used to add a geometry to a geometryless
feature. First, select the feature in the attribute table and digitize the new
geometry with the |addPart| :sup:`Add Part` tool.


.. index::
   single: Digitizing tools; Delete Part

Delete Part
-----------

The |deletePart| :sup:`Delete Part` tool allows you to delete parts from
multifeatures (e.g., to delete polygons from a multi-polygon feature). This
tool works with all multi-part geometries: point, line and polygon. Furthermore,
it can be used to totally remove the geometric component of a feature.
To delete a part, simply click within the target part.


.. index::
   single: Digitizing tools; Add Ring

Add Ring
--------

You can create ring polygons using the |addRing|
:sup:`Add Ring` icon in the toolbar. This means that inside an existing area, it
is possible to digitize further polygons that will occur as a 'hole', so
only the area between the boundaries of the outer and inner polygons remains
as a ring polygon.

.. FixMe: I think this tool should behave as below
.. Like many digitizing tools, the |addRing| :sup:`Add Ring` tool adds ring to all
.. selected features if any, otherwise all overlapping features are pierced.


.. index::
   single: Digitizing tools; Fill Ring

Fill Ring
---------

You can use the |fillRing| :sup:`Fill Ring` function to add a ring to
a polygon and add a new feature to the layer at the same time. Using this tool,
you simply have to digitize a polygon within an existing one. Thus you need not
first use the |addRing| :sup:`Add Ring` icon and then the
|capturePolygon| :sup:`Add feature` function anymore.


.. index::
   single: Digitizing tools; Delete Ring

Delete Ring
-----------

The |deleteRing| :sup:`Delete Ring` tool allows you to delete rings within
an existing polygon, by clicking inside the hole. This tool only works with
polygon and multi-polygon features. It doesn't
change anything when it is used on the outer ring of the polygon.

.. index::
   single: Digitizing tools; Reshape Feature
   single: Digitizing tools; Extend lines

Reshape Features
----------------

You can reshape line and polygon features using the |reshape|
:sup:`Reshape Features` tool on the toolbar. For lines, it replaces the line
part from the first to the last intersection with the original line. The
|reshape| :sup:`Reshape Features` tool also helps you extend linestring
geometries: simply begin or end the reshape line at either the first or last
point of the existing line.

.. _figure_reshape_line:

.. figure:: /static/user_manual/working_with_vector/reshape_lines.png
   :align: center

   Reshape line

For polygons, it will reshape the polygon's boundary. For it to work, the
reshape tool's line must cross the polygon's boundary at least twice. To draw
the line, click on the map canvas to add vertexes. To finish it, just
right-click. Like with the lines, only the segment between the first and the
last intersections is considered. The reshape line's segments that are inside
the polygon will result in cropping it, where the ones outside the polygon will
extend it.

.. _figure_reshape_polygon:

.. figure:: /static/user_manual/working_with_vector/reshape_polygon.png
   :align: center

   Reshape polygon

With polygons, reshaping can sometimes lead to unintended results. It is mainly useful
to replace smaller parts of a polygon, not for major overhauls, and the reshape
line is not allowed to cross several polygon rings, as this would generate an
invalid polygon.

.. note::
   The reshape tool may alter the starting position of a polygon ring or a
   closed line. So, the point that is represented 'twice' will not be the same
   any more. This may not be a problem for most applications, but it is
   something to consider.


.. index::
   single: Digitizing tools; Offset Curves

Offset Curves
-------------

The |offsetCurve| :sup:`Offset Curve` tool creates parallel shifts of line layers.
The tool can be applied to the edited layer (the geometries are modified)
or also to background layers (in which case it creates copies of the lines /
rings and adds them to the edited layer).
It is thus ideally suited for the creation of distance line layers.
The :guilabel:`User Input` dialog pops-up, showing the displacement distance.

To create a shift of a line layer, you must first go into editing mode and activate the
|offsetCurve| :sup:`Offset Curve` tool. Then click on a feature to shift it.
Move the mouse and click where wanted or enter the desired distance in the user
input widget. Your changes may then be saved with the |saveEdits| :sup:`Save Layer Edits` tool.

QGIS options dialog (Digitizing tab then **Curve offset tools** section) allows
you to configure some parameters like **Join style**, **Quadrant segments**,
**Miter limit**.


.. index::
   single: Digitizing tools; Split Features

Split Features
--------------

You can split features using the |splitFeatures| :sup:`Split Features`
icon on the toolbar. Just draw a line across the feature you want to split.


.. index::
   single: Digitizing tools; Split Parts

Split parts
-----------

In QGIS it is possible to split the parts of a multi part feature so that the
number of parts is increased. Just draw a line across the part you want to split using
the |splitParts| :sup:`Split Parts` icon.

.. tip:: **Split a polyline feature in one-click**

   A single click on a **snapped vertex** of a line feature with the |splitFeatures|
   :sup:`Split Features` or |splitParts| :sup:`Split Parts` tool is enough to have it
   split into new features or parts.


.. index::
   single: Digitizing tools; Merge Selected Features

Merge selected features
-----------------------

The |mergeFeatures| :sup:`Merge Selected Features` tool allows you to create
a new feature by merging existing ones: their geometries are merged to generate
a new one. If features don't have common boundaries,
a multipolygon/multipolyline/multipoint feature is created.

First, select several features. Then press the |mergeFeatures| :sup:`Merge Selected
Features` button. In the new dialog, you can select at the top of the dialog which value to
apply to each field of the new feature. That value can be:

* picked from the attributes of the initial features,
* an aggregation of the initial features attributes (Minimum, Maximum, Median, Sum, Count
  Concatenation... depending on the type of the field. see :ref:`statistical_summary`
  for the full list of functions),
* skipped, meaning that the field will be empty,
* or manually entered, at the bottom of the rows.


.. index::
   single: Digitizing tools; Merge Attributes

Merge attributes of selected features
-------------------------------------

The |mergeFeatAttributes| :sup:`Merge Attributes of Selected Features` tool
allows you to apply same attributes to features without merging their boundaries.
The dialog is the same as the ``Merge Selected Features`` tool's except that
unlike that tool, selected objects are kept with their geometry while some of their
attributes are made identical.


.. index::
   single: Digitizing tools; Rotate Point Symbols

Rotate Point Symbols
--------------------

The |rotatePointSymbols| :sup:`Rotate Point Symbols` allows you to change the rotation
of point symbols in the map canvas. First of all, you must apply to the symbol a
:ref:`data-defined <data_defined>` rotation: in the :menuselection:`Layer Properties
--> Style` dialog, click the |dataDefined| :guilabel:`Data-defined override` widget
near the :guilabel:`Rotation` option of the highest level (preferably) of the symbol
layers and choose a field in the :guilabel:`Field Type` combobox. Values of this
field are hence used to rotate each feature's symbol accordingly.

.. note::
   As a global option, setting the rotation field at the first level of the symbol
   applies it to all the underlying levels while setting it at a lower level will
   rotate only this symbol layer (unless you have a single symbol layer).


.. _figure_rotate_point:

.. figure:: /static/user_manual/working_with_vector/rotatepointsymbol.png
   :align: center

   Rotate Point Symbols

To change the rotation of a symbol, click on a point feature in the map canvas
with the |rotatePointSymbols| :sup:`Rotate Point Symbols` and move the mouse around,
holding the left button pressed. A red arrow with the rotation value
will be visualized (see Figure_rotate_point_). When you release the left mouse
button again, the symbol is defined with this new rotation and the rotation
field is updated in the layer's attribute table.

.. tip::
   If you hold the :kbd:`Ctrl` key pressed, the rotation will be done in 15
   degree steps.

.. index::
   single: Digitizing tools; Offset Point Symbols

Offset Point Symbols
--------------------

The |offsetPointSymbols| :sup:`Offset Point Symbols` allows you to interactively
change the rendered position of point symbols in the map canvas. This tool behaves
like the |rotatePointSymbols| :sup:`Rotate Point Symbols` tool except that it
requires you to connect a field to the data-defined :guilabel:`Offset (X,Y)`
property of the symbol, field which will then be populated with the offset
coordinates while moving the symbol in the map canvas.

.. note:: The |offsetPointSymbols| :sup:`Offset Point Symbols` tool doesn't
   move the point feature itself; you should use the |nodeTool| :sup:`Node Tool`
   or |moveFeature| :sup:`Move Feature` tool for this purpose.

.. warning:: **Ensure to assign the same field to all symbol layers**

   If at least two layers of the symbol have different fields assigned to their
   data-defined property (e.g. rotation), the corresponding tool will consider
   that no field is assigned to the symbol property and won't perform the action.

.. index::
   single: Digitizing tools; Automatic tracing

.. _tracing:

Automatic Tracing
-----------------

Usually, when using capturing map tools (add feature, add part, add ring, reshape
and split), you need to click each vertex of the feature.

Using the automatic tracing mode you can speed up the digitization process.
Enable the |tracing| :sup:`Tracing` tool by pushing the icon or pressing
:kbd:`t` key and :ref:`snap to <snapping_tolerance>` a vertex or segment of a
feature you want to trace along. Move the mouse over another vertex or segment
you'd like to snap and instead of an usual straight line, the digitizing rubber
band represents a path from the last point you snapped to the current position.
QGIS actually uses the underlying features topology to build the shortest path
between the two points. Click and QGIS places the intermediate vertices following
the path. You no longer need to manually place all the vertices during digitization.

Tracing requires snapping to be activated in traceable layers to build the path.
You should also snap to an existing vertex or segment while digitizing and ensure
that the two nodes are topologically connectable following existing features,
otherwise QGIS is unable to connect them and thus traces a single straight line.


.. note:: **Adjust map scale or snapping settings for an optimal tracing**

   If there are too many features in map display, tracing is disabled to avoid
   potentially long tracing structure preparation and large memory overhead.
   After zooming in or disabling some layers the tracing is enabled again.

.. tip:: **Quickly enable or disable automatic tracing by pressing** :kbd:`t` **key**

   By pressing :kbd:`t` key, tracing can be enabled/disabled anytime even while
   digitizing one feature, so it is possible to digitize some parts of the feature
   with tracing enabled and other parts with tracing disabled.
   Tools behave as usual when tracing is disabled.


.. index::
   single: Digitizing tools; Advanced panel
.. _advanced_digitizing_panel:

The Advanced Digitizing panel
=============================

When capturing, reshaping, splitting new or existing geometries you also have the
possibility to use the Advanced Digitizing panel. You can digitize lines exactly
parallel or perpendicular to a particular angle or lock lines to specific angles.
Furthermore, you can enter coordinates directly so that you can make a precise
definition of your new geometry.

.. _figure_advanced_digitizing:

.. figure:: /static/user_manual/working_with_vector/advanced_digitizing.png
   :align: center

   The Advanced Digitizing panel

.. note:: The tools are not enabled if the map view is in geographic coordinates.

The Advanced Digitizing panel can be open either with a right-click on the
toolbar and choose Advanced Digitizing panel or in :menuselection:`View -->
Panels --> Advanced Digitizing Panel`. Once the panel is visible, click the
|cad| :sup:`enable advanced digitizing tool` button to activate the Advanced
Digitizing tool.

Concepts
--------

The aim of the Advanced Digitizing tool is to lock coordinates, lengths, and angles
when moving the mouse during the digitalizing in the map canvas.

You can also create constraints with relative or absolute reference. Relative
reference means that the next vertex constraints' values will be relative to the
previous vertex or segment.

Snapping Settings
-----------------

Click the |settings| button to set the Advanced Digitizing Tool snapping settings.
You can make the tool snap to common angles. The options are:

- :guilabel:`Do not snap to common angles`
- :guilabel:`Snap to 30º angles`
- :guilabel:`Snap to 45º angles`
- :guilabel:`Snap to 90º angles`

You can also control the snapping to features. The options are:

- :guilabel:`Do not snap to vertices or segments`
- :guilabel:`Snap according to project configuration`
- :guilabel:`Snap to all layers`

Keyboard shortcuts
------------------

To speed up the use of Advanced Digitizing Panel, there are a couple of keyboard
shorcuts available:

+----------+-------------------+-------------------------------+---------------------------------------+
| Key      | Simple            | :kbd:`Ctrl +` or :kbd:`Alt +` | :kbd:`Shift +`                        |
+==========+===================+===============================+=======================================+
| :kbd:`d` | Set distance      | Lock distance                 | \                                     |
+----------+-------------------+-------------------------------+---------------------------------------+
| :kbd:`a` | Set angle         | Lock angle                    | Toggle relative angle to last segment |
+----------+-------------------+-------------------------------+---------------------------------------+
| :kbd:`x` | Set x coordinate  | Lock x coordinate             | Toggle relative x to last vertex      |
+----------+-------------------+-------------------------------+---------------------------------------+
| :kbd:`y` | Set y coordinate  | Lock y coordinate             | Toggle relative y to last vertex      |
+----------+-------------------+-------------------------------+---------------------------------------+
| :kbd:`c` | Toggle construction mode                                                                  |
+----------+-------------------------------------------------------------------------------------------+
| :kbd:`p` | Toggle perpendicular and parallel modes                                                   |
+----------+-------------------------------------------------------------------------------------------+

Absolute reference digitizing
-----------------------------

When drawing a new geometry from scratch, it is very useful to have the
possibility to start digitizing vertexes at given coordinates.

For example, to add a new feature to a polygonal layer, click the
|capturePolygon| button. You can choose the X and Y coordinates where you want
to start editing the feature, then:

- Click the :guilabel:`x` text box (or use the :kbd:`x` keyboard shortcuts).
- Enter the X coordinates values you want and press :kbd:`Enter` or click the
  |locked| button to their right to lock the mouse to the X axis on the map
  canvas.
- Click the :guilabel:`y` text box (or use the :kbd:`y` keyboard shortcuts).
- Enter the Y coordinates values you want and press :kbd:`Enter` or click the
  |locked| button to their right to lock the mouse to the Y axis on the map
  canvas.

Two blue dotted lines and a green cross identify the exact coordinates you
entered. Start digitizing by clicking on the map canvas; the mouse position is
locked at the green cross.

.. figure:: /static/user_manual/working_with_vector/advanced_digitizing_coordinates.png
   :align: center

   Start drawing at given coordinates

You can continue digitizing by free hand, adding a new pair of coordinates, or
you can enter the segment's **length** (distance) and **angle**.

If you want to draw a segment of a given length, click the :guilabel:`d
(distance)` text box (keyboard shortcut :kbd:`d`), enter the distance value (in
map units) and press :kbd:`Enter` or click the |locked| button on the right to
lock the mouse in the map canvas to the length of the segment:

.. figure:: /static/user_manual/working_with_vector/advanced_digitizing_distance.png
   :align: center

   Fixed length segment

In the map canvas, the clicked point is surrounded by a circle whose radius is
the value entered in the distance text box.

Finally, you can also choose the angle of the segment. As described before ,
click the :guilabel:`a (angle)` text box (keyboard shortcut :kbd:`a`), type the
angle value (in degrees), and press :kbd:`Enter` or click the |locked| buttons
on the right to lock it. In this way the segment will follow the desired angle:

.. figure:: /static/user_manual/working_with_vector/advanced_digitizing_angle.png
   :align: center

   Fixed angle segment

Relative reference digitizing
-----------------------------

Instead of using absolute values of angles or coordinates, you can also use
values relative to the last digitized vertex or segment.

For angles, you can click the |delta| button on the left of the :guilabel:`a`
text box (or press :kbd:`Shift + a`) to toggle relative angles to the previous
segment. With that option on, angles are measured between the last segment
and the mouse pointer.

For coordinates, click the |delta| buttons to the left of the :guilabel:`x` or
:guilabel:`y` text boxes (or press :kbd:`Shift + x` or :kbd:`Shift + y`) to
toggle relative coordinates to the previous vertex. With these options on,
coordinates measurement will consider the last vertex to be the x and y axes
origin.

Continuous lock
---------------

Both in absolute or relative reference digitizing, angle, distance, x and y
constraints can be locked continuously by clicking the |lockedRepeat|
:guilabel:`Continuous lock` buttons. Using continuous lock allows you to
digitize several points or vertexes using the same constraints.


Parallel and perpendiculars line
--------------------------------

All the tools described above can be combined with the |cadPerpendicular|
:sup:`Perpendicular` and |cadParallel| :sup:`Parallel` tools. These two tools
allow drawing segments perfectly perpendicular or parallel to another segment.

To draw a *perpendicular* segment, during the editing click the
|cadPerpendicular| :sup:`Perpendicular` icon (keyboard shortcut :kbd:`p`) to
activate it. Before drawing the perpendicular line,
click on the segment of an existing feature that you want to be perpendicular
to (the line of the existing feature will be colored in light orange); you
should see a blue dotted line where your feature will be snapped:

.. figure:: /static/user_manual/working_with_vector/advanced_digitizing_perpendicular.png
   :align: center

   Perpendicular digitizing

To draw a *parallel* feature, the steps are the same: click on the
|cadParallel| :sup:`Parallel` icon (keyboard shortcut :kbd:`p` twice), click on
the segment you want to use as reference and start drawing your feature:

.. figure:: /static/user_manual/working_with_vector/advanced_digitizing_parallel.png
   :align: center

   Parallel digitizing

These two tools just find the right angle of the perpendicular and
parallel angle and lock this parameter during your editing.

Construction mode
-----------------

You can enable and disable *construction* mode by clicking on the
|cadConstruction| :sup:`Construction` icon or with the :kbd:`c` keyboard
shortcut. While in construction mode, clicking the map canvas won't add new
vertexes, but will capture the clicks' positions so that you can use them as
reference points to then lock distance, angle or x and y relative values.

As an example, the construction mode can be used to draw some point
at an exact distance from a existing point.

With an existing point in the map canvas and the snapping mode correctly
   activated,
you can easily draw other points at given distances and angles from it.
In addition to the |cad| button, you have to activate also the *construction*
mode by clicking on the |cadConstruction| :sup:`Construction` icon or with the
:kbd:`c` keyboard shortcut.

Click next to the point from which you want to calculate the distance and click
on the *d* box (:kbd:`d` shortcut) enter the desired distance and hit Enter to
lock the mouse position in the map canvas:

.. figure:: /static/user_manual/working_with_vector/advanced_digitizing_distance_point.png
   :align: center

   Distance from point

Before adding the new point, you have to exit the construction mode, just click
:kbd:`c`. Now you can click on the map canvas and the point will be placed at
the distance entered:

.. figure:: /static/user_manual/working_with_vector/advanced_digitizing_distance_point_final.png
   :align: center

   Points at given distance


.. index:: Create new layers
.. index:: Shapefile, SpatiaLite, GPX

.. _sec_create_vector:

Creating new Vector layers
==========================

QGIS allows you to create new shapefile layers, new SpatiaLite layers, new
GPX layers and New Temporary Scratch Layers. Creation of a new GRASS layer
is supported within the GRASS plugin.
Please refer to section :ref:`creating_new_grass_vectors` for more information
on creating GRASS vector layers.

Creating a new Shapefile layer
------------------------------

To create a new shape layer for editing, choose :menuselection:`New -->`
|newVectorLayer| :menuselection:`New Shapefile Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New Vector Layer` dialog will be
displayed as shown in figure_create_shapefile_. Choose the type of layer
(point, line or polygon) and the CRS (coordinate reference system).

Note that QGIS does not yet support creation of 2.5D features (i.e., features
with X,Y,Z coordinates).

.. _figure_create_shapefile:

.. figure:: /static/user_manual/working_with_vector/editNewVector.png
   :align: center

   Creating a new Shapefile layer dialog

To complete the creation of the new shapefile layer, add the desired attributes
by clicking on the **[Add to attributes list]** button and specifying a name and
type for the attribute. A first 'id' column is added as default but can be
removed, if not wanted. Only :guilabel:`Type: real` |selectString|,
:guilabel:`Type: integer` |selectString|, :guilabel:`Type: string`
|selectString| and :guilabel:`Type:date` |selectString| attributes are
supported. Additionally and according to the attribute type, you can also define
the width and precision of the new attribute column. Once you are happy with the
attributes, click **[OK]** and provide a name for the shapefile. QGIS will
automatically add a :file:`.shp` extension to the name you specify. Once the
layer has been created, it will be added to the map, and you can edit it in the
same way as described in section :ref:`sec_edit_existing_layer` above.

.. index:: New SpatiaLite layer

.. _vector_create_spatialite:

Creating a new SpatiaLite layer
-------------------------------

To create a new SpatiaLite layer for editing, choose :menuselection:`New -->`
|newSpatiaLiteLayer| :menuselection:`New SpatiaLite Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New SpatiaLite Layer` dialog will
be displayed as shown in Figure_create_spatialite_.

.. _figure_create_spatialite:

.. figure:: /static/user_manual/working_with_vector/editNewSpatialite.png
   :align: center

   Creating a New SpatiaLite layer dialog

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

.. index:: New GPX layer
.. _vector_create_gpx:

Creating a new GPX layer
-------------------------

To create a new GPX file, you need to load the GPS plugin first. :menuselection:`Plugins -->`
|showPluginManager| :menuselection:`Plugin Manager...` opens the Plugin Manager Dialog.
Activate the |checkbox| :guilabel:`GPS Tools` checkbox.

When this plugin is loaded, choose :menuselection:`New -->` |createGPX|
:menuselection:`Create new GPX Layer...` from the :menuselection:`Layer` menu.
In the :guilabel:`Save new GPX file as` dialog, you can choose where to save the
new GPX layer.

.. index:: New Temporary Scratch layer
.. _vector_new_scratch_layer:

Creating a new Temporary Scratch Layer
--------------------------------------

Empty, editable memory layers can be defined using :menuselection:`Layer -->
Create Layer --> New Temporary Scratch Layer`. Here you can even create
|radioButtonOff|:guilabel:`Multipoint`, |radioButtonOff|:guilabel:`Multiline`
and |radioButtonOff|:guilabel:`Multipolygon` Layers beneath |radioButtonOn|:guilabel:`Point`,
|radioButtonOff|:guilabel:`Line` and |radioButtonOff|:guilabel:`Polygon` Layers.
Temporary Scratch Layers are not saved and will be discarded when QGIS is closed.
See also :ref:`paste_into_layer`.
