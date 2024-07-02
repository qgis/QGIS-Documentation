FROM qgis/qgis:latest

# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt

# make the venv in /docsenv
WORKDIR /
RUN python3 -m venv docsenv && . docsenv/bin/activate && pip3 install -r /documentation/REQUIREMENTS.txt

WORKDIR /documentation

CMD make doctest-gh
