|updatedisclaimer|

.. _spatial_query:

Spatial Query Plugin
====================

The |spatialquery| :sup:`Spatial Query Plugin` allows you to make a spatial query
(i.e., select features) in a target layer with reference to another layer. The
functionality is based on the GEOS library and depends on the selected source
feature layer.

Possible operators are:

* Contains
* Equals
* Overlap
* Crosses
* Intersects
* Is disjoint
* Touches
* Within

Using the plugin
----------------

As an example, we want to find regions in the Alaska dataset that contain airports.
The following steps are necessary:

#. Start |qg| and load the vector layers :file:`regions.shp` and
   :file:`airports.shp`.
#. Load the Spatial Query plugin in the Plugin Manager (see
   :ref:`managing_plugins`) and click on the |spatialquery|
   :sup:`Spatial Query` icon, which appears in the |qg| toolbar menu. The plugin
   dialog appears.
#. Select the layer ``regions`` as the source layer and ``airports`` as the reference feature
   layer.
#. Select 'Contains' as the operator and click **[Apply]**.

Now you get a list of feature IDs from the query and you have several options, as
shown in figure_spatial_query_1_.

* Click on |selectesubsetlayer| :sup:`Create layer with list of items`.
* Select an ID from the list and click on |selectcreatelayer|
  :sup:`Create layer with selected`.
* Select 'Remove from current selection' in the field
  :guilabel:`And use the result to` |selectstring|.
* Additionally, you can |checkbox| :guilabel:`Zoom to item` or display
  |checkbox| :guilabel:`Log messages`.

.. _figure_spatial_query_1:

.. only:: html

   **Figure Spatial Query 1:**

.. figure:: /static/user_manual/plugins/spatial_query_sample.png
   :align: center

   Spatial Query analysis - regions contain airports |nix|
