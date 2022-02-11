.. index:: Server plugins; Developing, Python; Developing server plugins

.. include:: <isonum.txt>

.. highlight:: python
   :linenothreshold: 5

.. testsetup:: server

    from qgis.core import (
        QgsProject,
        QgsRasterLayer,
        QgsVectorLayer,
        QgsApplication,
        QgsDataSourceUri,
        QgsLayerTreeLayer,
    )

    from qgis.server import (
        QgsServerFilter,
        QgsAccessControlFilter,
        QgsServerCacheFilter,
    )

.. _server_plugins:

****************************
QGIS Server and Python
****************************

.. only:: html

   .. contents::
      :local:
      :depth: 3

Introduction
============

To learn more about QGIS Server, read the :ref:`QGIS-Server-manual`.

QGIS Server is three different things:

1. QGIS Server library: a library that provides an API for creating OGC web services
2. QGIS Server FCGI: a FCGI binary application :file:`qgis_maserv.fcgi` that
   together with a web server implements a set of OGC services (WMS, WFS, WCS etc.)
   and OGC APIs (WFS3/OAPIF)
3. QGIS Development Server: a development server binary application :file:`qgis_mapserver`
   that implements a set of OGC services (WMS, WFS, WCS etc.) and OGC APIs (WFS3/OAPIF)

This chapter of the cookbook focuses on the first topic and by explaining the usage of QGIS Server API
it shows how it is possible to use Python to extend, enhance or customize the server behavior or how to
use the QGIS Server API to embed QGIS server into another application.

There are a few different ways you can alter the behavior of QGIS Server or extend its
capabilities to offer new custom services or APIs, these are the main scenarios you
may face:

* EMBEDDING |rarr| Use QGIS Server API from another Python application
* STANDALONE |rarr| Run QGIS Server as a standalone WSGI/HTTP service
* FILTERS |rarr| Enhance/Customize QGIS Server with filter plugins
* SERVICES |rarr| Add a new *SERVICE*
* OGC APIs |rarr| Add a new *OGC API*

Embedding and standalone applications require using the QGIS Server Python API directly from
another Python script or application. The remaining options are better suited for when
you want to add custom features to a standard QGIS Server binary application (FCGI or
development server): in this case you'll need to write a Python plugin for the server
application and register your custom filters, services or APIs.

Server API basics
=================

The fundamental classes involved in a typical QGIS Server application are:

* :class:`QgsServer <qgis.server.QgsServer>` the server instance
  (typically a single instance for the whole application life)
* :class:`QgsServerRequest <qgis.server.QgsServerRequest>` the request object
  (typically recreated on each request)
* :meth:`QgsServer.handleRequest(request, response) <qgis.server.QgsServer.handleRequest>`
  processes the request and populates the response

The QGIS Server FCGI or development server workflow can be summarized as follows:

.. code-block:: text

    initialize the QgsApplication
    create the QgsServer
    the main server loop waits forever for client requests:
        for each incoming request:
            create a QgsServerRequest request
            create a QgsServerResponse response
            call QgsServer.handleRequest(request, response)
                filter plugins may be executed
            send the output to the client

Inside the :meth:`QgsServer.handleRequest(request, response) <qgis.server.QgsServer.handleRequest>` method
the filter plugins callbacks are called and :class:`QgsServerRequest <qgis.server.QgsServerRequest>` and
:class:`QgsServerResponse <qgis.server.QgsServerResponse>` are made available to the plugins through
the :class:`QgsServerInterface <qgis.server.QgsServerInterface>` class.

.. warning::

    QGIS server classes are not thread safe, you should always use a multiprocessing
    model or containers when building scalable applications based on QGIS Server API.

Standalone or embedding
==================================

For standalone server applications or embedding, you will need
to use the above mentioned server classes directly, wrapping them up
into a web server implementation that manages all the HTTP protocol interactions
with the client.

A minimal example of the QGIS Server API usage (without the HTTP part) follows:

.. this snippet crashes the test runner in the Qt internal
.. method QCoreApplicationPrivate::processCommandLineArguments()

