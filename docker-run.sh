# Run command for generating docs

pwd=$(pwd)

# Return release number from branch name e.g. master, 3.34
TARGETBRANCH=`git branch --show-current | sed 's,release_,,g'`

docker run -v $pwd:/build -w="/build" --rm=true --name="qgis_docs_"$TARGETBRANCH"_build" qgis/sphinx_pdf_3 make $@
