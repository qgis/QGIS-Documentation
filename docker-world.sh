
# QGIS testing/master ONLY in english
# translation is done only in latest stable

for LANG in en
  do
    /bin/bash ./docker-run.sh full LANG=$LANG
    rsync -hvrz -e ssh --progress output/pdf/$LANG qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Documentation/live/html/pdf
    rsync -hvrz -e ssh --progress output/html/$LANG qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Documentation/live/html
  done