.. code-block:: python

    from qgis.core import QgsApplication
    from qgis.server import *
    app = QgsApplication([], False)

    # Create the server instance, it may be a single one that
    # is reused on multiple requests
    server = QgsServer()

    # Create the request by specifying the full URL and an optional body
    # (for example for POST requests)
    request = QgsBufferServerRequest(
        'http://localhost:8081/?MAP=/qgis-server/projects/helloworld.qgs' +
        '&SERVICE=WMS&REQUEST=GetCapabilities')

    # Create a response objects
    response = QgsBufferServerResponse()

    # Handle the request
    server.handleRequest(request, response)

    print(response.headers())
    print(response.body().data().decode('utf8'))

    app.exitQgis()

Here is a complete standalone application example developed for the continuous integrations
testing on QGIS source code repository, it showcases a wide set of different plugin filters
and authentication schemes (not mean for production because they were developed for testing
purposes only but still interesting for learning): :source:`tests/src/python/qgis_wrapped_server.py`

Server plugins
==============

Server python plugins are loaded once when the QGIS Server application starts
and can be used to register filters, services or APIs.

The structure of a server plugin is very similar to their desktop counterpart,
a :class:`QgsServerInterface <qgis.server.QgsServerInterface>` object is made available to
the plugins and the plugins can register one or more custom filters, services or APIs
to the corresponding registry by using one of the methods exposed by the server interface.

Server filter plugins
---------------------

Filters come in three different flavors and they can be instanciated by subclassing
one of the classes below and by calling the corresponding method of
:class:`QgsServerInterface <qgis.server.QgsServerInterface>`:

.. list-table::
   :widths: auto

   * - Filter Type
     - Base Class
     - QgsServerInterface registration
   * - I/O 
     - :class:`QgsServerFilter <qgis.server.QgsServerFilter>`
     - :meth:`registerFilter() <qgis.server.QgsServerInterface.registerFilter>`
   * - Access Control
     - :class:`QgsAccessControlFilter <qgis.server.QgsAccessControlFilter>`
     - :meth:`registerAccessControl() <qgis.server.QgsServerInterface.registerAccessControl>`
   * - Cache
     - :class:`QgsServerCacheFilter <qgis.server.QgsServerCacheFilter>`
     - :meth:`registerServerCache() <qgis.server.QgsServerInterface.registerServerCache>`

I/O filters
...........

I/O filters can modify the server input and output (the request and the response)
of the core services (WMS, WFS etc.) allowing to do any kind of manipulation
of the services workflow. It is possible for example to restrict the access to
selected layers, to inject an XSL stylesheet to the XML response, to add a
watermark to a generated WMS image and so on.

From this point, you might find useful a quick look to the
:pyqgis:`server plugins API docs <server>`.

Each filter should implement at least one of three callbacks:

* :meth:`onRequestReady() <qgis.server.QgsServerFilter.onRequestReady>`
* :meth:`onResponseComplete() <qgis.server.QgsServerFilter.onResponseComplete>`
* :meth:`onSendResponse() <qgis.server.QgsServerFilter.onSendResponse>`

All filters have access to the request/response object
(:class:`QgsRequestHandler <qgis.server.QgsRequestHandler>`)
and can manipulate all its properties (input/output) and
raise exceptions (while in a quite particular way as we’ll see below).

All these methods return a boolean value indicating if the call should be propagated to the subsequent
filters. If one of these method returns :const:`False` then the chain stop, otherwise the call will propagate
to the next filter. 

Here is the pseudo code showing how the server handles a typical request and when the
filter’s callbacks are called:


.. code-block:: text

    for each incoming request:
        create GET/POST request handler
        pass request to an instance of QgsServerInterface
        call onRequestReady filters

        if there is not a response:
            if SERVICE is WMS/WFS/WCS:
                create WMS/WFS/WCS service
                call service’s executeRequest
                    possibly call onSendResponse for each chunk of bytes
                    sent to the client by a streaming services (WFS)
            call onResponseComplete
        request handler sends the response to the client

The following paragraphs describe the available callbacks in details.

onRequestReady
^^^^^^^^^^^^^^

This is called when the request is ready: incoming URL and data have been parsed
and before entering the core services (WMS, WFS etc.) switch, this is the point
where you can manipulate the input and perform actions like:

* authentication/authorization
* redirects
* add/remove certain parameters (typenames for example)
* raise exceptions

You could even substitute a core service completely by changing **SERVICE**
parameter and hence bypassing the core service completely (not that this make
much sense though).

onSendResponse
^^^^^^^^^^^^^^

