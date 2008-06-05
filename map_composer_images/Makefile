# makefile to convert figures into eps format for the book

# Comments from Michel Wurtz:
# You will notice that the list given is the list of targets.  "all" just
# refer to this list.  The most important rule is the next rule, that give
# the generic rule for transforming a .fig into a .eps file.  Note the use
# of % (define the couple target:source) and the use of
# $< (source postfix, here .fig) and $@ (target postfix, here .eps)

# with .eps extension:
# JPG=qgis_icon_new_verylarge.eps\
	nextfile.eps

PNG=map_composer_blank09.eps\
	map_composer09.eps\
	composer_add_legend08.eps\
	composer_add_map08.eps\
	composer_add_image.eps\
	composer_add_label.eps\
	composer_add_scalebar08.eps\
	composer_export_image.eps\
	composer_export_svg.eps\
	composer_open_template.eps\
	composer_save_template.eps\
	mActionFilePrint.eps\
	
	
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
