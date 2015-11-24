.. index:: server plugins; developing, Python; developing server plugins

.. _server_plugins:

****************************
QGIS Server Python Plugins
****************************

Python plugins can also run on |qg| Server (see: :ref:`label_qgisserver`): by using the
*server interface* (:class:`QgsServerInterface`) a Python plugin running on the
server can alter the behavior of existing core services (**WMS**, **WFS** etc.).

With the *server filter interface* (:class:`QgsServerFilter`) we can change the input
parameters, change the generated output or even by providing new services.

With the *access control interface* (:class:`QgsAccessControlFilter`) we can apply
some access restriction per requests.


Server Filter Plugins architecture
===========================================

Server python plugins are loaded once when the FCGI application starts. They
register one or more :class:`QgsServerFilter` (from this point, you might
find useful a quick look to the `server plugins API docs <http://qgis.org/api/group__server.html>`_).
Each filter should implement at least one of three callbacks:

* :func:`requestReady()`
* :func:`responseComplete()`
* :func:`sendResponse()`

All filters have access to the request/response object (:class:`QgsRequestHandler`)
and can manipulate all its properties (input/output) and
raise exceptions (while in a quite particular way as we’ll see below).

Here is a pseudo code showing a typical server session and when the filter’s callbacks are called:

* Get the incoming request
    * create GET/POST/SOAP request handler
    * pass request to an instance of :class:`QgsServerInterface`
    * call plugins :func:`requestReady` filters
    * if there is not a response
        * if SERVICE is WMS/WFS/WCS
            * create WMS/WFS/WCS server
                * call server’s :func:`executeRequest` and possibily call :func:`sendResponse` plugin filters when streaming output or store the byte stream output and content type in the request handler
        * call plugins :func:`responseComplete` filters
    * call plugins :func:`sendResponse` filters
    * request handler output the response


The following paragraphs describe the available callbacks in details.

requestReady
---------------------------------------

This is called when the request is ready: incoming URL and data have been parsed and before entering the core services (WMS, WFS etc.) switch, this is the point where you can manipulate the input and perform actions like:

* authentication/authorization
* redirects
* add/remove certain parameters (typenames for example)
* raise exceptions

You could even substitute a core service completely by changing **SERVICE** parameter and hence bypassing the core service completely (not that this make much sense though).


sendResponse
---------------------------------------


This is called whenever output is sent to **FCGI** `stdout` (and from there, to the client), this is normally done after core services have finished their process and after responseComplete hook was called, but in a few cases XML can become so huge that a streaming XML implementation was needed (WFS GetFeature is one of them), in this case, :func:`sendResponse` is called multiple times before the response is complete (and before :func:`responseComplete` is called). The obvious consequence is that :func:`sendResponse` is normally called once but might be exceptionally called multiple times and in that case (and only in that case) it is also called before :func:`responseComplete`.

:func:`sendResponse` is the best place for direct manipulation of core service’s output and while :func:`responseComplete` is typically also an option, :func:`sendResponse` is the only viable option  in case of streaming services.

responseComplete
---------------------------------------

This is called once when core services (if hit) finish their process and the request is ready to be sent to the client. As discussed above, this is  normally called before :func:`sendResponse` except for streaming services (or other plugin filters) that might have called :func:`sendResponse` earlier.

:func:`responseComplete` is the ideal place to provide new services implementation (WPS or custom services) and to perform direct manipulation of the output coming from core services (for example to add a watermark upon a WMS image).

Raising exception from a plugin
=======================================

Some work has still to be done on this topic: the current implementation can distinguish between handled and unhandled exceptions by setting a :class:`QgsRequestHandler` property to an instance of :class:`QgsMapServiceException`, this way the main C++ code can catch handled python exceptions and ignore unhandled exceptions (or better: log them).

This approach basically works but it is not very "pythonic": a better approach would be to raise exceptions from python code and see them bubbling up into C++ loop for being handled there.


.. index:: server plugins; metadata.txt, metadata, metadata.txt

Writing a server plugin
=======================

A server plugins is just a standard |qg| Python plugin as described in
:ref:`developing_plugins`, that just provides an additional (or alternative)
interface: a typical |qg| desktop plugin has access to |qg| application
through the :class:`QgisInterface` instance, a server plugin has also
access to a :class:`QgsServerInterface`.

