.. index:: Layout; 3D Map item
.. _layout_map3d_item:

The 3D Map Item
===============

.. only:: html

   .. contents::
      :local:


The 3D map item is used to display a 3D map view.
Use the |add3DMap| :guilabel:`Add 3D Map` button, and follow
:ref:`items creation instructions <create_layout_item>` to add a new
map item that you can later manipulate the same way as exposed in
:ref:`interact_layout_item`.

By default, a new 3D Map item is empty.
You can set the properties of the 3D view and customize it in the
:guilabel:`Item Properties` panel.
Other than the
:ref:`common properties <item_common_properties>`, this feature
has the following functionalities (:ref:`figure_layout_3dmap_prop`):

.. _figure_layout_3dmap_prop:

.. figure:: img/3dmap_properties.png
   :align: center

   3D Map Item Properties


.. _`layout_3dmap_scene_settings`:

Scene setting
-------------

Here you can :guilabel:`Copy Settings from a 3D View...`.
In the pull-down menu, choose the 3D view that you would like to get
the settings from.

Once you have chosen a 3D View, the settings in
the :ref:`layout_3dmap_camera_pose` group reflects this 3D view, and
it will be visible in the 3D Map frame.


.. _`layout_3dmap_camera_pose`:

Camera pose
-----------

* :guilabel:`Center X`, sets the X value of the camera center
* :guilabel:`Center Y`, sets the Y value of the camera center
* :guilabel:`Center Z`, sets the Z value of the camera center
* :guilabel:`Distance`, sets the distance from the camera center to
  the ground
* :guilabel:`Pitch`, sets the pitch of the camera
* :guilabel:`Heading` sets the direction of the camera (0/360: north,
  90: west, 180: south, 270: east)

The :guilabel:`Set from a 3D View...` button lets you populate the
items with the parameters of a 3D View.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |add3DMap| image:: /static/common/mActionAdd3DMap.png
   :width: 1.5em

