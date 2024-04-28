Lesson: Using DB Manager to work with Spatial Databases in QGIS
===============================================================================

We have already seen how to perform many database operations with
QGIS as well as with other tools, but now it's time to look at the DB
Manager tool which provides much of this same functionality as well
as more management oriented tools.


**The goal for this lesson:** To learn how to interact with spatial
databases using the QGIS DB Manager. 

:abbr:`★☆☆ (Basic level)` Follow Along: Managing PostGIS Databases with DB Manager
------------------------------------------------------------------------------------

You should first open the DB Manager interface by selecting
:menuselection:`Database --> DB Manager --> DB Manager` on the menu
or by selecting the |dbManager| :sup:`DB Manager` icon on the toolbar.

You should already see the previous connections we have configured
and be able to expand the ``myPG`` section and its ``public`` schema
to see the tables we have worked with in previous sections.

The first thing you may notice is that you can now see some metadata
about the Schemas contained in your database. 

.. figure:: img/db_manager_dialog.png
   :align: center

Schemas are a way of grouping data tables and other objects in a
PostgreSQL database and a container for permissions and other constraints.
Managing PostgreSQL schemas is beyond the scope of this manual, but
you can find more information about them in the
`PostgreSQL documentation on Schemas
<https://www.postgresql.org/docs/9.1/ddl-schemas.html>`_.
You can use the DB Manager to create new Schemas, but will need to
use a tool like pgAdmin III or the command line interface to manage
them effectively.

DB Manager can also be used to manage the tables within your
database.
We have already looked at various ways to create and manage tables on
the command line, but now lets look at how to do this in DB Manager.

First, its useful to just look at a table's metadata by clicking on
its name in tree and looking in the :guilabel:`Info` tab.

.. figure:: img/table_info.png
   :align: center

In this panel you can see the :guilabel:`General Info` about the
table as well the information that the PostGIS extension maintains
about the geometry and spatial reference system. 

If you scroll down in the :guilabel:`Info` tab, you can see more
information about the :guilabel:`Fields`, :guilabel:`Constraints`
and :guilabel:`Indexes` for the table you are viewing.

.. figure:: img/table_info_fields.png
   :align: center

Its also very useful to use DB Manager to simply look at the records
in the database in much the same way you might do this by viewing the
attribute table of a layer in the Layer Tree.
You can browse the data by selecting the :guilabel:`Table` tab.

.. figure:: img/table_panel.png
   :align: center

There is also a :guilabel:`Preview` tab which will show you the layer
data in a map preview.

Right-clicking on a layer in the tree and clicking
:guilabel:`Add to Canvas` will add this layer to your map.

So far we have only been viewing the database its schemas and tables
and their metadata, but what if we wanted to alter the table to add
an additional column perhaps?
DB Manager allows you to do this directly. 

#. Select the table you want to edit in the tree
#. Select :menuselection:`Table --> Edit Table` from the menu, to open
   the :guilabel:`Table Properties` dialog.

   .. figure:: img/edit_table.png
      :align: center

You can use this dialog to Add Columns, Add geometry columns, edit
existing columns or to remove a column completely.

Using the :guilabel:`Constraints` tab, you can manage which fields
are used as the primary key or to drop existing constraints.

.. figure:: img/constraints_panel.png
   :align: center

The :guilabel:`Indexes` tab can be used to add and delete both
spatial and normal indexes.

.. figure:: img/indexes_panel.png
   :align: center
 
:abbr:`★☆☆ (Basic level)` Follow Along: Creating a New Table
-------------------------------------------------------------------------------

Now that we have gone through the process of working with existing
tables in our database, let's use DB Manager to create a new table.

#. If it is not already open, open the DB Manager window, and expand
   the tree until you see the list of tables already in your database.
#. From the menu select :guilabel:`Table --> Create Table` to bring up
   the Create Table dialog.
#. Use the default ``Public`` schema and name the table ``places``.
#. Add the ``id``, ``place_name``, and ``elevation`` fields as shown
   below
#. Make sure the ``id`` field is set as the primary key.
#. Click the checkbox to :guilabel:`Create geometry column` and make
   sure it is
   set to a ``POINT`` type and leave it named ``geom`` and specify
   ``4326`` as the :guilabel:`SRID`.
#. Click the checkbox to :guilabel:`Create spatial index` and click
   :guilabel:`Create` to create the table.

   .. figure:: img/create_table.png
      :align: center
 
#. Dismiss the dialog letting you know that the table was created and
   click :guilabel:`Close` to close the Create Table Dialog.

You can now inspect your table in the DB Manager and you will of
course find that there is no data in it.
From here you can :guilabel:`Toggle Editing` on the layer menu and
begin to add places to your table.

:abbr:`★☆☆ (Basic level)` Follow Along: Basic Database Administration
-------------------------------------------------------------------------------

The DB Manager will also let you do some basic database
administration tasks. 
It is certainly not a substitute for a more complete database
administration tool, but it does provide some functionality that you
can use to maintain your database. 