This is called whenever any partial output is flushed from response buffer (i.e to **FCGI** ``stdout`` 
if the fcgi server is used) and from there, to the client. 
This occurs when huge content is streamed (like WFS GetFeature). In this case
:meth:`onSendResponse() <qgis.server.QgsServerFilter.onSendResponse>` may be called multiple times.

Note that if the response is not streamed, then :meth:`onSendResponse() <qgis.server.QgsServerFilter.onSendResponse>` will not be called at all. 

In all case, the last (or unique) chunk will be sent to client after a call to
:meth:`onResponseComplete() <qgis.server.QgsServerFilter.onResponseComplete>`.

Returning :const:`False` will prevent flushing of data to the client. This is desirable when a plugin
wants to collect all chunks from a response and examine or change the response in
:meth:`onResponseComplete() <qgis.server.QgsServerFilter.onResponseComplete>`.


onResponseComplete
^^^^^^^^^^^^^^^^^^

This is called once when core services (if hit) finish their process and the
request is ready to be sent to the client.
As discussed above, this method will be called before the last (or unique) chunk of
data is sent to the client. 
For streaming services, multiple calls to :meth:`onSendResponse() <qgis.server.QgsServerFilter.onSendResponse>` might have been called.

:meth:`onResponseComplete() <qgis.server.QgsServerFilter.onResponseComplete>` is the
ideal place to provide new services implementation
(WPS or custom services) and to perform direct manipulation of the output coming
from core services (for example to add a watermark upon a WMS image).

Note that returning :const:`False` will prevent the next plugins to execute
:meth:`onResponseComplete() <qgis.server.QgsServerFilter.onResponseComplete>`
but, in any case, prevent response to be sent to the client.


Raising exceptions from a plugin
................................

Some work has still to be done on this topic: the current implementation can
distinguish between handled and unhandled exceptions by setting a
:class:`QgsRequestHandler <qgis.server.QgsRequestHandler>` property to an
instance of QgsMapServiceException,
this way the main C++ code can catch handled python exceptions and ignore
unhandled exceptions (or better: log them).

This approach basically works but it is not very "pythonic": a better approach
would be to raise exceptions from python code and see them bubbling up into C++
loop for being handled there.

.. index:: server plugins; metadata.txt, metadata, metadata.txt

Writing a server plugin
.......................

A server plugin is a standard QGIS Python plugin as described in
:ref:`developing_plugins`, that just provides an additional (or alternative)
interface: a typical QGIS desktop plugin has access to QGIS application
through the :class:`QgisInterface <qgis.gui.QgisInterface>` instance, a server
plugin has only access to a :class:`QgsServerInterface <qgis.server.QgsServerInterface>`
when it is executed within the QGIS Server application context.

To make QGIS Server aware that a plugin has a server interface, a special
metadata entry is needed (in :file:`metadata.txt`)::

    server=True

.. important::

    Only plugins that have the ``server=True`` metadata set will be loaded and executed by QGIS Server.

The example plugin discussed here (with many more) is available
on github at https://github.com/elpaso/qgis3-server-vagrant/tree/master/resources/web/plugins,
a few server plugins are also published in the official `QGIS plugins repository <https://plugins.qgis.org/plugins/server>`_.

Plugin files
............

Here's the directory structure of our example server plugin.

::

  PYTHON_PLUGINS_PATH/
    HelloServer/
      __init__.py    --> *required*
      HelloServer.py  --> *required*
      metadata.txt   --> *required*

.. index:: Plugins; metadata.txt, Metadata

__init__.py
^^^^^^^^^^^

This file is required by Python's import system. Also, QGIS Server requires that this
file contains a :func:`serverClassFactory()` function, which is called when the
plugin gets loaded into QGIS Server when the server starts. It receives reference to instance of
:class:`QgsServerInterface <qgis.server.QgsServerInterface>` and must return instance
of your plugin's class.
This is how the example plugin :file:`__init__.py` looks like:

.. testcode:: server

    def serverClassFactory(serverIface):
        from .HelloServer import HelloServerServer
        return HelloServerServer(serverIface)


HelloServer.py
^^^^^^^^^^^^^^

This is where the magic happens and this is how magic looks like:
(e.g. :file:`HelloServer.py`)

A server plugin typically consists in one or more callbacks packed into instances
of a :class:`QgsServerFilter <qgis.server.QgsServerFilter>`.

