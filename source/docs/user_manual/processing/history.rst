|updatedisclaimer|

.. _`processing.history`:

The history manager
============================

The processing history
------------------------

Every time you execute an algorithm, information about the process is
stored in the history manager. Along with the parameters used, the date
and time of the execution are also saved.

This way, it is easy to track and control all the work that has been developed
using the Processing framework, and to reproduce it.

The history manager is a set of registry entries grouped according to
their date of execution, making it easier to find information about an algorithm
executed at any particular moment.

.. _figure_history_1:

.. only:: html

   **Figure Processing 31:**

.. figure:: /static/user_manual/processing/history.png
   :align: center

   History |win|

Process information is kept as a command-line expression, even if the algorithm
was launched from the toolbox. This makes it also useful for those learning how
to use the command-line interface, since they can call an algorithm using the
toolbox and then check the history manager to see how that same algorithm could
be called from the command line.

Apart from browsing the entries in the registry, you can also re-execute processes by
simply double-clicking on the corresponding entry.

The processing log
-------------------

The history dialog only contains the execution calls, but not the information produced by the algorithm when executed. That information is written to the QGIS log, in a :guilabel:`Processing` tab.

Third-party algorithms are usually executed by calling their
command-line interfaces, which communicate with the user via the console.
Although that console is not shown, a full dump of it is written to the log each time you run one of those algorithms. To avoid cluttering the log with that information, you can disable it for each provider, looking for the corresponding option in the provider entry of the settings dialog.

Some algorithms, even if they can produce a result with the given input data,
might add comments or additional information to log if
they detect potential problems with the data, in order to warn you.
Make sure you check those messages in the log if you are having unexpected results.
