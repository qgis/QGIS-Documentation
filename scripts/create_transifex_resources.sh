#!/bin/bash

# This script is used to register QGIS-Documentation translatable resources with Transifex
# https://www.transifex.com
#
# Note that this script updates or creates entries in .tx/config file
# so that they match expected formatting of tx-github integration slugs.
# Used to first "tx push" existing translations to Transifex when enabling the github integration
#
# Tim Sutton, March 2013
# Update: Harrissou Sant-anna, December 2020

TARGETBRANCH='master'
SOURCEPOFILES='locale/en/LC_MESSAGES/docs/'
PROJECT='qgis-documentation'

# To be sure there are no *.pot or *.mo files left
make springclean

# Regenerate the English PO files
make gettext
rm -r $SOURCEPOFILES
sphinx-intl update -p build/gettext -l en

# Clean the .tx/config files from existing references, out of the main section
sed -i "/$PROJECT/,$ d" .tx/config

for POFILE in `find $SOURCEPOFILES -type f -name '*.po'`
do
  #echo $POFILE
  # get the po file, replacing 'en' with '<lang>' and removing double '//'s in path
  GENERICFILE=`echo $POFILE | sed 's,\/en\/,\/<lang>\/,g' | sed 's,\/\/,\/,g'`
  echo $GENERICFILE

  # Set the resource slug by
  # lowering the case of 'LC_MESSAGES'
  # appending the target branch name after double "-"
  # and replacing "_", "/", "." and " " characters with "-" in the path
  # so for a file like
  #   locale/en/LC_MESSAGES/docs/gentle_gis_introduction/data_capture.po in release_3.16 branch
  # we will get
  #   locale-en-lc-messages-docs-gentle-gis-introduction-data-capture-po--release-3-16
  RESOURCE=`echo "$POFILE--$TARGETBRANCH" | sed 's,LC_MESSAGES,lc-messages,g' | sed 's,_,-,g' | sed 's, ,-,g' | sed 's,/,-,g' | sed 's,\.,-,g'`
  echo $RESOURCE
  # Register each po file as a transifex resource (an individual translatable file)
  set -x
  tx config mapping \
    -t PO \
    -r $PROJECT.$RESOURCE \
    -s $POFILE \
    --expression "$GENERICFILE" \
    --source-language en \
    --execute
done

# Print out a listing of all registered resources
#tx status
