PostGIS execute SQL
===================

Description
-----------

Makes it possible to perform a SQL database query on a PostGIS database
connected to QGIS.

Parameters
----------

``Database`` [string]
  Name of the database, not the connection name.
  By default you don't have to fill in the name, the current database
  connection will be chosen.

  Default: *(not set)*

``SQL query`` [string]
  Defines the SQL query, for example 'create schema test;'.

  Default: *(not set)*

Outputs
-------

Console usage
-------------

::

  processing.runalg('qgis:postgisexecutesql', database, sql)

See also
--------

