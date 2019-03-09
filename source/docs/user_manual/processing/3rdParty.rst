.. only:: html

   |updatedisclaimer|

.. _`processing.results`:

Configuring external applications
=================================

.. only:: html

   .. contents::
      :local:

The processing framework can be extended using additional applications.
Currently, SAGA, GRASS and R are supported. Algorithms relying on an
external applications are managed by their own algorithm provider.
Additional providers can be found as separate plugins, and installed using
the QGIS Plugin Manager.

This section will show you how to configure the Processing framework to
include these additional applications, and it will explain some particular
features of the algorithms based on them. Once you have correctly configured
the system, you will be able to execute external algorithms from any
component like the toolbox or the graphical modeler, just like you do with
any other geoalgorithm.

By default, all algorithms that rely on an external application not shipped
with QGIS are not enabled. You can enable them in the settings dialog.
Make sure that the corresponding application is already installed in your
system.


A note for Windows users
------------------------

If you are not an advanced user and you are running QGIS on Windows, you might
not be interested in reading the rest of this chapter. Make sure you install
QGIS in your system using the standalone installer. That will automatically
install SAGA and GRASS in your system and configure them so they can be
run from QGIS. All the algorithms from these providers will
be ready to be run without needing any further configuration. If installing
through OSGeo4W application, make sure you select for installation SAGA and
GRASS as well.


A note on file formats
----------------------

When using an external software, opening a file in QGIS does not mean that
it can be opened and processed as well in that other software. In most
cases, other software can read what you have opened in QGIS, but in some
cases, that might not be true. When using databases or uncommon file
formats, whether for raster or vector layers,
problems might arise. If that happens, try to use well-known file formats that
you are sure are understood by both programs, and check the console output
(in the history and log dialog) to know more about what is going wrong.

Using GRASS raster layers is, for instance, one case in which you might have
trouble and not be able to complete your work if you call an external algorithm
using such a layer as input. For this reason, these layers will not appear as
available to algorithms.

You should, however, find no problems at all with vector layers, since QGIS
automatically converts from the original file format to one accepted by the
external application before passing the layer to it. This adds extra processing
time, which might be significant if the layer has a large size, so do not be
surprised if it takes more time to process a layer from a DB connection than it
process a layer from a Shapefile format dataset of similar size.

Providers not using external applications can process any layer that you can
open in QGIS, since they open it for analysis through QGIS.

Regarding output formats, all formats supported by QGIS as output can be used,
both for raster and vector layers. Some providers do not support certain
formats, but all can export to common  formats that can later be transformed
by QGIS automatically. As in the case of input layers, if this conversion is
needed, that might increase the processing time.


A note on vector layer selections
---------------------------------

External applications may also be made aware of the selections that exist in
vector layers within QGIS. However, that requires rewriting all input vector
layers, just as if they were originally in a format not supported by the
external application. Only when no selection exists, or the *Use only
selected features* option is not enabled in the processing general
configuration, can a layer be directly passed to an external application.

In other cases, exporting only selected features is needed, which causes
execution times to be longer.

SAGA
----

SAGA algorithms can be run from QGIS if you have SAGA installed in your system
and you configure the processing framework properly so it can find SAGA
executables. In particular, the SAGA command-line executable is needed to
run SAGA algorithms.


If you are running Windows, both the stand-alone installer and the OSGeo4W
installer include SAGA along with QGIS, and the path is automatically
configured, so there is no need to do anything else.

If you have installed SAGA yourself and your QGIS installer did not include
it, the path to the SAGA executable must be configured. To do this, open the
configuration dialog. In the :guilabel:`SAGA` block, you will find a setting
named :guilabel:`SAGA Folder`. Enter the path to the folder where SAGA is
installed. Close the configuration dialog, and now you are ready to run SAGA
algorithms from QGIS.

If you are running Linux, SAGA binaries are not included with Processing, so
you have to download and install the software yourself. Please check the
SAGA website for more information.

In this case, there is no need to configure the path to the SAGA
executable, and you will not see those folder entries. Instead, you must
make sure that SAGA is properly installed and its folder is added to the
PATH environment variable. Just open a console and type ``saga_cmd`` to
check that the system can find where the SAGA binaries are located.

About SAGA grid system limitations
..................................

Most SAGA algorithms that require several input raster layers require them to
have the same grid system. That is, they must cover the same geographic
area and have the same cell size, so their corresponding grids match. When
calling SAGA algorithms from QGIS, you can use any layer, regardless of its
cell size and extent. When multiple raster layers are used as input for a
SAGA algorithm, QGIS resamples them to a common grid system and then passes
them to SAGA (unless the SAGA algorithm can operate with layers from
different grid systems).

The definition of that common grid system is controlled by the user, and you
will find several parameters in the SAGA group of the settings window to do
so. There are two ways of setting the target grid system:

