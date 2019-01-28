.. only:: html

   |updatedisclaimer|

.. _processing_console:

Using processing algorithms from the console
==============================================

.. only:: html

   .. contents::
      :local:

The console allows advanced users to increase their productivity and
perform complex operations that cannot be performed using any of the
other GUI elements of the processing framework. Models involving
several algorithms can be defined using the command-line interface,
and additional operations such as loops and conditional sentences can
be added to create more flexible and powerful workflows.

There is not a processing console in QGIS, but all processing commands
are available instead from the QGIS built-in :ref:`Python console
<console>`.  That means that you can incorporate those commands into
your console work and connect processing algorithms to all the other
features (including methods from the QGIS API) available from there.

The code that you can execute from the Python console, even if it does
not call any specific processing method, can be converted into a new
algorithm that you can later call from the toolbox, the graphical
modeler or any other component, just like you do with any other
algorithm. In fact, some algorithms that you can find in the toolbox
are simple scripts.

In this section, we will see how to use processing algorithms from the
QGIS Python console, and also how to write algorithms using Python.

Calling algorithms from the Python console
------------------------------------------

The first thing you have to do is to import the processing functions
with the following line:

::

    >>> import processing

Now, there is basically just one (interesting) thing you can do with
that from the console: execute an algorithm. That is done using the
``run()`` method, which takes the name of the algorithm to execute
as its first parameter, and then a variable number of additional
parameters depending on the requirements of the algorithm. So the
first thing you need to know is the name of the algorithm to
execute. That is not the name you see in the toolbox, but rather a
unique command–line name. To find the right name for your algorithm,
you can use the processingRegistry. Type the following line in your
console:

::

    >>> for alg in QgsApplication.processingRegistry().algorithms():
            print(alg.id(), "->", alg.displayName())

You will see something like this (with some extra dashes added to
improve readability).

::

   3d:tessellate --------------> Tessellate
   gdal:aspect ----------------> Aspect
   gdal:assignprojection ------> Assign projection
   gdal:buffervectors ---------> Buffer vectors
   gdal:buildvirtualraster ----> Build Virtual Raster
   gdal:cliprasterbyextent ----> Clip raster by extent
   gdal:cliprasterbymasklayer -> Clip raster by mask layer
   gdal:clipvectorbyextent ----> Clip vector by extent
   gdal:clipvectorbypolygon ---> Clip vector by mask layer
   gdal:colorrelief -----------> Color relief
   gdal:contour ---------------> Contour
   gdal:convertformat ---------> Convert format
   gdal:dissolve --------------> Dissolve
   ...

That's a list of all the available algorithm IDs, sorted by provider
name and algorithm name, along with their corresponding names.

Once you know the command-line name of the algorithm, the next thing
to do is to determine the right syntax to execute it. That means
knowing which parameters are needed when calling the ``run()`` method.

There is a method to describe an algorithm in detail, which can be
used to get a list of the parameters that an algorithm requires and
the outputs that it will generate. To get this information, you can
use the ``algorithmHelp(id_of_the_algorithm)`` method. Use the ID of
the algorithm, not the full descriptive name.

Calling the method with ``native:buffer`` as parameter
(``qgis:buffer`` is an alias for ``native:buffer`` and will also
work), you get the following description:

::

     >>> processing.algorithmHelp("native:buffer")
     Buffer (native:buffer)
     
     This algorithm computes a buffer area for all the features in an
     input layer, using a fixed or dynamic distance.
     
     The segments parameter controls the number of line segments to
     use to approximate a quarter circle when creating rounded
     offsets.
     
     The end cap style parameter controls how line endings are handled
     in the buffer.
     
     The join style parameter specifies whether round, miter or
     beveled joins should be used when offsetting corners in a line.
     
     The miter limit parameter is only applicable for miter join
     styles, and controls the maximum distance from the offset curve
     to use when creating a mitered join.
     
     
     ----------------
     Input parameters
     ----------------
     
     INPUT: Input layer
     
     	Parameter type:	QgsProcessingParameterFeatureSource
     
     	Accepted data types:
     		- str: layer ID
     		- str: layer name
     		- str: layer source
     		- QgsProcessingFeatureSourceDefinition
     		- QgsProperty
     		- QgsVectorLayer
     
     DISTANCE: Distance
     
     	Parameter type:	QgsProcessingParameterDistance
     
     	Accepted data types:
     		- int
     		- float
     		- QgsProperty
     
     SEGMENTS: Segments
     
     	Parameter type:	QgsProcessingParameterNumber
     
     	Accepted data types:
     		- int
     		- float
     		- QgsProperty
     
     END_CAP_STYLE: End cap style
     
     	Parameter type:	QgsProcessingParameterEnum
     
     	Available values:
     		- 0: Round
     		- 1: Flat
     		- 2: Square
     
     	Accepted data types:
     		- int
     		- str: as string representation of int, e.g. '1'
     		- QgsProperty
     
     JOIN_STYLE: Join style

	Parameter type:	QgsProcessingParameterEnum

	Available values:
		- 0: Round
		- 1: Miter
		- 2: Bevel

	Accepted data types:
		- int
		- str: as string representation of int, e.g. '1'
		- QgsProperty
     
     MITER_LIMIT: Miter limit
     
     	Parameter type:	QgsProcessingParameterNumber
     
     	Accepted data types:
     		- int
     		- float
     		- QgsProperty
     
     DISSOLVE: Dissolve result
     
     	Parameter type:	QgsProcessingParameterBoolean
     
     	Accepted data types:
		- bool
		- int
		- str
		- QgsProperty
          
     OUTPUT: Buffered
     
     	Parameter type:	QgsProcessingParameterFeatureSink
     
     	Accepted data types:
     		- str: destination vector file, e.g. 'd:/test.shp'
     		- str: 'memory:' to store result in temporary memory layer
     		- str: using vector provider ID prefix and destination URI,
                       e.g. 'postgres:...' to store result in PostGIS table
     		- QgsProcessingOutputLayerDefinition
     		- QgsProperty
     
     ----------------
     Outputs
     ----------------
     
     OUTPUT:  <QgsProcessingOutputVectorLayer>
     	Buffered
     
     
