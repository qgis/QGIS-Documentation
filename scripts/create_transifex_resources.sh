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

TARGETBRANCH=`git branch --show-current`
SOURCEPOFILES='locale/en/LC_MESSAGES/docs/'
PROJECT='qgis-documentation'
CONFIGFILE='.tx/config'

# To be sure there are no *.pot or *.mo files left
make springclean

# Regenerate the English PO files
make gettext
# Only rm if really starting from scratch (might "break" metadata in transifex)
# rm -r $SOURCEPOFILES
sphinx-intl update -p build/gettext -l en

# Clean generated translation *.po files from obsolete strings, if any
find $SOURCEPOFILES -type f -name '*.po' -exec sed -i '/^#~ /,/^$/d' {} \;

# Clean the .tx/config files from existing references, out of the main section
# each reference is made of 5 lines and a blank line
sed -i "/$PROJECT/,+5d" .tx/config

for POFILE in `find $SOURCEPOFILES -type f -name '*.po'`
do
  #echo $POFILE
  # get the po file, replacing 'en' with '<lang>' and removing double '//'s in path
  GENERICFILE=`echo $POFILE | sed 's,\/en\/,\/<lang>\/,g' | sed 's,\/\/,\/,g'`
  echo $GENERICFILE

  # Set the resource slug by
  # lowering the case of the whole text
  # appending the target branch name after double "-"
  # and replacing "_", "/", ".", "\" and " " characters with "-" in the path
  # so for a file like
  #   locale/en/LC_MESSAGES/docs/user_manual/processing/3rdParty.po in release_3.16 branch
  # we will get
  #   locale-en-lc-messages-docs-user-manual-processing-3rdparty-po--release-3-16
  RESOURCE=`echo "$POFILE--$TARGETBRANCH" | tr '[:upper:]' '[:lower:]' | sed 's,[_/ \.\\],-,g'`
  echo $RESOURCE

  # Populate the config file
  # When we are done in this block we should have created sections in the
  # .tx/config file that look like this:
  #
  #   [qgis-documentation.locale-en-lc-messages-docs-user-manual-processing-3rdparty-po--release-3-16]
  #   file_filter = locale/<lang>/LC_MESSAGES/docs/user_manual/processing/3rdParty.po
  #   source_file = locale/en/LC_MESSAGES/docs/user_manual/processing/3rdParty.po
  #   source_lang = en
  #   type = PO
  #
  echo -e "[$PROJECT.$RESOURCE]\nfile_filter = $GENERICFILE\nsource_file = $POFILE\nsource_lang = en\ntype = PO\n" >> $CONFIGFILE

done

# Print out a listing of all registered resources
#tx status
