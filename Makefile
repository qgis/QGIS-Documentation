# Makefile for Sphinx documentation
#

# as long as this branch is testing, we only build for english:
LANG          = en
SPHINXBUILD   = sphinx-build
SPHINXINTL    = sphinx-intl
PAPER         =
SOURCEDIR     = source
RESOURCEDIR   = resources
BUILDDIR      = output
# using the -A flag, we create a python variable named 'language', which
# we then can use in html templates to create language dependent switches
SPHINXOPTS    = -D language=$(LANG) -A language=$(LANG) $(SOURCEDIR)
VERSION       = testing

# User-friendly check for sphinx-build
ifeq ($(shell which $(SPHINXBUILD) >/dev/null 2>&1; echo $$?), 1)
$(error The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed, then set the SPHINXBUILD environment variable to point to the full path of the '$(SPHINXBUILD)' executable. Alternatively you can add the directory with the executable to your PATH. If you don't have Sphinx installed, grab it from http://sphinx-doc.org/)
endif

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) i18n/pot

.PHONY: help clean html dirhtml singlehtml pickle json htmlhelp qthelp devhelp epub latex latexpdf text man changes linkcheck doctest gettext

help:
	@echo "  "
	@echo "Please use \`make <target> LANG=xx' where xx=language code and <target> is one of:"
	@echo "  html         to build the website as html for enlish only"
	@echo "  fullhtml     to pull QGIS-Documentation from github and build into the website"
	@echo "  world        to create the website for ALL available languages"
	@echo "  clean        to clean up all intermediate files"
	@echo "  springclean  to also remove build output besides normal clean"
	@echo "  createlang   to create (mostly directories) for a new language"
	@echo "  pretranslate to gather all strings from sources, put in .pot files"
	@echo "                  AND merge them with available .po files"
	@echo "  transifex_push (only for transifex Maintainers!): renew source files and push to transifex"
	@echo "  "
	@echo "OPTION: use LANG=xx to do it only for one language, eg: make html LANG=de"
	@echo "  "

clean:
	rm -rf $(SOURCEDIR)/static

springclean: clean
	# something in i18n/pot dir creates havoc when using gettext: remove it
	rm -rf i18n/pot
	rm -rf $(BUILDDIR)/*
	# all .mo files
	find i18n/*/LC_MESSAGES/ -type f -name '*.mo' -delete
	# rm -rf i18n/*/LC_MESSAGES/docs/*/
	# rm -f $(SOURCEDIR)/docs_conf.py*
	# rm -rf $(SOURCEDIR)/docs/*/

