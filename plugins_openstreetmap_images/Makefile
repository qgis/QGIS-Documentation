# makefile to convert figures into eps format for the book

# Comments from Michel Wurtz:
# You will notice that the list given is the list of targets.  "all" just
# refer to this list.  The most important rule is the next rule, that give
# the generic rule for transforming a .fig into a .eps file.  Note the use
# of % (define the couple target:source) and the use of
# $< (source postfix, here .fig) and $@ (target postfix, here .eps)

# with .eps extension:
# JPG=qgis_icon_new_verylarge.eps\
#	nextfile.eps

PNG=osmweb.eps\
	osm_addRelation.eps\
	osm_clearUndoRedo.eps\
	osm_createLine.eps\
	osm_createPoint.eps\
	osm_createPolygon.eps\
	osm_createRelation.eps\
	osm_download.eps\
	osm_editRelation.eps\
	osm_editRelation.eps\
	osm_featureManager.eps\
	osm_generateTags.eps\
	osm_identify.eps\
	osm_import.eps\
	osm_load.eps\
	osm_move.eps\
	osm_questionMark.eps\
	osm_redo.eps\
	osm_removeFeat.eps\
	osm_removeMember.eps\
	osm_remove.eps\
	osm_removeRelation.eps\
	osm_removeTag.eps\
	osm_save.eps\
	osm_star.eps\
	osm_undo.eps\
	osm_upload.eps\
	osm_urDetails.eps\
	osm_widgets.eps\
	osmloaddialog.eps\
	osm_changefeaturetag.eps\
	osm_pointcreation.eps\
	osm_downloaddialog.eps\
	osm_uploaddialog.eps\
	osm_savedialog.eps\
	osm_importtoosmdialog.eps\
	osm_importdialog.eps\
	osm_icon.eps\

##### TARGETS #####

all: $(PNG) $(JPG)
	if [ ! -d ../finalpix/ ]; then mkdir ../finalpix; fi
	#do not use move (mv):
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
