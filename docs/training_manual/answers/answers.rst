Answer Sheet
===============================================================================

|RF| *Database Concepts*
-------------------------------------------------------------------------------

.. _database-concepts-1:

|basic| *Address Table Properties*
...............................................................................

For our theoretical address table, we might want to store the following
properties::

    House Number
    Street Name
    Suburb Name
    City Name
    Postcode
    Country

When creating the table to represent an address object, we would create columns
to represent each of these properties and we would name them with SQL-compliant
and possibly shortened names::

    house_number
    street_name
    suburb
    city
    postcode
    country

:ref:`Back to text <backlink-database-concepts-1>`

.. _database-concepts-2:

|basic| *Normalising the People Table*
...............................................................................

The major problem with the `people` table is that there is a single address
field which contains a person's entire address. Thinking about our theoretical
`address` table earlier in this lesson, we know that an address is made up of
many different properties. By storing all these properties in one field, we make
it much harder to update and query our data. We therefore need to split the
address field into the various properties. This would give us a table which has
the following structure::

  id |     name      | house_no |  street_name   |    city    |   phone_no
   --+---------------+----------+----------------+------------+-----------------
   1 | Tim Sutton    |     3    | Buirski Plein  | Swellendam | 071 123 123
   2 | Horst Duester |     4    | Avenue du Roix | Geneva     | 072 121 122


.. note:: In the next section, you will learn about Foreign Key relationships
  which could be used in this example to further improve our database's
  structure.

:ref:`Back to text <backlink-database-concepts-2>`

.. _database-concepts-3:

|moderate| *Further Normalisation of the People Table*
...............................................................................

Our `people` table currently looks like this::

   id |     name     | house_no | street_id |  phone_no
   ---+--------------+----------+-----------+-------------
    1 | Horst Duster |        4 |         1 | 072 121 122

The :kbd:`street_id` column represents a 'one to many' relationship between the
`people` object and the related `street` object, which is in the `streets`
table.

One way to further normalise the table is to split the name field into
*first_name* and *last_name*::

    id | first_name | last_name  | house_no | street_id |  phone_no
    ---+------------+------------+----------+-----------+------------
     1 |    Horst   |   Duster   |     4    |     1     | 072 121 122

We can also create separate tables for the town or city name and country,
linking them to our `people` table via 'one to many' relationships::

    id | first_name | last_name | house_no | street_id | town_id | country_id
    ---+------------+-----------+----------+-----------+---------+------------
     1 |    Horst   |   Duster  |     4    |     1     |    2    |     1


An ER Diagram to represent this would look like this:

.. figure:: img/er-people-normalised-example.png
   :align: center

:ref:`Back to text <backlink-database-concepts-3>`

.. _database-concepts-4:

|moderate| *Create a People Table*
...............................................................................

The SQL required to create the correct people table is::

  create table people (id serial not null primary key,
                       name varchar(50),
                       house_no int not null,
                       street_id int not null,
                       phone_no varchar null );

The schema for the table (enter :kbd:`\\d people`) looks like this::

  Table "public.people"

  Column     |         Type          |                      Modifiers
  -----------+-----------------------+-------------------------------------
  id         | integer               | not null default
             |                       | nextval('people_id_seq'::regclass)
  name       | character varying(50) |
  house_no   | integer               | not null
  street_id  | integer               | not null
  phone_no   | character varying     |
  Indexes:
    "people_pkey" PRIMARY KEY, btree (id)

.. note::  For illustration purposes, we have purposely omitted the fkey
    constraint.

:ref:`Back to text <backlink-database-concepts-4>`

.. _database-concepts-5:

|basic| *The DROP Command*
...............................................................................

The reason the DROP command would not work in this case is because the `people`
table has a Foreign Key constraint to the `streets` table. This means that
dropping (or deleting) the `streets` table would leave the `people` table with
references to non-existent `streets` data.

.. note:: It is possible to 'force' the `streets` table to be deleted by using
  the `CASCADE` command, but this would also delete the `people` and any other
  table which had a relationship to the `streets` table. Use with caution!

:ref:`Back to text <backlink-database-concepts-5>`

.. _database-concepts-6:

|basic| *Insert a New Street*
...............................................................................

The SQL command you should use looks like this (you can replace the street name
with a name of your choice)::

    insert into streets (name) values ('Low Road');

:ref:`Back to text <backlink-database-concepts-6>`

.. _database-concepts-7:

|moderate| *Add a New Person With Foreign Key Relationship*
...............................................................................

Here is the correct SQL statement::

  insert into streets (name) values('Main Road');
  insert into people (name,house_no, street_id, phone_no)
    values ('Joe Smith',55,2,'072 882 33 21');

If you look at the streets table again (using a select statement as before),
you'll see that the :kbd:`id` for the :kbd:`Main Road` entry is :kbd:`2`.

That's why we could merely enter the number :kbd:`2` above. Even though we're
not seeing :kbd:`Main Road` written out fully in the entry above, the
database will be able to associate that with the :kbd:`street_id` value of
:kbd:`2`.

