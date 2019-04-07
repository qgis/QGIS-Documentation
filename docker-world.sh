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

# only languages which have enough translations in transifex
# nqo is not available in python :-(
: ${langs:=en bg cs de es fi fr id it ja ko nl pt_BR pt_PT ro ru tr zh-Hant}

# if you only want to build one language, do:
# $ langs=de ./docker-world.sh

for l in $langs
  do
    time /bin/bash ./docker-run.sh full LANG=$l
    # we changed source/conf.py during build (exclude processing algs for pdf (see Makefile)
    # let's get a fresh checkout of source/conf.py
    git checkout source/conf.py
    #time rsync -hvrzc -e ssh --progress output/pdf/$l qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Documentation-2.18/live/html/pdf
    #time rsync -hvrzc -e ssh --progress output/html/$l qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Documentation-2.18/live/html
    # 1 dec 2017 rsycn to local disk
    time rsync -hvrzc --progress output/pdf/$l /var/www/qgisdata/QGIS-Documentation-3.4/live/html/pdf
    time rsync -hvrzc --progress output/html/$l /var/www/qgisdata/QGIS-Documentation-3.4/live/html
  done

now=`date`
echo "Finished: $now"
