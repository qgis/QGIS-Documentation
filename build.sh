DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR
git pull
. qgis-doc-env/bin/activate
make clean
make html

