.. _vector:

****************************
Writing a Processing plugin
****************************

.. contents::
   :local:

Depending on the kind of plugin that you are going to develop, it might be better option to add its functionality as a Processing algorithm (or a set of them). That would provide a better integration within QGIS, additional functionality (since it can be run in the components of Processing, such as the modeler or the batch processing interface), and a quicker development time (since Processing will take of a large part of the work).

This document describes how to create a new plugin that adds its functionality as Processing algorithms.

There are two main mechanisms for doing that:

- Creating a plugin that adds an algorithm provider: This options is more complex, but provides more flexibility
- Creating a plugin that contains a set of processing scripts: The simplest solution, you just need a set of Processing script files.

Creating a plugin that adds an algorithm provider 
==================================================

To create an algorithm provider, follow this steps.

- Install the Plugin Builder plugin
- Create a new plugin using the Plugin Builder. When the Plugin Builder asks you for the template to use, select "Processing provider". 
- The created plugin contains a provider with a single algorithm. Both the provider file and the algorithm file are fully commented and contain information about how to modify the provider and add additional algorithms. Refer to them for more information.

Creating a plugin that contains a set of processing scripts:
================================================================
To create an algorithm provider, follow this steps.

- Create your scripts as described in the PyQGIS cookbook. All the scripts that you want to add, you should have them available in the Processing toolbox.
- In the *Scripts/Tools* group in the Processing toolbox, double-click on the *Create script collection plugin* item. You will see a window where you should select the scripts to add to the plugin (from the set of available ones in the toolbox), and some additional information needed for the plugin metadata.
- Click on OK and the plugin will be created.
- You can add additional scripts to the plugin by adding scripts python files to the *scripts* folder in the resulting plugin folder.