* Setting it manually. You define the extent by setting the values of the
  following parameters:

  - :guilabel:`Resampling min X`
  - :guilabel:`Resampling max X`
  - :guilabel:`Resampling min Y`
  - :guilabel:`Resampling max Y`
  - :guilabel:`Resampling cellsize`

  Notice that QGIS will resample input layers to that extent, even if they
  do not overlap with it.
* Setting it automatically from input layers. To select this option, just check
  the :guilabel:`Use min covering grid system for resampling` option. All the
  other settings will be ignored and the minimum extent that covers all the input
  layers will be used. The cell size of the target layer is the maximum of all
  cell sizes of the input layers.

For algorithms that do not use multiple raster layers, or for those that do not
need a unique input grid system, no resampling is performed before calling SAGA,
and those parameters are not used.

Limitations for multi-band layers
.................................

Unlike QGIS, SAGA has no support for multi-band layers. If you want to use a
multiband layer (such as an RGB or multispectral image), you first have to split
it into single-banded images. To do so, you can use the 'SAGA/Grid - Tools/Split
RGB image' algorithm (which creates three images from an RGB image) or the 'SAGA/Grid
- Tools/Extract band' algorithm (to extract a single band).

Limitations in cell size
........................

SAGA assumes that raster layers have the same cell size in the X and Y axis. If
you are working with a layer with different values for horizontal and vertical
cell size, you might get unexpected results. In this case, a warning will be added
to the processing log, indicating that an input layer might not be suitable to be
processed by SAGA.

Logging
.......

When QGIS calls SAGA, it does so using its command-line interface, thus
passing a set of commands to perform all the required operations. SAGA shows its
progress by writing information to the console, which includes the percentage
of processing already done, along with additional content. This output is
filtered and used to update the progress bar while the algorithm
is running.

Both the commands sent by QGIS and the additional information printed by
SAGA can be logged along with other processing log messages, and you might find
them useful to track in detail what is going on when QGIS runs a SAGA
algorithm. You will find two settings, namely :guilabel:`Log console output` and
:guilabel:`Log execution commands`, to activate that logging mechanism.

Most other providers that use an external application and call it through the
command-line have similar options, so you will find them as well in other places
in the processing settings list.

.. _creating_r_scripts:

R. Creating R scripts
---------------------

To enable R in Processing you need to install the **Processing R Provider** plugin.

R integration in QGIS is different from that of SAGA in that there is not a
predefined set of algorithms you can run (except for a few examples). Instead,
you should write your scripts and call R commands, much like you would do from R,
and in a very similar manner to what we saw in the section dedicated to processing
scripts. This section shows you the syntax to use to call those R commands from
QGIS and how to use QGIS objects (layers, tables) in them.

The first thing you have to do, as we saw in the case of SAGA, is to tell QGIS
where your R binaries are located. You can do this using the :guilabel:`R folder`
entry in the processing configuration dialog. Once you have set that parameter,
you can start creating and executing your own R scripts.

.. note:: for **Windows** user, usually the R executable file is in the
   :file:`C:\\Program Files\\R\\R-3.2` folder. Add just the folder and **NOT** the
   binary!

Once again, this is different in Linux, and you just have to make sure that the
R folder is included in the PATH environment variable. If you can start R just
typing ``R`` in a console, then you are ready to go.

To add a new algorithm that calls an R function (or a more complex R script that
you have developed and you would like to have available from QGIS), you have
to create a script file that tells the processing framework how to perform that
operation and the corresponding R commands to do so.

R script files have the extension :file:`.rsx`, and creating them is pretty easy
if you just have a basic knowledge of R syntax and R scripting. They should be
stored in the R scripts folder. You can set this folder in the :guilabel:`R`
settings group (available from the processing settings dialog), just like you do
with the folder for regular processing scripts.

Let’s have a look at a very simple script file, which calls the R method
``spsample`` to create a random grid within the boundary of the polygons in a
given polygon layer. This method belongs to the ``maptools`` package. Since almost
all the algorithms that you might like to incorporate into QGIS will use or
generate spatial data, knowledge of spatial packages like ``maptools`` and,
especially, ``sp``, is mandatory.

.. code-block:: python

    ##polyg=vector
    ##numpoints=number 10
    ##output=output vector
    ##sp=group
    pts=spsample(polyg,numpoints,type="random")
    output=SpatialPointsDataFrame(pts, as.data.frame(pts))

