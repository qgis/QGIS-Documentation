|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. index:: Raster
.. index:: Arc/Info_Binary_Grid, Arc/Info_ASCII_Grid, GeoTIFF
.. index:: Erdas Imagine

*************************
Working with Raster Data
*************************

.. % when the revision of a section has been finalized,
.. % comment out the following line:
.. %\updatedisclaimer


This Section describes how to visualize and set raster layer properties.
|qg| uses the :index:`GDAL` library to read and write raster data formats,
including Arc/Info Binary Grid, Arc/Info ASCII Grid, GeoTIFF, Erdas Imagine
and many more. GRASS raster support is supplied by a native QGIS data provider
plugin. The raster data can also be loaded in read mode from zip and gzip
archives into QGIS.

At the date of this document, more than 100 raster formats are supported by the
GDAL library (see GDAL-SOFTWARE-SUITE :ref:`literature_and_web`). A complete
list is available at http://www.gdal.org/formats_list.html.

.. note::
   Not all of the listed formats may work in QGIS for various reasons. For example,
   some require external commercial libraries or the GDAL installation of your OS
   was not built to support the format you want to use. Only those formats that
   have been well tested will appear in the list of file types when loading a
   raster into QGIS. Other untested formats can be loaded by selecting the
   ``[GDAL] All files (*)`` filter.

Working with GRASS raster data is described in Section :ref:`sec_grass`.


What is raster data?
====================

Raster data in GIS are matrices of discrete cells that represent features on,
above or below the earth's surface. Each cell in the raster grid is the same
size, and cells are usually rectangular (in QGIS they will always be
rectangular). Typical raster datasets include remote sensing data such as
aerial photography or satellite imagery and modelled data such as an elevation
matrix.

Unlike vector data, raster data typically do not have an associated database
record for each cell. They are geocoded by its pixel resolution and the x/y
coordinate of a corner pixel of the raster layer. This allows QGIS to position
the data correctly in the map canvas.

QGIS makes use of georeference information inside the raster layer (e.g. :index:`GeoTiff`)
or in an appropriate world file to properly display the data.

.. index:: loading_raster

.. _load_raster:

Loading raster data in QGIS
===========================

Raster layers are loaded either by clicking on the |mActionAddRasterLayer|
:sup:`Load Raster` icon or by selecting the :menuselection:`Layer -->`
|mActionAddRasterLayer| :guilabel:`Add Raster Layer` menu option. More than one
layer can be loaded at the same time by holding down the :kbd:`Control` or
:kbd:`Shift` key and clicking on multiple items in the dialog
:guilabel:`Open a GDAL Supported Raster Data Source`.


Once a raster layer is loaded in the map legend you can click on the layer name
with the right mouse button to select and activate layer specific features or to
open a dialog to set raster properties for the layer.

**Right mouse button menu for raster layers**

* :menuselection:`Zoom to layer extent`
* :menuselection:`Zoom to Best Scale (100\%)`
* :menuselection:`Show in Overview`
* :menuselection:`Remove`
* :menuselection:`Duplicate`
* :menuselection:`Set Layer CRS`
* :menuselection:`Set Project CRS from Layer`
* :menuselection:`Save as ...`
* :menuselection:`Properties`
* :menuselection:`Rename`
* :menuselection:`Copy Style`
* :menuselection:`Add New Group`
* :menuselection:`Expand all`
* :menuselection:`Collapse all`
* :menuselection:`Update Drawing Order`
