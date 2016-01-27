|updatedisclaimer|

***********************
 Snapping and Topology
***********************

.. index:: Snapping, Snapping_Tolerance

.. _`snapping_tolerance`:

Setting the Snapping Tolerance and Search Radius
================================================

Before we can edit vertices, we must set the snapping tolerance and search
radius to a value that allows us an optimal editing of the vector layer
geometries.

Snapping tolerance
------------------

Snapping tolerance is the distance |qg| uses to ``search`` for the closest
vertex and/or segment you are trying to connect to when you set a new vertex or
move an existing vertex. If you aren't within the snapping tolerance, |qg|
will leave the vertex where you release the mouse button, instead of snapping
it to an existing vertex and/or segment.
The snapping tolerance setting affects all tools that work with tolerance.

#. A general, project-wide snapping tolerance can be defined by choosing
   :menuselection:`Settings -->` |mActionOptions| :menuselection:`Options`.
   On Mac, go to :menuselection:`QGIS -->` |mActionOptions|
   :menuselection:`Preferences...`. On Linux: :menuselection:`Edit -->`
   |mActionOptions| :menuselection:`Options`. In the :guilabel:`Digitizing`
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
   and tolerance on a layer basis (see figure_snapping_1_ ).

Note that this layer-based snapping overrides the global snapping option
set in the Digitizing tab. So, if you need to edit one layer and snap its
vertices to another layer, then enable snapping only on the ``snap to``
layer, then decrease the global snapping tolerance to a smaller value.
Furthermore, snapping will never occur to a layer that is not checked in
the snapping options dialog, regardless of the global snapping tolerance.
So be sure to mark the checkbox for those layers that you need to snap to.

.. _figure_snapping_1:

.. only:: html

   **Figure Snapping 1:**

.. figure:: /static/user_manual/working_with_vector/editProjectSnapping.png
   :align: center

   Edit snapping options on a layer basis (Advanced mode) |nix|

.. index:: Search_Radius

The :guilabel:`Snapping options` enables you to make a quick and simple general 
setting for all layers in the project so that the pointer snaps to all existing 
vertices and/or segments when using the 'All layers' snapping mode. 
In most cases it is sufficient to use this snapping mode.

It is important to consider that the per-layer tolerance in
'map units' was actually in layer units. So if working with a layer in
WGS84 reprojected to UTM, setting tolerance to 1 map unit (i.e. 1 meter)
wouldn't work correctly because the units would be actually degrees. So now
the 'map units' has been relabeled to 'layer units' and the new entry 'map
units' operates with units of the map view. While working with 'on-the-fly' 
CRS transformation it is now possible to use a snapping tolerance that refers
to either the units of the reprojected layer (setting 'layer units') or the 
units of the map view (setting 'map units').


Search radius
-------------

Search radius is the distance |qg| uses to ``search`` for the closest vertex
you are trying to move when you click on the map. If you aren't within the
search radius, |qg| won't find and select any vertex for editing, and it will
pop up an annoying warning to that effect.
Snap tolerance and search radius are set in map units or pixels, so you may
find you need to experiment to get them set right. If you specify too big of
a tolerance, |qg| may snap to the wrong vertex, especially if you are dealing
with a large number of vertices in close proximity. Set search radius too
small, and it won't find anything to move.

The search radius for vertex edits in layer units can be defined in the
:guilabel:`Digitizing` tab under :menuselection:`Settings -->` |mActionOptions|
:menuselection:`Options`. This is the same place where you define the general, 
project-wide snapping tolerance.


.. Index:: Topological_Editing

Topological editing
===================

Besides layer-based snapping options, you can also define topological
functionalities in the :guilabel:`Snapping options...` dialog in the
:menuselection:`Settings` (or :menuselection:`File`) menu. Here, you can
define |checkbox| :guilabel:`Enable topological editing`,
and/or for polygon layers, you can activate the column |checkbox|
:guilabel:`Avoid Int.`, which avoids intersection of new polygons.

.. index:: Shared_Polygon_Boundaries

Enable topological editing
--------------------------

The option |checkbox| :guilabel:`Enable topological editing` is for editing
and maintaining common boundaries in polygon mosaics. |qg| 'detects' a
shared boundary in a polygon mosaic, so you only have to move the vertex
once, and |qg| will take care of updating the other boundary.

.. Index:: Avoid_Intersections_Of_Polygons

Avoid intersections of new polygons
-----------------------------------

The second topological option in the |checkbox| :guilabel:`Avoid Int.`
column, called :guilabel:`Avoid intersections of new polygons`, avoids
overlaps in polygon mosaics. It is for quicker digitizing of adjacent
polygons. If you already have one polygon, it is possible with this option
to digitize the second one such that both intersect, and |qg| then cuts the
second polygon to the common boundary. The advantage is that you don't
have to digitize all vertices of the common boundary.

.. Index:: Snapping_On_Intersections

Enable snapping on intersections
--------------------------------

Another option is to use |checkbox| :guilabel:`Enable snapping on intersection`.
It allows you to snap on an intersection of background layers, even if there's 
no vertex on the intersection.

