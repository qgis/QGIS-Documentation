.. comment out this disclaimer (by putting '.. ' in front of it) if file is uptodate with release
|updatedisclaimer|

.. _`spatial_query`:

Spatial Query Plugin
====================


The |spatialquery| :sup:`Spatial Query` plugin allows to make a spatial
query (select features) in a target layer with reference to another layer.
The functionality is based on the GEOS library and depends on the selected
source feature layer.

Possible operators are:

* Contains
* Equals
* Overlap
* Crosses
* Intersects
* Is disjoint
* Touches
* Within

How to use the plugin
----------------------

As an example we want to find regions in the Alaska dataset that contain
airports. Following steps are necessary:

#. Start QGIS and load the vector layers :file:`regions.shp` and
   :file:`airports.shp`.
#. Load the Spatial Query plugin in the Plugin Manager (see Section
   :ref:`load_core_plugin`) and click on the |spatialquery| 
   :sup:`Spatial Query` icon which appears in the QGIS toolbar menu. The 
   plugin dialog appears as shown in figure_spatial_query_1_.
#. Select layer regions as source layer and airports as reference feature
   layer.
#. Select 'Contains' as operator and click **[Apply]**.

Now you get a list of feature IDs from the query and you have several
options.

* Click on the |selectesubsetlayer| :sup:`Create layer with list of
  items`
* Select an ID from the list and click on |selectcreatelayer|
  :sup:`Create layer with selected`
* Select the :guilabel:`Remove from current selection` in the field 
  :guilabel:`And use the result to`.
* Additionally you can |checkbox| :guilabel:`Zoom to item` or display 
  |checkbox| :guilabel:`Log messages`.

.. _figure_spatial_query_1:

.. only:: html

   **Figure Spatial Query 1:**

.. figure:: /static/user_manual/plugins/spatial_query_sample.png
   :align: center
   :width: 40 em

   Spatial Query analysis - regions contain airports |nix|
