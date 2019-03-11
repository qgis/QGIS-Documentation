.. only:: html

   |updatedisclaimer|

.. index:: Plugins; Processing algorithm
.. _processing_plugin:

****************************
Writing a Processing plugin
****************************

.. warning:: |outofdate|

.. contents::
   :local:

Depending on the kind of plugin that you are going to develop, it might be better
option to add its functionality as a Processing algorithm (or a set of them).
That would provide a better integration within QGIS, additional functionality (since
it can be run in the components of Processing, such as the modeler or the batch
processing interface), and a quicker development time (since Processing will take of
a large part of the work).

To distribute those algorithms, you should create a new plugin that adds them to the
Processign Toolbox. The plugin should contain an algorithm provider, which has to be 
registered when the plugin is instantiated.

To create a plugin which contains an algorithm provider, follow these steps:

* Install the Plugin Builder plugin
* Create a new plugin using the Plugin Builder. When the Plugin Builder asks you for
  the template to use, select "Processing provider". 
* The created plugin contains a provider with a single algorithm. Both the provider
  file and the algorithm file are fully commented and contain information about how to
  modify the provider and add additional algorithms. Refer to them for more information.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |outofdate| replace:: `Despite our constant efforts, information beyond this line may not be updated for QGIS 3. Refer to https://qgis.org/pyqgis/master for the python API documentation or, give a hand to update the chapters you know about. Thanks.`
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
