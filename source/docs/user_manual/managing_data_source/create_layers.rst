.. only:: html

   |updatedisclaimer|

.. _creating_layers:

*****************
 Creating Layers
*****************

.. only:: html

.. contents::
   :local:


Creating a layer can be processed in many ways in QGIS; it can be done:

* from scratch, creating an empty layer;
* from an existing layer;
* from the clipboard;
* as a result of an SQL-like query based on one or many layers: the
  :ref:`virtual layer <vector_virtual_layers>`.

QGIS also provides particular tools to import/export different formats.

.. index:: Create new layers
.. index:: Shapefile, SpatiaLite, GPX

.. _sec_create_vector:

Creating new Vector layers
==========================

QGIS allows you to create new shapefile layers, new SpatiaLite layers, new
GPX layers and New Temporary Scratch Layers. Creation of a new GRASS layer
is supported within the GRASS plugin.
Please refer to section :ref:`creating_new_grass_vectors` for more information
on creating GRASS vector layers.

Creating a new Shapefile layer
------------------------------

To create a new shape layer for editing, choose :menuselection:`Create
Layer -->` |newVectorLayer| :menuselection:`New Shapefile Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New Vector Layer` dialog will be
displayed as shown in figure_create_shapefile_. Choose the type of layer
(point, line or polygon) and the CRS (coordinate reference system).

Note that QGIS does not yet support creation of 2.5D features (i.e., features
with X,Y,Z coordinates).

.. _figure_create_shapefile:

.. figure:: /static/user_manual/managing_data_source/editNewVector.png
   :align: center

   Creating a new Shapefile layer dialog

To complete the creation of the new shapefile layer, add the desired attributes
by clicking on the **[Add to attributes list]** button and specifying a name and
type for the attribute. A first 'id' column is added as default but can be
removed, if not wanted. Only :guilabel:`Type: real` |selectString|,
:guilabel:`Type: integer` |selectString|, :guilabel:`Type: string`
|selectString| and :guilabel:`Type:date` |selectString| attributes are
supported. Additionally and according to the attribute type, you can also define
the width and precision of the new attribute column. Once you are happy with the
attributes, click **[OK]** and provide a name for the shapefile. QGIS will
automatically add a :file:`.shp` extension to the name you specify. Once the
layer has been created, it will be added to the map, and you can edit it in the
same way as described in section :ref:`sec_edit_existing_layer` above.

.. index:: New SpatiaLite layer

.. _vector_create_spatialite:

Creating a new SpatiaLite layer
-------------------------------

To create a new SpatiaLite layer for editing, choose :menuselection:`New -->`
|newSpatiaLiteLayer| :menuselection:`New SpatiaLite Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New SpatiaLite Layer` dialog will
be displayed as shown in Figure_create_spatialite_.

.. _figure_create_spatialite:

.. figure:: /static/user_manual/managing_data_source/editNewSpatialite.png
   :align: center

   Creating a New SpatiaLite layer dialog

The first step is to select an existing SpatiaLite database or to create a new
SpatiaLite database. This can be done with the browse button |browseButton| to
the right of the database field. Then, add a name for the new layer, define
the layer type, and specify the coordinate reference system with **[Specify CRS]**.
If desired, you can select |checkbox| :guilabel:`Create an autoincrementing primary key`.

To define an attribute table for the new SpatiaLite layer, add the names of
the attribute columns you want to create with the corresponding column type, and
click on the **[Add to attribute list]** button. Once you are happy with the
attributes, click **[OK]**. QGIS will automatically add the new layer to the
legend, and you can edit it in the same way as described in section
:ref:`sec_edit_existing_layer` above.

Further management of SpatiaLite layers can be done with the DB Manager. See
:ref:`dbmanager`.

.. index:: New GeoPackage layer
.. _vector_create_geopackage:

Creating a new GeoPackage layer
-------------------------------

To create a new GeoPackage layer choose :menuselection:`New -->`
|newGeoPackageLayer| :menuselection:`New GeoPackage Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New GeoPackage Layer` dialog will
be displayed as shown in figure_create_geopackage_.

.. _figure_create_geopackage:

.. figure:: /static/user_manual/managing_data_source/editNewGeoPackage.png
   :align: center

   Creating a New GeoPackage layer dialog

The first step is to select an existing GeoPackage or create a new one. This
can be done by pressing the ellipses **[...]** button at the right of the
Database field. Then, give a name for the new layer, define the layer type and
specify the coordinate reference system with **[Specify CRS]**.

