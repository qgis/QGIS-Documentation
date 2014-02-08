|LS| Feature Topology
===============================================================================

Topology is a useful aspect of vector data layers, because it minimizes errors
such as overlap or gaps.

For example: if two features share a border, and you edit the border using
topology, then you won't need to edit first one feature, then another, and
carefully line up the borders so that they match. Instead, you can edit their
shared border and both features will change at the same time.

**The goal for this lesson:** To understand topology using examples.

|moderate| |FA| Snapping
-------------------------------------------------------------------------------

To make topological editing easier, it's best if you enable snapping. This will
allow your mouse cursor to snap to other objects while you digitize. To set
snapping options:

* Navigate to the menu entry :menuselection:`Settings --> Snapping Options...`.
* Set up your :guilabel:`Snapping options` dialog as shown:

.. image:: /static/training_manual/create_vector_data/set_snapping_options.png
   :align: center

* Ensure that the box in the :guilabel:`Avoid Int.` column is checked (set to
  true).
* Click :guilabel:`OK` to save your changes and leave the dialog.
* Enter edit mode with the :guilabel:`landuse` layer selected.
* Check under :menuselection:`View --> Toolbars` to make sure that your
  :guilabel:`Advanced Digitizing` toolbar is enabled.
* Zoom to this area (enable layers and labels if necessary):

.. image:: /static/training_manual/create_vector_data/zoom_to.png
   :align: center

* Digitize this new (fictional) area of the |largeLandUseArea|:

.. image:: /static/training_manual/create_vector_data/new_park_area.png
   :align: center

* When prompted, give it a :guilabel:`OGC_FID` of :kbd:`999`, but feel free to
  leave the other values unchanged.

If you're careful while digitizing and allow the cursor to snap to the vertices
of adjoining farms, you'll notice that there won't be any gaps between your new
farm and the existing farms adjacent to it.

* Note the undo/redo tools in the :guilabel:`Advanced Digitizing` toolbar:

  |mActionRedo| |mActionUndo|


|moderate| |FA| Correct Topological Features
-------------------------------------------------------------------------------

Topology features can sometimes need to be updated. In our example, the
:guilabel:`landuse` layer has some complex forest areas which have recently been
joined to form one area:

.. image:: /static/training_manual/create_vector_data/forest_area_example.png
   :align: center

Instead of creating new polygons to join the forest areas, we're going to use
the :guilabel:`Node Tool` to edit the existing polygons and join them.

* Enter edit mode, if it isn't active already.
* Select the :guilabel:`Node Tool`.
* Pick an area of forest, select a corner and move it to an adjoining corner so
  two forest sections meet:

.. image:: /static/training_manual/create_vector_data/corner_selected.png
   :align: center

* Click and drag the nodes until they snap into place.

.. image:: /static/training_manual/create_vector_data/corner_selected_move.png
   :align: center

The topologically correct border looks like this:

.. image:: /static/training_manual/create_vector_data/areas_joined.png
   :align: center

Go ahead and join a few more areas using the :guilabel:`Node Tool`. You can also
use the :guilabel:`Add Feature` tool if it is appropriate. If you are using our
example data, you should have a forest area looking something like this:

.. image:: /static/training_manual/create_vector_data/node_example_result.png
   :align: center

Don't worry if you have joined more, less or different areas of forest.

|moderate| |FA| Tool: Simplify Feature
-------------------------------------------------------------------------------

This is the :guilabel:`Simplify Feature` tool:

  |mActionSimplify|

* Click on it to activate it.
* Click on one of the areas which you joined using either the
  :guilabel:`Node Tool` or :guilabel:`Add Feature` tool. You'll see this dialog:

.. image:: /static/training_manual/create_vector_data/simplify_line_dialog.png
   :align: center

* Move the slider from side to side and watch what happens:

.. image:: /static/training_manual/create_vector_data/simplify_line_example.png
   :align: center

This allows you to reduce the amount of nodes in complex features.

* Click :guilabel:`Ok`

Notice what the tool does to the topology. The simplified polygon is now no longer
touching the adjacent polygons as it should. This shows that this tool is
better suited to generalizing stand-alone features. The advantage is that it
provides you with a simple, intuitive interface for generalization.

Before you go on, set the polygon back to its original state by undoing the last
change.

.. _backlink-create-vector-topology-1:

|moderate| |TY| Tool: Add Ring
-------------------------------------------------------------------------------

This is the :guilabel:`Add Ring` tool:

 |mActionAddRing|

