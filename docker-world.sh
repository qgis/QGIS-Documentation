
# only languages which have translations in transifex
: ${langs:=en de es fi fr gl hi id it ja ko nl pl pt_BR pt_PT ro ru}

# if you only want to build one language, do:
# $ langs=de ./docker-world.sh

# only languages which have translations in transifex
# nqo is not available in python :-(
#for LANG in en de es fr gl hi id it ja ko nl pl pt_BR pt_PT ro ru
for l in $langs
  do
    /bin/bash ./docker-run.sh full LANG=$l
    rsync -hvrz -e ssh --progress output/pdf/$l qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Documentation-2.2/live/html/pdf
    rsync -hvrz -e ssh --progress output/html/$l qgis.osgeo.osuosl.org:/var/www/qgisdata/QGIS-Documentation-2.2/live/html
  done
