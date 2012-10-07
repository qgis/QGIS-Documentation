#!/bin/bash

# GENERATE PDF AND HTML FOR FOLLOWING LOCALES (EN IS ALWAYS GENERATED)
LOCALES='de'

BUILDDIR=build
mkdir ${BUILDDIR}

# output dirs
PDFDIR=`pwd`/output/pdf
HTMLDIR=`pwd`/output/html
mkdir -p ${PDFDIR}
mkdir -p ${HTMLDIR}

VERSION=`cat source/conf.py | grep "version = '.*'" | grep -o "[0-9]\.[0-9]"`

if [ $1 ]; then
  LOCALES=$1
fi

if [[ $1 = "en" ]]; then
  echo "Not running localization for English."
else
  for LOCALE in $LOCALES
  do
    for POFILE in `ls i18n/${LOCALE}/LC_MESSAGES/*.po`
    do
      MOFILE=i18n/${LOCALE}/LC_MESSAGES/`basename ${POFILE} .po`.mo
      # Compile the translated strings
      echo "Compiling messages to ${MOFILE}"
      msgfmt --statistics -o ${MOFILE} ${POFILE}
    done
  done
fi

# We need to flush the build dir or the translations dont come through
rm -rf ${BUILDDIR}
mkdir ${BUILDDIR}
#Add english to the list and generated docs
LOCALES+=' en'

if [ $1 ]; then
  LOCALES=$1
fi

for LOCALE in ${LOCALES}
# Compile the html docs for this locale
do
  # cleanup all images for the other locale
  rm -rf source/static
  mkdir -p source/static
  # copy english (base) resources to the static dir
  cp -r resources/en/* source/static
  # now overwrite possible available (localised) resources over the english ones
  cp -r resources/${LOCALE}/* source/static

  echo "Building HTML for locale '${LOCALE}'..."
  sphinx-build -d ${BUILDDIR}/doctrees -D language=${LOCALE} -b html source ${HTMLDIR}/${LOCALE}

  # Compile the latex docs for that locale
  sphinx-build -d ${BUILDDIR}/doctrees -D language=${LOCALE} -b latex source ${BUILDDIR}/latex/${LOCALE}
  # Compile the pdf docs for that locale
  # we use texi2pdf since latexpdf target is not available via 
  # sphinx-build which we need to use since we need to pass language flag
  pushd .
  cd ${BUILDDIR}/latex/${LOCALE}/
  texi2pdf --quiet QGISUserGuide.tex
  mv QGISUserGuide.pdf ${PDFDIR}/QGIS-${VERSION}-UserGuide-${LOCALE}.pdf
  popd
done

#rm -rf source/static
rm -rf ${BUILDDIR}
