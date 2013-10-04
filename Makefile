# Makefile for Sphinx documentation
#

# You can set these variables from the command line
LANGUAGES     = en `ls i18n`
LANG          = en
SPHINXBUILD   = sphinx-build
SPHINXINTL    = sphinx-intl
PAPER         =
SOURCEDIR     = source
RESOURCEDIR   = resources
BUILDDIR      = output/html/$(LANG)
SPHINXOPTS    = -D language='$(LANG)' $(SOURCEDIR)

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
#	@echo "  gettext    to make PO message catalogs"
#	@echo "  dirhtml    to make HTML files named index.html in directories"
#	@echo "  singlehtml to make a single large HTML file"
#	@echo "  pickle     to make pickle files"
#	@echo "  json       to make JSON files"
#	@echo "  htmlhelp   to make HTML files and a HTML help project"
#	@echo "  qthelp     to make HTML files and a qthelp project"
#	@echo "  devhelp    to make HTML files and a Devhelp project"
#	@echo "  epub       to make an epub"
#	@echo "  latex      to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
#	@echo "  latexpdf   to make LaTeX files and run them through pdflatex"
#	@echo "  latexpdfja to make LaTeX files and run them through platex/dvipdfmx"
#	@echo "  text       to make text files"
#	@echo "  man        to make manual pages"
#	@echo "  texinfo    to make Texinfo files"
#	@echo "  info       to make Texinfo files and run them through makeinfo"
#	@echo "  changes    to make an overview of all changed/added/deprecated items"
#	@echo "  xml        to make Docutils-native XML files"
#	@echo "  pseudoxml  to make pseudoxml-XML files for display purposes"
#	@echo "  linkcheck  to check all external links for integrity"
#	@echo "  doctest    to run all doctests embedded in the documentation (if enabled)"

clean:
	rm -rf $(SOURCEDIR)/static

springclean: clean
	# something in i18n/pot dir creates havoc when using gettext: remove it
	rm -rf i18n/pot
	rm -rf $(BUILDDIR)/*
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
	# that is why we copy site (to site) and docs/* into root in separate steps
	# cp -r $(RESOURCEDIR)/en/site $(SOURCEDIR)/static
	@if [ -d "$(RESOURCEDIR)/en/docs" ]; then \
		cp -r $(RESOURCEDIR)/en/docs/* $(SOURCEDIR)/static; \
	fi
	@echo "Copy localized '$(LANG)' static content to $(SOURCEDIR)/static."
	#@if [ -d "$(RESOURCEDIR)/$(LANG)/site" ]; then \
	#	cp -r $(RESOURCEDIR)/$(LANG)/site $(SOURCEDIR)/static; \
	#fi
	@if [ -d "$(RESOURCEDIR)/$(LANG)/docs" ]; then \
		cp -r $(RESOURCEDIR)/$(LANG)/docs/* $(SOURCEDIR)/static; \
	fi

pulldocsources:
	scripts/pulldocsources.sh $(LANGUAGES)

html: localizeresources
	$(SPHINXINTL) build -l $(LANG) -c $(SOURCEDIR)/conf.py
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)
	@echo
	@echo "Build finished. The HTML pages for '$(LANG)' are in $(BUILDDIR)."

fullhtml: pulldocsources html

world: all

all: pulldocsources
	@echo
	@echo Building html for the following languages: $(LANGUAGES)
	@echo
	# after build quickly rename old live dir, mv output to live dir and then remove old dir
	@for LANG in $(LANGUAGES) ; do \
		make LANG=$$LANG fullhtml; \
		mkdir -p live/html; \
		mv live/html/$$LANG live/html/$$LANG.old; \
		mv output/html/$$LANG live/html/; \
		rm -rf live/html/$$LANG.old; \
	done

createlang: springclean
	@echo Creating a new Language: $(LANG)
	mkdir -p i18n/${LANG}
	mkdir -p resources/${LANG}
	cp resources/en/README resources/${LANG}
	cp i18n/en/README i18n/${LANG}

pretranslate: gettext
	@echo "Generating the pot files for the QGIS-Documentation project"
	$(SPHINXINTL) update -p i18n/pot -c $(SOURCEDIR)/conf.py -l $(LANG)

gettext:
	# something in i18n/pot dir creates havoc when using gettext: remove it
	rm -rf i18n/pot
	# be sure to remove possible available docs sources:
	rm -rf $(SOURCEDIR)/docs/*/
	$(SPHINXBUILD) -b gettext $(I18NSPHINXOPTS)
	@echo
	@echo "Build finished. The message catalogs are in $(BUILDDIR)/locale."



# ONLY to be done by a transifex Maintainer for the project, as it overwrites
# the english source resources
# 1) make springclean (removing all building cruft)
# 2) make pretranslate (getting all strings from sources and create new pot files)
# 3) tx push -fs --no-interactive (push the source (-f) files forcing (-f) overwriting the ones their without asking (--no-interactive)
transifex_push:
	make springclean
	make pretranslate
	tx push -f -s --no-interactive

