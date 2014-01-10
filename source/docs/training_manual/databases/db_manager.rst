|LS| Using DB Manager to work with Spatial Databases in QGIS 
===============================================================================

We have already seen how to perform many database operations with QGIS as well 
as with other tools, but now it's time to look at the DB Manager tool which 
provides much of this same functionality as well as more management oriented
tools.

**The goal for this lesson:** To learn how to interact with spatial databases 
using the QGIS DB Manager. 

|basic| |FA| Managing PostGIS Databases with DB Manager
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
 
|basic| |FA| Creating a New Table
-------------------------------------------------------------------------------

Now that we have gone through the process of working with existing tables in 
our database, let's use DB Manager to create a new table.

* If it is not already open, open the DB Manager window, and expand the tree
  until you see the list of tables already in your databse.
* From the menu select :guilabel:`Table --> Create Table` to bring up the 
  Create Table dialog.
* Use the default :kbd:`Public` schema and name the table :kbd:`places`.
* Add the :kbd:`id`, :kbd:`place_name`, and :kbd:`elevation` fields as shown
  below
* Make sure the :kbd:`id` field is set as the primary key.
* Click the checkbox to :guilabel:`Create geometry column` and make sure it is
  set to a :kbd:`POINT` type and leave it named :kbd:`geom` and specify
  :kbd:`4326` as the :guilabel:`SRID`.
* Click the checkbox to :guilabel:`Create spatial index` and click
  :guilabel:`Create` to create the table.

.. image:: /static/training_manual/databases/015.png
   :align: center
 
* Dismiss the dialog letting you know that the table was created and click
  :guilabel:`Close` to close the Create Table Dialog.

You can now inspect your table in the DB Manager and you will of course find
that there is no data in it. From here you can :guilabel:`Toggle Editing` on
the layer menu and begin to add places to your table.

|basic| |FA| Basic Database Administration
-------------------------------------------------------------------------------

The DB Manager will also let you do some basic Database Administration tasks. 
It is certainly not a substitute for a more complete Database Administration
tool, but it does provide some functionality that you can use to maintain your
database. 

Database tables can often become quite large and tables which are being
modified frequently can end up leaving around remnants of records that are no 
longer needed by PostgreSQL. The *VACUUM* command takes care of doing a kind of
garbage collection to compact and optionall analyze your tables for better
performance.

Lets take a look at how we can perform a *VACUUM ANALYZE* command from within
DB Manager. 

* Select one of your tables in the DB Manager Tree.
* Select :guilabel:`Table --> Run Vacuum Analyze` from the menu.

Thats it! PostgreSQL will perform the operation. Depending on how big your
table is, this may take some time to complete.

You can find more information about the VACUUM ANALYZE process in the
`PostgreSQL Documentation 
<http://www.postgresql.org/docs/9.1/static/sql-vacuum.html>`_ 

|basic| |FA| Executing SQL Queries with DB Manager
-------------------------------------------------------------------------------

DB Manager also provides a way for you to write queries against your database
tables and to view the results. We have already seen this type of functionality
in the :guilabel:`Browser` panel, but lets look at it again here with DB
Manager.

* Select the :kbd:`roads` table in the tree.
* Select the :guilabel:`SQL window` button in the DB Manager toolbar.

.. image:: /static/training_manual/databases/016.png
   :align: center

* Compose the following :guilabel:`SQL query` in the space provided.

::

   select * from roads where highway = 'primary';

* Click the :guilabel:`Execute (F5)` button to run the query.
* You should now see the records that match in the :guilabel:`Result` panel.

.. image:: /static/training_manual/databases/017.png
   :align: center

* Click the checkbox for :guilabel:`Load as new layer` to add the results to your map.
* Select the :kbd:`id` column as the :guilabel:`Column with unique integer
  values` and the :kbd:`geom` colum as the :guilabel:`Geometry column`.
* Enter :kbd:`roads_primary` as the :guilabel:`Layer name (prefix)`.
* Click :guilabel:`Load now!` to load the results as a new layer into your map.
 
.. image:: /static/training_manual/databases/018.png
   :align: center

The layers that matched your query are now displayed on your map. You can of
course use this query tool to execute any arbitrary SQL command including many
of the ones we looked at in previous modules and sections.

Importing Data into a Database with DB Manager
-------------------------------------------------------------------------------

Exporting Data from a Database with DB Manager
-------------------------------------------------------------------------------

|IC|
-------------------------------------------------------------------------------

|WN|
-------------------------------------------------------------------------------

