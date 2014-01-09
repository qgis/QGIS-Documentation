|LS| PostGIS Setup
===============================================================================

Setting up PostGIS functions will allow you to access spatial functions from
within PostgreSQL.

**The goal for this lesson:** To install spatial functions and briefly demo
their effects.

Installing under Ubuntu
-------------------------------------------------------------------------------

Postgis is easily installed from apt.

::

  sudo apt-get install postgis 
  sudo apt-get install postgresql-9.1-postgis

Really, it's that easy...

Installing under Windows
-------------------------------------------------------------------------------

Visit `the download page <http://www.postgresql.org/download/>`_.

Now follow `this guide
<http://www.bostongis.com/PrinterFriendly.aspx?content_name=postgis_tut01>`_.

A little more complicated, but still not hard. Note that you need to be online
to install the postgis stack.

Install plpgsql
-------------------------------------------------------------------------------

.. note::  You can ensure that any database created on your system automatically
   gets these spatial extensions by running these commands (from this and the
   next two sections) on the :kbd:`template1` system database *before* you
   create any of your own databases.

PostgreSQL can use various procedural languages. What is a procedural language?
It is an 'in database' language that can be used to extend the functionality of
the database. For example you can write database functions that are called when
events happen - such as when a record is inserted into the database. (Recall
when this was done in the previous module.)

PostGIS requires the PLPGSQL procedural language to be installed. So do this:

.. TODO: WINDOWS (RESTART FROM POSTGRES) > DO EVERYTHING

::

  createlang plpgsql address

Where the third argument is the name of the database that the procedural
language should be installed into.

.. note::  You will need administrative permissions for your database to be able
   to do this.

Install postgis.sql
-------------------------------------------------------------------------------

PostGIS can be thought of as a collection of in database functions that extend
the core capabilities of PostgreSQL so that it can deal with spatial data. By
'deal with', we mean store, retrieve, query and manipulate. In order to do
this, a number of functions are installed into the database. Do this:

::

  psql address < /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql

or

::

  psql address < /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis.sql
  
depending on which PostGIS version you have installed. Now do:

::

  psql address

and, once you're in the psql prompt:

::

  \df

We will discuss these functions in more detail as we proceed with this course.

Install spatial_refsys.sql
-------------------------------------------------------------------------------

In addition to the PostGIS functions, a second helper SQL script needs to be
run that will load the database with a collection of spatial reference system
(SRS) definitions as defined by the European Petroleum Survey Group (EPSG).
These are used during operations such as coordinate reference system (CRS)
conversions.

You can add more to the SRS list later if needed, but the list provided should
cover just about every SRS you will need (Google Mercator and lo are notable
exceptions).

To load the SRS table, first ensure that you're at a normal prompt (i.e., quit
the database first with :kbd:`\q`), then do this:

::

  psql address < /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql

replacing :kbd:`1.5` with :kbd:`2.0` if necessary.

The above command adds a table to our database. We can see the schema of this
table by entering the following command in the psql prompt:

::

  address=# \d spatial_ref_sys

The result should be this:

::

  Table "public.spatial_ref_sys"
     Column   |          Type           | Modifiers 
   -----------+-------------------------+-----------
    srid      | integer                 | not null
    auth_name | character varying(256)  | 
    auth_srid | integer                 | 
    srtext    | character varying(2048) | 
    proj4text | character varying(2048) | 
    Indexes:
  "spatial_ref_sys_pkey" PRIMARY KEY, btree (srid)

You can use standard SQL queries (as we have learned from our introductory
sections), to view and manipulate this table - though we suggest you do not
update or delete any records unless you know what you are doing.

One SRID you may be interested in is EPSG:4326 - the geographic / lat lon
reference system using the WGS 84 ellipsoid. Let's take a look at it:

::

  select * from spatial_ref_sys where srid=4326;

Result

::

  srid      | 4326
  auth_name | EPSG
  auth_srid | 4326
  srtext    | GEOGCS["WGS 84",DATUM["WGS_1984",SPHEROID["WGS
  84",6378137,298.257223563,AUTHORITY["EPSG","7030"]],TOWGS84[0,
  0,0,0,0,0,0],AUTHORITY["EPSG","6326"]],PRIMEM["Greenwich",0,
  AUTHORITY["EPSG","8901"]],UNIT["degree",0.01745329251994328,
  AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4326"]]
  proj4text | +proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs

The srtext is the projection definition in well known text (you may recognise
this from .prj files in your shapefile collection).

Looking at the installed PostGIS functions
-------------------------------------------------------------------------------

Good - our PostgreSQL database is now geospatially enabled, thanks to PostGIS.
We are going to delve a lot deeper into this in the coming days, but let's give
you a quick little taster. Let's say we want to create a point from text. First
we use the psql command to find functions relating to point:

::

  \df *point*

Here is one that caught my eye: :kbd:`st_pointfromtext`

So let's give that a try:

::

  address=# select st_pointfromtext('POINT(1 1)');

Result:

::

  st_pointfromtext                
  --------------------------------------------
  0101000000000000000000F03F000000000000F03F
  (1 row)

So there are a couple of interesting things going on here:

- we defined a point at position 1,1 (EPSG:4326 is assumed) using
  :kbd:`POINT(1 1)`
- we ran an sql statement, but not on any table, just on data entered from the
  SQL prompt
- the resulting row looks kinda strange

The resulting row is looking strange because its in the OGC format called 'Well
Known Binary' (WKB) - more on that coming in the next section.

To get the results back as text, I do a quick scan through the function list
for something that returns text:

::

  \df *text

One that catches my eye is :kbd:`st_astext`. Let's combine it with the previous
query:

::

  select st_astext(st_pointfromtext('POINT(1 1)'));

Result:

::

   st_astext   
  ------------
    POINT(1 1)
    (1 row)

So what's happened here? We entered the string :kbd:`POINT(1,1)`, turned it
into a point using :kbd:`st_pointfromtext()`, and turned it back into a
human-readable form with :kbd:`st_astext()`, which gave us back our original
string.

One last example before we really get into the detail of using PostGIS:

::

  select st_astext(st_buffer(st_pointfromtext('POINT(1 1)'),1.0));

What did that do? It created a buffer of 1 degree around our point, and
returned it as text. Nifty hey?

|IC|
-------------------------------------------------------------------------------

You now have PostGIS functions installed in your copy of PostgreSQL. With this
you'll be able to make use of PostGIS' extensive spatial functions.

|WN|
-------------------------------------------------------------------------------

Next you'll learn how spatial features are represented in a database.
