#!/bin/sh
# Script to create translation files and docs for all or 
# a certain, available language (e.g. it,nl,de,...)
# USAGE: sh ./scripts/build.sh it

LOGFILE=build$(date +\%Y\%m\%d\-%H\%M).log
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR/..

## check for language
if [ $1 ]; then
   LOCALES=$1
fi

# get docs from git
git pull

## check, how sphinx is installed
if [ `which sphinx-build` ]; then
   SPHINXBUILD=`which sphinx-build`
else
   ## activate virtualenv
   . sphinx-env/bin/activate
fi

# build translation files and docs 
sh scripts/pre_translate.sh $LOCALES >> /tmp/$LOGFILE 2>&1
sh scripts/post_translate.sh $LOCALES >> /tmp/$LOGFILE 2>&1

echo "Finished. Logfile /tmp/$LOGFILE added."
