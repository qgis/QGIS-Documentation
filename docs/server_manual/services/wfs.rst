RRb Feature Service (WFS)
=========================

The **1.0.0** and **1.1.0** WFS standards implemented in QGIS Server
provide a HTTP interface to query geographic features from a QGIS
project.
A typical WFS request defines the QGIS project to use and the layer to
query.

Specifications document according to the version number of the service:

- `WFS 1.0.0 <http://portal.opengeospatial.org/files/?artifact_id=7176>`_
- `WFS 1.1.0 <http://portal.opengeospatial.org/files/?artifact_id=8339>`_

Standard requests provided by QGIS Server:

.. csv-table::
   :header: "Request", "Description"
   :widths: auto

   ":ref:`GetCapabilities <qgisserver-wfs-getcapabilities>`", "Returns XML metadata with information about the server"
   ":ref:`GetFeature <qgisserver-wfs-getfeature>`", "Returns a selection of features"
   "DescribeFeatureType", "Returns a description of feature types and properties"
   "Transaction", "Allows features to be inserted, updated or deleted"


.. _`qgisserver-wfs-getcapabilities`:

GetCapabilities
---------------

Standard parameters for the **GetFeature** request according to the
OGC WFS 1.0.0 and 1.1.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <qgisserver-wfs-service>`", "Yes", "Name of the service (**WFS**)"
   ":ref:`VERSION <qgisserver-wfs-version>`", "No", "Version of the service"
   ":ref:`REQUEST <qgisserver-wfs-getcapabilities-request>`", "Yes", "Name of the request"

In addition to the standard ones, QGIS Server supports the following
extra parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`MAP <qgisserver-wfs-map>`", "Yes", "Specify the QGIS project file"


.. _`qgisserver-wfs-service`:

SERVICE
^^^^^^^

This parameter has to be ``WFS`` in case of the **WFS** service.

For example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WFS
  &...


.. _`qgisserver-wfs-version`:

VERSION
^^^^^^^

This parameter allows to specify the version of the service to use.
Available values for the ``VERSION`` parameter are:

- ``1.0.0``
- ``1.1.0``

If no version is indicated in the request, then ``1.1.0`` is used by
default.

URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WFS
  &VERSION=1.1.0
  &...


.. _`qgisserver-wfs-getcapabilities-request`:

REQUEST
^^^^^^^

This parameter is ``GetCapabilities`` in case of the **GetCapabilities**
request.


.. _`qgisserver-wfs-map`:

MAP
^^^

This parameter allows to define the QGIS project file to use and is mandatory
because a request needs a QGIS project to actually work.

However, the ``QGIS_PROJECT_FILE`` environment variable may be used to define a
default QGIS project.  In this specific case, ``MAP`` is not longer a required
parameter.  For further information you may refer to
:ref:`server_env_variables`.


.. _`qgisserver-wfs-getfeature`:

GetFeature
----------

Standard parameters for the **GetFeature** request according to the
OGC WFS 1.0.0 and 1.1.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <qgisserver-wfs-service>`", "Yes", "Name of the service (**WFS**)"
   ":ref:`VERSION <qgisserver-wfs-version>`", "No", "Version of the service"
   ":ref:`REQUEST <qgisserver-wfs-getfeature-request>`", "Yes", "Name of the request"
   ":ref:`TYPENAME <qgisserver-wfs-getfeature-typename>`", "No", "Name of layers"
   ":ref:`FEATUREID <qgisserver-wfs-getfeature-featureid>`", "No", "Filter the features by ids"
   ":ref:`OUTPUTFORMAT <qgisserver-wfs-getfeature-outputformat>`", "No", "Output Format"
   ":ref:`RESULTTYPE <qgisserver-wfs-getfeature-resulttype>`", "No", "Type of the result"
   ":ref:`PROPERTYNAME <qgisserver-wfs-getfeature-propertyname>`", "No", "Name of properties to return"
   ":ref:`MAXFEATURES <qgisserver-wfs-getfeature-maxfeatures>`", "No", "Maximum number of features to return"
   ":ref:`SRSNAME <qgisserver-wfs-getfeature-srsname>`", "No", "Coordinate reference system"
   ":ref:`FILTER <qgisserver-wfs-getfeature-filter>`", "No", "OGC Filter Encoding"
   ":ref:`BBOX <qgisserver-wfs-getfeature-bbox>`", "No", "Map Extent"
   ":ref:`SORTBY <qgisserver-wfs-getfeature-sortby>`", "No", "Sort the results"


