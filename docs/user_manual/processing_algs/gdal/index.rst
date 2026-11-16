.. _gdal_algorithms:

***********************
GDAL algorithm provider
***********************

`GDAL <https://gdal.org/en/latest>`_ (Geospatial Data Abstraction Library) is a translator
library for raster and vector geospatial data formats.
Algorithms in the Processing Framework are derived from
the `GDAL raster programs <https://gdal.org/en/latest/programs/index.html#raster-programs>`_
and `GDAL vector programs <https://gdal.org/en/latest/programs/index.html#vector-programs>`_.
To make them available, enable the core :guilabel:`GDAL Processing Provider` plugin
in :menuselection:`Plugins -->` |showPluginManager| :menuselection:`Manage and Install Plugins`.

.. toctree::
     :maxdepth: 2

     miscellaneous
     rasteranalysis
     rasterconversion
     rasterextraction
     rastermiscellaneous
     rasterprojections
     vectorconversion
     vectorgeoprocessing
     vectormiscellaneous


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |showPluginManager| image:: /static/common/mActionShowPluginManager.png
   :width: 1.5em
