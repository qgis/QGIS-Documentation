# makefile to convert figures into eps format for the book

# Comments from Michel Wurtz:
# You will notice that the list given is the list of targets.  "all" just
# refer to this list.  The most important rule is the next rule, that give
# the generic rule for transforming a .fig into a .eps file.  Note the use
# of % (define the couple target:source) and the use of
# $< (source postfix, here .fig) and $@ (target postfix, here .eps)

# with .eps extension:
JPG=qgis_icon_new_verylarge.eps\
#	nextfile.eps

PNG=\
  clearInput.eps\
  splash.eps\
  mAction.eps\
  mActionAddAllToOverview.eps\
  mActionAddIsland.eps\
  mActionAddLayer.eps\
  mActionAddLegend.eps\
  mActionAddNonDbLayer.eps\
  mActionAddOgrLayer.eps\
  mActionAddRasterLayer.eps\
  mActionAddRing.eps\
  mActionAddVertex.eps\
  mActionAddWmsLayer.eps\
  mActionCaptureLine.eps\
  mActionCapturePoint.eps\
  mActionCapturePolygon.eps\
  mActionCheckQgisVersion.eps\
  mActionCollapseTree.eps\
  mActionContextHelp.eps\
  mActionCopySelected.eps\
  mActionCustomProjection.eps\
  mActionDeleteAttribute.eps\
  mActionDeleteSelected.eps\
  mActionDeleteVertex.eps\
  mActionDraw.eps\
  mActionEditCopy.eps\
  mActionEditCut.eps\
  mActionEditPaste.eps\
  mActionExpandTree.eps\
  mActionExportMapServer.eps\
  mActionFileExit.eps\
  mActionFileNew.eps\
  mActionFileOpen.eps\
  mActionFilePrint.eps\
  mActionFileSave.eps\
  mActionFileSaveAs.eps\
  mActionFileSmall.eps\
  mActionFolder.eps\
  mActionHelpAbout.eps\
  mActionHelpContents.eps\
  mActionHideAllLayers.eps\
  mActionIdentify.eps\
  mActionInOverview.eps\
  mActionInvertSelection.eps\
  mActionLabel.eps\
  mActionMapTips.eps\
  mActionMeasure.eps\
  mActionMeasureArea.eps\
  mActionMoveFeature.eps\
  mActionMoveVertex.eps\
  mActionNewAttribute.eps\
  mActionNewBookmark.eps\
  mActionNewFolder.eps\
  mActionNewVectorLayer.eps\
  mActionOpenTable.eps\
  mActionOptions.eps\
  mActionPan.eps\
  mActionProjectProperties.eps\
  mActionPropertyItem.eps\
  mActionQgisHomePage.eps\
  mActionRemove.eps\
  mActionRemoveAllFromOverview.eps\
  mActionRemoveLayer.eps\
  mActionSaveAsSVG.eps\
  mActionSaveMapAsImage.eps\
  mActionScaleBar.eps\
  mActionSelect.eps\
  mActionSelectedToTop.eps\
  mActionSelectPan.eps\
  mActionShowAllLayers.eps\
  mActionShowBookmarks.eps\
  mActionShowPluginManager.eps\
  mActionSplitFeatures.eps\
  mActionToggleEditing.eps\
  mActionUnselectAttributes.eps\
  mActionZoomFullExtent.eps\
  mActionZoomIn.eps\
  mActionZoomLast.eps\
  mActionZoomOut.eps\
  mActionZoomToLayer.eps\
  mActionZoomToSelected.eps\
  mIconDelete.eps\
  mIconEditable.eps\
  mIconFirst.eps\
  mIconGeometryLayer.eps\
  mIconLast.eps\
  mIconLayer.eps\
  mIconLineLayer.eps\
  mIconNew.eps\
  mIconNext.eps\
  mIconNoPyramid.eps\
  mIconPointLayer.eps\
  mIconPolygonLayer.eps\
  mIconPrevious.eps\
  mIconProjectionDisabled.eps\
  mIconProjectionEnabled.eps\
  mIconProjectionProblem.eps\
  mIconProperties.eps\
  mIconPyramid.eps\
  mIconSymbology.eps\
  mIconUnknownLayerType.eps\
  mIconWaitingForLayerType.eps\
  mMapserverExport.eps \
  mActionLowerItems.eps \
  mActionMoveItemContent.eps \
  mActionGroupItems.eps \
  mActionUngroupItems.eps \
  mActionMoveItemsToTop.eps \
  mActionRaiseItems.eps \
  mActionMoveItemsToBottom.eps \
  		
##### TARGETS #####

all: $(PNG) $(JPG)
	if [ ! -d ../finalpix/ ]; then mkdir ../finalpix; fi
	#don't use move (mv):
	cp *.eps ../finalpix/

#$(EPS):	%.eps: %.fig
#	fig2dev -L eps $< > $@

#$(FIGPNG): %.png: %.fig
#	fig2dev -L png -m 2 $< > $@

$(PNG): %.eps: %.png
	# Workaround for PDF
	#convert -geometry 300x -depth 1 $< $@
	convert $< $@ 

$(JPG): %.eps: %.jpg
	# Workaround for PDF
	#convert -geometry 300x -depth 1 $< $@
	convert $< $@

clean:
	rm -f *.bak *~ *.pdf $(PNG) $(JPG)
