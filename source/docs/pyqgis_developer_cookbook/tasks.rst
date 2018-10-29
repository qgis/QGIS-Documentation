.. only:: html

.. index:: Tasks

.. _tasks:

******************************************
Tasks - doing heavy work in the background
******************************************

.. note::
   Documentation in progress...

Introduction
------------

Background processing using threads is a way to maintain a responsive
user interface when heavy processing is going on.
Tasks can be used to achieve threading in QGIS.

A task (:class:`QgsTask`) is a container for the code to be performed
in the background, and the task manager (:class:`QgsTaskManager`) is
used to control the running of the tasks.
These classes simplify background processing in QGIS by providing
mechanisms for signaling, progress reporting and access
to the status for background processes.
Tasks can be grouped using subtasks.
See the `QGIS Python API doc <http://qgis.org/pyqgis>`_  for details
on methods, signals and attributes.

The global task manager (found with ``QgsApplication.taskManager()``)
is normally used.  This means that your tasks may not be the only
tasks that are controlled by the task manager.

There are several ways to create a QGIS task:

* Create your own task by extending :class:`QgsTask`

  .. code-block:: python

    class MyTask(QgsTask):
  
* Create a task from a function

  .. code-block:: python

    QgsTask.fromFunction(u'heavy function', myfunction,
                         onfinished=workdone)

* Create a task from a processing algorithm

  .. code-block:: python
  
    QgsProcessingAlgRunnerTask(u'native:buffer', params, context,
                               feedback)

.. note::
   A task must keep away from the graphical user interface
   (creating widgets or altering things in the gui), as this is not
   allowed in Qt.

Dependencies between tasks can be described using the ``addSubTask``
function of :class:`QgsTask`.
When a dependency is stated, serial execution of the involved classes
is ensured.
If a task on which another task depends is canceled, the dependent
task will also be canceled.
Dependencies make deadlocks possible, so be careful.

If a task depends on a layer being available, this can be stated
using the ``setDependentLayers`` function of :class:`QgsTask`.
If a layer on which a task depends is not available, the task will be
canceled.

Once the task has been created it can be scheduled for running using
the ``addTask`` function of the task manager.
The scheduling of the tasks is influenced by the task priority, which
is set in ``addTask``.

The status of tasks can be monitored using :class:`QgsTask` and
:class:`QgsTaskManager` signals and functions.


Examples
--------

Extending QgsTask
.................

``MyTask`` extends :class:`QgsTask` and will generate 100 random
integers between 0 and 100 during a specified period of time.
If the random number is 42, the task is aborted and an exception
is raised.
Several instances of ``MyTask`` (with subtasks) are generated
and added to the task manager, demonstrating two types of
dependencies.

.. code-block:: python

  import random
  from time import sleep
  
  from qgis.core import (
      QgsApplication, QgsTask, QgsMessageLog,
      )
  
  MESSAGE_CATEGORY = 'SubclassTask'
  
  class MyTask(QgsTask):
      """This shows how to subclass QgsTask"""
      def __init__(self, description, duration):
          super().__init__(description, QgsTask.CanCancel)
          self.duration = duration
          self.total = 0
          self.iterations = 0
          self.exception = None
      def run(self):
          """Here you implement your heavy lifting.
          Should periodically test for isCanceled() to gracefully
          abort.
          This method MUST return True or False
          raising exceptions will crash QGIS, so we handle them
          internally and raise them in self.finished
          """
          QgsMessageLog.logMessage('Started task "{}"'.format(
                                       self.description()),
                                   MESSAGE_CATEGORY, Qgis.Info)
          wait_time = self.duration / 100
          for i in range(100):
              sleep(wait_time)
              # use setProgress to report progress
              self.setProgress(i)
              self.total += random.randint(0, 100)
              self.iterations += 1
              # check isCanceled() to handle cancellation
              if self.isCanceled():
                  return False
              # simulate exceptions to show how to abort task
              if 0 and random.randint(0, 500) == 42:
                  # DO NOT raise Exception('bad value!')
                  # this would crash QGIS
                  self.exception = Exception('bad value!')
                  return False
          return True
      def finished(self, result):
          """
          This function is automatically called when the task has
          completed (successfully or not).
          You implement finished() to do whatever follow-up stuff
          should happen after the task is complete.
          finished is always called from the main thread, so it's safe
          to do GUI operations and raise Python exceptions here.
          result is the return value from self.run.
          """
          if result:
              QgsMessageLog.logMessage(
                  'Task "{name}" completed\n' \
                  'Total: {total} (with {iterations} '\
                'iterations)'.format(
                    name=self.description(),
                    total=self.total,
                    iterations=self.iterations),
                MESSAGE_CATEGORY, Qgis.Success)
          else:
              if self.exception is None:
                  QgsMessageLog.logMessage(
                      'Task "{name}" not successful but without '\
                      'exception (probably the task was manually '\
                      'canceled by the user)'.format(
                          name=self.description()),
                      MESSAGE_CATEGORY, Qgis.Warning)
              else:
                  QgsMessageLog.logMessage(
                      'Task "{name}" Exception: {exception}'.format(
                          name=self.description(),
                          exception=self.exception),
                      MESSAGE_CATEGORY, Qgis.Critical)
                  raise self.exception
      def cancel(self):
          QgsMessageLog.logMessage(
              'Task "{name}" was canceled'.format(
                  name=self.description()),
              MESSAGE_CATEGORY, Qgis.Info)
          super().cancel()
  
  
  longtask = MyTask('waste cpu long', 20)
  shorttask = MyTask('waste cpu short', 10)
  minitask = MyTask('waste cpu mini', 5)
  st1 = MyTask('waste cpu Subtask 1', 5)
  st2 = MyTask('waste cpu Subtask 2', 10)
  st3 = MyTask('waste cpu Subtask 3', 4)
  
  # Add a subtask (st1) to shorttask that must run after minitask and
  # longtask has finished
  shorttask.addSubTask(st1, [minitask, longtask])
  # Add a subtask (st2) to longtask that must be run before the parent
  # task
  longtask.addSubTask(st2, [], QgsTask.ParentDependsOnSubTask)
  longtask.addSubTask(st3)
  
  QgsApplication.taskManager().addTask(longtask)
  QgsApplication.taskManager().addTask(shorttask)
  QgsApplication.taskManager().addTask(minitask)

