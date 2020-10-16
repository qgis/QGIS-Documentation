.. _processing_standalone:

Using processing from the command line
======================================

.. only:: html

   .. contents::
      :local:

QGIS comes with a tool called `qgis_process` which allows you to call
processing algorithms and models directly from the command line without starting
QGIS desktop itself.

The command `list` can be used to get a list of all available providers
and algorithms.

.. code-block:: bash
   qgis_process list

The command `run` can be used to run an algorithm or model.
Specify the name of the algorithm or a path to a model as first parameter.

.. code-block:: bash
   qgis_process run qgis:buffer -- INPUT=source.shp DISTANCE=2 OUTPUT=buffered.shp

The `run` command also supports further parameters.

 - `--json` will format stdout output in a JSON structured way.
 - `--ellipsoid` will set the ellipsoid to the specified one.
 - `--distance_units` will use the specified distance units.
 - `--area_units` will use the specified area units.
 - `--project_path` will load the specified project for running the algorithm.

The command `help` can be used to get further information about commands or algorithms

.. code-block:: bash
   qgis_process help qgis:regularpoints
