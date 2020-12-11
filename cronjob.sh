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

# throw away building artefacts
git stash
git stash drop
# get latest version
git pull

docker run -v $PWD:/build -v /var/www/qgisdata/QGIS-Documentation/live/html:/site -w="/build" --rm=true --name="qgis_docs_master_build" qgis/sphinx_pdf_3 make site

now=`date`
echo "Finished: $now"
