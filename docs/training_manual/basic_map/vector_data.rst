.. _tm_working_vector_data:

|LS| Working with Vector Data
===============================================================================

Vector data is arguably the most common kind of data you will find in the daily
use of GIS. The vector model represents the location and shape of geographic
features using points, lines and polygons (and for 3D data also surfaces and
volumes), while their other properties are included as attributes (often presented
as a table in QGIS).
It is usually used to store discrete features, like roads and
city blocks. The objects in a vector dataset are called **features**,
and contain data that describe their location and properties.

**The goal for this lesson:** To learn about the structure of vector data.

|basic| |FA| Viewing Layer Attributes
-------------------------------------------------------------------------------

It's important to know that the data you will be working with does not only
represent **where** objects are in space, but also tells you **what** those
objects are.

From the previous exercise, you should have the ``protected_areas`` layer
loaded in your map. If it is not loaded, then you can find the 
:file:`protected_areas.shp` *ESRI Shapefile* format dataset in directory 
:file:`exercise_data/shapefile`.

The polygons representing the protected areas constitute the **spatial data**,
but we can learn more about the protected areas by exploring the
**attribute table**.

#. In the :guilabel:`Layers` panel, click on the ``protected_areas`` layer to 
   select it.
#. In the :guilabel:`Attributes Toolbar` click the |openTable| 
   :sup:`Open Attribute Table` button.  This will open a new window showing 
   the attribute table of the ``protected_areas`` layer.  

   .. figure:: img/attribute_data_preview.png
     :align: center

   A row is called a **record** and is associated with a **feature**
   in the Canvas Map, such as a polygon.
   A column is called a **field** (or an **attribute**), and has a name that helps
   describe it, such as ``name`` or ``id``.
   Values in the cells are known as **attribute values**.
   These definitions are commonly used in GIS, so it is good to become
   familiar with them.

   In the ``protected_areas`` layer, there are two **features**, which are
   represented by the two polygons we see on the Map Canvas. 

   .. Note:: In order to understand what the **fields** and **attribute values** 
      represent, one may need to find documentation (or metadata) describing 
      the meaning of the attribute values.
      This is usually available from the creator of the data set.

Next, let's see how a record in the attribute table is linked to a polygon 
feature that we see on the Map Canvas.

#. Go back to the main QGIS window.
#. In the :guilabel:`Attributes Toolbar`, click on the |selectFeature| 
   :sup:`Select Feature` button.  
#. Make sure the ``protected_areas`` layer is still selected in the 
   :guilabel:`Layers` panel.
#. Move your mouse to the Map Canvas and left click on the smaller  
   of the two polygons.  The polygon will turn yellow indicating it is selected.
   
   .. figure:: img/select_polygon.png
      :align: center
   
#. Go back to the :guilabel:`Attribute Table` window, and you should see a 
   record (row) highlighted.  These are the attribute values of the
   selected polygon.
   
   .. figure:: img/select_record.png
     :align: center

You can also select a feature using the Attribute Table.

#. In the :guilabel:`Attribute Table` window, on the far left, click on the 
   row number of the record that is currently not selected.

   .. figure:: img/select_record2.png
     :align: center

#. Go back to the main QGIS window and look at the Map Canvas. You should 
   see the larger of the two polygons colored yellow.  
#. To deselect the feature, go to the :guilabel:`Attribute Table` window 
   and click on |deselectAll| :sup:`Deselect All` button.

Sometimes there are many features shown on the Map Canvas and it might be difficult
to see which feature is selected from the Attribute Table.  Another way to 
identify the location of a feature is to use the :guilabel:`Flash Feature`
tool.

#. In the :guilabel:`Attribute Table`, right-click on any cell in the
   row that has the attribute value ``r2855697`` for the field ``full_id``.
#. In the context menu, click on :guilabel:`Flash Feature` and watch the 
   Map Canvas.  

   .. figure:: img/flash_feature.png
     :align: center
   
   You should see the polygon flash red a few times.  If you missed it, 
   try it again.

Another useful tool is the :guilabel:`Zoom to Feature` tool, that tells QGIS to 
zoom to the feature of interest.

#. In the :guilabel:`Attribute Table`, right-click on  any cell in the
   row that has the attribute value ``r2855697`` for the field ``full_id``.
#. In the context menu, click on :guilabel:`Zoom to Feature`

   .. figure:: img/zoom_to_feature.png
     :align: center

   Look at the Map Canvas.  The polygon should now occupy the extent
   of the Map Canvas area.  
   
You may now close the attribute table.

.. _backlink-vector-explore-attribute-data:

|basic| |TY| Exploring Vector Data Attributes
-------------------------------------------------------------------------------

#. How many fields are available in the :guilabel:`rivers` layer?
#. Tell us a bit about the ``town`` places in your dataset.

:ref:`Check your results <vector-explore-attribute-data>`


|FA| Reordering the Layers
-------------------------------------------------------------------------------

The layers in your Layers list are drawn on the map in a certain order. The
layer at the bottom of the list is drawn first, and the layer at the top is
drawn last. By changing the order that they are shown on the list, you can
change the order they are drawn in.

.. note:: You can alter this behavior using the :guilabel:`Control rendering
   order` checkbox beneath the :guilabel:`Layer Order` panel. We will
   however not discuss this feature yet.

The order in which the layers have been loaded into the map is probably not
logical at this stage. It's possible that the road layer is completely hidden
because other layers are on top of it.

For example, this layer order...

.. figure:: img/incorrect_layer_order.png
   :align: center

... would result in roads and places being hidden as they run *underneath*
the polygons of the landuse layer.

To resolve this problem:

#. Click and drag on a layer in the Layers list.
#. Reorder them to look like this:

.. figure:: img/correct_layer_order.png
   :align: center

You'll see that the map now makes more sense visually, with roads and buildings
appearing above the land use regions.

|IC|
-------------------------------------------------------------------------------

Now you've added all the layers you need from several different sources.

|WN|
-------------------------------------------------------------------------------

Using the random palette automatically assigned when loading the layers, your
current map is probably not easy to read. It would be preferable to assign your
own choice of colors and symbols. This is what you'll learn to do in the next
lesson.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |TY| replace:: Try Yourself
.. |WN| replace:: What's Next?
.. |basic| image:: /static/common/basic.png
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
.. |openTable| image:: /static/common/mActionOpenTable.png
   :width: 1.5em
.. |deselectAll| image:: /static/common/mActionDeselectAll.png
   :width: 1.5em
.. |selectFeature| image:: /static/common/mActionSelectRectangle.png
   :width: 1.5em
