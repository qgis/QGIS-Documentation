#convenient Makefile
#
#targets:
#  make            - builds the text and images
#  make text	   - builds the text only
#  make refcheck   - check \label{} and \ref{} and friends for consistency
#                    Result is in "latex_refs.log"
#  make clean      - removed Latex' auxiliary files and finalpix
#  make cleanpics  - remove created pics from subdirs
#  make pics	   - create pics
#  make ps         - create PS file
#  make pdf        - create PDF file
#  make html       - create HTML file
#  make updateicon - update png icons from QGIS source
#  make changelog  - creates ChangeLog

# Name of latex main file to compile
FILE=coding-compilation_guide

all: 
	make pics
	latex $(FILE)
	#bibtex $(FILE)
	#bibtex $(FILE)1
	#bibtex $(FILE)2
	#now loop over Latex files, until stable:
	echo Rerun > $(FILE).log
	while grep Rerun $(FILE).log >/dev/null 2>&1 ; do latex $(FILE).tex ; done
	makeindex $(FILE)

text:
	latex $(FILE)
	#bibtex $(FILE)
	#now loop over Latex files, until stable:
	echo Rerun > $(FILE).log
	while grep Rerun $(FILE).log >/dev/null 2>&1 ; do latex $(FILE).tex ; done

#check references:
refcheck:
	@rm -f all
	make | grep "Reference\|Rerun" | sed 's/LaTeX\ Warning:\ Reference\ //' | tr '`' "'" > latex_refs.log
	@rm -f all
	make | grep Citation >> latex_refs.log ; true
	@rm -f all
	make | grep Label | grep multiply >> latex_refs.log ; true
	@echo "Check latex_refs.log:"
	@echo "-------------" ; cat latex_refs.log | sort -u | grep -v Rerun


# check FIXMEs in document
fixme:
	grep -C 2 -n "FIXME" *.tex

#make PostScript:
ps:
	make all
	dvips $(FILE).dvi -o $(FILE).ps

#make PDF:
pdf:
	make all
	dvipdf  $(FILE).dvi

# make pics
pics:
	(cd ./images && make)
	(cd ./operating_system_icons && make)

# make html
# requires: latex2html oder tex4ht
# http://www.cse.ohio-state.edu/~gurari/TeX4ht/mn.html
html:
	make all
	if [ ! -d $(FILE) ]; then mkdir $(FILE); fi
	latex2html -init_file l2h.conf  -split=+2 -dir $(FILE) -address "\
	&copy; 2005, 2006, 2007, 2008, 2009 \
	<a href=http://qgis.osgeo.org>QGIS Project</a> \
	<br>Last modified: `/bin/date +%d-%m-%Y`" $(FILE)

clean:
	rm -f *.log *.aux $(FILE).dvi *.bbl *.tip *.lox *.blg *.ind \
	*.ilg *.toc *.tof *.lof *.lot *.pdf *.ps *.idx *.brf *.out *~
	rm -rf $(FILE)
	rm -rf ./finalpix
	(cd ./appendices && rm -f *.aux)
	make cleanpics

cleanpics:
	(cd ./images && make clean)
	(cd ./operating_system_icons && make clean)