To tell |qg| Server that a plugin has a server interface, a special
metadata entry is needed (in `metadata.txt`) ::

    server=True

The example plugin discussed here (with many more example filters) is available
on github: `QGIS HelloServer Example Plugin <https://github.com/elpaso/qgis-helloserver>`_

Plugin files
------------

Here's the directory structure of our example server plugin

::

  PYTHON_PLUGINS_PATH/
    HelloServer/
      __init__.py    --> *required*
      HelloServer.py  --> *required*
      metadata.txt   --> *required*

.. index:: plugins; metadata.txt, metadata, metadata.txt

__init__.py
-----------
This file is required by Python's import system. Also, |qg| Server requires that this
file contains a :func:`serverClassFactory()` function, which is called when the
plugin gets loaded into |qg| Server when the server starts. It receives reference to instance of
:class:`QgsServerInterface` and must return instance of your plugin's class.
This is how the example plugin `__init__.py` looks like::

    # -*- coding: utf-8 -*-

    def serverClassFactory(serverIface):
        from HelloServer import HelloServerServer
        return HelloServerServer(serverIface)



HelloServer.py
---------------

This is where the magic happens and this is how magic looks like:
(e.g. :file:`HelloServer.py`)


A server plugin typically consists in one or more callbacks packed into objects called QgsServerFilter.

Each :class:`QgsServerFilter` implements one or more of the following callbacks:

* :func:`requestReady()`
* :func:`responseComplete()`
* :func:`sendResponse()`

The following example implements a minimal filter which prints *HelloServer!*
in case the **SERVICE** parameter equals to “HELLO”::

    from qgis.server import *
    from qgis.core import *

    class HelloFilter(QgsServerFilter):

        def __init__(self, serverIface):
            super(HelloFilter, self).__init__(serverIface)

        def responseComplete(self):
            request = self.serverInterface().requestHandler()
            params = request.parameterMap()
            if params.get('SERVICE', '').upper() == 'HELLO':
                request.clearHeaders()
                request.setHeader('Content-type', 'text/plain')
                request.clearBody()
                request.appendBody('HelloServer!')


The filters must be registered into the **serverIface** as in the following example::

    class HelloServerServer:
        def __init__(self, serverIface):
            # Save reference to the QGIS server interface
            self.serverIface = serverIface
            serverIface.registerFilter( HelloFilter, 100 )

The second parameter of :func:`registerFilter` allows to set a priority which defines the order for the callbacks with the same name (the lower priority is invoked first).

By using the three callbacks, plugins can manipulate the input and/or the output of the server in many different ways. In every moment, the plugin instance has access to the :class:`QgsRequestHandler` through the :class:`QgsServerInterface`, the :class:`QgsRequestHandler` has plenty of methods that can be used to alter the input parameters before entering the core processing of the server (by using :func:`requestReady`) or after the request has been processed by the core services (by using :func:`sendResponse`).

The following examples cover some common use cases:

Modifying the input
-------------------------------------

The example plugin contains a test example that changes input parameters coming from the query string, in this example a new parameter is injected into the (already parsed) `parameterMap`, this parameter is then visible by core services (WMS etc.), at the end of core services processing we check that the parameter is still there::

    from qgis.server import *
    from qgis.core import *

    class ParamsFilter(QgsServerFilter):

        def __init__(self, serverIface):
            super(ParamsFilter, self).__init__(serverIface)

        def requestReady(self):
            request = self.serverInterface().requestHandler()
            params = request.parameterMap( )
            request.setParameter('TEST_NEW_PARAM', 'ParamsFilter')

        def responseComplete(self):
            request = self.serverInterface().requestHandler()
            params = request.parameterMap( )
            if params.get('TEST_NEW_PARAM') == 'ParamsFilter':
                QgsMessageLog.logMessage("SUCCESS - ParamsFilter.responseComplete", 'plugin', QgsMessageLog.INFO)
            else:
                QgsMessageLog.logMessage("FAIL    - ParamsFilter.responseComplete", 'plugin', QgsMessageLog.CRITICAL)

