LOGFILE=build.log
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR/..
git pull
sh scripts/pre_translate.sh >> $LOGFILE 2>&1
sh scripts/post_translate.sh >> $LOGFILE 2>&1

#LOGFILE=build.log
#DIR="$( cd "$( dirname "$0" )" && pwd )"
#cd $DIR
#git pull
#. qgis-doc-env/bin/activate
#make clean
#make compile_messages >> $LOGFILE 2>&1
#make html >> $LOGFILE 2>&1

