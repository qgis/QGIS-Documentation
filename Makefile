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
SITEDIR         = /var/www/html/qgisdocs



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
		$(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXINTLOPTS) $(0); \
	else \
		$(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(0); \
	fi

site: html
	rsync -az $(BUILDDIR)/html/ $(SITEDIR)/$(LANG)/

doctest:
	$(SPHINXBUILD) -b doctest $(ALLSPHINXOPTS) $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."
