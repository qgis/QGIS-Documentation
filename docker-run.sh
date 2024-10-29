# to be able to run the full image (including pulling from transifex)
# you need a valid .transifexrc file with your credentials in your home dir
# this one is temporarily copied to the project dir
# and removed after build
# maybe better to create a qgisdocker transifex user?

cp ~/.transifexrc .
pwd=$(pwd)

# Return release number from branch name e.g. master, 3.34
TARGETBRANCH=`git branch --show-current | sed 's,release_,,g'`

docker run -v $pwd:/build -w="/build" --rm=true --name="qgis_docs_"$TARGETBRANCH"_build" qgis/sphinx_pdf_3 make $@
rm -rf .transifexrc