This is an extract of what you see in the log file::

    src/core/qgsmessagelog.cpp: 45: (logMessage) [0ms] 2014-12-12T12:39:29 plugin[0] HelloServerServer - loading filter ParamsFilter
    src/core/qgsmessagelog.cpp: 45: (logMessage) [1ms] 2014-12-12T12:39:29 Server[0] Server plugin HelloServer loaded!
    src/core/qgsmessagelog.cpp: 45: (logMessage) [0ms] 2014-12-12T12:39:29 Server[0] Server python plugins loaded
    src/mapserver/qgsgetrequesthandler.cpp: 35: (parseInput) [0ms] query string is: SERVICE=HELLO&request=GetOutput
    src/mapserver/qgshttprequesthandler.cpp: 547: (requestStringToParameterMap) [1ms] inserting pair SERVICE // HELLO into the parameter map
    src/mapserver/qgshttprequesthandler.cpp: 547: (requestStringToParameterMap) [0ms] inserting pair REQUEST // GetOutput into the parameter map
    src/mapserver/qgsserverfilter.cpp: 42: (requestReady) [0ms] QgsServerFilter plugin default requestReady called
    src/core/qgsmessagelog.cpp: 45: (logMessage) [0ms] 2014-12-12T12:39:29 plugin[0] HelloFilter.requestReady
    src/mapserver/qgis_map_serv.cpp: 235: (configPath) [0ms] Using default configuration file path: /home/xxx/apps/bin/admin.sld
    src/mapserver/qgshttprequesthandler.cpp: 49: (setHttpResponse) [0ms] Checking byte array is ok to set...
    src/mapserver/qgshttprequesthandler.cpp: 59: (setHttpResponse) [0ms] Byte array looks good, setting response...
    src/core/qgsmessagelog.cpp: 45: (logMessage) [0ms] 2014-12-12T12:39:29 plugin[0] HelloFilter.responseComplete
    src/core/qgsmessagelog.cpp: 45: (logMessage) [0ms] 2014-12-12T12:39:29 plugin[0] SUCCESS - ParamsFilter.responseComplete
    src/core/qgsmessagelog.cpp: 45: (logMessage) [0ms] 2014-12-12T12:39:29 plugin[0] RemoteConsoleFilter.responseComplete
    src/mapserver/qgshttprequesthandler.cpp: 158: (sendResponse) [0ms] Sending HTTP response
    src/core/qgsmessagelog.cpp: 45: (logMessage) [0ms] 2014-12-12T12:39:29 plugin[0] HelloFilter.sendResponse

On line 13 the “SUCCESS” string indicates that the plugin passed the test.

The same technique can be exploited to use a custom service instead of a core one: you could for example skip a **WFS** **SERVICE** request or any other core request just by changing the **SERVICE** parameter to something different and the core service will be skipped, then you can inject your custom results into the output and send them to the client (this is explained here below).


Modifying or replacing the output
-------------------------------------------------

The watermark filter example shows how to replace the WMS output with a new image obtained by adding a watermark image on the top of the WMS image generated by the WMS core service::

    import os

    from qgis.server import *
    from qgis.core import *
    from PyQt4.QtCore import *
    from PyQt4.QtGui import *


    class WatermarkFilter(QgsServerFilter):

        def __init__(self, serverIface):
            super(WatermarkFilter, self).__init__(serverIface)

        def responseComplete(self):
            request = self.serverInterface().requestHandler()
            params = request.parameterMap( )
            # Do some checks
            if (request.parameter('SERVICE').upper() == 'WMS' \
                    and request.parameter('REQUEST').upper() == 'GETMAP' \
                    and not request.exceptionRaised() ):
                QgsMessageLog.logMessage("WatermarkFilter.responseComplete: image ready %s" % request.infoFormat(), 'plugin', QgsMessageLog.INFO)
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
                img.save(buffer, "PNG")
                # Set the body
                request.clearBody()
                request.appendBody(ba)

In this example the **SERVICE** parameter value is checked and if the incoming request is a **WMS** **GETMAP** and no exceptions have been set by a previously executed plugin or by the core service (WMS in this case), the WMS generated image is retrieved from the output buffer and the watermark image is added. The final step is to clear the output buffer and replace it with the newly generated image. Please note that in a real-world situation we should also check for the requested image type instead of returning PNG in any case.

