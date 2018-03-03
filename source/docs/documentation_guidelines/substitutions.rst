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

==========  ===============  ==========  =============== 
Icon        Substitution     Icon        Substitution
==========  ===============  ==========  =============== 
|kde|       ``|kde|``        |nix|       ``|nix|``
|osx|       ``|osx|``        |win|       ``|win|``
==========  ===============  ==========  =============== 



Menu Items
..........

=======================  =========================  =====================  =========================
Icon                     Substitution               Icon                   Substitution
=======================  =========================  =====================  =========================
|checkbox|               ``|checkbox|``             |unchecked|            ``|unchecked|``
|radioButtonOn|          ``|radioButtonOn|``        |radioButtonOff|       ``|radioButtonOff|``
|selectNumber|           ``|selectNumber|``         |selectString|         ``|selectString|``
|browseButton|           ``|browseButton|``         |slider|               ``|slider|``
|selectColor|            ``|selectColor|``          |inputText|            ``|inputText|``
|tab|                    ``|tab|``                  |degrees|              ``|degrees|``
=======================  =========================  =====================  =========================


Toolbar Button Icons
====================

Manage Layers and overview
..........................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|addOgrLayer|                   ``|addOgrLayer|``                   |addDb2Layer|                   ``|addDb2Layer|``
|addRasterLayer|                ``|addRasterLayer|``                |addMssqlLayer|                 ``|addMssqlLayer|``
|addDelimitedTextLayer|         ``|addDelimitedTextLayer|``         |addSpatiaLiteLayer|            ``|addSpatiaLiteLayer|``
|addPostgisLayer|               ``|addPostgisLayer|``               |addOracleLayer|                ``|addOracleLayer|``
|addAfsLayer|                   ``|addAfsLayer|``                   |addAmsLayer|                   ``|addAmsLayer|``
|virtualLayer|                  ``|virtualLayer|``                  |wms|                           ``|wms|``
|wcs|                           ``|wcs|``                           |wfs|                           ``|wfs|``
|newVectorLayer|                ``|newVectorLayer|``                |newSpatiaLiteLayer|            ``|newSpatiaLiteLayer|``
|newGeoPackageLayer|            ``|newGeoPackageLayer|``            |createMemory|                  ``|createMemory|``
|dbManager|                     ``|dbManager|``                     |gdal|                          ``|gdal|``
|inOverview|                    ``|inOverview|``                    |addAllToOverview|              ``|addAllToOverview|``
|removeAllOVerview|             ``|removeAllOVerview|``             |removeLayer|                   ``|removeLayer|``
|showAllLayers|                 ``|showAllLayers|``                 |hideAllLayers|                 ``|hideAllLayers|``
|showMapTheme|                  ``|showMapTheme|``                  |showSelectedLayers|            ``|showSelectedLayers|``
|hideSelectedLayers|            ``|hideSelectedLayers|``            |hideDeselectedLayers|          ``|hideDeselectedLayers|``
|addLayer|                      ``|addLayer|``                      |zip|                           ``|zip|``
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
|undo|                          ``|undo|``                          |redo|                          ``|redo|``
|editCopy|                      ``|editCopy|``                      |editPaste|                     ``|editPaste|``
|editCut|                       ``|editCut|``                       |saveEdits|                     ``|saveEdits|``
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
|cad|                         ``|cad|``                          |cadConstruction|              ``|cadConstruction|``
|cadParallel|                 ``|cadParallel|``                  |cadPerpendicular|             ``|cadPerpendicular|``
|toggleEditing|               ``|toggleEditing|``                |allEdits|                     ``|allEdits|``
|tracing|                     ``|tracing|``                      |snapping|                     ``|snapping|``
|capturePoint|                ``|capturePoint|``                 |capturePolygon|               ``|capturePolygon|``
|captureLine|                 ``|captureLine|``                  \                              \
|circularStringCurvePoint|    ``|circularStringCurvePoint|``     |circularStringRadius|         ``|circularStringRadius|``
|nodeTool|                    ``|nodeTool|``                     |deleteSelected|               ``|deleteSelected|``
|moveFeature|                 ``|moveFeature|``                  |rotateFeature|                ``|rotateFeature|``
|simplifyFeatures|            ``|simplifyFeatures|``             |reshape|                      ``|reshape|``
|addRing|                     ``|addRing|``                      |addPart|                      ``|addPart|``
|fillRing|                    ``|fillRing|``                     \                              \
|deleteRing|                  ``|deleteRing|``                   |deletePart|                   ``|deletePart|``
|mergeFeatures|               ``|mergeFeatures|``                |mergeFeatAttributes|          ``|mergeFeatAttributes|``
|splitFeatures|               ``|splitFeatures|``                |splitParts|                   ``|splitParts|``
|offsetPointSymbols|          ``|offsetPointSymbols|``           |rotatePointSymbols|           ``|rotatePointSymbols|``
|offsetCurve|                 ``|offsetCurve|``                  \                              \
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
|measureAngle|                  ``|measureAngle|``                  |newMap|                        ``|newMap|``
==============================  ==================================  ==============================  ==================================

