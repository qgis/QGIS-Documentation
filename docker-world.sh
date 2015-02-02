#!/bin/bash

now=`date`
echo "Starting $now"

if [ -f running ]; then
	echo "$0 still running"
	exit 1
fi

touch running
trap "rm $PWD/running" EXIT

# cd to script dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
# throw away building artefacts
git stash
git stash drop
# get latest version
git pull

# only languages which have translations in transifex
# nqo is not available in python :-(
: ${langs:=en de es fi fr gl hi id it ja ko nl pl pt_BR pt_PT ro ru uk}

# if you only want to build one language, do:
# $ langs=de ./docker-world.sh

for l in $langs
  do
    time /bin/bash ./docker-run.sh full LANG=$l
    time rsync -hvrz -e ssh --progress output/pdf/$l qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Documentation-2.6/live/html/pdf
    time rsync -hvrz -e ssh --progress output/html/$l qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Documentation-2.6/live/html
  done
