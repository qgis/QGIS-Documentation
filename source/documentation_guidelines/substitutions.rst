*************
Substitutions
*************

Usage
=====

When you want to use an icon from |qgis| in a rst document 
there is a big chance that there is allready a substitution defined 
in conf.py that can/should be used. When a new icon in QGIS is added
it should be added first to conf.py before it is used in a rst document.


Below the icons and the Substitions defined in conf.py are given.

Common Substitutions
====================

Can be used/found in many places in manuals

Platform Icons
..............

==========  ===============
Icon        Substitution
==========  ===============
|nix|       ``|nix|``        
|osx|	    ``|osx|``
|win|	    ``|win|``
==========  ===============



Menu Items
..........

=======================  =========================  =====================  =========================
Icon                     Substitution               Icon                   Substitution
=======================  =========================  =====================  =========================
|checkbox|               ``|checkbox|``             \                      \
|checkbox_checked|       ``|checkbox_checked|``     |checkbox_unchecked|   ``|checkbox_unchecked|``
|radiobuttonon|          ``|radiobuttonon|``   	    |radiobuttonoff|       ``|radiobuttonoff|``
|selectnumber|           ``|selectnumber|``         |selectstring|         ``|selectstring|``
|browsebutton|           ``|browsebutton|``	    |slider|               ``|slider|``
=======================  =========================  =====================  =========================

Words and symbols
.................

==========  ================
Icon        Substitution
==========  ================
|QG|        ``|QG|``
|wedge|	    ``|wedge|``
|degrees|   ``|degrees|``
==========  ================


Menu items not used much
........................

==============  =================
Icon            Substitution
==============  =================
|selectcolor|   ``|selectcolor|``
|inputtext|     ``|inputtext|``
|tab|           ``|tab|``
==============  =================


Toolbar Button Icons
====================

Manage Layers and overview
..........................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionAddOgrLayer|            ``|mActionAddOgrLayer|``   	    |mActionAddNonDbLayer| 	    ``|mActionAddNonDbLayer|``
|mActionAddRasterLayer|         ``|mActionAddRasterLayer|``         \                               \ 
|mActionAddLayer|               ``|mActionAddLayer|``    	    |mActionAddSpatiaLiteLayer|	    ``|mActionAddSpatiaLiteLayer|``
|mActionNewVectorLayer|		``|mActionNewVectorLayer|``         |mActionRemoveLayer|	    ``|mActionRemoveLayer|``
|mActionAddWmsLayer|       	``|mActionAddWmsLayer|``    	    |wfs|         		    ``|wfs|``
|mActionInOverview|		``|mActionInOverview|``  	    |mActionAddAllToOverview|	    ``|mActionAddAllToOverview|``
|mActionRemoveAllFromOverview|	``|mActionRemoveAllFromOverview|``  |RemoveAllOVerview|             ``|RemoveAllOVerview|``
|mActionShowAllLayers|		``|mActionShowAllLayers|``          |mActionHideAllLayers|	    ``|mActionHideAllLayers|``
==============================  ==================================  ==============================  ==================================


File
....

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionFileNew|                ``|mActionFileNew|``                |mActionFileOpen|		    ``|mActionFileOpen|``
|mActionFileSave|               ``|mActionFileSave|``		    |mActionFileSaveAs|		    ``|mActionFileSaveAs|``
|mActionFileExit|               ``|mActionFileExit|``		    \                   	    \ 
==============================  ==================================  ==============================  ==================================

Edit
....

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionUndo|			``|mActionUndo|``                   |mActionRedo|		    ``|mActionRedo|``
|mActionSelect|			``|mActionSelect|``		    |mActionEditCut|		    ``|mActionEditCut|``
|mActionEditCopy|		``|mActionEditCopy|``		    |mActionEditPaste|		    ``|mActionEditPaste|``
==============================  ==================================  ==============================  ==================================


