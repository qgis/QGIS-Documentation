.. index:: Tasks

.. highlight:: python
   :linenothreshold: 5


.. testsetup:: tasks

    iface = start_qgis()

.. _tasks:

******************************************
Tasks - doing heavy work in the background
******************************************

.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: tasks

    from qgis.core import (
      Qgis,
      QgsApplication,
      QgsMessageLog,
      QgsProcessingAlgRunnerTask,
      QgsProcessingContext,
      QgsProcessingFeedback,
      QgsProject,
      QgsTask,
      QgsTaskManager,
    )

.. only:: html

   .. contents::
      :local:

Introduction
------------

Background processing using threads is a way to maintain a responsive
user interface when heavy processing is going on.
Tasks can be used to achieve threading in QGIS.

A task (:class:`QgsTask <qgis.core.QgsTask>`) is a container for the code to be performed
in the background, and the task manager (:class:`QgsTaskManager <qgis.core.QgsTaskManager>`) is
used to control the running of the tasks.
These classes simplify background processing in QGIS by providing
mechanisms for signaling, progress reporting and access
to the status for background processes.
Tasks can be grouped using subtasks.

The global task manager (found with :meth:`QgsApplication.taskManager() <qgis.core.QgsApplication.taskManager>`)
is normally used. This means that your tasks may not be the only
tasks that are controlled by the task manager.

There are several ways to create a QGIS task:

* Create your own task by extending :class:`QgsTask <qgis.core.QgsTask>`

  .. testcode:: tasks

    class SpecialisedTask(QgsTask):
        pass

* Create a task from a function

  .. testcode:: tasks

    def heavyFunction():
        # Some CPU intensive processing ...
        pass

    def workdone():
        # ... do something useful with the results
        pass

    task = QgsTask.fromFunction('heavy function', heavyFunction,
                         on_finished=workdone)

* Create a task from a processing algorithm

  .. testcode:: tasks

    params = dict()
    context = QgsProcessingContext()
    context.setProject(QgsProject.instance())
    feedback = QgsProcessingFeedback()

    buffer_alg = QgsApplication.instance().processingRegistry().algorithmById('native:buffer')
    task = QgsProcessingAlgRunnerTask(buffer_alg, params, context,
                               feedback)

.. warning::
   Any background task (regardless of how it is created) must NEVER
   use any QObject that lives on the main thread, such as accessing
   QgsVectorLayer, QgsProject or perform any GUI based operations
   like creating new widgets or interacting with existing widgets.
   Qt widgets must only be accessed or modified from the main thread.
   Data that is used in a task must be copied before the task is started.
   Attempting to use them from background threads will result in
   crashes.

   Moreover always make sure that :class:`context <qgis.core.QgsProcessingContext>`
   and :class:`feedback <qgis.core.QgsProcessingFeedback>` live for at
   least as long as the tasks that use them. QGIS will crash if, 
   upon completion of a task, *QgsTaskManager* fails to access the *context* and *feedback*
   against which the task was scheduled.

.. note::
   It is a common pattern to call :meth:`setProject() <qgis.core.QgsProcessingContext.setProject>` shortly
   after calling ``QgsProcessingContext``. This allows the task as well as its callback
   function to use most of the project-wide settings. This is especially valuable when working
   with spatial layers in the callback function.

Dependencies between tasks can be described using the :meth:`addSubTask() <qgis.core.QgsTask.addSubTask>`
function of :class:`QgsTask <qgis.core.QgsTask>`.
When a dependency is stated, the task manager will automatically
determine how these dependencies will be executed.
Wherever possible dependencies will be executed in parallel in order
to satisfy them as quickly as possible.
If a task on which another task depends is canceled, the dependent
task will also be canceled.
Circular dependencies can make deadlocks possible, so be careful.

If a task depends on a layer being available, this can be stated
using the :meth:`setDependentLayers() <qgis.core.QgsTask.setDependentLayers>`
function of :class:`QgsTask <qgis.core.QgsTask>`.
If a layer on which a task depends is not available, the task will be
canceled.

Once the task has been created it can be scheduled for running using
the :meth:`addTask() <qgis.core.QgsTaskManager.addTask>` function of the task manager.
Adding a task to the manager automatically transfers ownership of
that task to the manager, and the manager will cleanup and delete
tasks after they have executed.
The scheduling of the tasks is influenced by the task priority, which
is set in :meth:`addTask() <qgis.core.QgsTaskManager.addTask>`.

The status of tasks can be monitored using :class:`QgsTask <qgis.core.QgsTask>` and
:class:`QgsTaskManager <qgis.core.QgsTaskManager>` signals and functions.


Examples
--------

Extending QgsTask
.................

