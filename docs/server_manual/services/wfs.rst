Web Feature Service (WFS)
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

   "GetCapabilities", "Returns XML metadata with information about the server"
   "GetFeature", "Returns a selection of features"
   "DescribeFeatureType", "Returns a description of feature types and properties"
   "Transaction", "Allows features to be inserted, updated or deleted"


.. _`qgisserver-wfs-getfeature`:

GetFeature
----------

Standard parameters for the **GetFeature** request according to the
OGC WFS 1.0.0 and 1.1.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   "SERVICE", "Yes", "Name of the service"
   "VERSION", "No", "Version of the service"
   "REQUEST", "Yes", "Name of the request"
   "TYPENAME", "No", "Name of layers"
   "OUTPUTFORMAT", "No", "Output Format"
   "RESULTTYPE", "No", "Type of the result"
   "PROPERTYNAME", "No", "Name of properties to return"
   "MAXFEATURES", "No", "Maximum number of features to return"
   "SRSNAME", "No", "Coordinate reference system"
   "FEATUREID", "No", "Filter the features by ids"
   "FILTER", "No", "OGC Filter Encoding"
   "BBOX", "No", "Map Extent"
   "SORTBY", "No", "Sort the results"


In addition to the standard ones, QGIS Server supports the following
extra parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   "MAP", "Yes", "Specify the QGIS project file"
   "STARTINDEX", "No", "Paging"
   "GEOMETRYNAME", "No", "Type of geometry to return"
   "EXP_FILTER", "No", "Expression filtering"


SERVICE
^^^^^^^

This parameter has to be ``WFS`` in case of the **GetFeature**
request.

For example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WFS
  &...


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


REQUEST
^^^^^^^

This parameter is ``GetFeature`` in case of the **GetFeature**
request.

URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WFS
  &VERSION=1.1.0
  &REQUEST=GetFeature
  &...


RESULTTYPE
^^^^^^^^^^

This parameter may be used to specify the kind of result to return.
Available values are:

- ``results``: the default behavior
- ``hits``: returns only a feature count

URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WFS
  &VERSION=1.1.0
  &REQUEST=GetFeature
  &RESULTTYPE=hits
  &...


GEOMETRYNAME
^^^^^^^^^^^^

This parameter can be used to specify the kind of geometry to return
for features. Available values are:

- ``extent``
- ``centroid``
- ``none``

URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WFS
  &VERSION=1.1.0
  &REQUEST=GetFeature
  &GEOMETRYNAME=centroid
  &...



STARTINDEX
^^^^^^^^^^

This parameter is standard in WFS 2.0, but it's an extension for WFS
1.0.0.
Actually, it can be used to skip some features in the result set and
in combination with ``MAXFEATURES``, it provides the ability to page
through results.

URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WFS
  &VERSION=1.1.0
  &REQUEST=GetFeature
  &STARTINDEX=2
  &...