Now you have everything you need to run any algorithm. As we have
already mentioned, algorithms can be run using: ``run()``.
Its syntax is as follows:

::

    >>> processing.run(name_of_the_algorithm, parameters)

Where parameters is a dictionary of parameters that depend on the
algorithm you want to run, and is exactly the list that the
``algorithmHelp()`` method gives you.

::

    >>> processing.run("native:buffer", {'INPUT': '/data/lines.shp',
                  'DISTANCE': 100.0,
                  'SEGMENTS': 10,
                  'DISSOLVE': True,
                  'END_CAP_STYLE': 0,
                  'JOIN_STYLE': 0,
                  'MITER_LIMIT': 10,
                  'OUTPUT': '/data/buffers.shp'})


If a parameter is optional and you do not want to use it, then don't
include it in the dictionary.

If a parameter is not specified, the default value will be used.

Depending on the type of parameter, values are introduced differently. The next
list gives a quick review of how to introduce values for each type of input parameter:

* Raster Layer, Vector Layer or Table. Simply use a string with the name that
  identifies the data object to use (the name it has in the QGIS Table of
  Contents) or a filename (if the corresponding layer is not opened, it will be
  opened but not added to the map canvas). If you have an instance of a QGIS
  object representing the layer, you can also pass it as parameter.
* Enumeration. If an algorithm has an enumeration parameter, the value of that
  parameter should be entered using an integer value. To know the available
  options, you can use the ``algorithmHelp()`` command, as above.
  For instance, the "native.buffer" algorithm has an enumeration called JOIN_STYLE:

  ::

     JOIN_STYLE: Join style

	Parameter type:	QgsProcessingParameterEnum

	Available values:
		- 0: Round
		- 1: Miter
		- 2: Bevel

	Accepted data types:
		- int
		- str: as string representation of int, e.g. '1'
		- QgsProperty
     
  In this case, the parameter has three options.
  Notice that ordering is zero-based.
* Boolean.  Use ``True`` or ``False``.
* Multiple input. The value is a string with input descriptors separated by
  semicolons (``;``). As in the case of single layers or tables, each input
  descriptor can be the data object name, or its file path.
* Table Field from XXX. Use a string with the name of the field to use. This
  parameter is case-sensitive.
