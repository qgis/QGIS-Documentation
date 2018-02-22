#!/bin/bash

#This script is used to clean no longer needed images from sources
# Run from repository root

#Find all images in the resources folder
echo "Searching for image files..."
find ./source -type f -regex ".*\.\(png\|PNG\|gif\|jpg\|jpeg\)" -printf "%f\n" | sort -u > all_images.txt
find ./static -type f -regex ".*\.\(png\|PNG\|gif\|jpg\|jpeg\)" -printf "%f\n" | sort -u >> all_images.txt

#Check for images that are used in the source
echo "Checking what images are used..."
grep -r -hof all_images.txt source/ | sort -u > found.txt

#Find images that are not used
echo "Creating list of NOT used image files..."
grep -vf found.txt all_images.txt | xargs -I filename find ./source -name filename > not_found.txt

#Remove images not used
echo "Removing NOT used files..."
xargs rm < not_found.txt

#Remove temporary files
rm all_images.txt
rm found.txt
rm not_found.txt
echo "Done!"
