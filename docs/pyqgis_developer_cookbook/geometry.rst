.. index:: Geometry; Handling

.. highlight:: python
   :linenothreshold: 5

.. testsetup:: geometry

    iface = start_qgis()

    from qgis.core import (
      QgsProject,
      QgsVectorLayer,
    )

    # Load the countries layer
    if not QgsProject.instance().mapLayersByName("countries"):
        vlayer = QgsVectorLayer("/usr/share/qgis/resources/data/world_map.gpkg|layerName=countries", "countries", "ogr")
        assert vlayer.isValid()
        QgsProject.instance().addMapLayers([vlayer])

.. _geometry:

*****************
Geometry Handling
*****************

.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

 .. testcode:: geometry

    from qgis.core import (
      QgsGeometry,
      QgsGeometryCollection,
      QgsPoint,
      QgsPointXY,
      QgsWkbTypes,
      QgsProject,
      QgsFeatureRequest,
      QgsVectorLayer,
      QgsDistanceArea,
      QgsUnitTypes,
      QgsCoordinateTransform,
      QgsCoordinateReferenceSystem
    )

.. only:: html

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
<https://www.ogc.org/standards/sfa>`_ for advanced details.

.. index:: Geometry; Construction

Geometry Construction
=====================

PyQGIS provides several options for creating a geometry:

* from coordinates

  .. testcode:: geometry

    gPnt = QgsGeometry.fromPointXY(QgsPointXY(1,1))
    print(gPnt)
    gLine = QgsGeometry.fromPolyline([QgsPoint(1, 1), QgsPoint(2, 2)])
    print(gLine)
    gPolygon = QgsGeometry.fromPolygonXY([[QgsPointXY(1, 1),
	QgsPointXY(2, 2), QgsPointXY(2, 1)]])
    print(gPolygon)

  .. testoutput:: geometry
    :hide:

    <QgsGeometry: Point (1 1)>
    <QgsGeometry: LineString (1 1, 2 2)>
    <QgsGeometry: Polygon ((1 1, 2 2, 2 1, 1 1))>

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

  .. testcode:: geometry

    geom = QgsGeometry.fromWkt("POINT(3 4)")
    print(geom)

  .. testoutput:: geometry
    :hide:

    <QgsGeometry: Point (3 4)>

* from well-known binary (WKB)

  .. testcode:: geometry

    g = QgsGeometry()
    wkb = bytes.fromhex("010100000000000000000045400000000000001440")
    g.fromWkb(wkb)

    # print WKT representation of the geometry
    print(g.asWkt())

  .. testoutput:: geometry
    :hide:

    Point (42 5)

.. index:: Geometry; Access to

Access to Geometry
==================

First, you should find out the geometry type. The :meth:`wkbType() <qgis.core.QgsGeometry.wkbType>`
method is the one to use. It returns a value from the :class:`QgsWkbTypes.Type <qgis.core.QgsWkbTypes>`
enumeration.

.. testcode:: geometry

  print(gPnt.wkbType())
  # output: 1
  print(gLine.wkbType())
  # output: 2
  print(gPolygon.wkbType())
  # output: 3

.. testoutput:: geometry
  :hide:

  1
  2
  3

As an alternative, one can use the :meth:`type() <qgis.core.QgsGeometry.type>`
method which returns a value from the :meth:`QgsWkbTypes.GeometryType <qgis.core.QgsWkbTypes.geometryType>`
enumeration.

.. testcode:: geometry

  print(gLine.type())
  # output: 1

.. testoutput:: geometry
  :hide:

  1

You can use the :meth:`displayString() <qgis.core.QgsWkbTypes.displayString>`
function to get a human readable geometry type.

.. testcode:: geometry

  print(QgsWkbTypes.displayString(gPnt.wkbType()))
  # output: 'Point'
  print(QgsWkbTypes.displayString(gLine.wkbType()))
  # output: 'LineString'
  print(QgsWkbTypes.displayString(gPolygon.wkbType()))
  # output: 'Polygon'