The first lines, which start with a double Python comment sign (``##``), tell
QGIS the inputs of the algorithm described in the file and the outputs that
it will generate. They work with exactly the same syntax as the Processing scripts
that we have already seen, so they will not be described here again.

Please have a look at the :ref:`R Intro <r-intro>` and the :ref:`R Syntax <r-syntax>`
Training Manual Chapters to have more information on how to write your own R scripts-

When you declare an input parameter, QGIS uses that information for two
things: creating the user interface to ask the user for the value of that
parameter and creating a corresponding R variable that can later be used as input
for R commands.

In the above example, we are declaring an input of type ``vector`` named ``polyg``.
When executing the algorithm, QGIS will open in R the layer selected by the
user and store it in a variable also named ``polyg``. So, the name of a parameter
is also the name of the variable that we can use in R for accessing the value of
that parameter (thus, you should avoid using reserved R words as parameter names).

Spatial elements such as vector and raster layers are read using the ``readOGR()``
and ``brick()`` commands (you do not have to worry about adding those commands
to your description file -- QGIS will do it), and they are stored as ``Spatial*DataFrame``
objects. Table fields are stored as strings containing the name of the selected
field.

Tables are opened using the ``read.csv()`` command. If a table entered by the
user is not in CSV format, it will be converted prior to importing it into R.

Additionally, raster files can be read using the ``readGDAL()`` command instead
of ``brick()`` by using the ``##usereadgdal``.

If you are an advanced user and do not want QGIS to create the object
representing the layer, you can use the ``##passfilenames`` tag to indicate
that you prefer a string with the filename instead. In this case, it is up to you
to open the file before performing any operation on the data it contains.

With the above information, we can now understand the first line of our first
example script (the first line not starting with a Python comment).

.. code-block:: python

    pts=spsample(polyg,numpoints,type="random")

The variable ``polygon`` already contains a ``SpatialPolygonsDataFrame`` object,
so it can be used to call the ``spsample`` method, just like the ``numpoints``
one, which indicates the number of points to add to the created sample grid.

Since we have declared an output of type vector named ``out``, we have to create
a variable named ``out`` and store a ``Spatial*DataFrame`` object in it (in this
case, a ``SpatialPointsDataFrame``). You can use any name for your intermediate
variables. Just make sure that the variable storing your final result has the
same name that you used to declare it, and that it contains a suitable value.

In this case, the result obtained from the ``spsample`` method has to be converted
explicitly into a ``SpatialPointsDataFrame`` object, since it is itself an object
of class ``ppp``, which is not a suitable class to be returned to QGIS.

If your algorithm generates raster layers, the way they are saved will depend on
whether or not you have used the ``##dontuserasterpackage`` option. If you have
used it, layers are saved using the ``writeGDAL()`` method. If not, the
``writeRaster()`` method from the ``raster`` package will be used.

If you have used the ``##passfilenames`` option, outputs are generated using the
``raster`` package (with ``writeRaster()``), even though it is not used for the
inputs.

If your algorithm does not generate any layer, but rather a text result in the console
instead, you have to indicate that you want the console to be shown once the
execution is finished. To do so, just start the command lines that produce the
results you want to print with the ``>`` ('greater') sign. The output of all other
lines will not be shown. For instance, here is the description file of an
algorithm that performs a normality test on a given field (column) of the
attributes of a vector layer:

.. code-block:: python

    ##layer=vector
    ##field=field layer
    ##nortest=group
    library(nortest)
    >lillie.test(layer[[field]])

The output of the last line is printed, but the output of the first is not (and
neither are the outputs from other command lines added automatically by QGIS).

If your algorithm creates any kind of graphics (using the ``plot()`` method),
add the following line:

.. code-block:: python

    ##showplots

This will cause QGIS to redirect all R graphical outputs to a temporary file,
which will be opened once R execution has finished.

Both graphics and console results will be shown in the processing results manager.

For more information, please check the script files provided with Processing. Most
of them are rather simple and will greatly help you understand how to create your
own scripts.

.. note::

   ``rgdal`` and ``raster`` libraries are loaded by default, so you do not have
   to add the corresponding ``library()`` commands (you just have to make sure
   that those two packages are installed in your R distribution). However, other
   additional libraries that you might need have to be explicitly loaded by typing,
   ``library(ggplot2)``. If the package is not already installed on your machine,
   Processing will download and install it. In this way the package will be also
   available in R Standalone. **Be aware** that if the package has to be downloaded,
   the first time you run the script it might take a long time.

GRASS
-----

Configuring GRASS is not much different from configuring SAGA. First, the path
to the GRASS folder has to be defined, but only if you are running Windows.

By default, the Processing framework tries to configure its GRASS connector
to use the GRASS distribution that ships along with QGIS. This should work
without problems in most systems, but if you experience problems, you might
have to configure the GRASS connector manually.
Also, if you want to use a different GRASS installation, you can change that
setting and point to the folder where the other version is installed. GRASS
7 is needed for algorithms to work correctly.

If you are running Linux, you just have to make sure that GRASS is correctly
installed, and that it can be run without problem from a console.

GRASS algorithms use a region for calculations. This region can be defined
manually using values similar to the ones found in the SAGA configuration, or
automatically, taking the minimum extent that covers all the input layers used
to execute the algorithm each time. If the latter approach is the behavior
you prefer, just check the :guilabel:`Use min covering region` option in the
GRASS configuration parameters.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
