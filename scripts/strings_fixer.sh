#!/bin/bash

# This script is used to batch replace strings in the repo, either rst or po files
# It can be used to fix e.g. broken or redirected URLs (spotted using linkcheck),
# malformed Sphinx roles.
# With po files, the idea is to replace the strings in the repo at once
# and avoid pushing strings translators would have to fix in their languages.

# **Todo: Make folder and format parameters callable**

# Harrissou Sant-anna, february 2025

# target file format to update, default to po (or rst?)
TARGETFORMAT="po"

#echo $TARGETFORMAT
declare -A MATCHING_STRINGS

MATCHING_STRINGS=(
       [">\` _"]=">\`_"
       ["> \`_"]=">\`_"
       [":ref: "]=":ref:"
       [": ref: "]=":ref:"
       [":ref : "]=":ref:"
       [": ref :"]=":ref:"
       [":guilabel: "]=":guilabel:"
       [": guilabel: "]=":guilabel:"
       [":guilabel : "]=":guilabel:"
       [": guilabel :"]=":guilabel:"
       [":sup: "]=":sup:"
       [": sup: "]=":sup:"
       [":sup : "]=":sup:"
       [": sup :"]=":sup:"
       [":menuselection: "]=":menuselection:"
       [": menuselection: "]=":menuselection:"
       [":menuselection : "]=":menuselection:"
       [": menuselection :"]=":menuselection:"
       # complete specific strings to update, e.g., urls from make linkcheck output
       #["oldstringtoreplace"]="newstringforreplacement"
       )

SOURCEFILES='locale'

for FILE in `find $SOURCEFILES -type f -name "*.$TARGETFORMAT"`
do
  echo $FILE;

  for string in "${!MATCHING_STRINGS[@]}"
  do
    #echo "$string - ${MATCHING_STRINGS[$string]}"
    sed -i -e "s@$string@${MATCHING_STRINGS[$string]}@g" "$FILE"
  done
done
