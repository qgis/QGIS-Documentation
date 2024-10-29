#!/bin/bash

# cd to script dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

now=`date`
echo "Starting: $now"

if [ -f running ]; then
	echo "$0 still running"
	exit 1
fi

touch running
trap "rm $PWD/running" EXIT

# throw away building artefacts or edits(!)
git stash
git stash drop
# get latest version from github
git pull

# Return release number from branch name e.g. master, 3.34
TARGETBRANCH=`git branch --show-current | sed 's,release_,,g'`
TARGETREPO="QGIS-Documentation"

if [[ "$TARGETBRANCH" != "master" ]]; then \
    TARGETREPO=$TARGETREPO-$TARGETBRANCH
fi;

# NOTE: docker builds and rsync's the build/zip/pdf to the local mounted /site dir
# AFTER the build, we are going to rsync everything to www2.qgis.org
docker run -v $PWD:/build -v /var/www/qgisdata/$TARGETREPO/live/html:/site -w="/build" --rm=true --name="qgis_docs_"$TARGETBRANCH"_build" qgis/sphinx_pdf_3 make all
# in one go: ALL languages, the zip's AND the pdf's:
rsync -hrzc --delete --progress  /var/www/qgisdata/$TARGETREPO/live/html www2.qgis.org:/var/www/qgisdata/$TARGETREPO/live/;

now=`date`
echo "Finished: $now"
