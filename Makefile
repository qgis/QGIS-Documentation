#convenient Makefile
#
#targets:
#  make            - builds the text and images
#  make text	   - builds the text only
#  make refcheck   - check \label{} and \ref{} and friends for consistency
#                    Result is in "latex_refs.log"
#  make clean      - removed Latex' auxiliary files and finalpix
#  make cleanpics  - remove created pics from subdirs
#  make pics	   - create pics
#  make ps         - create PS file
#  make pdf        - create PDF file
#  make html       - create HTML file
#  make updateicon - update png icons from QGIS source
#  make changelog  - creates ChangeLog

# Name of latex main file to compile
FILE=user_guide
# Path to QGIS source plugin folder for 'make updateicon'
QGISPLUGINSOURCE=/software/qgis_head/src/plugins

all: 
	make pics
	latex $(FILE)
	#bibtex $(FILE)
	bibtex $(FILE)1
	bibtex $(FILE)2
	#now loop over Latex files, until stable:
	echo Rerun > $(FILE).log
	while grep Rerun $(FILE).log >/dev/null 2>&1 ; do latex $(FILE).tex ; done
	makeindex $(FILE)

text:
	latex $(FILE)
	bibtex $(FILE)
	#now loop over Latex files, until stable:
	echo Rerun > $(FILE).log
	while grep Rerun $(FILE).log >/dev/null 2>&1 ; do latex $(FILE).tex ; done

#check references:
refcheck:
	@rm -f all
	make | grep "Reference\|Rerun" | sed 's/LaTeX\ Warning:\ Reference\ //' | tr '`' "'" > latex_refs.log
	@rm -f all
	make | grep Citation >> latex_refs.log ; true
	@rm -f all
	make | grep Label | grep multiply >> latex_refs.log ; true
	@echo "Check latex_refs.log:"
	@echo "-------------" ; cat latex_refs.log | sort -u | grep -v Rerun


# check FIXMEs in document
fixme:
	grep -C 2 -n "FIXME" *.tex

#make PostScript:
ps:
	make all
	dvips $(FILE).dvi -o $(FILE).ps

#make PDF:
pdf:
	make all
	dvipdf  $(FILE).dvi

# make pics
pics:
	(cd ./images && make)
	(cd ./plugins_add_wfs_layer_images && make)
	(cd ./plugins_coordinate_capture_images && make)
	(cd ./plugins_decorations_images && make)
	(cd ./plugins_diagram_overlay_images && make)
	(cd ./plugins_delimited_text_images && make)
	(cd ./plugins_dxf2shape_converter_images && make)
	(cd ./plugins_geoprocessing_images && make)
	(cd ./plugins_georeferencer_images && make)
	(cd ./plugins_gps_images && make)
	(cd ./plugins_grass_module_images && make)
	(cd ./plugins_interpolation_images && make)
	(cd ./plugins_raster_terrain_images && make)
	(cd ./plugins_mapserver_export_images && make)	
	(cd ./plugins_ogr_converter_images && make)	
	(cd ./plugins_quick_print_images && make)
	(cd ./plugins_spit_images && make)
	(cd ./plugins_screenies && make)
	(cd ./plugins_ftools_images && make)
	(cd ./plugins_table_manager_images && make)
	(cd ./plugins_evis_images && make)
	(cd ./plugins_raster_algebra_images && make)
	(cd ./plugins_python_images && make)
	(cd ./plugins_oracle_raster_images && make)
	(cd ./getting_started_screenies && make)
	(cd ./features_at_a_glance_screenies && make)
	(cd ./working_with_vector_screenies && make)
	(cd ./working_with_raster_screenies && make)
	(cd ./working_with_ogc_screenies && make)
	(cd ./working_with_projections_screenies && make)
	(cd ./grass_integration_screenies && make)
	(cd ./print_composer_screenies && make)
#	(cd ./help_and_support_screenies && make)
	(cd ./operating_system_icons && make)

