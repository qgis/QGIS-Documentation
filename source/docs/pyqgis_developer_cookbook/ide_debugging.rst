***********************************************
IDE settings for writing and debugging plugins
***********************************************

Although each programmer has his preferred IDE/Text editor, here are some recommendations for setting up popular IDE's for writing and debugging QGIS Python plugins.



A note on configuring your IDE on Windows
==========================================

On Linux there is no additional configuration needed to develop plug-ins.
But on Windows you need to make sure you that you have the same environment
settings and use the same libraries and interpreter as QGIS. The fastest
way to do this, is to modify the startup batch file of QGIS.

If you used the OSGeo4W Installer, you can find this under the bin folder
of your OSGoeW install. Look for something like :file:`C:\\OSGeo4W\\bin\\qgis-unstable.bat`.

For using `Pyscripter IDE <http://code.google.com/p/pyscripter>`_, here's what you have to do:

* Make a copy of qgis-unstable.bat and rename it pyscripter.bat.
* Open it in an editor. And remove the last line, the one that starts QGIS.
* Add a line that points to the your Pyscripter executable and add the
  commandline argument that sets the version of Python to be used (2.7 in the case of QGIS 2.0)
* Also add the argument that points to the folder where Pyscripter can
  find the Python dll used by QGIS, you can find this under the bin folder
  of your OSGeoW install::

    @echo off
    SET OSGEO4W_ROOT=C:\OSGeo4W
    call "%OSGEO4W_ROOT%"\bin\o4w_env.bat
    call "%OSGEO4W_ROOT%"\bin\gdal16.bat
    @echo off
    path %PATH%;%GISBASE%\bin
    Start C:\pyscripter\pyscripter.exe --python25 --pythondllpath=C:\OSGeo4W\bin

Now when you double click this batch file it will start Pyscripter, with the correct path.

More popular that Pyscripter, Eclipse is a common choice among developers. In the following sections, we will be explaining how to configure it for developing and testing plugins. To prepare your environment for using Eclipse in windows, you should also create a batch file and use it to start Eclipse.

To create that batch file, follow these steps.

- Locate the folder where ``qgis_core.dll`` resides in. Normally this is ``C:\OSGeo4W\apps\qgis\bin``, but if you compiled your own QGIS application this is in your build folder in ``output/bin/RelWithDebInfo``
- Locate your eclipse.exe executable. 
- Create the following script and use this to start eclipse when developing QGIS plugins.

::

  call "C:\OSGeo4W\bin\o4w_env.bat"
  set PATH=%PATH%;C:\path\to\your\qgis_core.dll\parent\folder
  C:\path\to\your\eclipse.exe

Debugging using Eclipse and PyDev
=================================

Installation
------------

To use Eclipse, make sure you have installed the following

- Eclipse
- Aptana Eclipse Plugin or PyDev
- QGIS 2.0

Preparing QGIS 
---------------

There is some preparation to be done on QGIS itself. Two plugins are of interest: *Remote Debug* and *Plugin reloader*.

