.. _substitutions:

*************
Substitutions
*************

.. contents::
   :local:

Usage
=====

To ease the use of icons in QGIS manuals, replacements are defined
for each icon in :file:`/source/substitutions.txt` file at `QGIS-Documentation repository
<https://github.com/qgis/QGIS-Documentation>`_ and some of these substitutions
are listed below.
Thus, when you want to use an icon from QGIS application in the documentation
there is a big chance that there is already a substitution that can/should be used.

If no replacement exists:

#. check the documentation repository whether the icon is available in
   :file:`/static/common` folder. If no image, then you need to find and
   copy the icon image file from `QGIS repository <https://github.com/qgis/QGIS>`_
   (often under :source:`default themes <images/themes/default>` folder)
   and paste (in ``.png`` format) under :file:`/static/common` folder.
   For convenience and update, it's advised to keep filename when possible.
#. create the reference to the substitution in the :file:`/substitutions.txt`
   file following the example below.
   The replacement text should be derived from file name and in camelCase:

   ::

     .. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
        :width: 1.5em
     .. |splitLayer| image:: /static/common/split_layer.png
        :width: 1.5em

#. Update the target section(s) of the docs, using your new substitution.
#. (optional but highly desirable) add the substitution to the list below.
#. Add the new substitution reference in the substitutions list at the end of the file(s)
   it is used in, or run the convenient :file:`scripts/find_set_subst.py` script.

   .. code-block:: py

     # from the repository main folder
     python3 scripts/find_set_subst.py

Common Substitutions
====================

Below are given some icons and their substitution to use when writing documentation.
Can be used/found in many places in manuals.

Platform Icons
..............

==========  ===============  ==========  ===============
Icon        Substitution     Icon        Substitution
==========  ===============  ==========  ===============
|logo|      ``|logo|``
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
|selectColor|            ``|selectColor|``          |selectColorRamp|      ``|selectColorRamp|``
|tab|                    ``|tab|``                  |degrees|              ``|degrees|``
|inputText|              ``|inputText|``            |slider|               ``|slider|``
|hamburgerMenu|          ``|hamburgerMenu|``
=======================  =========================  =====================  =========================


Toolbar Button Icons
====================

Manage Layers and overview
..........................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|dataSourceManager|             ``|dataSourceManager|``             \                               \
|addOgrLayer|                   ``|addOgrLayer|``
|addRasterLayer|                ``|addRasterLayer|``                |addMssqlLayer|                 ``|addMssqlLayer|``
|addDelimitedTextLayer|         ``|addDelimitedTextLayer|``         |addSpatiaLiteLayer|            ``|addSpatiaLiteLayer|``
|addPostgisLayer|               ``|addPostgisLayer|``               |addOracleLayer|                ``|addOracleLayer|``
|addAfsLayer|                   ``|addAfsLayer|``                   |addMeshLayer|                  ``|addMeshLayer|``
|addVectorTileLayer|            ``|addVectorTileLayer|``            |addXyzLayer|                   ``|addXyzLayer|``
|addVirtualLayer|               ``|addVirtualLayer|``               |addWmsLayer|                   ``|addWmsLayer|``
|addWcsLayer|                   ``|addWcsLayer|``                   |addWfsLayer|                   ``|addWfsLayer|``
|addPointCloudLayer|            ``|addPointCloudLayer|``            |addGpsLayer|                   ``|addGpsLayer|``
|addTiledSceneLayer|            ``|addTiledSceneLayer|``            |addHanaLayer|                  ``|addHanaLayer|``
|newVectorLayer|                ``|newVectorLayer|``                |newSpatiaLiteLayer|            ``|newSpatiaLiteLayer|``
|newGeoPackageLayer|            ``|newGeoPackageLayer|``            |createMemory|                  ``|createMemory|``
|newVirtualLayer|               ``|newVirtualLayer|``               |newMeshLayer|                  ``|newMeshLayer|``
|newGpx|                        ``|newGpx|``
|dbManager|                     ``|dbManager|``                     |gdal|                          ``|gdal|``
|geoPackage|                    ``|geoPackage|``                    |spatialite|                    ``|spatialite|``
|virtualLayer|                  ``|virtualLayer|``                  |wms|                           ``|wms|``
|wcs|                           ``|wcs|``                           |wfs|                           ``|wfs|``
|pointCloudLayer|               ``|pointCloudLayer|``               |gps|                           ``|gps|``
|tiledSceneLayer|               ``|tiledSceneLayer|``               |hana|                          ``|hana|``
|dbSchema|                      ``|dbSchema|``
|inOverview|                    ``|inOverview|``                    |addAllToOverview|              ``|addAllToOverview|``
|removeAllFromOverview|         ``|removeAllFromOverview|``         |removeLayer|                   ``|removeLayer|``
|showAllLayers|                 ``|showAllLayers|``                 |hideAllLayers|                 ``|hideAllLayers|``
|showPresets|                   ``|showPresets|``                   |showSelectedLayers|            ``|showSelectedLayers|``
|hideSelectedLayers|            ``|hideSelectedLayers|``            |hideDeselectedLayers|          ``|hideDeselectedLayers|``
|toggleAllLayers|               ``|toggleAllLayers|``               |toggleSelectedLayers|          ``|toggleSelectedLayers|``
|addLayer|                      ``|addLayer|``
|indicatorTemporal|             ``|indicatorTemporal|``             |indicatorNonRemovable|         ``|indicatorNonRemovable|``
|indicatorEmbedded|             ``|indicatorEmbedded|``             |indicatorFilter|               ``|indicatorFilter|``
|indicatorMemory|               ``|indicatorMemory|``               |indicatorNoCRS|                ``|indicatorNoCRS|``
|indicatorBadLayer|             ``|indicatorBadLayer|``             |favourites|                    ``|favourites|``
|indicatorLayerError|           ``|indicatorLayerError|``           |indicatorNotes|                ``|indicatorNotes|``
|indicatorLowAccuracy|          ``|indicatorLowAccuracy|``          |indicatorOffline|              ``|indicatorOffline|``
==============================  ==================================  ==============================  ==================================

Project
.......

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|fileNew|                ``|fileNew|``                |fileOpen|               ``|fileOpen|``
|fileSave|               ``|fileSave|``               |fileSaveAs|             ``|fileSaveAs|``
|fileExit|               ``|fileExit|``               |user|                   ``|user|``
=======================  ===========================  =======================  ===========================

Edit
....

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|undo|                          ``|undo|``                          |redo|                          ``|redo|``
|editCopy|                      ``|editCopy|``                      |editPaste|                     ``|editPaste|``
|editCut|                       ``|editCut|``                       |saveEdits|                     ``|saveEdits|``
|editableEdits|                 ``|editableEdits|``
|circle2Points|                 ``|circle2Points|``                 |circle2TangentsPoint|          ``|circle2TangentsPoint|``
|circle3Points|                 ``|circle3Points|``                 |circle3Tangents|               ``|circle3Tangents|``
|circleCenterPoint|             ``|circleCenterPoint|``             |ellipseCenter2Points|          ``|ellipseCenter2Points|``
|ellipseCenterPoint|            ``|ellipseCenterPoint|``            |ellipseExtent|                 ``|ellipseExtent|``
|ellipseFoci|                   ``|ellipseFoci|``                   |rectangle3PointsDistance|      ``|rectangle3PointsDistance|``
|rectangle3PointsProjected|     ``|rectangle3PointsProjected|``     |rectangleCenter|               ``|rectangleCenter|``
|rectangleExtent|               ``|rectangleExtent|``               |regularPolygon2Points|         ``|regularPolygon2Points|``
|regularPolygonCenterCorner|    ``|regularPolygonCenterCorner|``    |regularPolygonCenterPoint|     ``|regularPolygonCenterPoint|``
==============================  ==================================  ==============================  ==================================

Identity result
...............

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|expandTree|                    ``|expandTree|``                    |collapseTree|                  ``|collapseTree|``
|expandNewTree|                 ``|expandNewTree|``                 |formView|                      ``|formView|``
|deselectAll|                   ``|deselectAll|``                   |editCopy|                      ``|editCopy|``
|filePrint|                     ``|filePrint|``
|identifyByRectangle|           ``|identifyByRectangle|``           |identifyByPolygon|             ``|identifyByPolygon|``
|identifyByFreehand|            ``|identifyByFreehand|``            |identifyByRadius|              ``|identifyByRadius|``
==============================  ==================================  ==============================  ==================================


Digitizing and Advanced Digitizing
..................................

===============================  ====================================  ================================  =================================
Icon                             Substitution                          Icon                              Substitution
===============================  ====================================  ================================  =================================
|cad|                            ``|cad|``                             |cadConstruction|                 ``|cadConstruction|``
|cadParallel|                    ``|cadParallel|``                     |cadPerpendicular|                ``|cadPerpendicular|``
|floater|                        ``|floater|``
|toggleEditing|                  ``|toggleEditing|``                   |allEdits|                        ``|allEdits|``
|tracing|                        ``|tracing|``                         |snapping|                        ``|snapping|``
|snappingVertex|                 ``|snappingVertex|``                  |snappingSegment|                 ``|snappingSegment|``
|snappingArea|                   ``|snappingArea|``                    |snappingCentroid|                ``|snappingCentroid|``
|snappingMiddle|                 ``|snappingMiddle|``                  |snappingEndpoint|                ``|snappingEndpoint|``
|capturePoint|                   ``|capturePoint|``                    |capturePolygon|                  ``|capturePolygon|``
|captureLine|                    ``|captureLine|``                     |captureCurveFromFeature|         ``|captureCurveFromFeature|``
|deleteSelectedFeatures|         ``|deleteSelectedFeatures|``
|circularStringCurvePoint|       ``|circularStringCurvePoint|``        |circularStringRadius|            ``|circularStringRadius|``
|vertexTool|                     ``|vertexTool|``                      |vertexToolActiveLayer|           ``|vertexToolActiveLayer|``
|digitizeWithSegment|            ``|digitizeWithSegment|``             |digitizeShape|                   ``|digitizeShape|``
|streamingDigitize|              ``|streamingDigitize|``               |digitizeWithCurve|               ``|digitizeWithCurve|``
|moveFeature|                    ``|moveFeature|``                     |moveFeatureCopy|                 ``|moveFeatureCopy|``
|moveFeatureLine|                ``|moveFeatureLine|``                 |moveFeatureCopyLine|             ``|moveFeatureCopyLine|``
|moveFeaturePoint|               ``|moveFeaturePoint|``                |moveFeatureCopyPoint|            ``|moveFeatureCopyPoint|``
|rotateFeature|                  ``|rotateFeature|``                   |rotatePointSymbols|              ``|rotatePointSymbols|``
|scaleFeature|                   ``|scaleFeature|``
|offsetCurve|                    ``|offsetCurve|``                     |offsetPointSymbols|              ``|offsetPointSymbols|``
|simplify|                       ``|simplify|``                        |reshape|                         ``|reshape|``
|addRing|                        ``|addRing|``                         |addPart|                         ``|addPart|``
|fillRing|                       ``|fillRing|``
|deleteRing|                     ``|deleteRing|``                      |deletePart|                      ``|deletePart|``
|mergeFeatures|                  ``|mergeFeatures|``                   |mergeFeatureAttributes|          ``|mergeFeatureAttributes|``
|splitFeatures|                  ``|splitFeatures|``                   |splitParts|                      ``|splitParts|``
|reverseLine|                    ``|reverseLine|``
|allowIntersections|             ``|allowIntersections|``              |avoidIntersectionsCurrentLayer|  ``|avoidIntersectionsCurrentLayer|``
|avoidIntersectionsLayers|       ``|avoidIntersectionsLayers|``        |snappingSelf|                    ``|snappingSelf|``
===============================  ====================================  ================================  =================================

