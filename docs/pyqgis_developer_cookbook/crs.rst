.. highlight:: python
   :linenothreshold: 5

.. testsetup:: crs

    iface = start_qgis()

.. _crs:

*******************
Projections Support
*******************

.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: crs

    from qgis.core import (
        QgsCoordinateReferenceSystem,
        QgsCoordinateTransform,
        QgsProject,
        QgsPointXY,
    )

.. only:: html

   .. contents::
      :local:

.. index:: Coordinate reference systems

Coordinate reference systems
============================

Coordinate reference systems (CRS) are encapsulated by the
:class:`QgsCoordinateReferenceSystem <qgis.core.QgsCoordinateReferenceSystem>`
class. Instances of this class can be created in several different ways:

* specify CRS by its ID

  .. testcode:: crs

     # EPSG 4326 is allocated for WGS84
     crs = QgsCoordinateReferenceSystem("EPSG:4326")
     print(crs.isValid())

  .. testoutput:: crs

     True

  QGIS supports different CRS identifiers with the following formats:

  * ``EPSG:<code>`` --- ID assigned by the EPSG organization - handled with :meth:`createFromOgcWms() <qgis.core.QgsCoordinateReferenceSystem.createFromOgcWmsCrs>`
  * ``POSTGIS:<srid>``--- ID used in PostGIS databases - handled with :meth:`createFromSrid() <qgis.core.QgsCoordinateReferenceSystem.createFromSrid>`
  * ``INTERNAL:<srsid>`` --- ID used in the internal QGIS database - handled with :meth:`createFromSrsId() <qgis.core.QgsCoordinateReferenceSystem.createFromSrsId>`
  * ``PROJ:<proj>`` - handled with :meth:`createFromProj() <qgis.core.QgsCoordinateReferenceSystem.createFromProj>`
  * ``WKT:<wkt>`` - handled with :meth:`createFromWkt() <qgis.core.QgsCoordinateReferenceSystem.createFromWkt>`

If no prefix is specified, WKT definition is assumed.

* specify CRS by its well-known text (WKT)

  .. testcode:: crs

     wkt = 'GEOGCS["WGS84", DATUM["WGS84", SPHEROID["WGS84", 6378137.0, 298.257223563]],' \
           'PRIMEM["Greenwich", 0.0], UNIT["degree",0.017453292519943295],' \
           'AXIS["Longitude",EAST], AXIS["Latitude",NORTH]]'
     crs = QgsCoordinateReferenceSystem(wkt)
     print(crs.isValid())

  .. testoutput:: crs

     True

* create an invalid CRS and then use one of the ``create*`` functions to
  initialize it. In the following example we use a Proj string to initialize the
  projection.

  .. testcode:: crs

     crs = QgsCoordinateReferenceSystem()
     crs.createFromProj("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
     print(crs.isValid())

  .. testoutput:: crs

     True

It's wise to check whether creation (i.e. lookup in the database) of the CRS
has been successful: :meth:`isValid() <qgis.core.QgsCoordinateReferenceSystem.isValid>`
must return :const:`True`.

Note that for initialization of spatial reference systems QGIS needs to look up
appropriate values in its internal database :file:`srs.db`. Thus in case you
create an independent application you need to set paths correctly with
:meth:`QgsApplication.setPrefixPath() <qgis.core.QgsApplication.setPrefixPath>`,
otherwise it will fail to find the
database. If you are running the commands from the QGIS Python console or
developing a plugin you do not care: everything is already set up for you.

Accessing spatial reference system information:

.. testcode:: crs

   crs = QgsCoordinateReferenceSystem("EPSG:4326")

   print("QGIS CRS ID:", crs.srsid())
   print("PostGIS SRID:", crs.postgisSrid())
   print("Description:", crs.description())
   print("Projection Acronym:", crs.projectionAcronym())
   print("Ellipsoid Acronym:", crs.ellipsoidAcronym())
   print("Proj String:", crs.toProj())
   # check whether it's geographic or projected coordinate system
   print("Is geographic:", crs.isGeographic())
   # check type of map units in this CRS (values defined in QGis::units enum)
   print("Map units:", crs.mapUnits())

Output:

.. testoutput:: crs

   QGIS CRS ID: 3452
   PostGIS SRID: 4326
   Description: WGS 84
   Projection Acronym: longlat
   Ellipsoid Acronym: EPSG:7030
   Proj String: +proj=longlat +datum=WGS84 +no_defs
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

.. testcode:: crs

   crsSrc = QgsCoordinateReferenceSystem("EPSG:4326")    # WGS 84
   crsDest = QgsCoordinateReferenceSystem("EPSG:32633")  # WGS 84 / UTM zone 33N
   transformContext = QgsProject.instance().transformContext()
   xform = QgsCoordinateTransform(crsSrc, crsDest, transformContext)

   # forward transformation: src -> dest
   pt1 = xform.transform(QgsPointXY(18,5))
   print("Transformed point:", pt1)

   # inverse transformation: dest -> src
   pt2 = xform.transform(pt1, QgsCoordinateTransform.ReverseTransform)
   print("Transformed back:", pt2)

Output:

.. testoutput:: crs

   Transformed point: <QgsPointXY: POINT(832713.79873844375833869 553423.98688333143945783)>
   Transformed back: <QgsPointXY: POINT(18 4.99999999999999911)>
