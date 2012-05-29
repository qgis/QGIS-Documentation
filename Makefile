# Makefile for Sphinx QGIS documentation
# $(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $$lang $(BUILDDIR)/$$lang;

# You can set these variables from the command line.
BUILDDIR     = _build
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
PAPER         = A4
TRANSLATIONS  = de fr it ru es pt ja
LANGUAGES     = en $(TRANSLATIONS)
SOURCE        = source

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
#ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) $(SOURCE)
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) -Dlanguage=$$lang $(SOURCE)

.PHONY: help clean html readme dirhtml pickle json htmlhelp qthelp latex latexpdf changes linkcheck doctest

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  compile_messages    to compile .po messages in .mo binaries."
	@echo "  html      to make standalone HTML files"
	@echo "  dirhtml   to make HTML files named index.html in directories"
	@echo "  pickle    to make pickle files"
	@echo "  json      to make JSON files"
	@echo "  htmlhelp  to make HTML files and a HTML help project"
	@echo "  qthelp    to make HTML files and a qthelp project"
	@echo "  latex     to make LaTeX files, you can set PAPER=a4 or PAPER=letter"
	@echo "  latexpdf   to make LaTeX files and run them through pdflatex"
	@echo "  changes   to make an overview of all changed/added/deprecated items"
	@echo "  linkcheck to check all external links for integrity"
	@echo "  doctest   to run all doctests embedded in the documentation (if enabled)"

clean:
	-rm -rf $(BUILDDIR)/*

compile_messages:
	@for lang in $(TRANSLATIONS) ;\
	do \
		echo "Compiling messages for $$lang..."; \
		for f in `find $(SOURCE)/translated/$$lang -name \*.po -printf "%f\n"`; \
		do \
			echo "Compiling messages for $$f"; \
			msgfmt $(SOURCE)/translated/$$lang/$$f -o $(SOURCE)/translated/$$lang/LC_MESSAGES/$${f%.*}.mo; \
		done; \
	done
	@echo "Messages compiled. Now you can build updated version for html and pdf.";\

html:
	@for lang in $(LANGUAGES);\
	do \
		echo "$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(SOURCE) $(BUILDDIR)/html/$$lang";\
		$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html/$$lang;\
	done
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html/<language>.";\

pdf:
	@for lang in $(LANGUAGES);\
	do \
		mkdir -p $(BUILDDIR)/pdf/$(SOURCE)/$$lang $(BUILDDIR)/doctrees/$(SOURCE)/$$lang; \
		echo "$(SPHINXBUILD) -b pdf -a $(ALLSPHINXOPTS) $(SOURCE) $(BUILDDIR)/pdf/$(SOURCE)/$$lang";\
		$(SPHINXBUILD) -b pdf -a $(ALLSPHINXOPTS) $(SOURCE) $(BUILDDIR)/pdf/$(SOURCE)/$$lang;\
	done
	@echo
	@echo "Build finished. The PDf pages are in $(BUILDDIR)/pdf."

dirhtml:
	$(SPHINXBUILD) -b dirhtml $(ALLSPHINXOPTS) $(BUILDDIR)/dirhtml
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/dirhtml."

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
	@echo "# qcollectiongenerator $(BUILDDIR)/qthelp/QGISWorkshop.qhcp"
	@echo "To view the help file:"
	@echo "# assistant -collectionFile $(BUILDDIR)/qthelp/QGISWorkshop.qhc"

latex:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
	@echo
	@echo "Build finished; the LaTeX files are in $(BUILDDIR)/latex."
	@echo "Run \`make all-pdf' or \`make all-ps' in that directory to" \
	      "run these through (pdf)latex."

latexpdf:
	@for lang in $(LANGUAGES);\
	do \
		mkdir -p $(BUILDDIR)/latex/$(SOURCE)/$$lang $(BUILDDIR)/doctrees/$(SOURCE)/$$lang;\
		echo "$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(SOURCE) $(BUILDDIR)/latex/$(SOURCE)/$$lang";\
		$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(SOURCE) $(BUILDDIR)/latex/$(SOURCE)/$$lang;\
		echo "Running LaTeX files through pdflatex...";\
		$(MAKE) -C $(BUILDDIR)/latex/$(SOURCE)/$$lang all-pdf;\
	done
	@echo
	@echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex/<language>.";\

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