Mesh
..................................

================================  ====================================  ================================  ====================================
Icon                              Substitution                          Icon                              Substitution
================================  ====================================  ================================  ====================================
|meshDigitizing|                  ``|meshDigitizing|``                  |meshReindex|                     ``|meshReindex|``
|meshSelectExpression|            ``|meshSelectExpression|``            |meshSelectPolygon|               ``|meshSelectPolygon|``
|meshTransformByExpression|       ``|meshTransformByExpression|``       |meshEditForceByVectorLines|      ``|meshEditForceByVectorLines|``
|vertexCoordinates|               ``|vertexCoordinates|``
================================  ====================================  ================================  ====================================



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
|zoomInXAxis|                   ``|zoomInXAxis|``                   |refresh|                       ``|refresh|``
|identify|                      ``|identify|``                      |mapTips|                       ``|mapTips|``
|showBookmarks|                 ``|showBookmarks|``                 |newBookmark|                   ``|newBookmark|``
|measure|                       ``|measure|``                       |measureArea|                   ``|measureArea|``
|measureBearing|                ``|measureBearing|``                |measureAngle|                  ``|measureAngle|``
|newMap|                        ``|newMap|``                        |new3DMap|                      ``|new3DMap|``
|tiltUp|                        ``|tiltUp|``                        |tiltDown|                      ``|tiltDown|``
|3dNavigation|                  ``|3dNavigation|``                  |play|                          ``|play|``
|temporal|                      ``|temporal``                       |temporalNavigationOff|         ``|temporalNavigationOff|``
|temporalNavigationFixedRange|  ``|temporalNavigationFixedRange|``  |temporalNavigationAnimated|    ``|temporalNavigationAnimated|``
|newElevationProfile|           ``|newElevationProfile|``
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
|deselectActiveLayer|           ``|deselectActiveLayer|``
|selectDistance|                ``|selectDistance|``                |selectLocation|                ``|selectLocation|``
|selectAllTree|                 ``|selectAllTree|``                 |select|                        ``|select|``
|selectAdd|                     ``|selectAdd|``                     |selectRemove|                  ``|selectRemove|``
|formSelect|                    ``|formSelect|``                    |dataDefine|                    ``|dataDefine|``
|expression|                    ``|expression|``                    |dataDefineOn|                  ``|dataDefineOn|``
|dataDefineExpressionOn|        ``|dataDefineExpressionOn|``        |dataDefineError|               ``|dataDefineError|``
|dataDefineExpressionError|     ``|dataDefineExpressionError|``
|addExpression|                 ``|addExpression|``
|expressionFilter|              ``|expressionFilter|``              |filterMap|                     ``|filterMap|``
==============================  ==================================  ==============================  ==================================


Labels and Diagrams
...................

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|labelingSingle|         ``|labelingSingle|``         |labelingNone|           ``|labelingNone|``
|labelingRuleBased|      ``|labelingRuleBased|``      |labelingObstacle|       ``|labelingObstacle|``
|piechart|               ``|piechart|``               |diagramNone|            ``|diagramNone|``
|text|                   ``|text|``                   |histogram|              ``|histogram|``
|stackedBar|             ``|stackedBar|``
|createAnnotationLayer|  ``|createAnnotationLayer|``  |annotationLayer|        ``|annotationLayer|``
|textAnnotation|         ``|textAnnotation|``         |svgAnnotation|          ``|svgAnnotation|``
|formAnnotation|         ``|formAnnotation|``         |htmlAnnotation|         ``|htmlAnnotation|``
|actionText|             ``|actionText|``             |textAlongLine|          ``|textAlongLine|``
|labelbackground|        ``|labelbackground|``        |labelbuffer|            ``|labelbuffer|``
|labelformatting|        ``|labelformatting|``        |labelplacement|         ``|labelplacement|``
|labelshadow|            ``|labelshadow|``            |render|                 ``|render|``
|labelcallout|           ``|labelcallout|``
|labelAnchorCenter|      ``|labelAnchorCenter|``      |labelAnchorCustom|      ``|labelAnchorCustom|``
|labelAnchorEnd|         ``|labelAnchorEnd|``         |labelAnchorStart|       ``|labelAnchorStart|``
|pinLabels|              ``|pinLabels|``              |showHideLabels|         ``|showHideLabels|``
|moveLabel|              ``|moveLabel|``              |rotateLabel|            ``|rotateLabel|``
|showPinnedLabels|       ``|showPinnedLabels|``       |showUnplacedLabel|      ``|showUnplacedLabel|``
|changeLabelProperties|  ``|changeLabelProperties|``  |autoPlacementSettings|  ``|autoPlacementSettings|``
=======================  ===========================  =======================  ===========================

Decorations
...........

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|copyrightLabel|         ``|copyrightLabel|``         |addGrid|                ``|addGrid|``
|titleLabel|             ``|titleLabel|``             |northArrow|             ``|northArrow|``
|scaleBar|               ``|scaleBar|``               |addMap|                 ``|addMap|``
|addImage|               ``|addImage|``
=======================  ===========================  =======================  ===========================

Help
....

=======================  ===========================  =======================  ==================================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ==================================
|helpContents|           ``|helpContents|``           |qgisHomePage|           ``|qgisHomePage|``
|success|                ``|success|``
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
|arrowLeft|                     ``|arrowLeft|``                     |arrowRight|                    ``|arrowRight|``
|arrowDown|                     ``|arrowDown|``                     |arrowUp|                       ``|arrowUp|``
|symbologyAdd|                  ``|symbologyAdd|``                  |symbologyRemove|               ``|symbologyRemove|``
|projectProperties|             ``|projectProperties|``             |options|                       ``|options|``
|interfaceCustomization|        ``|interfaceCustomization|``        |keyboardShortcuts|             ``|keyboardShortcuts|``
|copyrightLabel|                ``|copyrightLabel|``                |northArrow|                    ``|northArrow|``
|scaleBar|                      ``|scaleBar|``                      |tracking|                      ``|tracking|``
|gpsTrackBarChart|              ``|gpsTrackBarChart|``
|gpsConnect|                    ``|gpsConnect|``                    |gpsDisconnect|                 ``|gpsDisconnect|``
|gpsDestinationLayer|           ``|gpsDestinationLayer|``           |addTrackPoint|                 ``|addTrackPoint|``
|recenter|                      ``|recenter|``                      |reset|                         ``|reset|``
|folder|                        ``|folder|``                        |extents|                       ``|extents|``
|settings|                      ``|settings|``                      |start|                         ``|start|``
|properties|                    ``|properties|``                    |deleteSelected|                ``|deleteSelected|``
|browserExpand|                 ``|browserExpand|``                 |browserCollapse|               ``|browserCollapse|``
|codeEditor|                    ``|codeEditor|``                    |add|                           ``|add|``
|relations|                     ``|relations|``                     |layoutItem3DMap|               ``|layoutItem3DMap|``
|stopwatch|                     ``|stopwatch|``                     |sensor|                        ``|sensor|``
|clearItem|                     ``|clearItem|``
==============================  ==================================  ==============================  ==================================


Attribute Table
===============

========================================== ============================================  =========================  =============================
Icon                                       Substitution                                  Icon                       Substitution
========================================== ============================================  =========================  =============================
|openTable|                                ``|openTable|``                               |openTableSelected|        ``|openTableSelected|``
|openTableVisible|                         ``|openTableVisible|``                        |openTableEdited|          ``|openTableEdited|``
|selectedToTop|                            ``|selectedToTop|``
|selectAll|                                ``|selectAll|``                               |invertSelection|          ``|invertSelection|``
|panToSelected|                            ``|panToSelected|``                           |zoomToSelected|           ``|zoomToSelected|``
|copySelected|                             ``|copySelected|``                            |editPaste|                ``|editPaste|``
|expressionSelect|                         ``|expressionSelect|``                        |deleteSelectedFeatures|   ``|deleteSelectedFeatures|``
|newAttribute|                             ``|newAttribute|``                            |deleteAttribute|          ``|deleteAttribute|``
|editTable|                                ``|editTable|``
|newTableRow|                              ``|newTableRow|``                             |calculateField|           ``|calculateField|``
|refresh|                                  ``|refresh|``                                 |formView|                 ``|formView|``
|conditionalFormatting|                    ``|conditionalFormatting|``                   |multiEdit|                ``|multiEdit|``
|dock|                                     ``|dock|``                                    |actionRun|                ``|actionRun|``
|duplicateFeature|                         ``|duplicateFeature|``                        |zoomTo|                   ``|zoomTo|``
|panTo|                                    ``|panTo|``                                   |highlightFeature|         ``|highlightFeature|``
|handleStoreFilterExpressionChecked|       ``|handleStoreFilterExpressionChecked|``
|handleStoreFilterExpressionUnchecked|     ``|handleStoreFilterExpressionUnchecked|``
========================================== ============================================  =========================  =============================


Projections and Georeferencer
=============================

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|geographic|                    ``|geographic|``                    |crs|                           ``|crs|``
|customProjection|              ``|customProjection|``              |setProjection|                 ``|setProjection|``
|projectionDisabled|            ``|projectionDisabled|``            |projectionEnabled|             ``|projectionEnabled|``
|transformation|                ``|transformation|``                |gdalScript|                    ``|gdalScript|``
|georefRun|                     ``|georefRun|``                     |pencil|                        ``|pencil|``
|linkQGisToGeoref|              ``|linkQGisToGeoref|``              |linkGeorefToQGis|              ``|linkGeorefToQGis|``
|fullHistogramStretch|          ``|fullHistogramStretch|``
==============================  ==================================  ==============================  ==================================


Print Layout
============

