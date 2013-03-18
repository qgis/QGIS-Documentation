#!/bin/bash

# This script is used to register translatable resources with Transifex
# http://transifex.com
#
# Note that this script updates or creates entries in .tx/config file
#
# Tim Sutton, March 2013

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
    tx set -t PO --auto-local -r qgis-documentation.${ITEM}-$BASE \
      "$GENERICFILE" \
      --source-lang en \
      --execute
    #set +x
  done
done
# Push all the resources to the tx server
tx push -s