Digitizing and Advanced Digitizing
..................................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionToggleEditing|          ``|mActionToggleEditing|``          |mActionCapturePoint|           ``|mActionCapturePoint|``
|mActionCaptureLine|            ``|mActionCaptureLine|``  	    |mActionCapturePolygon|         ``|mActionCapturePolygon|``
|mActionNodeTool|		``|mActionNodeTool|``   	    |mActionMoveFeature|            ``|mActionMoveFeature|``
|mActionDeleteSelected|         ``|mActionDeleteSelected|``	    |mActionDeleteVertex|           ``|mActionDeleteVertex|``
|mActionSimplify|               ``|mActionSimplify|``       	    |mActionReshape|                ``|mActionReshape|``
|mActionAddRing|                ``|mActionAddRing|``  		    |mActionAddIsland|		    ``|mActionAddIsland|``
|mActionDeleteRing|		``|mActionDeleteRing|``  	    |mActionDeletePart|		    ``|mActionDeletePart|``
|mergeFeats|                    ``|mergeFeats|``  	    	    |mActionMergeFeatures|	    ``|mActionMergeFeatures|``
|mActionSplitFeatures|		``|mActionSplitFeatures|``          |mActionRotatePointSymbols|     ``|mActionRotatePointSymbols|``
==============================  ==================================  ==============================  ==================================


Map Navigation and attributes
.............................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionPan|                    ``|mActionPan|``                    soon pan to selection           ``|soon pan to selection|``
|mActionZoomIn|			``|mActionZoomIn|``		    |mActionZoomOut|		    ``|mActionZoomOut|``
|mActionZoomFullExtent|	        ``|mActionZoomFullExtent|``	    |mActionZoomToLayer|            ``|mActionZoomToLayer|``	    
|mActionZoomLast|               ``|mActionZoomLast|``   	    |mActionZoomNext|		    ``|mActionZoomNext|``
|mActionDraw|                   ``|mActionDraw|``                   |mIconStopRendering|	    ``|mIconStopRendering|``
|mActionIdentify|		``|mActionIdentify|``		    |mActionMapTips|                ``|mActionMapTips|``
|mActionShowBookmarks|		``|mActionShowBookmarks|``	    |mActionNewBookmark|            ``|mActionNewBookmark|``
|mActionMeasure|                ``|mActionMeasure|``       	    |mActionMeasureArea|	    ``|mActionMeasureArea|``
|mActionMeasureAngle|		``|mActionMeasureAngle|``           \                               \ 
|mActionSelectRectangle|	``|mActionSelectRectangle|``        |mActionSelectPolygon|          ``|mActionSelectPolygon|``
|mActionSelectFreehand|		``|mActionSelectFreehand|``         |mActionSelectRadius|           ``|mActionSelectRadius|``
|mActionDeselectAll|  		``|mActionDeselectAll|``            \                               \ 
==============================  ==================================  ==============================  ==================================


labels
......

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionLabeling|		``|mActionLabeling|``               |mActionTextAnnotation|	    ``|mActionTextAnnotation|``
|mActionAnnotation|    		``|mActionAnnotation|``             |mActionFormAnnotation|	    ``|mActionFormAnnotation|``
==============================  ==================================  ==============================  ==================================

help
....

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionHelpContents|		``|mActionHelpContents|``           |mActionQgisHomePage|           ``|mActionQgisHomePage|``
|mActionCheckQgisVersion|	``|mActionCheckQgisVersion|``	    |mActionHelpAbout|              ``|mActionHelpAbout|``
|mActionHelpSponsors|		``|mActionHelpSponsors|``           |mActionContextHelp|            ``|mActionContextHelp|``
==============================  ==================================  ==============================  ==================================


Other basic icons
=================

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionProjectProperties|	``|mActionProjectProperties|``      |mActionOptions|         	    ``|mActionOptions|``
|copyright_label|		``|copyright_label|``          	    |north_arrow|    		    ``|north_arrow|``
|scale_bar|  			``|scale_bar|``                     \                               \  
|gps_importer|       		``|gps_importer|``                  |gpstrack_barchart|		    ``|gpstrack_barchart|``
|gpstrack_polarchart|		``|gpstrack_polarchart|``           |tracking|          	    ``|tracking|``
|mActionFolder|                 ``|mActionFolder|``                 |raster-info|		    ``|raster-info|``
==============================  ==================================  ==============================  ==================================


Attribute Table
===============

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionOpenTable|          	``|mActionOpenTable|`` 		    \                               \ 
|mActionSelectedToTop|		``|mActionSelectedToTop|`` 	    |mActionInvertSelection|	    ``|mActionInvertSelection|``
|mActionCopySelected|           ``|mActionCopySelected|`` 	    |mActionZoomToSelected|         ``|mActionZoomToSelected|``
|mActionNewAttribute|           ``|mActionNewAttribute|``	    |mActionDeleteAttribute|	    ``|mActionDeleteAttribute|``
|mActionCalculateField|         ``|mActionCalculateField|``	    \                               \ 
==============================  ==================================  ==============================  ==================================


