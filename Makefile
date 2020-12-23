# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
LANG            = en
# currently we are building for the following languages, if you want yours to be build: ask!
LANGUAGES       = en # bg cs de es fi fr id it ja ko nl pt_BR pt_PT ro ru tr zh_Hant zh_Hans
SPHINXOPTS      =
SPHINXINTLOPTS  = $(SPHINXOPTS) -D language=$(LANG)
SPHINXBUILD     ?= sphinx-build
SPHINXINTL      ?= sphinx-intl
SOURCEDIR       = .
BUILDDIR        = build
#SITEDIR         = qgis2:/var/www/qgisdata/QGIS-Documentation/live/html
#SITEDIR         = /var/www/qgisdata/QGIS-Documentation/live/html
# to be able to run the Makefile in a docker you have to mount (with -v) your site dir on /site
SITEDIR         = /site
VERSION         = testing


# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

springclean:
	rm -rf $(BUILDDIR)
	# all .mo files
	-find $(SOURCEDIR)/locale/*/LC_MESSAGES/ -type f -name '*.mo' -delete

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
	# for LANG=ja overwrites the default latex_engine=xelatex by latex_engine=platex
	$(eval SPHINXINTLOPTS += $(if $(filter $(LANG),ja),-D latex_engine=platex,))
	# A tag -t $LANG is used in the building process to allow for dynamic
	# settings in the conf.py. For example, for korean we need to use other
	# latex_elements and we use a if tags.has('ko') expression to overwrite the defaults
	$(SPHINXBUILD) -b latex -t $(LANG) "$(SOURCEDIR)" "$(BUILDDIR)/latex/$(LANG)" $(SPHINXINTLOPTS) $(0)


pdf: latex
	# Choose the correct latex compiler, equivalent to:
	# IF LANG=ja THEN LATEXCOMPILER = platex -kanji=euc ELSE LATEXCOMPILER = xelatex
	$(eval LATEXCOMPILER := $(if $(filter $(LANG),ja),platex,xelatex))

	# Compile the tex files into PDF, it runs 2x to fix hyperlinks
	# notice that platex compiler needs an extra step to convert dvi to PDF
	# using the dvipdfmx command
	# -interaction=batchmode in latex compiler and -q im dvipdfmx will hide errors
	# for debugging you need to remove them
	cd $(BUILDDIR)/latex/$(LANG); \
	$(LATEXCOMPILER) -interaction=batchmode -shell-escape QGISDesktopUserGuide.tex; \
	$(LATEXCOMPILER) -interaction=batchmode -shell-escape QGISDesktopUserGuide.tex; \
	if [ "$(LATEXCOMPILER)" != "xelatex" ] && [ -f "QGISDesktopUserGuide.dvi" ]; then \
		dvipdfmx -q QGISDesktopUserGuide.dvi; fi; \
	$(LATEXCOMPILER) -interaction=batchmode -shell-escape QGISServerUserGuide.tex; \
	$(LATEXCOMPILER) -interaction=batchmode -shell-escape QGISServerUserGuide.tex; \
	if [ "$(LATEXCOMPILER)" != "xelatex" ] && [ -f "QGISServerUserGuide.dvi" ]; then \
		dvipdfmx -q QGISServerUserGuide.dvi; fi; \
	$(LATEXCOMPILER) -interaction=batchmode -shell-escape PyQGISDeveloperCookbook.tex; \
	$(LATEXCOMPILER) -interaction=batchmode -shell-escape PyQGISDeveloperCookbook.tex; \
	if [ "$(LATEXCOMPILER)" != "xelatex" ] && [ -f "PyQGISDeveloperCookbook.dvi" ]; then \
		dvipdfmx -q PyQGISDeveloperCookbook.dvi; fi; \
	$(LATEXCOMPILER) -interaction=batchmode -shell-escape QGISTrainingManual.tex; \
	$(LATEXCOMPILER) -interaction=batchmode -shell-escape QGISTrainingManual.tex; \
	if [ "$(LATEXCOMPILER)" != "xelatex" ] && [ -f "QGISTrainingManual.dvi" ]; then \
		dvipdfmx -q QGISTrainingManual.dvi; fi; \
	$(LATEXCOMPILER) -interaction=batchmode -shell-escape QGISDocumentationGuidelines.tex; \
	$(LATEXCOMPILER) -interaction=batchmode -shell-escape QGISDocumentationGuidelines.tex; \
	if [ "$(LATEXCOMPILER)" != "xelatex" ]  && [ -f "QGISDocumentationGuidelines.dvi" ]; then \
		dvipdfmx -q QGISDocumentationGuidelines.dvi; fi;

	# copy and rename PDF files to the pdf folder
	# || true allows the job to continue even if one of the files is missing
	mkdir -p $(BUILDDIR)/pdf/$(LANG);
	mv $(BUILDDIR)/latex/$(LANG)/QGISDesktopUserGuide.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-DesktopUserGuide-$(LANG).pdf || true;
	mv $(BUILDDIR)/latex/$(LANG)/QGISServerUserGuide.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-ServerUserGuide-$(LANG).pdf || true;
	mv $(BUILDDIR)/latex/$(LANG)/PyQGISDeveloperCookbook.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-PyQGISDeveloperCookbook-$(LANG).pdf || true;
	mv $(BUILDDIR)/latex/$(LANG)/QGISTrainingManual.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-TrainingManual-$(LANG).pdf || true;
	mv $(BUILDDIR)/latex/$(LANG)/QGISDocumentationGuidelines.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-DocumentationGuidelines-$(LANG).pdf || true;

zip:
	mkdir -p $(BUILDDIR)/zip;
	(cd $(BUILDDIR)/html; \
	zip -r QGIS-$(VERSION)-Documentation-$(LANG).zip $(LANG)/;)
	mv $(BUILDDIR)/html/QGIS-$(VERSION)-Documentation-$(LANG).zip $(BUILDDIR)/zip/;

site: html zip
	rsync -hvrzc --delete --progress $(BUILDDIR)/html/$(LANG) $(SITEDIR)/;

full: html zip
	make LANG=$(LANG) pdf;
	
# this will build ALL languages, AND tries to rsync them to the web dir on qgis2
# to be able to run this you will need a key on the server
all: springclean
	@for LANG in $(LANGUAGES) ; do \
		make LANG=$$LANG site; \
	done
	rsync -hvrzc $(BUILDDIR)/zip $(SITEDIR)/;

	@for LANG in $(LANGUAGES) ; do \
		make LANG=$$LANG pdf; \
	done
	rsync -hvrzc $(BUILDDIR)/pdf $(SITEDIR)/;

# this will pull ALL translations (or at least from the languages we build for)
# to your local disk, so it can be committed into github
# in that way a build from git will contain those translation
# tx is the python transifex cli client (pip install transifex-client)
# because differences between chinese language codes in Sphinx and
# transifex, we need to replace the underscores by dashes,
# the english language is removed to avoid pulling the po source files.
# finally, the spaces are replaced by commas. In the end we have something like this
# tx pull -f --parallel --mode onlytranslated -l lang1,lang2,lang3,lang4
tx_force_pull_translations:
	$(eval space := )
	$(eval space += )
	$(eval comma += ,)
	tx pull -f --parallel --mode onlytranslated -l $(subst $(space),$(comma),$(subst en$(space),,$(subst zh_,zh-,$(LANGUAGES)))) ;

doctest:
	LD_PRELOAD=/lib/x86_64-linux-gnu/libSegFault.so $(SPHINXBUILD) -b doctest . $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."