# remove all resources from source/static directory
# copy english resources from resources/en to source/static directory
# IF we have a localized build (LANG != en) then
# overwrite with potentially available LANG resources  by
# copy LANG resources from resources/LANG to source/static directory
# TODO: check if LANG != en, for now: unnessecary copy for english
localizeresources: clean
	@echo
	@echo "Removing all static content from $(SOURCEDIR)/static."
	rm -rf $(SOURCEDIR)/static
	@echo "Copy 'en' (base) static content to $(SOURCEDIR)/static."
	mkdir $(SOURCEDIR)/static
	# historically the images for the docs sub project are not in a separate docs folder
	# that is why we copy into root in separate steps
	@if [ -d "$(RESOURCEDIR)/en/docs" ]; then \
		cp -r $(RESOURCEDIR)/en/docs/* $(SOURCEDIR)/static; \
	fi
	@echo "Copy localized '$(LANG)' static content to $(SOURCEDIR)/static."
	@if [ -d "$(RESOURCEDIR)/$(LANG)/docs" ]; then \
		cp -r $(RESOURCEDIR)/$(LANG)/docs/* $(SOURCEDIR)/static; \
	fi

html: localizeresources
	$(SPHINXINTL) build -l $(LANG) -c $(SOURCEDIR)/conf.py
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html/$(LANG)
	@echo
	@echo "HTML Build finished. The HTML pages for '$(LANG)' are in $(BUILDDIR)."

# pdf will also make html
pdf: html
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex/$(LANG)
	# Compile the pdf docs for that locale
	# we use texi2pdf since latexpdf target is not available via
	# sphinx-build which we need to use since we need to pass language flag
	mkdir -p $(BUILDDIR)/pdf/$(LANG)
	# need to build 3x to have proper toc and index
	# currently texi2pdf has bad exit status. Please ignore errors!!
	# prepending the texi2pdf command with - keeps make going instead of quitting
	# japanese pdf has problems, when build with texi2pdf
	# as alternative we can use platex
	# for russian pdf you need package 'texlive-lang-cyrillic' installed
	# for japanese pdf you need: 'cmap-adobe-japan1 cmap-adobe-japan2 latex-cjk-all nkf okumura-clsfiles ptex-base ptex-bin texlive-fonts-extra'
	@-if [ $(LANG) = "ja" ]; then \
		cd $(BUILDDIR)/latex/$(LANG); \
		nkf -W -e --overwrite QGISUserGuide.tex; \
		platex -interaction=batchmode -kanji=euc -shell-escape QGISUserGuide.tex; \
		platex -interaction=batchmode -kanji=euc -shell-escape QGISUserGuide.tex; \
		platex -interaction=batchmode -kanji=euc -shell-escape QGISUserGuide.tex; \
		dvipdfmx QGISUserGuide.dvi; \
	else \
		cd $(BUILDDIR)/latex/$(LANG); \
		texi2pdf --quiet QGISUserGuide.tex; \
		texi2pdf --quiet QGISUserGuide.tex; \
		texi2pdf --quiet QGISUserGuide.tex; \
	fi
	mv $(BUILDDIR)/latex/$(LANG)/QGISUserGuide.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-UserGuide.pdf
	# pyqgis developer cookbook
	@-if [ $(LANG) = "ja" ]; then \
		cd $(BUILDDIR)/latex/$(LANG); \
		nkf -W -e --overwrite PyQGISDeveloperCookbook.tex; \
		platex -interaction=batchmode -kanji=euc -shell-escape PyQGISDeveloperCookbook.tex; \
		platex -interaction=batchmode -kanji=euc -shell-escape PyQGISDeveloperCookbook.tex; \
		platex -interaction=batchmode -kanji=euc -shell-escape PyQGISDeveloperCookbook.tex; \
		dvipdfmx PyQGISDeveloperCookbook.dvi; \
	else \
		cd $(BUILDDIR)/latex/$(LANG); \
		texi2pdf --quiet PyQGISDeveloperCookbook.tex; \
		texi2pdf --quiet PyQGISDeveloperCookbook.tex; \
		texi2pdf --quiet PyQGISDeveloperCookbook.tex; \
	fi
	mv $(BUILDDIR)/latex/$(LANG)/PyQGISDeveloperCookbook.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-PyQGISDeveloperCookbook.pdf
	# training manual
	@-if [ $(LANG) = "ja" ]; then \
		cd $(BUILDDIR)/latex/$(LANG); \
		nkf -W -e --overwrite QGISTrainingManual.tex; \
		platex -interaction=batchmode -kanji=euc -shell-escape QGISTrainingManual.tex; \
		platex -interaction=batchmode -kanji=euc -shell-escape QGISTrainingManual.tex; \
		platex -interaction=batchmode -kanji=euc -shell-escape QGISTrainingManual.tex; \
		dvipdfmx QGISTrainingManual.dvi; \
	else \
		cd $(BUILDDIR)/latex/$(LANG); \
		texi2pdf --quiet QGISTrainingManual.tex; \
		texi2pdf --quiet QGISTrainingManual.tex; \
		texi2pdf --quiet QGISTrainingManual.tex; \
	fi
	mv $(BUILDDIR)/latex/$(LANG)/QGISTrainingManual.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-QGISTrainingManual.pdf

full:  
#	@-if [ $(LANG) != "en" ]; then \
#		echo; \
#		echo Pulling $$LANG from transifex; \
#		# --minimum-perc=1 so only files which have at least 1% translation are pulled \
#		# -f to force, --skip to not stop with errors \
#		# -l lang \
#		echo tx pull --minimum-perc=1 --skip -f -l $$LANG; \
#        fi
	make pdf
	mv $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-UserGuide.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-UserGuide-$(LANG).pdf
	mv $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-PyQGISDeveloperCookbook.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-PyQGISDeveloperCookbook-$(LANG).pdf
	mv $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-QGISTrainingManual.pdf $(BUILDDIR)/pdf/$(LANG)/QGIS-$(VERSION)-QGISTrainingManual-$(LANG).pdf

world: all

all: full

createlang: springclean
	@echo Creating a new Language: $(LANG)
	mkdir -p resources/${LANG}/docs
	cp resources/en/README resources/${LANG}
	cp resources/en/README resources/${LANG}/docs
	mkdir -p i18n/${LANG}/LC_MESSAGES/docs
	cp i18n/en/README i18n/${LANG}
	cp i18n/en/README i18n/${LANG}/LC_MESSAGES/docs

pretranslate: gettext
	@echo "Generating the pot files for the QGIS-Documentation project"
	$(SPHINXINTL) update -p i18n/pot -c $(SOURCEDIR)/conf.py -l $(LANG)

gettext:
	# something in i18n/pot dir creates havoc when using gettext: remove it
	rm -rf i18n/pot
	$(SPHINXBUILD) -b gettext $(I18NSPHINXOPTS)
	@echo
	@echo "Build finished. The message catalogs are in $(BUILDDIR)/locale."



# ONLY to be done by a transifex Maintainer for the project, as it overwrites
# the english source resources
# 1) make springclean (removing all building cruft)
# 2) make pretranslate (getting all strings from sources and create new pot files)
# 3) tx push -fs --no-interactive (push the source (-f) files forcing (-f) overwriting the ones their without asking (--no-interactive)
#
# SHOULD NOT BE DONE ON TESTING/MASTER BRANCH! ONLY ON STABLE==TRANSLATING BRANCH
#transifex_push:
#	make springclean
#	make pretranslate
#	tx push -f -s --no-interactive
