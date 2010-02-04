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

PNG=print_composer_blank.eps\
    print_composer_complete.eps\
    print_composer_map1.eps\
    print_composer_map2.eps\
    print_composer_map3.eps\
    print_composer_map4.eps\
    print_composer_label1.eps\
    print_composer_label2.eps\
    print_composer_image1.eps\
    print_composer_image2.eps\
    print_composer_legend1.eps\
    print_composer_legend2.eps\
    print_composer_legend3.eps\
    print_composer_scalebar1.eps\
    print_composer_scalebar2.eps\
    print_composer_shape.eps\
    print_composer_arrow.eps\
    print_composer_manager.eps\

##### TARGETS #####

all: $(PNG) $(JPG)
	if [ ! -d ../finalpix/ ]; then mkdir ../finalpix; fi
	#do not use mv (move):
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
