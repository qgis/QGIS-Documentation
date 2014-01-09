|LS| Rules
===============================================================================

  Rules allow the "query tree" of an incoming query to be rewritten. One common
  usage is to implement views, including updatable view. *- Wikipedia*

**The goal for this lesson:** To learn how to create new rules for the
database.

Materialised Views (Rule based views)
-------------------------------------------------------------------------------

Say you want to log every change of phone_no in your people table in to a
people_log table. So you set up a new table

::

  create table people_log (name text, time timestamp default NOW());

In the next step create a rule, that logs every change of a phone_no in the
people table into the people_log table:

::

  create rule people_log as on update to people
    where NEW.phone_no <> OLD.phone_no
    do insert into people_log values (OLD.name);

To test that the rule works, let's modify a phone number:

::

  update people set phone_no = '082 555 1234' where id = 2;

Check that the table was updated correctly:

::
  
    id |    name    | house_no | street_id |   phone_no   
   ----+------------+----------+-----------+--------------
     2 | Joe Bloggs |        3 |         2 | 082 555 1234
   (1 row)

Now, thanks to the rule we created, the :kbd:`people_log` table will look like
this:

::
  
      name    |            time            
  ------------+----------------------------
   Joe Bloggs | 2012-04-23 15:20:56.683382
  (1 row)

.. note::  The value of the :kbd:`time` field will depend on the current date
   and time.

|IC|
-------------------------------------------------------------------------------

Rules allow you to automatically add or change data in your database to reflect
changes in other parts of the database.

|WN|
-------------------------------------------------------------------------------

The next module will introduce you to PostGIS, which takes these database
concepts and applies them to GIS data.
