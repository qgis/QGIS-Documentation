# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   ?= sphinx-build
SPHINXINTL    ?= sphinx-intl
SOURCEDIR     = source
BUILDDIR      = build


# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# taken from old Makefile, TODO see if this should work
#springclean: clean
springclean:
	# something in i18n/pot dir creates havoc when using gettext: remove it
	#rm -rf i18n/pot
	# all .mo files
	#find i18n/*/LC_MESSAGES/ -type f -name '*.mo' -delete
	# rm -rf i18n/*/LC_MESSAGES/docs/*/
	# rm -f $(SOURCEDIR)/docs_conf.py*
	# rm -rf $(SOURCEDIR)/docs/*/

gettext:
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
#%: Makefile
html:
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
