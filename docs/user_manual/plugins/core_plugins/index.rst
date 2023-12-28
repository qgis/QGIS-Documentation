.. index::
   single: Core plugins
   seealso: Core plugins; Plugins

.. _core_plugins:

-----------------------
Using QGIS Core Plugins
-----------------------

.. toctree::
   :maxdepth: 1

   plugins_db_manager
   plugins_geometry_checker
   plugins_metasearch
   plugins_offline_editing
   plugins_topology_checker


Below is the list of Core plugins provided with QGIS.
They are not necessarily enabled by default.

======================  ============================  ======================================================  ===============================
Icon                    Plugin                        Description                                             Manual Reference
======================  ============================  ======================================================  ===============================
|dbManager|             DB Manager                    Manage your databases within QGIS                       :ref:`dbmanager`
|geometryChecker|       Geometry Checker              Check and repair errors in vector geometries            :ref:`geometry_checker`
|grassTools|            GRASS 7                       GRASS functionality                                     :ref:`sec_grass`
|grassLogo|             GRASS GIS provider            GRASS GIS Processing functionality                      :ref:`sec_grass`
|metasearch|            MetaSearch Catalog Client     Interact with metadata catalog services (CSW)           :ref:`metasearch`
|offlineEditingCopy|    Offline Editing               Offline editing and synchronizing with database         :ref:`offlinedit`
|geoprocessing|         Processing                    Spatial data processing framework                       :ref:`label_processing`
|topologyChecker|       Topology Checker              Find topological errors in vector layers                :ref:`topology`
======================  ============================  ======================================================  ===============================

.. note::

   To use the Core Plugins |grassTools| GRASS 7, |grassLogo| GRASS GIS provider,
   they have to be configured. Informations can be found :ref:`here <processing.results>`.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |dbManager| image:: /static/common/dbmanager.png
   :width: 1.5em
.. |geometryChecker| image:: /static/common/geometrychecker.png
   :width: 1.5em
.. |geoprocessing| image:: /static/common/geoprocessing.png
   :width: 1.5em
.. |grassLogo| image:: /static/common/grasslogo.png
   :width: 1.5em
.. |grassTools| image:: /static/common/grass_tools.png
   :width: 1.5em
.. |metasearch| image:: /static/common/MetaSearch.png
   :width: 1.5em
.. |offlineEditingCopy| image:: /static/common/offline_editing_copy.png
   :width: 1.5em
.. |topologyChecker| image:: /static/common/mActionTopologyChecker.png
   :width: 1.5em
