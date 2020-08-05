.. index:: Layout; 3D Map item
.. _layout_map3d_item:

The 3D Map Item
======================================================================

.. only:: html

   .. contents::
      :local:

The 3D Map item is used to display a
:ref:`3D map view <label_3dmapview>`.
Use the |add3DMap| :guilabel:`Add 3D Map` button, and follow
:ref:`items creation instructions <create_layout_item>` to add a new
3D Map item that you can later manipulate the same way as demonstrated
in :ref:`interact_layout_item`.

By default, a new 3D Map item is empty.
You can set the properties of the 3D view and customize it in the
:guilabel:`Item Properties` panel.
In addition to the
:ref:`common properties <item_common_properties>`, this feature
has the following functionalities (:numref:`figure_layout_3dmap_prop`):

.. _figure_layout_3dmap_prop:

.. figure:: img/3dmap_properties.png
   :align: center
   :width: 20em

   3D Map Item Properties


.. _`layout_3dmap_scene_settings`:

Scene settings
----------------------------------------------------------------------

Press :guilabel:`Copy Settings from a 3D View...` to choose
the 3D map view to display.

The 3D map view is rendered with its current configuration
(layers, terrain, lights, camera position and angle...).


.. _`layout_3dmap_camera_pose`:

Camera pose
----------------------------------------------------------------------

* :guilabel:`Center X` sets the X coordinate of the point the camera
  is pointing at
* :guilabel:`Center Y` sets the Y coordinate of the point the camera
  is pointing at
* :guilabel:`Center Z` sets the Z coordinate of the point the camera
  is pointing at
* :guilabel:`Distance` sets the distance from the camera center to
  the point the camera is pointing at
* :guilabel:`Pitch` sets the rotation of the camera around the X-axis
  (vertical rotation).
  Values from 0 to 360 (degrees).
  0°: terrain seen straight from above;
  90°: horizontal (from the side);
  180°: straight from below;
  270°: horizontal, upside down;
  360°: straight from above.
* :guilabel:`Heading` sets the rotation of the camera around the
  Y-axis (horizontal rotation - 0 to 360 degrees).
  0°/360°: north; 90°: west; 180°: south; 270°: east.

The :guilabel:`Set from a 3D View...` pull-down menu lets you
populate the items with the parameters of a 3D View.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |add3DMap| image:: /static/common/mActionAdd3DMap.png
   :width: 1.5em