Projections and Georeferencer
=============================

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|geographic|                    ``|geographic|``                    \                               \  
|mActionCustomProjection|  	``|mActionCustomProjection|``       |mIconNew|     		    ``|mIconNew|``
|mIconProjectionDisabled|	``|mIconProjectionDisabled|``       |mIconProjectionEnabled|        ``|mIconProjectionEnabled|``
|georeferencer|      		``|georeferencer|``                 |pencil|        		    ``|pencil|``
|mActionLinkQGisToGeoref|	``|mActionLinkQGisToGeoref|`` 	    |mActionLinkGeorefToQGis|	    ``|mActionLinkGeorefToQGis|``
|coordinate_capture|		``|coordinate_capture|`` 	    |mActionStartGeoref|     	    ``|mActionStartGeoref|``
|selectesubsetlayer|		``|selectesubsetlayer|``            |selectcreatelayer|  	    ``|selectcreatelayer|``
==============================  ==================================  ==============================  ==================================



Composer Icons
==============

Icons used in Composer:

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionNewComposer|            ``|mActionNewComposer|``            |mActionComposerManager|	    ``|mActionComposerManager|``
|mActionSaveAsSVG|              ``|mActionSaveAsSVG|``  	    |mActionSaveAsPDF|              ``|mActionSaveAsPDF|``
|mActionFilePrint|		``|mActionFilePrint|``		    |mActionSaveMapAsImage|         ``|mActionSaveMapAsImage|``
|mActionAddArrow| 		``|mActionAddArrow|`` 		    |mActionAddBasicShape| 	    ``|mActionAddBasicShape|``
|mActionAddMap|                 ``|mActionAddMap|``  		    |mActionAddLegend|              ``|mActionAddLegend|``
|mActionLabel| 			``|mActionLabel|``  		    |mActionScaleBar| 		    ``|mActionScaleBar|``
|mActionSelectPan|		``|mActionSelectPan|``		    |mActionGroupItems|		    ``|mActionGroupItems|``
|mActionRaiseItems|             ``|mActionRaiseItems|``		    |mActionLowerItems|		    ``|mActionLowerItems|``
|mActionMoveItemContent|	``|mActionMoveItemContent|``        \                  		    \ 
|mActionMoveItemsToTop|         ``|mActionMoveItemsToTop|`` 	    |mActionMoveItemsToBottom|	    ``|mActionMoveItemsToBottom|``
|mActionAlignLeft|              ``|mActionAlignLeft|``              |mActionAlignRight|		    ``|mActionAlignRight|``
|mActionAlignHCenter|		``|mActionAlignHCenter|``	    |mActionAlignVCenter|	    ``|mActionAlignVCenter|``
|mActionAlignTop|               ``|mActionAlignTop|``               |mActionAlignBottom|	    ``|mActionAlignBottom|``
|mIconLock|                     ``|mIconLock|``      		    \                   	    \ 
==============================  ==================================  ==============================  ==================================


Plugin Icons
============

Core Plugin Icons
.................

Standard provided with basic install, but not loaded with initial install

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|mActionShowPluginManager|      ``|mActionShowPluginManager|``      |plugin_installer|        	    ``|plugin_installer|``
|icon_sqlanywhere|              ``|icon_sqlanywhere|``              |oracle_raster|                 ``|oracle_raster|``
|raster_terrain|                ``|raster_terrain|``  		    |heatmap|  			    ``|heatmap|``
|offline_editing_copy|          ``|offline_editing_copy|`` 	    |interpolation|                 ``|interpolation|``
|mapserver_export|		``|mapserver_export|``     	    |mActionExportMapServer|	    ``|mActionExportMapServer|``
|spiticon|               	``|spiticon|``                      |delimited_text|		    ``|delimited_text|`` 
|mActionGDALScript|		``|mActionGDALScript|``		    |dxf2shp_converter|		    ``|dxf2shp_converter|``
|spatialquery|			``|spatialquery|``     		    |plugin|   			    ``|plugin|``
==============================  ==================================  ==============================  ==================================


