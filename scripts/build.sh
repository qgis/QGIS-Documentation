#!/bin/sh
# Script to create translation files and docs for all or 
# a certain, available language (e.g. it,nl,de,...)
# USAGE: sh ./scripts/build.sh it

LOGFILE=build.log
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR/..
LANGUAGE=$1

# remove old po files
#for i in `find . -name *.po` ; do
#   rm -f $i
#done

# get docs from git
git pull

# activate virtualenv (comment if sphinx is installed locally)
. sphinx-env/bin/activate

# build html and pdf for all LOCALES
sh scripts/pre_translate.sh $LANGUAGE >> $LOGFILE 2>&1
sh scripts/post_translate.sh $LANGUAGE >> $LOGFILE 2>&1

