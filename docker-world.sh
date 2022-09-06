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

TARGET=${1:-full}

# throw away building artefacts
git stash
git stash drop
# get latest version
git pull

# only languages which have translations in transifex
#: ${langs:=en ca da de es fa fi fr gl hu id it ja km_KH ko lt nl pl pt_BR pt_PT ro tr ru uk zh-Hans zh-Hant}
: ${langs:=en}

# if you only want to build one language, do:
# $ langs=de ./docker-world.sh

for l in $langs
  do
    ./docker-run.sh $TARGET LANG=$l
    build_ok=$?
    if [[ "$build_ok" = "0" ]]; then
      echo "Build OK: syncing to web"
      #time rsync -hvrzc -e ssh --progress build/html/$l qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Website/live/html
      # 1 dec 2017: local sync to qgis2
      #time rsync -hvrzc --delete --progress build/html/$l /var/www/qgisdata/QGIS-Documentation/live/html
      #time rsync -hvrzc --delete --progress build/pdf /var/www/qgisdata/QGIS-Documentation/live/html
      #time rsync -hvrzc --delete --progress build/zip /var/www/qgisdata/QGIS-Documentation/live/html
      # 20220317: local sync to new www2
      time rsync -hvrzc --delete --progress build/html/$l root@195.201.96.242:/var/www/qgisdata/QGIS-Documentation/live/html
      time rsync -hvrzc --delete --progress build/pdf root@195.201.96.242:/var/www/qgisdata/QGIS-Documentation/live/html
      time rsync -hvrzc --delete --progress build/zip root@195.201.96.242:/var/www/qgisdata/QGIS-Documentation/live/html
    else
      echo "Build FAILED: not syncing to web";
    fi
  done

now=`date`
echo "Finished: $now"
