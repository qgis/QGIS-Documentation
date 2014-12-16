.. index:: geometry; handling

.. _geometry:

*****************
Geometry Handling
*****************

Points, linestrings and polygons that represent a spatial feature are commonly
referred to as geometries. In QGIS they are represented with the
:class:`QgsGeometry` class. All possible geometry types are nicely shown in
`JTS discussion page <http://www.vividsolutions.com/jts/discussion.htm#spatialDataModel>`_.

Sometimes one geometry is actually a collection of simple (single-part)
geometries. Such a geometry is called a multi-part geometry. If it contains
just one type of simple geometry, we call it multi-point, multi-linestring or
multi-polygon. For example, a country consisting of multiple islands can be
represented as a multi-polygon.

The coordinates of geometries can be in any coordinate reference system (CRS).
When fetching features from a layer, associated geometries will have
coordinates in CRS of the layer.

.. index:: geometry; construction

Geometry Construction
=====================

There are several options for creating a geometry:

* from coordinates

  ::

    gPnt = QgsGeometry.fromPoint(QgsPoint(1,1))
    gLine = QgsGeometry.fromPolyline([QgsPoint(1, 1), QgsPoint(2, 2)])
    gPolygon = QgsGeometry.fromPolygon([[QgsPoint(1, 1), QgsPoint(2, 2), QgsPoint(2, 1)]])

  Coordinates are given using :class:`QgsPoint` class.

  Polyline (Linestring) is represented by a list of points. Polygon is
  represented by a list of linear rings (i.e. closed linestrings). First ring
  is outer ring (boundary), optional subsequent rings are holes in the polygon.

  Multi-part geometries go one level further: multi-point is a list of points,
  multi-linestring is a list of linestrings and multi-polygon is a list of
  polygons.

* from well-known text (WKT)

  ::

    gem = QgsGeometry.fromWkt("POINT(3 4)")

* from well-known binary (WKB)

  ::

    g = QgsGeometry()
    g.setWkbAndOwnership(wkb, len(wkb))


.. index:: geometry; access to

Access to Geometry
==================

First, you should find out geometry type, :func:`wkbType` method is the one to
use --- it returns a value from ``QGis.WkbType`` enumeration

::

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

::

  >>> gPnt.asPoint()
  (1, 1)
  >>> gLine.asPolyline()
  [(1, 1), (2, 2)]
  >>> gPolygon.asPolygon()
  [[(1, 1), (2, 2), (2, 1), (1, 1)]]

Note: the tuples (x,y) are not real tuples, they are :class:`QgsPoint` objects,
the values are accessible with :func:`x` and :func:`y` methods.

For multipart geometries there are similar accessor functions:
:func:`asMultiPoint`, :func:`asMultiPolyline`, :func:`asMultiPolygon()`.

.. index:: geometry; predicates and operations

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

::

  # we assume that 'layer' is a polygon layer
  features = layer.getFeatures()
  for f in features:
    geom = f.geometry()
    print "Area:", geom.area()
    print "Perimeter:", geom.length()

Areas and perimeters don't take CRS into account when computed using these
methods from the :class:`QgsGeometry` class. For a more powerful area and
distance calculation, the :class:`QgsDistanceArea` class can be used. If
projections are turned off, calculations will be planar, otherwise they'll be
done on the ellipsoid. When an ellipsoid is not set explicitly, WGS84
parameters are used for calculations.

::

  d = QgsDistanceArea()
  d.setProjectionsEnabled(True)

  print "distance in meters: ", d.measureLine(QgsPoint(10,10),QgsPoint(11,11))

You can find many example of algorithms that are included in QGIS and use these
methods to analyze and transform vector data. Here are some links to the code
of a few of them.

Additional information can be found in followinf sources:

* Geometry transformation: `Reproject algorithm <https://raw.github.com/qgis/QGIS/release-2_0/python/plugins/processing/algs/ftools/ReprojectLayer.py>`_
* Distance and area using the :class:`QgsDistanceArea` class: `Distance matrix algorithm <https://raw.github.com/qgis/QGIS/release-2_0/python/plugins/processing/algs/ftools/PointDistance.py>`_
* `Multi-part to single-part algorithm <https://raw.github.com/qgis/QGIS/release-2_0/python/plugins/processing/algs/ftools/MultipartToSingleparts.py>`_
