|updatedisclaimer|

.. index:: Geometry, Topology, Snapping, Plugin, Geometry snapper plugin

.. _geometry_snapper:

Geometry Snapper Plugin
=======================

The Geometry Snapper tool allows to align automatically the edges and vertices
of one vector layer to the edges and vertices of a second layer using a user
defined tolerance.

The below interface shows the settings of this plugin. User needs to choose the
layer to change (see :guilabel:`input vector layer`) and the :guilabel:`reference
layers` to snap to. A :guilabel:`Maximum snapping distance (map units)` allows
to change the snapping tolerance.

You can snap only selected feature(s) checking the |checkbox| :guilabel:`Only
selected features`.

:guilabel:`Output vector layer` allows you to choose between
:guilabel:`Modifying input layer` or :guilabel:`Create a new layer`.

.. _figure_geometry_snapper_1:

.. only:: html

   **Figure Geometry Snapper:**

.. figure:: /static/user_manual/plugins/snap_geometries.png
   :align: center

   The Geometry Snapper Plugin