Each :class:`QgsServerFilter <qgis.server.QgsServerFilter>` implements one or more
of the following callbacks:

* :meth:`onRequestReady() <qgis.server.QgsServerFilter.onRequestReady>`
* :meth:`onResponseComplete() <qgis.server.QgsServerFilter.onResponseComplete>`
* :meth:`onSendResponse() <qgis.server.QgsServerFilter.onSendResponse>`

The following example implements a minimal filter which prints *HelloServer!*
in case the **SERVICE** parameter equals to “HELLO”:

.. testcode:: server

    class HelloFilter(QgsServerFilter):

        def __init__(self, serverIface):
            super().__init__(serverIface)

        def onRequestReady(self) -> bool:
            QgsMessageLog.logMessage("HelloFilter.onRequestReady")
            return True

        def onSendResponse(self) -> bool:
            QgsMessageLog.logMessage("HelloFilter.onSendResponse")
            return True

        def onResponseComplete(self) -> bool:
            QgsMessageLog.logMessage("HelloFilter.onResponseComplete")
            request = self.serverInterface().requestHandler()
            params = request.parameterMap()
            if params.get('SERVICE', '').upper() == 'HELLO':
                request.clear()
                request.setResponseHeader('Content-type', 'text/plain')
                # Note that the content is of type "bytes"
                request.appendBody(b'HelloServer!')
            return True

The filters must be registered into the **serverIface** as in the following example:

.. testcode:: server

    class HelloServerServer:
        def __init__(self, serverIface):
            serverIface.registerFilter(HelloFilter(serverIface), 100)

The second parameter of
:meth:`registerFilter() <qgis.server.QgsServerInterface.registerFilter>` sets a priority which
defines the order for the callbacks with the same name (the lower priority is
invoked first).

By using the three callbacks, plugins can manipulate the input and/or the output
of the server in many different ways. In every moment, the plugin instance has
access to the :class:`QgsRequestHandler <qgis.server.QgsRequestHandler>` through
the :class:`QgsServerInterface <qgis.server.QgsServerInterface>`.
The :class:`QgsRequestHandler <qgis.server.QgsRequestHandler>` class has plenty of
methods that can be used to alter
the input parameters before entering the core processing of the server (by using
:func:`requestReady`) or after the request has been processed by the core services
(by using :func:`sendResponse`).

The following examples cover some common use cases:

Modifying the input
^^^^^^^^^^^^^^^^^^^

The example plugin contains a test example that changes input parameters coming
from the query string, in this example a new parameter is injected into the
(already parsed) ``parameterMap``, this parameter is then visible by core services
(WMS etc.), at the end of core services processing we check that the parameter
is still there:

.. testcode:: server

    class ParamsFilter(QgsServerFilter):

        def __init__(self, serverIface):
            super(ParamsFilter, self).__init__(serverIface)

        def onRequestReady(self) -> bool:
            request = self.serverInterface().requestHandler()
            params = request.parameterMap( )
            request.setParameter('TEST_NEW_PARAM', 'ParamsFilter')
            return True

        def onResponseComplete(self) -> bool:
            request = self.serverInterface().requestHandler()
            params = request.parameterMap( )
            if params.get('TEST_NEW_PARAM') == 'ParamsFilter':
                QgsMessageLog.logMessage("SUCCESS - ParamsFilter.onResponseComplete")
            else:
                QgsMessageLog.logMessage("FAIL    - ParamsFilter.onResponseComplete")
            return True

This is an extract of what you see in the log file:

.. code-block:: bash
   :emphasize-lines: 6

    src/core/qgsmessagelog.cpp: 45: (logMessage) [0ms] 2014-12-12T12:39:29 plugin[0] HelloServerServer - loading filter ParamsFilter
    src/core/qgsmessagelog.cpp: 45: (logMessage) [1ms] 2014-12-12T12:39:29 Server[0] Server plugin HelloServer loaded!
    src/core/qgsmessagelog.cpp: 45: (logMessage) [0ms] 2014-12-12T12:39:29 Server[0] Server python plugins loaded
    src/mapserver/qgshttprequesthandler.cpp: 547: (requestStringToParameterMap) [1ms] inserting pair SERVICE // HELLO into the parameter map
    src/mapserver/qgsserverfilter.cpp: 42: (onRequestReady) [0ms] QgsServerFilter plugin default onRequestReady called
    src/core/qgsmessagelog.cpp: 45: (logMessage) [0ms] 2014-12-12T12:39:29 plugin[0] SUCCESS - ParamsFilter.onResponseComplete

