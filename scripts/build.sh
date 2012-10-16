LOGFILE=build.log
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR/..

# remove old po files
for i in `find . -name *.po` ; do
   rm -f $i
done

# get docs from git
git pull

# activate virtualenv
. sphinx-env/bin/activate

# build html and pdf for all LOCALES
sh scripts/pre_translate.sh >> $LOGFILE 2>&1
sh scripts/post_translate.sh >> $LOGFILE 2>&1