Database tables can often become quite large and tables which are
being modified frequently can end up leaving around remnants of
records that are no longer needed by PostgreSQL.
The *VACUUM* command takes care of doing a kind of garbage collection
to compact and optional analyze your tables for better performance.

Let us take a look at how we can perform a *VACUUM ANALYZE* command
from within DB Manager. 

#. Select one of your tables in the DB Manager Tree
#. Select :menuselection:`Table --> Run Vacuum Analyze` from the menu

PostgreSQL will now perform the operation.
Depending on how big your table is, this may take some time to
complete.

You can find more information about the VACUUM ANALYZE process in the
`PostgreSQL Documentation on VACUUM ANALYZE
<https://www.postgresql.org/docs/9.1/sql-vacuum.html>`_.

:abbr:`★☆☆ (Basic level)` Follow Along: Executing SQL Queries with DB Manager
-------------------------------------------------------------------------------

DB Manager also provides a way for you to write queries against your
database tables and to view the results.
We have already seen this type of functionality in the
:guilabel:`Browser` panel, but lets look at it again here with DB
Manager.

#. Select the ``lines`` table in the tree.
#. Select the :guilabel:`SQL window` button in the DB Manager toolbar.

   .. figure:: img/sql_window_btn.png
      :align: center

#. Compose the following :guilabel:`SQL query` in the space provided::

       select * from lines where roadtype = 'major';

#. Click the :guilabel:`Execute (F5)` button to run the query.
#. You should now see the records that match in the
   :guilabel:`Result` panel.

   .. figure:: img/sql_results.png
      :align: center

#. Click the checkbox for :guilabel:`Load as new layer` to add the
   results to your map.
#. Select the ``id`` column as the :guilabel:`Column with unique
   integer values` and the ``geom`` column as the
   :guilabel:`Geometry column`.
#. Enter ``roads_primary`` as the :guilabel:`Layer name (prefix)`.
#. Click :guilabel:`Load now!` to load the results as a new layer
   into your map.
 
   .. figure:: img/sql_add_to_map.png
      :align: center

The layers that matched your query are now displayed on your map.
You can of course use this query tool to execute any arbitrary SQL
command including many of the ones we looked at in previous modules
and sections.

Importing Data into a Database with DB Manager
-------------------------------------------------------------------------------

We have already looked at how to import data into a spatial database
using command line tools, so now let's learn how to use DB Manager to
do imports.

#. Click the :guilabel:`Import layer/file` button on the toolbar in
   the DB Manager dialog.

   .. figure:: img/import_layer_btn.png
      :align: center

#. Select the :file:`urban_33S.shp` file from
   :file:`exercise_data/projected_data` as the input dataset
#. Click the :guilabel:`Update Options` button to pre-fill some of
   the form values.
#. Make sure that the :guilabel:`Create new table` option is selected
#. Specify the :guilabel:`Source SRID` as ``32722`` and the
   :guilabel:`Target SRID` as ``4326``
#. Enable the checkbox to :guilabel:`Create Spatial Index`
#. Click :guilabel:`OK` to perform the import

   .. figure:: img/import_urban.png
      :align: center

#. Dismiss the dialog letting you know that the import was successful
#. Click the :guilabel:`Refresh` button on the DB Manager Toolbar

You can now inspect the table in your database by clicking on it in
the Tree.
Verify that the data has been reprojected by checking that the
:guilabel:`Spatial ref:` is listed as ``WGS 84 (4326)``.

.. figure:: img/urban_info.png
   :align: center

Right clicking on the table in the Tree and a selecting
:guilabel:`Add to Canvas` will add the table as a layer in your map.


Exporting Data from a Database with DB Manager
-------------------------------------------------------------------------------

Of course DB Manager can also be used to export data from your spatial
databases, so lets take a look at how that is done.

#. Select the ``lines`` layer in the Tree and click the
   :guilabel:`Export to File` button on the toolbar to open the
   :guilabel:`Export to vector file` dialog.
#. Click the :guilabel:`...` button to select the
   :guilabel:`Output file` and save the data to your
   :file:`exercise_data` directory as :file:`urban_4326`.
#. Set the :guilabel:`Target SRID` as ``4326``.
#. Click :guilabel:`OK` to initialize the export.

   .. figure:: img/export_to_vector.png
      :align: center

#. Dismiss the dialog letting you know the export was successful and
   close the DB Manager.

You can now inspect the shapefile you created with the Browser panel.

.. figure:: img/inspect_vector_output.png
   :align: center

In Conclusion
-------------------------------------------------------------------------------

You have now seen how to use the DB Manager interface in QGIS to
manage your spatial databases, to execute SQL queries against your
data and how to import and export data.

What's Next?
-------------------------------------------------------------------------------

Next, we will look at how to use many of these same techniques with
*SpatiaLite* databases.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |dbManager| image:: /static/common/dbmanager.png
   :width: 1.5em
