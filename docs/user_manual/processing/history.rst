.. _`processing.history`:

The history manager
============================

.. only:: html

   .. contents::
      :local:

The processing history
------------------------

Every time you execute an algorithm, information about the process is
stored in the history manager.
The date and time of the execution are saved, along with the
parameters used, making it is easy to track and control all the work
that has been developed using the Processing framework, and to
reproduce it.

.. _figure_history:

.. figure:: img/history.png
   :align: center

   History

Process information is kept as a command-line expression, even if the
algorithm was launched from the toolbox.
This makes it useful for those learning how to use the command-line
interface, since they can call an algorithm using the toolbox and then
check the history manager to see how it could be called from the
command line.

Apart from browsing the entries in the registry, you can also
re-execute processes by simply double-clicking on the entry.
The algorithm dialog then opens with parameters already set, and you
can change any of them to fit your needs and re-run the algorithm.

The :guilabel:`History` dialog also provides a convenient way to
contribute to the consolidation of the testing infrastructure of QGIS
Processing algorithms and scripts.
When you right-click on an entry, you can :guilabel:`Create Test...`
using the concerned algorithm and parameters, following instructions
at :source:`python/plugins/processing/tests/README.md`.


The processing log
-------------------

The history dialog only contains the execution calls, but not the
information produced by the algorithm when executed.
That information is written to the QGIS log
(:menuselection:`View --> Panels --> Log Messages Panel`).

Third-party algorithms are usually executed by using their
command-line interfaces, which communicate with the user via the
console.
Although that console is not shown, usually a full dump of it is
written to the log each time you run one of those algorithms.
To avoid cluttering the log with that information, you can disable it
for each provider in the settings dialog.

Some algorithms, even if they can produce a result with the given
input data, output comments or additional information to log when
they detect potential problems with the data, in order to warn you.
Make sure you check those messages in the log if you get unexpected
results.
