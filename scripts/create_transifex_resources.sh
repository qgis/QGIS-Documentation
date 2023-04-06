#!/bin/bash

# This script is used to register QGIS-Documentation translatable resources with Transifex
# https://app.transifex.com
#
# Note that this script updates or creates entries in .tx/config file
# so that they match expected formatting of tx-github integration slugs.
# Used to tx pull translations from Transifex
#
# Tim Sutton, March 2013
# Update: Harrissou Sant-anna, December 2020

TARGETBRANCH=`git branch --show-current`
SOURCEPOFILES='locale/en/LC_MESSAGES/docs'
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

# Clean the config file from existing references, out of the main section
# each reference is made of 5 lines and a blank line
sed -i "/$PROJECT/,+5d" $CONFIGFILE

for POFILE in `find $SOURCEPOFILES -type f -name '*.po'`
do
  #echo $POFILE
  # get the po file, replacing 'en' with '<lang>' and removing double '//'s in path
  GENERICFILE=`echo $POFILE | sed 's,\/en\/,\/<lang>\/,g' | sed 's,\/\/,\/,g'`
  echo $GENERICFILE

  # Set the resource slug as the md5 check sum of github#{full_repo_name}#{branch_name}#{source_file_path}
  # so for a source file like
  #   locale/en/LC_MESSAGES/docs/user_manual/processing/3rdParty.po in release_3.28 branch
  # we calculate md5 for
  #   github#qgis/QGIS-Documentation#release_3.28#locale/en/LC_MESSAGES/docs/user_manual/processing/3rdParty.po

  RESOURCE=`echo -n "github#qgis/QGIS-Documentation#$TARGETBRANCH#$POFILE" | md5sum | sed 's/  -//'`
  echo $RESOURCE

  # Populate the config file
  # When we are done in this block we should have created sections in the
  # .tx/config file that look like this:
  #
  #   [o:qgis:p:qgis-documentation:r:locale-en-lc-messages-docs-user-manual-processing-3rdparty-po--release-3-22]
  #   file_filter = locale/<lang>/LC_MESSAGES/docs/user_manual/processing/3rdParty.po
  #   source_file = locale/en/LC_MESSAGES/docs/user_manual/processing/3rdParty.po
  #   source_lang = en
  #   type        = PO
  #
  echo -e "[o:qgis:p:$PROJECT:r:$RESOURCE]\nfile_filter = $GENERICFILE\nsource_file = $POFILE\nsource_lang = en\ntype        = PO\n" >> $CONFIGFILE

done

# Print out a listing of all registered resources
#tx status
