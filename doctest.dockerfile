FROM qgis/qgis:release-3_16

# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
RUN pip3 install -r /documentation/REQUIREMENTS.txt

WORKDIR /documentation

CMD make doctest
