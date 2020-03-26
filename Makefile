# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
LANG            = en
LANGUAGES       = en bg cs de es fi fr id it ja ko nl pt_BR pt_PT ro ru tr zh_Hant
SPHINXOPTS      =
SPHINXINTLOPTS  = $(SPHINXOPTS) -D language=$(LANG)
SPHINXBUILD     ?= sphinx-build
SPHINXINTL      ?= sphinx-intl
SOURCEDIR       = .
BUILDDIR        = build
#SITEDIR         = /var/www/html/qgisdocs
SITEDIR         = qgis2:/var/www/qgisdata/QGIS-Documentation-3.10/live/html
CONFDIR         = .



# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help -c "$(CONFDIR)" "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

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
		$(SPHINXBUILD) -c "$(CONFDIR)" -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)" $(SPHINXINTLOPTS) $(0); \
	else \
		$(SPHINXBUILD) -c "$(CONFDIR)" -b html -nW --keep-going "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)" $(SPHINXOPTS) $(0); \
	fi

site: html
	rsync -az $(BUILDDIR)/html/$(LANG) $(SITEDIR)/

all:
	@for LANG in $(LANGUAGES) ; do \
		make LANG=$$LANG site; \
	done

doctest:
	$(SPHINXBUILD) -c "$(CONFDIR)" -b doctest . $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."