Selection and Expressions
.........................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|selectRectangle|               ``|selectRectangle|``               |selectPolygon|                 ``|selectPolygon|``
|selectFreehand|                ``|selectFreehand|``                |selectRadius|                  ``|selectRadius|``
|selectAll|                     ``|selectAll|``                     |deselectAll|                   ``|deselectAll|``
|invertSelection|               ``|invertSelection|``               |expressionSelect|              ``|expressionSelect|``
|selectAllTree|                 ``|selectAllTree|``                 |select|                        ``|select|``
|formSelect|                    ``|formSelect|``                    |dataDefined|                   ``|dataDefined|``
|expression|                    ``|expression|``                    |dataDefineOn|                  ``|dataDefineOn|``
|dataDefineExpressionOn|        ``|dataDefineExpressionOn|``        |dataDefineError|               ``|dataDefineError|``
|dataDefineExpressionError|     ``|dataDefineExpressionError|``     |filter|                        ``|filter|``
|expressionFilter|              ``|expressionFilter|``              |filterMap|                     ``|filterMap|``
==============================  ==================================  ==============================  ==================================


Labels and Diagrams
...................

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|labeling|               ``|labeling|``               |labelingNone|           ``|labelingNone|``
|labelingRuleBased|      ``|labelingRuleBased|``      |labelingObstacle|       ``|labelingObstacle|``
|piechart|               ``|piechart|``               |diagramNone|            ``|diagramNone|``
|text|                   ``|text|``                   |histogram|              ``|histogram|``
|annotation|             ``|annotation|``             |textAnnotation|         ``|textAnnotation|``
|formAnnotation|         ``|formAnnotation|``         |htmlAnnotation|         ``|htmlAnnotation|``
|svgAnnotation|          ``|svgAnnotation|``          \                        \
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
|arrowDown|                     ``|arrowDown|``                     |arrowUp|                       ``|arrowUp|``
|arrowLeft|                     ``|arrowLeft|``                     |arrowRight|                    ``|arrowRight|``
|signPlus|                      ``|signPlus|``                      |signMinus|                     ``|signMinus|``
|projectProperties|             ``|projectProperties|``             |options|                       ``|options|``
|copyrightLabel|                ``|copyrightLabel|``                |northArrow|                    ``|northArrow|``
|scaleBar|                      ``|scaleBar|``                      |locale|                        ``|locale|``
|gpsImporter|                   ``|gpsImporter|``                   |gpsTrackBarChart|              ``|gpsTrackBarChart|``
|gpsTrackPolarChart|            ``|gpsTrackPolarChart|``            |tracking|                      ``|tracking|``
|folder|                        ``|folder|``                        |extents|                       ``|extents|``
|settings|                      ``|settings|``                      \                               \
==============================  ==================================  ==============================  ==================================


Attribute Table
===============

============================ ===============================  =======================  ===========================
Icon                         Substitution                     Icon                     Substitution
============================ ===============================  =======================  ===========================
|openTable|                  ``|openTable|``                  |selectedToTop|          ``|selectedToTop|``
|selectAll|                  ``|selectAll|``                  |invertSelection|        ``|invertSelection|``
|panToSelected|              ``|panToSelected|``              |zoomToSelected|         ``|zoomToSelected|``
|copySelected|               ``|copySelected|``               |editPaste|              ``|editPaste|``
|expressionSelect|           ``|expressionSelect|``           |deleteSelected|         ``|deleteSelected|``
|newAttribute|               ``|newAttribute|``               |deleteAttribute|        ``|deleteAttribute|``
|newTableRow|                ``|newTableRow|``                |calculateField|         ``|calculateField|``
|draw|                       ``|draw|``                       |formView|               ``|formView|``
|conditionalFormatting|      ``|conditionalFormatting|``      |multiEdit|              ``|multiEdit|``
============================ ===============================  =======================  ===========================


Projections and Georeferencer
=============================

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|geographic|                    ``|geographic|``                    |crs|                           ``|crs|``
|customProjection|              ``|customProjection|``              |setProjection|                 ``|setProjection|``
|projectionDisabled|            ``|projectionDisabled|``            |projectionEnabled|             ``|projectionEnabled|``
|georeferencer|                 ``|georeferencer|``                 |pencil|                        ``|pencil|``
|linkQGisToGeoref|              ``|linkQGisToGeoref|``              |linkGeorefToQGis|              ``|linkGeorefToQGis|``
|coordinateCapture|             ``|coordinateCapture|``             |startGeoref|                   ``|startGeoref|``
==============================  ==================================  ==============================  ==================================


