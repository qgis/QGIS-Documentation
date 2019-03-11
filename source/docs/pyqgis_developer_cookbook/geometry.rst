.. only:: html

   |updatedisclaimer|

.. index:: Geometry; Handling

.. _geometry:

*****************
Geometry Handling
*****************

.. contents::
   :local:

Points, linestrings and polygons that represent a spatial feature are commonly
referred to as geometries. In QGIS they are represented with the
:class:`QgsGeometry <qgis.core.QgsGeometry>` class.

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

PyQGIS provides several options for creating a geometry:

* from coordinates

  .. code-block:: python

    gPnt = QgsGeometry.fromPointXY(QgsPointXY(1,1))
    gLine = QgsGeometry.fromPolyline([QgsPoint(1, 1), QgsPoint(2, 2)])
    gPolygon = QgsGeometry.fromPolygonXY([[QgsPointXY(1, 1),
       QgsPointXY(2, 2), QgsPointXY(2, 1)]])

  Coordinates are given using :class:`QgsPoint <qgis.core.QgsPoint>` class or :class:`QgsPointXY <qgis.core.QgsPointXY>`
  class. The difference between these classes is that :class:`QgsPoint <qgis.core.QgsPoint>`
  supports M and Z dimensions.

  A Polyline (Linestring) is represented by a list of points.

  A Polygon is
  represented by a list of linear rings (i.e. closed linestrings). The first ring
  is the outer ring (boundary), optional subsequent rings are holes in the polygon.
  Note that unlike some programs, QGIS will close the ring for you so there is
  no need to duplicate the first point as the last.

  Multi-part geometries go one level further: multi-point is a list of points,
  multi-linestring is a list of linestrings and multi-polygon is a list of
  polygons.

* from well-known text (WKT)

  .. code-block:: python

    gem = QgsGeometry.fromWkt("POINT(3 4)")

* from well-known binary (WKB)

  .. code-block:: python

    g = QgsGeometry()
    wkb = bytes.fromhex("010100000000000000000045400000000000001440")
    g.fromWkb(wkb)
    g.asWkt()
    'Point (42 5)'


.. index:: Geometry; Access to

Access to Geometry
==================

First, you should find out the geometry type. The :meth:`wkbType() <qgis.core.QgsGeometry.wkbType>` method is the one to
use. It returns a value from the :class:`QgsWkbTypes.Type <qgis.core.QgsWkbTypes>` enumeration

.. code-block:: python

  >>> gPnt.wkbType() == QgsWkbTypes.Point
  True
  >>> gLine.wkbType() == QgsWkbTypes.LineString
  True
  >>> gPolygon.wkbType() == QgsWkbTypes.Polygon
  True
  >>> gPolygon.wkbType() == QgsWkbTypes.MultiPolygon
  False

As an alternative, one can use :meth:`wkbType() <qgis.core.QgsGeometry.wkbType>` method which returns a value from
:class:`QgsWkbTypes.GeometryType <qgis.core.QgsWkbTypes>` enumeration.

You can use the func:`wkbType() <qgis.core.QgsWkbTypes.displayString>` function to get a human readable geometry type.

.. code-block:: python

  >>> gPnt.wkbType()
  1
  >>> QgsWkbTypes.displayString(int(gPnt.wkbType()))
  'Point'

There is also a helper function
:meth:`isMultipart() <qgis.core.QgsGeometry.isMultipart>` to find out whether a geometry is multipart or not.

To extract information from a geometry there are accessor functions for every
vector type. Here's an example on how to use these accessors:

.. code-block:: python

  >>> gPnt.asPoint()
  <QgsPointXY: POINT(1 1)>
  >>> gLine.asPolyline()
  [<QgsPointXY: POINT(1 1)>, <QgsPointXY: POINT(2 2)>]
  >>> gPolygon.asPolygon()
  [[<QgsPointXY: POINT(1 1)>, <QgsPointXY: POINT(2 2)>, <QgsPointXY: POINT(2 1)>, <QgsPointXY: POINT(1 1)>]]

.. note:: The tuples (x,y) are not real tuples, they are :class:`QgsPoint <qgis.core.QgsPoint>`
   objects, the values are accessible with :meth:`x() <qgis.core.QgsPoint.x>` () and :meth:`y() <qgis.core.QgsPoint.y>` methods.

For multipart geometries there are similar accessor functions:
:meth:`asMultiPoint() <qgis.core.QgsGeometry.asMultiPoint>`, :meth:`asMultiPolyline() <qgis.core.QgsGeometry.asMultiPolyline>` and :meth:`asMultiPolygon() <qgis.core.QgsGeometry.asMultiPolygon>`


qgis.core.QgsGeometry.asMultiPoint
.. index:: Geometry; Predicates and operations

Geometry Predicates and Operations
==================================

QGIS uses GEOS library for advanced geometry operations such as geometry
predicates (:meth:`contains() <qgis.core.QgsGeometry.contains>`, :meth:`intersects() <qgis.core.QgsGeometry.intersects>`, …) and set operations
(:meth:`combine() <qgis.core.QgsGeometry.combine>`, :meth:`difference() <qgis.core.QgsGeometry.difference>`, …). It can also compute geometric
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
methods from the :class:`QgsGeometry <qgis.core.QgsGeometry>` class. For a more powerful area and
distance calculation, the :class:`QgsDistanceArea <qgis.core.QgsDistanceArea>` class can be used, which can perform ellipsoid based calculations.

.. code-block:: python

  d = QgsDistanceArea()
  d.setEllipsoid('WGS84')

  # we assume that 'layer' is a polygon layer
  features = layer.getFeatures()
  for f in features:
    geom = f.geometry()
    print("Area:", d.measureArea(geom))
    print("Perimeter:", d.measurePerimeter(geom))

  # convert to "better" units
  features = layer.getFeatures()
  for f in features:
      geom = f.geometry()
      print("Area:", d.convertAreaMeasurement(d.measureArea(geom), QgsUnitTypes.AreaSquareKilometers))

Alternatively, you may want to know the distance and bearing between two points:

.. code-block:: python

  d = QgsDistanceArea()
  d.setEllipsoid('WGS84')
  print("distance in meters: ",
    d.measureLine(QgsPointXY(10,10),QgsPointXY(11,11)))
  print("angle in degrees: ",
    math.degrees(d.bearing(QgsPointXY(10,10),QgsPointXY(11,11))))

You can find many example of algorithms that are included in QGIS and use these
methods to analyze and transform vector data. Here are some links to the code
of a few of them.

* Distance and area using the :class:`QgsDistanceArea <qgis.core.QgsDistanceArea>` class: `Distance matrix algorithm <https://github.com/qgis/QGIS/blob/master/python/plugins/processing/algs/qgis/PointDistance.py>`_
* `Lines to polygons algorithm <https://github.com/qgis/QGIS/blob/master/python/plugins/processing/algs/qgis/LinesToPolygons.py>`_

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