* Fixed Table. Type the list of all table values separated by commas (``,``) and
  enclosed between quotes (``"``). Values start on the upper row and go from left
  to right. You can also use a 2-D array of values representing the table.
* CRS. Enter the EPSG code number of the desired CRS.
* Extent. You must use a string with ``xmin``, ``xmax``, ``ymin`` and ``ymax``
  values separated by commas (``,``).

Boolean, file, string and numerical parameters do not need any additional
explanations.

Input parameters such as strings, booleans, or numerical values have default values.
The default value is used if the corresponding parameter entry is missing.

For output data objects, type the file path to be used to save it, just as it is
done from the toolbox. If the output object is not specified, the result is
saved to a temporary file (or skipped if it is an optional output).
The extension of the file determines the file format. If you enter a
file extension not supported by the algorithm, the default
file format for that output type will be used, and its corresponding extension
appended to the given file path.

Unlike when an algorithm is executed from the toolbox, outputs are not
added to the map canvas if you execute that same algorithm from the
Python console using ``run()``, but ``runAndLoadResults()`` will do
that.

The ``run`` method returns a dictionary with one or more output names (the
ones shown in the algorithm description) as keys and the file paths of
those outputs as values:

::

    >>> myresult = processing.run("native:buffer", {'INPUT': '/data/lines.shp',
                  'DISTANCE': 100.0,
                  'SEGMENTS': 10,
                  'DISSOLVE': True,
                  'END_CAP_STYLE': 0,
                  'JOIN_STYLE': 0,
                  'MITER_LIMIT': 10,
                  'OUTPUT': '/data/buffers.shp'})
    >>> myresult['OUTPUT']
    /data/buffers.shp

You can load feature output by passing the corresponding file paths to
the ``load()`` method.
Or you could use ``runAndLoadResults()`` instead of ``run()`` to load
them immediately.

Creating scripts and running them from the toolbox
--------------------------------------------------

You can create your own algorithms by writing Python code.
Processing scripts extend ``QgsProcessingAlgorithm``, so you
need to add some extra lines of code to implement mandatory functions.
You can find :guilabel:`Create new script` (clean sheet) and
:guilabel:`Create New Script from Template` (template that includes
code for mandatory functions of ``QgsProcessingAlgorithm``) under
the :guilabel:`Scripts` dropdown menu on the top of the Processing toolbox.
The Processing Script Editor will open, and that's where you should type
your code.
Saving the script from there in the :file:`scripts` folder (the default folder
when you open the save file dialog) with a :file:`.py` extension should
create the corresponding algorithm.

The name of the algorithm (the one you will see in the toolbox) is defined
within the code.

Let's have a look at the following code, which defines a Processing
algorithm that performs a buffer operation with a user defined buffer
distance on a vector layer that is specified by the user, after first
smoothing the layer.

.. code-block:: python

  from qgis.core import (QgsProcessingAlgorithm, 
         QgsProcessingParameterNumber,
         QgsProcessingParameterFeatureSource,
         QgsProcessingParameterFeatureSink)

  import processing

  class algTest(QgsProcessingAlgorithm):
      INPUT_BUFFERDIST = 'BUFFERDIST'
      OUTPUT_BUFFER = 'OUTPUT_BUFFER'
      INPUT_VECTOR = 'INPUT_VECTOR'

      def __init__(self):
          super().__init__()

      def name(self):
          return "algTest"

      def displayName(self):
          return "algTest script"

      def createInstance(self):
          return type(self)()

      def initAlgorithm(self, config=None):
          self.addParameter(QgsProcessingParameterFeatureSource(
              self.INPUT_VECTOR, "Input vector"))
          self.addParameter(QgsProcessingParameterNumber(
              self.BUFFERDIST, "Buffer distance", 
              QgsProcessingParameterNumber.Double,
              100.0))
          self.addParameter(QgsProcessingParameterFeatureSink(
              self.OUTPUT_BUFFER, "Output buffer"))

      def processAlgorithm(self, parameters, context, feedback):
          # Dummy function to enable running an alg inside an alg
          def no_post_process(alg, context, feedback):
              pass
          #DO SOMETHING
          algresult = processing.run("native:smoothgeometry",
              {'INPUT': parameters[self.INPUT_VECTOR],
               'ITERATIONS':2,
               'OFFSET':0.25,
               'MAX_ANGLE':180,
               'OUTPUT': 'memory:'},
              context=context, feedback=feedback, onFinish=no_post_process)
          smoothed = algresult['OUTPUT']
          algresult = processing.run('native:buffer',
              {'INPUT': smoothed,
              'DISTANCE': parameters[self.BUFFERDIST],
              'SEGMENTS': 5,
              'END_CAP_STYLE': 0,
              'JOIN_STYLE': 0,
              'MITER_LIMIT': 10,
              'DISSOLVE': True,
              'OUTPUT': parameters[self.OUTPUT_BUFFER]},
              context=context, feedback=feedback, onFinish=no_post_process)
          buffered = algresult['OUTPUT']
          return {self.OUTPUT_BUFFER: buffered}

After doing the necessary imports, the following ``QgsProcessingAlgorithm``
functions are specified:

* ``name``: The id of the algorithm (lowercase).
* ``displayName``: A human readable name for the algorithm.
* ``createInstance``: Create a new instance of the algorithm class.
* ``initAlgorithm``: Configure the parameterDefinitions and
  outputDefinitions.

  Here you describe the parameters and output of the algorithm.  In
  this case, a feature source for the input, a feature sink for
  the result and a number for the buffer distance.
* ``processAlgorithm``: Do the work.

  Here we first run the ``smoothgeometry`` algorithm to smooth the
  geometry, and then we run the ``buffer`` algorithm on the smoothed
  output.
  To be able to run algorithms from within another algorithm we have to
  define a dummy function for the ``onFinish`` parameter for ``run``.
  This is the ``no_post_process`` function.
  You can see how input and output parameters are used as parameters
  to the ``smoothgeometry`` and ``buffer`` algorithms.

There are a number of different parameter types available for
input and output.
Their definitions can be found in processing.h.  Below is an
alphabetically sorted list (see `the Python API documentation
<https://qgis.org/pyqgis/master/core/Processing/QgsProcessingAlgorithm.html>`_
for details).

* QgsProcessingParameterBand
* QgsProcessingParameterBoolean
* QgsProcessingParameterCrs
* QgsProcessingParameterDistance
* QgsProcessingParameterEnum
* QgsProcessingParameterExpression
* QgsProcessingParameterExtent
* QgsProcessingParameterFeatureSink
* QgsProcessingParameterFeatureSource
* QgsProcessingParameterField - A field in the attributes table of a
  vector layer.  The name of the layer has to be specified.
* QgsProcessingParameterFile
* QgsProcessingParameterFileDestination
* QgsProcessingParameterFolderDestination
* QgsProcessingParameterMapLayer
* QgsProcessingParameterMatrix
* QgsProcessingParameterMultipleLayers
* QgsProcessingParameterNumber
* QgsProcessingParameterPoint
* QgsProcessingParameterRange
* QgsProcessingParameterRasterDestination
* QgsProcessingParameterRasterLayer
* QgsProcessingParameterString
* QgsProcessingParameterVectorDestination
* QgsProcessingParameterVectorLayer

The first parameter to the constructors is the name of the parameter,
and the second is the description of the parameter (for the user
interface).
The rest of the constructor parameters are parameter type specific.

The input can be turned into QGIS classes using the ``parameterAs`` functions
of ``QgsProcessingAlgorithm``.
For instance to get the number provided for the buffer distance as a double::

  self.parameterAsDouble(parameters, self.BUFFERDIST, context)).

