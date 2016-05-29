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
  file following the example below. The replacement text should be in camelCase:

::
  
  .. |splitLayer| image:: /static/common/split_layer.png
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
|checkbox|               ``|checkbox|``             |unchecked|            ``|unchecked|``
|radioButtonOn|          ``|radioButtonOn|``        |radioButtonOff|       ``|radioButtonOff|``
|selectNumber|           ``|selectNumber|``         |selectString|         ``|selectString|``
|browseButton|           ``|browseButton|``         |slider|               ``|slider|``
|dataDefined|            ``|dataDefined|``          \                      \
=======================  =========================  =====================  =========================


Menu items not used much
........................

==============  =================
Icon            Substitution
==============  =================
|selectColor|   ``|selectColor|``
|inputText|     ``|inputText|``
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
|virtualLayer|                  ``|virtualLayer|``                  |wms|                           ``|wms|``
|wcs|                           ``|wcs|``                           |wfs|                           ``|wfs|``
|oracleRaster|                  ``|oracleRaster|``
|dbManager|                     ``|dbManager|``                     |gdal|                          ``|gdal|``
|inOverview|                    ``|inOverview|``                    |addAllToOverview|              ``|addAllToOverview|``
|removeAllOVerview|             ``|removeAllOVerview|``             \                               \
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
|filePrint|                     ``|filePrint|``                     |propertiesWidget|              ``|propertiesWidget|``
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
|pan|                           ``|pan|``                           |panToSelected|                 ``|panToSelected|``
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


Labels
......

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|labeling|               ``|labeling|``               |textAnnotation|         ``|textAnnotation|``
|annotation|             ``|annotation|``             |formAnnotation|         ``|formAnnotation|``
=======================  ===========================  =======================  ===========================

Help
....

=======================  ===========================  =======================  ==================================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ==================================
|helpContents|           ``|helpContents|``           |qgisHomePage|           ``|qgisHomePage|``
|checkQgisVersion|       ``|checkQgisVersion|``       |helpAbout|              ``|helpAbout|``
|helpSponsors|           ``|helpSponsors|``           |contextHelp|            ``|contextHelp|``
=======================  ===========================  =======================  ==================================

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
|copyrightLabel|                ``|copyrightLabel|``                |northArrow|                    ``|northArrow|``
|scaleBar|                      ``|scaleBar|``                      |locale|                        ``|locale|``
|gpsImporter|                   ``|gpsImporter|``                   |gpsTrackBarChart|              ``|gpsTrackBarChart|``
|gpsTrackPolarChart|            ``|gpsTrackPolarChart|``            |tracking|                      ``|tracking|``
|folder|                        ``|folder|``                        |extents|                       ``|extents|``
==============================  ==================================  ==============================  ==================================


Attribute Table
===============

============================ ===============================  =======================  ===========================
Icon                         Substitution                     Icon                     Substitution
===========================  ===============================  =======================  ===========================
|openTable|                  ``|openTable|``                  |selectedToTop|          ``|selectedToTop|``
|selectAll|                  ``|selectAll|``                  |invertSelection|        ``|invertSelection|``
|panToSelected|              ``|panToSelected|``              |zoomToSelected|         ``|zoomToSelected|``
|copySelected|               ``|copySelected|``               |editPaste|              ``|editPaste|``
|expressionSelect|           ``|expressionSelect|``           |deleteSelected|         ``|deleteSelected|``
|newAttribute|               ``|newAttribute|``               |deleteAttribute|        ``|deleteAttribute|``
|newTableRow|                ``|newTableRow|``                |calculateField|         ``|calculateField|``
|draw|                       ``|draw|``                       |form|                   ``|form|``
|rendererCategorizedSymbol|  ``|rendererCategorizedSymbol|``  \                        \
===========================  ===============================  =======================  ===========================


Projections and Georeferencer
=============================

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|geographic|                    ``|geographic|``                    |crs|                           ``|crs|``
|customProjection|              ``|customProjection|``              \                               \
|projectionDisabled|            ``|projectionDisabled|``            |projectionEnabled|             ``|projectionEnabled|``
|georeferencer|                 ``|georeferencer|``                 |pencil|                        ``|pencil|``
|linkQGisToGeoref|              ``|linkQGisToGeoref|``              |linkGeorefToQGis|              ``|linkGeorefToQGis|``
|coordinateCapture|             ``|coordinateCapture|``             |startGeoref|                   ``|startGeoref|``
==============================  ==================================  ==============================  ==================================



Composer Icons
==============

