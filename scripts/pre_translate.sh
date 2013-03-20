#!/bin/bash

SPHINXBUILD=`which sphinx-build`

LOCALES='fr de it ja ru nl'
#LOCALES='af ar bg ca_ES cs_CZ da_DK de el_GR en es et_EE eu_ES fa fi fr gl_ES he hr_HR hu id is it ja ka_GE ko_KR lo lt lv mn nl no pl_PL pt_BR pt_PT ro ru sk sl_SI sq_AL sr_Cyrl sr_Latn sv sw ta th tr uk vi xh zh_CN zh_TW'

if [ $1 ]; then
  LOCALES=$1
fi

# Create / update the translation catalogue - this will generate the master .pot files
mkdir -p i18n/pot
# Create a (temporary) static directory in source to hold all (localised ) static content
mkdir -p source/static

BUILDDIR=build
# be sure to remove an old build dir
rm -rf ${BUILDDIR}
mkdir -p ${BUILDDIR}

# copy english resources to static to be able to do a proper sphinx-build
cp -r resources/en/* source/static/

${SPHINXBUILD} -d ${BUILDDIR}/doctrees -b gettext source i18n/pot/

# Now iteratively update the locale specific .po files with any new strings needed translation

for LOCALE in ${LOCALES}
do
  echo "Updating translation catalog for ${LOCALE}:"
  echo "------------------------------------"
  mkdir -p i18n/${LOCALE}/LC_MESSAGES
  # cleanup images from static (different locales can have different localized images)
  rm -rf source/static/*
  # Clone the en resources and then overwrite with any localised versions of the same files.
  cp -r resources/en/* source/static/
  PODIR=resources/${LOCALE}
  if [ -d $PODIR ];
  then
      cp -r ${PODIR}/* source/static/
  fi

  # Merge or copy all the updated pot files over to locale specific po files
  for FILE in `find i18n/pot/ -type f`
  do
    POTFILE=${FILE}
    POFILE=`echo ${POTFILE} | sed -e 's,\.pot,\.po,' | sed -e 's,pot,'${LOCALE}'/LC_MESSAGES,'`
    if [ -f $POFILE ];
    then
      echo "Updating strings for ${POFILE}"
      msgmerge -U ${POFILE} ${POTFILE}
    else
      echo "Creating ${POFILE}"
      mkdir -p `echo $(dirname ${POFILE})`
      cp ${POTFILE} ${POFILE} 
    fi
  done
done

# Now get rid of temporary POT files
rm -rf i18n/pot
rm -rf source/static

echo "Pre-translate completed."
echo ""
echo "******************************************"
echo "Consider running (or asking a Transifex admin to run) the"
echo "following command so that transifex gets updated"
echo ""
echo "scripts/create-transifex-resources.sh"
echo ""
echo "******************************************"
