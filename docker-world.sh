#!/bin/bash

# QGIS testing/master ONLY in english
# translation is done only in latest stable

# cd to script dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

now=`date`
echo "Starting $now"

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

for LANG in en
  do
    time /bin/bash ./docker-run.sh full LANG=$LANG
    # we changed source/conf.py during build (exclude processing algs for pdf (see Makefile)
    # let's get a fresh checkout of source/conf.py
    git checkout source/conf.py
    time rsync -hvrzc -e ssh --progress output/pdf/$LANG qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Documentation/live/html/pdf
    time rsync -hvrzc -e ssh --progress output/html/$LANG qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Documentation/live/html
  done

now=`date`
echo "Finished: $now"
