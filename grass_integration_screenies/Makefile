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

PNG=create_grass_location.eps\
	grasslogo.eps\
	grass_digitizing_toolbar.eps\
	grass_digitizing_category.eps\
	grass_digitizing_settings.eps\
	grass_digitizing_symbology.eps\
	grass_digitizing_table.eps\
	grass_toolbox_moduletree.eps\
	grass_toolbox_modulelist.eps\
	grass_module_manual.eps\
	grass_module_option.eps\
	grass_module_output.eps\
	grass_mapset_browser.eps\
	grass_location.eps\
	grass_toolbox_rcontour2.eps\
	grass_toolbox_rcontour.eps\
	grass_toolbox_shadedrelief.eps\
	grass_toolbox_shell.eps\
	grass_toolbox_vgeneralize.eps\

	
##### TARGETS #####

all: $(PNG) $(JPG)
	if [ ! -d ../finalpix/ ]; then mkdir ../finalpix; fi
	#do not use mv:
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
	# Workaround for the PDF
	#convert -geometry 300x -depth 1 $< $@
	convert $< $@

clean:
	rm -f *.bak *~ *.pdf $(PNG) $(JPG)
