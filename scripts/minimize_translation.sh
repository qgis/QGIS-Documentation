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
# Moreover, Transifex "notranslate" tag helps all translators skip some manual translations,
# when source and translation strings should be identical (e.g., for substitutions).
# This means we may end up with some unfinished po files containing only these duplicate strings.
# Let's remove them also to avoid unnecessary fattening up the repo.
for POFILE in `find $SOURCEPOFILES -type f -not -path "*/en/*" -name '*.po'`
do
  # We count the number of lines that have duplicate source and translation strings
  # and compare to actual translation entries
  COUNTX2=`grep -Pazo 'msgid ((".*"\n)+)msgstr (\1)' $POFILE | wc -l`
  COUNT=$(("$COUNTX2" / 2))
  # Number of translated entries in the file
  MSGSTRCOUNT=`grep -c "^msgstr" $POFILE`

  # echo "file: $POFILE - count $COUNT - msgstrcount $MSGSTRCOUNT" >> $UNTRANSLATEDPOFILES;\
  if [[ $COUNT -eq $MSGSTRCOUNT ]]; then \
    rm "$POFILE"
  fi;
done

# remove the resulting empty folders
find $SOURCEPOFILES -type d -empty -delete
