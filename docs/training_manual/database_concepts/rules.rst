Lesson: Rules
===============================================================================

Rules allow the "query tree" of an incoming query to be rewritten. One common
usage is to implement views, including updatable view. *- Wikipedia*

**The goal for this lesson:** To learn how to create new rules for the
database.

Creating a logging rule
-----------------------

Say you want to log every change of phone_no in your people table in to a
people_log table. So you set up a new table:

.. code-block:: sql

  create table people_log (name text, time timestamp default NOW());

In the next step, create a rule that logs every change of a phone_no in the
people table into the people_log table:

.. code-block:: sql

  create rule people_log as on update to people
    where NEW.phone_no <> OLD.phone_no
    do insert into people_log values (OLD.name);

To test that the rule works, let's modify a phone number:

.. code-block:: sql

  update people set phone_no = '082 555 1234' where id = 2;

Check that the :kbd:`people` table was updated correctly:

.. code-block:: sql

    select * from people where id=2;

     id |    name    | house_no | street_id |   phone_no
    ----+------------+----------+-----------+--------------
      2 | Joe Bloggs |        3 |         2 | 082 555 1234
    (1 row)

Now, thanks to the rule we created, the :kbd:`people_log` table will look like
this:

.. code-block:: sql

    select * from people_log;

        name    |            time
    ------------+----------------------------
     Joe Bloggs | 2014-01-11 14:15:11.953141
    (1 row)

.. note::  The value of the :kbd:`time` field will depend on the current date
   and time.

In Conclusion
-------------------------------------------------------------------------------

Rules allow you to automatically add or change data in your database to reflect
changes in other parts of the database.

What's Next?
-------------------------------------------------------------------------------

The next module will introduce you to Spatial Database using PostGIS,
which takes these database concepts and applies them to GIS data.