# make html
# requires: latex2html oder tex4ht
# http://www.cse.ohio-state.edu/~gurari/TeX4ht/mn.html
html:
	make all
	if [ ! -d $(FILE) ]; then mkdir $(FILE); fi
	latex2html -init_file l2h.conf  -split=+2 -dir $(FILE) -address "\
	&copy; 2005, 2006, 2007 \
	<a href=http://qgis.osgeo.org>QGIS Project</a> \
	<br>Last modified: `/bin/date +%d-%m-%Y`" $(FILE)

clean:
	rm -f *.log *.aux $(FILE).dvi *.bbl *.tip *.lox *.blg *.ind \
	*.ilg *.toc *.tof *.lof *.lot *.pdf *.ps *.idx *.brf *.out *~
	rm -rf $(FILE)
	rm -rf ./finalpix
	(cd ./appendices && rm -f *.aux)
	make cleanpics

cleanpics:
	(cd ./images && make clean)
	(cd ./plugins_add_wfs_layer_images && make clean)
	(cd ./plugins_coordinate_capture_images && make clean)
	(cd ./plugins_decorations_images && make clean)	
	(cd ./plugins_delimited_text_images && make clean)
	(cd ./plugins_dxf2shape_converter_images && make clean)
	(cd ./plugins_geoprocessing_images && make clean)
	(cd ./plugins_georeferencer_images && make clean)
	(cd ./plugins_gps_images && make clean)
	(cd ./plugins_grass_module_images && make clean)
	(cd ./plugins_interpolation_images && make clean)
	(cd ./plugins_raster_terrain_images && make clean)
	(cd ./plugins_mapserver_export_images && make clean)
	(cd ./plugins_ogr_converter_images && make clean)
	(cd ./plugins_quick_print_images && make clean)
	(cd ./plugins_spit_images && make clean)
	(cd ./plugins_python_images && make clean)
	(cd ./plugins_ftools_images && make clean)
	(cd ./plugins_evis_images && make clean)
	(cd ./plugins_table_manager_images && make clean)
	(cd ./plugins_raster_algebra_images && make clean)
	(cd ./plugins_screenies && make clean)
	(cd ./getting_started_screenies && make clean)
	(cd ./features_at_a_glance_screenies && make clean)
	(cd ./working_with_vector_screenies && make clean)
	(cd ./working_with_raster_screenies && make clean)
	(cd ./working_with_ogc_screenies && make clean)
	(cd ./working_with_projections_screenies && make clean)
	(cd ./grass_integration_screenies && make clean)
	(cd ./print_composer_screenies && make clean)
	(cd ./help_and_support_screenies && make clean)
	(cd ./operating_system_icons && make clean)
	(cd ./plugins_diagram_overlay_images && make clean)
	(cd ./plugins_oracle_raster_images && make clean)
	for i in `find . -name *.eps` ; do rm -f $i ; done

# Update icons from qgis source if necessary
updateicon:
	(cd ./images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/../../images/themes/default/*.png .)
	(cd ./plugins_add_wfs_layer_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/wfs/*.png .)	
	(cd ./plugins_delimited_text_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/delimited_text/*.png .)
	(cd ./plugins_decorations_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/north_arrow/*.png . \
	&& cp $(QGISPLUGINSOURCE)/copyright_label/*.png . && cp $(QGISPLUGINSOURCE)/scale_bar/*.png .)
	(cd ./plugins_geoprocessing_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/*.png .)
	(cd ./plugins_georeferencer_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/georeferencer/*.png .)
	(cd ./plugins_gps_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/gps_importer/*.png .)
	(cd ./plugins_grass_module_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/grass/themes/default/*.png)
	(cd ./plugins_mapserver_export_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/*.png .)
	(cd ./plugins_quick_print_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/quick_print/*.png .)
	(cd ./plugins_spit_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/spit/*.png .)
	(cd ./plugins_python_images && rm -f *.png *.eps && cp $(QGISPLUGINSOURCE)/*.png .)

