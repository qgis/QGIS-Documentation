
.. testsetup:: temporal_data

    iface = start_qgis()


.. highlight:: python
   :linenothreshold: 5

The code snippets on this page need the following imports if you're outside the pyqgis console:

.. testcode:: expr

    from qgis.core import (
        QgsVectorLayer,
        QgsProject
    )

.. index:: Temporal data

.. _temporal_data:

******************************
Handling Temporal data in QGIS
******************************

.. contents::
   :local:

Since QGIS 3.14 QGIS has native tools to handle Temporal Data. 
There is a Temporal data navigation Widget to configure QGIS, and in PyQGIS there
is the QgsTemporalNavigationObject

.. testcode:: temporal_data

    def render_time_range(map_settings, time_range):
       img = QImage(map_settings.outputSize(), map_settings.outputImageFormat())
       img.fill(map_settings.backgroundColor().rgb())

       p = QPainter()
       p.begin(img)

       map_settings.setIsTemporal(True)
       map_settings.setTemporalRange(time_range)

      render = QgsMapRendererCustomPainterJob(map_settings, p)
      render.start()
      render.waitForFinished()
      p.end()

      return img


    map_settings = QgsMapSettings()
    # setup all your default map settings stuff here, e.g. scale, extent,
    image size, etc
    img = render_time_range(map_settings,
    QgsDateTimeRange(QDateTime(2020,1,2), QDateTime(2020,3,1)))
    img.save(...)
    img = render_time_range(map_settings,
    QgsDateTimeRange(QDateTime(2020,3,1), QDateTime(2020,4,1)))
    img.save(...)

It should be nice and fast, and because it works directly with
QgsMapSettings you can now specify the EXACT output size and scale,
etc instead of the frustration of trying to resize the canvas itself
to an exact size.

Now, you could either loop over a time range and keep calling
render_time_range, OR you could use the new core class
QgsTemporalNavigationObject to iterate over the range for you!...

.. testcode:: temporal_data

    navigator = QgsTemporalNavigationObject()
    # set OVERALL time range
    navigator.setTemporalExtents(QgsDateTimeRange(2019,1,1),
    QgsDateTimeRange(2019,12,31))
    # each frame will be 1 day
    navigator.setFrameDuration(QgsInterval(1, QgsUnitTypes.TemporalDays))

    # export full range:
    for frame_number in range(navigator.totalFrameCount()):
        frame_range = navigator.dateTimeRangeForFrameNumber(frame_number)
        img = render_time_range(map_settings, frame_range)
        img.save( ... )

This takes all the hard work away, since you don't need to manually
calculate the date time range for each frame!
