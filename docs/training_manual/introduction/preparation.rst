|LS| Adding your first layer
===============================================================================

We will start the application, and create a basic map to use for examples and
exercises.

**The goal for this lesson:** To get started with an example map.

.. note::  Before starting this exercise, QGIS must be installed on your
   computer. Also, you should have downloaded the :ref:`sample data
   <data_downloadlink>` to use.

Launch QGIS from its desktop shortcut, menu item, etc., depending on how you
configured its installation.

.. note::  The screenshots for this course were taken in QGIS 3.4 running on
   Linux. Depending on your setup, the screens you encounter may well appear
   somewhat different. However, all the same buttons will still be available,
   and the instructions will work on any OS. You will need QGIS 3.4 (the latest
   version at time of writing) to use this course.

Let's get started right away!

.. _tm_pepare_a_map:

|basic| |FA| Prepare a map
-------------------------------------------------------------------------------

#. Open QGIS. You will have a new, blank map.

   .. figure:: img/add_blank_qgis.png
      :align: center
      :width: 100 %

#. The :guilabel:`Data Source Manager` dialog allows you to choose the data to
   load depending on the data type. We'll use it to load our dataset:
   click the |dataSourceManager| :sup:`Open Data Source Manager` button.

   If you can't find the icon, check that the :guilabel:`Data Source Manager`
   toolbar is enabled in the :menuselection:`View --> Toolbars` menu.

   .. figure:: img/add_data_dialog.png
      :align: center
      :width: 100 %

#. Load the :file:`protected_areas.shp` vector dataset:
   
   #. Click on the :guilabel:`Vector` tab.
   #. Enable the |radioButtonOn|:guilabel:`File` source type.
   #. Press the :guilabel:`...` button next to :guilabel:`Vector Dataset(s)`.
   #. Select the :file:`exercise_data/shapefile/protected_areas.shp` file
      in your training directory.
   #. Click :guilabel:`Open`. You will see the original dialog,
      with the file path filled in.

      .. figure:: img/add_vector_dialog.png
         :align: center

   #. Click :guilabel:`Add` here as well. The data you specified will now load:
      you can see a ``protected_areas`` item in the :guilabel:`Layers` panel
      (bottom left) with its features shown in the main map canvas.

      .. figure:: img/first_loaded_layer.png
         :align: center
         :width: 100%

Congratulations! You now have a basic map. Now would be a good time to save
your work.

#. Click on the :guilabel:`Save As` button: |fileSaveAs|
#. Save the map under a :file:`solution` folder next to :file:`exercise_data`
   and call it :file:`basic_map.qgz`.

.. _backlink-interface-preparation-1:

|basic| |TY|
-------------------------------------------------------------------------------

Repeat the steps above to add the :file:`places.shp` and :file:`rivers.shp`
layers from the same folder (:file:`exercise_data/shapefile`) to the map.

:ref:`Check your results <interface-preparation-1>`

|IC|
-------------------------------------------------------------------------------

You've learned how to add a layer from a Shapefile dataset and create a basic map!

|WN|
-------------------------------------------------------------------------------

Now you're familiar with the basic function of the :guilabel:`Open Data Source Manager`
button, but what about all the others? How does this interface work? Before we
go on, let's first take a look at the
layout of the QGIS interface. This is the topic of the next lesson.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |TY| replace:: Try Yourself
.. |WN| replace:: What's Next?
.. |basic| image:: /static/common/basic.png
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
.. |fileSaveAs| image:: /static/common/mActionFileSaveAs.png
   :width: 1.5em
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
   :width: 1.5em