.. note:: If you have already added a new :kbd:`street` object, you might find
   that the new :kbd:`Main Road` has an ID of :kbd:`3` not :kbd:`2`.

:ref:`Back to text <backlink-database-concepts-7>`

.. _database-concepts-8:


|moderate| *Return Street Names*
...............................................................................

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

.. note::  You will notice that we have prefixed field names with table names
   (e.g. people.name and streets.name). This needs to be done whenever the
   field name is ambiguous (i.e. not unique across all tables in the database).

:ref:`Back to text <backlink-database-concepts-8>`


|RF| *Spatial Queries*
-------------------------------------------------------------------------------

.. _spatial-queries-1:

|basic| *The Units Used in Spatial Queries*
...............................................................................

The units being used by the example query are degrees, because the CRS that the
layer is using is WGS 84. This is a Geographic CRS, which means that its units
are in degrees. A Projected CRS, like the UTM projections, is in meters.

Remember that when you write a query, you need to know which units the layer's
CRS is in. This will allow you to write a query that will return the results
that you expect.

:ref:`Back to text <backlink-spatial-queries-1>`


.. _spatial-queries-2:

|basic| *Creating a Spatial Index*
...............................................................................

::

  CREATE INDEX cities_geo_idx
    ON cities
    USING gist (the_geom);

:ref:`Back to text <backlink-spatial-queries-2>`


|RF| *Geometry Construction*
-------------------------------------------------------------------------------


.. _geometry-1:

|moderate| *Creating Linestrings*
...............................................................................

::

  alter table streets add column the_geom geometry;
  alter table streets add constraint streets_geom_point_chk check
       (st_geometrytype(the_geom) = 'ST_LineString'::text OR the_geom IS NULL);
  insert into geometry_columns values ('','public','streets','the_geom',2,4326,
       'LINESTRING');
  create index streets_geo_idx
    on streets
    using gist
    (the_geom);

:ref:`Back to text <backlink-geometry-1>`


.. _geometry-2:

|moderate| *Linking Tables*
...............................................................................

::

  delete from people;
  alter table people add column city_id int not null references cities(id);

(capture cities in QGIS)

::

  insert into people (name,house_no, street_id, phone_no, city_id, the_geom)
     values ('Faulty Towers',
             34,
             3,
             '072 812 31 28',
             1,
             'SRID=4326;POINT(33 33)');

  insert into people (name,house_no, street_id, phone_no, city_id, the_geom)
     values ('IP Knightly',
             32,
             1,
             '071 812 31 28',
             1,F
             'SRID=4326;POINT(32 -34)');

  insert into people (name,house_no, street_id, phone_no, city_id, the_geom)
     values ('Rusty Bedsprings',
             39,
             1,
             '071 822 31 28',
             1,
             'SRID=4326;POINT(34 -34)');

If you're getting the following error message:

::

  ERROR:  insert or update on table "people" violates foreign key constraint
          "people_city_id_fkey"
  DETAIL: Key (city_id)=(1) is not present in table "cities".

then it means that while experimenting with creating polygons for the
cities table, you must have deleted some of them and started over. Just
check the entries in your cities table and use any :kbd:`id` which exists.

:ref:`Back to text <backlink-geometry-2>`

|RF| *Simple Feature Model*
-------------------------------------------------------------------------------


.. _simple-feature-1:

|moderate| *Populating Tables*
...............................................................................

::

  create table cities (id serial not null primary key,
                       name varchar(50),
                       the_geom geometry not null);
   alter table cities
   add constraint cities_geom_point_chk
   check (st_geometrytype(the_geom) = 'ST_Polygon'::text );

:ref:`Back to text <backlink-simple-feature-1>`


.. _simple-feature-2:

|moderate| *Populate the Geometry_Columns Table*
...............................................................................

::

  insert into geometry_columns values
        ('','public','cities','the_geom',2,4326,'POLYGON');

:ref:`Back to text <backlink-simple-feature-2>`


.. _simple-feature-3:

|hard| *Adding Geometry*
...............................................................................

::

  select people.name,
         streets.name as street_name,
         st_astext(people.the_geom) as geometry
  from   streets, people
  where  people.street_id=streets.id;

Result::

         name     | street_name |   geometry
    --------------+-------------+---------------
     Roger Jones  | High street |
     Sally Norman | High street |
     Jane Smith   | Main Road   |
     Joe Bloggs   | Low Street  |
     Fault Towers | Main Road   | POINT(33 -33)
    (5 rows)

As you can see, our constraint allows nulls to be added into the database.

:ref:`Back to text <backlink-simple-feature-3>`


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |RF| replace:: Results For
.. |basic| image:: /static/common/basic.png
.. |dataDefined| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |hard| image:: /static/common/hard.png
.. |largeLandUseArea| replace:: Bontebok National Park
.. |majorUrbanName| replace:: Swellendam
.. |moderate| image:: /static/common/moderate.png
.. |openTable| image:: /static/common/mActionOpenTable.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
