#!/bin/bash

# This script is used to register InaSAFE translatable resources with Transifex
# http://transifex.com
#
# Note that this script updates or creates entries in .tx/config file
#
# Tim Sutton, March 2013

#
# Sphinx documentation first
#

LOCALES=`ls i18n`
#LOCALES=nl ja

# to be sure there are not pot files left
make clean

#for ITEM in site
#do
  for POFILE in `find i18n/en/LC_MESSAGES/${ITEM}/ -type f -name '*.po'`
  do
    # get the po file replacing 'en' with '<lang>' and removing doube // in path
    GENERICFILE=`echo $POFILE | sed 's/\/en\//\/<lang>\//g' | sed 's/\/\//\//g'`
    #echo $GENERICFILE
    # Get the filename only part of the po file so we can use that
    # name when registering the resource
    BASE=`dirname $GENERICFILE`/`basename $GENERICFILE .po`
    # removing i18n/<lang>/LC_MESSAGES
    # replace _ in - in filenames
    # replace empty spaces to -
    # replace / in _ 
    # replace . to _ (eg for release2.0 names)
    # so we have for a file like
    #   site/about/my_screenshots/index.po
    # we will get
    #   site_about_my-screenshots_index
    BASE=`echo $BASE | sed 's,i18n.*LC_MESSAGES\/,,g' | sed 's,_,-,g' | sed 's, ,-,g' | sed 's,/,_,g' | sed 's,\.,-,g'`
#    RESOURCE=qgis-website.${ITEM}-$BASE
    RESOURCE=qgis-website.$BASE
    #echo $RESOURCE
    # Register each po file as a transifex resource (an individual translatable file)
    #set -x
    tx set -t PO --auto-local -r $RESOURCE \
      "$GENERICFILE" \
      --source-lang en \
      --execute
    #set +x
    # Now register the language translations for the localised po file against
    # this resource.
    for LOCALE in $LOCALES
    do
        LOCALEFILE=`echo $POFILE | sed "s/\/en\//\/$LOCALE\//g"`
        #echo "$LOCALEFILE"
        tx set -r $RESOURCE -l $LOCALE  "$LOCALEFILE"
    done
    # When we are done in this block we should have created a section in the
    # .tx/config file that looks like this:
    #
    #   [qgis-website.site_forusers_alldownloads]
    #   file_filter = i18n/<lang>/LC_MESSAGES/site/forusers/alldownloads.po
    #   source_file = i18n/en/LC_MESSAGES/site/forusers/alldownloads.po
    #   source_lang = en
    #   trans.nl = i18n/nl/LC_MESSAGES/site/forusers/alldownloads.po
    #   type = PO
  done
#done


#Print out a listing of all registered resources
#tx status

# Push all the resources to the tx server
#tx push -s