- Go to *Plugins/Fetch python plugins*
- Search for Remote Debug ( at the moment it's still experimental, so enable experimental plugins under the Options tab in case it does not show up ). Install it.
- Search for *Plugin reloader* and install it as well. This will let you reload a plugin instead of having to close and restart QGIS to have the plugin reloaded.

Setting up Eclipse
-------------------
In Eclipse, create a new project. You can select *General Project* and link your real sources later on, so it does not really matter where you place this project.

.. figure:: /static/pyqgis_developer_cookbook/eclipsenewproject.png
   :align: center

   Eclipse project

Now right click your new project and choose *New => Folder*.

Click *Advanced* and choose *Link to alternate location (Linked Folder)*. In case you already have sources you want to debug, choose these, in case you don't, create a folder as it was already explained 

Now in the view *Project Explorer*, your source tree pops up and you can start working with the code. You already have syntax highlighting and all the other powerful IDE tools available.

Configuring the debugger
-------------------------

To get the debugger working, switch to the Debug perspective in eclipse (*Window=>Open Perspective=>Other=>Debug*). 

Now start the PyDev debug server by choosing *PyDev=>Start Debug Server*.

Eclipse is now waiting for a connection from QGIS to its debug server and when QGIS connects to the debug server it will allow it to control the python scripts. That's exactly what we installed the Remote Debug plugin for. So start QGIS in case you did not already and click the bug symbol . 

Now you can set a breakpoint and as soon as the code hits it, execution will stop and you can inspect the current state of your plugin. (The breakpoint is the green dot in the image below, set one by double clicking in the white space left to the line you want the breakpoint to be set)

.. figure:: /static/pyqgis_developer_cookbook/breakpoint.png
   :align: center

   Breakpoint

A very interesting thing you can make use of now is the debug console. Make sure that the execution is currently stopped at a break point, before you proceed.

Open the Console view (*Window => Show view*). It will show the Debug Server console which is not very interesting. But there is a button *Open Console* which lets you change to a more interesting PyDev Debug Console. Click the arrow next to the Open Console button and choose *PyDev Console*. A window opens up to ask you which console you want to start. Choose *PyDev Debug Console*. In case its greyed out and tells you to Start the debugger and select the valid frame, make sure that you've got the remote debugger attached and are currently on a breakpoint.

.. figure:: /static/pyqgis_developer_cookbook/console-buttons.png
   :align: center

   PyDev Debug Console


You have now an interactive console which let's you test any commands from within the current context. You can manipulate variables or make API calls or whatever you like.

A little bit annoying is, that every time you enter a command, the console switches back to the Debug Server. To stop this behavior, you can click the *Pin Console* button when on the Debug Server page and it should remember this decision at least for the current debug session.

Making eclipse understand the API
-----------------------------------

A very handy feature is to have Eclipse actually know about the QGIS API. This enables it to check your code for typos. But not only this, it also enables Eclipse to help you with autocompletion from the imports to API calls.

To do this, Eclipse parses the QGIS library files and gets all the information out there. The only thing you have to do is to tell Eclipse where to find the libraries.

Click *Window=>Preferences=>PyDev=>Interpreter - Python*.

You will see your configured python interpreter in the upper part of the window (at the moment python2.7 for QGIS) and some tabs in the lower part. The interesting tabs for us are *Libraries* and *Forced Builtins*.

.. figure:: /static/pyqgis_developer_cookbook/interpreter-libraries.png
   :align: center

   PyDev Debug Console

First open the Libraries tab. Add a New Folder and choose the python folder of your QGIS installation. If you do not know where this folder is (it's not the plugins folder) open QGIS, start a python console and simply enter ``qgis`` and press enter. It will show you which QGIS module it uses and its path. Strip the trailing ``/qgis/__init__.pyc`` from this path and you've got the path you are looking for.

You should also add your plugins folder here (on Linux it is ~/.qgis/python/plugins ).

Next jump to the *Forced Builtins* tab, click on *New...* and enter ``qgis``. This will make eclipse parse the QGIS API. You probably also want eclipse to know about the PyQt4 API. Therefore also add PyQt4 as forced builtin. That should probably already be present in your libraries tab.

Click *OK* and you're done.

Note: every time the QGIS API changes (e.g. if you're compiling QGIS master and the sip file changed), you should go back to this page and simply click *Apply*. This will let Eclipse parse all the libraries again.


For another possible setting of Eclipse to work with QGIS Python plugins, check `this link <http://linfiniti.com/2011/12/remote-debugging-qgis-python-plugins-with-pydev>`_


Debugging using PDB
===================

If you do not use an IDE such as Eclipse, you can debug using PDB, following these steps.

First add this code in the spot where you would like to debug::

 # Use pdb for debugging
 import pdb
 # These lines allow you to set a breakpoint in the app
 pyqtRemoveInputHook()
 pdb.set_trace()

Then run QGIS from the command line.

On Linux do:

:command:`$ ./Qgis`

On Mac OS X do:

:command:`$ /Applications/Qgis.app/Contents/MacOS/Qgis`

And when the application hits your breakpoint you can type in the console!

.. index:: plugins; testing

.. todo::
    Add testing information

.. index:: plugins; releasing
