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
#	grasstoolbar.eps\
#	grassbrowser.eps\
#	grassshell.eps\
#	add_grass_raster.eps\
#	add_grass_vector.eps\
#	grass_edit.eps\
#	grass_region_edit.eps\
#	grass_tools.eps \
#	grass_copy_map.eps\
#	grass_delete_map.eps\
#	grass_refresh.eps\
#	grass_add_map.eps\
#	grass_rename_map.eps\
#	grass_region.eps\
#	grass_set_region.eps\
#	vbuffer.eps\
#	grass_delete_vertex.eps\
#	grass_new_line.eps\
#	grass_new_point.eps\
#	grass_split_line.eps\
#	grass_move_vertex.eps\
#	grass_delete_line.eps\
#	grass_close_edit.eps\
#	grass_move_line.eps\
#	grass_new_centroid.eps\
#	grass_add_vertex.eps\
#	grass_edit_attributes.eps\
#	grass_new_boundary.eps\
#	grass_close_mapset.eps\
#	grass_new_mapset.eps\
#	grass_new_vector_layer.eps\
#	grass_open_mapset.eps\
#	create_grass_location.eps\
#	grass_module_error.eps\
#	grass_module_warning.eps\
#	grass_browser_raster_layer.eps\
#	grass_browser_vector_layer.eps\
	
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
