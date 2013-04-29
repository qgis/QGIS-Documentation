#!/bin/bash
#
SPHINXBUILD=`which sphinx-build`

# GENERATE PDF AND HTML FOR FOLLOWING LOCALES (EN IS ALWAYS GENERATED)
LOCALES='fr de it ja ru nl pt_BR'
#LOCALES='af ar bg ca_ES cs_CZ da_DK de el_GR en es et_EE eu_ES fa fi fr gl_ES he hi hr_HR hu id is it ja ka_GE ko_KR lo lt lv mn nl no pl_PL pt_BR pt_PT ro ru sk sl_SI sq_AL sr_Cyrl sr_Latn sv sw ta th tr uk vi xh zh_CN zh_TW'

if [ $1 ]; then
  LOCALES=$1
fi

BUILDDIR=build
# be sure to remove an old build dir
rm -rf ${BUILDDIR}
mkdir -p ${BUILDDIR}

# source/conf.py needs to be checked
VERSION=`cat source/conf.py | grep "version = '.*'" | grep -o "[0-9]\.[0-9]"`

# output dirs
PDFDIR=`pwd`/output/${VERSION}/pdf
HTMLDIR=`pwd`/output/${VERSION}/html
mkdir -p ${PDFDIR}
mkdir -p ${HTMLDIR}

if [[ $1 = "en" ]]; then
  echo "Not running localization for English."
else
  for LOCALE in ${LOCALES}
  do
    for POFILE in `find i18n/${LOCALE}/LC_MESSAGES/ -type f -name '*.po'`
    do
      MOFILE=`echo ${POFILE} | sed -e 's,\.po,\.mo,'`
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
  ${SPHINXBUILD} -d ${BUILDDIR}/doctrees -D language=${LOCALE} -b html source ${HTMLDIR}/${LOCALE}

  # Compile the latex docs for that locale
  ${SPHINXBUILD} -d ${BUILDDIR}/doctrees -D language=${LOCALE} -b latex source ${BUILDDIR}/latex/${LOCALE}
  # Compile the pdf docs for that locale
  # we use texi2pdf since latexpdf target is not available via 
  # sphinx-build which we need to use since we need to pass language flag
  pushd .
  cd ${BUILDDIR}/latex/${LOCALE}/
  # need to build 3x to have proper toc and index
  texi2pdf --quiet QGISUserGuide.tex
  texi2pdf --quiet QGISUserGuide.tex
  texi2pdf --quiet QGISUserGuide.tex
  mv QGISUserGuide.pdf ${PDFDIR}/QGIS-${VERSION}-UserGuide-${LOCALE}.pdf
  popd
done

rm -rf source/static
rm -rf ${BUILDDIR}