=======================  ===========================  =======================  ===========================
Icon                     Substitution                 Icon                     Substitution
=======================  ===========================  =======================  ===========================
|newLayout|              ``|newLayout|``              |layoutManager|          ``|layoutManager|``
|duplicateLayout|        ``|duplicateLayout|``
|newReport|              ``|newReport|``              |newPage|                ``|newPage|``
|atlasSettings|          ``|atlasSettings|``          |atlas|                  ``|atlas|``
|filePrint|              ``|filePrint|``              |saveMapAsImage|         ``|saveMapAsImage|``
|saveAsSVG|              ``|saveAsSVG|``              |saveAsPDF|              ``|saveAsPDF|``
|addBasicShape|          ``|addBasicShape|``          |addBasicCircle|         ``|addBasicCircle|``
|addBasicTriangle|       ``|addBasicTriangle|``       |addBasicRectangle|      ``|addBasicRectangle|``
|addNodesShape|          ``|addNodesShape|``          |editNodesShape|         ``|editNodesShape|``
|addPolygon|             ``|addPolygon|``             |addPolyline|            ``|addPolyline|``
|addArrow|               ``|addArrow|``               |northArrow|             ``|northArrow|``
|add3DMap|               ``|add3DMap|``               |addMap|                 ``|addMap|``
|elevationProfile|       ``|elevationProfile|``       |copyProfileSettings|    ``|copyProfileSettings|``
|addLegend|              ``|addLegend|``              |addHtml|                ``|addHtml|``
|addManualTable|         ``|addManualTable|``         |addTable|               ``|addTable|``
|addImage|               ``|addImage|``               |addMarker|              ``|addMarker|``
|label|                  ``|label|``                  |scaleBar|               ``|scaleBar|``
|select|                 ``|select|``                 |moveItemContent|        ``|moveItemContent|``
|setToCanvasScale|       ``|setToCanvasScale|``       |setToCanvasExtent|      ``|setToCanvasExtent|``
|viewScaleInCanvas|      ``|viewScaleInCanvas|``      |viewExtentInCanvas|     ``|viewExtentInCanvas|``
|raiseItems|             ``|raiseItems|``             |lowerItems|             ``|lowerItems|``
|moveItemsToTop|         ``|moveItemsToTop|``         |moveItemsToBottom|      ``|moveItemsToBottom|``
|alignLeft|              ``|alignLeft|``              |alignRight|             ``|alignRight|``
|alignHCenter|           ``|alignHCenter|``           |alignVCenter|           ``|alignVCenter|``
|alignTop|               ``|alignTop|``               |alignBottom|            ``|alignBottom|``
|distributeLeft|         ``|distributeLeft|``         |distributeRight|        ``|distributeRight|``
|distributeTop|          ``|distributeTop|``          |distributeBottom|       ``|distributeBottom|``
|distributeHCenter|      ``|distributeHCenter|``      |distributeVCenter|      ``|distributeVCenter|``
|distributeHSpace|       ``|distributeHSpace|``       |distributeVSpace|       ``|distributeVSpace|``
|resizeShortest|         ``|resizeShortest|``         |resizeTallest|          ``|resizeTallest|``
|resizeNarrowest|        ``|resizeNarrowest|``        |resizeWidest|           ``|resizeWidest|``
|resizeSquare|           ``|resizeSquare|``           |groupItems|             ``|groupItems|``
|lockItems|              ``|lockItems|``              |unlockAll|              ``|unlockAll|``
|locked|                 ``|locked|``                 |unlocked|               ``|unlocked|``
|lockRepeating|          ``|lockRepeating|``          |lockedGray|             ``|lockedGray|``
=======================  ===========================  =======================  ===========================

Layer Properties
================

==================================  ======================================  =============================  ================================
Icon                                Substitution                            Icon                           Substitution
==================================  ======================================  =============================  ================================
|symbology|                         ``|symbology|``                         |labelingSingle|               ``|labelingSingle|``
|sourceFields|                      ``|sourceFields|``                      |general|                      ``|general|``
|metadata|                          ``|metadata|``                          |action|                       ``|action|``
|display|                           ``|display|``                           |rendering|                    ``|rendering|``
|join|                              ``|join|``                              |diagram|                      ``|diagram|``
|labelmask|                         ``|labelmask|``                         |temporal|                     ``|temporal|``
|legend|                            ``|legend|``                            |dependencies|                 ``|dependencies|``
|3d|                                ``|3d|``                                |system|                       ``|system|``
|elevationscale|                    ``|elevationscale|``                    |layerTree|                    ``|layerTree|``
|editMetadata|                      ``|editMetadata|``                      |overlay|                      ``|overlay|``
|digitizing|                        ``|digitizing|``                        |auxiliaryStorage|             ``|auxiliaryStorage|``
|history|                           ``|history|``                           |stylePreset|                  ``|stylePreset|``
|search|                            ``|search|``                            |pyramids|                     ``|pyramids|``
|transparency|                      ``|transparency|``                      |rasterHistogram|              ``|rasterHistogram|``
|singleSymbol|                      ``|singleSymbol|``                      |nullSymbol|                   ``|nullSymbol|``
|graduatedSymbol|                   ``|graduatedSymbol|``                   |categorizedSymbol|            ``|categorizedSymbol|``
|25dSymbol|                         ``|25dSymbol|``                         |ruleBasedSymbol|              ``|ruleBasedSymbol|``
|invertedSymbol|                    ``|invertedSymbol|``                    |heatmapSymbol|                ``|heatmapSymbol|``
|pointDisplacementSymbol|           ``|pointDisplacementSymbol|``           |pointClusterSymbol|           ``|pointClusterSymbol|``
|mergedFeatures|                    ``|mergedFeatures|``
|meshcontours|                      ``|meshcontours|``                      |meshcontoursoff|              ``|meshcontoursoff|``
|meshvectors|                       ``|meshvectors|``                       |meshvectorsoff|               ``|meshvectorsoff|``
|meshframe|                         ``|meshframe|``                         |meshaveraging|                ``|meshaveraging|``
|singleColor|                       ``|singleColor|``                       |paletted|                     ``|paletted|``
|singlebandPseudocolor|             ``|singlebandPseudocolor|``             |multibandColor|               ``|multibandColor|``
|pointCloudExtent|                  ``|pointCloudExtent|``
|sum|                               ``|sum|``                               |sort|                         ``|sort|``
|paintEffects|                      ``|paintEffects|``                      |mapIdentification|            ``|mapIdentification|``
|styleManager|                      ``|styleManager|``                      |iconView|                     ``|iconView|``
|joinNotEditable|                   ``|joinNotEditable|``                   |joinedLayerNotEditable|       ``|joinedLayerNotEditable|``
|joinHasNotUpsertOnEdit|            ``|joinHasNotUpsertOnEdit|``            |filterTableFields|            ``|filterTableFields|``
|symbologyEdit|                     ``|symbologyEdit|``
|sharingImport|                     ``|sharingImport|``                     |sharingExport|                ``|sharingExport|``
==================================  ======================================  =============================  ================================


Plugins
=======

Processing
..........

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|processingAlgorithm|           ``|processingAlgorithm|``           |processingModel|               ``|processingModel|``
|processingHistory|             ``|processingHistory|``             |processingResult|              ``|processingResult|``
|menu|                          ``|menu|``
|processSelected|               ``|processSelected|``               |editHelpContent|               ``|editHelpContent|``  
|saveAsPython|                  ``|saveAsPython|``                  |modelOutput|                   ``|modelOutput|``  
|qgsProjectFile|                ``|qgsProjectFile|``                |addToProject|                  ``|addToProject|``
|fieldInteger|                  ``|fieldInteger|``
|meanCoordinates|               ``|meanCoordinates|``               |extractLayerExtent|            ``|extractLayerExtent|``
|selectRandom|                  ``|selectRandom|``                  |vectorGrid|                    ``|vectorGrid|``
|convexHull|                    ``|convexHull|``                    |buffer|                        ``|buffer|``
|intersect|                     ``|intersect|``                     |union|                         ``|union|``
|symmetricalDifference|         ``|symmetricalDifference|``         |clip|                          ``|clip|``
|difference|                    ``|difference|``                    |dissolve|                      ``|dissolve|``
|checkGeometry|                 ``|checkGeometry|``                 |exportGeometry|                ``|exportGeometry|``
|delaunay|                      ``|delaunay|``                      |centroids|                     ``|centroids|``
|polygonToLine|                 ``|polygonToLine|``                 |extractVertices|               ``|extractVertices|``
|lineToPolygon|                 ``|lineToPolygon|``                 |nearestNeighbour|              ``|nearestNeighbour|``
|splitLayer|                    ``|splitLayer|``                    |heatmap|                       ``|heatmap|``
|showRasterCalculator|          ``|showRasterCalculator|``          |showMeshCalculator|            ``|showMeshCalculator|``
|regularPoints|                 ``|regularPoints|``                 |addGeometryAttributes|         ``|addGeometryAttributes|``
|basicStatistics|               ``|basicStatistics|``               |uniqueValues|                  ``|uniqueValues|``
|collect|                       ``|collect|``                       |simplify_2|                    ``|simplify_2|``
|createGrid|                    ``|createGrid|``                    |distanceMatrix|                ``|distanceMatrix|``
|lineIntersections|             ``|lineIntersections|``             |mergeLayers|                   ``|mergeLayers|``
|sumPoints|                     ``|sumPoints|``                     |sumLengthLines|                ``|sumLengthLines|``
|randomPointsInPolygons|        ``|randomPointsInPolygons|``        |randomPointsWithinPolygon|     ``|randomPointsWithinPolygon|``
|randomPointsOnLines|           ``|randomPointsOnLines|``           |randomPointsWithinExtent|      ``|randomPointsWithinExtent|``
|multiToSingle|                 ``|multiToSingle|``
|grid|                          ``|grid|``                          |tiles|                         ``|tiles|``
|merge|                         ``|merge|``                         |rasterClip|                    ``|rasterClip|``
|contour|                       ``|contour|``                       |proximity|                     ``|proximity|``
|polygonize|                    ``|polygonize|``                    |rasterize|                     ``|rasterize|``
|sieve|                         ``|sieve|``                         |nearblack|                     ``|nearblack|``
|projectionAdd|                 ``|projectionAdd|``                 |projectionExport|              ``|projectionExport``
|8To24Bits|                     ``|8To24Bits|``                     |24To8Bits|                     ``|24To8Bits|``
|rasterInfo|                    ``|rasterInfo|``                    |rasterOverview|                ``|rasterOverview|``
|vrt|                           ``|vrt|``                           |voronoi|                       ``|voronoi|``
|translate|                     ``|translate|``                     |warp|                          ``|warp|``
|iterate|                       ``|iterate|``                       |terminal|                      ``|terminal|``
==============================  ==================================  ==============================  ==================================

Various Core Plugins
....................

Standard provided with basic install, but not loaded with initial install

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|showPluginManager|             ``|showPluginManager|``             |installPluginFromZip|          ``|installPluginFromZip|``
|pythonFile|                    ``|pythonFile|``                    |runConsole|                    ``|runConsole|``
|showEditorConsole|             ``|showEditorConsole|``             |clearConsole|                  ``|clearConsole|``
|offlineEditingCopy|            ``|offlineEditingCopy|``            |offlineEditingSync|            ``|offlineEditingSync|``
|plugin|                        ``|plugin|``                        |metasearch|                    ``|metasearch|``
|geometryChecker|               ``|geometryChecker|``               |topologyChecker|               ``|topologyChecker|``
|fromSelectedFeature|           ``|fromSelectedFeature|``           |sqlQueryBuilder|               ``|sqlQueryBuilder|``
==============================  ==================================  ==============================  ==================================