Icons used in Composer:

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|newComposer|            ``|newComposer|``            |composerManager|        ``|composerManager|``
|duplicateComposer|      ``|duplicateComposer|``      \                        \
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
|showPluginManager|             ``|showPluginManager|``             |pluginInstaller|               ``|pluginInstaller|``
|offlineEditingCopy|            ``|offlineEditingCopy|``            |offlineEditingSync|            ``|offlineEditingSync|``
|plugin|                        ``|plugin|``                        |interpolation|                 ``|interpolation|``
|mapserverExport|               ``|mapserverExport|``               |exportMapServer|               ``|exportMapServer|``
|spit|                          ``|spit|``                          |delimitedText|                 ``|delimitedText|``
|gdalScript|                    ``|gdalScript|``                    |dxf2shpConverter|              ``|dxf2shpConverter|``
|spatialQuery|                  ``|spatialQuery|``                  |selectSubsetLayer|             ``|selectSubsetLayer|``
|selectCreateLayer|             ``|selectCreateLayer|``             |metasearch|                    ``|metasearch|``
|geometryChecker|               ``|geometryChecker|``               |geometrySnapper|               ``|geometrySnapper|``
|topologychecker|               ``|topologychecker|``
==============================  ==================================  ==============================  ==================================


FTools Icons
............

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|ftools|                        ``|ftools|``                        \                               \
|matrix|                        ``|matrix|``                        |unique|                        ``|unique|``
|sumLines|                      ``|sumLines|``                      |sumPoints|                     ``|sumPoints|``
|basicStatistics|               ``|basicStatistics|``               |neighbor|                      ``|neighbor|``
|mean|                          ``|mean|``                          |intersections|                 ``|intersections|``
|randomSelection|               ``|randomSelection|``               |subSelection|                  ``|subSelection|``
|randomPoints|                  ``|randomPoints|``                  \                                \
|regularPoints|                 ``|regularPoints|``                 |vectorGrid|                    ``|vectorGrid|``
|selectLocation|                ``|selectLocation|``                |layerExtent|                   ``|layerExtent|``
|convexHull|                    ``|convexHull|``                    |buffer|                        ``|buffer|``
|intersect|                     ``|intersect|``                     |union|                         ``|union|``
|symDifference|                 ``|symDifference|``                 |clip|                          ``|clip|``
|difference|                    ``|difference|``                    |dissolve|                      ``|dissolve|``
|checkGeometry|                 ``|checkGeometry|``                 |exportGeometry|                ``|exportGeometry|``
|delaunay|                      ``|delaunay|``                      |centroids|                     ``|centroids|``
|simplify|                      ``|simplify|``                      |joinLocation|                  ``|joinLocation|``
|multiToSingle|                 ``|multiToSingle|``                 |singleToMulti|                 ``|singleToMulti|``
|toLines|                       ``|toLines|``                       |extractNodes|                  ``|extractNodes|``
|exportProjection|              ``|exportProjection|``              |defineProjection|              ``|defineProjection|``
|splitLayer|                    ``|splitLayer|``                    |mergeShapes|                   ``|mergeShapes|``
==============================  ==================================  ==============================  ==================================


Grass integration
.................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|grass|                         ``|grass|``                         \                               \
|grassTools|                    ``|grassTools|``                    |grassNewMapset|                ``|grassNewMapset|``
|grassOpenMapset|               ``|grassOpenMapset|``               |grassCloseMapset|              ``|grassCloseMapset|``
|grassRegion|                   ``|grassRegion|``                   |grassSetRegion|                ``|grassSetRegion|``
==============================  ==================================  ==============================  ==================================

OpenStreetMap
.............

=============================  =================================  =============================  ==================================
Icon                            Substitution                      Icon                           Substitution
=============================  =================================  =============================  ==================================
|osmLoad|                      ``|osmLoad|``                      |osmDownload|                  ``|osmDownload|``
|osmFeatureManager|            ``|osmFeatureManager|``            |osmIdentify|                  ``|osmIdentify|``
|osmImport|                    ``|osmImport|``                    |osmSave|                      ``|osmSave|``
|osmCreatePoint|               ``|osmCreatePoint|``               |osmCreateLine|                ``|osmCreateLine|``
|osmCreatePolygon|             ``|osmCreatePolygon|``             \                               \
|osmMove|                      ``|osmMove|``                      |osmRemoveFeat|                ``|osmRemoveFeat|``
|osmCreateRelation|            ``|osmCreateRelation|``            |osmAddRelation|               ``|osmAddRelation|``
|osmEditRelation|              ``|osmEditRelation|``              |osmGenerateTags|              ``|osmGenerateTags|``
|osmQuestionMark|              ``|osmQuestionMark|``              \                               \
=============================  =================================  =============================  ==================================

Raster related
..............

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|fullCumulativeStretch|         ``|fullCumulativeStretch|``         |fullHistogramStretch|          ``|fullHistogramStretch|``
|ShowRasterCalculator|          ``|ShowRasterCalculator|``          |rasterStats|                   ``|rasterStats|``
|rasterInterpolate|             ``|rasterInterpolate|``             |rasterInfo|                    ``|rasterInfo|``
|rasterTerrain|                 ``|rasterTerrain|``                 |heatmap|                       ``|heatmap|``
==============================  ==================================  ==============================  ==================================

eVis plugin
...........

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|eventBrowser|                  ``|eventBrowser|``                  |eventId|                       ``|eventId|``
|evisConnect|                   ``|evisConnect|``                   |evisFile|                      ``|evisFile|``
==============================  ==================================  ==============================  ==================================
