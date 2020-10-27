
.. testsetup:: temporal_data

    iface = start_qgis()


.. highlight:: python
   :linenothreshold: 5

The code snippets on this page need the following imports if you're outside the pyqgis console:

.. testcode:: expr

    from qgis.core import (
        QgsApplication,
        QgsField,
        QgsMapRendererCustomPainterJob,
        QgsProject,
        QgsMapRendererCustomPainterJob,
        QgsMapSettings,
        QgsRectangle,
        QgsTemporalUtils,
        QgsUnitTypes,
        QgsVectorLayer,
        QgsVectorLayerTemporalProperties
    )

    import tempfile
    import os


.. index:: Temporal data

.. _temporal_data:

******************************
Handling Temporal data in QGIS
******************************

.. contents::
   :local:

Since QGIS 3.14 QGIS has native tools and GUI elements to handle Temporal Data.

Since QGIS 3.16 you can use PyQGIS to register a layer in a plugin to be used as Temporal Data.


Registering a Vector layer as Temporal
======================================

.. testcode:: temporal_data

   # load simple world layer from internal QGIS
   # currently failing in Travis because the gpgk/resources not readable by normal user...
   #iface.addVectorLayer(os.path.join(QgsApplication.pkgDataPath(),'resources','data','world_map.gpkg|layername=Countries'), '', 'ogr')

   # load geojson earthquake data of last (or 7) days from https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php
   # https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson
   # https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson
   # or from file if better?
   time_layer = iface.addVectorLayer('https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson', 'earthquakes', 'ogr')

   # argh, this data only has datetime as epoch (seconds since 1970)
   # so we create a virtual column
   datetime_field = QgsField('datetime', QVariant.DateTime)
   time_layer.addExpressionField(' datetime_from_epoch(  "time" ) ', datetime_field)
   # now the time_layer has a column 'datetime' of type 'DateTime' needed for temporal manipulation

   # get the temporal properties of the time layer
   temporal_props = time_layer.temporalProperties()
   # set the temporal mode to 'DateTime comes from one attribute field'
   temporal_props.setMode(QgsVectorLayerTemporalProperties.ModeFeatureDateTimeInstantFromField)
   # set the 'start' of the event to be the (virtual) datetime field
   temporal_props.setStartField('datetime')

   # tell the layer props that the 'events' lasted about 1 hour (fictional)
   temporal_props.setDurationUnits(QgsUnitTypes.TemporalUnit.TemporalSeconds)
   temporal_props.setFixedDuration(3600)  # setting the LAYERS event duration

   # NOW enable the layer as 'temporal enabled'
   temporal_props.setIsActive(True) # OK

   # to update the legend (the temporal indicator) if not showing up:
   # node=QgsProject.instance().layerTreeRoot().findLayer(time_layer) # find QgsLayerTreeLayer in QgsLayerTree
   # iface.layerTreeView().model().refreshLayerLegend(node)

   # get a handle to current project and determine start and end range of ALL current temporal enabled layers
   project = QgsProject.instance()
   time_range = QgsTemporalUtils.calculateTemporalRangeForProject(project)
   print(f'Project Temporal Range: start: {time_range.begin().toString()} end: {time_range.end().toString()}')

   # get the current  responsible for the mapCanvas behaviour and Temporal Controller gui
   navigator = iface.mapCanvas().temporalController()

   # update the 'range' of the object (so the limits) to reflect the range of our current project
   navigator.setTemporalExtents(time_range)

   # OK, all setup now. let's rewind to start and play one loop
   # NOTE: currently there seems no way to 'enable' the gui. That is: it will play, but the widget is not updated to show it (if Temporal Navigation was disabled)
   navigator.rewindToStart()
   navigator.playForward()

Saving temporal images
======================

.. testcode:: temporal_data

   # now create an set of images so you can create an animated gif or so
   def render_time_range(map_settings, time_range):
     img = QImage(map_settings.outputSize(), map_settings.outputImageFormat())
     img.fill(map_settings.backgroundColor().rgb())

     p = QPainter()
     p.begin(img)
     map_settings.setTemporalRange(time_range)
     render = QgsMapRendererCustomPainterJob(map_settings, p)
     render.start()
     render.waitForFinished()
     p.end()
     return img

   navigator = iface.mapCanvas().temporalController()
   # check and stop it if it is running
   if not navigator.animationState() == QgsTemporalNavigationObject.AnimationState.Idle:
       navigator.setAnimationState(QgsTemporalNavigationObject.AnimationState.Idle)
   # just to be sure
   navigator.rewindToStart()


   map_settings = QgsMapSettings()
   # setup all your default map settings stuff here, e.g. scale, extent, image size, etc
   map_settings.setLayers(iface.mapCanvas().layers())
   map_settings.setOutputSize(QSize(300, 150)) # width, height
   rect = QgsRectangle(iface.mapCanvas().fullExtent())
   rect.scale(1.0)
   map_settings.setExtent(rect)
   map_settings.setIsTemporal(True)

   save_dir = tempfile.gettempdir() + os.sep
   for frame_number in range(0, navigator.totalFrameCount()):
       frame_range = navigator.dateTimeRangeForFrameNumber(frame_number)
       img = render_time_range(map_settings, frame_range)
       ok = img.save(f'{save_dir}{frame_number:04d}.png') # should show "<frame number> True"
       print(f'Frame {frame_number} saved in {save_dir} as {frame_number:04d}.png, OK = {ok}')

   # you could now cd into the save_dir and do:
   # ffmpeg -y -r 1 -i %4d.png -vcodec libx264 -vf "fps=1,scale=-2:720" -pix_fmt yuv420p -r 4 movie.mp4
   # ffmpeg -y -r 1 -i %4d.png -vf "fps=6,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 movie.gif


