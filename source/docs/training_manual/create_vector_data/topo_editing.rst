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

.. image:: ../_static/create_vector_data/044.png
   :align: center

* Ensure that the box in the :guilabel:`Avoid Int.` column is checked (set to
  true).
* Click :guilabel:`OK` to save your changes and leave the dialog.
* Enter edit mode with the :guilabel:`rural` layer selected.
* Check under :menuselection:`View --> Toolbars` to make sure that your
  :guilabel:`Advanced Digitizing` toolbar is enabled.
* Zoom to this area (enable layers and labels if necessary):

.. image:: ../_static/create_vector_data/045.png
   :align: center

* Digitize this new (fictional) farm:

.. image:: ../_static/create_vector_data/047.png
   :align: center

* When prompted, give it an :guilabel:`id` of :kbd:`999`, but feel free to
  leave the other values unchanged.

If you're careful while digitizing and allow the cursor to snap to the vertices
of adjoining farms, you'll notice that there won't be any gaps between your new
farm and the existing farms adjacent to it.

* Note the undo/redo tools in the :guilabel:`Advanced Digitizing` toolbar:

.. image:: ../_static/create_vector_data/046.png
   :align: center

Those buttons will become your best friends...

|moderate| |FA| Closing the Gaps
-------------------------------------------------------------------------------

You've probably noticed some large holes in the :guilabel:`rural` dataset:

.. image:: ../_static/create_vector_data/067.png
   :align: center

The white gaps among the farms, which are not filled by grey urban areas,
represent missing farms.  Let's say you want to close these gaps. If you were
adding features normally, you'd have to be very accurate to avoid gaps and
overlap. In fact, even if you're very accurate, without vertex snapping (which
you activated above), digitizing features without such errors is impossible.

However, we have another tool to use for this situation. Since we already have
topology enabled, it's possible to very quickly close a hole without even
worrying about accuracy, and the topology will take care of the rest. For
example, let's say you want to digitize a new farm to close up this gap:

.. image:: ../_static/create_vector_data/068.png
   :align: center

If you had to do this without help from the topology, you'd be digitizing that
for a while. But at the moment, as per the directions above, you have
:guilabel:`Avoid Int.` ("Avoid Intersections") enabled for the
:guilabel:`rural` layer. This tells QGIS to use the topology to prevent
overlap. So you can digitize even a very rough shape:

.. image:: ../_static/create_vector_data/069.png
   :align: center

(Use an :guilabel:`id` value of somewhere in the hundreds range to avoid a
conflict with existing features.)

But when you select the feature ...

.. image:: ../_static/create_vector_data/070.png
   :align: center

... you'll see that QGIS has automatically added all the detailed vertices and
made sure that there was no overlap!

* Try doing this now.

.. note::  The "Avoid Intersections" option only works to eliminate overlap
   (intersections). Obviously, if you leave a gap, that will not be filled,
   because you might not actually want the gap to be filled!

.. _backlink-create-vector-topology-3:

|moderate| |TY|
-------------------------------------------------------------------------------

* Close the remaining gaps using the approach above, but make sure not to
  create farms over urban areas.
* Remember to save your edits, and if necessary, to exit edit mode.

:ref:`Check your results <create-vector-topology-3>`


|moderate| |FA| Correct topology errors
-------------------------------------------------------------------------------

Topology errors aren't always immediately visible. Let's change the
:guilabel:`rural` layer's symbology to see some of them.

* Set the symbology for the :guilabel:`rural` layer to a single (preferably
  dark) color.
* Set its :guilabel:`Transparency` slider to :kbd:`50%`.
* You should see results like these:

.. image:: ../_static/create_vector_data/048.png
   :align: center

There are several things to notice here. First, the new farm you added is
lighter than the others. This is because in this dataset, there are several
"levels" of farms: large farms and their subdivisions were digitized
separately. So there is a large farm and its subdivisions resting on top of
each other, which makes the color darker because you're seeing the lower one
through the upper one. That's a feature of the dataset, not a problem.

But you can also notice a definite problem: one of the farms is going
underneath another one!  Obviously this is a mistake, because in the real world
farms don't overlap, and two farms don't share the same subdivision.

Let's correct this!

* Enter edit mode, if it isn't active already.
* Select the :guilabel:`Node Tool`.
* Click on one of the corners of the problematic farm. This will select that
  farm for editing and you'll see all the nodes appear:

.. image:: ../_static/create_vector_data/049.png
   :align: center

* Click and drag the nodes until they snap into place.

.. image:: ../_static/create_vector_data/050.png
   :align: center

The topologically correct border looks like this:

.. image:: ../_static/create_vector_data/051.png
   :align: center

|moderate| |FA| Tool: Simplify Feature
-------------------------------------------------------------------------------

This is the :guilabel:`Simplify Feature` tool:

.. image:: ../_static/create_vector_data/052.png
   :align: center

* Click on it to activate it.
* Click on the new farm you created previously. You'll be presented with this
  dialog:

.. image:: ../_static/create_vector_data/053.png
   :align: center

* Move the slider from side to side and watch what happens:

.. image:: ../_static/create_vector_data/054.png
   :align: center

This allows you to recude the amount of nodes in complex features. However,
notice what it does to the topology! The simplified farm is now no longer
touching the adjacent farms as it should. That's how you know that this tool is
better suited to generalizing stand-alone features. The advantage is that it
provides you with a simple, intuitive interface for generalization, and allows
you to see what the effects would be before you even implement them.

Before you go on, get the farm back in its previous state. Either:

* cancel the :guilabel:`Simplify Feature` dialog, or
* if you already clicked :guilabel:`OK`, just undo the last change.


.. _backlink-create-vector-topology-1:

|moderate| |TY| Tool: Add Ring
-------------------------------------------------------------------------------

This is the :guilabel:`Add Ring` tool:

.. image:: ../_static/create_vector_data/055.png
   :align: center

It allows you to take a hole out of a feature, as long as the hole is bounded
on all side by the feature. For example, if you've digitized the outer
boundaries of South Africa and you need to add a hole for Lesotho, you'd use
this tool.

* Try using this tool to create a gap in the middle of your farm.
* Undo the edit when you are done.

:ref:`Check your results <create-vector-topology-1>`


.. _backlink-create-vector-topology-2:

|moderate| |TY| Tool: Add Part
-------------------------------------------------------------------------------

This is the :guilabel:`Add Part` tool:

.. image:: ../_static/create_vector_data/057.png
   :align: center

It allows you to create an extra part of the feature, not directly connected to
the main feature. For example, if you've digitized the boundaries of mainland
South Africa but you haven't yet added the Prince Edward Islands, you'd use
this tool to create them.

* Try using this tool to add an outlying property to your farm.
* Undo the edit when you are done.

:ref:`Check your results <create-vector-topology-2>`


|moderate| |TY| Tools: Delete Ring and Delete Part
-------------------------------------------------------------------------------

These are the :guilabel:`Delete Ring` and :guilabel:`Delete Part` tools,
respectively:

.. image:: ../_static/create_vector_data/060.png
   :align: center

Their functions should be obvious.

* Create new parts and rings as above and delete them to try see how these
  tools work.
* You need to click close to a node (corner) of a part or ring in order to
  delete it.


|moderate| |FA| Tool: Reshape Features
-------------------------------------------------------------------------------

This is the :guilabel:`Reshape Features` tool:

.. image:: ../_static/create_vector_data/061.png
   :align: center

It can add a bump to an existing feature. With this tool selected:

* Click inside your farm.
* Add an extra piece of land.
* Right-click back inside the farm:

.. image:: ../_static/create_vector_data/062.png
   :align: center

The result of the above:

.. image:: ../_static/create_vector_data/063.png
   :align: center

You can do the opposite, too:

* Click outside the feature.
* Take a bite out of it.
* Right-click outside the farm again:

.. image:: ../_static/create_vector_data/064.png
   :align: center

The result of the above:

.. image:: ../_static/create_vector_data/065.png
   :align: center


|moderate| |TY| Tool: Split Features
-------------------------------------------------------------------------------

The :guilabel:`Split Features` tool is similar to how you took part of the farm
away, except that it doesn't delete either of the two parts. Instead, it keeps
them both.

* Try it and see!
* Undo your edit before continuing with the exercise for the next tool.


.. _backlink-create-vector-topology-4:

|hard| |TY| Tool: Merge Features
-------------------------------------------------------------------------------

* Find and select these farms:

.. image:: ../_static/create_vector_data/073.png
   :align: center

* Use the :guilabel:`Merge Selected Features` and :guilabel:`Merge Attributes
  of Selected Features` tools.
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
