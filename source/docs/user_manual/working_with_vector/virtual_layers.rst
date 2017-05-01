.. only:: html

   |updatedisclaimer|

.. index:: Virtual_Layers

.. _vector_virtual_layers:

Virtual layers
==============

.. only:: html

   .. contents::
      :local:

A special kind of vector layer allows you to define a layer as the result of an
advanced query, using the SQL language on any number of other vector layers that
QGIS is able to open. These layers are called virtual layers: they do not carry
data by themselves and can be seen as views to other layers.

Creating a virtual layer
------------------------

Open the virtual layer creation dialog by clicking on
:guilabel:`Add Virtual Layer` in the :guilabel:`Layer` menu or from the
corresponding toolbar.

The dialog allows you to specify a :guilabel:`Layer name` and a SQL
:guilabel:`Query`. The
query can use the name (or id) of loaded vector layers as well as field names
of these layers.

For example, if you have a layer called ``airports``, you can create a new
virtual layer called ``public_airports`` with an SQL query like:

.. code-block:: sql

   SELECT *
   FROM airports
   WHERE USE = "Civilian/Public"

The SQL query will be executed, whatever the underlying provider of the
``airports`` layer is and even if this provider does not directly support SQL
queries.

.. figure:: /static/user_manual/working_with_vector/create_virtual_layers.png
   :align: center

   Create virtual layers dialog

Joins and complex queries can also be created simply by directly using the
names of the layers that are to be joined.

.. note::

   It's also possible to create virtual layers using the SQL window of
   :ref:`dbmanager`.

Embedded layers
---------------

Besides the vector layers available in the map canvas, the user can add layers
to the :guilabel:`Embedded layers` list, which he can use in queries
without the need to have them showing in the map canvas or Layers panel.

To embed a layer, click :guilabel:`Add` and provide the :guilabel:`Local name`,
:guilabel:`Provider`, :guilabel:`Encoding` and the path to the
:guilabel:`Source`.

The :guilabel:`Import` button allows adding layers loaded in the map canvas into
the Embedded layers list. This allows to later remove those layers from the
Layers panel without breaking any existent query.

Supported language
------------------

The underlying engine uses SQLite and Spatialite to operate.

It means you can use all of the SQL your local installation of SQLite
understands.

Functions from SQLite and spatial functions from Spatialite
can also be used in a virtual layer query. For instance, creating a point
layer out of an attribute-only layer can be done with a query similar to:

.. code-block:: sql

   SELECT id, MakePoint(x, y, 4326) as geometry
   FROM coordinates

:ref:`Functions of QGIS expressions<functions_list>` can also be used in a
virtual layer query.

To refer the geometry column of a layer, use the name ``geometry``.

Contrary to a pure SQL query, all the fields of a virtual layer query must
be named. Don't forget to use the ``as`` keyword to name your columns if they
are the result of a computation or function call.

Performance issues
------------------

With default parameters set, the virtual layer engine will try its best to
detect the type of the different columns of the query, including the type of the
geometry column if one is present.

This is done by introspecting the query when possible or by fetching the first
row of the query (LIMIT 1) at last resort.
Fetching the first row of the result just to create the layer may be undesirable
for performance reasons.

The creation dialog allows to specify different parameters:

* :guilabel:`Unique identifier column`: this option allows specifying which
  field of the query represents unique integer values that QGIS can use as row
  identifiers. By default, an autoincrementing integer value is used.
  Defining a unique identifier column allows to speed up the selection of
  rows by id.

* :guilabel:`No geometry`: this option forces the virtual layer to ignore
  any geometry field. The resulting layer is an attribute-only layer.

* Geometry :guilabel:`Column`: this option allows to specify the name
  of the column that is to be used as the geometry of the layer.

* Geometry :guilabel:`Type`: this option allows to specify the type
  of the geometry of the virtual layer.

* Geometry :guilabel:`CRS`: this option allows to specify the
  coordinate reference system of the virtual layer.

Special comments
----------------

The virtual layer engine tries to determine the type of each column of the
query. If it fails, the first row of the query is fetched to determine
column types.

The type of a particular column can be specified directly in the query by
using some special comments.

The syntax is the following: ``/*:type*/``. It has to be placed just after
the name of a column. ``type`` can be either ``int`` for integers, ``real``
for floating point numbers or ``text``.

For instance:

.. code-block:: sql

  SELECT id+1 as nid /*:int*/
  FROM table

The type and coordinate reference system of the geometry column can also be set
thanks to special comments with the following syntax ``/*:gtype:srid*/`` where
``gtype`` is the geometry type (``point``, ``linestring``, ``polygon``,
``multipoint``, ``multilinestring`` or ``multipolygon``) and ``srid`` an
integer representing the EPSG code of a coordinate reference system.

Use of indexes
--------------

When requesting a layer through a virtual layer, indexes of this source layer
will be used in the following ways:

* if an ``=`` predicate is used on the primary key column of the layer, the
  underlying data provider will be asked for a particular id (FilterFid)

* for any other predicates (``>``, ``<=``, ``!=``, etc.) or on a column without
  a primary key, a request built from an expression will be used to request the
  underlying vector data provider. It means indexes may be used on database
  providers if they exist.

A specific syntax exists to handle spatial predicates in requests and triggers
the use of a spatial index: a hidden column named ``_search_frame_`` exists
for each virtual layer. This column can be compared for equality to a bounding
box. Example:

.. code-block:: sql

   SELECT *
   FROM vtab
   WHERE _search_frame_=BuildMbr(-2.10,49.38,-1.3,49.99,4326)

Spatial binary predicates like ``ST_Intersects`` are greatly sped up when used
in conjunction with this spatial index syntax.