.. only:: html

   |updatedisclaimer|

.. index:: Geometry; Handling

.. _geometry:

*****************
Geometry Handling
*****************

.. warning:: |outofdate|

.. contents::
   :local:

Points, linestrings and polygons that represent a spatial feature are commonly
referred to as geometries. In QGIS they are represented with the
:class:`QgsGeometry` class.

Sometimes one geometry is actually a collection of simple (single-part)
geometries. Such a geometry is called a multi-part geometry. If it contains
just one type of simple geometry, we call it multi-point, multi-linestring or
multi-polygon. For example, a country consisting of multiple islands can be
represented as a multi-polygon.

The coordinates of geometries can be in any coordinate reference system (CRS).
When fetching features from a layer, associated geometries will have
coordinates in CRS of the layer.

Description and specifications of all possible geometries construction and
relationships are available in the `OGC Simple Feature Access Standards
<https://www.opengeospatial.org/standards/sfa>`_ for advanced details.

.. index:: Geometry; Construction

Geometry Construction
=====================

There are several options for creating a geometry:

* from coordinates

  .. code-block:: python

    gPnt = QgsGeometry.fromPointXY(QgsPointXY(1,1))
    gLine = QgsGeometry.fromPolyline([QgsPoint(1, 1), QgsPoint(2, 2)])
    gPolygon = QgsGeometry.fromPolygonXY([[QgsPointXY(1, 1), QgsPointXY(2, 2),
                                        QgsPointXY(2, 1)]])

  Coordinates are given using :class:`QgsPoint` class or :class:`QgsPointXY`
  class. The difference between these classes is that :class:`QgsPoint`
  supports M and Z dimensions.

  Polyline (Linestring) is represented by a list of points. Polygon is
  represented by a list of linear rings (i.e. closed linestrings). First ring
  is outer ring (boundary), optional subsequent rings are holes in the polygon.

  Multi-part geometries go one level further: multi-point is a list of points,
  multi-linestring is a list of linestrings and multi-polygon is a list of
  polygons.

* from well-known text (WKT)

  .. code-block:: python

    gem = QgsGeometry.fromWkt("POINT(3 4)")

* from well-known binary (WKB)

  .. code-block:: python

    >>> g = QgsGeometry()
    >>> wkb = bytes.fromhex("010100000000000000000045400000000000001440")
    >>> g.fromWkb(wkb)
    >>> g.asWkt()
    'Point (42 5)'


.. index:: Geometry; Access to

Access to Geometry
==================

First, you should find out geometry type, :func:`wkbType` method is the one to
use --- it returns a value from ``QGis.WkbType`` enumeration

.. code-block:: python

  >>> gPnt.wkbType() == QGis.WKBPoint
  True
  >>> gLine.wkbType() == QGis.WKBLineString
  True
  >>> gPolygon.wkbType() == QGis.WKBPolygon
  True
  >>> gPolygon.wkbType() == QGis.WKBMultiPolygon
  False

As an alternative, one can use :func:`type` method which returns a value from
``QGis.GeometryType`` enumeration. There is also a helper function
:func:`isMultipart` to find out whether a geometry is multipart or not.

To extract information from geometry there are accessor functions for every
vector type. How to use accessors

.. code-block:: python

  >>> gPnt.asPoint()
  (1, 1)
  >>> gLine.asPolyline()
  [(1, 1), (2, 2)]
  >>> gPolygon.asPolygon()
  [[(1, 1), (2, 2), (2, 1), (1, 1)]]

.. note:: The tuples (x,y) are not real tuples, they are :class:`QgsPoint`
   objects, the values are accessible with :func:`x` and :func:`y` methods.

For multipart geometries there are similar accessor functions:
:func:`asMultiPoint`, :func:`asMultiPolyline`, :func:`asMultiPolygon()`.

.. index:: Geometry; Predicates and operations

Geometry Predicates and Operations
==================================

QGIS uses GEOS library for advanced geometry operations such as geometry
predicates (:func:`contains`, :func:`intersects`, ...) and set operations
(:func:`union`, :func:`difference`, ...). It can also compute geometric
properties of geometries, such as area (in the case of polygons) or lengths
(for polygons and lines)

Here you have a small example that combines iterating over the features in a
given layer and performing some geometric computations based on their
geometries.

.. code-block:: python

  # we assume that 'layer' is a polygon layer
  features = layer.getFeatures()
  for f in features:
    geom = f.geometry()
    print("Area:", geom.area())
    print("Perimeter:", geom.length())

Areas and perimeters don't take CRS into account when computed using these
methods from the :class:`QgsGeometry` class. For a more powerful area and
distance calculation, the :class:`QgsDistanceArea` class can be used. If
projections are turned off, calculations will be planar, otherwise they'll be
done on the ellipsoid. 

.. code-block:: python

  d = QgsDistanceArea()
  d.setEllipsoid('WGS84')
  d.setEllipsoidalMode(True)

  print("distance in meters: ", d.measureLine(QgsPoint(10,10),QgsPoint(11,11)))

You can find many example of algorithms that are included in QGIS and use these
methods to analyze and transform vector data. Here are some links to the code
of a few of them.

Additional information can be found in following sources:

* Geometry transformation: `Reproject algorithm <https://raw.github.com/qgis/QGIS/release-2_18/python/plugins/processing/algs/qgis/ReprojectLayer.py>`_
* Distance and area using the :class:`QgsDistanceArea` class: `Distance matrix algorithm <https://raw.github.com/qgis/QGIS/release-2_18/python/plugins/processing/algs/qgis/PointDistance.py>`_
* `Multi-part to single-part algorithm <https://raw.github.com/qgis/QGIS/release-2_18/python/plugins/processing/algs/qgis/MultipartToSingleparts.py>`_


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |outofdate| replace:: `Despite our constant efforts, information beyond this line may not be updated for QGIS 3. Refer to https://qgis.org/pyqgis/master for the python API documentation or, give a hand to update the chapters you know about. Thanks.`
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
