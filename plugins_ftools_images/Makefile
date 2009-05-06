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
basic_statistics.eps\
buffer.eps\
centroids.eps\
check_geometry.eps\
clip.eps\
convex_hull.eps\
define_projection.eps\
delaunay.eps\
difference.eps\
dissolve.eps\
export_geometry.eps\
export_projection.eps\
extract_nodes.eps\
ftools_logo.eps\
geometry.eps\
geoprocessing.eps\
help.eps\
intersections.eps\
intersect.eps\
join_attributes.eps\
join_location.eps\
layer_extent.eps\
management.eps\
matrix.eps\
mean.eps\
multi_to_single.eps\
neighbour.eps\
random_points.eps\
random_selection.eps\
regular_points.eps\
sampling.eps\
select_location.eps\
simplify.eps\
single_to_multi.eps\
split_layer.eps\
sub_selection.eps\
sum_lines.eps\
sum_points.eps\
sym_difference.eps\
to_lines.eps\
union.eps\
unique.eps\
vector_grid.eps\
    	
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
