#!/bin/bash
# use this script, if you don't want to translate but 
# build the english master documentation

BUILDDIR=build
# be sure to remove an old build dir
rm -rf ${BUILDDIR}
mkdir -p ${BUILDDIR}

# output dirs
PDFDIR=`pwd`/output/pdf
HTMLDIR=`pwd`/output/html
mkdir -p ${PDFDIR}
mkdir -p ${HTMLDIR}

VERSION=`cat source/conf.py | grep "version = '.*'" | grep -o "[0-9]\.[0-9]"`

# cleanup old static
rm -rf source/static
mkdir -p source/static

#copy english (base) resources to the static dir
cp -r resources/en/* source/static

echo "Building HTML for locale '${LOCALE}'..."
sphinx-build -d ${BUILDDIR}/doctrees -D language=en -b html source ${HTMLDIR}/en

# Compile the latex docs for that locale
sphinx-build -d ${BUILDDIR}/doctrees -D language=en -b latex source ${BUILDDIR}/latex/en
  
# we use texi2pdf since latexpdf target is not available via 
# sphinx-build which we need to use since we need to pass language flag
pushd .
cd ${BUILDDIR}/latex/en/
texi2pdf --quiet QGISUserGuide.tex
mv QGISUserGuide.pdf ${PDFDIR}/QGIS-${VERSION}-UserGuide-en.pdf
popd

rm -rf source/static
rm -rf ${BUILDDIR}

