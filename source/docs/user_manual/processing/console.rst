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

Depending on the type of parameter, values are introduced differently. The next
list gives a quick review of how to introduce values for each type of input parameter:

* Raster Layer, Vector Layer or Table. Simply use a string with the name that
  identifies the data object to use (the name it has in the QGIS Table of
  Contents) or a filename (if the corresponding layer is not opened, it will be
  opened but not added to the map canvas). If you have an instance of a QGIS
  object representing the layer, you can also pass it as parameter. If the input
  is optional and you do not want to use any data object, use ``None``.
* Selection. If an algorithm has a selection parameter, the value of that
  parameter should be entered using an integer value. To know the available
  options, you can use the ``algorithmHelp()`` command, as above.
  For instance, the "native.buffer" algorithm has a selection called JOIN_STYLE:

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
To use them, specify ``None`` in the corresponding parameter entry.

For output data objects, type the file path to be used to save it, just as it is
done from the toolbox. If you want to save the result to a temporary file, use
``None``. The extension of the file determines the file format. If you enter a
file extension not supported by the algorithm, the default
file format for that output type will be used, and its corresponding extension
appended to the given file path.

Unlike when an algorithm is executed from the toolbox, outputs are not added to
the map canvas if you execute that same algorithm from the Python console. If you
want to add an output to the map canvas, you have to do it yourself after running the
algorithm. To do so, you can use QGIS API commands, or, even easier, use one of
the handy methods provided for such tasks.

The ``run`` method returns a dictionary with the output names (the
ones shown in the algorithm description) as keys and the file paths of
those outputs as values. You can load those layers by passing the corresponding
file paths to the ``load()`` method.

.. warning:: No QGIS 3 updates beyond this point (ToDo)

Additional functions for handling data
--------------------------------------

Apart from the functions used to call algorithms, importing the
``processing`` package will also import some additional functions that make it
easier to work with data, particularly vector data. They are just convenience
functions that wrap some functionality from the QGIS API, usually with a less
complex syntax. These functions should be used when developing new algorithms,
as they make it easier to operate with input data.

Below is a list of some of these commands. More information can be found in the
classes under the ``processing/tools`` package, and also in the example scripts
provided with QGIS.

* ``getObject(obj)``: Returns a QGIS object (a layer or table) from the passed
  object, which can be a filename or the name of the object in the QGIS Layers List
* ``values(layer, fields)``: Returns the values in the attributes table of a
  vector layer, for the passed fields. Fields can be passed as field names or as
  zero-based field indices. Returns a dict of lists, with the passed field
  identifiers as keys. It considers the existing selection.
* ``features(layer)``: Returns an iterator over the features of a vector
  layer, considering the existing selection.
* ``uniqueValues(layer, field)``: Returns a list of unique values for a given
  attribute.  Attributes can be passed as a field name or a zero-based field
  index. It considers the existing selection.

Creating scripts and running them from the toolbox
--------------------------------------------------

You can create your own algorithms by writing the corresponding Python code and
adding a few extra lines to supply additional information needed to define the
semantics of the algorithm.
You can find a :guilabel:`Create new script` menu under the :guilabel:`Tools`
group in the :guilabel:`Script` algorithms block of the toolbox. Double-click
on it to open the script editing dialog. That's where you should type your code.
Saving the script from there in the :file:`scripts` folder (the default folder
when you open the save file dialog) with :file:`.py` extension will
automatically create the corresponding algorithm.

The name of the algorithm (the one you will see in the toolbox) is created from
the filename, removing its extension and replacing low hyphens with blank spaces.

Let's have a look at the following code, which calculates the Topographic
Wetness Index (TWI) directly from a DEM.

.. code-block:: python

   ##dem=raster
   ##twi=output
   ret_slope = processing.runalg("saga:slopeaspectcurvature", dem, 0, None,
                   None, None, None, None)
   ret_area = processing.runalg("saga:catchmentarea(mass-fluxmethod)", dem,
                   0, False, False, False, False, None, None, None, None, None)
   processing.runalg("saga:topographicwetnessindex(twi), ret_slope['SLOPE'],
                   ret_area['AREA'], None, 1, 0, twi)

As you can see, the calculation involves three algorithms, all of them coming
from SAGA. The last one calculates the TWI, but it needs a slope layer and a
flow accumulation layer. We do not have these layers, but since we have the DEM,
we can calculate them by calling the corresponding SAGA algorithms.

The part of the code where this processing takes place is not difficult to
understand if you have read the previous sections in this chapter. The first
lines, however, need some additional explanation. They provide the
information that is needed to turn your code into an algorithm that can be run
from any of the GUI components, like the toolbox or the graphical modeler.

