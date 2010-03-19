# makefile to convert figures into eps format for the book

# Comments from Michel Wurtz:
# You will notice that the list given is the list of targets.  "all" just
# refer to this list.  The most important rule is the next rule, that give
# the generic rule for transforming a .fig into a .eps file.  Note the use
# of % (define the couple target:source) and the use of
# $< (source postfix, here .fig) and $@ (target postfix, here .eps)

# with .eps extension:
# JPG=qgis_icon_new_verylarge.eps\

PNG=shapefileloaded.eps \
    shapefileopendialog.eps \
    vectorLayerSymbology.eps \
    vectorClassifySingle.eps \
    vectorClassifyGraduated.eps \
    vectorClassifyContinous.eps \
    vectorClassifyUnique.eps \
    action_identifyaction.eps \
    editProjectSnapping.eps \
    editDigitizing.eps \
    editNewVector.eps \
    queryBuilder.eps \
    addvectorlayerdialog.eps\
    vectorAttributeTable.eps\
    vectorNotWrapping.eps\
    editwidgetsdialog.eps\
    vectorWrapping.eps\
    redo_undo.eps\
    rotatepointsymbol.eps\
    mActionNewAttribute.eps\
    mActionDeleteAttribute.eps\
    mActionCalculateField.eps\
    fieldcalculator.eps\

# digitising_attributes09.eps\
#	newvectorlayer.eps\
#	querybuilder.eps\
	
	
##### TARGETS #####

all: $(PNG) $(JPG)
	if [ ! -d ../finalpix/ ]; then mkdir ../finalpix; fi
	#please, don't use mv:
	cp *.eps ../finalpix/

#$(EPS):	%.eps: %.fig
#	fig2dev -L eps $< > $@

#$(FIGPNG): %.png: %.fig
#	fig2dev -L png -m 2 $< > $@

$(PNG): %.eps: %.png
	# Workaround for PDF version
	#convert -geometry 300x -depth 1 $< $@
	convert $< $@ 

#$(JPG): %.eps: %.jpg
	# Workaround for PDF version
	#convert -geometry 300x -depth 1 $< $@
#	convert $< $@

clean:
	rm -f *.bak *~ *.pdf $(PNG) $(JPG)
