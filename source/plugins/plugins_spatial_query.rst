.. _`spatial_query`:

Spatial Query Plugin
====================

The |spatialquery| :guilabel:`Spatial Query` plugin allows to make a spatial
query (select features) in a target layer with reference to another layer.
The functionality is based on the GEOS library and depends on the selected
source feature layer.

Possible operator are:

* Contains
* Equals
* Overlap
* Crosses
* Intersects
* Is disjoint
* Touches
* Within

**How to use the plugin**

As an example we want to find regions in the Alaska dataset that contain
airports. Following steps are necessary:

1. Start QGIS and load the vector layers :file:`regions.shp` and
   :file:`airports.shp`.
2. Load the Spatial Query plugin in the Plugin Manager (see Section
   :ref:`load_core_plugin`) and click on the |spatialquery| :guilabel:`Spatial
   Query` icon which appears in the QGIS toolbar menu. The plugin dialog
   appears as shown in Figure `spatialquerysample`_.
3. Select layer regions as source layer and airports as reference feature
   layer.
4. Select 'Contains' as operator and click :guilabel:`Apply`.

Now you get a list of feature IDs from the query and you have several
options.

* Click on the |selectesubsetlayer| :guilabel:`Create layer with list of
  items`
* Select an ID from the list and click on |selectcreatelayer|
  :guilabel:`Create layer with selected`
* Select the :guilabel:`Remove from current selection` in the field 'And
  use the result to'.
* Additionally you can |checkbox| Zoom to item or display |checkbox| Log
  messages.

.. `spatialquerysample`:

.. figure::img/en/plugins/spatial_query/spatial_query_sample.png
   :align: center
   :width: 12 em

   Spatial Query analysis --- regions contain airports |nix|
