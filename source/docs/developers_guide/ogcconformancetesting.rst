
.. index:: OGC Conformance Testing

*************************
 OGC Conformance Testing
*************************

.. contents::
   :local:

The Open Geospatial Consortium (OGC) provides tests which can be run free of
charge to make sure a server is compliant with a certain specification.
This chapter provides a quick tutorial to setup the WMS tests on an Ubuntu system.
A detailed documentation can be found at the `OGC website <http://www.opengeospatial.org/compliance>`_.

Setup of WMS 1.3 and WMS 1.1.1 conformance tests
=================================================

.. code-block:: bash

  sudo apt-get install openjdk-8-jdk maven
  cd ~/src
  git clone https://github.com/opengeospatial/teamengine.git
  cd teamengine
  mvn install
  mkdir ~/TE_BASE
  export TE_BASE=~/TE_BASE
  unzip -o ./teamengine-console/target/teamengine-console-4.11-SNAPSHOT-base.zip -d $TE_BASE
  mkdir ~/te-install
  unzip -o ./teamengine-console/target/teamengine-console-4.11-SNAPSHOT-bin.zip -d ~/te-install

Download and install WMS 1.3.0 test

.. code-block:: bash

  cd ~/src
  git clone https://github.com/opengeospatial/ets-wms13.git
  cd ets-wms13
  mvn install

Download and install WMS 1.1.1 test

.. code-block:: bash

  cd ~/src
  git clone https://github.com/opengeospatial/ets-wms11.git
  cd ets-wms11
  mvn install


Test project
=============

For the WMS tests, data can be downloaded and loaded into a QGIS project:

.. code-block:: bash

  wget http://cite.opengeospatial.org/teamengine/about/wms/1.3.0/site/data-wms-1.3.0.zip
  unzip data-wms-1.3.0.zip

Then create a `QGIS project
<https://github.com/qgis/QGIS/blob/master/tests/testdata/qgis_server/ets-wms12/project.qgs>`_
according to the description in
http://cite.opengeospatial.org/teamengine/about/wms/1.3.0/site/.
To run the tests, we need to provide the GetCapabilities URL of the service later.


Running the WMS 1.3.0 test
===========================

.. code-block:: bash

  export PATH=/usr/lib/jvm/java-8-openjdk-amd64/bin:$PATH
  export TE_BASE=$HOME/TE_BASE
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
  cd ~/te-install
  ./bin/unix/test.sh -source=$HOME/src/ets-wms13/src/main/scripts/ctl/main.xml


Running the WMS 1.1.1 test
===========================

.. code-block:: bash

  export PATH=/usr/lib/jvm/java-8-openjdk-amd64/bin:$PATH
  export TE_BASE=$HOME/TE_BASE
  export ETS_SRC=$HOME/ets-resources
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
  cd ~/te-install
  ./bin/unix/test.sh -source=$HOME/src/ets-wms11/src/main/scripts/ctl/wms.xml