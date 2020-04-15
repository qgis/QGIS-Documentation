|LS| Adding Data to the Model
===============================================================================

The models we've created will now need to be populated with the data they're
intended to contain.

**The goal for this lesson:** To learn how to insert new data into the database
models.

Insert statement
-------------------------------------------------------------------------------

How do you add data to a table? The sql :kbd:`INSERT` statement provides the
functionality for this:

.. code-block:: sql

  insert into streets (name) values ('High street');

A couple of things to note:

* After the table name (:kbd:`streets`), you list the column names that you
  will be populating (in this case only the :kbd:`name` column).
* After the :kbd:`values` keyword, place the list of field values.
* Strings should be quoted using single quotes.
* Note that we did not insert a value for the :kbd:`id` column; this
  is because it is a sequence and will be auto-generated.
* If you do manually set the :kbd:`id`, you may cause serious problems with
  the integrity of your database.

You should see :kbd:`INSERT 0 1` if it is successful.

You can see the result of your insert action by selecting all the data in the
table:

.. code-block:: sql

  select * from streets;

Result:

.. code-block:: sql

  select * from streets;
   id |    name
  ----+-------------
    1 | High street
  (1 row)


|TY| |basic|
...............................................................................

Use the :kbd:`INSERT` command to add a new street to the :kbd:`streets` table.

:ref:`Check your results <database-concepts-6>`

.. _backlink-database-concepts-6:


Sequencing Data Addition According to Constraints
-------------------------------------------------------------------------------

|TY| |moderate|
-------------------------------------------------------------------------------

Try to add a person object to the :kbd:`people` table with the following details::

  Name: Joe Smith
  House Number: 55
  Street: Main Street
  Phone: 072 882 33 21

.. note:: Recall that in this example, we defined phone numbers as strings, not
    integers.

At this point, you should have an error report if you try to do this without
first creating a record for Main Street in the :kbd:`streets` table.

You should have also noticed that:

* You can't add the street using its name
* You can't add a street using a street :kbd:`id` before first creating the
  street record on the streets table

Remember that our two tables are linked via a Primary/Foreign Key pair. This
means that no valid person can be created without there also being a valid
corresponding street record.

Using the above knowledge, add the new person to the database.

:ref:`Check your results <database-concepts-7>`

.. _backlink-database-concepts-7:

Select data
-------------------------------------------------------------------------------

We have already shown you the syntax for selecting records. Let's look at a few
more examples:

.. code-block:: sql

  select name from streets;


.. code-block:: sql

  select * from streets;

.. code-block:: sql

  select * from streets where name='Main Road';

In later sessions we will go into more detail on how to select and filter data.

Update data
-------------------------------------------------------------------------------

What if you want to make a change to some existing data? For example, a street
name is changed:

.. code-block:: sql

  update streets set name='New Main Road' where name='Main Road';

Be very careful using such update statements - if more than one record matches
your :kbd:`WHERE` clause, they will all be updated!

A better solution is to use the primary key of the table to reference the
record to be changed:

.. code-block:: sql

  update streets set name='New Main Road' where id=2;

It should return :kbd:`UPDATE 1`.

.. note::  the :kbd:`WHERE` statement criteria are case sensitive :kbd:`Main
   Road` is not the same as :kbd:`Main road`

Delete Data
-------------------------------------------------------------------------------

In order to delete an object from a table, use the :kbd:`DELETE` command:

.. code-block:: sql

  delete from people where name = 'Joe Smith';

Let's look at our people table now:

.. code-block:: sql

  address=# select * from people;

    id | name | house_no | street_id | phone_no
   ----+------+----------+-----------+----------
  (0 rows)

|TY| |hard|
-------------------------------------------------------------------------------

Use the skills you have learned to add some new friends to your database:

.. code-block:: sql

         name       | house_no | street_id |   phone_no
   -----------------+----------+-----------+--------------
   Joe Bloggs       |        3 |         2 | 072 887 23 45
   Jane Smith       |       55 |         3 | 072 837 33 35
   Roger Jones      |       33 |         1 | 072 832 31 38
   Sally Norman     |       83 |         1 | 072 932 31 32


|IC|
-------------------------------------------------------------------------------

Now you know how to add new data to the existing models you created previously.
Remember that if you want to add new kinds of data, you may want to modify
and/or create new models to contain that data.

|WN|
-------------------------------------------------------------------------------

Now that you've added some data, you'll learn how to use queries to access this
data in various ways.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |TY| replace:: Try Yourself
.. |WN| replace:: What's Next?
.. |basic| image:: /static/common/basic.png
.. |hard| image:: /static/common/hard.png
.. |moderate| image:: /static/common/moderate.png
