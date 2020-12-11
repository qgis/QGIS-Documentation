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

docker run -v $PWD:/build -v /var/www/qgisdata/QGIS-Documentation-3.16/live/html:/site -w="/build" --rm=true --name="qgis_docs_3.16_build" qgis/sphinx_pdf_3 make all

now=`date`
echo "Finished: $now"