Grass integration
.................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|grassLogo|                     ``|grassLogo|``                     |grassRegion|                   ``|grassRegion|``
|grassTools|                    ``|grassTools|``                    |grassNewMapset|                ``|grassNewMapset|``
|grassOpenMapset|               ``|grassOpenMapset|``               |grassCloseMapset|              ``|grassCloseMapset|``
==============================  ==================================  ==============================  ==================================


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |24To8Bits| image:: /static/common/24-to-8-bits.png
   :width: 1.5em
.. |25dSymbol| image:: /static/common/renderer25dSymbol.png
   :width: 1.5em
.. |3d| image:: /static/common/3d.png
   :width: 1.5em
.. |3dNavigation| image:: /static/common/mAction3DNavigation.png
   :width: 1.3em
.. |8To24Bits| image:: /static/common/8-to-24-bits.png
   :width: 1.5em
.. |action| image:: /static/common/action.png
   :width: 2em
.. |actionRun| image:: /static/common/mAction.png
   :width: 1.5em
.. |actionText| image:: /static/common/mActionText.png
   :width: 1.5em
.. |add| image:: /static/common/mActionAdd.png
   :width: 1.5em
.. |add3DMap| image:: /static/common/mActionAdd3DMap.png
   :width: 1.5em
.. |addAfsLayer| image:: /static/common/mActionAddAfsLayer.png
   :width: 1.5em
.. |addAllToOverview| image:: /static/common/mActionAddAllToOverview.png
   :width: 1.5em
.. |addArrow| image:: /static/common/mActionAddArrow.png
   :width: 1.5em
.. |addBasicCircle| image:: /static/common/mActionAddBasicCircle.png
   :width: 1.5em
.. |addBasicRectangle| image:: /static/common/mActionAddBasicRectangle.png
   :width: 1.5em
.. |addBasicShape| image:: /static/common/mActionAddBasicShape.png
   :width: 1.5em
.. |addBasicTriangle| image:: /static/common/mActionAddBasicTriangle.png
   :width: 1.5em
.. |addDelimitedTextLayer| image:: /static/common/mActionAddDelimitedTextLayer.png
   :width: 1.5em
.. |addExpression| image:: /static/common/mActionAddExpression.png
   :width: 1.5em
.. |addGeometryAttributes| image:: /static/common/mAlgorithmAddGeometryAttributes.png
   :width: 1.5em
.. |addGpsLayer| image:: /static/common/mActionAddGpsLayer.png
   :width: 1.5em
.. |addGrid| image:: /static/common/add_grid.png
   :width: 1.5em
.. |addHanaLayer| image:: /static/common/mActionAddHanaLayer.png
   :width: 1.5em
.. |addHtml| image:: /static/common/mActionAddHtml.png
   :width: 1.5em
.. |addImage| image:: /static/common/mActionAddImage.png
   :width: 1.5em
.. |addLayer| image:: /static/common/mActionAddLayer.png
   :width: 1.5em
.. |addLegend| image:: /static/common/mActionAddLegend.png
   :width: 1.5em
.. |addManualTable| image:: /static/common/mActionAddManualTable.png
   :width: 1.5em
.. |addMap| image:: /static/common/mActionAddMap.png
   :width: 1.5em
.. |addMarker| image:: /static/common/mActionAddMarker.png
   :width: 1.5em
.. |addMeshLayer| image:: /static/common/mActionAddMeshLayer.png
   :width: 1.5em
.. |addMssqlLayer| image:: /static/common/mActionAddMssqlLayer.png
   :width: 1.5em
.. |addNodesShape| image:: /static/common/mActionAddNodesShape.png
   :width: 1.5em
.. |addOgrLayer| image:: /static/common/mActionAddOgrLayer.png
   :width: 1.5em
.. |addOracleLayer| image:: /static/common/mActionAddOracleLayer.png
   :width: 1.5em
.. |addPart| image:: /static/common/mActionAddPart.png
   :width: 1.5em
.. |addPointCloudLayer| image:: /static/common/mActionAddPointCloudLayer.png
   :width: 1.5em
.. |addPolygon| image:: /static/common/mActionAddPolygon.png
   :width: 1.5em
.. |addPolyline| image:: /static/common/mActionAddPolyline.png
   :width: 1.5em
.. |addPostgisLayer| image:: /static/common/mActionAddPostgisLayer.png
   :width: 1.5em
.. |addRasterLayer| image:: /static/common/mActionAddRasterLayer.png
   :width: 1.5em
.. |addRing| image:: /static/common/mActionAddRing.png
   :width: 2em
.. |addSpatiaLiteLayer| image:: /static/common/mActionAddSpatiaLiteLayer.png
   :width: 1.5em
.. |addTable| image:: /static/common/mActionAddTable.png
   :width: 1.5em
.. |addTiledSceneLayer| image:: /static/common/mActionAddTiledSceneLayer.png
   :width: 1.5em
.. |addToProject| image:: /static/common/mAddToProject.png
   :width: 1.5em
.. |addTrackPoint| image:: /static/common/mActionAddTrackPoint.png
   :width: 1.5em
.. |addVectorTileLayer| image:: /static/common/mActionAddVectorTileLayer.png
   :width: 1.5em
.. |addVirtualLayer| image:: /static/common/mActionAddVirtualLayer.png
   :width: 1.5em
.. |addWcsLayer| image:: /static/common/mActionAddWcsLayer.png
   :width: 1.5em
.. |addWfsLayer| image:: /static/common/mActionAddWfsLayer.png
   :width: 1.5em
.. |addWmsLayer| image:: /static/common/mActionAddWmsLayer.png
   :width: 1.5em
.. |addXyzLayer| image:: /static/common/mActionAddXyzLayer.png
   :width: 1.5em
.. |alignBottom| image:: /static/common/mActionAlignBottom.png
   :width: 1.5em
.. |alignHCenter| image:: /static/common/mActionAlignHCenter.png
   :width: 1.5em
.. |alignLeft| image:: /static/common/mActionAlignLeft.png
   :width: 1.5em
.. |alignRight| image:: /static/common/mActionAlignRight.png
   :width: 1.5em
.. |alignTop| image:: /static/common/mActionAlignTop.png
   :width: 1.5em
.. |alignVCenter| image:: /static/common/mActionAlignVCenter.png
   :width: 1.5em
.. |allEdits| image:: /static/common/mActionAllEdits.png
   :width: 1.5em
.. |allowIntersections| image:: /static/common/mActionAllowIntersections.png
   :width: 1.5em
.. |annotationLayer| image:: /static/common/mIconAnnotationLayer.png
   :width: 1.5em
.. |arrowDown| image:: /static/common/mActionArrowDown.png
   :width: 1.5em
.. |arrowLeft| image:: /static/common/mActionArrowLeft.png
   :width: 1.2em
.. |arrowRight| image:: /static/common/mActionArrowRight.png
   :width: 1.2em
.. |arrowUp| image:: /static/common/mActionArrowUp.png
   :width: 1.5em
.. |atlas| image:: /static/common/mIconAtlas.png
   :width: 1.5em
.. |atlasSettings| image:: /static/common/mActionAtlasSettings.png
   :width: 1.5em
.. |autoPlacementSettings| image:: /static/common/mIconAutoPlacementSettings.png
   :width: 1.5em
.. |auxiliaryStorage| image:: /static/common/mIconAuxiliaryStorage.png
   :width: 1.5em
.. |avoidIntersectionsCurrentLayer| image:: /static/common/mActionAvoidIntersectionsCurrentLayer.png
   :width: 1.5em
.. |avoidIntersectionsLayers| image:: /static/common/mActionAvoidIntersectionsLayers.png
   :width: 1.5em
.. |basicStatistics| image:: /static/common/mAlgorithmBasicStatistics.png
   :width: 1.5em
.. |browserCollapse| image:: /static/common/browser_collapse.png
   :width: 1.5em
.. |browserExpand| image:: /static/common/browser_expand.png
   :width: 1.5em
.. |buffer| image:: /static/common/mAlgorithmBuffer.png
   :width: 1.5em
.. |cad| image:: /static/common/cad.png
   :width: 1.5em
.. |cadConstruction| image:: /static/common/cad_construction.png
   :width: 1.5em
.. |cadParallel| image:: /static/common/cad_parallel.png
   :width: 1.5em
.. |cadPerpendicular| image:: /static/common/cad_perpendicular.png
   :width: 1.5em
.. |calculateField| image:: /static/common/mActionCalculateField.png
   :width: 1.5em
.. |captureCurveFromFeature| image:: /static/common/mActionCaptureCurveFromFeature.png
   :width: 1.5em
.. |captureLine| image:: /static/common/mActionCaptureLine.png
   :width: 1.5em
.. |capturePoint| image:: /static/common/mActionCapturePoint.png
   :width: 1.5em
.. |capturePolygon| image:: /static/common/mActionCapturePolygon.png
   :width: 1.5em
.. |categorizedSymbol| image:: /static/common/rendererCategorizedSymbol.png
   :width: 1.5em
.. |centroids| image:: /static/common/mAlgorithmCentroids.png
   :width: 1.5em
.. |changeLabelProperties| image:: /static/common/mActionChangeLabelProperties.png
   :width: 1.5em
.. |checkGeometry| image:: /static/common/mAlgorithmCheckGeometry.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |circle2Points| image:: /static/common/mActionCircle2Points.png
   :width: 1.5em
.. |circle2TangentsPoint| image:: /static/common/mActionCircle2TangentsPoint.png
   :width: 1.5em
.. |circle3Points| image:: /static/common/mActionCircle3Points.png
   :width: 1.5em
.. |circle3Tangents| image:: /static/common/mActionCircle3Tangents.png
   :width: 1.5em
.. |circleCenterPoint| image:: /static/common/mActionCircleCenterPoint.png
   :width: 1.5em
.. |circularStringCurvePoint| image:: /static/common/mActionCircularStringCurvePoint.png
   :width: 1.5em
.. |circularStringRadius| image:: /static/common/mActionCircularStringRadius.png
   :width: 1.5em
.. |clearConsole| image:: /static/common/iconClearConsole.png
   :width: 1.5em
.. |clearItem| image:: /static/common/mIconClearItem.png
   :width: 1.5em
.. |clip| image:: /static/common/mAlgorithmClip.png
   :width: 1.5em
.. |codeEditor| image:: /static/common/mIconCodeEditor.png
   :width: 1.5em
.. |collapseTree| image:: /static/common/mActionCollapseTree.png
   :width: 1.5em
.. |collect| image:: /static/common/mAlgorithmCollect.png
   :width: 1.5em
.. |colorBox| image:: /static/common/mIconColorBox.png
   :width: 1.5em
.. |colorPicker| image:: /static/common/mIconColorPicker.png
   :width: 1.5em
.. |colorSwatches| image:: /static/common/mIconColorSwatches.png
   :width: 1.5em
.. |colorWheel| image:: /static/common/mIconColorWheel.png
   :width: 1.5em
.. |conditionalFormatting| image:: /static/common/mActionConditionalFormatting.png
   :width: 1.5em
.. |contextHelp| image:: /static/common/mActionContextHelp.png
   :width: 1.5em
.. |contour| image:: /static/common/contour.png
   :width: 1.5em
.. |convexHull| image:: /static/common/mAlgorithmConvexHull.png
   :width: 1.5em
