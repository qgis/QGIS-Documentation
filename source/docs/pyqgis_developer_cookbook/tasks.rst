.. only:: html

.. index:: Tasks

.. _tasks:

*****
Tasks
*****

Tasks were introduced in QGIS 3, and is a convenient way to achieve
threading.
While waiting for the documentation of this feature to be completed,
have a look at
http://www.opengis.ch/2018/06/22/threads-in-pyqgis3/.

Introduction
------------

Background processing using threads is a way to maintain a responsive
user interface when heavy processing is going on.

:class:`QgsTask` and :class:`QgsTaskManager` simplify background
processing in QGIS.
They provide mechanisms for signalling, progress reporting and access
to the status for background processes.

A task (:class:`QgsTask`) is a container for the code to be performed
in the background, and the task manager (:class:`QgsTaskManager`) is
used to control the running of the tasks.
Tasks can be grouped using subtasks.
See http://qgis.org/pyqgis for details on methods, signals and
attributes.

The global task manager (found with ``QgsApplication.taskManager()``)
is normally used.  This means that your tasks may not be the only
tasks that are controlled by the task manager.

There are several ways to create a QGIS task:

* Create your own task by extending :class:`QgsTask`

  .. code-block:: python

    class MyTask(QgsTask):
  
* Create a task from a function

  .. code-block:: python

    QgsTask.fromFunction(u'heavy function', myfunction, onfinished=workdone)

* Create a task from a processing algorithm

  .. code-block:: python
  
    QgsProcessingAlgRunnerTask(u'native:buffer', params, context, feedback)

.. note::
   A task must keep away from the graphical user interface
   (creating widgets or altering things in the gui), as this is not
   allowed in Qt.

Dependencies between tasks can be described using the addSubTask
function of :class:`QgsTask`.
When a dependency is stated, serial execution of the involved classes
is ensured.
If a task on which another task depends is cancelled, the dependent
task will also be cancelled.
Dependencies make deadlocks possible, so be careful.

If a task depends on a layer being available, this can be stated
using the setDependentLayers function of :class:`QgsTask`.
If a layer on which a task depends is not available, the task will be
cancelled.

Once the task has been created it can be scheduled for running using
the addTask function of the task manager.
The scheduling of the tasks is influenced by the task priority, which
is set when in addTask.

The status of tasks can be monitored using :class:`QgsTask` and
:class:`QgsTaskManager` signals and functions.


Examples
--------

Extending QgsTask
.................

Task from function
..................

Task from a processing algorithm
................................

.. code-block:: python
  
  from functools import partial
  from qgis.core import (QgsTaskManager, QgsMessageLog,
                         QgsProcessingAlgRunnerTask, QgsApplication,
                         QgsProcessingContext, QgsProcessingFeedback,
                         QgsProject)

  MESSAGE_CATEGORY = 'AlgRunnerTask'

  def task_finished(context, successful, results):
      if not successful:
          QgsMessageLog.logMessage('Task finished unsucessfully',
                                   MESSAGE_CATEGORY, Qgis.Warning)
      output_layer = context.getMapLayer(results['OUTPUT'])
      # because getMapLayer doesn't transfer ownership the layer will
      # be deleted when context goes out of scope and you'll get a
      # crash.
      # takeMapLayer transfers ownership so it's then safe to add it
      # to the project and give the project ownership. 
      if output_layer and output_layer.isValid():
          QgsProject.instance().addMapLayer(
               context.takeResultLayer(output_layer.id()))

  alg = QgsApplication.processingRegistry().algorithmById(
                                        u'qgis:randompointsinextent')
  context = QgsProcessingContext()
  feedback = QgsProcessingFeedback()
  params = {
      'EXTENT': '0.0,1000000.0,6000000,7000000 [EPSG:32633]',
      'MIN_DISTANCE': 0.0,
      'POINTS_NUMBER': 50000,
      'TARGET_CRS': 'EPSG:32633',
      'OUTPUT': 'memory:My random points'
  }
  task = QgsProcessingAlgRunnerTask(alg, params, context, feedback)
  task.executed.connect(partial(task_finished, context))
  QgsApplication.taskManager().addTask(task)