.. testoutput:: geometry
  :hide:

  Point
  LineString
  Polygon

There is also a helper function
:meth:`isMultipart() <qgis.core.QgsGeometry.isMultipart>` to find out whether a geometry is multipart or not.

To extract information from a geometry there are accessor functions for every
vector type. Here's an example on how to use these accessors:

.. testcode:: geometry

  print(gPnt.asPoint())
  # output: <QgsPointXY: POINT(1 1)>
  print(gLine.asPolyline())
  # output: [<QgsPointXY: POINT(1 1)>, <QgsPointXY: POINT(2 2)>]
  print(gPolygon.asPolygon())
  # output: [[<QgsPointXY: POINT(1 1)>, <QgsPointXY: POINT(2 2)>, <QgsPointXY: POINT(2 1)>, <QgsPointXY: POINT(1 1)>]]

.. testoutput:: geometry
  :hide:

  <QgsPointXY: POINT(1 1)>
  [<QgsPointXY: POINT(1 1)>, <QgsPointXY: POINT(2 2)>]
  [[<QgsPointXY: POINT(1 1)>, <QgsPointXY: POINT(2 2)>, <QgsPointXY: POINT(2 1)>, <QgsPointXY: POINT(1 1)>]]


.. note:: The tuples (x,y) are not real tuples, they are :class:`QgsPoint <qgis.core.QgsPoint>`
   objects, the values are accessible with :meth:`x() <qgis.core.QgsPoint.x>`
   and :meth:`y() <qgis.core.QgsPoint.y>` methods.

For multipart geometries there are similar accessor functions:
:meth:`asMultiPoint() <qgis.core.QgsGeometry.asMultiPoint>`,
:meth:`asMultiPolyline() <qgis.core.QgsGeometry.asMultiPolyline>`
and :meth:`asMultiPolygon() <qgis.core.QgsGeometry.asMultiPolygon>`.


It is possible to iterate over all the parts of a geometry,
regardless of the geometry's type. E.g.

.. testcode:: geometry

  geom = QgsGeometry.fromWkt( 'MultiPoint( 0 0, 1 1, 2 2)' )
  for part in geom.parts():
    print(part.asWkt())

.. testoutput:: geometry

  Point (0 0)
  Point (1 1)
  Point (2 2)

.. testcode:: geometry

  geom = QgsGeometry.fromWkt( 'LineString( 0 0, 10 10 )' )
  for part in geom.parts():
    print(part.asWkt())

.. testoutput:: geometry

  LineString (0 0, 10 10)

.. testcode:: geometry

  gc = QgsGeometryCollection()
  gc.fromWkt('GeometryCollection( Point(1 2), Point(11 12), LineString(33 34, 44 45))')
  print(gc[1].asWkt())

.. testoutput:: geometry

  Point (11 12)

It's also possible to modify each part of the geometry using
:meth:`QgsGeometry.parts() <qgis.core.QgsGeometry.parts>` method.

.. testcode:: geometry

    geom = QgsGeometry.fromWkt( 'MultiPoint( 0 0, 1 1, 2 2)' )
    for part in geom.parts():
      part.transform(QgsCoordinateTransform(
        QgsCoordinateReferenceSystem("EPSG:4326"),
        QgsCoordinateReferenceSystem("EPSG:3111"),
        QgsProject.instance())
      )

    print(geom.asWkt())

.. testoutput:: geometry

    MultiPoint ((-10334726.79314758814871311 -5360105.10101194866001606),(-10462133.82917747274041176 -5217484.34365733992308378),(-10589398.51346861757338047 -5072020.35880533326417208))

.. index:: Geometry; Predicates and operations

Geometry Predicates and Operations
==================================

QGIS uses GEOS library for advanced geometry operations such as geometry
predicates (:meth:`contains() <qgis.core.QgsGeometry.contains>`, :meth:`intersects() <qgis.core.QgsGeometry.intersects>`, …) and set operations
(:meth:`combine() <qgis.core.QgsGeometry.combine>`, :meth:`difference() <qgis.core.QgsGeometry.difference>`, …). It can also compute geometric
properties of geometries, such as area (in the case of polygons) or lengths
(for polygons and lines).

