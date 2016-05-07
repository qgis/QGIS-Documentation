.. _substitutions:

*************
Substitutions
*************

.. contents::
   :local:

Usage
=====

To easier the use of icons in QGIS manuals, replacements are defined
for each icon in :file:`/source/conf.py` file at `QGIS-Documentation repository
<https://github.com/qgis/QGIS-Documentation>`_ and some of these substitutions
are listed below.
Thus, when you want to use an icon from QGIS application in the documentation
there is a big chance that there is already a substitution that can/should be used.

If no replacement exists:

* check the documentation repository whether the icon is available in
  :file:`/resources/en/docs/common` folder. If no image, then you need to find and
  copy the icon image file from `QGIS repository <https://github.com/qgis/QGIS>`_
  (often under https://github.com/qgis/QGIS/tree/master/images/themes/default folder)
  and paste (in ``.png`` format) under :file:`/resources/en/docs/common` folder.
  For convenience and update, it's advised to keep filename when possible.
* create the reference to the substitution in the :file:`/source/conf.py`
  file following the example below:

::
  
  .. |split_layer| image:: /static/common/split_layer.png
     :width: 1.5em

* (optional) add the reference to the icon and its substitution to the list below.

Common Substitutions
====================

Below are given some icons and their substitution to use when writing documentation.
Can be used/found in many places in manuals.

Platform Icons
..............

==========  ===============
Icon        Substitution
==========  ===============
|nix|       ``|nix|``
|osx|       ``|osx|``
|win|       ``|win|``
==========  ===============



Menu Items
..........

=======================  =========================  =====================  =========================
Icon                     Substitution               Icon                   Substitution
=======================  =========================  =====================  =========================
|checkbox|               ``|checkbox|``             |checkbox_unchecked|   ``|checkbox_unchecked|``
|radiobuttonon|          ``|radiobuttonon|``        |radiobuttonoff|       ``|radiobuttonoff|``
|selectnumber|           ``|selectnumber|``         |selectstring|         ``|selectstring|``
|browsebutton|           ``|browsebutton|``         |slider|               ``|slider|``
|dataDefined|            ``|dataDefined|``          \                      \
=======================  =========================  =====================  =========================


Menu items not used much
........................

==============  =================
Icon            Substitution
==============  =================
|selectcolor|   ``|selectcolor|``
|inputtext|     ``|inputtext|``
|tab|           ``|tab|``
|degrees|       ``|degrees|``
==============  =================


Toolbar Button Icons
====================

Manage Layers and overview
..........................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|addOgrLayer|                   ``|addOgrLayer|``                   \                               \
|addRasterLayer|                ``|addRasterLayer|``                |addMssqlLayer|                 ``|addMssqlLayer|``
|addLayer|                      ``|addLayer|``                      |addSpatiaLiteLayer|            ``|addSpatiaLiteLayer|``
|newVectorLayer|                ``|newVectorLayer|``                |removeLayer|                   ``|removeLayer|``
|virtualLayer|                  ``|virtualLayer|``                  |addWmsLayer|                   ``|addWmsLayer|``
|wcs|                           ``|wcs|``                           |wfs|                           ``|wfs|``
|oracle_raster|                 ``|oracle_raster|``
|dbmanager|                     ``|dbmanager|``                     |gdal|                          ``|gdal|``
|inOverview|                    ``|inOverview|``                    |addAllToOverview|              ``|addAllToOverview|``
|RemoveAllOverview|             ``|RemoveAllOverview|``             \                               \
|showAllLayers|                 ``|showAllLayers|``                 |hideAllLayers|                 ``|hideAllLayers|``
|showPresets|                   ``|showPresets|``                   |zip|                           ``|zip|``
==============================  ==================================  ==============================  ==================================


File
....

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|fileNew|                ``|fileNew|``                |fileOpen|               ``|fileOpen|``
|fileSave|               ``|fileSave|``               |fileSaveAs|             ``|fileSaveAs|``
|fileExit|               ``|fileExit|``               \                        \
=======================  ===========================  =======================  ===========================

Edit
....

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|saveEdits|                     ``|saveEdits|``
|undo|                          ``|undo|``                          |redo|                          ``|redo|``
|editCopy|                      ``|editCopy|``                      |editPaste|                     ``|editPaste|``
|editCut|                       ``|editCut|``
==============================  ==================================  ==============================  ==================================

Identity result
...............

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|expandTree|                    ``|expandTree|``                    |collapseTree|                  ``|collapseTree|``
|expandNewTree|                 ``|expandNewTree|``                 |propertyItem|                  ``|propertyItem|``
|deselectAll|                   ``|deselectAll|``                   |editCopy|                      ``|editCopy|``
|filePrint|                     ``|filePrint|``                     \                               \
==============================  ==================================  ==============================  ==================================


Digitizing and Advanced Digitizing
..................................

============================  =================================  =============================  ================================
Icon                          Substitution                       Icon                           Substitution
============================  =================================  =============================  ================================
|toggleEditing|               ``|toggleEditing|``                |tracing|                      ``|tracing|``
|capturePoint|                ``|capturePoint|``                 |capturePolygon|               ``|capturePolygon|``
|captureLine|                 ``|captureLine|``
|circularStringCurvePoint|    ``|circularStringCurvePoint|``     |circularStringRadius|         ``|circularStringRadius|``
|nodeTool|                    ``|nodeTool|``                     |moveFeature|                  ``|moveFeature|``
|deleteSelected|              ``|deleteSelected|``
|simplifyFeatures|            ``|simplifyFeatures|``             |reshape|                      ``|reshape|``
|addRing|                     ``|addRing|``                      |addPart|                      ``|addPart|``
|fillRing|                    ``|fillRing|``
|deleteRing|                  ``|deleteRing|``                   |deletePart|                   ``|deletePart|``
|mergeFeatures|               ``|mergeFeatures|``                |mergeFeatAttributes|          ``|mergeFeatAttributes|``
|splitFeatures|               ``|splitFeatures|``                |splitParts|                   ``|splitParts|``
|offsetCurve|                 ``|offsetCurve|``                  |rotatePointSymbols|           ``|rotatePointSymbols|``
============================  =================================  =============================  ================================


Map Navigation and attributes
.............................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|pan|                           ``|pan|``                           |PanToSelected|                 ``|PanToSelected|``
|zoomIn|                        ``|zoomIn|``                        |zoomOut|                       ``|zoomOut|``
|zoomActual|                    ``|zoomActual|``                    |zoomFullExtent|                ``|zoomFullExtent|``
|zoomToLayer|                   ``|zoomToLayer|``                   |zoomToSelected|                ``|zoomToSelected|``
|zoomLast|                      ``|zoomLast|``                      |zoomNext|                      ``|zoomNext|``
|touch|                         ``|touch|``                         |draw|                          ``|draw|``
|identify|                      ``|identify|``                      |mapTips|                       ``|mapTips|``
|showBookmarks|                 ``|showBookmarks|``                 |newBookmark|                   ``|newBookmark|``
|measure|                       ``|measure|``                       |measureArea|                   ``|measureArea|``
|measureAngle|                  ``|measureAngle|``                  \                               \
|selectRectangle|               ``|selectRectangle|``               |selectPolygon|                 ``|selectPolygon|``
|selectFreehand|                ``|selectFreehand|``                |selectRadius|                  ``|selectRadius|``
|selectAll|                     ``|selectAll|``                     |deselectAll|                   ``|deselectAll|``
|expressionSelect|              ``|expressionSelect|``              \                               \
==============================  ==================================  ==============================  ==================================


labels
......

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|label                   ``|labeling|``               |textAnnotation|         ``|textAnnotation|``
|annotation|             ``|annotation|``             |formAnnotation|         ``|formAnnotation|``
=======================  ===========================  =======================  ===========================


help
....

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|helpContents|           ``|helpContents|``           |qgisHomePage|           ``|qgisHomePage|``
|checkQgisVersion|       ``|checkQgisVersion|``       |helpAbout|              ``|helpAbout|``
|helpSponsors|           ``|helpSponsors|``           |contextHelp|            ``|contextHelp|``
=======================  ===========================  =======================  ===========================


Colors
......

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|colorBox|               ``|colorBox|``               |colorPicker|            ``|colorPicker|``
|colorSwatches|          ``|colorSwatches|``          |colorWheel|             ``|colorWheel|``
=======================  ===========================  =======================  ===========================


Other basic icons
=================

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|signPlus|                      ``|signPlus|``                      |signMinus|                     ``|signMinus|``
|projectProperties|             ``|projectProperties|``             |options|                       ``|options|``
|copyright_label|               ``|copyright_label|``               |north_arrow|                   ``|north_arrow|``
|scale_bar|                     ``|scale_bar|``                     |locale|                        ``|locale|``
|gps_importer|                  ``|gps_importer|``                  |gpstrack_barchart|             ``|gpstrack_barchart|``
|gpstrack_polarchart|           ``|gpstrack_polarchart|``           |tracking|                      ``|tracking|``
|folder|                        ``|folder|``                        |extents|                       ``|extents|``
==============================  ==================================  ==============================  ==================================


Attribute Table
===============

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|openTable|              ``|openTable|``              |selectedToTop|          ``|selectedToTop|``
|selectAll|              ``|selectAll|``              |invertSelection|        ``|invertSelection|``
|PanToSelected|          ``|PanToSelected|``          |zoomToSelected|         ``|zoomToSelected|``
|copySelected|           ``|copySelected|``           |editPaste|              ``|editPaste|``
|expressionSelect|       ``|expressionSelect|``       |deleteSelected|         ``|deleteSelected|``
|newAttribute|           ``|newAttribute|``           |deleteAttribute|        ``|deleteAttribute|``
|newTableRow|            ``|newTableRow|``            |calculateField|         ``|calculateField|``
|draw|                   ``|draw|``                   |form|                   ``|form|``
=======================  ===========================  =======================  ===========================


Projections and Georeferencer
=============================

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|geographic|                    ``|geographic|``                    |CRS|                           ``|CRS|``
|customProjection|              ``|customProjection|``              \                               \
|projectionDisabled|            ``|projectionDisabled|``            |projectionEnabled|             ``|projectionEnabled|``
|georeferencer|                 ``|georeferencer|``                 |pencil|                        ``|pencil|``
|linkQGisToGeoref|              ``|linkQGisToGeoref|``              |linkGeorefToQGis|              ``|linkGeorefToQGis|``
|coordinate_capture|            ``|coordinate_capture|``            |startGeoref|                   ``|startGeoref|``
==============================  ==================================  ==============================  ==================================



Composer Icons
==============

Icons used in Composer:

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|newComposer|            ``|newComposer|``            |composerManager|        ``|composerManager|``
|dupComposer|            ``|dupComposer|``            \                        \
|atlasSettings|          ``|atlasSettings|``          |atlas|                  ``|atlas|``
|filePrint|              ``|filePrint|``              |saveMapAsImage|         ``|saveMapAsImage|``
|saveAsSVG|              ``|saveAsSVG|``              |saveAsPDF|              ``|saveAsPDF|``
|addArrow|               ``|addArrow|``               |addBasicShape|          ``|addBasicShape|``
|addMap|                 ``|addMap|``                 |addLegend|              ``|addLegend|``
|addHtml|                ``|addHtml|``                |addTable|               ``|addTable|``
|label|                  ``|label|``                  |scaleBar|               ``|scaleBar|``
|select|                 ``|select|``                 |moveItemContent|        ``|moveItemContent|``
|raiseItems|             ``|raiseItems|``             |lowerItems|             ``|lowerItems|``
|moveItemsToTop|         ``|moveItemsToTop|``         |moveItemsToBottom|      ``|moveItemsToBottom|``
|alignLeft|              ``|alignLeft|``              |alignRight|             ``|alignRight|``
|alignHCenter|           ``|alignHCenter|``           |alignVCenter|           ``|alignVCenter|``
|alignTop|               ``|alignTop|``               |alignBottom|            ``|alignBottom|``
|locked|                 ``|locked|``                 |unlocked|               ``|unlocked|``      
|groupItems|             ``|groupItems|``
=======================  ===========================  =======================  ===========================

Properties
==========

Icons used in Layer Properties dialog:

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|symbology|                     ``|symbology|``                     |diagram|                       ``|diagram|``
|attributes|                    ``|attributes|``                    |general|                       ``|general|``
|metadata|                      ``|metadata|``                      |action|                        ``|action|``
|join|                          ``|join|``                          \                               \
==============================  ==================================  ==============================  ==================================


Plugin Icons
============

Core Plugin Icons
.................

Standard provided with basic install, but not loaded with initial install

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|showPluginManager|             ``|showPluginManager|``             |plugin_installer|              ``|plugin_installer|``
|offline_editing_copy|          ``|offline_editing_copy|``          |offline_editing_sync|          ``|offline_editing_sync|``
|plugin|                        ``|plugin|``                        |interpolation|                 ``|interpolation|``
|mapserver_export|              ``|mapserver_export|``              |exportMapServer|               ``|exportMapServer|``
|spiticon|                      ``|spiticon|``                      |delimited_text|                ``|delimited_text|``
|GDALScript|                    ``|GDALScript|``                    |dxf2shp_converter|             ``|dxf2shp_converter|``
|spatialquery|                  ``|spatialquery|``                  |selectsubsetlayer|             ``|selectsubsetlayer|``
|selectcreatelayer|             ``|selectcreatelayer|``             |metasearch|                    ``|metasearch|``
|geometrychecker|               ``|geometrychecker|``               |geometrysnapper|               ``|geometrysnapper|``
|topologychecker|               ``|topologychecker|``
==============================  ==================================  ==============================  ==================================


FTools Icons
............

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|ftools|                        ``|ftools|``                        \                               \
|matrix|                        ``|matrix|``                        |unique|                        ``|unique|``
|sum_lines|                     ``|sum_lines|``                     |sum_points|                    ``|sum_points|``
|basic_statistics|              ``|basic_statistics|``              |neighbor|                      ``|neighbor|``
|mean|                          ``|mean|``                          |intersections|                 ``|intersections|``
|random_selection|              ``|random_selection|``              |sub_selection|                 ``|sub_selection|``
|random_points|                 ``|random_points|``                 \                               \
|regular_points|                ``|regular_points|``                |vector_grid|                   ``|vector_grid|``
|select_location|               ``|select_location|``               |layer_extent|                  ``|layer_extent|``
|convex_hull|                   ``|convex_hull|``                   |buffer|                        ``|buffer|``
|intersect|                     ``|intersect|``                     |union|                         ``|union|``
|sym_difference|                ``|sym_difference|``                |clip|                          ``|clip|``
|difference|                    ``|difference|``                    |dissolve|                      ``|dissolve|``
|check_geometry|                ``|check_geometry|``                |export_geometry|               ``|export_geometry|``
|delaunay|                      ``|delaunay|``                      |centroids|                     ``|centroids|``
|simplify|                      ``|simplify|``                      |join_location|                 ``|join_location|``
|multi_to_single|               ``|multi_to_single|``               |single_to_multi|               ``|single_to_multi|``
|to_lines|                      ``|to_lines|``                      |extract_nodes|                 ``|extract_nodes|``
|export_projection|             ``|export_projection|``             |define_projection|             ``|define_projection|``
|split_layer|                   ``|split_layer|``                   |merge_shapes|                  ``|merge_shapes|``
==============================  ==================================  ==============================  ==================================


Grass integration
.................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|grass|                         ``|grass|``                         \                               \
|grass_tools|                   ``|grass_tools|``                   |grass_new_mapset|              ``|grass_new_mapset|``
|grass_open_mapset|             ``|grass_open_mapset|``             |grass_close_mapset|            ``|grass_close_mapset|``
|grass_region|                  ``|grass_region|``                  |grass_set_region|              ``|grass_set_region|``
==============================  ==================================  ==============================  ==================================

OpenStreetMap
.............

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|osm_load|                      ``|osm_load|``                      |osm_download|                  ``|osm_download|``
|osm_featureManager|            ``|osm_featureManager|``            |osm_identify|                  ``|osm_identify|``
|osm_import|                    ``|osm_import|``                    |osm_save|                      ``|osm_save|``
|osm_createPoint|               ``|osm_createPoint|``               |osm_createLine|                ``|osm_createLine|``
|osm_createPolygon|             ``|osm_createPolygon|``             \                               \
|osm_move|                      ``|osm_move|``                      |osm_removeFeat|                ``|osm_removeFeat|``
|osm_createRelation|            ``|osm_createRelation|``            |osm_addRelation|               ``|osm_addRelation|``
|osm_editRelation|              ``|osm_editRelation|``              |osm_generateTags|              ``|osm_generateTags|``
|osm_questionMark|              ``|osm_questionMark|``              \                               \
==============================  ==================================  ==============================  ==================================

Raster related
..............

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|fullCumulativeStretch|         ``|fullCumulativeStretch|``         |FullHistogramStretch|          ``|FullHistogramStretch|``
|ShowRasterCalculator|          ``|ShowRasterCalculator|``          |raster-stats|                  ``|raster-stats|``
|raster-interpolate|            ``|raster-interpolate|``            |raster-info|                   ``|raster-info|``
|raster_terrain|                ``|raster_terrain|``                |heatmap|                       ``|heatmap|``
==============================  ==================================  ==============================  ==================================

eVis plugin
...........

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|event_browser|                 ``|event_browser|``                 |event_id|                      ``|event_id|``
|evis_connect|                  ``|evis_connect|``                  |evis_file|                     ``|evis_file|``
==============================  ==================================  ==============================  ==================================