Print Composer
==============

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|newComposer|            ``|newComposer|``            |composerManager|        ``|composerManager|``
|duplicateComposer|      ``|duplicateComposer|``      \                        \
|atlasSettings|          ``|atlasSettings|``          |atlas|                  ``|atlas|``
|filePrint|              ``|filePrint|``              |saveMapAsImage|         ``|saveMapAsImage|``
|saveAsSVG|              ``|saveAsSVG|``              |saveAsPDF|              ``|saveAsPDF|``
|addArrow|               ``|addArrow|``               |addBasicShape|          ``|addBasicShape|``
|addNodesShape|          ``|addNodesShape|``          |editNodesShape|         ``|editNodesShape|``
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
|lockedRepeat|           ``|lockedRepeat|``           |groupItems|             ``|groupItems|``
=======================  ===========================  =======================  ===========================

Layer Properties
================

==================================  ======================================  =============================  ================================
Icon                                Substitution                            Icon                           Substitution
==================================  ======================================  =============================  ================================
|symbology|                         ``|symbology|``                         |labeling|                     ``|labeling|``
|attributes|                        ``|attributes|``                        |general|                      ``|general|``
|metadata|                          ``|metadata|``                          |action|                       ``|action|``
|mapTips|                           ``|mapTips|``                           |rendering|                    ``|rendering|``
|join|                              ``|join|``                              |diagram|                      ``|diagram|``
|legend|                            ``|legend|``                            |dependencies|                            ``|dependencies|``
|history|                           ``|history|``                           |stylePreset|                  ``|stylePreset|``
|singleSymbol|                      ``|singleSymbol|``                      |nullSymbol|                   ``|nullSymbol|``
|graduatedSymbol|                   ``|graduatedSymbol|``                   |categorizedSymbol|            ``|categorizedSymbol|``
|25dSymbol|                         ``|25dSymbol|``                         |ruleBasedSymbol|              ``|ruleBasedSymbol|``
|invertedSymbol|                    ``|invertedSymbol|``                    |heatmapSymbol|                ``|heatmapSymbol|``
|pointDisplacementSymbol|           ``|pointDisplacementSymbol|``           |pointClusterSymbol|           ``|pointClusterSymbol|``
|sum|                               ``|sum|``                               |sort|                         ``|sort|``
|paintEffects|                      ``|paintEffects|``                      |mapIdentification|            ``|mapIdentification|``
==================================  ======================================  =============================  ================================


Plugins
=======

Vector Menu
...........

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
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

Raster Menu
...........

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|fullCumulativeStretch|         ``|fullCumulativeStretch|``         |fullHistogramStretch|          ``|fullHistogramStretch|``
|showRasterCalculator|          ``|showRasterCalculator|``          |rasterStats|                   ``|rasterStats|``
|rasterInterpolate|             ``|rasterInterpolate|``             |rasterInfo|                    ``|rasterInfo|``
|rasterTerrain|                 ``|rasterTerrain|``                 |heatmap|                       ``|heatmap|``
==============================  ==================================  ==============================  ==================================

Various Core Plugins
....................

Standard provided with basic install, but not loaded with initial install

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|showPluginManager|             ``|showPluginManager|``             |pluginInstaller|               ``|pluginInstaller|``
|installPluginFromZip|          ``|installPluginFromZip|``          \                               \
|offlineEditingCopy|            ``|offlineEditingCopy|``            |offlineEditingSync|            ``|offlineEditingSync|``
|plugin|                        ``|plugin|``                        |interpolation|                 ``|interpolation|``
|delimitedText|                 ``|delimitedText|``                 \                               \
|gdalScript|                    ``|gdalScript|``                    |dxf2shpConverter|              ``|dxf2shpConverter|``
|metasearch|                    ``|metasearch|``
|geometryChecker|               ``|geometryChecker|``               |geometrySnapper|               ``|geometrySnapper|``
|topologychecker|               ``|topologychecker|``               |oracleRaster|                  ``|oracleRaster|``
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
|osmCreatePolygon|             ``|osmCreatePolygon|``             \                              \
|osmMove|                      ``|osmMove|``                      |osmRemoveFeat|                ``|osmRemoveFeat|``
|osmCreateRelation|            ``|osmCreateRelation|``            |osmAddRelation|               ``|osmAddRelation|``
|osmEditRelation|              ``|osmEditRelation|``              |osmGenerateTags|              ``|osmGenerateTags|``
|osmQuestionMark|              ``|osmQuestionMark|``              \                              \
=============================  =================================  =============================  ==================================

eVis plugin
...........

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|eventBrowser|                  ``|eventBrowser|``                  |eventId|                       ``|eventId|``
|evisConnect|                   ``|evisConnect|``                   |evisFile|                      ``|evisFile|``
==============================  ==================================  ==============================  ==================================
