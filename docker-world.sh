
# only languages which have translations in transifex
# nqo is not available in python :-(
for LANG in en de es fr gl hi id it ja ko nl pl pt_BR pt_PT ro ru
  do
    /bin/bash ./docker-run.sh full LANG=$LANG
    rsync -hvrz -e ssh --progress output/pdf/$LANG qgis.osgeo.osuosl.org:/var/www/documentation/github/QGIS-Documentation-2.2/live/html/pdf
    rsync -hvrz -e ssh --progress output/html/$LANG qgis.osgeo.osuosl.org:/var/www/documentation/github/QGIS-Documentation-2.2/live/html
  done
