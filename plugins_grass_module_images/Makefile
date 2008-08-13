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

PNG=nviz.1.eps\
grass_add_map.eps\
grass_add_raster.eps\
grass_add_vector.eps\
grass_add_vertex.eps\
grass_shell.eps\
grass_browser_raster_layer.eps\
grass_browser_vector_layer.eps\
grass_close_edit.eps\
grass_close_mapset.eps\
grass_copy_map.eps\
grass_delete_line.eps\
grass_delete_map.eps\
grass_delete_vertex.eps\
grass_edit.eps\
grass_edit_attributes.eps\
grass_module_error.eps\
grass_module_warning.eps\
grass_move_line.eps\
grass_move_vertex.eps\
grass_new_boundary.eps\
grass_new_centroid.eps\
grass_new_line.eps\
grass_new_mapset.eps\
grass_new_point.eps\
grass_new_vector_layer.eps\
grass_open_mapset.eps\
grass_refresh.eps\
grass_region.eps\
grass_region_edit.eps\
grass_rename_map.eps\
grass_set_region.eps\
grass_split_line.eps\
grass_tools.eps\
mapcalc_add_connection.eps\
mapcalc_add_constant.eps\
mapcalc_add_function.eps\
mapcalc_add_map.eps\
mapcalc_delete.eps\
mapcalc_open.eps\
mapcalc_save.eps\
mapcalc_save_as.eps\
mapcalc_select.eps\

	
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