Access control plugin
=====================

Plugin files
------------

Here's the directory structure of our example server plugin::

  PYTHON_PLUGINS_PATH/
    MyAccessControl/
      __init__.py    --> *required*
      AccessControl.py  --> *required*
      metadata.txt   --> *required*


__init__.py
-----------

This file is required by Python's import system. As for all |qg| server plugins, this
file contains a :func:`serverClassFactory()` function, which is called when the
plugin gets loaded into |qg| Server when the server starts. It receives reference to instance of
:class:`QgsServerInterface` and must return instance of your plugin's class.
This is how the example plugin `__init__.py` looks like:

.. code:: python

    # -*- coding: utf-8 -*-

    def serverClassFactory(serverIface):
        from MyAccessControl.AccessControl import AccessControl
        return AccessControl(serverIface)


AccessControl.py
----------------

.. code:: python

   class AccessControl(QgsAccessControlFilter):

       def __init__(self, server_iface):
           super(QgsAccessControlFilter, self).__init__(server_iface)

       def layerFilterExpression(self, layer):
           """ Return an additional expression filter """
           return super(QgsAccessControlFilter, self).layerFilterExpression(layer)

       def layerFilterSubsetString(self, layer):
           """ Return an additional subset string (typically SQL) filter """
           return super(QgsAccessControlFilter, self).layerFilterSubsetString(layer)

       def layerPermissions(self, layer):
           """ Return the layer rights """
           return super(QgsAccessControlFilter, self).layerPermissions(layer)

       def authorizedLayerAttributes(self, layer, attributes):
           """ Return the authorised layer attributes """
           return super(QgsAccessControlFilter, self).authorizedLayerAttributes(layer, attributes)

       def allowToEdit(self, layer, feature):
           """ Are we authorise to modify the following geometry """
           return super(QgsAccessControlFilter, self).allowToEdit(layer, feature)

       def cacheKey(self):
           return super(QgsAccessControlFilter, self).cacheKey()

This example gives a full access for everybody.

It's the role of the plugin to know who is logged on.

On all those methods we have the layer on argument to be able to customise
the restriction per layer.


layerFilterExpression
---------------------

Used to add an Expression to limit the results, e.g.:

.. code:: python

   def layerFilterExpression(self, layer):
       return "$role = 'user'"

To limit on feature where the attribute role is equals to "user".


layerFilterSubsetString
-----------------------

Same than the previous but use the ``SubsetString`` (executed in the database)

.. code:: python

   def layerFilterSubsetString(self, layer):
       return "role = 'user'"

To limit on feature where the attribute role is equals to "user".


layerPermissions
----------------

Limit the access to the layer.

Return an object of type ``QgsAccessControlFilter.LayerPermissions``,
who has the properties:

* ``canRead`` to see him in the ``GetCapabilities`` and have read access.
* ``canInsert`` to be able to insert a new feature.
* ``canUpdate`` to be able to update a feature.
* ``candelete`` to be able to delete a feature.

Example:

.. code:: python

   def layerPermissions(self, layer):
       rights = QgsAccessControlFilter.LayerPermissions()
       rights.canRead = True
       rights.canRead = rights.canInsert = rights.canUpdate = rights.canDelete = False
       return rights

To limit everything on read only access.


authorizedLayerAttributes
-------------------------

Used to limit the visibility of a specific subset of attribute.

The argument attribute return the current set of visible attributes.

Example:

.. code:: python

   def authorizedLayerAttributes(self, layer, attributes):
       return [a for a in attributes if a != "role"]

To hide the 'role' attribute.


allowToEdit
-----------

This is used to limit the editing on a subset of features.

It is used in the ``WFS-Transaction`` protocol.

Example:

.. code:: python

   def allowToEdit(self, layer, feature):
       return feature.attribute('role') == 'user'

To be able to edit only feature that has the attribute role
with the value user.


cacheKey
--------

QGIS server maintain a cache of the capabilities then to have a cache
per role you can return the role in this method. Or return ``None``
to completely disable the cache.
