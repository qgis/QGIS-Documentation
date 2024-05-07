# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
LANG            = en
# currently we are building for the following languages, if you want yours to be build: ask!
LANGUAGES       = en # bg cs de es fi fr id it ja ko nl pt_BR pt_PT ro ru tr zh_Hant zh_Hans
SPHINXOPTS      =
# Use the tag i18n to filter text based on whether we are translating or not
SPHINXINTLOPTS  = $(SPHINXOPTS) -D language=$(LANG) -t i18n
SPHINXBUILD     ?= sphinx-build
SPHINXINTL      ?= sphinx-intl
SOURCEDIR       = .
BUILDDIR        = build
#SITEDIR         = qgis2:/var/www/qgisdata/QGIS-Documentation/live/html
#SITEDIR         = /var/www/qgisdata/QGIS-Documentation/live/html
# to be able to run the Makefile in a docker you have to mount (with -v) your site dir on /site
SITEDIR         = /site
VERSION         = testing

# needed for Sphinx > 4.5?
export LC_ALL=C.UTF-8

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
	# for LANG=ja overwrites the default latex_engine=xelatex by latex_engine=uplatex
	$(eval SPHINXINTLOPTS += $(if $(filter $(LANG),ja),-D latex_engine=uplatex,))
	# A tag -t $LANG is used in the building process to allow for dynamic
	# settings in the conf.py. For example, for korean we need to use other
	# latex_elements and we use a if tags.has('ko') expression to overwrite the defaults
	$(SPHINXBUILD) -b latex -t $(LANG) "$(SOURCEDIR)" "$(BUILDDIR)/latex/$(LANG)" $(SPHINXINTLOPTS) $(0)


pdf: latex
	# Choose the correct latex compiler, equivalent to:
	# IF LANG=ja THEN LATEXCOMPILER = uplatex -kanji=euc ELSE LATEXCOMPILER = xelatex
	$(eval LATEXCOMPILER := $(if $(filter $(LANG),ja),uplatex,xelatex))

	# Compile the tex files into PDF, it runs 2x to fix hyperlinks
	# notice that uplatex compiler needs an extra step to convert dvi to PDF
	# using the dvipdfmx command
	# -interaction=batchmode in latex compiler and -q im dvipdfmx will hide errors
	# for debugging you need to remove them
	# Then we copy and rename PDF files to the pdf folder
	# || true allows the job to continue even if one of the files is missing

	for TEXFILE in $$(find $(BUILDDIR)/latex/$(LANG) -iname '*.tex' -exec basename {} .tex ';'); \
		do \
			cd $(BUILDDIR)/latex/$(LANG); \
			echo $$TEXFILE; \
			$(LATEXCOMPILER) -interaction=batchmode -shell-escape $$TEXFILE.tex; \
			$(LATEXCOMPILER) -interaction=batchmode -shell-escape $$TEXFILE.tex; \
			if [ "$(LATEXCOMPILER)" != "xelatex" ]  && [ -f "$$TEXFILE.dvi" ]; then \
				dvipdfmx -q $$TEXFILE.dvi; fi; \
			mkdir -p ../../pdf/$(LANG); \
			mv $$TEXFILE.pdf ../../pdf/$(LANG)/QGIS-$(VERSION)-$$TEXFILE-$(LANG).pdf || true; \
		done

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
# tx is the python transifex cli client.
# Because differences between chinese language codes in Sphinx and
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

linkcheck:
	$(SPHINXBUILD) -b linkcheck $(SOURCEDIR) $(BUILDDIR)/linkcheck
	@echo "Check finished. Report is in $(BUILDDIR)/linkcheck/output.txt."

