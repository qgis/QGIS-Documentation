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

**The goal for this lesson:** To learn about the structure of vector data, and
how to load vector datasets into a map.

|basic| |FA| Viewing Layer Attributes
-------------------------------------------------------------------------------

It's important to know that the data you will be working with does not only
represent **where** objects are in space, but also tells you **what** those
objects are.

From the previous exercise, you should have the :guilabel:`rivers` layer
loaded in your map. The lines that you can see right now are merely the
position of the rivers: this is the *spatial data*.

To see all the available data in the :guilabel:`rivers` layer,
select it in the Layers panel and click the |openTable| button.

It will show you a table with more data about the :guilabel:`rivers` layer.
This is the layer's :guilabel:`Attribute table`. A row is called
a *record*, and represents a river *feature*. A column is called a *field*,
and represents a property of the river. Cells show *attributes*.

.. figure:: img/attribute_data_preview.png
   :align: center

These definitions are commonly used in GIS, so it's essential to remember them!

You may now close the attribute table.

.. _backlink-vector-explore-attribute-data:

|basic| |TY| Exploring Vector Data Attributes
-------------------------------------------------------------------------------

#. How many fields are available in the :guilabel:`rivers` layer?
#. Tell us a bit about the ``town`` places in your dataset.

:ref:`Check your results <vector-explore-attribute-data>`


.. _load_geopackage:

|basic| |FA| Loading Vector Data From GeoPackage Database
-------------------------------------------------------------------------------

Databases allow you to store a large volume of associated data in one file. You
may already be familiar with a database management system (DBMS) such as
Libreoffice Base or MS Access. GIS applications can also make use of databases.
GIS-specific DBMSes (such as PostGIS) have extra functions, because they need to
handle spatial data.

The `GeoPackage <https://www.geopackage.org/>`_ open format is a container that
allows you to store GIS data (layers) in a single file.
Unlike the ESRI Shapefile format (e.g. the :file:`protected_areas.shp` dataset
you loaded earlier), a single GeoPackage file can contain various data (both
vector and raster data) in different coordinate reference systems, as well as
tables without spatial information; all these features allow you to share data
easily and avoid file duplication.

In order to load a layer from a GeoPackage, you will first need to create the
connection to it:

#. Click on the |dataSourceManager| :sup:`Open Data Source Manager` button.
#. On the left click on the |newGeoPackageLayer| :guilabel:`GeoPackage` tab.
#. Click on the :guilabel:`New` button and browse to the :file:`training_data.gpkg`
   file in the :file:`exercise_data` folder you downloaded before.
#. Select the file and press :guilabel:`Open`. The file path is now added to the
   Geopackage connections list, and appears in the drop-down menu.

You are now ready to add any layer from this GeoPackage to QGIS.

#. Click on the :guilabel:`Connect` button.
   In the central part of the window you should now see the list of all the layers
   contained in the GeoPackage file.
#. Select the :guilabel:`roads` layer and click on the :guilabel:`Add` button.

   .. figure:: img/add_data_dialog_geopackage.png
      :align: center

   A :guilabel:`roads` layer is added to the :guilabel:`Layers` panel with
   features displayed on the map canvas.
#. Click on :guilabel:`Close`.

Congratulations! You have loaded the first layer from a GeoPackage.


.. _backlink-vector-load-from-database-1:

|basic| |FA| Loading Vector Data From a SpatiaLite Database with the Browser
-------------------------------------------------------------------------------

QGIS provides access to many other database formats. Like GeoPackage, the
SpatiaLite database format is an extension of the SQLite library. And adding
a layer from a SpatiaLite provider follows the same rules as described
above: Create the connection --> Enable it --> Add the layer(s).

While this is one way to add SpatiaLite data to your map,
let's explore another powerful way to add data:
the :guilabel:`Browser`.

#. Click the |dataSourceManager| icon to open the :guilabel:`Data Source Manager`
   window.
#. Click on the |fileOpen| :guilabel:`Browser` tab.
#. In this tab you can see all the storage disks connected to your computer
   as well as entries for most of the tabs in the left. These allow quick access
   to connected databases or folders.

   For example, click on the drop-down icon next to the |geoPackage|
   :guilabel:`GeoPackage` entry. You'll see the :file:`training-data.gpkg` file
   we previously connected to (and its layers, if expanded).
#. Right-click the |spatialite| :guilabel:`SpatiaLite` entry and select
   :guilabel:`New Connection...`.
#. Navigate to the :file:`exercise_data` folder, select the :file:`landuse.sqlite`
   file and click :guilabel:`Open`.

   Notice that a |dbSchema| :guilabel:`landuse.sqlite` entry has
   been added under the :guilabel:`SpatiaLite` one.
#. Expand the |dbSchema| :guilabel:`landuse.sqlite` entry.
#. Double-click the |polygonLayer| :guilabel:`landuse` layer or select and
   drag-and-drop it onto the map canvas. A new layer is added to the
   :guilabel:`Layers` panel and its features are displayed on the map canvas.

   .. figure:: img/spatialite_dialog_connected.png
      :align: center

.. tip:: Enable the :guilabel:`Browser` panel in :menuselection:`View --> Panels -->`
  and use it to add your data. It's a handy shortcut for the :menuselection:`Data Source
  Manager --> Browser` tab, with the same functionality.

.. note:: Remember to save your project frequently! The project file doesn't contain any of
   the data itself, but it remembers which layers you loaded into your map.


.. _backlink-vector-load-more-data:

|moderate| |TY| Load More Vector Data
-------------------------------------------------------------------------------

Load the following datasets from the :file:`exercise_data` folder into your map
using any of the methods explained above:

* :guilabel:`buildings`
* :guilabel:`water`

:ref:`Check your results <vector-load-more-data>`

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
.. |dbSchema| image:: /static/common/mIconDbSchema.png
   :width: 1.5em
.. |fileOpen| image:: /static/common/mActionFileOpen.png
   :width: 1.5em
.. |geoPackage| image:: /static/common/mGeoPackage.png
   :width: 1.5em
.. |moderate| image:: /static/common/moderate.png
.. |newGeoPackageLayer| image:: /static/common/mActionNewGeoPackageLayer.png
   :width: 1.5em
.. |openTable| image:: /static/common/mActionOpenTable.png
   :width: 1.5em
.. |polygonLayer| image:: /static/common/mIconPolygonLayer.png
   :width: 1.5em
.. |spatialite| image:: /static/common/mIconSpatialite.png
   :width: 1.5em
