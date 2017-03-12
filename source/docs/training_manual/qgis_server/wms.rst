|LS| Serving WMS
----------------

Let's download the `demo data <https://github.com/tudorbarascu/qgis-server-tutorial-data/archive/master.zip>`_
and unzip the files to any directory, e.g. :file:`/home/qgis/projects`.

Let's make a WMS GetCapabilities request in the web browser or with curl::

 http://qgisplatform.demo/cgi-bin/qgis_mapserv.fcgi
 ?SERVICE=WMS
 &VERSION=1.3.0
 &REQUEST=GetCapabilities
 &map=/home/qgis/projects/world.qgs

.. warning::

 This module presents the URLs so that the audience can easily distinguish
 the parameters and parameters values. While the normal format is::

  ...&field1=value1&field2=value2&field3=value3``

 this tutorial uses::

  &field1=value1
  &field2=value2
  &field3=value3

 Pasting them into Mozilla Firefox works properly but other web browsers
 like Chrome may add unwanted spaces between the ``field:parameter`` pairs.
 So, if you encounter this issue you can either use Firefox or modify
 the URLs so that they're in a one line format.

.. note::

 In the above configuration the ``QGIS_PROJECT_FILE`` variable sets the default
 project to :file:``/home/qgis/projects/world.qgs``. However, we made use of
 the **map** parameter to be explicit and to show it can be used to point at
 any project. In the above request, QGIS Server outputs the same response
 if you don't use the **map** parameter.

You can point any WMS client to the GetCapabilities document.

As QGIS is also a :ref:`ogc-wms` you can create a new WMS server connection
with the help of the above GetCapabilities url. See the :ref:`wms-services`
or the  :ref:`ogc-wms-servers` section on how to do it.

By adding the ``countries`` WMS layer to your QGIS project you should get an image
like the one below:

.. only:: html

  **Figure countries WMS layer from QGIS Desktop:**

.. figure:: /static/training_manual/qgis_server/qgis_getmap_request.png
   :align: center

   QGIS Desktop consuming the QGIS Server countries layer WMS service

.. note::

 QGIS Server serves layers that are defined in the :file:`world.qgs` project.
 By opening the project with QGIS you can see there are multiple styles for
 the countries layer. QGIS Server is also aware of this and you can choose
 the style you want in your request.  The ``classified_by_population`` style
 was chosen in the above image.
