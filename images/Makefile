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

PNG=addshapefile.eps\
	digitising_attributes09.eps\
	inoverview.eps\
	map_composer_blank.eps\
	map_composer.eps\
	newpostgisconnectiondialog.eps\
	newvectorlayer.eps\
	no_pyramid.eps\
	pluginmanager_50pct.eps\
	pluginmanager_80pct.eps\
	pluginmanager.eps\
	pluginmanager1.eps\
	pluginmanager2.eps\
	plugintoolbar08.eps\
	pyramid.eps \
	qgis-icon-16x16.eps\
	querybuilder.eps\
	rastercontextmenu.eps\
	raster_properties.eps\
	shapefileloaded09.eps\
	shapefileopendialog.eps\
	spiticon.eps\
	startup09.eps\
	vectorLayerSymbology09.eps\
	options.eps \
	buffer.eps \
	georeferencer.eps \
	copyright.eps \
	scalebar.eps \
	delim_text.eps \
	gridmaker.eps \
	northarrow.eps \
	gps.eps \
	measureline.eps \
	measure_line.eps \
	measurearea.eps \
	measure_area.eps \
	wfs_dmsolutions.eps \
	wfs-icon.eps \
	identify_action.eps\
	mActionOpenTable.eps\
	mActionToggleEditing.eps\
	mActionAddRing.eps\
	mActionAddIsland.eps\
	mActionAddVertex.eps\
	mActionAddLayer.eps\
	mActionAddRasterLayer.eps\
	mActionAddWmsLayer.eps\
	mActionCaptureLine.eps\
	mActionCapturePoint.eps\
	mActionCapturePolygon.eps\
	mActionCollapseTree.eps\
	mActionDeleteSelected.eps\
	mActionDeleteVertex.eps\
	mActionDeleteSelected.eps\
	mActionEditPaste.eps\
	mActionEditCopy.eps\
	mActionEditCut.eps\
	mActionExpandTree.eps\
	mActionIdentify.eps\
	mActionOptions.eps\
	mActionPan.eps\
	mActionMoveFeature.eps\
	mActionMoveVertex.eps\
	mActionNewVectorLayer.eps\
	mActionRemoveLayer.eps\
	mActionSplitFeatures.eps\
	mActionSelect.eps\
	mActionZoomFullExtent.eps\
	mActionZoomLast.eps\
	mActionZoomToLayer.eps\
	mActionZoomIn.eps\
	mActionZoomOut.eps\
	mActionZoomToSelected.eps\
	mIconProjectionEnabled.eps\
	mActionFileSave.eps\
		
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
