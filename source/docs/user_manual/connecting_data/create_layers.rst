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
* from the clipboard.

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

.. Z coordinate can be created in 3.0 (didn't see any issue report)

.. _figure_create_shapefile:

.. figure:: /static/user_manual/working_with_vector/editNewVector.png
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

.. figure:: /static/user_manual/working_with_vector/editNewSpatialite.png
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

.. TODO: Add a Create "New GeoPackage Layer" section


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
and |radioButtonOff|:guilabel:`Multipolygon` Layers beneath |radioButtonOn|:guilabel:`Point`,
|radioButtonOff|:guilabel:`Line` and |radioButtonOff|:guilabel:`Polygon` Layers.
Temporary Scratch Layers are not saved and will be discarded when QGIS is closed.
See also :ref:`paste_into_layer`.


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
* :guilabel:`Extent` (possible values are **layer**, **Map view** or **user-defined**
  extent)

However, some parameters are specific to raster and vector formats:

Raster specific parameters
--------------------------

* :guilabel:`Output mode` (it can be **raw data** or **rendered image**)
* :guilabel:`Resolution`
* :guilabel:`Create Options`: advanced options (file compression, block sizes, colorimetry...)
  to fine tune the output file. See the `gdal-ogr <http://gdal.org>`_ driver documentation.
* :guilabel:`Pyramids` creation
* :guilabel:`VRT Tiles`
* :guilabel:`No data values`

.. Add a screenshot for "save raster file as..." dialog

Vector specific parameters
--------------------------

Depending on the format of export, some of these options are available or not:

* :guilabel:`Encoding`
* :guilabel:`Save only selected features`
* :guilabel:`Select fields to export and their export options`. In case you set your
  fields behavior with some :ref:`Edit widgets <configure_field>`, e.g. ``value
  map``, you can keep the displayed values in the layer by checking |checkbox|
  :guilabel:`Replace all selected raw fields values by displayed values`.
* :guilabel:`Symbology export`: can be used mainly for DXF export and for all file
  formats who manage OGR feature styles (see note below) as DXF, KML, tab
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

* :guilabel:`Geometry`: you can configure the geometry capabilities of the output layer

  * :guilabel:`geometry type`: keep the original geometry of the features when set to 
    **Automatic**, otherwise removes or overrides it with any type. You can add
    an empty geometry column to an attribute table, remove the geometry column
    of a spatial layer.
  * :guilabel:`Force multi-type`: force creation of multi-geometry features in the layer
  * :guilabel:`Include z-dimension` to geometries.

.. tip::

  Overriding layer geometry type makes it possible to do things like save a
  geometryless table (e.g. :file:`.csv` file) into a shapefile WITH any type of
  geometry (point, line, polygon), so that geometries can then be manually added
  to rows with the |addPart| :sup:`Add Part` tool .

* :guilabel:`Datasources Options`, :guilabel:`Layer Options` or :guilabel:`Custom Options`
  which allow you to configure some advanced parameters. See the `gdal-ogr <http://gdal.org>`_
  driver documentation.

.. Add a screenshot for "save vector file as..." dialog

.. index:: Overwrite file, Append features

When saving a vector layer into an existing file, depending on the capabilities
of the output format (Geopackage, SpatiaLite, FileGDB...), the user can
decide whether to:

* overwrite the whole file
* overwrite only the target layer (the layer name is configurable)
* append features to the existing target layer
* append features, add new fields if there are any.

For formats like ESRI Shapefile, MapInfo .tab, feature append is also available.

.. note:: **About DXF files**

   Vector layers can be exported to DXF files using another tool, the
   :guilabel:`DXF Export...` in :menuselection:`Project` menu. The windows allow the
   user to choose the layer file, the symbology mode (see the `OGR Feature Styles
   <ogr_features_note>`_ note), the symbology scale, the encoding, the visibility
   preset and the layers to include in the DXF file.
  
   As an option, you can |checkbox| :guilabel:`Use the layer title as name if set`
   or :guilabel:`Export features intersecting the current map extent`.

.. if a DXF Export chapter is added this note could be removed or shrunk...
  
.. _paste_into_layer:

Create layer from a clipboard
=============================

Features that are on the clipboard can be pasted into a new layer. To do this,
Select some features, copy them to the clipboard, and then paste them into a
new layer using :menuselection:`Edit --> Paste Features as -->` and choosing:

* :menuselection:`New Vector Layer...`: you need to select the layer CRS, poping
  up the :guilabel:`Save vector layer as...` dialog from which you can select any
  supported data format (see :ref:`general_saveas` for parameters);
* or :menuselection:`Temporary Scratch Layer...`: you need to select the layer
  CRS and give a name.

A new layer, filled with selected features and their attributes is created and
added to map canvas if asked.

.. note:: Creating layers from clipboard applies to features selected and copied
   within QGIS and also to features from another source defined using well-known
   text (WKT).

.. Should we move here the "Create virtual layers" chapter?

.. there are other tools to generate a new layer:
 - Project --> Export DXF (not documented? relation with dxf2shp converter plugin)
 - Project --> DWG/DXF Import (proposed to place in the opening_data file)

