#!/bin/bash
#

# to be run from the root directory
# scripts/pulldocsources.sh
# it will pull documentation sources from Gith
# and copy sources, images and translations for 'en' and 'de' into the source dir
# you can also call it with a spaceseparted list of languages
# scripts/pulldocsources.sh en de it nl
# then only those images will be handled

QGIS_DOC_DIR='QGIS-Documentation'
QGIS_DOC_BRANCH='master'
LANGUAGES=`ls i18n`

if [ $1 ]; then
  LANGUAGES="$@"
fi

echo $LANGUAGES

cd ./ext

# if there is NOT a QGIS-Documentation directory
if [ ! -d $QGIS_DOC_DIR ]; then
    git clone https://github.com/qgis/QGIS-Documentation.git $QGIS_DOC_DIR
fi

# checkout the branch we want to incorporate into the documentation
cd $QGIS_DOC_DIR
git checkout $QGIS_DOC_BRANCH
# pull latest
git pull
cd ../..
# copy documentation conf.py as docs_conf.py into the sources dir
cp ext/$QGIS_DOC_DIR/source/conf.py source/docs_conf.py
# copy sources of documentation into website source tree
echo "Copying sources from documentation into website source tree"
# we do NOT want the index.rst and index.po from the docs to override 
# those from website that is why we doe /*/ (we skip files in docs root)
cp -r ext/$QGIS_DOC_DIR/source/docs/*/ source/docs

for LANG in ${LANGUAGES}
do
    echo "Copying resources(images) and translations for '${LANG}' into website source tree"
    cp -r ext/$QGIS_DOC_DIR/resources/${LANG}/docs resources/${LANG}
    mkdir -p i18n/${LANG}/LC_MESSAGES/docs
    cp -r ext/$QGIS_DOC_DIR/i18n/${LANG}/LC_MESSAGES/docs/*/ i18n/${LANG}/LC_MESSAGES/docs
done
