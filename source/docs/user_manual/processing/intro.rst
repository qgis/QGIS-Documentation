|updatedisclaimer|

.. _sec_processing_intro:

Introduction
============

This chapter introduces the |qg| processing framework, a geoprocessing environment
that can be used to call native and third-party algorithms from |qg|, making your
spatial analysis tasks more productive and easy to accomplish.

In the following sections, we will review how to use the graphical elements of
this framework and make the most out of each one of them.

There are four basic elements in the framework GUI, which are used to run
algorithms for different purposes. Choosing one tool or another will depend on
the kind of analysis that is to be performed and the particular characteristics
of each user and project. All of them (except for the batch processing interface,
which is called from the toolbox, as we will see) can be accessed from the
:menuselection:`Processing` menu item. (You will see more than four entries. The
remaining ones are not used to execute algorithms and will be explained later in
this chapter.)

* The toolbox. The main element of the GUI, it is used to
  execute a single algorithm or run a batch process based on that algorithm.

.. only:: html

   **Figure Processing 1:**

.. _figure_toolbox_1:

.. figure:: /static/user_manual/processing/toolbox.png
   :align: center

   Processing Toolbox |win|

* The graphical modeler. Several algorithms can be combined graphically
  using the modeler to define a workflow, creating a single process that involves
  several subprocesses.

.. only:: html

   **Figure Processing 2:**

.. _figure_model:

.. figure:: /static/user_manual/processing/models.png
   :align: center

   Processing Modeler |win|

* The history manager. All actions performed using any of the
  aforementioned elements are stored in a history file and can be later easily
  reproduced using the history manager.

.. only:: html

   **Figure Processing 3:**

.. _figure_history:

.. figure:: /static/user_manual/processing/history.png
   :align: center

   Processing History |win|

* The batch processing interface. This interface allows you to
  execute batch processes and automate the execution of a single algorithm on
  multiple datasets.


.. only:: html

   **Figure Processing 4:**

.. _figure_batchprocess:

.. figure:: /static/user_manual/processing/batch_processing.png
   :align: center

   Batch Processing interface |win|

In the following sections, we will review each one of these elements in detail.
