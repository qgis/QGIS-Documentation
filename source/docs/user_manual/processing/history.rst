.. only:: html

   |updatedisclaimer|

.. _`processing.history`:

The history manager
============================

.. only:: html

   .. contents::
      :local:

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

.. _figure_history:

.. figure:: img/history.png
   :align: center

   History

Process information is kept as a command-line expression, even if the algorithm
was launched from the toolbox. This makes it also useful for those learning how
to use the command-line interface, since they can call an algorithm using the
toolbox and then check the history manager to see how that same algorithm could
be called from the command line.

Apart from browsing the entries in the registry, you can also re-execute processes by
simply double-clicking on the corresponding entry: the algorithm dialog opens
with parameters already filled; you can then change any of them to fit your
needs and re-run the algorithm.

The processing log
-------------------

The history dialog only contains the execution calls, but not the information
produced by the algorithm when executed. That information is written to the QGIS
log (:menuselection:`View --> Panels --> Log Messages Panel`), in a
:guilabel:`Processing` tab.

Third-party algorithms are usually executed by calling their
command-line interfaces, which communicate with the user via the console.
Although that console is not shown, usually a full dump of it is written to the log each
time you run one of those algorithms. To avoid cluttering the log with that
information, you can disable it for each provider, looking for the corresponding
option in the provider entry of the settings dialog.

Some algorithms, even if they can produce a result with the given input data,
might add comments or additional information to log if
they detect potential problems with the data, in order to warn you.
Make sure you check those messages in the log if you are having unexpected results.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