To define an attribute table for the new GeoPackage layer, add the names of
the attribute columns you want to create with the corresponding column type, 
and click on the **[Add to fields list]** button. Once you are happy with the
attributes, click **[OK]**. QGIS will automatically add the new layer to the
legend, and you can edit it in the same way as described in section
:ref:`sec_edit_existing_layer`.

.. index:: New GPX layer
.. _vector_create_gpx:

Creating a new GPX layer
-------------------------

To create a new GPX file, you need to load the GPS plugin first. :menuselection:`Plugins -->`
|showPluginManager| :menuselection:`Plugin Manager...` opens the Plugin Manager Dialog.
Activate the |checkbox| :guilabel:`GPS Tools` checkbox.

When this plugin is loaded, choose :menuselection:`New -->` |createGPX|
:menuselection:`Create new GPX Layer...` from the :menuselection:`Layer` menu.
In the :guilabel:`Save new GPX file as` dialog, you can choose where to save the
new GPX layer.

.. index:: New Temporary Scratch layer
.. _vector_new_scratch_layer:

Creating a new Temporary Scratch Layer
--------------------------------------

Empty, editable memory layers can be defined using :menuselection:`Layer -->
Create Layer --> New Temporary Scratch Layer`. Here you can even create
|radioButtonOff|:guilabel:`Multipoint`, |radioButtonOff|:guilabel:`Multiline`
and |radioButtonOff|:guilabel:`Multipolygon` Layers beneath
|radioButtonOn|:guilabel:`Point`, |radioButtonOff|:guilabel:`Line` and
|radioButtonOff|:guilabel:`Polygon` Layers. Temporary Scratch Layers are not
saved and will be discarded when QGIS is closed. See also :ref:`paste_into_layer`.


.. index:: Save layer
.. _general_saveas:

Save layer from an existing file
================================

Layers (raster or vector) or subset of layers can be saved in another format
with the :guilabel:`Save As...` feature in the layer contextual menu (by
right-clicking in the layer in the layer tree) or in the :menuselection:`Layer
--> Save As...` menu.

Common parameters
-----------------

The :guilabel:`Save As` dialog shows several parameters to change the behavior
when saving the layer. Common parameters (raster and vector) are:

* :guilabel:`Format`
* :guilabel:`File name`
* :guilabel:`CRS`
* :guilabel:`Add saved file to map` to add the new layer to the canvas
* :guilabel:`Extent` (possible values are **layer**, **Map view** or
  **user-defined** extent)

However, some parameters are specific to raster and vector formats:

Raster specific parameters
--------------------------

* :guilabel:`Output mode` (it can be **raw data** or **rendered image**)
* :guilabel:`Resolution`
* :guilabel:`Create Options`: advanced options (file compression, block sizes,
  colorimetry...) to fine tune the output file. See the `gdal-ogr
  <http://gdal.org>`_ driver documentation.
* :guilabel:`Pyramids` creation
* :guilabel:`VRT Tiles`
* :guilabel:`No data values`

.. _figure_save_raster:

.. figure:: /static/user_manual/managing_data_source/saveasraster.png
   :align: center

   Saving as a new raster layer

Vector specific parameters
--------------------------

Depending on the format of export, some of these options are available or not:

* :guilabel:`Encoding`
* :guilabel:`Save only selected features`
* :guilabel:`Select fields to export and their export options`. In case you set
  your fields behavior with some :ref:`Edit widgets <configure_field>`, e.g.
  ``value map``, you can keep the displayed values in the layer by checking
  |checkbox| :guilabel:`Replace all selected raw fields values by displayed
  values`.
* :guilabel:`Symbology export`: can be used mainly for DXF export and for all
  file formats who manage OGR feature styles (see note below) as DXF, KML, tab
  file formats:

  * **No symbology**: default style of the application that reads the data
  * **Feature symbology**: save style with OGR Feature Styles (see note below)
  * **Symbol Layer symbology**: save with OGR Feature Styles (see note below)
    but export the same geometry multiple times if there are multiple symbology
    symbol layers used
  * A **Scale** value can be applied to the latest options.

.. _ogr_features_note:

.. note:: *OGR Feature Styles* are a way to store style directly in
     the data as a hidden attribute. Only some formats can handle this kind of
     information. KML, DXF and TAB file formats are such formats. For advanced
     users, you can read the `OGR Feature Styles specification
     <http://www.gdal.org/ogr_feature_style.html>`_ document.