.. |copyProfileSettings| image:: /static/common/mActionCopyProfileSettings.png
   :width: 1.5em
.. |copySelected| image:: /static/common/mActionCopySelected.png
   :width: 1.5em
.. |copyrightLabel| image:: /static/common/copyright_label.png
   :width: 1.5em
.. |createAnnotationLayer| image:: /static/common/mActionCreateAnnotationLayer.png
   :width: 1.5em
.. |createGrid| image:: /static/common/mAlgorithmCreateGrid.png
   :width: 1.5em
.. |createMemory| image:: /static/common/mActionCreateMemory.png
   :width: 1.5em
.. |crs| image:: /static/common/CRS.png
   :width: 1.5em
.. |customProjection| image:: /static/common/mActionCustomProjection.png
   :width: 1.5em
.. |dataDefine| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |dataDefineError| image:: /static/common/mIconDataDefineError.png
   :width: 1.5em
.. |dataDefineExpressionError| image:: /static/common/mIconDataDefineExpressionError.png
   :width: 1.5em
.. |dataDefineExpressionOn| image:: /static/common/mIconDataDefineExpressionOn.png
   :width: 1.5em
.. |dataDefineOn| image:: /static/common/mIconDataDefineOn.png
   :width: 1.5em
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
.. |dbManager| image:: /static/common/dbmanager.png
   :width: 1.5em
.. |dbSchema| image:: /static/common/mIconDbSchema.png
   :width: 1.5em
.. |degrees| unicode:: 0x00B0
   :ltrim:
.. |delaunay| image:: /static/common/mAlgorithmDelaunay.png
   :width: 1.5em
.. |deleteAttribute| image:: /static/common/mActionDeleteAttribute.png
   :width: 1.5em
.. |deletePart| image:: /static/common/mActionDeletePart.png
   :width: 2em
.. |deleteRing| image:: /static/common/mActionDeleteRing.png
   :width: 2em
.. |deleteSelected| image:: /static/common/mActionDeleteSelected.png
   :width: 1.5em
.. |deleteSelectedFeatures| image:: /static/common/mActionDeleteSelectedFeatures.png
   :width: 1.5em
.. |dependencies| image:: /static/common/dependencies.png
   :width: 1.5em
.. |deselectActiveLayer| image:: /static/common/mActionDeselectActiveLayer.png
   :width: 1.5em
.. |deselectAll| image:: /static/common/mActionDeselectAll.png
   :width: 1.5em
.. |diagram| image:: /static/common/diagram.png
   :width: 2em
.. |diagramNone| image:: /static/common/diagramNone.png
   :width: 1.5em
.. |difference| image:: /static/common/mAlgorithmDifference.png
   :width: 1.5em
.. |digitizeShape| image:: /static/common/mActionDigitizeShape.png
   :width: 1.5em
.. |digitizeWithCurve| image:: /static/common/mActionDigitizeWithCurve.png
   :width: 1.5em
.. |digitizeWithSegment| image:: /static/common/mActionDigitizeWithSegment.png
   :width: 1.5em
.. |digitizing| image:: /static/common/digitizing.png
   :width: 1.5em
.. |display| image:: /static/common/display.png
   :width: 1.5em
.. |dissolve| image:: /static/common/mAlgorithmDissolve.png
   :width: 1.5em
.. |distanceMatrix| image:: /static/common/mAlgorithmDistanceMatrix.png
   :width: 1.5em
.. |distributeBottom| image:: /static/common/mActionDistributeBottom.png
   :width: 1.5em
.. |distributeHCenter| image:: /static/common/mActionDistributeHCenter.png
   :width: 1.5em
.. |distributeHSpace| image:: /static/common/mActionDistributeHSpace.png
   :width: 1.5em
.. |distributeLeft| image:: /static/common/mActionDistributeLeft.png
   :width: 1.5em
.. |distributeRight| image:: /static/common/mActionDistributeRight.png
   :width: 1.5em
.. |distributeTop| image:: /static/common/mActionDistributeTop.png
   :width: 1.5em
.. |distributeVCenter| image:: /static/common/mActionDistributeVCenter.png
   :width: 1.5em
.. |distributeVSpace| image:: /static/common/mActionDistributeVSpace.png
   :width: 1.5em
.. |dock| image:: /static/common/dock.png
   :width: 1.5em
.. |duplicateFeature| image:: /static/common/mActionDuplicateFeature.png
   :width: 1.5em
.. |duplicateLayout| image:: /static/common/mActionDuplicateLayout.png
   :width: 1.5em
.. |editCopy| image:: /static/common/mActionEditCopy.png
   :width: 1.5em
.. |editCut| image:: /static/common/mActionEditCut.png
   :width: 1.5em
.. |editHelpContent| image:: /static/common/mActionEditHelpContent.png
   :width: 1.5em
.. |editMetadata| image:: /static/common/editmetadata.png
   :width: 1.2em
.. |editNodesShape| image:: /static/common/mActionEditNodesShape.png
   :width: 1.5em
.. |editPaste| image:: /static/common/mActionEditPaste.png
   :width: 1.5em
.. |editTable| image:: /static/common/mActionEditTable.png
   :width: 1.5em
.. |editableEdits| image:: /static/common/mIconEditableEdits.png
   :width: 1em
.. |elevationProfile| image:: /static/common/mActionElevationProfile.png
   :width: 1.5em
.. |elevationscale| image:: /static/common/elevationscale.png
   :width: 1.5em
.. |ellipseCenter2Points| image:: /static/common/mActionEllipseCenter2Points.png
   :width: 1.5em
.. |ellipseCenterPoint| image:: /static/common/mActionEllipseCenterPoint.png
   :width: 1.5em
.. |ellipseExtent| image:: /static/common/mActionEllipseExtent.png
   :width: 1.5em
.. |ellipseFoci| image:: /static/common/mActionEllipseFoci.png
   :width: 1.5em
.. |expandNewTree| image:: /static/common/mActionExpandNewTree.png
   :width: 1.5em
.. |expandTree| image:: /static/common/mActionExpandTree.png
   :width: 1.5em
.. |exportGeometry| image:: /static/common/export_geometry.png
   :width: 1.5em
.. |expression| image:: /static/common/mIconExpression.png
   :width: 1.5em
.. |expressionFilter| image:: /static/common/mIconExpressionFilter.png
   :width: 1.5em
.. |expressionSelect| image:: /static/common/mIconExpressionSelect.png
   :width: 1.5em
.. |extents| image:: /static/common/extents.png
   :width: 1.5em
.. |extractLayerExtent| image:: /static/common/mAlgorithmExtractLayerExtent.png
   :width: 1.5em
.. |extractVertices| image:: /static/common/mAlgorithmExtractVertices.png
   :width: 1.5em
.. |favourites| image:: /static/common/mIconFavourites.png
   :width: 1.5em
.. |fieldInteger| image:: /static/common/mIconFieldInteger.png
   :width: 1.5em
.. |fileExit| image:: /static/common/mActionFileExit.png
.. |fileNew| image:: /static/common/mActionFileNew.png
   :width: 1.5em
.. |fileOpen| image:: /static/common/mActionFileOpen.png
   :width: 1.5em
.. |filePrint| image:: /static/common/mActionFilePrint.png
   :width: 1.5em
.. |fileSave| image:: /static/common/mActionFileSave.png
   :width: 1.5em
.. |fileSaveAs| image:: /static/common/mActionFileSaveAs.png
   :width: 1.5em
.. |fillRing| image:: /static/common/mActionFillRing.png
   :width: 1.5em
.. |filterMap| image:: /static/common/mActionFilterMap.png
   :width: 1.5em
.. |filterTableFields| image:: /static/common/mActionFilterTableFields.png
   :width: 1.5em
.. |floater| image:: /static/common/floater.png
   :width: 1.5em
.. |folder| image:: /static/common/mActionFolder.png
   :width: 1.5em
.. |formAnnotation| image:: /static/common/mActionFormAnnotation.png
   :width: 1.5em
.. |formSelect| image:: /static/common/mIconFormSelect.png
   :width: 1.5em
.. |formView| image:: /static/common/mActionFormView.png
   :width: 1.2em
.. |fromSelectedFeature| image:: /static/common/mActionFromSelectedFeature.png
   :width: 1em
.. |fullHistogramStretch| image:: /static/common/mActionFullHistogramStretch.png
   :width: 1.5em
.. |gdal| image:: /static/common/gdal.png
   :width: 1.5em
.. |gdalScript| image:: /static/common/mActionGDALScript.png
   :width: 1.5em
.. |general| image:: /static/common/general.png
   :width: 1.5em
.. |geoPackage| image:: /static/common/mGeoPackage.png
   :width: 1.5em
.. |geographic| image:: /static/common/geographic.png
.. |geometryChecker| image:: /static/common/geometrychecker.png
   :width: 1.5em
.. |georefRun| image:: /static/common/mGeorefRun.png
   :width: 1.5em
.. |gps| image:: /static/common/mIconGps.png
   :width: 1.5em
.. |gpsConnect| image:: /static/common/mIconGpsConnect.png
   :width: 1.5em
.. |gpsDestinationLayer| image:: /static/common/mIconGpsDestinationLayer.png
   :width: 1.5em
.. |gpsDisconnect| image:: /static/common/mIconGpsDisconnect.png
   :width: 1.5em
.. |gpsTrackBarChart| image:: /static/common/gpstrack_barchart.png
   :width: 1.5em
.. |graduatedSymbol| image:: /static/common/rendererGraduatedSymbol.png
   :width: 1.5em
.. |grassCloseMapset| image:: /static/common/grass_close_mapset.png
   :width: 1.5em
.. |grassLogo| image:: /static/common/grasslogo.png
   :width: 1.5em
.. |grassNewMapset| image:: /static/common/grass_new_mapset.png
   :width: 1.5em
.. |grassOpenMapset| image:: /static/common/grass_open_mapset.png
   :width: 1.5em
.. |grassRegion| image:: /static/common/grass_region.png
   :width: 1.5em
.. |grassTools| image:: /static/common/grass_tools.png
   :width: 1.5em
.. |grid| image:: /static/common/grid.png
   :width: 1.5em
.. |groupItems| image:: /static/common/mActionGroupItems.png
   :width: 1.5em
.. |hamburgerMenu| image:: /static/common/mIconHamburgerMenu.png
   :width: 1.5em
.. |hana| image:: /static/common/mIconHana.png
   :width: 1.5em
.. |handleStoreFilterExpressionChecked| image:: /static/common/mActionHandleStoreFilterExpressionChecked.png
   :width: 1.5em
.. |handleStoreFilterExpressionUnchecked| image:: /static/common/mActionHandleStoreFilterExpressionUnchecked.png
   :width: 1.5em
.. |heatmap| image:: /static/common/heatmap.png
   :width: 1.5em
.. |heatmapSymbol| image:: /static/common/rendererHeatmapSymbol.png
   :width: 1.5em
.. |helpContents| image:: /static/common/mActionHelpContents.png
   :width: 1.5em
.. |helpSponsors| image:: /static/common/mActionHelpSponsors.png
   :width: 1.5em
