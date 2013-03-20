#!/bin/bash

# This script is used to register translatable resources with Transifex
# http://transifex.com
#
# Note that this script updates or creates entries in .tx/config file
#
# Tim Sutton, March 2013
LOCALES=`ls i18n`
for ITEM in docs website
do
  for POFILE in `find i18n/en/LC_MESSAGES/${ITEM}/ -type f -name '*.po'`
  do
    # get the po file replacing 'en' with '<lang>'
    GENERICFILE=`echo $POFILE | sed 's/\/en\//\/<lang>\//g' | sed 's/\/\//\//g'`
    echo $GENERICFILE
    # Get the filename only part of the po file so we can use that
    # name when registering the resource
    BASE=`basename $GENERICFILE .po`
    BASE=`echo $BASE | sed 's/_/-/g' | sed 's/ /-/g'`
    # Register each po file as a transifex resource (an individual translatable file)
    #set -x
    RESOURCE=qgis-documentation.${ITEM}-$BASE
    tx set -t PO --auto-local -r $RESOURCE \
      "$GENERICFILE" \
      --source-lang en \
      --execute
    #set +x
    # Now register the language translations for the localised po file against
    # this resource.
    for LOCALE in $LOCALES
    do
        LOCALEFILE=`echo $POFILE | sed "s/\/en\//\/$LOCALE\//g"`
        tx set -r $RESOURCE -l $LOCALE  "$LOCALEFILE" 
    done 
    # When we are done in this block we should have created a section in the
    # .tx/config file that looks like this:
    #
    #	[inasafe.user-docs-faq]
    #	file_filter = i18n/<lang>/LC_MESSAGES/user-docs/faq.po
    #	source_file = i18n/en/LC_MESSAGES/user-docs/faq.po
    #	source_lang = en
    #	trans.id = i18n/id/LC_MESSAGES/user-docs/faq.po
    #	type = PO
    # 
    # Where there is one trans.<lang> row per locale
  done
done
# Push all the resources to the tx server
tx push -s -t --skip
