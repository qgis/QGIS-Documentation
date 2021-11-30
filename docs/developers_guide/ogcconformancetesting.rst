
.. index:: OGC Conformance Testing

.. _qgis_ogc_conformance:

*************************
 OGC Conformance Testing
*************************

.. contents::
   :local:

The Open Geospatial Consortium (OGC) provides tests which can be run free of
charge to make sure a server is compliant with a certain specification.  This
chapter provides a quick tutorial to setup the WMS and OGC API Features tests
on an Ubuntu system. A detailed documentation can be found at the
`OGC website <https://www.opengeospatial.org/compliance>`_.


pyogctest
=========

`pyogctest <https://github.com/pblottiere/pyogctest>`_ is a Python tool
dedicated to run OGC tests easily. The installation may be done in a
virtual environment:

.. code-block:: bash

   git clone https://github.com/pblottiere/pyogctest
   virtualenv venv
   source venv/bin/activate
   pip install -e pyogctest/


WMS 1.3.0 test suite
====================

To run the WMS 1.3.0 test suite with success, a specific test dataset is
needed.  It can be downloaded using **pyogctest**:

.. code-block:: bash

  ./pyogctest.py -s wms130 --download

After the download, a ``teamengine_wms_130.qgs`` project is available in the
new ``data`` directory. This project has to be registered as the default
project for QGIS Server thanks to the **QGIS_SERVER_PROJECT_FILE** environment
variable. This way, we don't need to explicitly set the ``MAP``
vendor-parameter of QGIS Server.

A specific configuration is also necessary to comply with metadata tests.
Indeed, some metadata are available in the ``data/metadata`` directory and have
to be available for the OGC testing framework thanks to an URL. The easiest
option is to configure your web server to have an access through something like
``http://XXX.XXX.XXX.XXX/metadata/Autos.xml``. These metadata URLs are defined
in the project and inserted in the WMS ``GetCapabilities`` document. So the
project needs to be updated according to your testing environment to let QGIS
Server generate a valid XML document:

.. code-block:: bash

  ./pyogctest.py -s wms130 -m http://XXX.XXX.XXX.XXX/metadata


Now that everything is properly configured, we can run the WMS 1.3.0 test
suite:

.. code-block:: bash

  ./pyogctest.py -s wms130 -u http://XXX.XXX.XXX.XXX/qgisserver
  ========================== OGC test session starts ============================
  testsuite: WMS 1.3.0
  collected 184 items

  data-independent::basic_elements::version-negotiation::negotiate-no-version .
  data-independent::basic_elements::version-negotiation::negotiate-basic_elements-version .
  data-independent::basic_elements::version-negotiation::negotiate-higher-version .
  ...
  ...
  ...

  =========================== 184 passed in 40 seconds ===========================


OGC API Features test suite
===========================

To run the OGC API Features 1.0 test suite, a test dataset is needed.
Considering that the underlying QGIS project doesn't need specific
configuration for this test suite, we can use the ``.qgs`` file provided in the
training repository:

.. code-block:: bash

  git clone https://github.com/qgis/QGIS-Training-Data
  ls QGIS-Training-Data/exercise_data/qgis-server-tutorial-data/world.qgs

After the download, a ``world.qgs`` project is available in the
``qgis-server-tutorial`` sub directory. This project has to be registered as
the default project for QGIS Server thanks to the **QGIS_SERVER_PROJECT_FILE**
environment variable. This way, we don't need to explicitly set the ``MAP``
vendor-parameter of QGIS Server.

Now that everything is properly configured, we can run the OGC API Features 1.0
test suite:

.. code-block:: bash

  ./pyogctest.py -s ogcapif -u http://XXX.XXX.XXX.XXX/qgisserver

  =========================== OGC test session starts ============================
  collected 56 items

  collections::FeatureCollections::retrieveApiModel .
  collections::FeatureCollections::noOfCollections .
  collections::FeatureCollections::requirementClasses .
  ...
  ...
  ...

  =========================== 56 passed in 24 seconds ============================
