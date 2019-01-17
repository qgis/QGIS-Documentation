.. only:: html

   |updatedisclaimer|

.. _processing_algs:

***********************************
Processing providers and algorithms
***********************************

.. toctree::
     :maxdepth: 2

     qgis/index
     gdal/index
     lidartools/lastools
     taudem/index

.. note::

   Processing algorithms and their parameters (as presented in the user interface)
   are documented here.
   Parameter names (as used in Python scripts) are not yet included in the
   algorithms documentation.
   The ``processing.algorithmHelp`` function in the Python console can be used
   to get these names (example for the QGIS Buffer algorithm)::

       processing.algorithmHelp("native:buffer")

   The available Processing algorithms can be found using the
   ``QgsApplication.processingRegistry().algorithms()`` function::

       for a in QgsApplication.processingRegistry().algorithms():
           print("{}:{}".format(a.provider().id(), a.name()))


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
