#!/usr/bin/env bash

# This script is used to batch replace strings in the repo, either rst or po files
# It can be used to fix e.g. broken or redirected URLs (spotted using linkcheck),
# malformed Sphinx roles.
# With po files, the idea is to replace the strings in the repo at once
# and avoid pushing strings translators would have to fix in their languages.

# Usage: Run from the repository main folder
#   scripts/strings_fixer.sh -- will replace strings in po files in the "locale" folder
#   scripts/strings_fixer.sh docs/about rst -- will replace strings in rst files in the "docs/about" folder

# Harrissou Sant-anna, february 2025

# Folder to browse for text replacement, defaults to locale
SOURCEFILES=${1:-"locale"}
# target file format to update, defaults to po
TARGETFORMAT=${2:-"po"}

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
    # ["oldstringtoreplace"]="newstringforreplacement"
    ["https://doc.qt.io/qt-5/"]="https://doc.qt.io/archives/qt-5.15/"
    ["https://docs.github.com/en/get-started/getting-started-with-git/set-up-git"]="https://docs.github.com/en/get-started/git-basics/set-up-git"
    ["https://docs.github.com/en/actions/writing-workflows"]="https://docs.github.com/en/actions/how-tos/write-workflows"
    ["https://download.qgis.org//downloads/data/"]="https://qgis.org/downloads-list/#data"
    ["https://download.qgis.org"]="https://qgis.org/download/"
    ["https://github.com/pyscripter/pyscripter"]="https://github.com/lmbelo/pyscripter"
    ["https://rapidlasso.de/lastools-220107/"]="https://rapidlasso.de/220107_lastools/"
    ["https://www.mapproxy.org/"]="https://mapproxy.org/"
    ["https://www.nginx.com/resources/wiki/start/topics/examples/fcgiwrap/"]="https://www.f5.com/products/nginx"
    ["https://www.ogc.org/publications/standard/cat"]="https://www.ogc.org/standards/cat/"
    ["https://www.ogc.org/publications/standard/filter"]="https://www.ogc.org/standards/filter/"
    ["https://www.ogc.org/publications/standard/sfa"]="https://www.ogc.org/standards/sfa/"
    ["https://www.ogc.org/publications/standard/sfs/"]="https://www.ogc.org/standards/sfs/"
    ["https://www.ogc.org/publications/standard/sfs"]="https://www.ogc.org/standards/sfs/"
    ["https://www.ogc.org/publications"]="https://www.ogc.org/"
    ["https://www.qt.io/download-dev"]="https://www.qt.io/development/download"
    ["https://ubuntu.com/tutorials/install-a-local-kubernetes-with-microk8s"]="https://canonical.com/microk8s/docs/getting-started"
    ["https://github.com/qgis/QGIS/blob/release-3_40/python/plugins/processing/algs/qgis"]="https://github.com/qgis/QGIS/tree/release-3_40/python/plugins/processing/algs/qgis"
    ["https://gisforthought.com/projects/postgis_tutorial/validity.html"]="https://postgis.net/workshops/postgis-intro/validity.html"
    ["https://manpages.ubuntu.com/manpages/latest/man1/prlimit.1.html"]="https://man7.org/linux/man-pages/man1/prlimit.1.html"
    ["https://www.santannapisa.it/en/istituto/scienze-della-vita/istituto-di-scienze-della-vita"]="https://www.santannapisa.it/en/node/70078"
    ["https://www.ogc.org/announcement/compliance-testing-is-now-available-for-implementations-of-the-ogc-api-features-part-1-core-standard/"]="https://www.ogc.org/press-release/compliance-testing-is-now-available-for-implementations-of-the-ogc-api-features-part-1-core-standard/"
)

for FILE in $(find ${SOURCEFILES} -type f -name "*.${TARGETFORMAT}"); do
    echo "${FILE}"

    for string in "${!MATCHING_STRINGS[@]}"; do
        #echo "$string - ${MATCHING_STRINGS[$string]}"
        sed -i -e "s@${string}@${MATCHING_STRINGS[${string}]}@g" "${FILE}"
    done
done
