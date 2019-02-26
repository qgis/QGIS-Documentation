.. only:: html

   |updatedisclaimer|

|LS| GRASS Tools
===============================================================================

In this lesson we will present a selection of tools to give you an idea of the
capabilities of GRASS.


.. _grass_aspect:

|basic| |FA| Create an aspect map
-------------------------------------------------------------------------------

#. Open the :guilabel:`GRASS Tools` tab
#. Load the :file:`g_dem` raster layer from the :guilabel:`grass_mapset` Mapset
#. Look for the :guilabel:`r.aspect` module by searching for it in the
   :guilabel:`Filter` field of the :guilabel:`Modules List` tab
#. Open the tool and set it up like this and click on the :guilabel:`Run` button:

   .. image:: img/grass_aspect.png
      :align: center

   |

#. When the process is finished click on :guilabel:`View Output` to load the
   resulting layer in the canvas:

.. image:: img/grass_aspect_result.png
   :align: center

The :file:`g_aspect` layer is stored within the :guilabel:`grass_mapset` Mapset
so you can remove the layer from the canvas and reload it whenever you want.

|basic| |FA| Get basic statistic of raster layer
-------------------------------------------------------------------------------

We want to know some basic statistics of the :file:`g_dem` raster layer.

#. Open the :guilabel:`GRASS Tools` tab
#. Load the :file:`g_dem` raster layer from the :guilabel:`grass_mapset` Mapset
#. Look for the :guilabel:`r.info` module by searching for it in the
   :guilabel:`Filter` field of the :guilabel:`Modules List` tab
#. Set up the tool like this and click on :guilabel:`Run`:

   .. image:: img/grass_raster_info.png
      :align: center

   |

#. Within the Output tab you will see some raster information printed, like the
   path of the file, the number of rows and columns and other useful information:

   .. image:: img/grass_raster_info_result.png
      :align: center


|moderate| |FA| The Reclass Tool
-------------------------------------------------------------------------------

Reclassifying a raster layer is a very useful task. We just created the
:file:`g_aspect` layer from the :file:`g_dem` one. The value range gets from 0
(North) passing through 90 (East), 180 (South), 270 (West) and finally to 360
(North again). We can reclassify the :file:`g_aspect` layer to have just 4
**categories** following specific *rules* (North = 1, East = 2, South = 3 and
West = 4).

Grass reclassify tool accepts a ``txt`` file with the defined rules. Writing the
rules is very simple and the GRASS Manual contains very good description.

.. tip:: Each GRASS tool has its own Manual tab. Take the time to read the
  description of the tool you are using to don't miss some useful parameters


#. Load the :file:`g_aspect` layer or, if you don't have create it, go back to the
   :ref:`grass_aspect` section.
#. Look for the :guilabel:`r.reclass` module by searching for it in the
   :guilabel:`Filter` field of the :guilabel:`Modules List` tab
#. Open the tool and set it up like the following picture. The file containing the
   rules is in the :file:`exercise_data/grass/` folder, named :file:`reclass_aspect.txt`.
#. Click on :guilabel:`Run` and wait until the process is finished:

   .. image:: img/grass_reclass.png
      :align: center

   |

#. Click on :guilabel:`View Output` to load the reclassified raster in the canvas

   The new layer is made up by just 4 values (1, 2, 3, and 4) and it is easier to
   manage and to process.

   .. image:: img/grass_reclass_result.png
      :align: center

.. tip:: Open the :file:`reclass_aspect.txt` with a text editor to see the rules
  and to start becoming used to them. Moreover, take a deep look at the GRASS
  manual: a lot of different examples are pointed out.


.. _backlink-grass_reclass:

|moderate| |TY| Reclassify with your rules
-------------------------------------------------------------------------------

Try to reclassify the :file:`g_dem` layer into 3 new categories:

* from 0 to 1000, new value = 1
* from 1000 to 1400, new value = 2
* from 1400 to the maximum raster value, new value = 3

:ref:`Check your results <grass_reclass>`


|moderate| |FA| The Mapcalc Tool
------------------------------------------------------------------------------

The Mapcalc tools is similar to the Raster Calculator of QGIS. You can perform
mathematical operation on one or more raster layers and the final result will
be a new layer with the calculated values.

The aim of the next exercise is to extract the values greater than 1000 from the
:file:`g_dem` raster layer.

#. Look for the :guilabel:`r.mapcalc` module by searching for it in the
   :guilabel:`Filter` field of the :guilabel:`Modules List` tab.
#. Start the tool.

   The :guilabel:`Mapcalc` dialog allows you to construct a sequence of analyses
   to be performed on a raster, or collection of rasters. You will use these tools
   to do so:

   .. image:: img/map_calc_tools.png
      :align: center

   |

   In order, they are:

   * :guilabel:`Add map`: Add a raster file from your current GRASS mapset.
   * :guilabel:`Add constant value`: Add a constant value to be used in functions,
     1000 in this case
   * :guilabel:`Add operator or function`: Add an operator or function to be connected
     to inputs and outputs, we will use the operator ``greater equals than``
   * :guilabel:`Add connection`: Connect elements. Using this tool, click and drag
     from the red dot on one item to the red dot on another item. Dots that are
     correctly connected to a connector line will turn gray. If the line or dot is
     red, it is not properly connected!
   * :guilabel:`Select item`: Select an item and move selected items.
   * :guilabel:`Delete selected item`: Removes the selected item from the current
     mapcalc sheet, but not from the mapset (if it is an existing raster)
   * :guilabel:`Open`: Open an existing file with the operation defined
   * :guilabel:`Save`: Save all the operation in a file
   * :guilabel:`Save as`: Save all the operations as a new file on the disk.

#. Using these tools, construct the following algorithm:

   .. image:: img/grass_mapcalc.png
      :align: center

   |

#. Click on :guilabel:`Run` and then on :guilabel:`View output` to see the output
   displayed in your map:

   .. image:: img/grass_mapcalc_result.png
      :align: center

   |

This shows all the areas where the terrain is higher than 1000 meters.

.. tip:: You can also save the formula you have created and load it in another
  QGIS project by clicking on the last button on the GRASS Mapcalc toolbar.

|IC|
-------------------------------------------------------------------------------

In this lesson, we have covered only a few of the many tools GRASS offers. To
explore the capabilities of GRASS for yourself, open the :guilabel:`GRASS
Tools` dialog and scroll down the :guilabel:`Modules List`. Or for a more
structured approach, look under the :guilabel:`Modules Tree` tab, which
organizes tools by type.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |TY| replace:: Try Yourself
.. |basic| image:: /static/global/basic.png
.. |moderate| image:: /static/global/moderate.png
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
