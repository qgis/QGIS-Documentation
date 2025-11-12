.. index:: ArcGIS Feature Service, AFS
.. _`label_afs`:

**********************************
Working with ArcGIS REST Server
**********************************

.. only:: html

   .. contents::
      :local:

What are ArcGIS REST Server?
=======================================

ArcGIS REST Server is web services provided by Esri's ArcGIS platform that allow users to access and interact with vector data hosted on ArcGIS servers.
These services enable users to query, edit, and visualize spatial data over the web, making them a powerful tool for sharing geographic information.

An ArcGIS REST Server endpoint typically ends with ``/FeatureServer`` and can contain multiple layers. Each layer represents a dataset that can be loaded into QGIS as a standard vector layer.

Adding an ArcGIS REST Server layer
======================================

To add an ArcGIS REST Server layer:

#. Open the :guilabel:`Data Source Manager`.
#. Select the |addAfsLayer| :guilabel:`ArcGIS REST Server` tab.
#. Click :guilabel:`New` to create a connection.
#. Enter the service URL, for example:

   ``https://services9.arcgis.com/RHVPKKiFTONKtxq3/arcgis/rest/services/NOAA_storm_reports_v1/FeatureServer``

#. (Optional) If required, set the :guilabel:`Referer` or choose an authentication configuration.
#. Click :guilabel:`Connect` to list all available layers from the service.
#. Select one or more layers and click :guilabel:`Add`.

Once added, the AFS layers appear in the :guilabel:`Layers` panel and behave similarly to other remote vector layers. You can identify features, open their attribute table, and configure symbology as needed.

See also :ref:`Using ArcGIS REST Servers <arcgis_rest>`.

Authentication and Referer settings
===================================

Some ArcGIS REST Server requires authentication or restrict access based on an HTTP referer.
QGIS supports both methods through its built-in :ref:`authentication_index` system.
When creating a new ArcGIS REST Server connection, you can:

* Select an existing authentication configuration or create a new one to provide credentials.
* Set a custom :guilabel:`Referer` header if the service enforces referer-based access control.


Automatic symbol conversion
===========================

ArcGIS REST Server symbols are automatically converted to QGIS-native symbology,
allowing QGIS to visually reproduce the same appearance as ArcGIS web maps.

Editing ArcGIS REST Server layers
==================================

ArcGIS REST Server layers can be editable in QGIS if the ArcGIS service has editing enabled and your credentials grant write access.

To edit an ArcGIS REST Server layer:

#. Right-click the layer and select :guilabel:`Toggle Editing`.
#. Use QGIS editing tools to add, modify, or delete features.
#. Click :guilabel:`Save Edits` to apply changes back to the server.

This new feature becomes immediately available once users upgrade to QGIS 3.28 — anyone
with edit permissions for the layers will find that all QGIS editing tools are automatically
enabled and ready to use, with no additional configuration required on the client side.

.. note::
   Editing operations are only available if the remote layer supports them (Create, Update, or Delete capabilities). If these options are disabled on the server, the layer will be read-only in QGIS.

Filtering and querying
=======================

Because of how the Feature Service protocol works, layers can sometimes load and render slowly on the client side.
Applying a SQL filter to restrict the features retrieved from the service
can significantly improve performance, since only the filtered features are requested from the server.
You can apply attribute-based filters to ArcGIS REST Server layers using the :guilabel:`Expression Builder`.
In the browser panel, right-click the ArcGIS REST Server layer and select :guilabel:`Add Filtered Layer to Project` to open the builder dialog.

Refreshing and synchronization
==============================

Because ArcGIS REST Server layers represent live web connections, the displayed features reflect data from the remote server.
To update your map with the latest changes, use :menuselection:`Layer ▶ Refresh` or press :kbd:`F5`.

If multiple users edit the same layer concurrently, it is recommended to refresh your data before performing edits to avoid conflicts.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |3d| image:: /static/common/3d.png
   :width: 1.5em
.. |addAfsLayer| image:: /static/common/mActionAddAfsLayer.png
   :width: 1.5em
.. |afs| image:: /static/common/mIconAfs.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |editMetadata| image:: /static/common/editmetadata.png
   :width: 1.2em
.. |elevationscale| image:: /static/common/elevationscale.png
   :width: 1.5em
.. |mapIdentification| image:: /static/common/mActionMapIdentification.png
   :width: 1.5em
.. |metadata| image:: /static/common/metadata.png
   :width: 1.5em
.. |new3DMap| image:: /static/common/mActionNew3DMap.png
   :width: 1.5em
.. |rendering| image:: /static/common/rendering.png
   :width: 1.5em
.. |setProjection| image:: /static/common/mActionSetProjection.png
   :width: 1.5em
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
.. |system| image:: /static/common/system.png
   :width: 1.5em
.. |unchecked| image:: /static/common/unchecked.png
   :width: 1.3em