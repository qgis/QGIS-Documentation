|LS| Using DB Manager to work with Spatial Databases in QGIS 
===============================================================================

We have already seen how to perform many database operations with QGIS as well 
as with other tools, but now it's time to look at the DB Manager tool which 
provides much of this same functionality as well as more management oriented
tools.

**The goal for this lesson:** To learn how to interact with spatial databases 
using the QGIS DB Manager. 

Managing PostGIS Databases with DB Manager
-------------------------------------------------------------------------------

You should first open the DB Manager interface by selecting :guilabel:`Database
--> DB Manager --> DB Manager` on the menu or by selecting the DB Manager icon
on the toolbar.

.. image:: /static/training_manual/databases/007.png
   :align: center

You should already see the previous connections we have configured and be able
to expand the :kbd:`myPG` section and its :kbd:`public` schema to see the
tables we have worked with in previous sections.

The first thing you may notice is that you can now see some metadata about the
Schemas contained in your database. 

.. image:: /static/training_manual/databases/008.png
   :align: center

Schemas are a way of grouping data tables and other objects in a PostgreSQL 
database and a container for permissions and other constraints. Managing 
PostgreSQL schemas is beyond the scope of this manual, but you can find 
more information about them in the `PostgreSQL  documentation 
<http://www.postgresql.org/docs/9.1/static/ddl-schemas.html>`_.
You can use the DB Manager to create new Schemas, but will need to use a tool
like pgAdmin III or the command line interface to manage them effectively.

DB Manager can also be used to manage the tables within your database. We have
already looked at various ways to create and manage tables on the command line,
but now lets look at how to do this in DB Manager.

First, its useful to just look at a tables metadata by clicking on its name in
tree and looking in the :guilabel:`Info` tab.

.. image:: /static/training_manual/databases/009.png
   :align: center

In this panel you can see the :guilabel:`General Info` about the table as well
the information that the PostGIS extension maintains about the geometry and
spatial reference system. 

If you scroll down in the :guilabel:`Info` tab, you can see more information
about the :guilabel:`Fields`, :guilabel:`Constraints` and :guilabel:`Indexes`
for the table you are viewing.

.. image:: /static/training_manual/databases/010.png
   :align: center

Its also very useful to use DB Manager to simply look at the records in the
database in much the same way you might do this by viewing the attribute table
of a layer in the Layer Tree. You can browse the data by selecting the 
:guilabel:`Table` tab.

.. image:: /static/training_manual/databases/011.png
   :align: center

There is also a :guilabel:`Preview` tab which will show you the layer data in
a map preview.

Right Clicking on a layer in the tree and clicking :guilabel:`Add to Canvas`
will add this layer to your map.

So far we have only been viewing the database its schemas and tables and their
metadata, but what if we wanted to alter the table to add an additional column
perhaps? DB Manager allows you to do this directly. 

* Select the table you want to edit in the tree
* Select :guilabel:`Table --> Edit Table` from the menu to open the :guilabel:`
  Table Properties` dialog.

.. image:: /static/training_manual/databases/012.png
   :align: center

You can use this dialog to Add Columns, Add geometry columns, edit existing
columns or to remove a column completely.

Using the :guilabel:`Constraints` tab, you can manage which fields are used as
the primary key or to drop existing constraints.

.. image:: /static/training_manual/databases/013.png
   :align: center

The :guilabel`Indexes` tab can be used to add and delete both spatial and normal
indexes.

.. image:: /static/training_manual/databases/014.png
   :align: center
 
Follow Along: Creating a New Table
-------------------------------------------------------------------------------

Database Administration

 - Vaccum Analyze
 - Versioning

Managing Spatialite Databases with DB Manager
-------------------------------------------------------------------------------

Executing SQL Queries with DB Manager
-------------------------------------------------------------------------------

Importing Data into a Database with DB Manager
-------------------------------------------------------------------------------

Exporting Data from a Database with DB Manager
-------------------------------------------------------------------------------

|IC|
-------------------------------------------------------------------------------

|WN|
-------------------------------------------------------------------------------

