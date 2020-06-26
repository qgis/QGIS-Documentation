# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
LANG            = en
# currently we are building for the following languages, if you want yours to be build: ask!
LANGUAGES       = en # bg cs de es fi fr id it ja ko nl pt_BR pt_PT ro ru tr zh_Hant zh_Hans
# to pull tranlations from transifex we need other codes for the chinese languages
TX_LANGUAGES    = en bg cs de es fi fr id it ja ko nl pt_BR pt_PT ro ru tr zh-Hant zh-Hans
SPHINXOPTS      =
SPHINXINTLOPTS  = $(SPHINXOPTS) -D language=$(LANG)
SPHINXBUILD     ?= sphinx-build
SPHINXINTL      ?= sphinx-intl
SOURCEDIR       = .
BUILDDIR        = build
#SITEDIR         = /var/www/html/qgisdocs
SITEDIR         = qgis2:/var/www/qgisdata/QGIS-Documentation/live/html
VERSION         = testing


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

# this will build html-version of one language (defaults to english: en)
# to build for example dutch on Linux:
#  make LANG=nl html
# on windows:
#  set SPHINXOPTS=-D language=nl
#  make.bat html
# note that the translations/po files from git will be used
# so if you want most up to date files, download or use 'tx' to get those first

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
	mv $(BUILDDIR)/latex/$(LANG)/QGISUserGuide.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-UserGuide-$(LANG).pdf;
	mv $(BUILDDIR)/latex/$(LANG)/PyQGISDeveloperCookbook.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-PyQGISDeveloperCookbook-$(LANG).pdf;
	mv $(BUILDDIR)/latex/$(LANG)/QGISTrainingManual.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS$(VERSION)-TrainingManual-$(LANG).pdf;

zip:
	mkdir -p $(BUILDDIR)/zip;
	(cd $(BUILDDIR)/html; \
	zip -r QGIS-$(VERSION)-Documentation-$(LANG).zip $(LANG)/;)
	mv $(BUILDDIR)/html/QGIS-$(VERSION)-Documentation-$(LANG).zip $(BUILDDIR)/zip/;

site: html pdf zip
	rsync -az $(BUILDDIR)/html/$(LANG) $(SITEDIR)/;
	rsync -az $(BUILDDIR)/pdf $(SITEDIR)/;
	rsync -az $(BUILDDIR)/zip $(SITEDIR)/;

# this will build ALL languages, AND tries to rsync them to the web dir on qgis2
# to be able to run this you will need a key on the server
all:
	@for LANG in $(LANGUAGES) ; do \
		make LANG=$$LANG site; \
	done

# this will pull ALL translations (or at least from the languages we build for)
# to your local disk, so it can be committed into github
# in that way a build from git will contain those translation
# tx is the python transifex cli client (pip install transifex-client)
tx_force_pull_translations:
	@for LANG in $(TX_LANGUAGES) ; do \
		$$LANG
		if [ $$LANG != "en" ]; then \
			tx pull -f --parallel -l $$LANG ; \
		else \
			echo "Ignoring EN translations pull..."; \
		fi \
	done


doctest:
	$(SPHINXBUILD) -b doctest . $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."
