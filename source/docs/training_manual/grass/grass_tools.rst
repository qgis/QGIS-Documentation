.. only:: html

   |updatedisclaimer|

|LS| GRASS Tools
===============================================================================

In this lesson we will present a selection of tools to give you an idea of the
capabilities of GRASS.

|basic| |FA| Set Raster Colors
-------------------------------------------------------------------------------

* Open the :guilabel:`GRASS Tools` dialog.
* Look for the :kbd:`r.colors.table` module by searching for it in the
  :guilabel:`Filter` field of the :guilabel:`Modules List` tab.
* Open the tool and set it up like this:

  .. image:: img/colors_table_setup.png
     :align: center

When you run the tool, it will recolor your raster:

.. image:: img/colors_table_result.png
   :align: center

|basic| |FA| Visualize Data in 3D
-------------------------------------------------------------------------------

GRASS allows you to use a DEM to visualize your data in three dimensions. The
tool you'll use for this operates on the GRASS Region, which at the moment is
set to the whole extent of South Africa, as you set it up before.

* To redefine the extent to cover only our raster dataset, click this button:

  |grassRegionEdit|

When this tool is activated, your cursor will turn into a cross when over the
QGIS map canvas.

* Using this tool, click and drag a rectangle around the edges of the GRASS
  raster.
* Click :guilabel:`OK` in the :guilabel:`GRASS Region Settings` dialog when
  done.
* Search for the :kbd:`nviz` tool:

  .. image:: img/nviz_search.png
     :align: center

* Set it up as shown:

  .. image:: img/nviz_setup.png
     :align: center

* Remember to enable both :guilabel:`Use region of this map` buttons to the
  right of the two raster selection dropdown menus. This will allow NVIZ to
  correctly assess the resolution of the rasters.
* Click the :guilabel:`Run` button.

NVIZ will set up a 3D environment using the raster and vector selected. This
may take some time, depending on your hardware. When it's done, you will see
the map rendered in 3D in a new window:

.. image:: img/nviz_result.png
   :align: center

Experiment with the :guilabel:`height`, :guilabel:`z-exag`, and :guilabel:`View
method` settings to change your view of the data. The navigation methods may
take some getting used to.

After experimenting, close the :kbd:`NVIZ` window.

|moderate| |FA| The Mapcalc Tool
-------------------------------------------------------------------------------

* Open the :guilabel:`GRASS Tools` dialog's :guilabel:`Modules List` tab and
  search for :kbd:`calc`.
* From the list of modules, select :guilabel:`r.mapcalc` (not
  :guilabel:`r.mapcalculator`, which is more basic).
* Start the tool.

The Mapcalc dialog allows you to construct a sequence of analyses to be
performed on a raster, or collection of rasters. You will use these tools to do
so:

.. image:: img/map_calc_tools.png
   :align: center

In order, they are:

- :kbd:`Add map`: Add a raster file from your current GRASS mapset.
- :kbd:`Add constant value`: Add a constant value to be used in functions.
- :kbd:`Add operator or function`: Add an operator or function to be connected
  to inputs and outputs.
- :kbd:`Add connection`: Connect elements. Using this tool, click and drag from
  the red dot on one item to the red dot on another item. Dots that are
  correctly connected to a connector line will turn gray. If the line or dot is
  red, it is not properly connected!
- :kbd:`Select item`: Select an item and move selected items.
- :kbd:`Delete selected item`: Removes the selected item from the current
  mapcalc sheet, but not from the mapset (if it is an existing raster).

Using these tools:

* Construct the following algorithm:

  .. image:: img/altitude_range_settings.png
     :align: center

* When you click :guilabel:`Run`, your output should look like this:

  .. image:: img/altitude_range_result.png
     :align: center

* Click :guilabel:`View output` to see the output displayed in your map:

  .. image:: img/altitude_range_output.png
     :align: center

This shows all the areas where the terrain is lower than 500 meters or higher
than 1000 meters.

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
.. |basic| image:: /static/global/basic.png
.. |grassRegionEdit| image:: /static/common/grass_region_edit.png
   :width: 1.5em
.. |moderate| image:: /static/global/moderate.png
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
