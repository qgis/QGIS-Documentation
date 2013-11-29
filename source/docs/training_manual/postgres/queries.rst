|LS| Queries
===============================================================================

When you write a :kbd:`SELECT ...` command it is commonly known as a query -
you are interrogating the database for information.

**The goal of this lesson:** To learn how to create queries that will return
useful information.

Follow-up from previous lesson
-------------------------------------------------------------------------------

Let's check that you added a few people to the database successfully:

::

  insert into people (name,house_no, street_id, phone_no) 
              values ('Joe Bloggs',3,1,'072 887 23 45');
  insert into people (name,house_no, street_id, phone_no) 
              values ('IP Knightly',55,1,'072 837 33 35');
  insert into people (name,house_no, street_id, phone_no) 
              values ('Rusty Bedsprings',33,1,'072 832 31 38');
  insert into people (name,house_no, street_id, phone_no) 
              values ('QGIS Geek',83,1,'072 932 31 32');

Ordering results
-------------------------------------------------------------------------------

Let's get a list of people ordered by their house numbers:

::

  select name, house_no from people order by house_no;

Result:

::

         name       | house_no 
  ------------------+----------
   Joe Bloggs       |        3
   Rusty Bedsprings |       33
   IP Knightly      |       55
   QGIS Geek        |       83
  (4 rows)

You can sort by more than one column:

::

  select name, house_no from people order by name, house_no;

Result:

::

         name       | house_no 
  ------------------+----------
   IP Knightly      |       55
   Joe Bloggs       |        3
   QGIS Geek        |       83
   Rusty Bedsprings |       33
  (4 rows)

Filtering
-------------------------------------------------------------------------------

Often you won't want to see every single record in the database - especially if
there are thousands of records and you are only interested in seeing one or
two. Never fear, you can filter the results!

Here is an example of a numerical filter:

::

  address=# select name, house_no from people where house_no < 50;
         name       | house_no 
  ------------------+----------
   Joe Bloggs       |        3
   Rusty Bedsprings |       33
  (2 rows)

You can combine filters (defined using the :kbd:`WHERE` clause) with sorting
(defined using the :kbd:`ORDER BY`)

::

  address=# select name, house_no from people where house_no < 50 order by
  address-# house_no;
         name       | house_no 
  ------------------+----------
   Joe Bloggs       |        3
   Rusty Bedsprings |       33
  (2 rows)

You can also filter based on text data:

::

  address=# select name, house_no from people where name like '%i%';
         name       | house_no 
  ------------------+----------
   IP Knightly      |       55
   Rusty Bedsprings |       33
  (2 rows)

Here we used the :kbd:`LIKE` clause to find all names with an :kbd:`i` in them.
If you want to search for a string of letters regardless of case, you can do a
case insensitive search using the :kbd:`ILIKE` clause:

::

  address=# select name, house_no from people where name ilike '%k%';
      name     | house_no 
  -------------+----------
   IP Knightly |       55
   QGIS Geek   |       83
  (2 rows)

That found everyone with a :kbd:`k` or :kbd:`K` in their name. Using the normal
:kbd:`ILIKE` clause, you'd get:

::

  address=# select name, house_no from people where name like '%k%';
      name    | house_no 
   -----------+----------
    QGIS Geek |       83
    (1 row)

Joins
-------------------------------------------------------------------------------

What if you want to see the person's details and their street name (not its
id)? In order to do that, you need to join the two tables together in a single
query. Lets look at an example:

::

  select people.name, house_no, streets.name
  from people,streets
  where people.street_id=streets.id;

.. note::  With joins, you will always state the two tables the information is
   coming from, in this case people and streets.  You also need to specify
   which two keys must match (foreign key & primary key). If you don't specify
   that, you will get a list of all possible combinations of people and
   streets, but no way to know who actually lives on which street!

Here is what the correct output will look like:

::

         name       | house_no |    name     
  ------------------+----------+-------------
   Joe Bloggs       |        3 | High street
   IP Knightly      |       55 | High street
   Rusty Bedsprings |       33 | High street
   QGIS Geek        |       83 | High street
  (4 rows)

We will revisit joins as we create more complex queries later. Just remember
they provide a simple way to combine the information from two or more tables.

Subselect
-------------------------------------------------------------------------------

First, let's do a little tweaking to our data:

::

  insert into streets (name) values('QGIS Road');
  insert into streets (name) values('OGR Corner');
  insert into streets (name) values('Goodle Square');
  update people set street_id = 2 where id=2;
  update people set street_id = 3 where id=3;

Let's take a quick look at our data after those changes - we reuse our query
from the previous section:

::

  select people.name, house_no, streets.name
  from people,streets
  where people.street_id=streets.id;

Result:

::

         name       | house_no |      name       
  ------------------+----------+-----------------
   Rusty Bedsprings |       33 | High street
   QGIS Geek        |       83 | High street
   Joe Bloggs       |        3 | New Main Street
   IP Knightly      |       55 | QGIS Road
  (4 rows)

Now let's show you a subselection on this data. We want to show only people who
live in :kbd:`street_id` number :kbd:`1`.

::

  select people.name 
  from people, (
      select * 
      from streets 
      where id=1
    ) as streets_subset 
  where people.street_id = streets_subset.id;

Result:

::

         name       
  ------------------
   Rusty Bedsprings
   QGIS Geek
  (2 rows)

This is a contrived example and in the above situations it may have been
overkill. However when you have to filter based on a selection, subselects are
really useful!

Aggregate Queries
-------------------------------------------------------------------------------

One of the powerful features of a database is its ability to summarise the data
in its tables. These summaries are called aggregate queries. Here is a typical
example:

::

  select count(*) from people;

Result:

::

   count 
  -------
       4
  (1 row)

If we want the counts summarised by street name we can do this:

::

  select count(name), street_id 
  from people 
  group by street_id;

Result:

::

   count | street_id 
  -------+-----------
       1 |         2
       1 |         3
       2 |         1
  (3 rows)

.. note::  Because there is no :kbd:`ORDER BY` clause, on your computer these
   data may not be in the same order as shown here.

Exercise:

  Summarise the people by street name and show the actual street names instead of
  the street_id's

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

Solution:

::

  select count(people.name), streets.name 
  from people, streets 
  where people.street_id=streets.id 
  group by streets.name;

Result:

::

   count |      name       
  -------+-----------------
       1 | New Main Street
       2 | High street
       1 | QGIS Road
  (3 rows)

.. note::  You will notice that we have prefixed field names with table names
   (e.g. people.name and streets.name). This needs to be done whenever the
   field name is ambiguous.

|IC|
-------------------------------------------------------------------------------

You've seen how to use queries to return the data in your database in a way
that allows you to extract useful information from it. 

|WN|
-------------------------------------------------------------------------------

Next you'll see how to create views from the queries that you've written.