On the highlighted line the “SUCCESS” string indicates that the plugin passed the test.

The same technique can be exploited to use a custom service instead of a core
one: you could for example skip a **WFS** **SERVICE** request or any other core
request just by changing the **SERVICE** parameter to something different and
the core service will be skipped. Then you can inject your custom results into
the output and send them to the client (this is explained below).

.. tip::

    If you really want to implement a custom service it is recommended to subclass
    :class:`QgsService <qgis.server.QgsService>` and register your service on
    :meth:`registerFilter() <qgis.server.QgsServerInterface.serviceRegistry>` by
    calling its :meth:`registerService(service) <qgis.server.QgsServiceRegistry.registerService>`

Modifying or replacing the output
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The watermark filter example shows how to replace the WMS output with a new
image obtained by adding a watermark image on the top of the WMS image generated
by the WMS core service:

.. testcode:: server

    from qgis.server import *
    from qgis.PyQt.QtCore import *
    from qgis.PyQt.QtGui import *

    class WatermarkFilter(QgsServerFilter):

        def __init__(self, serverIface):
            super().__init__(serverIface)

        def onResponseComplete(self) -> bool:
            request = self.serverInterface().requestHandler()
            params = request.parameterMap( )
            # Do some checks
            if (params.get('SERVICE').upper() == 'WMS' \
                    and params.get('REQUEST').upper() == 'GETMAP' \
                    and not request.exceptionRaised() ):
                QgsMessageLog.logMessage("WatermarkFilter.onResponseComplete: image ready %s" % request.parameter("FORMAT"))
                # Get the image
                img = QImage()
                img.loadFromData(request.body())
                # Adds the watermark
                watermark = QImage(os.path.join(os.path.dirname(__file__), 'media/watermark.png'))
                p = QPainter(img)
                p.drawImage(QRect( 20, 20, 40, 40), watermark)
                p.end()
                ba = QByteArray()
                buffer = QBuffer(ba)
                buffer.open(QIODevice.WriteOnly)
                img.save(buffer, "PNG" if "png" in request.parameter("FORMAT") else "JPG")
                # Set the body
                request.clearBody()
                request.appendBody(ba)
            return True

In this example the **SERVICE** parameter value is checked and if the incoming
request is a **WMS** **GETMAP** and no exceptions have been set by a previously
executed plugin or by the core service (WMS in this case), the WMS generated
image is retrieved from the output buffer and the watermark image is added.
The final step is to clear the output buffer and replace it with the newly
generated image. Please note that in a real-world situation we should also check
for the requested image type instead of supporting PNG or JPG only.

Access control filters
......................

Access control filters gives the developer a fine-grained control over which layers,
features and attributes can be accessed, the following callbacks can be implemented
in an access control filter:

* :meth:`layerFilterExpression(layer) <qgis.server.QgsAccessControlFilter.layerFilterExpression>`
* :meth:`layerFilterSubsetString(layer) <qgis.server.QgsAccessControlFilter.layerFilterSubsetString>`
* :meth:`layerPermissions(layer) <qgis.server.QgsAccessControlFilter.layerPermissions>`
* :meth:`authorizedLayerAttributes(layer, attributes) <qgis.server.QgsAccessControlFilter.authorizedLayerAttributes>`
* :meth:`allowToEdit(layer, feature) <qgis.server.QgsAccessControlFilter.allowToEdit>`
* :meth:`cacheKey() <qgis.server.QgsAccessControlFilter.cacheKey>`

Plugin files
^^^^^^^^^^^^

Here's the directory structure of our example plugin:

.. code-block:: text

  PYTHON_PLUGINS_PATH/
    MyAccessControl/
      __init__.py    --> *required*
      AccessControl.py  --> *required*
      metadata.txt   --> *required*


__init__.py
^^^^^^^^^^^

This file is required by Python's import system. As for all QGIS server plugins, this
file contains a :func:`serverClassFactory()` function, which is called when the
plugin gets loaded into QGIS Server at startup. It receives a reference to an instance of
:class:`QgsServerInterface <qgis.server.QgsServerInterface>` and must return an instance
of your plugin's class.
This is how the example plugin :file:`__init__.py` looks like:


