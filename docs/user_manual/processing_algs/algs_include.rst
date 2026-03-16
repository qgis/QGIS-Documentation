:orphan:

.. _algs_include:

*******************
Algorithms Include
*******************

.. only:: html

   .. contents::
      :local:
      :depth: 1


Python Code Sample
==================

.. The following section is used to load python code sample in algs help

.. **algorithm_code_section**

.. code-block:: python

    import processing
    processing.run("algorithm_id", {parameter_dictionary})

The *algorithm id* is displayed when you hover over the algorithm in
the Processing Toolbox.
The *parameter dictionary* provides the parameter NAMEs and values.
See :ref:`processing_console` for details on how to run processing algorithms
from the Python console.

.. **end_algorithm_code_section**


Output Types
============

.. The following describes the different options for algorithm outputs,
 with variants including the "skip output" and the "append" options

Directory
---------

.. **directory_output_types**

* Save to a Temporary Directory
* Save to Directory

.. **end_directory_output_types**


.. **directory_output_types_skip**

* Skip Output
* Save to a Temporary Directory
* Save to Directory

.. **end_directory_output_types_skip**

File
----

.. **file_output_types**

* Save to a Temporary File
* Save to File…

.. **end_file_output_types**


.. **file_output_types_skip**

* Skip Output
* Save to a Temporary File
* Save to File…

.. **end_file_output_types_skip**

Layer
-----

.. **layer_output_types**

* Create Temporary Layer (``TEMPORARY_OUTPUT``)
* Save to File…
* Save to Geopackage…
* Save to Database Table…

The file encoding can also be changed here.

.. **end_layer_output_types**


.. **layer_output_types_append**

* Create Temporary Layer (``TEMPORARY_OUTPUT``)
* Save to File…
* Save to Geopackage…
* Save to Database Table…
* Append to Layer…

The file encoding can also be changed here.

.. **end_layer_output_types_append**


.. **layer_output_types_skip**

* Skip Output
* Create Temporary Layer (``TEMPORARY_OUTPUT``)
* Save to File…
* Save to Geopackage…
* Save to Database Table…

The file encoding can also be changed here.

.. **end_layer_output_types_skip**


Extent Dropdown
===============

.. The following refers to the extent selector widget in the algorithms GUI

.. **extent_options**

Available methods are:

* Calculate from layer…: uses extent of a layer loaded in the current project
* Calculate from layout map…: uses extent of a :ref:`layout map item <layout_map_item>`
  in the active project
* Calculate from bookmark…: uses extent of a saved :ref:`bookmark <sec_bookmarks>`
* Use map canvas extent
* Draw on canvas: click and drag a rectangle delimiting the area to take into account
* Enter the coordinates as ``xmin, xmax, ymin, ymax``

.. **end_extent_options**


Geometric predicates
====================

.. The following section is included in vector selection algorithms such as
 qgisselectbylocation, qgisextractbylocation and vector general algorithms
 such as qgisjoinattributesbylocation and qgisjoinbylocationsummary

.. **geometric_predicates**

Geometric predicates are boolean functions used to determine the spatial
relation a feature has with another by comparing whether and how
their geometries share a portion of space.

.. figure:: /docs/user_manual/processing_algs/img/selectbylocation.png
   :align: center

   Looking for spatial relations between layers

Using the figure above, we are looking for the green circles by spatially
comparing them to the orange rectangle feature.
Available geometric predicates are:

*Intersect*
  Tests whether a geometry intersects another.
  Returns 1 (true) if the input layer geometry and the join layer geometry spatially intersect
  (share any portion of space - overlap or touch) and 0 if they don't. In the figure above,
  if the rectangle is the input layer and circles are the join layer, this will return circles 1, 2 and 3.

*Contain*
  Returns 1 (true) if and only if no points of the join layer geometry lie in the exterior
  of the input layer geometry, and at least one point of the interior of the join layer geometry
  lies in the interior of the input layer geometry.
  In other words, the input layer feature must completely contain the join layer feature.
  In the figure, if the rectangle is the input layer and circles are the join layer,
  circle 1 is returned, as the rectangle contains it completely. This is the opposite of *are within*.

*Disjoint*
  Returns 1 (true) if the input layer geometry and the join layer geometry
  do not share any portion of space (no overlap, not touching).
  In the figure, if the rectangle is the input layer and circles are the join layer,
  only circle 4 is returned.

*Equal*
  Returns 1 (true) if and only if the input layer geometry and the join layer geometry
  are exactly the same. In the figure, if the rectangle is the input layer and circles are the join layer,
  no circles will be returned.

*Touch*
  Tests whether a geometry touches another. 
  Returns 1 (true) if the input layer geometry and the join layer geometry
  have at least one point in common, but their interiors do not intersect.
  In the picture, if the rectangle is the input layer and circles are the join layer,
  only circle 3 is returned.

*Overlap*
  Tests whether a geometry overlaps another. 
  Returns 1 (true) if the input layer geometry and the join layer geometry share space,
  are of the same dimension, but are not completely contained by each other.
  In the figure, if the rectangle is the input layer and circles are the join layer,
  only circle 2 is returned.

*Are within*
  Tests whether a geometry is within another. 
  Returns 1 (true) if the input layer geometry is completely inside the join layer geometry.
  In the figure, if the circles are the input layer and the rectangle is the join layer,
  only circle 1 is returned. This is the opposite of *contain*.

*Cross*
  Returns 1 (true) if the supplied geometries have some,
  but not all, interior points in common and the actual crossing is of a lower dimension
  than the highest supplied geometry. For example, a line crossing a polygon will cross as a line (true).
  Two lines crossing will cross as a point (true). Two polygons cross as a polygon (false).
  In the figure, if the rectangle is the input layer and circles are the join layer, no circles will be returned.

