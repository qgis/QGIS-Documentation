|LS| Adding data from databases to a QGIS Map 
===============================================================================

In the previous 2 modules we looked at the basic concepts, features and 
functions of relational databases as well as extensions that let us store, 
manage, query and manipulate spatial data in a relational database. This
section will dive deeper into how to effectively use spatial databases in QGIS. 

**The goal for this lesson:** To learn how to interact with spatial databases 
in the QGIS interface. 

Adding Database Tables to QGIS using the Browser
-------------------------------------------------------------------------------

We have already briefly looked at how to add tables from a database as QGIS 
layers, now lets look at this in a bit more detail and look at the different 
ways this can be done in QGIS. Lets start by looking at the new Browser
interface.

* Start a new empty map in QGIS.
* Open the Browser by clicking the :guilabel:`Browser tab at the bottom of the
  *Layer Panel*
* Open the PostGIS portion of the tree and you should find your previously
  configured connection available.

.. image:: /static/training_manual/databases/001.png
   :align: center

* Double clicking on any of the table/layers listed here will add it to the Map
  Canvas.

* Right Clicking on a table/layer in this view will give you a few options.
  Click on the :guilabel:`Properties` item to look at the properties of the 
  layer.

.. image:: /static/training_manual/databases/002.png
   :align: center


.. note:: Of course you can also use this interface to connect to PostGIS 
   databases hosted on a server external to your workstation. Right clicking
   on the PostGIS entry in the tree will allow you to specify connection
   paramaters for a new connection.

Creating a Spatialite database with the Browser
-------------------------------------------------------------------------------

While PostGIS is generally used on a server to provide spatial database
capabilities to multiple users at the same time, QGIS also supports the use of
a file format called spatialite that is a lightweight, portable way to 
store an entire spatial database in a single file. Obviously, these 2 types of
spatial databases should be used for different purposes, but the same basic
principles and techniques apply to both. Let's create a new spatialite database
and explore the functionality provided to work with these databases in QGIS.

* Right click on the :guilabel:`Spatialite` entry in the Browser tree and
  select :guilabel:`Create Database`.
* Specify where on your filesystem you want to store the file and name it 
  :kbd:`qgis-sl.db`.
* Again right click on the :guilabel:`Spatialite` entry in the Browser tree and
  now select the :guilabel:`New Connection` item. Find the file you created in
  the last step and open it.

Now that you have configured your new database you will find that the entry in
Browser tree has nothing underneath of it and the only thing you can do at this
point is to delete the connection. This is of course because we havent added
any tables to this database. Lets go ahead and do that.

* Find the button to create a new layer and use the dropdown to create a new 
  new Spatialite layer, or select :guilabel:`Layer --> New --> New Spatialite
  Layer`. 

.. image:: /static/training_manual/databases/003.png
   :align: center

* Select the database we created in the previous steps in the drop down.
* Give the table the name :kbd:`places` and leave the geometry column name as
  is, the geometry type as Point and the CRS as is.
* Tick the checkbox next to :guilabel:`Create an autoincrementing primary key`.
* Add 2 attributes as shown in below
* Click :guilabel:`OK` to create the table.

.. image:: /static/training_manual/databases/004.png
   :align: center

* Click the refresh button at the top of the Browser and you should now see
  your :kbd:`places` table listed.

.. image:: /static/training_manual/databases/005.png
   :align: center

* You can right click on the table and view its properties as we did in the
  previous exercise. 

From here you can start an editing session and start adding data to your new
database directly. We will learn about importing data into databases using 
the DB Manager in a section coming up.

Adding a filtered set of records as a Layer
-------------------------------------------------------------------------------

Now that we have seen how to add an entire table as a QGIS layer it might be
nice to learn how to add a filtered set of records from a table as a layer 
by using queries that we learned about in previous sections.

Since we didnt actually add any data to our Spatialite database, lets use the
PostGIS database we already created for this section.

* Start a new empty map with no layers
* Click the :guilabel:`Add PostGIS Layers` button or select :guilabel:`Layer
  --> Add PostGIS Layers` from the menu.
* In the :guilabel:`Add PostGIS Table(s)` dialog that comes up, connect to the
  :kbd:`MyPG` connection that we setup previously.
* Expand the :kdb:`public schema` and you should find the 2 tables we were
  working with previously.
* Click the :kbd:`roads` layer to select it, but instead of adding it, click
  the :guilabel:`Set Filter` button to bring up the :guilabel:`Query Builder`
  dialog. 
* Construct the following expression using the buttons or by entering it directly.

::

  "highway" = 'primary'

.. image:: /static/training_manual/databases/006.png
   :align: center

* Click :guilabel:`OK` to complete editing the filter and click :guilabel:`Add`
  to add the filtered layer to your map.
* Rename the :kbd:`roads` layer in the tree to :kbd:`roads_primary`.

You will notice that only the Primary Roads have been added to your map rather
than the entire layer.

|IC|
-------------------------------------------------------------------------------

You have seen how to interact with spatial databases using the QGIS Browser and 
how to add layers to your map based on a query filter.

|WN|
-------------------------------------------------------------------------------

Next you'll see how to work with the DB Manager interface in QGIS for a more
complete set of database management tasks.