Let's see an example that combines iterating over the features in a
given layer and performing some geometric computations based on their
geometries. The below code will compute and print the area and perimeter of
each country in the ``countries`` layer within our tutorial QGIS project.

The following code assumes ``layer`` is a :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>` object that has Polygon feature type.


.. testcode:: geometry

  # let's access the 'countries' layer
  layer = QgsProject.instance().mapLayersByName('countries')[0]

  # let's filter for countries that begin with Z, then get their features
  query = '"name" LIKE \'Z%\''
  features = layer.getFeatures(QgsFeatureRequest().setFilterExpression(query))

  # now loop through the features, perform geometry computation and print the results
  for f in features:
    geom = f.geometry()
    name = f.attribute('NAME')
    print(name)
    print('Area: ', geom.area())
    print('Perimeter: ', geom.length())


.. testoutput:: geometry

    Zambia
    Area:  62.82279065343119
    Perimeter:  50.65232014052552
    Zimbabwe
    Area:  33.41113559136517
    Perimeter:  26.608288555013935

Now you have calculated and printed the areas and perimeters of the geometries.
You may however quickly notice that the values are strange.
That is because areas and perimeters don't take CRS into account when computed
using the :meth:`area() <qgis.core.QgsGeometry.area>` and :meth:`length()
<qgis.core.QgsGeometry.length>`
methods from the :class:`QgsGeometry <qgis.core.QgsGeometry>` class. For a more powerful area and
distance calculation, the :class:`QgsDistanceArea <qgis.core.QgsDistanceArea>`
class can be used, which can perform ellipsoid based calculations:

The following code assumes ``layer`` is a :class:`QgsVectorLayer
<qgis.core.QgsVectorLayer>` object that has Polygon feature type.

.. testcode:: geometry

  d = QgsDistanceArea()
  d.setEllipsoid('WGS84')

  layer = QgsProject.instance().mapLayersByName('countries')[0]

  # let's filter for countries that begin with Z, then get their features
  query = '"name" LIKE \'Z%\''
  features = layer.getFeatures(QgsFeatureRequest().setFilterExpression(query))

  for f in features:
    geom = f.geometry()
    name = f.attribute('NAME')
    print(name)
    print("Perimeter (m):", d.measurePerimeter(geom))
    print("Area (m2):", d.measureArea(geom))

    # let's calculate and print the area again, but this time in square kilometers
    print("Area (km2):", d.convertAreaMeasurement(d.measureArea(geom), QgsUnitTypes.AreaSquareKilometers))


.. testoutput:: geometry

    Zambia
    Perimeter (m): 5539361.250294601
    Area (m2): 751989035032.9031
    Area (km2): 751989.0350329031
    Zimbabwe
    Perimeter (m): 2865021.3325076113
    Area (m2): 389267821381.6008
    Area (km2): 389267.8213816008

Alternatively, you may want to know the distance between two points.

.. testcode:: geometry

  d = QgsDistanceArea()
  d.setEllipsoid('WGS84')

  # Let's create two points.
  # Santa claus is a workaholic and needs a summer break,
  # lets see how far is Tenerife from his home
  santa = QgsPointXY(25.847899, 66.543456)
  tenerife = QgsPointXY(-16.5735, 28.0443)

  print("Distance in meters: ", d.measureLine(santa, tenerife))

.. testoutput:: geometry
  :hide:

  Distance in meters:  5154172.923936774

You can find many example of algorithms that are included in QGIS and use these
methods to analyze and transform vector data. Here are some links to the code
of a few of them.

* Distance and area using the :class:`QgsDistanceArea <qgis.core.QgsDistanceArea>` class:
  :source:`Distance matrix algorithm <python/plugins/processing/algs/qgis/PointDistance.py>`
* :source:`Lines to polygons algorithm <python/plugins/processing/algs/qgis/LinesToPolygons.py>`
