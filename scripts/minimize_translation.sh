#!/bin/bash

# This script is used to pull translated resources of QGIS-Documentation
# from Transifex, clean and keep only the translated strings in them.
# https://app.transifex.com/qgis/qgis-documentation/dashboard/
#
# Run `minimize_translation.sh -l yourlanguage`
# or `minimize_translation.sh` for all languages
#
# Harrissou Sant-anna, December 2020

# target language: default to all
LANG=${*:--a}

# list of target folders
SOURCEPOFILES='locale'
# ENGLISHPOFILES='locale/pofiles_count_string.txt'
# UNTRANSLATEDPOFILES='locale/about_to_delete.txt'
# rm -rf $ENGLISHPOFILES  $UNTRANSLATEDPOFILES

# Pull translations of all languages from Transifex,
# fetching only the strings that are really translated and not the whole file
tx pull --use-git-timestamps --mode onlytranslated --workers 15 $LANG

# The onlytranslated mode actually pulls all the existing files
# (with only the file header when no string has been translated yet)
# so let's remove those files that have no translated string (except for English)
for POFILE in `find $SOURCEPOFILES -type f -not -path "*/en/*" -name '*.po'`
do
  # Todo: Also remove the Tx notranslate strings from pulled strings?

  # If only msgstr with no text between quotes next to it or on next line appears in the file,
  # then there's not a single human translated string in the file
  # so let's find those files and delete them.
  # For safety we catch the whole block including lines number, original and translated strings
  COUNT=`grep -Pazo '(#:.*\n)+msgid (".*"\n)+msgstr (".+"|""\n(".+"\n)+)' $POFILE | wc -l`
  # echo "$POFILE: $COUNT" >>  $ENGLISHPOFILES
  if [[ $COUNT -lt 1 ]]; then \
    # echo "$POFILE to delete" >> $UNTRANSLATEDPOFILES;\
    rm "$POFILE"
  fi;
done

# remove the resulting empty folders
find $SOURCEPOFILES -type d -empty -delete