* :guilabel:`Geometry`: you can configure the geometry capabilities of the
  output layer

  * :guilabel:`geometry type`: keep the original geometry of the features when
    set to **Automatic**, otherwise removes or overrides it with any type. You
    can add an empty geometry column to an attribute table, remove the geometry
    column of a spatial layer.
  * :guilabel:`Force multi-type`: force creation of multi-geometry features in
    the layer
  * :guilabel:`Include z-dimension` to geometries.

.. tip::

  Overriding layer geometry type makes it possible to do things like save a
  geometryless table (e.g. :file:`.csv` file) into a shapefile WITH any type of
  geometry (point, line, polygon), so that geometries can then be manually added
  to rows with the |addPart| :sup:`Add Part` tool .

* :guilabel:`Datasources Options`, :guilabel:`Layer Options` or
  :guilabel:`Custom Options` which allow you to configure some advanced
  parameters. See the `gdal-ogr <http://gdal.org>`_ driver documentation.

.. _figure_save_vector:

.. figure:: /static/user_manual/managing_data_source/saveasvector.png
   :align: center

   Saving as a new vector layer

.. index:: Overwrite file, Append features

When saving a vector layer into an existing file, depending on the capabilities
of the output format (Geopackage, SpatiaLite, FileGDB...), the user can
decide whether to:

* overwrite the whole file
* overwrite only the target layer (the layer name is configurable)
* append features to the existing target layer
* append features, add new fields if there are any.

For formats like ESRI Shapefile, MapInfo .tab, feature append is also available.

.. index:: DXF Export
.. _create_dxf_files:

Create DXF files
================

Besides the :guilabel:`Save As...` dialog which provides options to export a
single layer to another format, including :file:`*.DXF`, QGIS provides another
tool to export multiple layers as a single DXF layers. It's accessible in the
:menuselection:`Project --> DXF Export...` menu.

The :guilabel:`DXF Export` dialog allows the user to:

* indicate the destination layer file;
* choose the symbology mode and scale (see the `OGR Feature Styles
  <ogr_features_note>`_ note);
* select the encoding and CRS;
* check the loaded layers to include in the DXF files or pick them from an
  existing :ref:`visibility preset <preset_visibility>`.

  For each layer, you can choose a field whose values are used to split features
  in generated destination layers in the DXF output. You can also choose to
  |checkbox| :guilabel:`Use the layer title as name if set` and keep features
  grouped.
* choose to only :guilabel:`Export features intersecting the current map extent`.


.. _paste_into_layer:

Create layer from a clipboard
=============================

Features that are on the clipboard can be pasted into a new layer. To do this,
Select some features, copy them to the clipboard, and then paste them into a
new layer using :menuselection:`Edit --> Paste Features as -->` and choosing:

* :menuselection:`New Vector Layer...`: you need to select the layer CRS, poping
  up the :guilabel:`Save vector layer as...` dialog from which you can select
  any supported data format (see :ref:`general_saveas` for parameters);
* or :menuselection:`Temporary Scratch Layer...`: you need to select the layer
  CRS and give a name.

A new layer, filled with selected features and their attributes is created and
added to map canvas if asked.

.. note:: Creating layers from clipboard applies to features selected and copied
   within QGIS and also to features from another source defined using well-known
   text (WKT).


.. index:: Virtual layers
.. _vector_virtual_layers:

Virtual layers
==============

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
:guilabel:`Query`. The query can use the name (or id) of loaded vector
layers as tables, as well as their fields' name as columns.

For example, if you have a layer called ``airports``, you can create a new
virtual layer called ``public_airports`` with an SQL query like:

.. code-block:: sql

   SELECT *
   FROM airports
   WHERE USE = "Civilian/Public"

The SQL query will be executed, whatever the underlying provider of the
``airports`` layer is and even if this provider does not directly support SQL
queries.

.. figure:: /static/user_manual/managing_data_source/create_virtual_layers.png
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

The underlying engine uses SQLite and SpatiaLite to operate.

It means you can use all of the SQL your local installation of SQLite
understands.

Functions from SQLite and spatial functions from SpatiaLite
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

Spatial binary predicates like ``ST_Intersects`` are significantly sped up when
used in conjunction with this spatial index syntax.


