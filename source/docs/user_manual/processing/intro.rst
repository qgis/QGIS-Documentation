|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _sec_processing_intro:

Introduction
============

This chapter introduces the QGIS processing framework, a geoprocessing environment 
that can be used to call native and third party algorithms from QGIS, making your 
spatial analysis tasks more productive and easy to accomplish.

In the following sections we will review how to use the graphical elements of
this framework and take the most out of each one of them.

There are four basic elements in the framework GUI, which are used to run 
algorithms for different purposes. Choosing one tool or another will depend on
the kind of analysis that is to be performed and the particular characteristics
of each user and project. All of them (except for the batch processing interface,
which is called from the toolbox, as we will see) can be accessed from the
:menuselection:`Processing` menu item (you will see more than four entries. The
remaining ones are not used to execute algorithms and will be explained later in
this chapter).

* The toolbox. The main element of the GUI, it is used to
  execute a single algorithm or run a batch process based on that algorithm.

.. only:: html

   **Figure Processing 1:**

.. _figure_toolbox_1:

.. figure:: /static/user_manual/processing/toolbox.png
   :align: center
   :width: 15em

   Processing Toolbox |win|

* The graphical modeler. Several algorithms can be combined graphically
  using the modeler to define a workflow, creating a single process that involves
  several sub-processes

.. only:: html

   **Figure Sextante 2:**

.. _figure_model:

.. figure:: /static/user_manual/processing/models.png
   :align: center
   :width: 30em

   Processing Modeler |win|

* The history manager. All actions performed using any of the
  aforementioned elements are stored in a history file and can be later easily
  reproduced using the history manager

.. only:: html

   **Figure Processing 3:**

.. _figure_history:

.. figure:: /static/user_manual/processing/history.png
   :align: center
   :width: 30em

   Processing History |win|

* The batch processing interface. This interface allows you to
  execute batch processes and automate the execution of a single algorithm on
  multiple datasets.


.. only:: html

   **Figure Processing 4:**

.. _figure_batchprocess:

.. figure:: /static/user_manual/processing/batch_processing.png
   :align: center
   :width: 30em

   Batch Processing interface |win|

Along the following sections we will review each one of this elements in detail.
