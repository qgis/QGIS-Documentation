Lesson: Queries
===============================================================================

When you write a :kbd:`SELECT ...` command it is commonly known as a query -
you are interrogating the database for information.

**The goal of this lesson:** To learn how to create queries that will return
useful information.

.. note:: If you did not do so in the previous lesson, add the following people
  objects to your :kbd:`people` table. If you receive any errors related to
  foreign key constraints, you will need to add the 'Main Road' object to your
  streets table first

.. code-block:: sql

    insert into people (name,house_no, street_id, phone_no)
              values ('Joe Bloggs',3,2,'072 887 23 45');
    insert into people (name,house_no, street_id, phone_no)
              values ('Jane Smith',55,3,'072 837 33 35');
    insert into people (name,house_no, street_id, phone_no)
              values ('Roger Jones',33,1,'072 832 31 38');
    insert into people (name,house_no, street_id, phone_no)
              values ('Sally Norman',83,1,'072 932 31 32');


Ordering Results
-------------------------------------------------------------------------------

Let's retrieve a list of people ordered by their house numbers:

.. code-block:: sql

  select name, house_no from people order by house_no;

Result:

.. code-block:: sql

         name     | house_no
    --------------+----------
     Joe Bloggs   |        3
     Roger Jones  |       33
     Jane Smith   |       55
     Sally Norman |       83
    (4 rows)

You can sort the results by the values of more than one column:

.. code-block:: sql

	select name, house_no from people order by name, house_no;

Result:

.. code-block:: sql

         name     | house_no
    --------------+----------
     Jane Smith   |       55
     Joe Bloggs   |        3
     Roger Jones  |       33
     Sally Norman |       83
    (4 rows)


Filtering
-------------------------------------------------------------------------------

Often you won't want to see every single record in the database - especially if
there are thousands of records and you are only interested in seeing one or
two.

Here is an example of a numerical filter which only returns objects whose
``house_no`` is less than 50:

.. code-block:: sql

  select name, house_no from people where house_no < 50;

        name     | house_no
    -------------+----------
     Joe Bloggs  |        3
     Roger Jones |       33
    (2 rows)

You can combine filters (defined using the ``WHERE`` clause) with sorting
(defined using the ``ORDER BY`` clause):

.. code-block:: sql

  select name, house_no from people where house_no < 50 order by house_no;

        name     | house_no
    -------------+----------
     Joe Bloggs  |        3
     Roger Jones |       33
    (2 rows)

You can also filter based on text data:

.. code-block:: sql

  select name, house_no from people where name like '%s%';

        name     | house_no
    -------------+----------
     Joe Bloggs  |        3
     Roger Jones |       33
    (2 rows)

Here we used the :kbd:`LIKE` clause to find all names with an :kbd:`s` in them.
You'll notice that this query is case-sensitive, so the :kbd:`Sally Norman` entry
has not been returned.

If you want to search for a string of letters regardless of case, you can do a
case in-sensitive search using the :kbd:`ILIKE` clause:

.. code-block:: sql

  select name, house_no from people where name ilike '%r%';

         name     | house_no
    --------------+----------
     Roger Jones  |       33
     Sally Norman |       83
    (2 rows)

That query returned every **people** object with an :kbd:`r` or :kbd:`R` in their
name.

Joins
-------------------------------------------------------------------------------

What if you want to see the person's details and their street's name instead of
the ID? In order to do that, you need to join the two tables together in a single
query. Lets look at an example:

.. code-block:: sql

  select people.name, house_no, streets.name
  from people,streets
  where people.street_id=streets.id;

.. note::  With joins, you will always state the two tables the information is
   coming from, in this case people and streets. You also need to specify
   which two keys must match (foreign key & primary key). If you don't specify
   that, you will get a list of all possible combinations of people and
   streets, but no way to know who actually lives on which street!

Here is what the correct output will look like:

.. code-block:: sql

         name     | house_no |    name
    --------------+----------+-------------
     Joe Bloggs   |        3 | Low Street
     Roger Jones  |       33 | High street
     Sally Norman |       83 | High street
     Jane Smith   |       55 | Main Road
    (4 rows)

We will revisit joins as we create more complex queries later. Just remember
they provide a simple way to combine the information from two or more tables.

Sub-Select
-------------------------------------------------------------------------------

Sub-selections allow you to select objects from one table based on the data
from another table which is linked via a foreign key relationship. In our case,
we want to find people who live on a specific street.

First, let's do a little tweaking of our data:

.. code-block:: sql

  insert into streets (name) values('QGIS Road');
  insert into streets (name) values('OGR Corner');
  insert into streets (name) values('Goodle Square');
  update people set street_id = 2 where id=2;
  update people set street_id = 3 where id=3;

Let's take a quick look at our data after those changes: we can reuse our query
from the previous section:

.. code-block:: sql

  select people.name, house_no, streets.name
  from people,streets
  where people.street_id=streets.id;

Result:

.. code-block:: sql

         name     | house_no |    name
    --------------+----------+-------------
     Roger Jones  |       33 | High street
     Sally Norman |       83 | High street
     Jane Smith   |       55 | Main Road
     Joe Bloggs   |        3 | Low Street
    (4 rows)

Now let's show you a sub-selection on this data. We want to show only people who
live in ``street_id`` number :kbd:`1`:

.. code-block:: sql

  select people.name
  from people, (
      select *
      from streets
      where id=1
    ) as streets_subset
  where people.street_id = streets_subset.id;

Result:

.. code-block:: sql

         name
    --------------
     Roger Jones
     Sally Norman
    (2 rows)

Although this is a very simple example and unnecessary with our small data-sets,
it illustrates how useful and important sub-selections can be when querying
large and complex data-sets.

Aggregate Queries
-------------------------------------------------------------------------------

One of the powerful features of a database is its ability to summarise the data
in its tables. These summaries are called aggregate queries. Here is a typical
example which tells us how many people objects are in our people table:

.. code-block:: sql

  select count(*) from people;

Result:

.. code-block:: sql

   count
  -------
       4
  (1 row)

If we want the counts to be summarised by street name we can do this:

.. code-block:: sql

  select count(name), street_id
  from people
  group by street_id;

Result:

.. code-block:: sql

     count | street_id
    -------+-----------
         2 |         1
         1 |         3
         1 |         2
    (3 rows)

.. note::  Because we have not used an :kbd:`ORDER BY` clause, the order of your
  results may not match what is shown here.

Try Yourself: :abbr:`★★☆ (Moderate level)`
...............................................................................

Summarise the people by street name and show the actual street names instead
of the street_ids.

.. admonition:: Answer
  :class: dropdown

  Here is the correct SQL statement you should use::

    select count(people.name), streets.name
    from people, streets
    where people.street_id=streets.id
    group by streets.name;

  Result::

       count |    name
       ------+-------------
           1 | Low Street
           2 | High street
           1 | Main Road
       (3 rows)

  You will notice that we have prefixed field names with table names (e.g.
  people.name and streets.name). This needs to be done whenever the field name
  is ambiguous (i.e. not unique across all tables in the database).


In Conclusion
-------------------------------------------------------------------------------

You've seen how to use queries to return the data in your database in a way
that allows you to extract useful information from it.

What's Next?
-------------------------------------------------------------------------------

Next you'll see how to create views from the queries that you've written.