In this example ``RandomIntegerSumTask`` extends :class:`QgsTask <qgis.core.QgsTask>` and will
generate 100 random integers between 0 and 500 during a specified period
of time.
If the random number is 42, the task is aborted and an exception is
raised.
Several instances of ``RandomIntegerSumTask`` (with subtasks) are generated
and added to the task manager, demonstrating two types of
dependencies.

.. this snippet crashes the test runner on self.exception = Exception('bad value!')

.. code-block:: python

  import random
  from time import sleep

  from qgis.core import (
      QgsApplication, QgsTask, QgsMessageLog, Qgis
      )

  MESSAGE_CATEGORY = 'RandomIntegerSumTask'

  class RandomIntegerSumTask(QgsTask):
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
          This method MUST return True or False.
          Raising exceptions will crash QGIS, so we handle them
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
              arandominteger = random.randint(0, 500)
              self.total += arandominteger
              self.iterations += 1
              # check isCanceled() to handle cancellation
              if self.isCanceled():
                  return False
              # simulate exceptions to show how to abort task
              if arandominteger == 42:
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
                  'RandomTask "{name}" completed\n' \
                  'RandomTotal: {total} (with {iterations} '\
                'iterations)'.format(
                    name=self.description(),
                    total=self.total,
                    iterations=self.iterations),
                MESSAGE_CATEGORY, Qgis.Success)
          else:
              if self.exception is None:
                  QgsMessageLog.logMessage(
                      'RandomTask "{name}" not successful but without '\
                      'exception (probably the task was manually '\
                      'canceled by the user)'.format(
                          name=self.description()),
                      MESSAGE_CATEGORY, Qgis.Warning)
              else:
                  QgsMessageLog.logMessage(
                      'RandomTask "{name}" Exception: {exception}'.format(
                          name=self.description(),
                          exception=self.exception),
                      MESSAGE_CATEGORY, Qgis.Critical)
                  raise self.exception

      def cancel(self):
          QgsMessageLog.logMessage(
              'RandomTask "{name}" was canceled'.format(
                  name=self.description()),
              MESSAGE_CATEGORY, Qgis.Info)
          super().cancel()


  longtask = RandomIntegerSumTask('waste cpu long', 20)
  shorttask = RandomIntegerSumTask('waste cpu short', 10)
  minitask = RandomIntegerSumTask('waste cpu mini', 5)
  shortsubtask = RandomIntegerSumTask('waste cpu subtask short', 5)
  longsubtask = RandomIntegerSumTask('waste cpu subtask long', 10)
  shortestsubtask = RandomIntegerSumTask('waste cpu subtask shortest', 4)

  # Add a subtask (shortsubtask) to shorttask that must run after
  # minitask and longtask has finished
  shorttask.addSubTask(shortsubtask, [minitask, longtask])
  # Add a subtask (longsubtask) to longtask that must be run
  # before the parent task
  longtask.addSubTask(longsubtask, [], QgsTask.ParentDependsOnSubTask)
  # Add a subtask (shortestsubtask) to longtask
  longtask.addSubTask(shortestsubtask)

  QgsApplication.taskManager().addTask(longtask)
  QgsApplication.taskManager().addTask(shorttask)
  QgsApplication.taskManager().addTask(minitask)

.. testcode:: tasks
  :hide:

  # We need the test output here, hence the blocking
  while QgsApplication.taskManager().countActiveTasks() != 0:
    QgsApplication.instance().processEvents()

.. testoutput:: tasks

    RandomIntegerSumTask(0): Started task "waste cpu subtask shortest"
    RandomIntegerSumTask(0): Started task "waste cpu short"
    RandomIntegerSumTask(0): Started task "waste cpu mini"
    RandomIntegerSumTask(0): Started task "waste cpu subtask long"
    RandomIntegerSumTask(3): Task "waste cpu subtask shortest" completed
    RandomTotal: 25452 (with 100 iterations)
    RandomIntegerSumTask(3): Task "waste cpu mini" completed
    RandomTotal: 23810 (with 100 iterations)
    RandomIntegerSumTask(3): Task "waste cpu subtask long" completed
    RandomTotal: 26308 (with 100 iterations)
    RandomIntegerSumTask(0): Started task "waste cpu long"
    RandomIntegerSumTask(3): Task "waste cpu long" completed
    RandomTotal: 22534 (with 100 iterations)

Task from function
..................

Create a task from a function (``doSomething`` in this example).
The first parameter of the function will hold the :class:`QgsTask <qgis.core.QgsTask>`
for the function.
An important (named) parameter is ``on_finished``, that specifies a
function that will be called when the task has completed.
The ``doSomething`` function in this example has an additional named
parameter ``wait_time``.