These lines start with a double Python comment symbol (``##``) and have the
following structure:

::

    [parameter_name]=[parameter_type] [optional_values]

Here is a list of all the parameter types that are supported in processing
scripts, their syntax and some examples.

* ``raster``. A raster layer.
* ``vector``. A vector layer.
* ``table``. A table.
* ``number``. A numerical value. A default value must be provided. For instance,
  ``depth=number 2.4``.
* ``string``. A text string. As in the case of numerical values, a default value
  must be added. For instance, ``name=string Victor``.
* ``boolean``. A boolean value. Add ``True`` or ``False`` after it to set the
  default value. For example, ``verbose=boolean True``.
* ``multiple raster``. A set of input raster layers.
* ``multiple vector``. A set of input vector layers.
* ``field``. A field in the attributes table of a vector layer. The name of the
  layer has to be added after the ``field`` tag. For instance, if you have
  declared a vector input with ``mylayer=vector``, you could use ``myfield=field
  mylayer`` to add a field from that layer as parameter.
* ``folder``. A folder.
* ``file``. A filename.

The parameter name is the name that will be shown to the user when executing the
algorithm, and also the variable name to use in the script code. The value entered
by the user for that parameter will be assigned to a variable with that name.

When showing the name of the parameter to the user, the name will be edited to
improve its appearance, replacing low hyphens with spaces. So, for instance,
if you want the user to see a parameter named ``A numerical value``, you can use
the variable name ``A_numerical_value``.

Layers and table values are strings containing the file path of the corresponding
object. To turn them into a QGIS object, you can use the
``processing.getObjectFromUri()`` function. Multiple inputs also have a string
value, which contains the file paths to all selected object, separated by
semicolons (``;``).

Outputs are defined in a similar manner, using the following tags:

* ``output raster``
* ``output vector``
* ``output table``
* ``output html``
* ``output file``
* ``output number``
* ``output string``

The value assigned to the output variables is always a string with a file path.
It will correspond to a temporary file path in case the user has not entered any
output filename.

When you declare an output, the algorithm will try to add it to QGIS once it
is finished. That is why, although the ``runalg()`` method does not
load the layers it produces, the final TWI layer will be loaded (using the case
of our previous example), since it is saved
to the file entered by the user, which is the value of the corresponding output.

Do not use the ``load()`` method in your script algorithms, just when working
with the console line. If a layer is created as output of an algorithm, it should
be declared as such. Otherwise, you will not be able to properly use the algorithm
in the modeler, since its syntax (as defined by the tags explained above) will
not match what the algorithm really creates.

Hidden outputs (numbers and strings) do not have a value. Instead, you
have to assign a value to them. To do so, just set the value of a variable with
the name you used to declare that output. For instance, if you have used this
declaration,

::

    ##average=output number

the following line will set the value of the output to 5:

::

    average = 5

In addition to the tags for parameters and outputs, you can also define the group
under which the algorithm will be shown, using the ``group`` tag.

If your algorithm takes a long time to process, it is a good idea to inform the
user. You have a global named ``progress`` available, with two possible methods:
``setText(text)`` and ``setPercentage(percent)`` to modify the progress text and
the progress bar.

Several examples are provided. Please check them to see real
examples of how to create algorithms using the processing framework classes. You can
right-click on any script algorithm and select :guilabel:`Edit script` to edit
its code or just to see it.

Documenting your scripts
------------------------

As in the case of models, you can create additional documentation for your scripts,
to explain what they do and how to use them. In the script editing dialog, you will
find an **[Edit script help]** button. Click on it and it will take you to the help
editing dialog. Check the section about the graphical modeler to know more about
this dialog and how to use it.

Help files are saved in the same folder as the script itself, adding the
:file:`.help` extension to the filename. Notice that you can edit your script's
help before saving the script for the first time. If you later close the script editing
dialog without saving the script (i.e., you discard it), the help content you
wrote will be lost. If your script was already saved and is associated to a
filename, saving the help content is done automatically.

Pre- and post-execution script hooks
------------------------------------

Scripts can also be used to set pre- and post-execution hooks that are run before
and after an algorithm is run. This can be used to automate tasks that should be
performed whenever an algorithm is executed.

The syntax is identical to the syntax explained above, but an additional global
variable named ``alg`` is available, representing the algorithm that has just
been (or is about to be) executed.

In the :guilabel:`General` group of the processing configuration dialog, you will find two
entries named :guilabel:`Pre-execution script file` and :guilabel:`Post-execution
script file` where the filename of the scripts to be run in each case can be
entered.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