The ``processAlgorithm`` function should return a dictionary
containing values for every output defined by the algorithm. This
allows access to these outputs from other algorithms, including other
algorithms contained within the same model.

Well behaved algorithms should define and return as many outputs as
makes sense. Non-feature outputs, such as numbers and strings, are very
useful when running your algorithm as part of a larger model, as these
values can be used as input parameters for subsequent algorithms
within the model. Consider adding numeric outputs for things like the
number of features processed, the number of invalid features
encountered, the number of features output, etc. The more outputs you
return, the more useful your algorithm becomes!

Feedback
........
The ``feedback`` object passed to ``processAlgorithm`` should be used for
user feedback / interaction.
You can use the ``setProgress`` function of the ``feedback`` object to update
the progress bar (0 to 100) to inform the user about the progress of the
algorithm.  This is very useful if your algorithm takes a long time to
complete.
The ``feedback`` object provides an ``isCanceled`` method that
should be monitored to enable cancelation of the algorithm by the user.
The ``pushInfo`` method of ``feedback`` can be used to send information
to the user, and ``reportError`` is handy for pushing non-fatal errors
to users.

Algorithms should avoid using other forms of providing feedback to
users, such as print statements or logging to QgsMessageLog, and
should always use the feedback object instead. This allows verbose
logging for the algorithm, and is also thread-safe (which is
important, given that algorithms are typically run in a background
thread).

Handling errors
...............

If your algorithm encounters an error which prevents it from
executing, such as invalid input values or some other condition from
which it cannot or should not recover, then you should raise a
QgsProcessingException. E.g.::

  if feature['value'] < 20:
    raise QgsProcessingException('Invalid input value {}, must be >= 20'.format(feature['value']))

Try to avoid raising QgsProcessingException for non-fatal errors
(e.g. when a feature has a null geometry), and instead just report
these errors via ``feedback.reportError()`` and skip the feature. This
helps make your algorithm "model-friendly", as it avoids halting the
execution of an entire algorithm when a non-fatal error is
encountered.

Documenting your scripts
........................

As in the case of models, you can create additional documentation for
your scripts, to explain what they do and how to use them.

``QgsProcessingAlgorithm`` provides the ``helpString()``,
``shortHelpString()`` and ``helpUrl()`` functions for that purpose.
Specify / override these to provide more help to the user.

``shortDescription()`` (added in 3.4) is used in the tooltip when
hovering over the algorithm in the toolbox.

Pre- and post-execution script hooks
------------------------------------

Scripts can also be used as pre- and post-execution hooks that are run before
and after an algorithm is run, respectively. This can be used to automate tasks
that should be performed whenever an algorithm is executed.

The syntax is identical to the syntax explained above, but an additional global
variable named ``alg`` is available, representing the algorithm that has just
been (or is about to be) executed.

In the :guilabel:`General` group of the processing options dialog, you will find two
entries named :guilabel:`Pre-execution script` and :guilabel:`Post-execution
script` where the filenames of the scripts to be run in each case can be
entered.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
