.. index:: Digitizing, Topology, Geometry validity, Errors
   single: Plugins; Geometry checker

.. _geometry_checker:

Geometry Checker Plugin
=======================

Geometry Checker is a powerful core plugin to check and fix the geometry
validity of a layer. It is available from the :menuselection:`Vector`
menu (|geometryChecker| :menuselection:`Check Geometries...`).

Configuring the checks
----------------------

The :guilabel:`Check Geometries` dialog shows different grouped settings in the
first tab (:guilabel:`Setup`):

* :guilabel:`Input vector layers`: to select the layers to check. A |checkbox|
  :guilabel:`Only selected features` checkbox can be used to restrict the
  checking to the geometries of the selected features.
* :guilabel:`Allowed geometry types` gives the chance to restrict the geometry
  type of the input layer(s) to:
  
  * |checkbox| Point
  * |checkbox| Multipoint
  * |checkbox| Line
  * |checkbox| Multiline
  * |checkbox| Polygon
  * |checkbox| Multipolygon

* :guilabel:`Geometry validity`. Depending on geometry types you can choose
  between:
  
  * |checkbox| :guilabel:`Self intersections` 
  * |checkbox| :guilabel:`Duplicate nodes` 
  * |checkbox| :guilabel:`Self contacts`
  * |checkbox| :guilabel:`Polygon with less than 3 nodes`.
  
* :guilabel:`Geometry properties`. Depending on geometry types, different 
  options are available:
  
  * |checkbox| :guilabel:`Polygons and multipolygons may not contain any holes`
  * |checkbox| :guilabel:`Multipart objects must consist of more than one part` 
  * |checkbox| :guilabel:`Lines must not have dangles`

* :guilabel:`Geometry conditions`. Allows you to add some condition to validate 
  the geometries with:
  
  * |checkbox| :guilabel:`Minimal segment length (map units)` |selectNumber|
  * |checkbox| :guilabel:`Minimum angle between segment (deg)` |selectNumber|
  * |checkbox| :guilabel:`Minimal polygon area (map units sqr.)` |selectNumber| 
  * |checkbox| :guilabel:`No sliver polygons` with a :guilabel:`Maximum thinness`
    |selectNumber| and a |checkbox| :guilabel:`Max. area (map units sqr.)` 
    |selectNumber| 

* :guilabel:`Topology checks`. Depending on geometry types, many different
  options are available:
  
  * |checkbox| :guilabel:`Checks for duplicates` 
  * |checkbox| :guilabel:`Checks for features within other features`
  * |checkbox| :guilabel:`Checks for overlaps smaller than` |selectNumber|
  * |checkbox| :guilabel:`Checks for gaps smaller than` |selectNumber|
  * |checkbox| :guilabel:`Points must be covered by lines` 
  * |checkbox| :guilabel:`Points must properly lie inside a polygon`
  * |checkbox| :guilabel:`Lines must not intersect any other lines` 
  * |checkbox| :guilabel:`Lines must not intersect with features of layer` 
    |selectString| 
  * |checkbox| :guilabel:`Polygons must follow boundaries of layer` |selectString|

* :guilabel:`Tolerance`. You can define the tolerance of the check in map layer
  units.
* :guilabel:`Output vector layer` gives the choice to:
  
  * |radioButtonOn| :guilabel:`Modify input layer`
  * |radioButtonOn| :guilabel:`Create new layers`

When you are happy with the configuration, you can click on the :guilabel:`Run`
button.


.. _figure_geometry_checker:

.. figure:: img/check_geometries.png
   :align: center

   The Geometry Checker Plugin


The *Geometry Checker Plugin* can find the following errors:

* Self intersections: a polygon with a self intersection
* Duplicate nodes: two duplicates nodes in a segment
* Holes: hole in a polygon
* Segment length: a segment length lower than a threshold
* Minimum angle: two segments with an angle lower than a threshold
* Minimum area: polygon area lower than a threshold
* Silver polygon: this error come from very small polygon (with small area) with
  a large perimeter
* Duplicates features
* Feature within feature
* Overlaps: polygon overlapping
* Gaps: gaps between polygons

The following figure shows the different checks made by the plugin.

.. _figure_geometry_checker_options:

.. figure:: img/geometry_checker_scheme.png
   :align: center

   Some checks supported by the plugin

Analysing the results
---------------------

The results appear in the second tab (:guilabel:`Result`) and as an overview
layer of the errors in the canvas (its name has the default prefix
:file:`checked_`).
A table lists the :guilabel:`Geometry check result` with one error per row and
columns containing: the layer name, an ID, the error type, then the coordinates
of the error, a value (depending on the type of the error) and finally the
resolution column which indicates the resolution of the error.
At the bottom of this table, you can :guilabel:`Export` the error into different file
formats. You also have a counter with the number of total errors and fixed ones.

You can select a row to see the location of the error. You can change this
behavior by selecting another action between |radioButtonOn| :guilabel:`Error`
(default), |radioButtonOff| :guilabel:`Feature`, |radioButtonOff|
:guilabel:`Don't move`, and |checkbox| :guilabel:`Highlight selected features`.

Below the zoom action when clicking on the table row, you can:

* |fromSelectedFeature| :guilabel:`Show selected features in attribute table`
* |success| :guilabel:`Fix selected errors using default resolution`
* |success| :guilabel:`Fix selected errors, prompt for resolution method`
  You will see a window to choose the resolution's method among which:

  * Merge with neighboring polygon with longest shared edge
  * Merge with neighboring polygon with largest area
  * Merge with neighboring polygon with identical attribute value, if any, or
    leave as is
  * Delete feature
  * No action

* |options| :guilabel:`Error resolution settings` allows you to change the 
  default resolution method depending on the error type

.. tip:: **Fix multiple errors**

   You can fix multiple errors by selecting more than one row in the table with
   the *CTRL + click* action.

Finally, you can choose which :guilabel:`Attribute to use when merging features
by attribute value`.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |fromSelectedFeature| image:: /static/common/mActionFromSelectedFeature.png
   :width: 1em
.. |geometryChecker| image:: /static/common/geometrychecker.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |radioButtonOff| image:: /static/common/radiobuttonoff.png
   :width: 1.5em
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
   :width: 1.5em
.. |selectNumber| image:: /static/common/selectnumber.png
   :width: 2.8em
.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |success| image:: /static/common/mIconSuccess.png
   :width: 1em
