.. _processing_algorithms_guidelines:

********************************
Processing Algorithms Guidelines
********************************

.. contents::
   :local:

Documenting Processing algorithms
=================================

If you want to write documentation for Processing algorithms consider these
guidelines:

* Processing algorithm help files are part of QGIS User Guide, so use same
  formatting as User Guide and other documentation

* each algorithm should be placed in the corresponding **provider** and **group**
  folder: e.g. the algorithm `Voronoi polygon` belongs to `QGIS` provider and to
  the group `vector_geometry`. So the correct file to add the description is:
  ``source/docs/user_manual/processing_algs/qgis/vectorgeometry.rst``.

  .. note:: before starting to write the guide, check if the algorithm is already
    described: in this case you can enhance the existing description.

* it is **extremely** important that each algorithm has an *anchor* that corresponds
  to the provider name + the unique name of the algorithm itself. This allows the
  Help button to open the Help page to the correct section. The anchor should be
  placed **above** the title, e.g.::

    .. _qgisvoronoipolygons:

    Voronoi polygons
    ----------------

  To find out the algorithm name you can just hover the mouse on the algorithm in
  the Processing toolbox.

* avoid use "This algoritm does this and that..." as first sentence in algorithm
  description. Try to use more general words like in TauDEM or GRASS algoritms
  help

* add images if needed. Use PNG format and follow general guidelines for documentation.
  Put the picture in the correct folder: it depends on the provider, e.g. for QGIS::

    /static/user_manual/processing_algs/qgis/myPicture.png

* if necessary add links to additional information (e.g. publications or web-pages)
  to the "See also" section

* give clear explanation for algorithm parameters and outputs (again GRASS and
  TauDEM are good examples).

* don't edit parameter or output names. If you found typo or wrong spelling ---
  report this in bugracker, so developers can fix this in Processing code too

* don't list available options in algorithm description, options already listed
  in parameter description

* don't add information vector geometry type in algorithm or parameter description
  without compelling reason as this information already available in parameter
  description

* it should be also described the *type* of the parameters. There several types
  available but avoid to invent new ones and pick one of these:

  ========================================  ===============
  Parameter/Output type                     Description
  ========================================  ===============
  Point vector                              vector: point
  Line vector                               vector: line
  Polygon vector                            vector: polygon
  Generic vector                            vector: any
  Vector field numeric                      tablefield: numeric
  Vector field string                       tablefield: string
  Vector field generic                      tablefield: any
  Raster layer                              raster
  Raster band                               raster band
  HTML file                                 html
  Table layer                               table
  Extent                                    extent
  CRS                                       projection
  Combobox                                  selection
  Multiple selection                        multipleinput
  Number                                    number
  String                                    string
  Boolean                                   boolean
  Fields and values (Refactor Fields)       fieldsmapping
  Values and operators (Raster Calculator)  calculator
  ========================================  ===============

* the best option is studying an existing and well documented algorithm and copy
  all the useful layouts

* if the algorithm does not provide any output just skip that section

* when you are finished just follow the guidelines described :ref:`step_by_step`
  to commit  your changes and make a Pull Request

Here an example of an existing algorithm to help you with the layout and the description::

    .. _qgiscountpointsinpolygon:

    Count points in polygon
    -----------------------
    Takes a point and a polygon layer and counts the number of points from the
    first one in each polygon of the second one.

    A new polygons layer is generated, with the exact same content as the input polygons
    layer, but containing an additional field with the points count corresponding to
    each polygon.

    .. figure:: /static/user_manual/processing_algs/qgis/count_points_polygon.png
      :align: center

      The labels identify the point count

    An optional weight field can be used to assign weights to each point. Alternatively,
    a unique class field can be specified. If both options are used, the weight field
    will take precedence and the unique class field will be ignored.

    Parameters
    ..........
    ``Polygons`` [vector: polygon]
      Polygons layer

    ``Points`` [vector: point]
      Points layer

    ``Weight field`` [tablefield: any]
      Optional

      The count generated will be the sum of the weight field for each point contained
      by the polygon.

    ``Class field`` [tablefield: any]
      Optional

      Points are classified based on the selected attribute and if several points with
      the same attribute value are within the polygon, only one of them is counted.
      The final count of the point in a polygon is, therefore, the count of different
      classes that are found in it.

    ``Count field name`` [string]
      The name of the field to store the count of points

      Default: *NUMPOINTS*

    Outputs
    .......

    ``Count`` [vector: polygon]
      Resulting layer with the attribute table containing the new column of the
      points count.
