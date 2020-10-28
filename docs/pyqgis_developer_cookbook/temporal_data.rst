
.. testsetup:: temporal_data

    iface = start_qgis()


.. highlight:: python
   :linenothreshold: 5

The code snippets on this page need the following imports if you're outside the pyqgis console:

.. testcode:: temporal_data

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

    from qgis.PyQt.Core import (
        QVariant,
        QSize
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

QGIS has native tools and GUI elements to handle Temporal Data.
Using PyQGIS, you can register a layer in a plugin to be used as Temporal Data.


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

    # get the current  responsible for the mapCanvas behaviour and Temporal Controller gui
    navigator = iface.mapCanvas().temporalController()

    # update the 'range' of the object (so the limits) to reflect the range of our current project
    navigator.setTemporalExtents(time_range)

    # OK, all setup now. let's show Temporal controller, `rewind to start and play one loop
    navigator.setNavigationMode(QgsTemporalNavigationObject.Animated) # will show controller
    navigator.rewindToStart()
    navigator.playForward()

Saving temporal images
======================

.. testcode:: temporal_data

    # now create a set of images so you can create an animated gif or mp4 movie of it

    # setup all your map settings stuff here, e.g. scale, extent, image size, etc
    map_settings = QgsMapSettings()
    map_settings.setLayers(iface.mapCanvas().layers())
    map_settings.setOutputSize(QSize(300, 150)) # width, height
    rect = QgsRectangle(iface.mapCanvas().fullExtent())
    rect.scale(1.0)
    map_settings.setExtent(rect)
    map_settings.setIsTemporal(True)

    navigator = iface.mapCanvas().temporalController()
    save_dir = tempfile.gettempdir() + os.sep

    # setup animation settings, using current navigation state (OR create other)
    animation_settings=QgsTemporalUtils.AnimationExportSettings()
    animation_settings.animationRange=navigator.temporalExtents()
    animation_settings.frameDuration=navigator.frameDuration()
    animation_settings.outputDirectory=save_dir
    animation_settings.fileNameTemplate='frame####.png'
    animation_settings.decorations=[]

    print(QgsTemporalUtils.exportAnimation(map_settings, animation_settings))

    # you could now cd into the save_dir and do:
    # ffmpeg -y -r 1 -i %4d.png -vcodec libx264 -vf "fps=1,scale=-2:720" -pix_fmt yuv420p -r 4 movie.mp4
    # ffmpeg -y -r 1 -i %4d.png -vf "fps=6,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 movie.gif

.. testoutput:: temporal_data

    (True, '')

