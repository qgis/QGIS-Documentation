# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
LANG            = en
SPHINXOPTS      =
SPHINXINTLOPTS  = $(SPHINXOPTS) -D language=$(LANG)
SPHINXBUILD     ?= sphinx-build
SPHINXINTL      ?= sphinx-intl
SOURCEDIR       = .
BUILDDIR        = build
#SITEDIR         = /var/www/html/qgisdocs
SITEDIR         = qgis2:/var/www/qgisdata/QGIS-Documentation/live/html



# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

springclean:
	rm -r $(BUILDDIR)
	# all .mo files
	find $(SOURCEDIR)/locale/*/LC_MESSAGES/ -type f -name '*.mo' -delete

gettext:
	@$(SPHINXBUILD) -M gettext "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

html:
	echo "$(SPHINXOPTS) $(SPHINXINTLOPTS)"
	if [ $(LANG) != "en" ]; then \
		$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)" $(SPHINXINTLOPTS) $(0); \
	else \
		$(SPHINXBUILD) -b html -nW --keep-going "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)" $(SPHINXOPTS) $(0); \
	fi

latex:
	$(SPHINXBUILD) -b latex -t latex "$(SOURCEDIR)" "$(BUILDDIR)/latex/$(LANG)" $(SPHINXINTLOPTS) $(0); \

pdf: latex

	(cd $(BUILDDIR)/latex/$(LANG); \
	pdflatex QGISUserGuide.tex; \
	pdflatex QGISUserGuide.tex; \
	pdflatex PyQGISDeveloperCookbook.tex; \
	pdflatex PyQGISDeveloperCookbook.tex; \
	pdflatex QGISTrainingManual.tex; \
	pdflatex QGISTrainingManual.tex;)
	mkdir -p $(BUILDDIR)/pdf/$(LANG);
	mv $(BUILDDIR)/latex/$(LANG)/QGISUserGuide.pdf $(BUILDDIR)/pdf/$(LANG)/;
	mv $(BUILDDIR)/latex/$(LANG)/PyQGISDeveloperCookbook.pdf $(BUILDDIR)/pdf/$(LANG)/;
	mv $(BUILDDIR)/latex/$(LANG)/QGISTrainingManual.pdf $(BUILDDIR)/pdf/$(LANG)/;

site: html #pdf
	rsync -az $(BUILDDIR)/html/$(LANG) $(SITEDIR)/
	#rsync -az $(BUILDDIR)/pdf $(SITEDIR)/

doctest:
	$(SPHINXBUILD) -b doctest . $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."