.. |hideAllLayers| image:: /static/common/mActionHideAllLayers.png
   :width: 1.5em
.. |hideDeselectedLayers| image:: /static/common/mActionHideDeselectedLayers.png
   :width: 1.5em
.. |hideSelectedLayers| image:: /static/common/mActionHideSelectedLayers.png
   :width: 1.5em
.. |highlightFeature| image:: /static/common/mActionHighlightFeature.png
   :width: 1.5em
.. |histogram| image:: /static/common/histogram.png
   :width: 1.5em
.. |history| image:: /static/common/mActionHistory.png
   :width: 1.5em
.. |htmlAnnotation| image:: /static/common/mActionHtmlAnnotation.png
   :width: 1.5em
.. |iconView| image:: /static/common/mActionIconView.png
   :width: 1.5em
.. |identify| image:: /static/common/mActionIdentify.png
   :width: 1.5em
.. |identifyByFreehand| image:: /static/common/mActionIdentifyByFreehand.png
   :width: 1.5em
.. |identifyByPolygon| image:: /static/common/mActionIdentifyByPolygon.png
   :width: 1.5em
.. |identifyByRadius| image:: /static/common/mActionIdentifyByRadius.png
   :width: 1.5em
.. |identifyByRectangle| image:: /static/common/mActionIdentifyByRectangle.png
   :width: 1.5em
.. |inOverview| image:: /static/common/mActionInOverview.png
   :width: 1.5em
.. |indicatorBadLayer| image:: /static/common/mIndicatorBadLayer.png
   :width: 1.5em
.. |indicatorEmbedded| image:: /static/common/mIndicatorEmbedded.png
   :width: 1.5em
.. |indicatorFilter| image:: /static/common/mIndicatorFilter.png
   :width: 1.5em
.. |indicatorLayerError| image:: /static/common/mIndicatorLayerError.png
   :width: 1.5em
.. |indicatorLowAccuracy| image:: /static/common/mIndicatorLowAccuracy.png
   :width: 1.5em
.. |indicatorMemory| image:: /static/common/mIndicatorMemory.png
   :width: 1.5em
.. |indicatorNoCRS| image:: /static/common/mIndicatorNoCRS.png
   :width: 1.5em
.. |indicatorNonRemovable| image:: /static/common/mIndicatorNonRemovable.png
   :width: 1.5em
.. |indicatorNotes| image:: /static/common/mIndicatorNotes.png
   :width: 1.5em
.. |indicatorOffline| image:: /static/common/mIndicatorOffline.png
   :width: 1.5em
.. |indicatorTemporal| image:: /static/common/mIndicatorTemporal.png
   :width: 1.5em
.. |inputText| image:: /static/common/inputtext.png
.. |installPluginFromZip| image:: /static/common/mActionInstallPluginFromZip.png
   :width: 1.5em
.. |interfaceCustomization| image:: /static/common/mActionInterfaceCustomization.png
   :width: 1.5em
.. |intersect| image:: /static/common/mAlgorithmIntersect.png
   :width: 1.5em
.. |invertSelection| image:: /static/common/mActionInvertSelection.png
   :width: 1.5em
.. |invertedSymbol| image:: /static/common/rendererInvertedSymbol.png
   :width: 1.5em
.. |iterate| image:: /static/common/mIconIterate.png
   :width: 1.5em
.. |join| image:: /static/common/join.png
   :width: 2em
.. |joinHasNotUpsertOnEdit| image:: /static/common/mIconJoinHasNotUpsertOnEdit.png
   :width: 1.5em
.. |joinNotEditable| image:: /static/common/mIconJoinNotEditable.png
   :width: 1.5em
.. |joinedLayerNotEditable| image:: /static/common/mIconJoinedLayerNotEditable.png
   :width: 1.5em
.. |kde| image:: /static/common/kde.png
   :width: 1.5em
.. |keyboardShortcuts| image:: /static/common/mActionKeyboardShortcuts.png
   :width: 1.5em
.. |label| image:: /static/common/mActionLabel.png
   :width: 1.5em
.. |labelAnchorCenter| image:: /static/common/mActionLabelAnchorCenter.png
   :width: 1.5em
.. |labelAnchorCustom| image:: /static/common/mActionLabelAnchorCustom.png
   :width: 1.5em
.. |labelAnchorEnd| image:: /static/common/mActionLabelAnchorEnd.png
   :width: 1.5em
.. |labelAnchorStart| image:: /static/common/mActionLabelAnchorStart.png
   :width: 1.5em
.. |labelbackground| image:: /static/common/labelbackground.png
   :width: 1.5em
.. |labelbuffer| image:: /static/common/labelbuffer.png
   :width: 1.5em
.. |labelcallout| image:: /static/common/labelcallout.png
   :width: 1.5em
.. |labelformatting| image:: /static/common/labelformatting.png
   :width: 1.5em
.. |labelingNone| image:: /static/common/labelingNone.png
   :width: 1.5em
.. |labelingObstacle| image:: /static/common/labelingObstacle.png
   :width: 1.5em
.. |labelingRuleBased| image:: /static/common/labelingRuleBased.png
   :width: 1.5em
.. |labelingSingle| image:: /static/common/labelingSingle.png
   :width: 1.5em
.. |labelmask| image:: /static/common/labelmask.png
   :width: 1.5em
.. |labelplacement| image:: /static/common/labelplacement.png
   :width: 1.5em
.. |labelshadow| image:: /static/common/labelshadow.png
   :width: 1.5em
.. |layerTree| image:: /static/common/mIconLayerTree.png
   :width: 1.5em
.. |layoutItem3DMap| image:: /static/common/mLayoutItem3DMap.png
   :width: 1.5em
.. |layoutManager| image:: /static/common/mActionLayoutManager.png
   :width: 1.5em
.. |legend| image:: /static/common/legend.png
   :width: 1.2em
.. |lineIntersections| image:: /static/common/mAlgorithmLineIntersections.png
   :width: 1.5em
.. |lineToPolygon| image:: /static/common/mAlgorithmLineToPolygon.png
   :width: 1.5em
.. |linkGeorefToQGis| image:: /static/common/mActionLinkGeorefToQGis.png
   :width: 2.5em
.. |linkQGisToGeoref| image:: /static/common/mActionLinkQGisToGeoref.png
   :width: 2.5em
.. |lockItems| image:: /static/common/mActionLockItems.png
   :width: 1.5em
.. |lockRepeating| image:: /static/common/lock_repeating.png
   :width: 1.5em
.. |locked| image:: /static/common/locked.png
   :width: 1.5em
.. |lockedGray| image:: /static/common/lockedGray.png
   :width: 1.2em
.. |logo| image:: /static/common/logo.png
   :width: 1.5em
.. |lowerItems| image:: /static/common/mActionLowerItems.png
   :width: 1.5em
.. |mapIdentification| image:: /static/common/mActionMapIdentification.png
   :width: 1.5em
.. |mapTips| image:: /static/common/mActionMapTips.png
   :width: 1.5em
.. |meanCoordinates| image:: /static/common/mAlgorithmMeanCoordinates.png
   :width: 1.5em
.. |measure| image:: /static/common/mActionMeasure.png
   :width: 1.5em
.. |measureAngle| image:: /static/common/mActionMeasureAngle.png
   :width: 1.5em
.. |measureArea| image:: /static/common/mActionMeasureArea.png
   :width: 1.5em
.. |measureBearing| image:: /static/common/mActionMeasureBearing.png
   :width: 1.5em
.. |menu| image:: /static/common/menu.png
   :width: 1.5em
.. |merge| image:: /static/common/merge.png
   :width: 1.5em
.. |mergeFeatureAttributes| image:: /static/common/mActionMergeFeatureAttributes.png
   :width: 1.5em
.. |mergeFeatures| image:: /static/common/mActionMergeFeatures.png
   :width: 1.5em
.. |mergeLayers| image:: /static/common/mAlgorithmMergeLayers.png
   :width: 1.5em
.. |mergedFeatures| image:: /static/common/rendererMergedFeatures.png
   :width: 1.5em
.. |meshDigitizing| image:: /static/common/mActionMeshDigitizing.png
   :width: 1.5em
.. |meshEditForceByVectorLines| image:: /static/common/mActionMeshEditForceByVectorLines.png
   :width: 1.5em
.. |meshReindex| image:: /static/common/mActionMeshReindex.png
   :width: 1.5em
.. |meshSelectExpression| image:: /static/common/mActionMeshSelectExpression.png
   :width: 1.5em
.. |meshSelectPolygon| image:: /static/common/mActionMeshSelectPolygon.png
   :width: 1.5em
.. |meshTransformByExpression| image:: /static/common/mActionMeshTransformByExpression.png
   :width: 1.5em
.. |meshaveraging| image:: /static/common/meshaveraging.png
   :width: 1.5em
.. |meshcontours| image:: /static/common/meshcontours.png
   :width: 1.5em
.. |meshcontoursoff| image:: /static/common/meshcontoursoff.png
   :width: 1.5em
.. |meshframe| image:: /static/common/meshframe.png
   :width: 1.5em
.. |meshvectors| image:: /static/common/meshvectors.png
   :width: 1.5em
.. |meshvectorsoff| image:: /static/common/meshvectorsoff.png
   :width: 1.5em
.. |metadata| image:: /static/common/metadata.png
   :width: 1.5em
.. |metasearch| image:: /static/common/MetaSearch.png
   :width: 1.5em
.. |modelOutput| image:: /static/common/mIconModelOutput.png
   :width: 1.5em
.. |moveFeature| image:: /static/common/mActionMoveFeature.png
   :width: 1.5em
.. |moveFeatureCopy| image:: /static/common/mActionMoveFeatureCopy.png
   :width: 1.5em
.. |moveFeatureCopyLine| image:: /static/common/mActionMoveFeatureCopyLine.png
   :width: 1.5em
.. |moveFeatureCopyPoint| image:: /static/common/mActionMoveFeatureCopyPoint.png
   :width: 1.5em
.. |moveFeatureLine| image:: /static/common/mActionMoveFeatureLine.png
   :width: 1.5em
.. |moveFeaturePoint| image:: /static/common/mActionMoveFeaturePoint.png
   :width: 1.5em
.. |moveItemContent| image:: /static/common/mActionMoveItemContent.png
   :width: 1.5em
.. |moveItemsToBottom| image:: /static/common/mActionMoveItemsToBottom.png
   :width: 1.5em
.. |moveItemsToTop| image:: /static/common/mActionMoveItemsToTop.png
   :width: 1.5em
.. |moveLabel| image:: /static/common/mActionMoveLabel.png
   :width: 1.5em
.. |multiEdit| image:: /static/common/mActionMultiEdit.png
   :width: 1.5em
.. |multiToSingle| image:: /static/common/mAlgorithmMultiToSingle.png
   :width: 1.5em
.. |multibandColor| image:: /static/common/multibandColor.png
   :width: 1.5em
.. |nearblack| image:: /static/common/nearblack.png
   :width: 1.5em
.. |nearestNeighbour| image:: /static/common/mAlgorithmNearestNeighbour.png
   :width: 1.5em
.. |new3DMap| image:: /static/common/mActionNew3DMap.png
   :width: 1.5em
