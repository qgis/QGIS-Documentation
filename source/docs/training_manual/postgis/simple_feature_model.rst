|LS| Simple Feature Model
===============================================================================

How can we store and represent geographic features in a database? In this
lesson we'll cover one approach, the Simple Feature Model as defined by the
OGC.

**The goal for this lesson:** To learn what the SFS Model is and how to use it.

What is OGC
-------------------------------------------------------------------------------

  The Open Geospatial Consortium (OGC), an international voluntary consensus
  standards organization, originated in 1994. In the OGC, more than 370+
  commercial, governmental, nonprofit and research organizations worldwide
  collaborate in an open consensus process encouraging development and
  implementation of standards for geospatial content and services, GIS data
  processing and data sharing. *- Wikipedia*

What is the SFS Model
-------------------------------------------------------------------------------

The Simple Feature for SQL (SFS) Model is a *non-topological* way to store
geospatial data in a database and defines functions for accessing, operating,
and constructing these data.

.. image:: ../_static/postgis/ogc_sfs.png
   :align: center

The model defines geospatial data from Point, Linestring, and Polygon types
(and aggregations of them to Multi objects).

For further information, have a look at the `OGC Simple Feature for SQL
<http://www.opengeospatial.org/standards/sfs>`_ standard.

Add a geometry field to table
-------------------------------------------------------------------------------

Let's add a point field to our people table:

::

  alter table people add column the_geom geometry;


.. _backlink-simple-feature-1:

Add a constraint based on geometry type
-------------------------------------------------------------------------------

You will notice that the geometry field type does not implicitly specify what
*type* of geometry for the field - for that we need a constraint.

::

  alter table people 
  add constraint people_geom_point_chk 
      check(st_geometrytype(the_geom) = 'ST_Point'::text OR the_geom IS NULL);

What does that do? It adds a constraint to the table that prevents anything
except a point geometry or a null.

Now you try:

  Create a new table called cities and give it some appropriate columns,
  including a geometry field for storing polygons (the city boundaries). Make
  sure it has a constraint enforcing geometries to be polygons.

  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |

:ref:`Check your results <simple-feature-1>`


.. _backlink-simple-feature-2:

Populate geometry_columns table
-------------------------------------------------------------------------------

At this point you should also add an entry into the :kbd:`geometry_columns`
table:

::

  insert into geometry_columns values 
    ('','public','people','the_geom',2,4326,'POINT');

Why? :kbd:`geometry_columns` is used by certain applications to be aware of
which tables in the database contain geometry data.

.. note::  If the above :kbd:`INSERT` statement causes a complaint, run this
   query first:

   ::

     select * from geometry_columns;

   If the column :kbd:`f_table_name` contains the value :kbd:`people`, then
   this table has already been registered and you don't need to do anything
   more.

The value :kbd:`2` refers to the number of dimensions; in this case, two: **x**
and **y**.

The value :kbd:`4326` refers to the projection we are using; in this case, WGS
84, which is referred to by the number 4326 (refer to the earlier discussion
about the EPSG).

  Add an appropriate geometry_columns entry for your new cities layer

  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |

:ref:`Check your results <simple-feature-2>`


.. _backlink-simple-feature-3:

Add geometry record to table using SQL
-------------------------------------------------------------------------------

Now that our tables are geo-enabled, we can store geometries in them!

::

  insert into people (name,house_no, street_id, phone_no, the_geom) 
          values ('Fault Towers',
                   34,
                   3,
                   '072 812 31 28', 
                   'SRID=4326;POINT(33 -33)');

.. note::  In the new entry above, you will need to specify which projection
   (SRID) you want to use. This is because you entered the geometry of the new
   point using a plain string of text, which does not automatically add the
   correct projection information. Obviously, the new point needs to use the
   same SRID as the dataset it is being added to, so you need to specify it.

   If at this point you were using a graphical interface, for example,
   specifying the projection for each point would be automatic. In other words,
   you usually won't need to worry about using the correct projection for every
   point you want to add if you've already specified it for that dataset, as we
   did earlier.

Now is probably a good time to fire up QGIS and try to view your :kbd:`people`
table. Also, we should try editing / adding / deleting records and then
performing select queries in the database to see how the data has changed.

To load a PostGIS layer in QGIS, use the :menuselection:`Layer --> Add PostGIS
Layers` menu option or toolbar button:

.. image:: ../_static/postgis/001.png
   :align: center

This will open the dialog:

.. image:: ../_static/postgis/002.png
   :align: center

Click on the :guilabel:`New` button to open this dialog:

.. image:: ../_static/postgis/003.png
   :align: center

Then define a new connection, e.g.:

::

  Name: myPG
  Service:
  Host: localhost
  Port: 5432
  Database: address
  User:
  Password:

To see whether QGIS has found the :kbd:`address` database and that your
username and password are correct, click :guilabel:`Test Connect`. If it works,
check the boxes next to :guilabel:`Save Username` and :guilabel:`Save
Password`. Then click :guilabel:`OK` to create this connection.

Back in the :guilabel:`Add PostGIS Layers` dialog, click :guilabel:`Connect`
and add layers to your project as usual.
 
  Formulate a query that shows a person's name, street name and position 
  (from the the_geom column) as plain text.

  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |
  |

:ref:`Check your results <simple-feature-3>`

|IC|
-------------------------------------------------------------------------------

You have seen how to add spatial objects to your database and view them in GIS
software.

|WN|
-------------------------------------------------------------------------------

Next you'll see how to import data into, and export data from, your database.
