|updatedisclaimer|

.. index:: Virtual_Layers

.. _vector_virtual_layers:

Virtual layers
==============

A special kind of vector layer allows you to define a layer as the result of an
advanced query, using the SQL language on any number of other vector layers that
QGIS is able to open. These layers are called virtual layers: they do not carry
data by themselves and can be seen as views to other layers.

Creating a virtual layer
------------------------

Open the virtual layer creation dialog by clicking on :guilabel:`Add Virtual Layer` in the :guilabel:`Layer` menu
or from the corresponding toolbar.

The dialog allows you to specify an SQL query. The query can use the name (or id) of existing vector layers as well
as field names of these layers.

For example, if you have a layer called ``regions``, you can create a new virtual layer with an SQL query like
``SELECT * FROM regions WHERE id < 100``.
The SQL query will be executed, whatever the underlying provider of the ``regions`` layer is and even if this provider
does not directly support SQL queries.

Joins and complex queries can also be created simply by directly using the names of the layers that are to be joined.

Supported language
------------------

The underlying engine uses SQLite and Spatialite to operate.

It means you can use all of the SQL your local installation of SQLite understands.

Functions from SQLite and spatial functions from Spatialite
can also be used in a virtual layer query. For instance, creating a point layer out of a attribute-only layer can be done
with a query similar to:
``SELECT id, MakePoint(x, y, 4326) as geometry FROM coordinates``

:ref:`Functions of QGIS expressions<functions_list>` can also be used in a virtual layer query.

To refer the geometry column of a layer, use the name ``geometry``.

Contrary to a pure SQL query, all the fields of a virtual layer query must be named. Don't forget to use the ``as`` keyword
to name your columns if they are the result of a computation or function call.

Performance issues
------------------

With default parameters set, the virtual layer engine will try its best to detect the type of the different columns of
the query, including the type of the geometry column if one is present.

This is done by introspecting the query when possible or by fetching the first row of the query (LIMIT 1) at last resort.
Fetching the first row of the result just to create the layer may be undesirable for performance reasons.

The creation dialog allows to specify different parameters:

- **unique identifier column**: this option allows to specify which field of the query represents unique integer values
that QGIS can use as row identifiers. By default, an autoincrementing integer value is used. Specifying a unique identifier
column allows to speed up selection of rows by id.

- **no geometry**: this option forces the virtual layer to ignore any geometry field. The resulting layer is an attribute-only
layer.

- **geometry column**: this option allows to specify the name of the column that is to be used as the geometry of the layer

- **geometry type**: this option allows to specify the type of the geometry of the virtual layer

- **geometry CRS**: this option allows to specify the coordinate reference system of the virtual layer

Special comments
----------------

The virtual layer engine tries to determine the type of each column of the query. If it fails, the first row of the query is fetched
to determine column types.

The type of a particular column can be specified directly in the query by using some special comments.

The syntax is the following: ``/*:type*/``. It has to be placed just after the name of a column. ``type`` can be either ``int`` for integers,
``real`` for floating point numbers or ``text``.

For instance:
``SELECT id+1 as nid /*:int*/ FROM table``

The type and coordinate reference system of the geometry column can also be set thanks to special comments with the following syntax
``/*:gtype:srid*/`` where ``gtype`` is the geometry type (``point``, ``linestring``, ``polygon``, ``multipoint``, ``multilinestring``
or ``multipolygon``) and ``srid`` an integer representing the EPSG code of a coordinate reference system.

Use of indexes
--------------

When requesting a layer through a virtual layer, indexes of this source layer will be used in the following ways:

- if an ``=`` predicate is used on the primary key column of the layer, the underlying data provider will be asked for a particular id (FilterFid)

- for any other predicates (``>``, ``<=``, ``!=``, etc.) or on a column without primary key, a request built from an expression will be used to
request the underlying vector data provider. It means indexes may be used on database providers if they exist.

A specific syntax exists to handle spatial predicates in requests and trigger the use of a spatial index: a hidden column named ``_search_frame_``
exists for each virtual layer. This column can be compared for equality to a bounding box. Example:
``select * from vtab where _search_frame_=BuildMbr(-2.10,49.38,-1.3,49.99,4326)``

Spatial binary predicates like ``ST_Intersects`` are greatly sped up when used in conjunction with this spatial index syntax.

