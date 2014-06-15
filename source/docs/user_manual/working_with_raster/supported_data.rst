|updatedisclaimer|

.. index:: Raster
.. index:: Arc/Info_Binary_Grid, Arc/Info_ASCII_Grid, GeoTIFF
.. index:: Erdas Imagine

*************************
Working with Raster Data
*************************

.. % when the revision of a section has been finalized,
.. % comment out the following line:
.. %\updatedisclaimer


This section describes how to visualize and set raster layer properties.
|qg| uses the :index:`GDAL` library to read and write raster data formats,
including ArcInfo Binary Grid, ArcInfo ASCII Grid, GeoTIFF, ERDAS IMAGINE,
and many more. GRASS raster support is supplied by a native |qg| data provider
plugin. The raster data can also be loaded in read mode from zip and gzip
archives into |qg|.

As of the date of this document, more than 100 raster formats are supported by the
GDAL library (see GDAL-SOFTWARE-SUITE in :ref:`literature_and_web`). A complete
list is available at http://www.gdal.org/formats_list.html.

.. note::
   Not all of the listed formats may work in |qg| for various reasons. For example,
   some require external commercial libraries, or the GDAL installation of your OS
   may not have been built to support the format you want to use. Only those formats that
   have been well tested will appear in the list of file types when loading a
   raster into |qg|. Other untested formats can be loaded by selecting the
   ``[GDAL] All files (*)`` filter.

Working with GRASS raster data is described in section :ref:`sec_grass`.


What is raster data?
====================

Raster data in GIS are matrices of discrete cells that represent features on,
above or below the earth's surface. Each cell in the raster grid is the same
size, and cells are usually rectangular (in |qg| they will always be
rectangular). Typical raster datasets include remote sensing data, such as
aerial photography, or satellite imagery and modelled data, such as an elevation
matrix.

Unlike vector data, raster data typically do not have an associated database
record for each cell. They are geocoded by pixel resolution and the x/y
coordinate of a corner pixel of the raster layer. This allows |qg| to position
the data correctly in the map canvas.

|qg| makes use of georeference information inside the raster layer (e.g., :index:`GeoTiff`)
or in an appropriate world file to properly display the data.

.. index:: loading_raster

.. _load_raster:

Loading raster data in |qg|
===========================

Raster layers are loaded either by clicking on the |mActionAddRasterLayer|
:sup:`Add Raster Layer` icon or by selecting the :menuselection:`Layer -->`
|mActionAddRasterLayer| :guilabel:`Add Raster Layer` menu option. More than one
layer can be loaded at the same time by holding down the :kbd:`Ctrl` or
:kbd:`Shift` key and clicking on multiple items in the
:guilabel:`Open a GDAL Supported Raster Data Source` dialog.


Once a raster layer is loaded in the map legend, you can click on the layer name
with the right mouse button to select and activate layer-specific features or to
open a dialog to set raster properties for the layer.

**Right mouse button menu for raster layers**

* :menuselection:`Zoom to Layer Extent`
* :menuselection:`Zoom to Best Scale (100\%)`
* :menuselection:`Stretch Using Current Extend`
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