It allows you to take a hole out of a feature, as long as the hole is bounded
on all side by the feature. For example, if you've digitized the outer
boundaries of South Africa and you need to add a hole for Lesotho, you'd use
this tool.

If you experiment with this tool, you'll notice that the current snapping
options prevent you from creating a ring in the middle of the polygon. This
would be fine if the area you wished to exclude linked to the polygon's
boundaries.

* Disable snapping for the landuse layer via the dialog you used earlier.
* Now try using the :guilabel:`Add Ring` tool tool to create a gap in the
  middle of the |largeLandUseArea|.
* Delete your new feature by using the :guilabel:`Delete Ring` tool:

  |mActionDeleteRing|

.. Note:: You need to select a corner of the ring in order to delete it.

:ref:`Check your results <create-vector-topology-1>`


.. _backlink-create-vector-topology-2:

|moderate| |TY| Tool: Add Part
-------------------------------------------------------------------------------

This is the :guilabel:`Add Part` tool:

  |mActionAddIsland|

It allows you to create an extra part of the feature, not directly connected to
the main feature. For example, if you've digitized the boundaries of mainland
South Africa but you haven't yet added the Prince Edward Islands, you'd use
this tool to create them.

* To use this tool, you must first select the polygon to which you wish to add
  the part by using the :guilabel:`Select Single Feature` tool:

  |mActionSelect|

* Now try using the :guilabel:`Add Part` tool to add an outlying area to the
  |largeLandUseArea|.
* Delete your new feature by using the :guilabel:`Delete Part` tool:

  |mActionDeletePart|

.. Note:: You need to select a corner of the part in order to delete it.

:ref:`Check your results <create-vector-topology-2>`

|moderate| |FA| Tool: Reshape Features
-------------------------------------------------------------------------------

This is the :guilabel:`Reshape Features` tool:

  |mActionReshape|

It can add a bump to an existing feature. With this tool selected:

* Left-click inside the |largeLandUseArea| to start
  drawing a polygon.
* Draw a polygon with three corners, the last of which should be back inside the
  original polygon, forming an open-sided rectangle.
* Right-click to finish marking points:

.. image:: /static/training_manual/create_vector_data/reshape_step_one.png
   :align: center

This will give a result similar to:

.. image:: /static/training_manual/create_vector_data/reshape_result.png
   :align: center

You can do the opposite, too:

* Click outside the polygon.
* Draw a rectangle into the polygon.
* Right-click outside the polygon again:

.. image:: /static/training_manual/create_vector_data/reshape_inverse_example.png
   :align: center

The result of the above:

.. image:: /static/training_manual/create_vector_data/reshape_inverse_result.png
   :align: center


|moderate| |TY| Tool: Split Features
-------------------------------------------------------------------------------

The :guilabel:`Split Features` tool is similar to how you took part of the farm
away, except that it doesn't delete either of the two parts. Instead, it keeps
them both.

  |mActionSplitFeatures|

* First, re-enable snapping for the :guilabel:`landuse` layer.

We will use the tool to split a corner from the |largeLandUseArea|.

* Select the :guilabel:`Split Features` tool and click on a vertex to begin
  drawing a line. Click the vertex on the opposite side of the corner you wish
  to split and right-click to complete the line:

.. image:: /static/training_manual/create_vector_data/split_feature_example.png
   :align: center

* At this point, it may seem as if nothing has happened. But remember that your
  symbology for the :kbd:`landuse` layer does not have any border, so the new
  division line will not be shown.
* Use the :guilabel:`Select Single Feature` tool to select the corner you just
  split; the new feature will now be highlighted:

.. image:: /static/training_manual/create_vector_data/new_corner_selected.png
   :align: center

.. _backlink-create-vector-topology-4:

|hard| |TY| Tool: Merge Features
-------------------------------------------------------------------------------

Now we will re-join the feature you just created to the original polygon:

* Experiment with  the :guilabel:`Merge Selected Features` and
  :guilabel:`Merge Attributes of Selected Features` tools.
* Note the differences.

:ref:`Check your results <create-vector-topology-4>`

|IC|
-------------------------------------------------------------------------------

Topology editing is a powerful tool that allows you to create and modify
objects quickly and easily, while ensuring that they remain topologically
correct.

|WN|
-------------------------------------------------------------------------------

Now you know how to digitize the shape of the objects easily, but adding in the
attributes is still a bit of a headache! Next we'll show you how to use forms
so that attribute editing is simpler and more effective.