FTools Icons
............

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|ftools|			``|ftools|``			    \                               \  
|matrix|			``|matrix|``			    |unique|    		    ``|unique|``
|sum_lines|			``|sum_lines|``			    |sum_points|		    ``|sum_points|``
|basic_statistics|		``|basic_statistics|``              |neighbor|                      ``|neighbor|``
|mean|    			``|mean|``                     	    |intersections|		    ``|intersections|``
|random_selection|		``|random_selection|``		    |sub_selection|   		    ``|sub_selection|``
|random_points|			``|random_points|``   		    \                               \  
|regular_points|  		``|regular_points|``                |vector_grid|   		    ``|vector_grid|``
|select_location|		``|select_location|`` 		    |layer_extent|   		    ``|layer_extent|``
|convex_hull|  			``|convex_hull|``    		    |buffer|     		    ``|buffer|``
|intersect|			``|intersect|``  		    |union|    			    ``|union|``
|sym_difference|		``|sym_difference|``		    |clip|          		    ``|clip|``
|difference|                    ``|difference|``    		    |dissolve|  		    ``|dissolve|``
|check_geometry|		``|check_geometry|``		    |export_geometry|		    ``|export_geometry|``
|delaunay| 			``|delaunay|``                      |centroids|      		    ``|centroids|``
|simplify|			``|simplify|``			    |join_location|    		    ``|join_location|``
|multi_to_single|		``|multi_to_single|``		    |single_to_multi|		    ``|single_to_multi|``
|to_lines|       		``|to_lines|``        		    |extract_nodes|		    ``|extract_nodes|``
|export_projection|		``|export_projection|``		    |define_projection|		    ``|define_projection|``
|split_layer|  			``|split_layer|``       	    |merge_shapes|		    ``|merge_shapes|``
==============================  ==================================  ==============================  ==================================


Grass integration
.................

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|grass|            		``|grass|``                         \                               \  
|grass_new_mapset|  		``|grass_new_mapset|`` 		    |grass_new_vector_layer|	    ``|grass_new_vector_layer|``
|grass_open_mapset|		``|grass_open_mapset|``		    |grass_close_mapset|	    ``|grass_close_mapset|``
|grass_add_vector|  		``|grass_add_vector|`` 		    |grass_add_raster|		    ``|grass_add_raster|``
|grass_edit|            	``|grass_edit|``       		    |grass_tools|		    ``|grass_tools|``
|grass_region|			``|grass_region|`` 		    |grass_region_edit|		    ``|grass_region_edit|``
|grass_new_point|  		``|grass_new_point|``		    |grass_new_line| 		    ``|grass_new_line|``
|grass_new_boundary|		``|grass_new_boundary|`` 	    |grass_new_centroid|	    ``|grass_new_centroid|``
|grass_move_vertex| 		``|grass_move_vertex|``  	    |grass_add_vertex| 		    ``|grass_add_vertex|``
|grass_delete_vertex|		``|grass_delete_vertex|``	    |grass_move_line|    	    ``|grass_move_line|``
|grass_split_line|		``|grass_split_line|``    	    |grass_delete_line|		    ``|grass_delete_line|``
|grass_edit_attributes|		``|grass_edit_attributes|``	    |grass_add_map|   		    ``|grass_add_map|``
|grass_close_edit|     		``|grass_close_edit|``      	    |grass_copy_map|		    ``|grass_copy_map|``
|grass_rename_map|		``|grass_rename_map|``		    |grass_delete_map|		    ``|grass_delete_map|``
|grass_set_region|  		``|grass_set_region|`` 		    |grass_refresh|   		    ``|grass_refresh|``
==============================  ==================================  ==============================  ==================================

OpenStreetMap
.............

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|osm_load|                      ``|osm_load|`` 			    |osm_download|           	    ``|osm_download|``
|osm_featureManager|            ``|osm_featureManager|``	    |osm_identify|           	    ``|osm_identify|``
|osm_import|             	``|osm_import|``                    |osm_save|               	    ``|osm_save|``
|osm_createPoint|        	``|osm_createPoint|``		    |osm_createLine|         	    ``|osm_createLine|``
|osm_createPolygon|      	``|osm_createPolygon|``             \                               \ 
|osm_move|               	``|osm_move|``         		    |osm_removeFeat|         	    ``|osm_removeFeat|``
|osm_createRelation|     	``|osm_createRelation|`` 	    |osm_addRelation|        	    ``|osm_addRelation|``
|osm_editRelation|       	``|osm_editRelation|``  	    |osm_generateTags|       	    ``|osm_generateTags|``
|osm_questionMark|       	``|osm_questionMark|``              \                               \ 
==============================  ==================================  ==============================  ==================================


eVis plugin
...........

==============================  ==================================  ==============================  ==================================
Icon                            Substitution                        Icon                            Substitution
==============================  ==================================  ==============================  ==================================
|event_browser|			``|event_browser|``                 |event_id|      		    ``|event_id|``
|evis_connect|			``|evis_connect|`` 		    |evis_file|   		    ``|evis_file|``
==============================  ==================================  ==============================  ==================================
