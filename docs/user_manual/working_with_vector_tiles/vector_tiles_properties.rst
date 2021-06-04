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

The :guilabel:`Information` tab is read-only and represents an interesting place to quickly grab
summarized information and metadata on the current layer.
Provided information are:

* based on the provider of the layer (e.g. URI and number of Zoom levels)
* related to its geometry (CRS, Spatial Extend)

Symbology Properties
--------------------

.. _figure_vector_tile_symbology:

.. figure:: img/vector_tile_symbology.png
   :align: center

   Vector Tile Layer Symbology

As vector tiles consist of point, line and polygon geometries, the respective symbols are available. 
To apply a cartographic style you need to use a :guilabel:`Style URL` when
creating the :guilabel:`Vector Tiles Connection`. The symbology will be
shown immediatly in the |symbology| :guilabel:`Symbology` tab after clicking the
:guilabel:`OK` button.
To create your own cartographic style you can define a set of rules for features and
apply style and label. We set up style and labeling for the open street map layer ``landuse``.
The settings are made for the class ``suburb`` here. For better visibility most of
the rules are deselected. 
At the bottom the :guilabel:`Current Zoom` is shown. According to this information
it is possible to reduce the number of rules to only those that are visible
at the given zoom lovel. This makes it easier to work with complex vector styling
and to locate troublesome rules. Style and labelling can be dependent on the
zoom level.

Labels Properties
-----------------

Metadata Properties
-------------------


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addVectorTileLayer| image:: /static/common/mActionAddVectorTileLayer.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |general| image:: /static/common/general.png
   :width: 1.5em
.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |setProjection| image:: /static/common/mActionSetProjection.png
   :width: 1.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |slider| image:: /static/common/slider.png
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |general| image:: /static/common/general.png
   :width: 1.5em
.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |setProjection| image:: /static/common/mActionSetProjection.png
   :width: 1.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |slider| image:: /static/common/slider.png
.. |symbology| image:: /static/common/symbology.png
   :width: 2em