.. |newAttribute| image:: /static/common/mActionNewAttribute.png
   :width: 1.5em
.. |newBookmark| image:: /static/common/mActionNewBookmark.png
   :width: 1.5em
.. |newElevationProfile| image:: /static/common/mActionNewElevationProfile.png
   :width: 1.5em
.. |newGeoPackageLayer| image:: /static/common/mActionNewGeoPackageLayer.png
   :width: 1.5em
.. |newGpx| image:: /static/common/mActionNewGpx.png
   :width: 1.5em
.. |newLayout| image:: /static/common/mActionNewLayout.png
   :width: 1.5em
.. |newMap| image:: /static/common/mActionNewMap.png
   :width: 1.5em
.. |newMeshLayer| image:: /static/common/mActionNewMeshLayer.png
   :width: 1.5em
.. |newPage| image:: /static/common/mActionNewPage.png
   :width: 1.5em
.. |newReport| image:: /static/common/mActionNewReport.png
   :width: 1.5em
.. |newSpatiaLiteLayer| image:: /static/common/mActionNewSpatiaLiteLayer.png
   :width: 1.5em
.. |newTableRow| image:: /static/common/mActionNewTableRow.png
   :width: 1.5em
.. |newVectorLayer| image:: /static/common/mActionNewVectorLayer.png
   :width: 1.5em
.. |newVirtualLayer| image:: /static/common/mActionNewVirtualLayer.png
   :width: 1.5em
.. |nix| image:: /static/common/nix.png
   :width: 1em
.. |northArrow| image:: /static/common/north_arrow.png
   :width: 1.5em
.. |nullSymbol| image:: /static/common/rendererNullSymbol.png
   :width: 1.5em
.. |offlineEditingCopy| image:: /static/common/offline_editing_copy.png
   :width: 1.5em
.. |offlineEditingSync| image:: /static/common/offline_editing_sync.png
   :width: 1.5em
.. |offsetCurve| image:: /static/common/mActionOffsetCurve.png
   :width: 1.5em
.. |offsetPointSymbols| image:: /static/common/mActionOffsetPointSymbols.png
   :width: 1.5em
.. |openTable| image:: /static/common/mActionOpenTable.png
   :width: 1.5em
.. |openTableEdited| image:: /static/common/mActionOpenTableEdited.png
   :width: 1.5em
.. |openTableSelected| image:: /static/common/mActionOpenTableSelected.png
   :width: 1.5em
.. |openTableVisible| image:: /static/common/mActionOpenTableVisible.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |osx| image:: /static/common/osx.png
   :width: 1em
.. |overlay| image:: /static/common/overlay.png
   :width: 1.5em
.. |paintEffects| image:: /static/common/mIconPaintEffects.png
   :width: 1.5em
.. |paletted| image:: /static/common/paletted.png
   :width: 1.5em
.. |pan| image:: /static/common/mActionPan.png
   :width: 1.5em
.. |panTo| image:: /static/common/mActionPanTo.png
   :width: 1.5em
.. |panToSelected| image:: /static/common/mActionPanToSelected.png
   :width: 1.5em
.. |pencil| image:: /static/common/pencil.png
   :width: 1.5em
.. |piechart| image:: /static/common/pie-chart.png
   :width: 1.5em
.. |pinLabels| image:: /static/common/mActionPinLabels.png
   :width: 1.5em
.. |play| image:: /static/common/mActionPlay.png
   :width: 1.5em
.. |plugin| image:: /static/common/plugin.png
   :width: 1.5em
.. |pointCloudExtent| image:: /static/common/pointCloudExtent.png
   :width: 1.5em
.. |pointCloudLayer| image:: /static/common/mIconPointCloudLayer.png
   :width: 1.5em
.. |pointClusterSymbol| image:: /static/common/rendererPointClusterSymbol.png
   :width: 1.5em
.. |pointDisplacementSymbol| image:: /static/common/rendererPointDisplacementSymbol.png
   :width: 1.5em
.. |polygonToLine| image:: /static/common/mAlgorithmPolygonToLine.png
   :width: 1.5em
.. |polygonize| image:: /static/common/polygonize.png
   :width: 1.5em
.. |processSelected| image:: /static/common/mActionProcessSelected.png
   :width: 1.5em
.. |processingAlgorithm| image:: /static/common/processingAlgorithm.png
   :width: 1.5em
.. |processingHistory| image:: /static/common/history.png
   :width: 1.5em
.. |processingModel| image:: /static/common/processingModel.png
   :width: 1.5em
.. |processingResult| image:: /static/common/processingResult.png
   :width: 1.5em
.. |projectProperties| image:: /static/common/mActionProjectProperties.png
   :width: 1.5em
.. |projectionAdd| image:: /static/common/projection-add.png
   :width: 1.5em
.. |projectionDisabled| image:: /static/common/mIconProjectionDisabled.png
   :width: 1.5em
.. |projectionEnabled| image:: /static/common/mIconProjectionEnabled.png
   :width: 1.5em
.. |projectionExport| image:: /static/common/projection-export.png
   :width: 1.5em
.. |properties| image:: /static/common/mIconProperties.png
   :width: 1.3em
.. |proximity| image:: /static/common/proximity.png
   :width: 1.5em
.. |pyramids| image:: /static/common/pyramids.png
   :width: 1.5em
.. |pythonFile| image:: /static/common/mIconPythonFile.png
   :width: 1.5em
.. |qgisHomePage| image:: /static/common/mActionQgisHomePage.png
   :width: 1.5em
.. |qgsProjectFile| image:: /static/common/mIconQgsProjectFile.png
   :width: 1.5em
.. |radioButtonOff| image:: /static/common/radiobuttonoff.png
   :width: 1.5em
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
   :width: 1.5em
.. |raiseItems| image:: /static/common/mActionRaiseItems.png
   :width: 1.5em
.. |randomPointsInPolygons| image:: /static/common/mAlgorithmRandomPointsInPolygons.png
   :width: 1.5em
.. |randomPointsOnLines| image:: /static/common/mAlgorithmRandomPointsOnLines.png
   :width: 1.5em
.. |randomPointsWithinExtent| image:: /static/common/mAlgorithmRandomPointsWithinExtent.png
   :width: 1.5em
.. |randomPointsWithinPolygon| image:: /static/common/mAlgorithmRandomPointsWithinPolygon.png
   :width: 1.5em
.. |rasterClip| image:: /static/common/raster-clip.png
   :width: 1.5em
.. |rasterHistogram| image:: /static/common/rasterHistogram.png
   :width: 1.5em
.. |rasterInfo| image:: /static/common/raster-info.png
   :width: 1.5em
.. |rasterOverview| image:: /static/common/raster-overview.png
   :width: 1.5em
.. |rasterize| image:: /static/common/rasterize.png
   :width: 1.5em
.. |recenter| image:: /static/common/mActionRecenter.png
   :width: 1.5em
.. |rectangle3PointsDistance| image:: /static/common/mActionRectangle3PointsDistance.png
   :width: 1.5em
.. |rectangle3PointsProjected| image:: /static/common/mActionRectangle3PointsProjected.png
   :width: 1.5em
.. |rectangleCenter| image:: /static/common/mActionRectangleCenter.png
   :width: 1.5em
.. |rectangleExtent| image:: /static/common/mActionRectangleExtent.png
   :width: 1.5em
.. |redo| image:: /static/common/mActionRedo.png
   :width: 1.5em
.. |refresh| image:: /static/common/mActionRefresh.png
   :width: 1.5em
.. |regularPoints| image:: /static/common/mAlgorithmRegularPoints.png
   :width: 1.5em
.. |regularPolygon2Points| image:: /static/common/mActionRegularPolygon2Points.png
   :width: 1.5em
.. |regularPolygonCenterCorner| image:: /static/common/mActionRegularPolygonCenterCorner.png
   :width: 1.5em
.. |regularPolygonCenterPoint| image:: /static/common/mActionRegularPolygonCenterPoint.png
   :width: 1.5em
.. |relations| image:: /static/common/relations.png
   :width: 1.5em
.. |removeAllFromOverview| image:: /static/common/mActionRemoveAllFromOverview.png
   :width: 1.5em
.. |removeLayer| image:: /static/common/mActionRemoveLayer.png
   :width: 1.5em
.. |render| image:: /static/common/render.png
   :width: 1.5em
.. |rendering| image:: /static/common/rendering.png
   :width: 1.5em
.. |reset| image:: /static/common/mActionReset.png
   :width: 1.5em
.. |reshape| image:: /static/common/mActionReshape.png
   :width: 1.5em
.. |resizeNarrowest| image:: /static/common/mActionResizeNarrowest.png
   :width: 1.5em
.. |resizeShortest| image:: /static/common/mActionResizeShortest.png
   :width: 1.5em
.. |resizeSquare| image:: /static/common/mActionResizeSquare.png
   :width: 1.5em
.. |resizeTallest| image:: /static/common/mActionResizeTallest.png
   :width: 1.5em
.. |resizeWidest| image:: /static/common/mActionResizeWidest.png
   :width: 1.5em
.. |reverseLine| image:: /static/common/mActionReverseLine.png
   :width: 1.5em
.. |rotateFeature| image:: /static/common/mActionRotateFeature.png
   :width: 1.5em
.. |rotateLabel| image:: /static/common/mActionRotateLabel.png
   :width: 1.5em
.. |rotatePointSymbols| image:: /static/common/mActionRotatePointSymbols.png
   :width: 1.5em
.. |ruleBasedSymbol| image:: /static/common/rendererRuleBasedSymbol.png
   :width: 1.5em
.. |runConsole| image:: /static/common/iconRunConsole.png
   :width: 1.5em
.. |saveAsPDF| image:: /static/common/mActionSaveAsPDF.png
   :width: 1.5em
.. |saveAsPython| image:: /static/common/mActionSaveAsPython.png
   :width: 1.5em
.. |saveAsSVG| image:: /static/common/mActionSaveAsSVG.png
   :width: 1.5em
.. |saveEdits| image:: /static/common/mActionSaveEdits.png
   :width: 1.5em
.. |saveMapAsImage| image:: /static/common/mActionSaveMapAsImage.png
   :width: 1.5em
.. |scaleBar| image:: /static/common/mActionScaleBar.png
   :width: 1.5em
.. |scaleFeature| image:: /static/common/mActionScaleFeature.png
   :width: 1.5em
.. |search| image:: /static/common/search.png
   :width: 1.5em
.. |select| image:: /static/common/mActionSelect.png
   :width: 1.5em
.. |selectAdd| image:: /static/common/mIconSelectAdd.png
   :width: 1.5em
.. |selectAll| image:: /static/common/mActionSelectAll.png
   :width: 1.5em
.. |selectAllTree| image:: /static/common/mActionSelectAllTree.png
   :width: 1.5em
.. |selectColor| image:: /static/common/selectcolor.png
.. |selectColorRamp| image:: /static/common/selectcolorramp.png
.. |selectDistance| image:: /static/common/mAlgorithmSelectDistance.png
   :width: 1.5em
.. |selectFreehand| image:: /static/common/mActionSelectFreehand.png
   :width: 1.5em
