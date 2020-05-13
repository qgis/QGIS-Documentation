#!/bin/bash

# script to use the transifexi-github yaml see
# https://docs.transifex.com/integrations/transifex-github-integration
# it works on the english (en) po files, so FIRST(!) run
#
# make gettext
# sphinx-intl update -p build/gettext -l en

echo "filters:"

for POFILE in `find source/locale/en -type f -name '*.po'`
do
  echo "  - filter_type: file"
  echo "    file_format: PO"
  echo "    source_language: en"
  # get the po file and remove double // in path
  GENERICFILE=`echo $POFILE | sed 's/\/\//\//g'`
  echo "    source_file: $GENERICFILE"
  LANGMAPPING=`echo $GENERICFILE | sed 's,/en/,/<lang>/,g'`
  echo "    translation_files_expression: $LANGMAPPING"
  echo ""
done

echo "settings:"
echo "   language_mapping:"
echo "     en: en_US"
echo "     nl: nl_NL"
echo "     it: it_IT"
echo "     de: de_DE"

