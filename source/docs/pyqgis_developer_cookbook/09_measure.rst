.. index:: measuring

.. _measure:

*********
Measuring
*********

To compute distances or areas, use :class:`QgsDistanceArea` class. If
projections are turned off, calculations will be planar, otherwise they'll be
done on ellipsoid. When ellipsoid is not set explicitly it uses WGS84
parameters for calculations. ::

  d = QgsDistanceArea()
  d.setProjectionsEnabled(True)
  
  print "distance in meters: ", d.measureLine(QgsPoint(10,10),QgsPoint(11,11))


**TODO:** area, planar vs. ellipsoid
