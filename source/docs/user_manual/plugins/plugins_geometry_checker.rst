|updatedisclaimer|

.. index:: Digitizing, Geometry Checker, Topology, Geometry validity, Errors

.. _geometry_checker:

Geometry Checker Plugin
=======================

Geometry Checker is a powerful core plugin to check and fix the geometry
validity of a layer. The :guilabel:`Geometry Checker` dialog show
differents grouped settings in the first tab (:guilabel:`Settings`):

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

After you are happy with the configuration, you can click on the **[Run]** button.

The results appear in the second tab and as an overview layer of the errors in
the canvas (its name is *checker*). A table list the :guilabel:`geometry check
result` with one error by row: the first row is an ID, the second the reason of
the error, then the coordinates of the error, a value (depending on the type of
the error) and finally the resolution column which indicates the resolution of
the error. At the bottom of this table, you can export the error into a
shapefile. At the left, you have the number of the errors and the fixed errors.

.. _figure_geometry_checker_1:

.. only:: html

   **Figure Geometry Checker:**

.. figure:: /static/user_manual/plugins/check_geometries.png
   :align: center

   The Geometry Checker Plugin

The *Geometry Checker Plugin* can find the following errors:

* Self intersections: a polygon with a self intersection,
* Duplicate nodes: two duplicates nodes in a segment
* Holes: hole in a polygon,
* Segment length: a segment length lower than a threshold,
* Minimum angle: two segments with an angle lower than a threshold,
* Minimum area: polygon area lower than a treshold,
* Silver polygon: this error come from very small polygon (with small area) with
  a large perimeter,
* Duplicates features,
* Feature within feature,
* Overlaps: polygon overlapping,
* Gaps: gaps between polygons

The following figure shows the different checks made by the plugin.

.. _figure_geometry_checker_2:

.. only:: html

   **Figure The Differents checks supported by the plugin**

.. figure:: /static/user_manual/plugins/geometry_checker_scheme.png
   :align: center

   The Differents checks supported by the plugin

You can select a row to see the localisation of the error. You can change this
behaviour by selecting another action between :guilabel:`error` (default),
:guilabel:`Feature`, :guilabel:`Don't move`, and |checkbox| `Highlight contour
of selected features`.

Below the zoom action when clicking on the table row, you can :guilabel:`Show
the selected features in attribute table`, :guilabel:`Fix selected errors using
default resolution` and :guilabel:`Fix selected errors, prompt for resolution
method`. In the latter, you will see a window to choose the resolution's method
among which:

* Merge with neighboring polygon with longest shared edge,
* Merge with neighboring polygon with largest area,
* Merge with neighboring polygon identical attribute value,if any, or leave
  as it
* Delete feature
* No action

.. tip:: **Fix multiple errors**

   You can fix multiple errors by selecting more than one row in the table with
   the *CTRL + click* action.

The default action could be changed with the last icon :guilabel:`Error
resolution settings`. For some type of errors, you can change the default
action between some specific action or :guilabel:`No action`.

Finally, you can choose which :guilabel:`attribute to use when merging features
by attribute value`.

