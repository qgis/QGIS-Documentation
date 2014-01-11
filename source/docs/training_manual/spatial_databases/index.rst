*******************************************************************************
|MOD| Spatial Database Concepts with PostGIS
*******************************************************************************

Spatial Databases allow the storage of the geometries of records inside a
Database as well as providing functionality for querying and retrieving the
records  using these Geometries. In this module we will use PostGIS, an
extension to PostgreSQL, to learn how to setup a spatial database, import data
from shapefiles into the database and make use of the geographic functions that
PostGIS offers.

While working through this section, you may want to keep a copy of the `PostGIS
cheat sheet </static/training_manual/postgis/postgis_cheatsheet.pdf>`_ available
from `Boston GIS user group <http://www.bostongis.com/postgis_quickguide.bqg>`_.
Another useful resource is the `online <http://postgis.net/docs/>`_ PostGIS
documentation.

There are also some more extensive tutorials on PostGIS and Spatial Databases
available from Boundless Geo:

* `Introduction to PostGIS <http://workshops.boundlessgeo.com/postgis-intro/>`_
* `Spatial Database Tips and Tricks
  <http://workshops.boundlessgeo.com/postgis-spatialdbtips/>`_

See also `PostGIS online <http://postgisonline.org/>`_.

.. toctree::
   :maxdepth: 2
   :numbered:

   spatial_functions
   simple_feature_model
   import_export
   spatial_queries
   geometry