Task from function
..................

Create a task from a function (``run`` in this example).
The first parameter of the function will hold the :class:`QgsTask`
for the function.
An important (named) parameter is ``on_finished``, that specifies a
function that will work on the result.
The ``run`` function in this example has an additional named
parameter ``wait_time``.

.. code-block:: python

  import random
  from time import sleep
  
  CATEGORY = 'TaskFromFunction'
  
  def run(task, wait_time):
      """
      Raises an exception to abort the task.
      Returns a result if success.
      The result will be passed together with the exception (None in
      the case of success) to the on_finished method
      """
      QgsMessageLog.logMessage('Started task {}'.format(task.description()),
                               CATEGORY, Qgis.Info)
      wait_time = wait_time / 100
      total = 0
      iterations = 0
      for i in range(100):
          sleep(wait_time)
          # use task.setProgress to report progress
          task.setProgress(i)
          total += random.randint(0, 100)
          iterations += 1
          # check task.isCanceled() to handle cancellation
          if task.isCanceled():
              stopped(task)
              return None
          # raise an exception to abort the task
          if random.randint(0, 500) == 42:
              raise Exception('bad value!')
      return {'total': total, 'iterations': iterations,
              'task': task.description()}
  
  def stopped(task):
      QgsMessageLog.logMessage(
          'Task "{name}" was canceled'.format(
              name=task.description()),
          CATEGORY, Qgis.Info)
  
  def completed(exception, result=None):
      """This is called when run is finished.
      Exception is not None if run raises an exception.
      Result is the return value of run."""
      if exception is None:
          if result is None:
              QgsMessageLog.logMessage(
                  'Completed with no exception and no result '\
                  '(probably manually canceled by the user)',
                  CATEGORY, Qgis.Warning)
          else:
              QgsMessageLog.logMessage(
                  'Task {name} completed\n'
                  'Total: {total} ( with {iterations} '
                  'iterations)'.format(
                      name=result['task'],
                      total=result['total'],
                      iterations=result['iterations']),
                  CATEGORY, Qgis.Info)
      else:
          QgsMessageLog.logMessage("Exception: {}".format(exception),
                                   CATEGORY, Qgis.Critical)
          raise exception
  
  # Creae a few tasks
  task1 = QgsTask.fromFunction(u'Waste cpu 1', run,
                               on_finished=completed, wait_time=4)
  task2 = QgsTask.fromFunction(u'Waste cpu 2', run,
                               on_finished=completed, wait_time=3)
  QgsApplication.taskManager().addTask(task1)
  QgsApplication.taskManager().addTask(task2)
 

Task from a processing algorithm
................................

Create a task that uses algorithm ``qgis:randompointsinextent`` to
generate 50000 random points inside a specified extent and adds the
result to the project in a safe way.

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

See also: http://www.opengis.ch/2018/06/22/threads-in-pyqgis3/.
