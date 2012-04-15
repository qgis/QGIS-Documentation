# Stephan Holl <stephan@holl-land.de>, 2010
# Makefile

.SUFFIXES: .dvi .tex .jpg .eps .ps .fig .pdf .html .tif

LATEX = latex
PDFLATEX = pdflatex
MAKE = make

APPENDIX = $(wildcard appendices/*.tex)
INCLUDES = conventions.tex \
	core_plugins.tex \
	external_plugins.tex \
	features_at_a_glance.tex \
	foreword.tex \
	getting_started.tex \
	grass_integration.tex \
	help_and_support.tex \
	index.tex \
	introduction.tex \
	literature.tex \
	other_core_plugins.tex \
	plugins.tex \
	plugins_coordinate_capture.tex \
	plugins_decorations.tex \
	plugins_delimited_text.tex \
	plugins_dxf2shape_converter.tex \
	plugins_evis.tex \
	plugins_ftools.tex \
	plugins_gdaltools.tex \
	plugins_georeferencer.tex \
	plugins_gps.tex \
	plugins_interpolation.tex \
	plugins_mapserver_export.tex \
	plugins_ogr_converter.tex \
	plugins_openstreetmap.tex \
	plugins_oracle_raster.tex \
	plugins_quick_print.tex \
	plugins_raster_algebra.tex \
	plugins_raster_terrain.tex \
	plugins_table_manager.tex \
	preamble.tex \
	print_composer.tex \
	qgis_style.tex \
	title.tex \
	toc.tex \
	working_with_ogc.tex \
	working_with_projections.tex \
	working_with_raster.tex \
	working_with_vector.tex 

TARGET = user_guide
IMAGES    = 

all: $(INCLUDES) $(APPENDIX) 
	$(MAKE) $(TARGET).pdf

%.eps:	%.jpg
	convert jpg:$*.jpg eps:$*.eps

%.eps:	%.fig
	fig2dev -L ps -p dummy_arg -z A4 $*.fig > $*.ps

%.dvi:	%.tex
	$(LATEX) $*.tex && $(LATEX) $*.tex

%.ps:	%.dvi
	dvips -R0 -o $*.ps $*.dvi 

%.pdf:	%.tex $(INCLUDES) $(APPENDIX)
	$(PDFLATEX) $*.tex $*.pdf && bibtex $(TARGET) && makeindex -cl -o $(TARGET).ind $(TARGET).idx && $(PDFLATEX) $*.tex $*.pdf && $(PDFLATEX) $*.tex $*.pdf

# To add bibliography you need manually run at the moment
# pdflatex user_guide.tex
# bibtex user_guide
# makeindex -cl -o user_guide.ind user_guide.idx
# pdflatex user_guide.tex
# pdflatex user_guide.tex

%.tif:	%.pdf
	gs -sDEVICE=tiffg3 -sPapersize=a4 -dNOPAUSE -q -sOutputFile=$*.tif $*.pdf -c quit

clean:
	rm -f *.log *.lox *.lof *.toa *.lot *.toc *.aux *.out *.bbl *.blg *.ps WARNINGS

cleanall: 
	rm -f *.log *.ilg *.idx *.ind *.lox *.lof *.toa *.lot *.toc *.aux *.out *.bbl *.blg *.ps *.dvi *.pdf WARNINGS
