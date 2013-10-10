|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _roadgraph:

Road Graph Plugin
=================

The Road Graph Plugin is a C++ plugin for QGIS, that calculates the shortest path
between two points on any polyline layer and plots this path over the road network.

.. _figure_road_graph_1:

.. only:: html

   **Figure Road Graph 1:**

.. figure:: /static/user_manual/plugins/roadgraph_sample.png
   :align: center
   :width: 30 em

   Road Graph Plugin |nix|

Main features:

* calculate path, it's length and travel time
* optimize by length or by travel time
* export path to a vector layer
* highlight roads directions (this is slow and used mainly for debug purposes
  and for the settings testing)

As a roads layer you can use any polyline vector layer in any QGIS supported
format. Two lines with a common point are considered connected. Please note, it
is required to use layer CRS as project CRS while editing roads layer. This is
due to the fact that recalculation of the coordinates between different CRS
introduce some errors that can result in discontinuities, even when 'snapping'
is used.

In the layer attribute table the following fields can be used:

* speed on road section --- numeric field;
* direction --- any type, that can be casted to string. Forward and reverse
  directions are correspond to the one-way road, both directions --- two-way road

If some fields don't have any value or do not exist --- default values are used.
You can change defaults and some plugin settings in plugin settings dialog.

Using the plugin
----------------

After plugin activation you will see an additional panel on the left side of
the main QGIS window. Now make some definitions to the :guilabel:`Road graph
plugin settings` dialog in the menu :menuselection:`Vector --> Road Graph` 
(see figure_road_graph_2_).

.. _figure_road_graph_2:

.. only:: html

   **Figure Road Graph 2:**

.. figure:: /static/user_manual/plugins/roadgraph_plugin_settings.png
   :align: center
   :width: 30 em

   Road graph plugin settings |nix|

After setting the :guilabel:`Time unit`, :guilabel:`Distance unit` and 
:guilabel:`Topology tolerance` you can choose the vector layer in the
:guilabel:`Transportation layer` tab. Here you can also choose the
:guilabel:`Direction field` and :guilabel:`Speed field`.
In the :guilabel:`Default settings` tab you can set the :guilabel:`Direction`
for the calculation.

Finally in the :guilabel:`Shortest Path` panel select a Start and a Stop point
in the road network layer and click on **[Calculate]**.
