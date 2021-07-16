.. _processing_standalone:

Using processing from the command line
======================================

.. only:: html

   .. contents::
      :local:

QGIS comes with a tool called ``QGIS Processing Executor`` which allows you to run
Processing algorithms and models (built-in or provided by plugins) directly
from the command line without starting QGIS Desktop itself.

From a command line tool, run ``qgis_process`` and you should get:

.. code-block:: bash

  QGIS Processing Executor - 3.21.0-Master 'Master' (3.21.0-Master)
  Usage: C:\OSGeo4W\apps\qgis-dev\bin\qgis_process.exe [--json] [--verbose] [command] [algorithm id or path to model file] [parameters]

  Options:

    --json          Output results as JSON objects
    --verbose       Output verbose logs

  Available commands:

    plugins          list available and active plugins
    plugins enable   enables an installed plugin. The plugin name must be specified, e.g. "plugins enable cartography_tools"
    plugins disable  disables an installed plugin. The plugin name must be specified, e.g. "plugins disable cartography_tools"
    list             list all available processing algorithms
    help             show help for an algorithm. The algorithm id or a path to a model file must be specified.
    run              runs an algorithm. The algorithm id or a path to a model file and parameter values must be specified.
                     Parameter values are specified after -- with PARAMETER=VALUE syntax.
                     Ordered list values for a parameter can be created by specifying the parameter multiple times,
                     e.g. --LAYERS=layer1.shp --LAYERS=layer2.shp
                     If required, the ellipsoid to use for distance and area calculations can be specified via the "--ELLIPSOID=name" argument.
                     If required, an existing QGIS project to use during the algorithm execution can be specified via the "--PROJECT_PATH=path" argument.

.. note::
  Only installed plugins that advertize ``hasProcessingProvider=yes``
  in their :file:`metadata.txt` file are recognized and can be activated
  or loaded by qgis_process tool.


The command ``list`` can be used to get a list of all available providers
and algorithms.

.. code-block:: bash

   qgis_process list

The command ``help`` can be used to get further information about commands or algorithms.

.. code-block:: bash

   qgis_process help qgis:regularpoints

The command ``run`` can be used to run an algorithm or model.
Specify the name of the algorithm or a path to a model as first parameter.

.. code-block:: bash

   qgis_process run qgis:buffer -- INPUT=source.shp DISTANCE=2 OUTPUT=buffered.shp

Where a parameter accepts a list of values, set the same variable multiple times.

.. code-block:: bash

   qgis_process run native:mergevectorlayers -- LAYERS=input1.shp LAYERS=input2.shp OUTPUT=merged.shp

While running an algorithm a text-based feedback bar is shown, and the operation
can be cancelled via :kbd:`CTRL+C`.
The ``run`` command also supports further parameters.

- ``--json`` will format stdout output in a JSON structured way.
- ``--ellipsoid`` will set the ellipsoid to the specified one.
- ``--distance_units`` will use the specified distance units.
- ``--area_units`` will use the specified area units.
- ``--project_path`` will load the specified project for running the algorithm.
