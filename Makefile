# Minimal makefile for Sphinx documentation
#

# Use bash for shell commands (needed for echo -e color support)
SHELL := $(shell which bash)

# You can set these variables from the command line.
LANG            = en
# currently we are building for the following languages, if you want yours to be build: ask!
LANGUAGES       = en # cs de es fr hu it ja ko lt nl pl pt_BR pt_PT ro ru sv zh_Hans
SPHINXOPTS      = -j auto
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

# ============================================================================
# Colors and Formatting
# ============================================================================
BLUE    := \033[1;34m
GREEN   := \033[1;32m
YELLOW  := \033[1;33m
CYAN    := \033[1;36m
MAGENTA := \033[1;35m
WHITE   := \033[1;37m
DIM     := \033[0;90m
NC      := \033[0m

# Timer helper - prints a beautiful completion message
# Usage: $(call print_time,$(START_TIME),Target Name)
define print_time
	@END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - $(1))); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)$(2)$(NC) completed successfully"; \
	if [ $$MINS -gt 0 ]; then \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%dm %ds$(NC)\n" $$MINS $$SECS; \
	else \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	fi; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""
endef

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

springclean:
	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Spring cleaning build artifacts$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	rm -rf $(BUILDDIR); \
	find $(SOURCEDIR)/locale/*/LC_MESSAGES/ -type f -name '*.mo' -delete 2>/dev/null || true; \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	SECS=$$ELAPSED; \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)Spring clean$(NC) completed"; \
	printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Removed: $(BUILDDIR)/ and .mo files$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""

gettext:
	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Generating POT translation files$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	$(SPHINXBUILD) -M gettext "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O); \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)POT file generation$(NC) completed"; \
	if [ $$MINS -gt 0 ]; then \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%dm %ds$(NC)\n" $$MINS $$SECS; \
	else \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	fi; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Output: $(BUILDDIR)/gettext/$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""

# this will build html-version of one language (defaults to english: en)
# to build for example dutch on Linux:
#  make LANG=nl html
# on windows:
#  set SPHINXOPTS=-D language=nl
#  make.bat html
# note that the translations/po files from git will be used
# so if you want most up to date files, download or use 'tx' to get those first

html:
	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Building HTML documentation ($(LANG)) - strict mode$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	if [ $(LANG) != "en" ]; then \
		$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)" $(SPHINXINTLOPTS) $(0); \
	else \
		$(SPHINXBUILD) -b html -nW --keep-going "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)" $(SPHINXOPTS) $(0); \
	fi; \
	EXIT_CODE=$$?; \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	if [ $$EXIT_CODE -eq 0 ]; then \
		echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)HTML build ($(LANG))$(NC) completed successfully"; \
	else \
		echo -e "$(BLUE)║$(NC)  $(YELLOW)⚠$(NC) $(WHITE)HTML build ($(LANG))$(NC) finished with warnings"; \
	fi; \
	if [ $$MINS -gt 0 ]; then \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%dm %ds$(NC)\n" $$MINS $$SECS; \
	else \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	fi; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Output: $(BUILDDIR)/html/$(LANG)/index.html$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""

latex:
	# for LANG=ja overwrites the default latex_engine=xelatex by latex_engine=uplatex
	$(eval SPHINXINTLOPTS += $(if $(filter $(LANG),ja),-D latex_engine=uplatex,))
	# A tag -t $LANG is used in the building process to allow for dynamic
	# settings in the conf.py. For example, for korean we need to use other
	# latex_elements and we use a if tags.has('ko') expression to overwrite the defaults
	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Building LaTeX documentation ($(LANG))$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	$(SPHINXBUILD) -b latex -t $(LANG) "$(SOURCEDIR)" "$(BUILDDIR)/latex/$(LANG)" $(SPHINXINTLOPTS) $(0); \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)LaTeX build ($(LANG))$(NC) completed"; \
	if [ $$MINS -gt 0 ]; then \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%dm %ds$(NC)\n" $$MINS $$SECS; \
	else \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	fi; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Output: $(BUILDDIR)/latex/$(LANG)/$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""


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

	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Compiling PDF documentation ($(LANG))$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	for TEXFILE in $$(find $(BUILDDIR)/latex/$(LANG) -iname '*.tex' -exec basename {} .tex ';'); \
		do \
			cd $(BUILDDIR)/latex/$(LANG); \
			echo "  Compiling: $$TEXFILE"; \
			$(LATEXCOMPILER) -interaction=batchmode -shell-escape $$TEXFILE.tex; \
			$(LATEXCOMPILER) -interaction=batchmode -shell-escape $$TEXFILE.tex; \
			if [ "$(LATEXCOMPILER)" != "xelatex" ]  && [ -f "$$TEXFILE.dvi" ]; then \
				dvipdfmx -q $$TEXFILE.dvi; fi; \
			mkdir -p ../../pdf/$(LANG); \
			mv $$TEXFILE.pdf ../../pdf/$(LANG)/QGIS-$(VERSION)-$$TEXFILE-$(LANG).pdf || true; \
		done; \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)PDF build ($(LANG))$(NC) completed"; \
	if [ $$MINS -gt 0 ]; then \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%dm %ds$(NC)\n" $$MINS $$SECS; \
	else \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	fi; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Output: $(BUILDDIR)/pdf/$(LANG)/$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""

zip:
	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Creating ZIP archive ($(LANG))$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	mkdir -p $(BUILDDIR)/zip; \
	(cd $(BUILDDIR)/html; \
	zip -r QGIS-$(VERSION)-Documentation-$(LANG).zip $(LANG)/;); \
	mv $(BUILDDIR)/html/QGIS-$(VERSION)-Documentation-$(LANG).zip $(BUILDDIR)/zip/; \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	SECS=$$ELAPSED; \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)ZIP archive ($(LANG))$(NC) created"; \
	printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Output: $(BUILDDIR)/zip/QGIS-$(VERSION)-Documentation-$(LANG).zip$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""

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
	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Pulling translations from Transifex$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	tx pull -f --parallel --mode onlytranslated -l $(subst $(space),$(comma),$(subst en$(space),,$(subst zh_,zh-,$(LANGUAGES)))); \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)Translation pull$(NC) completed"; \
	if [ $$MINS -gt 0 ]; then \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%dm %ds$(NC)\n" $$MINS $$SECS; \
	else \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	fi; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Translations saved to: locale/$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""

# Alias for easier access
pull-translations: tx_force_pull_translations

doctest-gh:
	# --system-site-packages needed to keep QGIS libs in python path
	export PYTHONPATH=$(PYTHONPATH):/usr/lib/python3/dist-packages && \
	. /docsenv/bin/activate --system-site-packages && LD_PRELOAD=/lib/x86_64-linux-gnu/libSegFault.so $(SPHINXBUILD) -b doctest . $(BUILDDIR)/doctest
	@echo "Testing of doctests in the sources finished, look at the " \
	      "results in $(BUILDDIR)/doctest/output.txt."

doctest:
	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Running doctests$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	LD_PRELOAD=/lib/x86_64-linux-gnu/libSegFault.so $(SPHINXBUILD) -b doctest . $(BUILDDIR)/doctest; \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)Doctests$(NC) completed"; \
	if [ $$MINS -gt 0 ]; then \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%dm %ds$(NC)\n" $$MINS $$SECS; \
	else \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	fi; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Results: $(BUILDDIR)/doctest/output.txt$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""

linkcheck:
	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Checking links in documentation$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	$(SPHINXBUILD) -b linkcheck $(SOURCEDIR) $(BUILDDIR)/linkcheck; \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)Link check$(NC) completed"; \
	if [ $$MINS -gt 0 ]; then \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%dm %ds$(NC)\n" $$MINS $$SECS; \
	else \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	fi; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Report: $(BUILDDIR)/linkcheck/output.txt$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""

# Fast development build - skips warnings-as-errors and uses all cores
fasthtml:
	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Building HTML documentation ($(LANG)) - fast mode$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	$(SPHINXBUILD) -b html -j auto "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)" $(SPHINXOPTS) $(0); \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)Fast HTML build ($(LANG))$(NC) completed successfully"; \
	if [ $$MINS -gt 0 ]; then \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%dm %ds$(NC)\n" $$MINS $$SECS; \
	else \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	fi; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Output: $(BUILDDIR)/html/$(LANG)/index.html$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""

# Build only changed files (incremental) - useful during writing
draft:
	@START_TIME=$$(date +%s); \
	echo ""; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo -e "$(CYAN)  Building HTML documentation ($(LANG)) - draft/quiet mode$(NC)"; \
	echo -e "$(BLUE)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(NC)"; \
	echo ""; \
	$(SPHINXBUILD) -b html -j auto -Q "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)" $(SPHINXOPTS) $(0); \
	END_TIME=$$(date +%s); \
	ELAPSED=$$((END_TIME - START_TIME)); \
	MINS=$$((ELAPSED / 60)); \
	SECS=$$((ELAPSED % 60)); \
	echo ""; \
	echo -e "$(BLUE)╔══════════════════════════════════════════════════════════════════╗$(NC)"; \
	echo -e "$(BLUE)║$(NC)  $(GREEN)✓$(NC) $(WHITE)Draft build ($(LANG))$(NC) completed"; \
	if [ $$MINS -gt 0 ]; then \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%dm %ds$(NC)\n" $$MINS $$SECS; \
	else \
		printf "$(BLUE)║$(NC)  $(CYAN)⏱$(NC)  Duration: $(YELLOW)%ds$(NC)\n" $$SECS; \
	fi; \
	echo -e "$(BLUE)║$(NC)  $(DIM)Output: $(BUILDDIR)/html/$(LANG)/index.html$(NC)"; \
	echo -e "$(BLUE)╚══════════════════════════════════════════════════════════════════╝$(NC)"; \
	echo ""

# Live reload server for development
serve:
	sphinx-autobuild -j auto --port 8000 --open-browser "$(SOURCEDIR)" "$(BUILDDIR)/html/$(LANG)"

# ============================================================================
# Translation Workflow Targets
# ============================================================================

# Pull translations and build all HTML in parallel
i18n-html:
	./scripts/build_all_languages.sh --pull --html

# Pull translations and build all PDFs in parallel
i18n-pdf:
	./scripts/build_all_languages.sh --pull --pdf

# Pull translations and build everything (HTML + PDF) in parallel
i18n-full:
	./scripts/build_all_languages.sh --pull --full

# Build all HTML without pulling (use existing translations)
html-all:
	./scripts/build_all_languages.sh --html

# Build all PDFs without pulling
pdf-all:
	./scripts/build_all_languages.sh --pdf

# Full parallel build without pulling
full-all:
	./scripts/build_all_languages.sh --full

# Clean and rebuild everything with fresh translations
i18n-clean-rebuild:
	./scripts/build_all_languages.sh --pull --full --clean

# Quick parallel HTML build (subset of languages for testing)
i18n-quick:
	./scripts/build_all_languages.sh --html --languages "en,de,fr"

# ============================================================================
# Benchmarking
# ============================================================================

# Quick benchmark (single run, no clean)
benchmark-quick:
	./scripts/benchmark_build.sh --quick

# Standard benchmark (3 runs, incremental)
benchmark:
	./scripts/benchmark_build.sh --runs 3

# Full benchmark (3 runs, clean builds)
benchmark-full:
	./scripts/benchmark_build.sh --full --runs 3 --output build/benchmark_results.md