################################################################################
#
# rules below either not tested or not working yet
# plz check and/or fix
#
################################################################################

dirhtml:
	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) $(BUILDDIR)/dirhtml
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/dirhtml."

singlehtml:
	$(SPHINXBUILD) -b singlehtml $(ALLSPHINXOPTS) $(BUILDDIR)/singlehtml
	@echo
	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml."

pickle:
	$(SPHINXBUILD) -b pickle $(ALLSPHINXOPTS) $(BUILDDIR)/pickle
	@echo
	@echo "Build finished; now you can process the pickle files."

json:
	$(SPHINXBUILD) -b json $(ALLSPHINXOPTS) $(BUILDDIR)/json
	@echo
	@echo "Build finished; now you can process the JSON files."

htmlhelp:
	$(SPHINXBUILD) -b htmlhelp $(ALLSPHINXOPTS) $(BUILDDIR)/htmlhelp
	@echo
	@echo "Build finished; now you can run HTML Help Workshop with the" \
	      ".hhp project file in $(BUILDDIR)/htmlhelp."

qthelp:
	$(SPHINXBUILD) -b qthelp $(ALLSPHINXOPTS) $(BUILDDIR)/qthelp
	@echo
	@echo "Build finished; now you can run "qcollectiongenerator" with the" \
	      ".qhcp project file in $(BUILDDIR)/qthelp, like this:"
	@echo "# qcollectiongenerator $(BUILDDIR)/qthelp/QGISWebsite.qhcp"
	@echo "To view the help file:"
	@echo "# assistant -collectionFile $(BUILDDIR)/qthelp/QGISWebsite.qhc"

devhelp:
	$(SPHINXBUILD) -b devhelp $(ALLSPHINXOPTS) $(BUILDDIR)/devhelp
	@echo
	@echo "Build finished."
	@echo "To view the help file:"
	@echo "# mkdir -p $$HOME/.local/share/devhelp/QGISWebsite"
	@echo "# ln -s $(BUILDDIR)/devhelp $$HOME/.local/share/devhelp/QGISWebsite"
	@echo "# devhelp"

epub:
	$(SPHINXBUILD) -b epub $(ALLSPHINXOPTS) $(BUILDDIR)/epub
	@echo
	@echo "Build finished. The epub file is in $(BUILDDIR)/epub."

latex:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo
	@echo "Build finished; the LaTeX files are in $(BUILDDIR)/latex."
	@echo "Run \`make' in that directory to run these through (pdf)latex" \
	      "(use \`make latexpdf' here to do that automatically)."

latexpdf:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo "Running LaTeX files through pdflatex..."
	$(MAKE) -C $(BUILDDIR)/latex all-pdf
	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."

latexpdfja:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo "Running LaTeX files through platex and dvipdfmx..."
	$(MAKE) -C $(BUILDDIR)/latex all-pdf-ja
	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."

text:
	$(SPHINXBUILD) -b text $(ALLSPHINXOPTS) $(BUILDDIR)/text
	@echo
	@echo "Build finished. The text files are in $(BUILDDIR)/text."

man:
	$(SPHINXBUILD) -b man $(ALLSPHINXOPTS) $(BUILDDIR)/man
	@echo
	@echo "Build finished. The manual pages are in $(BUILDDIR)/man."

texinfo:
	$(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) $(BUILDDIR)/texinfo
	@echo
	@echo "Build finished. The Texinfo files are in $(BUILDDIR)/texinfo."
	@echo "Run \`make' in that directory to run these through makeinfo" \
	      "(use \`make info' here to do that automatically)."

info:
	$(SPHINXBUILD) -b texinfo $(ALLSPHINXOPTS) $(BUILDDIR)/texinfo
	@echo "Running Texinfo files through makeinfo..."
	make -C $(BUILDDIR)/texinfo info
	@echo "makeinfo finished; the Info files are in $(BUILDDIR)/texinfo."

changes:
	$(SPHINXBUILD) -b changes $(ALLSPHINXOPTS) $(BUILDDIR)/changes
	@echo
	@echo "The overview file is in $(BUILDDIR)/changes."

linkcheck:
	$(SPHINXBUILD) -b linkcheck $(ALLSPHINXOPTS) $(BUILDDIR)/linkcheck
	@echo
	@echo "Link check complete; look for any errors in the above output " \
	      "or in $(BUILDDIR)/linkcheck/output.txt."

doctest:
	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."

xml:
	$(SPHINXBUILD) -b xml $(ALLSPHINXOPTS) $(BUILDDIR)/xml
	@echo
	@echo "Build finished. The XML files are in $(BUILDDIR)/xml."

pseudoxml:
	$(SPHINXBUILD) -b pseudoxml $(ALLSPHINXOPTS) $(BUILDDIR)/pseudoxml
	@echo
	@echo "Build finished. The pseudo-XML files are in $(BUILDDIR)/pseudoxml."
