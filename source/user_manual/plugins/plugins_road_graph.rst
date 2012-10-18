.. comment out this disclaimer (by putting '.. ' in front of it) if file is uptodate with release
|updatedisclaimer|

.. _`roadgraph`:

Road Graph Plugin
=================

The Road Graph Plugin is a C++ plugin for QGIS, that calculates the 
shortest path between two points on any polyline layer and plots this 
path over the road network.

**Main features**:

* calculate path, it's length and travel time
* optimize by length or by travel time
* export path to a vector layer
* highlight roads directions (this is slow and used mainly for debug
  purposes and for the settings testing)

As a roads layer you can use any polyline vector layer in any QGIS
supported format. Two lines with a common point are considered connected.
Please note, it is required to use layer CRS as project CRS while editing
roads layer. This is due to the fact that recalculation of the coordinates
between different CRS introduce some errors that can result in
discontinuities, even when 'snapping' is used.

In the layer attribute table the following fields can be used:

* speed on road section --- numeric field;
* direction --- any type, that can be casted to string. Forward and reverse
  directions are correspond to the one-way road, both directions ---
  two-way road.

If some fields don't have any value or do not exists --- default values
are used. You can change defaults and some plugin settings in plugin settings
dialog.

Usage
------


After plugin activation you will see additional panel on the left side of
the main QGIS window. Now make some definitions to the :guilabel:`Road graph
settings` dialog in the menu :menuselection:`Plugins --> Road Graph`.

.. _figure_road_graph_1:

.. only:: html

   **Figure Road Graph 1:**

.. figure:: /static/user_manual/plugins/roadgraph_settings.png
   :align: center
   :width: 20 em

   Define settings for the road graph plugin |nix|

Select a Start and a Stop point in the road network layer and click on
**[Calculate]**.

.. _figure_road_graph_2:

.. only:: html

   **Figure Road Graph 2:**

.. figure:: /static/user_manual/plugins/roadgraph_sample.png
   :align: center
   :width: 40 em

   Road Graph Plugin |nix|