In addition to the standard ones, QGIS Server supports the following
extra parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`MAP <qgisserver-wfs-map>`", "Yes", "Specify the QGIS project file"
   "STARTINDEX <qgisserver-wfs-getfeature-startindex>`", "No", "Paging"
   "GEOMETRYNAME <qgisserver-wfs-getfeature-geometryname>`", "No", "Type of geometry to return"
   "EXP_FILTER <qgisserver-wfs-getfeature-expfilter>`", "No", "Expression filtering"


.. _`qgisserver-wfs-getfeature-request`:

REQUEST
^^^^^^^

This parameter is ``GetFeature`` in case of the **GetFeature**
request.

URL example:

.. code-block:: bash

  http://localhost/qgisserver?
  SERVICE=WFS
  &VERSION=1.1.0
  &REQUEST=GetFeature
  &...


.. _`qgisserver-wfs-getfeature-typename`:

TYPENAME
^^^^^^^^

This parameter allows to specify layer names and is mandatory if ``FEATUREID``
is not set.


.. _`qgisserver-wfs-getfeature-featureid`:

FEATUREID
^^^^^^^^^

TODO


.. _`qgisserver-wfs-getfeature-outputformat`:

OUTPUTFORMAT
^^^^^^^^^^^^

TODO


.. _`qgisserver-wfs-getfeature-resulttype`:

RESULTTYPE
^^^^^^^^^^

This parameter may be used to specify the kind of result to return.
Available values are:

- ``results``: the default behavior
- ``hits``: returns only a feature count

URL example:

.. code-block:: bash

  http://localhost/qgisserver?
  SERVICE=WFS
  &VERSION=1.1.0
  &REQUEST=GetFeature
  &RESULTTYPE=hits
  &...


.. _`qgisserver-wfs-getfeature-propertyname`:

PROPERTYNAME
^^^^^^^^^^^^

TODO


.. _`qgisserver-wfs-getfeature-maxfeatures`:

MAXFEATURES
^^^^^^^^^^^

TODO


.. _`qgisserver-wfs-getfeature-srsname`:

SRSNAME
^^^^^^^

TODO


.. _`qgisserver-wfs-getfeature-filter`:

FILTER
^^^^^^

TODO


.. _`qgisserver-wfs-getfeature-bbox`:

BBOX
^^^^

TODO


.. _`qgisserver-wfs-getfeature-sortby`:

SORTBY
^^^^^^

TODO


.. _`qgisserver-wfs-getfeature-geometryname`:

GEOMETRYNAME
^^^^^^^^^^^^

This parameter can be used to specify the kind of geometry to return
for features. Available values are:

- ``extent``
- ``centroid``
- ``bash``

URL example:

.. code-block:: bash

  http://localhost/qgisserver?
  SERVICE=WFS
  &VERSION=1.1.0
  &REQUEST=GetFeature
  &GEOMETRYNAME=centroid
  &...


.. _`qgisserver-wfs-getfeature-startindex`:

STARTINDEX
^^^^^^^^^^

This parameter is standard in WFS 2.0, but it's an extension for WFS
1.0.0.

Actually, it can be used to skip some features in the result set and
in combination with ``MAXFEATURES``, it provides the ability to page
through results.

URL example:

.. code-block:: bash

  http://localhost/qgisserver?
  SERVICE=WFS
  &VERSION=1.1.0
  &REQUEST=GetFeature
  &STARTINDEX=2
  &...


.. _`qgisserver-wfs-getfeature-expfilter`:

EXP_FILTER
^^^^^^^^^^

TODO
