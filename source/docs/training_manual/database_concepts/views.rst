|LS| Views
===============================================================================

When you write a query, you need to spend a lot of time and effort formulating
it. With views, you can save the definition of a sql query in a reusable
'virtual table'.

**The goal for this lesson:** To save a query as a view.

Creating a View
-------------------------------------------------------------------------------

You can treat a view just like a table, but its data is sourced from a query.
Let's make a simple view based on the above.

::

  create view roads_count_v as 
    select count(people.name), streets.name 
    from people, streets where people.street_id=streets.id 
    group by people.street_id, streets.name;

As you can see the only change is the :kbd:`create view roads_count_v as` part
at the beginning. The nice thing is that we can now select data from that view:

::

  select * from roads_count_v;

Result:

::

   count |      name       
  -------+-----------------
       1 | New Main Street
       2 | High street
       1 | QGIS Road
  (3 rows)

Modifying a View
-------------------------------------------------------------------------------

A view is not fixed, and it contains no 'real data'. This means you can easily
change it without impacting on any data in your database.

::

  CREATE OR REPLACE VIEW roads_count_v AS 
    SELECT count(people.name), streets.name 
    FROM people, streets WHERE people.street_id=streets.id 
    GROUP BY people.street_id, streets.name 
    ORDER BY streets.name;

(This example also shows the best practice convention of using UPPER CASE for 
all SQL keywords.)

You will see that we have added an :kbd:`ORDER BY` clause so that our view rows
are nicely sorted:

::

   count |      name       
  -------+-----------------
       2 | High street
       1 | New Main Street
       1 | QGIS Road
  (3 rows)

Dropping a View
-------------------------------------------------------------------------------

If you no longer need a view, you can delete it like this:

::

  drop view roads_count_v;

|IC|
-------------------------------------------------------------------------------

Using views, you can save a query and access its results as if it were a table.

|WN|
-------------------------------------------------------------------------------

Sometimes, when changing data, you want your changes to have effects elsewhere
in the database. The next lesson will show you how to do this.