.. testcode:: server

    def serverClassFactory(serverIface):
        from MyAccessControl.AccessControl import AccessControlServer
        return AccessControlServer(serverIface)


AccessControl.py
^^^^^^^^^^^^^^^^

.. testcode:: server

   class AccessControlFilter(QgsAccessControlFilter):

       def __init__(self, server_iface):
           super().__init__(server_iface)

       def layerFilterExpression(self, layer):
           """ Return an additional expression filter """
           return super().layerFilterExpression(layer)

       def layerFilterSubsetString(self, layer):
           """ Return an additional subset string (typically SQL) filter """
           return super().layerFilterSubsetString(layer)

       def layerPermissions(self, layer):
           """ Return the layer rights """
           return super().layerPermissions(layer)

       def authorizedLayerAttributes(self, layer, attributes):
           """ Return the authorised layer attributes """
           return super().authorizedLayerAttributes(layer, attributes)

       def allowToEdit(self, layer, feature):
           """ Are we authorised to modify the following geometry """
           return super().allowToEdit(layer, feature)

       def cacheKey(self):
           return super().cacheKey()

   class AccessControlServer:

      def __init__(self, serverIface):
         """ Register AccessControlFilter """
         serverIface.registerAccessControl(AccessControlFilter(serverIface), 100)


This example gives a full access for everybody.

It's the role of the plugin to know who is logged on.

On all those methods we have the layer on argument to be able to customise
the restriction per layer.


layerFilterExpression
^^^^^^^^^^^^^^^^^^^^^

Used to add an Expression to limit the results, e.g.:

.. testcode:: server

   def layerFilterExpression(self, layer):
       return "$role = 'user'"

To limit on feature where the attribute role is equals to "user".


layerFilterSubsetString
^^^^^^^^^^^^^^^^^^^^^^^

Same than the previous but use the ``SubsetString`` (executed in the database)

.. testcode:: server

   def layerFilterSubsetString(self, layer):
       return "role = 'user'"

To limit on feature where the attribute role is equals to "user".


layerPermissions
^^^^^^^^^^^^^^^^

Limit the access to the layer.

Return an object of type :meth:`LayerPermissions()
<qgis.server.QgsAccessControlFilter.layerPermissions>`, which has the properties:

* :attr:`canRead <qgis.server.QgsAccessControlFilter.LayerPermissions.canRead>`
  to see it in the ``GetCapabilities`` and have read access.
* :attr:`canInsert <qgis.server.QgsAccessControlFilter.LayerPermissions.canInsert>`
  to be able to insert a new feature.
* :attr:`canUpdate <qgis.server.QgsAccessControlFilter.LayerPermissions.canUpdate>`
  to be able to update a feature.
* :attr:`canDelete <qgis.server.QgsAccessControlFilter.LayerPermissions.canDelete>`
  to be able to delete a feature.

Example:

.. testcode:: server

   def layerPermissions(self, layer):
       rights = QgsAccessControlFilter.LayerPermissions()
       rights.canRead = True
       rights.canInsert = rights.canUpdate = rights.canDelete = False
       return rights

To limit everything on read only access.


authorizedLayerAttributes
^^^^^^^^^^^^^^^^^^^^^^^^^

Used to limit the visibility of a specific subset of attribute.

The argument attribute return the current set of visible attributes.

Example:

.. testcode:: server

   def authorizedLayerAttributes(self, layer, attributes):
       return [a for a in attributes if a != "role"]

To hide the 'role' attribute.


allowToEdit
^^^^^^^^^^^

This is used to limit the editing on a subset of features.

It is used in the ``WFS-Transaction`` protocol.

Example:

.. testcode:: server


   def allowToEdit(self, layer, feature):
       return feature.attribute('role') == 'user'

To be able to edit only feature that has the attribute role
with the value user.


cacheKey
^^^^^^^^

QGIS server maintain a cache of the capabilities then to have a cache
per role you can return the role in this method. Or return ``None``
to completely disable the cache.


Custom services
---------------------

In QGIS Server, core services such as WMS, WFS and WCS are implemented as subclasses of
:class:`QgsService <qgis.server.QgsService>`.