.. testcode:: tasks

  import random
  from time import sleep

  MESSAGE_CATEGORY = 'TaskFromFunction'

  def doSomething(task, wait_time):
      """
      Raises an exception to abort the task.
      Returns a result if success.
      The result will be passed, together with the exception (None in
      the case of success), to the on_finished method.
      If there is an exception, there will be no result.
      """
      QgsMessageLog.logMessage('Started task {}'.format(task.description()),
                               MESSAGE_CATEGORY, Qgis.Info)
      wait_time = wait_time / 100
      total = 0
      iterations = 0
      for i in range(100):
          sleep(wait_time)
          # use task.setProgress to report progress
          task.setProgress(i)
          arandominteger = random.randint(0, 500)
          total += arandominteger
          iterations += 1
          # check task.isCanceled() to handle cancellation
          if task.isCanceled():
              stopped(task)
              return None
          # raise an exception to abort the task
          if arandominteger == 42:
              raise Exception('bad value!')
      return {'total': total, 'iterations': iterations,
              'task': task.description()}

  def stopped(task):
      QgsMessageLog.logMessage(
          'Task "{name}" was canceled'.format(
              name=task.description()),
          MESSAGE_CATEGORY, Qgis.Info)

  def completed(exception, result=None):
      """This is called when doSomething is finished.
      Exception is not None if doSomething raises an exception.
      result is the return value of doSomething."""
      if exception is None:
          if result is None:
              QgsMessageLog.logMessage(
                  'Completed with no exception and no result '\
                  '(probably manually canceled by the user)',
                  MESSAGE_CATEGORY, Qgis.Warning)
          else:
              QgsMessageLog.logMessage(
                  'Task {name} completed\n'
                  'Total: {total} ( with {iterations} '
                  'iterations)'.format(
                      name=result['task'],
                      total=result['total'],
                      iterations=result['iterations']),
                  MESSAGE_CATEGORY, Qgis.Info)
      else:
          QgsMessageLog.logMessage("Exception: {}".format(exception),
                                   MESSAGE_CATEGORY, Qgis.Critical)
          raise exception

  # Create a few tasks
  task1 = QgsTask.fromFunction('Waste cpu 1', doSomething,
                               on_finished=completed, wait_time=4)
  task2 = QgsTask.fromFunction('Waste cpu 2', doSomething,
                               on_finished=completed, wait_time=3)
  QgsApplication.taskManager().addTask(task1)
  QgsApplication.taskManager().addTask(task2)

.. testcode:: tasks
  :hide:

  # We need the test output here, hence the blocking
  while QgsApplication.taskManager().countActiveTasks() != 0:
    QgsApplication.instance().processEvents()

.. testoutput:: tasks

    RandomIntegerSumTask(0): Started task "waste cpu subtask short"
    RandomTaskFromFunction(0): Started task Waste cpu 1
    RandomTaskFromFunction(0): Started task Waste cpu 2
    RandomTaskFromFunction(0): Task Waste cpu 2 completed
    RandomTotal: 23263 ( with 100 iterations)
    RandomTaskFromFunction(0): Task Waste cpu 1 completed
    RandomTotal: 25044 ( with 100 iterations)


Task from a processing algorithm
................................

Create a task that uses the algorithm :ref:`qgis:randompointsinextent <qgisrandompointsinextent>` to
generate 50000 random points inside a specified extent.  The result is
added to the project in a safe way.

.. this snippet crashes the test runner

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
      # because getMapLayer doesn't transfer ownership, the layer will
      # be deleted when context goes out of scope and you'll get a
      # crash.
      # takeMapLayer transfers ownership so it's then safe to add it
      # to the project and give the project ownership.
      if output_layer and output_layer.isValid():
          QgsProject.instance().addMapLayer(
               context.takeResultLayer(output_layer.id()))

  alg = QgsApplication.processingRegistry().algorithmById(
                                        'qgis:randompointsinextent')
  # `context` and `feedback` need to 
  # live for as least as long as `task`,
  # otherwise the program will crash.
  # Initializing them globally is a sure way
  # of avoiding this unfortunate situation.
  context = QgsProcessingContext()
  feedback = QgsProcessingFeedback()
  params = {
      'EXTENT': '0.0,10.0,40,50 [EPSG:4326]',
      'MIN_DISTANCE': 0.0,
      'POINTS_NUMBER': 50000,
      'TARGET_CRS': 'EPSG:4326',
      'OUTPUT': 'memory:My random points'
  }
  task = QgsProcessingAlgRunnerTask(alg, params, context, feedback)
  task.executed.connect(partial(task_finished, context))
  QgsApplication.taskManager().addTask(task)


See also: https://www.opengis.ch/2018/06/22/threads-in-pyqgis3/.
