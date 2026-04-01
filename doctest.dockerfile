FROM qgis/qgis:latest

# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
# make the venv in /docsenv
WORKDIR /
RUN python3 -m venv docsenv && . docsenv/bin/activate && pip3 install -r /documentation/REQUIREMENTS.txt
# package to run make seems missing in the environment
RUN apt update && apt install make -y --no-install-recommends
WORKDIR /documentation

CMD ["make", "doctest-gh"]
