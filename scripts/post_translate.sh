#!/bin/bash
LOCALES='af id de'

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

# We need to flush the _build dir or the translations dont come through
rm -rf _build
#Add english to the list and generated docs
LOCALES='en af id de'

if [ $1 ]; then
  LOCALES=$1
fi

for LOCALE in ${LOCALES}
do
  # Compile the html docs for this locale
  rm -rf _static
  cp -r _static_${LOCALE} _static
  echo "Building HTML for locale '${LOCALE}'..."
  sphinx-build -D language=${LOCALE} -b html . _build/html/${LOCALE}

  # Compile the latex docs for that locale
  sphinx-build -D language=${LOCALE} -b latex . _build/latex/${LOCALE}
  # Compile the pdf docs for that locale
  # we use texi2pdf since latexpdf target is not available via 
  # sphinx-build which we need to use since we need to pass language flag
  pushd .
  cd _build/latex/${LOCALE}/
  texi2pdf --quiet  LinfinitiQGISTrainingManual.tex
  mv LinfinitiQGISTrainingManual.pdf LinfinitiQGISTrainingManual-${LOCALE}.pdf
  popd
  rm -rf _static
done
