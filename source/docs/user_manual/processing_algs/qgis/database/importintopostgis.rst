Import into PostGIS
===================

Description
-----------

<put algortithm description here>

Parameters
----------

``Layer to import`` [vector: any]
  <put parameter description here>

``Database (connection name)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- local

  Default: *0*

``Schema (schema name)`` [string]
  <put parameter description here>

  Default: *public*

``Table to import to (leave blank to use layer name)`` [string]
  <put parameter description here>

  Default: *(not set)*

``Primary key field`` [tablefield: any]
  Optional.

  <put parameter description here>

``Geometry column`` [string]
  <put parameter description here>

  Default: *geom*

``Overwrite`` [boolean]
  <put parameter description here>

  Default: *True*

``Create spatial index`` [boolean]
  <put parameter description here>

  Default: *True*

``Convert field names to lowercase`` [boolean]
  <put parameter description here>

  Default: *True*

``Drop length constraints on character fields`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
-------

Console usage
-------------

::

  processing.runalg('qgis:importintopostgis', input, database, schema, tablename, primary_key, geometry_column, overwrite, createindex, lowercase_names, drop_string_length)

See also
--------

