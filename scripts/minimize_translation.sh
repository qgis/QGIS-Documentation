#!/bin/bash

# This script is used to clean QGIS-Documentation translated resources pulled
# from Transifex and keep only the translated strings/files
# https://www.transifex.com
#
# Harrissou Sant-anna, December 2020

# Pull files from Transifex with
#tx pull --mode onlytranslated -a

# Destination folder of translations
SOURCEPOFILES='locale/'
#ENGLISHPOFILES='.tx/english_pofiles.txt'
#UNTRANSLATEDPOFILES='locale/to_delete.txt'
#rm -rf $ENGLISHPOFILES  $UNTRANSLATEDPOFILES

# Delete the files that have no translated string
for POFILE in `find $SOURCEPOFILES -type f -name '*.po'`
do
  # if only 'msgstr ""' appears in the file, then there's not a single translated string in it
  # so let's find those files and delete them
  COUNT=`grep -o -e 'msgstr ".\+"' $POFILE | wc -l`
  #echo "$POFILE: $COUNT" >>  $ENGLISHPOFILES
  if [ $COUNT -eq 0 ]; then \
    #echo "$POFILE" >> $UNTRANSLATEDPOFILES;\
    rm "$POFILE"
  fi;

done

# Delete the empty folders
find $SOURCEPOFILES -type d -empty -delete
