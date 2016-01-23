#!/bin/bash

# replacing |nix| |qg| |win| |osx|
rpl -qi '|qg|' 'QGIS' $1
rpl -qi '|Linux|' '' $1
rpl -qi '|Windows|' '' $1
rpl -qi '|OSX|' '' $1

# :menuselection:
rpl -qi ':menuselection:' '' $1
# :guilabel:
rpl -qi ':guilabel:' '' $1

echo
echo "ooo Images to move to this file"
grep 'figure::' $1 | sort

SPATH='/static/user_manual/working_with_vector'
IMAGES='./images'
# Replacing $SPATH to $IMAGES
rpl -q $SPATH $IMAGES $1

echo
echo "ooo Substitutions to move to this file:"
grep -o '|[a-z,A-Z]\+|' $1 | sort | uniq