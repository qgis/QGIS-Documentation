Pre- and post-execution script hooks
====================================

.. note:: This lesson shows how to use pre- and post-execution hooks, which allow
   to perform additional operations before and after actual processing.

Pre- and post-execution hooks are Processing scripts that run before and after
actual data processing is performed. This can be used to automate tasks that
should be performed whenever an algorithm is executed.

The syntax of the hooks is identical to the syntax of Processing scripts, see the
corresponding `chapter <https://docs.qgis.org/testing/en/docs/user_manual/processing/console.html>`_
in the QGIS User Guide for more details.

In addition to all scripts features, in hooks you can use a special global
variable named ``alg``, which represents the algorithm that has just been
(or is about to be) executed.

Here is an example post-execution script. By default, Processing stores analysis results in temporary
files. This script will copy outputs to a specific directory, so they won't be deleted after closing QGIS.

::

    import os
    import shutil
    from processing.core.outputs import OutputVector, OutputRaster, OutputFile

    MY_DIRECTORY = '/home/alex/outputs'

    for output in alg.outputs:
        if isinstance(output, (OutputVector, OutputRaster, OutputFile)):
            dirname = os.path.split(output.value)[0]
            shutil.copytree(dirname, MY_DIRECTORY)


In the first two lines we import the required Python packages: ``os`` --- for path
manipulations, e.g. extracting file name, and ``shutil`` --- for various filesystem
operations like copying files. In the third line we import Processing outputs. This will be
explained in more detail later in this lesson.

Then we define a ``MY_DIRECTORY`` constant, which is the path to the directory where we
want to copy analysis results.

At the end of the script, we have the main hook code. In the loop we iterate over all algorithm outputs
and check if this output is a file-based output and can be copied. If so, we determine
top-level directory in which output files are located and then copy all files to
our directory.

To activate this hook we need to open the Processing options, find the entry named 
*Post-execution script file* in the *General* group, and specify the filename of the
hook script there. the specified hook will be executed after each Processing algorithm.

In a similar way, we can implement pre-execution hooks. For example, let's create a hook to
check input vectors for geometry errors.

::

    from qgis.core import QgsGeometry, QgsFeatureRequest
    from processing.core.parameters import ParameterVector

    for param in alg.parameters:
        if isinstance(param, ParameterVector):
            layer = processing.getObject(param.value)
            for f in layer.getFeatures(QgsFeatureRequest().setSubsetOfAttributes([])):
                errors = f.geometry().validateGeometry()
                if len(errors) > 0:
                    progress.setInfo('One of the input vectors contains invalid geometries!')

As in the previous example, first we import required QGIS and Processing
packages.

Then we iterate over all the algorithm parameters and if a ParameterVector parameter is found, we
get the corresponding vector layer object from it. We loop over all the features of the layer and 
check them for geometry errors. If at least one feature contains an invalid geometry, we print a warning message.

To activate this hook we need enter its filename in the *Pre-execution script
file* option in the Processing configuration dialog. 
The hook will be executed before running any Processing algorithm.
