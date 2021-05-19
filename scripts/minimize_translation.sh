#!/bin/bash

# This script is used to pull translated resources of QGIS-Documentation
# from Transifex, clean and keep only the translated strings in them.
# https://www.transifex.com
#
# Run `minimize_translation.sh -l yourlanguage`
# or `minimize_translation.sh` for all languages
#
# Harrissou Sant-anna, December 2020

# target language: default to all
LANG=${*:--a}

# list of target folders
SOURCEPOFILES='locale'
#ENGLISHPOFILES='locale/pofiles_count_string.txt'
#UNTRANSLATEDPOFILES='locale/about_to_delete.txt'
#rm -rf $ENGLISHPOFILES  $UNTRANSLATEDPOFILES

# Pull translations of all languages from Transifex,
# fetching only the strings that are really translated and not the whole file
tx pull --parallel --mode onlytranslated $LANG

# The onlytranslated mode actually pulls all the existing files
# (with only the file header when no string has been translated yet)
# so let's remove those files that have no translated string (except for English)
for POFILE in `find $SOURCEPOFILES -type f -not -path "*/en/*" -name '*.po'`
do
  # if only 'msgstr ""' appears in the file (with no text between quotes),
  # then there's not a single translated string in it
  # so let's find those files and delete them
  COUNT=`grep -oce 'msgstr ".\+"' $POFILE`
  #echo "$POFILE: $COUNT" >>  $ENGLISHPOFILES
  if [ $COUNT -eq 0 ]; then \
    #echo "$POFILE" >> $UNTRANSLATEDPOFILES;\
    rm "$POFILE"
  fi;
done

#remove the resulting empty folders
find $SOURCEPOFILES -type d -empty -delete

