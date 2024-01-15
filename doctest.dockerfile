FROM qgis/qgis:latest

# Install requirement first to use caching
COPY REQUIREMENTS.txt /documentation/REQUIREMENTS.txt
RUN pip3 install -r /documentation/REQUIREMENTS.txt
# RUN apt-get install -y locales
ENV LC_ALL C.UTF-8
WORKDIR /documentation

CMD make doctest
