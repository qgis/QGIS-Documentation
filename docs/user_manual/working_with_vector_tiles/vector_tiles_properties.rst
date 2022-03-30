.. index:: Vector Tiles, vector tiles properties
.. _`label_vector_tiles`:

*************************
Working with Vector Tiles
*************************

.. only:: html

   .. contents::
      :local:

What are Vector Tiles?
======================

Vector tiles are packets of geographic data, packaged into pre-defined
roughly-square shaped "tiles" for transfer over the web. They combine
pre-rendered raster map tiles and vector map tiles. 
The vector tile server returns vector map data, which has been clipped
to the boundaries of each tile, instead of a pre-rendered map image.
The clipped tiles represent the zoom-levels of the vector tile service,
derived from a pyramid approach.
Using this structure, the data-transfer is reduced in comparison to
un-tiled vector maps. Only data within the current map view, and at the
current zoom level need to be transferred.
Also, compared to a tiled raster map, data transfer is also greatly reduced,
as vector data is typically much smaller than a rendered bitmap.
Vector tiles do not have any styling information assigned so QGIS needs to
apply a cartographic style in order to display the data. 

.. _figure_vector_tiles_pyramidstructure:

.. figure:: img/vector_tiles_pyramid_structure.png
   :align: center

   Pyramid structure of vector tiles with zoom-levels


Supported Formats
=================

There is support for vector tiles through:

* remote sources (HTTP/S) - with XYZ template - ``type=xyz&url=http://example.com/{z}/{x}/{y}.pbf``
* local files - with XYZ template - e.g. ``type=xyz&url=file:///path/to/tiles/{z}/{x}/{y}.pbf``
* local MBTiles database - e.g. ``type=mbtiles&url=file:///path/to/file.mbtiles``

To load a vector tiles dataset into QGIS, use the |addVectorTileLayer| :guilabel:`Vector Tile` tab
in the :guilabel:`Data Source Manager` dialog. Read :ref:`vector_tiles` for
more details.

Vector Tiles Dataset Properties
===============================

Information Properties
----------------------

The :guilabel:`Information` tab is read-only and represents an interesting
place to quickly grab summarized information and metadata on the current layer.
Provided information are:

* based on the provider of the layer: name, URI, source type and path, number
  of zoom levels
* the Coordinate Reference System: name, units, method, accuracy, reference
  (i.e. whether it's static or dynamic)
* picked from the :ref:`filled metadata <vectortilesmetadatamenu>`: access,
  extents, links, contacts, history...

Symbology and Label Properties
------------------------------

.. _figure_vector_tile_symbology:

.. figure:: img/vector_tiles_symbology.png
   :align: center

   Vector Tile Layer Symbology

As vector tiles consist of point, line and polygon geometries, the respective symbols are available. 
To apply a cartographic style you need to use a :guilabel:`Style URL` when
creating the :guilabel:`Vector Tiles Connection`. The symbology will be
shown immediately in the |symbology| :guilabel:`Symbology` tab after clicking the
:guilabel:`OK` button.

To create your own cartographic style you can define a set of :ref:`rules <rule_based_rendering>` for features and
apply style and label. In :numref:`figure_vector_tile_symbology` we set up style and
labeling for the OpenStreetMap ``landuse`` layer.
The settings are made for the class ``suburb`` here. For better visibility most of
the rules are deselected. 

At the bottom the :guilabel:`Current Zoom` is shown. Check the :guilabel:`Visible
rules only` option to filter the list of rules to only those that are visible
at the given zoom level. This makes it easier to work with complex vector styling
and to locate troublesome rules. Style and labelling can be dependent on the
zoom level.

There is also the option to import styles. Those styles can be supplied as:

* :guilabel:`QML` files (:ref:`qgisstylefile`)
* :guilabel:`MapBox GL Json` style configuration files

.. index:: Metadata, Metadata editor, Keyword
.. _vectortilesmetadatamenu:

Metadata Properties
-------------------

The |editMetadata| :guilabel:`Metadata` tab provides you with options
to create and edit a metadata report on your layer.
See :ref:`metadatamenu` for more information.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addVectorTileLayer| image:: /static/common/mActionAddVectorTileLayer.png
   :width: 1.5em
.. |editMetadata| image:: /static/common/editmetadata.png
   :width: 1.2em
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