.. **end_geometric_predicates**

Notes on algorithms
===================

.. **warning_attributes**

.. warning:: **Geometry modification only**

   This operation modifies only the features geometry.
   The attribute values of the features are **not modified**, although
   properties such as area or length of the features will be modified
   by the overlay operation.
   If such properties are stored as attributes, those attributes will
   have to be manually updated.

.. **end_warning_attributes**


Raster data types
=================

Without user input (native)
---------------------------

.. **native_raster_data_types**

.. The following section is included in raster based algorithms such as
 qgisrasterbooleanand, qgisrasterbooleanor, qgisreclassifybylayer, qgisreclassifybytable


* 0 --- Byte        (Eight bit unsigned integer (quint8))
* 1 --- Int16       (Sixteen bit signed integer (qint16))
* 2 --- UInt16      (Sixteen bit unsigned integer (quint16))
* 3 --- Int32       (Thirty two bit signed integer (qint32))
* 4 --- UInt32      (Thirty two bit unsigned integer (quint32))
* 5 --- Float32     (Thirty two bit floating point (float))
* 6 --- Float64     (Sixty four bit floating point (double))
* 7 --- CInt16      (Complex Int16)
* 8 --- CInt32      (Complex Int32)
* 9 --- CFloat32    (Complex Float32)
* 10 --- CFloat64   (Complex Float64)
* 11 --- Int8       (Eight bit signed integer (qint8))

Available options depend on the GDAL version built with QGIS
(see :menuselection:`Help --> About` menu)

.. **end_native_raster_data_types**


Without user input
------------------

.. **raster_data_types**

.. The following section is included in raster based algorithms such as
 gdalrasterize, gdalmerge, gdalretile, gdalgriddatametrics,
 gdalgridinversedistancenearestneighbor, gdalgridinversedistance, gdalgridlinear,
 gdalgridaverage, gdalgridnearestneighbor, gdalproximity, gdalrastercalculator


* 0 --- Byte        (Eight bit unsigned integer (quint8))
* 1 --- Int16       (Sixteen bit signed integer (qint16))
* 2 --- UInt16      (Sixteen bit unsigned integer (quint16))
* 3 --- UInt32      (Thirty two bit unsigned integer (quint32))
* 4 --- Int32       (Thirty two bit signed integer (qint32))
* 5 --- Float32     (Thirty two bit floating point (float))
* 6 --- Float64     (Sixty four bit floating point (double))
* 7 --- CInt16      (Complex Int16)
* 8 --- CInt32      (Complex Int32)
* 9 --- CFloat32    (Complex Float32)
* 10 --- CFloat64   (Complex Float64)
* 11 --- Int8       (Eight bit signed integer (qint8))

Available options depend on the GDAL version built with QGIS
(see :menuselection:`Help --> About` menu)

.. **end_raster_data_types**


With user input
---------------

.. **raster_data_types_extended**

.. The following section is included in raster based algorithms such as
  gdalwarpreproject, gdalcliprasterbyextent, gdalcliprasterbymasklayer,
  gdalrearrange_bands, gdaltranslate


* 0 --- Use Input Layer Data Type
* 1 --- Byte        (Eight bit unsigned integer (quint8))
* 2 --- Int16       (Sixteen bit signed integer (qint16))
* 3 --- UInt16      (Sixteen bit unsigned integer (quint16))
* 4 --- UInt32      (Thirty two bit unsigned integer (quint32))
* 5 --- Int32       (Thirty two bit signed integer (qint32))
* 6 --- Float32     (Thirty two bit floating point (float))
* 7 --- Float64     (Sixty four bit floating point (double))
* 8 --- CInt16      (Complex Int16)
* 9 --- CInt32      (Complex Int32)
* 10 --- CFloat32   (Complex Float32)
* 11 --- CFloat64   (Complex Float64)
* 12 --- Int8       (Eight bit signed integer (qint8))

Available options depend on the GDAL version built with QGIS
(see :menuselection:`Help --> About` menu)

.. **end_raster_data_types_extended**


Resampling methods
------------------

.. **raster_resampling_methods**

.. The following section is included in raster based algorithms such as
  qgisalignrasters, qgisalignraster

* 0 --- Nearest Neighbour
* 1 --- Bilinear (2x2 kernel)
* 2 --- Cubic (4x4 kernel)
* 3 --- Cubic B-Spline (4x4 kernel)
* 4 --- Lanczos (6x6 kernel)
* 5 --- Average
* 6 --- Mode
* 7 --- Maximum
* 8 --- Minimum
* 9 --- Median
* 10 --- First quartile (Q1)
* 11 --- Third quartile (Q3)

.. **end_raster_resampling_methods**


Vector field types
==================

.. **vector_field_types**

.. The following section is included in vector based algorithms such as
  qgisaggregate, qgisrefactorfields

* 1 --- Boolean
* 2 --- Integer (32bit)
* 4 --- Integer (64bit)
* 6 --- Decimal (double)
* 9 --- Integer list
* 9 --- Integer (64bit) list
* 9 --- Decimal (double) list
* 10 --- Text (string)
* 11 --- String list
* 12 --- Binary Object (BLOB)
* 14 --- Date
* 15 --- Time
* 16 --- Date & Time

.. **end_vector_field_types**


.. **vector_field_subtypes**

.. The following section is included in vector based algorithms such as
  qgisaggregate, qgisrefactorfields

* 2 --- Integer list
* 4 --- Integer (64bit) list
* 6 --- Decimal (double) list
* 10 --- String list
* 0 --- Any other types

.. **end_vector_field_subtypes**
