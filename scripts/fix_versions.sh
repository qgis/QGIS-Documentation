#!/usr/bin/env bash

# Script to update the versions list in bottom left menu for outdated released docs
# To run on the server side to avoid rebuilding old docs at each new release
# Assumes docs are stored following the schema <buildfolder>/version/lang/*.html
# and run as `fix_versions.sh buildfolder`

set -e

# The target deprecated versions to update, folders in site directory
# List to complete
DEPRECATED=(3.28 3.22 3.16 3.10 3.4)
# The versions to reference. List to complete
DOCVERSIONS=(testing latest 3.34 3.28 3.22 3.16 3.10 3.4 2.18)
# The main parent folder as a parameter, or use current folder (default value)
SPATH=${1:-$PWD}

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

function fix_versionsUrl {

  for release in "${DEPRECATED[@]}"; do

    echo "Replacing urls in ${release} doc files..."
    for HTMLFILE in `find ${SPATH}/${release} -type f -name '*.html'`; do

      # Identify the actual file in doc structure, removing the parent folders
      FILEURL="${HTMLFILE#${SPATH}/${release}/}"

      # Create the replacement lines
      for v in "${DOCVERSIONS[@]}"; do
        REPL="${REPL}\n      \n        <dd><a href=\"https://docs.qgis.org/${v}/${FILEURL}\">${v}</a></dd>"
      done

      # Do the replacement
      perl -i -p0e "s@<dl>(\s*)<dt>Versions</dt>.*</dl>@<dl>\1<dt>Versions</dt>${REPL}\n      \n    </dl>@smg" ${HTMLFILE};

      # let's clear the replacement variable 
      unset REPL

    done
    echo "Replacement of urls in ${release} doc files finished."
  done
}

fix_versionsUrl ${SPATH}