To implemented a new service that will be executed when the query string parameter ``SERVICE``
matches the service name, you can implemented your own :class:`QgsService <qgis.server.QgsService>`
and register your service on the :meth:`serviceRegistry() <qgis.server.QgsServerInterface.serviceRegistry>` by
calling its :meth:`registerService(service) <qgis.server.QgsServiceRegistry.registerService>`.

Here is an example of a custom service named CUSTOM:

.. testcode:: server

    from qgis.server import QgsService
    from qgis.core import QgsMessageLog

    class CustomServiceService(QgsService):

        def __init__(self):
            QgsService.__init__(self)

        def name(self):
            return "CUSTOM"

        def version(self):
            return "1.0.0"

        def executeRequest(self, request, response, project):
            response.setStatusCode(200)
            QgsMessageLog.logMessage('Custom service executeRequest')
            response.write("Custom service executeRequest")


    class CustomService():

        def __init__(self, serverIface):
            serverIface.serviceRegistry().registerService(CustomServiceService())


Custom APIs
---------------------

In QGIS Server, core OGC APIs such OAPIF (aka WFS3) are implemented as collections of
:class:`QgsServerOgcApiHandler <qgis.server.QgsServerOgcApiHandler>` subclasses that
are registered to an instance of :class:`QgsServerOgcApi <qgis.server.QgsServerOgcApi>`
(or it's parent class :class:`QgsServerApi <qgis.server.QgsServerApi>`).

To implemented a new API that will be executed when the url path matches
a certain URL, you can implemented your own :class:`QgsServerOgcApiHandler <qgis.server.QgsServerOgcApiHandler>`
instances, add them to an :class:`QgsServerOgcApi <qgis.server.QgsServerOgcApi>` and register
the API on the :meth:`serviceRegistry() <qgis.server.QgsServerInterface.serviceRegistry>` by
calling its :meth:`registerApi(api) <qgis.server.QgsServiceRegistry.registerApi>`.

Here is an example of a custom API that will be executed when the URL contains ``/customapi``:

.. testcode:: server

    import json
    import os

    from qgis.PyQt.QtCore import QBuffer, QIODevice, QTextStream, QRegularExpression
    from qgis.server import (
        QgsServiceRegistry,
        QgsService,
        QgsServerFilter,
        QgsServerOgcApi,
        QgsServerQueryStringParameter,
        QgsServerOgcApiHandler,
    )

    from qgis.core import (
        QgsMessageLog,
        QgsJsonExporter,
        QgsCircle,
        QgsFeature,
        QgsPoint,
        QgsGeometry,
    )


    class CustomApiHandler(QgsServerOgcApiHandler):

        def __init__(self):
            super(CustomApiHandler, self).__init__()
            self.setContentTypes([QgsServerOgcApi.HTML, QgsServerOgcApi.JSON])

        def path(self):
            return QRegularExpression("/customapi")

        def operationId(self):
            return "CustomApiXYCircle"

        def summary(self):
            return "Creates a circle around a point"

        def description(self):
            return "Creates a circle around a point"

        def linkTitle(self):
            return "Custom Api XY Circle"

        def linkType(self):
            return QgsServerOgcApi.data

        def handleRequest(self, context):
            """Simple Circle"""

            values = self.values(context)
            x = values['x']
            y = values['y']
            r = values['r']
            f = QgsFeature()
            f.setAttributes([x, y, r])
            f.setGeometry(QgsCircle(QgsPoint(x, y), r).toCircularString())
            exporter = QgsJsonExporter()
            self.write(json.loads(exporter.exportFeature(f)), context)

        def templatePath(self, context):
            # The template path is used to serve HTML content
            return os.path.join(os.path.dirname(__file__), 'circle.html')

        def parameters(self, context):
            return [QgsServerQueryStringParameter('x', True, QgsServerQueryStringParameter.Type.Double, 'X coordinate'),
                    QgsServerQueryStringParameter(
                        'y', True, QgsServerQueryStringParameter.Type.Double, 'Y coordinate'),
                    QgsServerQueryStringParameter('r', True, QgsServerQueryStringParameter.Type.Double, 'radius')]


    class CustomApi():

        def __init__(self, serverIface):
            api = QgsServerOgcApi(serverIface, '/customapi',
                                'custom api', 'a custom api', '1.1')
            handler = CustomApiHandler()
            api.registerHandler(handler)
            serverIface.serviceRegistry().registerApi(api)


