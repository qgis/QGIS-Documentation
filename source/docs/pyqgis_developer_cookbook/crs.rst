.. _crs:

*******************
Projections Support
*******************

.. index:: coordinate reference systems

Coordinate reference systems
============================

Coordinate reference systems (CRS) are encapsulated by
:class:`QgsCoordinateReferenceSystem` class. Instances of this class can be
created by several different ways:

* specify CRS by its ID

  ::

    # PostGIS SRID 4326 is allocated for WGS84
    crs = QgsCoordinateReferenceSystem(4326, QgsCoordinateReferenceSystem.PostgisCrsId)

  QGIS uses three different IDs for every reference system:

  * :const:`PostgisCrsId` --- IDs used within PostGIS databases.
  * :const:`InternalCrsId` --- IDs internally used in QGIS database.
  * :const:`EpsgCrsId` --- IDs assigned by the EPSG organization

  If not specified otherwise in second parameter, PostGIS SRID is used by default.

* specify CRS by its well-known text (WKT)

  ::

    wkt = 'GEOGCS["WGS84", DATUM["WGS84", SPHEROID["WGS84", 6378137.0, 298.257223563]],'
           PRIMEM["Greenwich", 0.0], UNIT["degree",0.017453292519943295],'
           AXIS["Longitude",EAST], AXIS["Latitude",NORTH]]'
    crs = QgsCoordinateReferenceSystem(wkt)

* create invalid CRS and then use one of the :func:`create*` functions to
  initialize it. In following example we use Proj4 string to initialize the
  projection

  ::

    crs = QgsCoordinateReferenceSystem()
    crs.createFromProj4("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")

It's wise to check whether creation (i.e. lookup in the database) of the CRS
has been successful: :func:`isValid` must return :const:`True`.

Note that for initialization of spatial reference systems QGIS needs to look up
appropriate values in its internal database :file:`srs.db`. Thus in case you
create an independent application you need to set paths correctly with
:func:`QgsApplication.setPrefixPath` otherwise it will fail to find the
database. If you are running the commands from QGIS python console or
developing a plugin you do not care: everything is already set up for you.

Accessing spatial reference system information

::

  print "QGIS CRS ID:", crs.srsid()
  print "PostGIS SRID:", crs.srid()
  print "EPSG ID:", crs.epsg()
  print "Description:", crs.description()
  print "Projection Acronym:", crs.projectionAcronym()
  print "Ellipsoid Acronym:", crs.ellipsoidAcronym()
  print "Proj4 String:", crs.proj4String()
  # check whether it's geographic or projected coordinate system
  print "Is geographic:", crs.geographicFlag()
  # check type of map units in this CRS (values defined in QGis::units enum)
  print "Map units:", crs.mapUnits()

.. index:: projections

Projections
===========

You can do transformation between different spatial reference systems by using
:class:`QgsCoordinateTransform` class. The easiest way to use it is to create
source and destination CRS and construct :class:`QgsCoordinateTransform`
instance with them. Then just repeatedly call :func:`transform` function to do
the transformation. By default it does forward transformation, but it is
capable to do also inverse transformation

::

  crsSrc = QgsCoordinateReferenceSystem(4326)    # WGS 84
  crsDest = QgsCoordinateReferenceSystem(32633)  # WGS 84 / UTM zone 33N
  xform = QgsCoordinateTransform(crsSrc, crsDest)

  # forward transformation: src -> dest
  pt1 = xform.transform(QgsPoint(18,5))
  print "Transformed point:", pt1

  # inverse transformation: dest -> src
  pt2 = xform.transform(pt1, QgsCoordinateTransform.ReverseTransform)
  print "Transformed back:", pt2
