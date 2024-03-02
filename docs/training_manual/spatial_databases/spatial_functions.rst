Lesson: PostGIS Setup
===============================================================================

Setting up PostGIS functions will allow you to access spatial functions from
within PostgreSQL.

**The goal for this lesson:** To install spatial functions and briefly demo
their effects.

.. note:: We will assume the use of PostGIS version 2.1 or newer in this exercise. The
   installation and database configuration are different for older versions,
   but the rest of this material in this module will still work. Consult the
   documentation for your platform for help with installation and database
   configuration.

Installing under Ubuntu
-------------------------------------------------------------------------------

Postgis is easily installed from apt.

.. code-block:: bash

  $ sudo apt install postgresql
  $ sudo apt install postgis

Really, it's that easy...

.. note:: The exact versions that will be installed depend on which version of Ubuntu you are using and which
   repositories you have configured. After installing you can check the version by issuing a ``select
   PostGIS_full_version();`` query with psql or another tool.

To install a specific version (eg, PostgreSQL version 13 and PostGIS 3), you can use the following
commands.

.. code-block:: bash

  $ sudo apt install wget ca-certificates
  $ sudo lsb_release -a 
  $ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  $ sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
  $ sudo apt-get update
  $ sudo apt install postgis postgresql-13-postgis-3


Installing under Windows
-------------------------------------------------------------------------------

Installing on Windows can be done from binary packages using a normal Windows installation dialogs. 

First Visit `the download page <https://www.postgresql.org/download/>`_. Then follow `this guide
<https://www.bostongis.com/PrinterFriendly.aspx?content_name=postgis_tut01>`_.

More information about installing on Windows can be found on the `PostGIS
website <https://postgis.net/windows_downloads>`_.

Installing on Other Platforms
-------------------------------------------------------------------------------

The `PostGIS website download <https://postgis.net/install/>`_ has information about
installing on other platforms including macOS and on other Linux distributions

Configuring Databases to use PostGIS
-------------------------------------------------------------------------------

Once PostGIS is installed, you will need to configure your database to use
the extensions. If you have installed PostGIS version > 2.0, this is as simple
as issuing the following command with psql using the address database from our
previous exercise.

.. code-block:: bash

  $ psql -d address -c "CREATE EXTENSION postgis;"

.. note:: Depending on your version, you could find more instructions on how
   to spatially enable a database at
   https://postgis.net/docs/postgis_administration.html#create_spatial_db.

Looking at the installed PostGIS functions
-------------------------------------------------------------------------------

PostGIS can be thought of as a collection of in-database functions that extend
the core capabilities of PostgreSQL so that it can deal with spatial data. By
'deal with', we mean store, retrieve, query and manipulate. In order to do
this, a number of functions are installed into the database.

Our PostgreSQL ``address`` database is now geospatially enabled, thanks to PostGIS.
We are going to delve a lot deeper into this in the coming sections, but let's
give you a quick little taster. Let's say we want to create a point from text.
First we use the psql command to find functions relating to point. If you are not
already connected to the ``address`` database, do so now. Then run:

.. code-block:: psql

  \df *point*

This is the command we're looking for: :kbd:`st_pointfromtext`.  To page through
the list, use the down arrow, then press :kbd:`Q` to quit back to the psql shell.

Try running this command:

.. code-block:: sql

  select st_pointfromtext('POINT(1 1)');

Result:

.. code-block:: sql

  st_pointfromtext
  --------------------------------------------
  0101000000000000000000F03F000000000000F03F
  (1 row)

Three things to note:

* We defined a point at position 1,1 (EPSG:4326 is assumed) using
  :kbd:`POINT(1 1)`,
* We ran an sql statement, but not on any table, just on data entered from the
  SQL prompt,
* The resulting row does not make much sense.

The resulting row is in the OGC format called 'Well Known Binary' (WKB). We will
look at this format in detail in the next section.

To get the results back as text, we can do a quick scan through the function list
for something that returns text:

.. code-block:: psql

  \df *text

The query we're looking for now is ``st_astext``. Let's combine it with the
previous query:

.. code-block:: sql

  select st_astext(st_pointfromtext('POINT(1 1)'));

Result:

.. code-block:: sql

   st_astext
  ------------
    POINT(1 1)
    (1 row)

Here, we entered the string :kbd:`POINT(1,1)`, turned it
into a point using :kbd:`st_pointfromtext()`, and turned it back into a
human-readable form with :kbd:`st_astext()`, which gave us back our original
string.

One last example before we really get into the detail of using PostGIS:

.. code-block:: sql

  select st_astext(st_buffer(st_pointfromtext('POINT(1 1)'),1.0));

What did that do? It created a buffer of 1 degree around our point, and
returned the result as text.

Spatial Reference Systems
-------------------------------------------------------------------------------

In addition to the PostGIS functions, the extension contains a collection of
spatial reference system (SRS) definitions as defined by the European Petroleum
Survey Group (EPSG). These are used during operations such as coordinate
reference system (CRS) conversions.

We can inspect these SRS definitions in our database as they are stored in
normal database tables.

First, let's look at the schema of the table by entering the following command
in the psql prompt:

.. code-block:: psql

  \d spatial_ref_sys

The result should be this:

.. code-block:: sql

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
sections), to view and manipulate this table - though its not a good idea to
update or delete any records unless you know what you are doing.

One SRID you may be interested in is EPSG:4326 - the geographic / lat lon
reference system using the WGS 84 ellipsoid. Let's take a look at it:

.. code-block:: sql

  select * from spatial_ref_sys where srid=4326;

Result:

.. code-block:: sql

  srid      | 4326
  auth_name | EPSG
  auth_srid | 4326
  srtext    | GEOGCS["WGS 84",DATUM["WGS_1984",SPHEROID["WGS
  84",6378137,298.257223563,AUTHORITY["EPSG","7030"]],TOWGS84[0,
  0,0,0,0,0,0],AUTHORITY["EPSG","6326"]],PRIMEM["Greenwich",0,
  AUTHORITY["EPSG","8901"]],UNIT["degree",0.01745329251994328,
  AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4326"]]
  proj4text | +proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs

The :kbd:`srtext` is the projection definition in well known text (you may recognise
this from .prj files in your shapefile collection).

In Conclusion
-------------------------------------------------------------------------------

You now have PostGIS functions installed in your copy of PostgreSQL. With this
you'll be able to make use of PostGIS' extensive spatial functions.

What's Next?
-------------------------------------------------------------------------------

Next you'll learn how spatial features are represented in a database.
