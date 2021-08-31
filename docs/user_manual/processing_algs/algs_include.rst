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

The following section is used to load python code sample in algs help

**algorithm_code_section**

.. code-block:: python

    import processing
    processing.run("algorithm_id", {parameter_dictionary})

The *algorithm id* is displayed when you hover over the algorithm in
the Processing Toolbox.
The *parameter dictionary* provides the parameter NAMEs and values.
See :ref:`processing_console` for details on how to run processing algorithms
from the Python console.

**end_algorithm_code_section**


Output Types
============

The following describes the different options for algorithm outputs,
with variants including the "skip output" and the "append" options

Directory
---------

**directory_output_types**

* Save to a Temporary Directory
* Save to Directory

**end_directory_output_types**


**directory_output_types_skip**

* Skip Output
* Save to a Temporary Directory
* Save to Directory

**end_directory_output_types_skip**

File
----

**file_output_types**

* Save to a Temporary File
* Save to File…

**end_file_output_types**


**file_output_types_skip**

* Skip Output
* Save to a Temporary File
* Save to File…

**end_file_output_types_skip**

Layer
-----

**layer_output_types**

* Create Temporary Layer (``TEMPORARY_OUTPUT``)
* Save to File…
* Save to Geopackage…
* Save to Database Table…

The file encoding can also be changed here.

**end_layer_output_types**


**layer_output_types_append**

* Create Temporary Layer (``TEMPORARY_OUTPUT``)
* Save to File…
* Save to Geopackage…
* Save to Database Table…
* Append to Layer…

The file encoding can also be changed here.

**end_layer_output_types_append**


**layer_output_types_skip**

* Skip Output
* Create Temporary Layer (``TEMPORARY_OUTPUT``)
* Save to File…
* Save to Geopackage…
* Save to Database Table…

The file encoding can also be changed here.

**end_layer_output_types_skip**


Geometric predicates
====================

**geometric_predicates**

.. The following section is included in vector selection algorithms such as
 qgisselectbylocation, qgisextractbylocation

.. figure:: /docs/user_manual/processing_algs/img/selectbylocation.png
   :align: center

   In this example, the dataset from which we want to select (the *source
   vector layer*) consists of the green circles, the orange rectangle is the
   dataset that it is being compared to (the *intersection vector layer*).

Available geometric predicates are:

*Intersect*
  Tests whether a geometry intersects another. Returns 1 (true) if the
  geometries spatially intersect (share any portion of space - overlap or touch) and 0 if they
  don’t. In the picture above, this will select circles 1, 2 and 3.

*Contain*
  Returns 1 (true) if and only if no points of b lie in the exterior of a,
  and at least one point of the interior of b lies in the interior of a.
  In the picture, no circle is selected, but the rectangle would be if you
  would select it the other way around, as it contains a circle completely.
  This is the opposite of *are within*.

*Disjoint*
  Returns 1 (true) if the geometries do not share any portion of space (no overlap, not touching).
  Only circle 4 is selected.

*Equal*
  Returns 1 (true) if and only if geometries are exactly the same.
  No circles will be selected.

*Touch*
  Tests whether a geometry touches another. Returns 1 (true) if the geometries
  have at least one point in common, but their interiors do not intersect.
  Only circle 3 is selected.

*Overlap*
  Tests whether a geometry overlaps another. Returns 1 (true) if the geometries
  share space, are of the same dimension, but are not completely contained by
  each other. Only circle 2 is selected.

*Are within*
  Tests whether a geometry is within another. Returns 1 (true) if geometry a
  is completely inside geometry b. Only circle 1 is selected.

*Cross*
  Returns 1 (true) if the supplied geometries have some, but not all, interior
  points in common and the actual crossing is of a lower dimension than the
  highest supplied geometry. For example, a line crossing a polygon will cross
  as a line (selected). Two lines crossing will cross as a point (selected).
  Two polygons cross as a polygon (not selected).

**end_geometric_predicates**
