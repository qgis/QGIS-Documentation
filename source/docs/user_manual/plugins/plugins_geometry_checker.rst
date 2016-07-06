|updatedisclaimer|

.. index:: Digitizing, Geometry Checker, Topology

.. _geometry_checker2:

Geometry Checker Plugin
=======================

Geometry Checker is a powerful plugin to check the geometry validity of a layer.
The :guilabel:`Geometry Checker` dialog show differents grouped settings in the
first tab (:guilabel:`settings`):

* :guilabel:`Input vector layer`: to select the layer to check. A |checkbox|
  :guilabel:`Only selected features` checkbox can filter the geometry to the
  one selected.
* :guilabel:`Geometry validity`: give to the user the choice between
  :guilabel:`Self intersections`, :guilabel:`Duplicate nodes`,
  :guilabel:`Polygon with less than 3 nodes`.
* :guilabel:`Allowed geometry types`: to allow only some geometry types like
  point, multipoint, line, multiline, polygon and multipolygon.
* :guilabel:`Geometry properties` displays |checkbox| `Polygons and
  multipolygons may not contain any holes` and |checkbox| :guilabel:`Multipart
  objects must consist of more than one part`.
* :guilabel:`Geometry conditions`: user can add some condition to validate the
  geometries with a minimal segment length, a minimum angle between segment,
  a minimal polygon area and sliver polygons detection.
* :guilabel:`Topology checks`: checks for duplicates, for features within other
  features, overlaps smaller than a number, for gaps smaller than a number.
* :guilabel:`Tolerance`: you can define here the tolerance for the check.
* :guilabel:`Output vector layer` gives the choice to the user how get the
  result between modifiy the current layer and create a new layer.

After choosed the correct configuration, one can click on the **[Run]** button.
The result appears in the second tab.



/!\ TODO` /!\

.. _figure_geometry_checker_1:

.. only:: html

   **Figure Geometry Checker:**

.. figure:: /static/user_manual/plugins/check_geometries.png
   :align: center

   The Geometry Checker Plugin
