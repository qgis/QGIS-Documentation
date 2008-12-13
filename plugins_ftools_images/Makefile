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

PNG=analysis.eps\
    calcgeom.eps\
    centroids.eps\
    checkgeometry.eps\
    clip.eps\
    conversion.eps\
    datamanagement.eps\
    define.eps\
    dissolve.eps\
    dynamicbuffer.eps\
    erase.eps\
    extractnodes.eps\
    fieldstats.eps\
    ftoolslogo2.eps\
    ftoolslogo.eps\
    geoprocessing.eps\
    help.eps\
    intersectlines.eps\
    intersect.eps\
    joinattr.eps\
    listunique.eps\
    meancoords.eps\
    multiconvex.eps\
    multitosingle.eps\
    nearestneigh.eps\
    pointdistance.eps\
    pointpoly.eps\
    polystolines.eps\
    project.eps\
    random.eps\
    randompoints.eps\
    regularpoints.eps\
    remove.eps\
    sampling.eps\
    selectlocation.eps\
    selectsubset.eps\
    simplify.eps\
    singletomulti.eps\
    spatialjoin.eps\
    sumlines.eps\
    symdiff.eps\
    union.eps\
    vectorgrid.eps\
    vectorsplit.eps\
    	
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
