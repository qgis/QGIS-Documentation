.. only:: html

   |updatedisclaimer|

.. _crs:

*******************
Projections Support
*******************

.. contents::
   :local:

If you're outside the pyqgis console, the code snippets on this page need the
following imports:

.. testcode::

   from qgis.core import (QgsCoordinateReferenceSystem,
                          QgsCoordinateTransform,
                          QgsProject,
                          QgsPointXY,
                          )

.. index:: Coordinate reference systems

Coordinate reference systems
============================

Coordinate reference systems (CRS) are encapsulated by the
:class:`QgsCoordinateReferenceSystem <qgis.core.QgsCoordinateReferenceSystem>`
class. Instances of this class can be created in several different ways:

* specify CRS by its ID

  .. testcode::

     # PostGIS SRID 4326 is allocated for WGS84
     crs = QgsCoordinateReferenceSystem(4326, QgsCoordinateReferenceSystem.PostgisCrsId)
     assert crs.isValid()

  QGIS uses three different IDs for every reference system:

  * :attr:`InternalCrsId <qgis.core.QgsCoordinateReferenceSystem.InternalCrsId>` --- IDs internally used in QGIS database.
  * :attr:`PostgisCrsId <qgis.core.QgsCoordinateReferenceSystem.PostgisCrsId>` --- IDs used within PostGIS databases.
  * :attr:`EpsgCrsId <qgis.core.QgsCoordinateReferenceSystem.EpsgCrsId>` --- IDs assigned by the EPSG organization

  If not specified otherwise in second parameter, PostGIS SRID is used by default.

* specify CRS by its well-known text (WKT)

  .. testcode::

     wkt = 'GEOGCS["WGS84", DATUM["WGS84", SPHEROID["WGS84", 6378137.0, 298.257223563]],' \
           'PRIMEM["Greenwich", 0.0], UNIT["degree",0.017453292519943295],' \
           'AXIS["Longitude",EAST], AXIS["Latitude",NORTH]]'
     crs = QgsCoordinateReferenceSystem(wkt)
     assert crs.isValid()

* create invalid CRS and then use one of the ``create*`` functions to
  initialize it. In the following example we use Proj4 string to initialize the
  projection

  .. testcode::

     crs = QgsCoordinateReferenceSystem()
     crs.createFromProj4("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
     assert crs.isValid()

It's wise to check whether creation (i.e. lookup in the database) of the CRS
has been successful: :meth:`isValid() <qgis.core.QgsCoordinateReferenceSystem.isValid>`
must return ``True``.

Note that for initialization of spatial reference systems QGIS needs to look up
appropriate values in its internal database :file:`srs.db`. Thus in case you
create an independent application you need to set paths correctly with
:meth:`QgsApplication.setPrefixPath() <qgis.core.QgsApplication.setPrefixPath>`
otherwise it will fail to find the
database. If you are running the commands from QGIS python console or
developing a plugin you do not care: everything is already set up for you.

Accessing spatial reference system information:

.. testcode::

   crs = QgsCoordinateReferenceSystem(4326)

   print("QGIS CRS ID:", crs.srsid())
   print("PostGIS SRID:", crs.postgisSrid())
   print("Description:", crs.description())
   print("Projection Acronym:", crs.projectionAcronym())
   print("Ellipsoid Acronym:", crs.ellipsoidAcronym())
   print("Proj4 String:", crs.toProj4())
   # check whether it's geographic or projected coordinate system
   print("Is geographic:", crs.isGeographic())
   # check type of map units in this CRS (values defined in QGis::units enum)
   print("Map units:", crs.mapUnits())

Output:

.. testoutput::

   QGIS CRS ID: 3452
   PostGIS SRID: 4326
   Description: WGS 84
   Projection Acronym: longlat
   Ellipsoid Acronym: WGS84
   Proj4 String: +proj=longlat +datum=WGS84 +no_defs
   Is geographic: True
   Map units: 6

.. index:: Projections

CRS Transformation
==================

You can do transformation between different spatial reference systems by using
the :class:`QgsCoordinateTransform <qgis.core.QgsCoordinateTransform>` class.
The easiest way to use it is to create a source and destination CRS and
construct a :class:`QgsCoordinateTransform <qgis.core.QgsCoordinateTransform>`
instance with them and the current project. Then just repeatedly call
:meth:`transform() <qgis.core.QgsCoordinateTransform.transform>` function to do
the transformation. By default it does forward transformation, but it is capable
to do also inverse transformation.

.. testcode::

   crsSrc = QgsCoordinateReferenceSystem(4326)    # WGS 84
   crsDest = QgsCoordinateReferenceSystem(32633)  # WGS 84 / UTM zone 33N
   xform = QgsCoordinateTransform(crsSrc, crsDest, QgsProject.instance())

   # forward transformation: src -> dest
   pt1 = xform.transform(QgsPointXY(18,5))
   print("Transformed point:", pt1)

   # inverse transformation: dest -> src
   pt2 = xform.transform(pt1, QgsCoordinateTransform.ReverseTransform)
   print("Transformed back:", pt2)

Output:

.. testoutput::

   Transformed point: <QgsPointXY: POINT(832713.79873844375833869 553423.98688333143945783)>
   Transformed back: <QgsPointXY: POINT(18 5)>

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