.. |selectLocation| image:: /static/common/mAlgorithmSelectLocation.png
   :width: 1.5em
.. |selectNumber| image:: /static/common/selectnumber.png
   :width: 2.8em
.. |selectPolygon| image:: /static/common/mActionSelectPolygon.png
   :width: 1.5em
.. |selectRadius| image:: /static/common/mActionSelectRadius.png
   :width: 1.5em
.. |selectRandom| image:: /static/common/mAlgorithmSelectRandom.png
   :width: 1.5em
.. |selectRectangle| image:: /static/common/mActionSelectRectangle.png
   :width: 1.5em
.. |selectRemove| image:: /static/common/mIconSelectRemove.png
   :width: 1.5em
.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |selectedToTop| image:: /static/common/mActionSelectedToTop.png
   :width: 1.5em
.. |sensor| image:: /static/common/sensor.png
   :width: 1.5em
.. |setProjection| image:: /static/common/mActionSetProjection.png
   :width: 1.5em
.. |setToCanvasExtent| image:: /static/common/mActionSetToCanvasExtent.png
   :width: 1.5em
.. |setToCanvasScale| image:: /static/common/mActionSetToCanvasScale.png
   :width: 1.5em
.. |settings| image:: /static/common/settings.png
   :width: 1.5em
.. |sharingExport| image:: /static/common/mActionSharingExport.png
   :width: 1.5em
.. |sharingImport| image:: /static/common/mActionSharingImport.png
   :width: 1.5em
.. |showAllLayers| image:: /static/common/mActionShowAllLayers.png
   :width: 1.5em
.. |showBookmarks| image:: /static/common/mActionShowBookmarks.png
   :width: 1.5em
.. |showEditorConsole| image:: /static/common/iconShowEditorConsole.png
   :width: 1.5em
.. |showHideLabels| image:: /static/common/mActionShowHideLabels.png
   :width: 1.5em
.. |showMeshCalculator| image:: /static/common/mActionShowMeshCalculator.png
   :width: 1.5em
.. |showPinnedLabels| image:: /static/common/mActionShowPinnedLabels.png
   :width: 1.5em
.. |showPluginManager| image:: /static/common/mActionShowPluginManager.png
   :width: 1.5em
.. |showPresets| image:: /static/common/mActionShowPresets.png
   :width: 1.5em
.. |showRasterCalculator| image:: /static/common/mActionShowRasterCalculator.png
   :width: 1.5em
.. |showSelectedLayers| image:: /static/common/mActionShowSelectedLayers.png
   :width: 1.5em
.. |showUnplacedLabel| image:: /static/common/mActionShowUnplacedLabel.png
   :width: 1.5em
.. |sieve| image:: /static/common/sieve.png
   :width: 1.5em
.. |simplify| image:: /static/common/mActionSimplify.png
   :width: 1.5em
.. |simplify_2| image:: /static/common/mAlgorithmSimplify.png
   :width: 1.5em
.. |singleColor| image:: /static/common/singleColor.png
   :width: 1.5em
.. |singleSymbol| image:: /static/common/rendererSingleSymbol.png
   :width: 1.5em
.. |singlebandPseudocolor| image:: /static/common/singlebandPseudocolor.png
   :width: 1.5em
.. |slider| image:: /static/common/slider.png
.. |snapping| image:: /static/common/mIconSnapping.png
   :width: 1.5em
.. |snappingArea| image:: /static/common/mIconSnappingArea.png
   :width: 1.5em
.. |snappingCentroid| image:: /static/common/mIconSnappingCentroid.png
   :width: 1.5em
.. |snappingEndpoint| image:: /static/common/mIconSnappingEndpoint.png
   :width: 1.5em
.. |snappingMiddle| image:: /static/common/mIconSnappingMiddle.png
   :width: 1.5em
.. |snappingSegment| image:: /static/common/mIconSnappingSegment.png
   :width: 1.5em
.. |snappingSelf| image:: /static/common/mIconSnappingSelf.png
   :width: 1.5em
.. |snappingVertex| image:: /static/common/mIconSnappingVertex.png
   :width: 1.5em
.. |sort| image:: /static/common/sort.png
   :width: 1.5em
.. |sourceFields| image:: /static/common/mSourceFields.png
   :width: 1.5em
.. |spatialite| image:: /static/common/mIconSpatialite.png
   :width: 1.5em
.. |splitFeatures| image:: /static/common/mActionSplitFeatures.png
   :width: 1.5em
.. |splitLayer| image:: /static/common/mAlgorithmSplitLayer.png
   :width: 1.5em
.. |splitParts| image:: /static/common/mActionSplitParts.png
   :width: 1.5em
.. |sqlQueryBuilder| image:: /static/common/sqlquerybuilder.png
   :width: 1.5em
.. |stackedBar| image:: /static/common/stacked-bar.png
   :width: 1.5em
.. |start| image:: /static/common/mActionStart.png
   :width: 1.5em
.. |stopwatch| image:: /static/common/mIconStopwatch.png
   :width: 1.5em
.. |streamingDigitize| image:: /static/common/mActionStreamingDigitize.png
   :width: 1.5em
.. |styleManager| image:: /static/common/mActionStyleManager.png
   :width: 1.5em
.. |stylePreset| image:: /static/common/stylepreset.png
   :width: 1.5em
.. |success| image:: /static/common/mIconSuccess.png
   :width: 1em
.. |sum| image:: /static/common/mActionSum.png
   :width: 1.2em
.. |sumLengthLines| image:: /static/common/mAlgorithmSumLengthLines.png
   :width: 1.5em
.. |sumPoints| image:: /static/common/mAlgorithmSumPoints.png
   :width: 1.5em
.. |svgAnnotation| image:: /static/common/mActionSvgAnnotation.png
   :width: 1.5em
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
.. |symbologyAdd| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |symbologyEdit| image:: /static/common/symbologyEdit.png
   :width: 1.5em
.. |symbologyRemove| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |symmetricalDifference| image:: /static/common/mAlgorithmSymmetricalDifference.png
   :width: 1.5em
.. |system| image:: /static/common/system.png
   :width: 1.5em
.. |tab| image:: /static/common/tab.png
   :width: 1.5em
.. |temporal| image:: /static/common/temporal.png
   :width: 1.5em
.. |temporalNavigationAnimated| image:: /static/common/mTemporalNavigationAnimated.png
   :width: 1.5em
.. |temporalNavigationFixedRange| image:: /static/common/mTemporalNavigationFixedRange.png
   :width: 1.5em
.. |temporalNavigationOff| image:: /static/common/mTemporalNavigationOff.png
   :width: 1.5em
.. |terminal| image:: /static/common/mActionTerminal.png
   :width: 1.5em
.. |text| image:: /static/common/text.png
   :width: 1.5em
.. |textAlongLine| image:: /static/common/mActionTextAlongLine.png
   :width: 1.5em
.. |textAnnotation| image:: /static/common/mActionTextAnnotation.png
   :width: 1.5em
.. |tiledSceneLayer| image:: /static/common/mIconTiledSceneLayer.png
   :width: 1.5em
.. |tiles| image:: /static/common/tiles.png
   :width: 1.5em
.. |tiltDown| image:: /static/common/mActionTiltDown.png
   :width: 1.5em
.. |tiltUp| image:: /static/common/mActionTiltUp.png
   :width: 1.5em
.. |titleLabel| image:: /static/common/title_label.png
   :width: 1.5em
.. |toggleAllLayers| image:: /static/common/mActionToggleAllLayers.png
   :width: 1.5em
.. |toggleEditing| image:: /static/common/mActionToggleEditing.png
   :width: 1.5em
.. |toggleSelectedLayers| image:: /static/common/mActionToggleSelectedLayers.png
   :width: 1.5em
.. |topologyChecker| image:: /static/common/mActionTopologyChecker.png
   :width: 1.5em
.. |tracing| image:: /static/common/mActionTracing.png
   :width: 1.5em
.. |tracking| image:: /static/common/tracking.png
   :width: 1.5em
.. |transformation| image:: /static/common/transformation.png
   :width: 1.5em
.. |translate| image:: /static/common/translate.png
   :width: 1.5em
.. |transparency| image:: /static/common/transparency.png
   :width: 1.5em
.. |unchecked| image:: /static/common/unchecked.png
   :width: 1.3em
.. |undo| image:: /static/common/mActionUndo.png
   :width: 1.5em
.. |union| image:: /static/common/mAlgorithmUnion.png
   :width: 1.5em
.. |uniqueValues| image:: /static/common/mAlgorithmUniqueValues.png
   :width: 1.5em
.. |unlockAll| image:: /static/common/mActionUnlockAll.png
   :width: 1.5em
.. |unlocked| image:: /static/common/unlocked.png
   :width: 1.5em
.. |user| image:: /static/common/user.png
   :width: 1.5em
.. |vectorGrid| image:: /static/common/vector_grid.png
   :width: 1.5em
.. |vertexCoordinates| image:: /static/common/mIconVertexCoordinates.png
   :width: 1.5em
.. |vertexTool| image:: /static/common/mActionVertexTool.png
   :width: 1.5em
.. |vertexToolActiveLayer| image:: /static/common/mActionVertexToolActiveLayer.png
   :width: 1.5em
.. |viewExtentInCanvas| image:: /static/common/mActionViewExtentInCanvas.png
   :width: 1.5em
.. |viewScaleInCanvas| image:: /static/common/mActionViewScaleInCanvas.png
   :width: 1.5em
.. |virtualLayer| image:: /static/common/mIconVirtualLayer.png
   :width: 1.5em
.. |voronoi| image:: /static/common/mAlgorithmVoronoi.png
   :width: 1.5em
.. |vrt| image:: /static/common/vrt.png
   :width: 1.5em
.. |warp| image:: /static/common/warp.png
   :width: 1.5em
.. |wcs| image:: /static/common/mIconWcs.png
   :width: 1.5em
.. |wfs| image:: /static/common/mIconWfs.png
   :width: 1.5em
.. |win| image:: /static/common/win.png
   :width: 1em
.. |wms| image:: /static/common/mIconWms.png
   :width: 1.5em
.. |zoomActual| image:: /static/common/mActionZoomActual.png
   :width: 1.5em
.. |zoomFullExtent| image:: /static/common/mActionZoomFullExtent.png
   :width: 1.5em
.. |zoomIn| image:: /static/common/mActionZoomIn.png
   :width: 1.5em
.. |zoomInXAxis| image:: /static/common/mActionZoomInXAxis.png
   :width: 1.5em
.. |zoomLast| image:: /static/common/mActionZoomLast.png
   :width: 1.5em
.. |zoomNext| image:: /static/common/mActionZoomNext.png
   :width: 1.5em
.. |zoomOut| image:: /static/common/mActionZoomOut.png
   :width: 1.5em
.. |zoomTo| image:: /static/common/mActionZoomTo.png
   :width: 1.5em
.. |zoomToLayer| image:: /static/common/mActionZoomToLayer.png
   :width: 1.5em
.. |zoomToSelected| image:: /static/common/mActionZoomToSelected.png
   :width: 1.5em
