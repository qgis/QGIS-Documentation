|LS| An Overview of the Interface
===============================================================================

We will explore the QGIS user interface so that you are familiar with the
menus, toolbars, map canvas and layers list that form the basic structure of
the interface.

**The goal for this lesson:** To understand the basics of the QGIS user
interface.

|basic| |TY|: The Basics
-------------------------------------------------------------------------------

.. image:: /static/training_manual/interface/gui_numbered.png
   :align: center

The elements identified in the figure above are:

#. Layers List / Browser Panel
#. Toolbars
#. Map canvas
#. Status bar
#. Side Toolbar

.. Don't reorder these list items! They refer to elements as numbered on an
   image.

|basic| The Layers List
...............................................................................

In the Layers list, you can see a list, at any time, of all the layers
available to you.

Expanding collapsed items (by clicking the arrow or plus symbol beside them)
will provide you with more information on the layer's current appearance.

Right-clicking on a layer will give you a menu with lots of extra options. You
will be using some of them before long, so take a look around!

Some versions of QGIS have a separate :guilabel:`Control rendering order`
checkbox just underneath the Layers list. Don't worry if you can't see it. If
it is present, ensure that it's checked for now.

.. note::  A vector layer is a dataset, usually of a specific kind of object,
   such as roads, trees, etc. A vector layer can consist of either points,
   lines or polygons.

|basic| The Browser Panel
...............................................................................

The QGIS Browser is a panel in QGIS that lets you easily navigate in your
database. You can have access to common vector files (e.g. ESRI shapefile
or MapInfo files), databases (e.g.PostGIS, Oracle, Spatialite or MSSQL Spatial)
and WMS/WFS connections. You can also view your GRASS data.

|basic| Toolbars
...............................................................................

Your most oft-used sets of tools can be turned into toolbars for basic access.
For example, the File toolbar allows you to save, load, print, and start a new
project. You can easily customize the interface to see only the tools you use
most often, adding or removing toolbars as necessary via the
:menuselection:`View --> Toolbars` menu.

Even if they are not visible in a toolbar, all of your tools will remain
accessible via the menus. For example, if you remove the :guilabel:`File`
toolbar (which contains the :guilabel:`Save` button), you can still save your
map by clicking on the :guilabel:`Project` menu and then clicking on
:guilabel:`Save`.

|basic| The Map Canvas
...............................................................................

This is where the map itself is displayed.

|basic| The Status Bar
...............................................................................

Shows you information about the current map. Also allows you to adjust the map
scale and see the mouse cursor's coordinates on the map.


.. _backlink-interface-overview-1:

|basic| |TY| 1
-------------------------------------------------------------------------------

Try to identify the four elements listed above on your own screen, without
referring to the diagram above. See if you can identify their names and
functions. You will become more familiar with these elements as you use them in
the coming days.

:ref:`Check your results <interface-overview-1>`


.. _backlink-interface-overview-2:

|basic| |TY| 2
-------------------------------------------------------------------------------

Try to find each of these tools on your screen. What is their purpose?

1. |mActionFileSaveAs|

2. |mActionZoomToLayer|

3. |mActionWhatsThis|

4. .. image:: /static/training_manual/interface/toggle_render.png

5. |mActionMeasure|

.. note:: If any of these tools is not visible on the screen, try enabling
   some toolbars that are currently hidden. Also keep in mind that if there
   isn't enough space on the screen, a toolbar may be shortened by hiding some
   of its tools. You can see the hidden tools by clicking on the double right
   arrow button in any such collapsed toolbar. You can see a tooltip with the
   name of any tool by holding your mouse over the tool for a while.

:ref:`Check your results <interface-overview-2>`

|WN|
-------------------------------------------------------------------------------

Now you've seen how the QGIS interface works, you can use the tools available
to you and start improving on your map! This is the topic of the next lesson.
