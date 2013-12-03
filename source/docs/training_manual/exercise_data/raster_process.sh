#!/bin/bash

gdaladdo -clean 3320C_2010_314_RGB_LATLNG.tif 
gdaladdo -clean 3320D_2010_315_RGB_LATLNG.tif
gdaladdo -clean 3420C_2010_327_RGB_LATLNG.tif
gdaladdo -clean 3420B_2010_328_RGB_LATLNG.tif

echo ""
echo "Pyramids removed."

gdal_translate -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -of GTiff 3320C_2010_314_RGB_LATLNG.tif c3320C_2010_314_RGB_LATLNG.tif
gdal_translate -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -of GTiff 3320D_2010_315_RGB_LATLNG.tif c3320D_2010_315_RGB_LATLNG.tif
gdal_translate -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -of GTiff 3420C_2010_327_RGB_LATLNG.tif c3420C_2010_327_RGB_LATLNG.tif
gdal_translate -co COMPRESS=DEFLATE -co PREDICTOR=2 -co ZLEVEL=9 -of GTiff 3420B_2010_328_RGB_LATLNG.tif c3420B_2010_328_RGB_LATLNG.tif

echo ""
echo "Images compressed."
