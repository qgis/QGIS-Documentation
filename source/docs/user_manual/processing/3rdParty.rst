.. |updatedisclaimer|

.. _`processing.results`:

Configuring external applications
=================================

The processign framework can be extended using additional applications.
Currently, SAGA, GRASS, OTB(Orfeo Toolbox) and R are supported, along
with some other command-line applications that provide spatial data analysis
functionalities. Algorithms relying on an external application are managed by
their own algorithm provider.

This chapter will show you how to configure the processing framework to include these additional
applications, and will explain some particular features of the algorithm based
on them. Once you have correctly configured the system, you will be able to
execute external algorithms from any component like the toolbox or the
graphical modeler, just like you do with any other geoalgorithm.

By default, all algorithms that rely on an external appplication not shipped with
|qg| are not enabled. You can enable them in the configuration dialog.
Make sure that the corresponding application is already installed in your system.
Enabling an algorithm provider without installing the application it needs will
cause the algorithms to appear in the toolbox, but an error will be thrown when
you try to execute them.

This is because the algorithm descriptions (needed to create the parameters dialog
and provide the information needed about the algorithm) are not included
with each application, but with |qg| instead. That is,they are part of
|qg|, so you have them in your installation even if you have not installed
any other software. Running the algorithm, however, needs the application binaries
to be installed in your system.

A note for Windows users
........................

If you are not an advanced user and you are running |qg| on windows, you might
not be interested in reading the rest of this chapter. Make sure you install
|qg| in your system using the OSGeo4W application. That will automatically
install SAGA, GRASS and OTB in your system, and configure them so they can be
run from |qg|. All the algorithms in the simplified view of the toolbox will
be ready to be run, without needing any further configuration.

If you want to know more about how these providers work, or want to use some
algorithms not included in the simplified toolbox (such as R scripts), keep on
reading.

A note on file formats
......................

When using an external software, opening a file in |qg| does not mean that it can
be opened and processed as well on that other software. In most cases, it can read
what you have opened in |qg|, but in some cases, that might not be the case. When
using databases or uncommon file formats, whether for raster of vector layers,
problems might arise. If that happens, try to use well known file formats that
you are sure that are understood by both programs, and check to console output
(in the history and log dialog) for knowing more about what is going wrong.

Using GRASS raster layers is, for instance, one case in which you might have
trouble and not be able to complete your work if you call an external algorithm
using such a layer as input. For this reason, these layers will not appear as
available to algorithms.

You should, however, find no problems at all with vector layers, since |qg|
automatically converts from the original file format to one accepted by the
external application before passing the layer to it. This adds an extra processing
time, which might be significant if the layer has a large size, so do not be
surprised if it takes more to process a layer from a DB connection that one of a
similar size stored in a shapefile.

Providers not using external applications can process any layer that you can open
in |qg|, since they open it for analysis through |qg|.

Regarding output formats, all formats supported by |qg| as output can be used,
both for raster and vector layers. Some provider do not support certain formats,
but all can export to common formats raster layers that can be later transformed
by |qg| automatically. As in the case of input layers, if this conversion is
needed, that might increase the processing time.

If the extension of the filename specified when calling an algorithm does not
match the extension of any of the formats supported by |qg|, then a suffix will
be added to set a default format. In the case of raster layers, the :file:`tif`
extension is used, while :file:`shp` is used for vector layer.

A note on vector layer selections
.................................

External applications are also aware of the selection that exist in vector layers
within |qg|. However, that requires rewritting all input vector layers, just as
if they were originally in a format not supported by the external application.
Only when no selection exist, or the *Use only selected features* option is not
enabled in the processing general configuration, a layer can be directly passed to
an external application.

In other cases, exporting only selected features is needed, which causes execution
times to be longer.

SAGA
----

SAGA algorithms can be run from |qg| if you have SAGA installed in your system
and you configure the processing framework properly so it can find SAGA executables. In particular,
the SAGA command-line executable is needed to run SAGA algorithms.


In case of running Windows, the standalone installer or the OSGeo4W installer, both
install SAGA along with |qg|, and the path is automatically configured, so there is
no need to do anything else.

If you have installed SAGA yourself (remember, you need version 2.1), the path to the
SAGA executable must be configured. To do it, open the
configuration dialog. In the :guilabel:`SAGA` block you will find a setting named
:guilabel:`SAGA Folder`. Enter the path to the folder where SAGA is installed.
Close the configuration dialog and now you are ready to run SAGA algorithms from
|qg|.

In case you are running linux, SAGA binaries
are not included with SEXTANTE, so you have to download and install the software
yourself. Please check the SAGA website for more information. SAGA 2.1 is
needed.

In this case there is no need to configure that, and you will not
see those folders. Instead, you must make sure that SAGA is properly installed
and its folder is added to the PATH environment variable. Just open a console and
type ``saga_cmd`` to check that the system can find where SAGA binaries are
located.

About SAGA grid system limitations
..................................

Most of SAGA algorithms that require several input raster layers, require them to
have the same grid system. That is, to cover the same geographic area and have
the same cellsize, so their corresponding grids match. When calling SAGA
algorithms from |qg|, you can use any layer, regardless of its cellsize and
extent. When multiple raster layers are used as input for a SAGA algorithm,
|qg| resamples them to a common grid system and then passes them to SAGA
(unless the SAGA algorithm can operate with layers from different grid systems).

The definition of that common grid system is controlled by the user, and you will
find several parameters in the SAGA group of the setting window to do so. There
are two ways of setting the target grid system:

* Setting it manually. You define the extent setting the values of the following
  parameters:

  - :guilabel:`Resampling min X`
  - :guilabel:`Resampling max X`
  - :guilabel:`Resampling min Y`
  - :guilabel:`Resampling max Y`
  - :guilabel:`Resampling cellsize`

  Notice that |qg| will resample input layers to that extent, even if they
  do not overlap with it.
* Setting it automatically from input layers. To select this option, just check
  the :guilabel:`Use min covering grid system for resampling` option. All the
  other settings will be ignored and the minimum extent that covers all the input
  layers will be used. The cellsize of the target layer is the maximum of all
  cellsizes of the input layers.

For algorithms that do not use multiple raster layers, or for those that do not
need a unique input grid system, no resampling is performed before calling SAGA,
and those parameters are not used.

Limitations for multi-band layers
.................................

Unlike |qg|, SAGA has no support for multi-band layers. If you want to use a
multiband layer (such as an RGB or multispectral image), you first have to split
it into single-banded images. To do so, you can use the 'SAGA/Grid - Tools/Split
RGB image' algorithm (which creates 3 images from an RGB image) or the 'SAGA/Grid - Tools/Extract band'
algorithm (to extract a single band).

Limitations in cellsize
.......................

SAGA assumes that raster layers have the same cellsize in the X and Y axis. If
you are working with a layer with different values for its horizontal and vertical
cellsizes, you might get unexcepted results. In this case, a warning will be added
to the processing log, indicating that an input layer might not be suitable to be
processed by SAGA.

Logging
.......

When |qg| calls SAGA, it does it using its command-line interface, thus
passing a set of commands to perform all the required operation. SAGA show its
progress by writing information to the console, which includes the percentage
of processing already done, along with additional content. This output is
filtered and used to update the progress bar while the algorithm
is running.

Both the commands sent by |qg| and the additional information printed by
SAGA can be logged along with other processing log messages, and you might find
them useful to track in detailed what is going on when |qg| runs a SAGA
algorithm. you will find two settings, namely :guilabel:`Log console output` and
:guilabel:`Log execution commands` to activate that logging mechanism.

Most other providers that use an external application and call it through the
command-line have similar options, so you will find them as well in other places
in the processing settings list.

R. Creating R scripts
---------------------

R integration in |qg| is different from that of SAGA in that there is not a
predefined set of algorithms you can run (except for a few examples). Instead,
you should write your scripts and call R commands, much like you would do from R,
and in a very similar manner to what we saw in the chapter dedicated to processing
scripts. This chapter shows you the syntax to use to call those R commands from
|qg| and how to use |qg| objects (layers, tables) in them.

The first thing you have to do, as we saw in the case of SAGA, is to tell |qg|
where you R binaries are located. You can do so using the :guilabel:`R folder`
entry in the processing configuration dialog. Once you have set that parameter,
you can start creating your own R scripts and executing them.

Once again, this is different in Linux, and you just have to make sure that the
R folder is included in the PATH environment variable. If you can start R just
typing ``R`` in a console, then you are ready to go.

To add a new algorithm that calls an R function (or a more complex R script that
you have developed and you would like to have available from |qg|), you have
to create a script file that tells the processing framework how to perform that operation and the
corresponding R commands to do so.

Script files have the extension :file:`.rsx` and creating them is pretty easy
if you just have a basic knowledge of R syntax and R scripting. They should be
stored in the R-scripts folder. You can set this folder in the :guilabel:`R`
settings group (available from the processing settings dialog), just like you do
with the folder for regular processing scripts.

Let’s have a look at a very simple file script file, which calls the R method
``spsample`` to create a random grid within the boundary of the polygons in a
given polygon layer. This method belong to the ``maptools`` package. Since almost
all the algorithms that you might like to incorporate into |qg| will use or
generate spatial data, knowledge of spatial packages like ``maptools`` and,
specially, ``sp``, is mandatory.

::

    ##polyg=vector
    ##numpoints=number 10
    ##output=output vector
    ##sp=group
    pts=spsample(polyg,numpoints,type="random")
    output=SpatialPointsDataFrame(pts, as.data.frame(pts))

The first lines, which start with a double Python comment sign (``##``), tell
|qg| the inputs of the algorithm described in the file and the outputs that
it will generate. They work exactly with the same syntax as the SEXTANTE scripts
that we have already seen, so they will not be described here again. Check the
:ref:`processing_scripts` section for more information.

When you declare an input parameter, |qg| uses that information for two
things: creating the user interface to ask the user for the value of that
parameter and creating a corresponding R variable that can be later used as input
for R commands.

In the above example, we are declaring an input of type ``vector`` named ``polyg``.
When executing the algorithm, |qg| will open in R the layer selected by the
user and store it in a variable also named ``polyg``. So the name of a parameter
is also the name of the variable that we can use in R for accesing the value of
that parameter (thus, you should avoid using reserved R words as parameter names).

Spatial elements such as vector and raster layers are read using the ``readOGR()``
and ``brick()`` commands (you do not have to worry about adding those commands
to your description file, |qg| will do it) and stored as ``Spatial*DataFrame``
objects. Table fields are stored as strings containing the name of the selected
field.

Tables are opened using the ``read.csv()`` command. If a table entered by the
user is not in CSV format, it will be converted prior to importing it in R.

Additionally, raster files can be read using the ``readGDAL()`` command instead
of ``brick()``, by using the ``##usereadgdal``.

If you are an advanced user and do not want |qg| to create the object
representing the layer, you can use the ``##passfilename`` tag to indicate
that you prefer a string with the filename instead. In this case, it is up to you
to open the file before performing any operation on the data it contains.

With the above information, we can now understand the first line of our first
example script (the first line not starting with a Python comment).

::

    pts=spsample(polyg,numpoints,type="random")

The variable ``polygon`` already contains a ``SpatialPolygonsDataFrame`` object,
so it can be used to call the ``spsample`` method, just like the ``numpoints``
one, which indicates the number of points to add to the created sample grid.

Since we have declared an output of type vector named ``out``, we have to create
a variable named ``out`` and store a ``Spatial*DataFrame`` object in it (in this
case, a ``SpatialPointsDataFrame``). You can use any name for your intermediate
variables. Just make sure that the variable storing your final result has the
same name that you used to declare it, and contains a suitable value.

In this case, the result obtained from the ``spsample`` method has to be converted
explicitly into a ``SpatialPointsDataFrame`` object, since it is itself an object
of class ``ppp``, which is not a suitable class to be returned to |qg|.

If your algorithm generates raster layers, the way they are saved will depend on
whether you have used or not the ``#dontuserasterpackage`` option. In you have
used it, layers are saved using the ``writeGDAL()`` method. If not, the
``writeRaster()`` method from the ``raster`` package will be used.

If you have used the ``#passfilename`` option, outputs are generated using the
``raster`` package (with ``writeRaster()``), even though it is not used for the
inputs.

If you algorithm does not generate any layer, but a text result in the console
instead, you have to indicate that you want the console to be shown once the
execution is finished. To do so, just start the command lines that produce the
results you want to print with the ``>`` ('greater') sign. The output of all other
lines will not be shown. For instance, here is the description file of an
algorithm that performs a normality test on a given field (column) of the
attributes of a vector layer:

::

    ##layer=vector
    ##field=field layer
    ##nortest=group
    library(nortest)
    >lillie.test(layer[[field]])

The output ot the last line is printed, but the output of the first is not (and
neither are the outputs from other command lines added automatically by |qg|).

If your algorithm creates any kind of graphics (using the ``plot()`` method), add
the following line:

::

    ##showplots

This will cause |qg| to redirect all R graphical outputs to a temporary file,
which will be later opened once R execution has finished.

Both graphics and console results will be shown in the processing results manager.

For more information, please check the script files provided with SEXTANTE. Most
of them are rather simple and will greatly help you understand how to create your
own ones.

.. note::

   ``rgdal`` and ``maptools`` libraries are loaded by default so you do not have
   to add the corresponding ``library()`` commands (you have to make sure, however,
   that those two packages are installed in your R distribution). However, other
   additional libraries that you might need have to be explicitly loaded. Just
   add the necessary commands at the beginning of your script. You also have to
   make sure that the corresponding packages are installed in the R distribution
   used by |qg|. The processing framework will not take care of any package installation. If you
   run a script that requires an uninstalled package, the execution will fail, and
   SEXTANTE will try to detect which packages are missing. You must install those
   missing libraries manually before you can run the algorithm.

GRASS
-----

Configuring GRASS is not much different from configuring SAGA. First, the path
to the GRASS folder has to be defined, but only if you are running Windows.
Additionaly, a shell interpreter (usually :file:`msys.exe`, which can be found
in most GRASS for Windows distributions) has to be defined and its path set up
as well.

By default, the processign framework tries to configure its GRASS connector to use the GRASS
distribution that ships along with |qg|. This should work without problems in
most systems, but if you experience problems, you might have to do it manually.
Also, if you want to use a different GRASS installation, you can change that setting
and point to the folder where that it is installed. GRASS 6.4 is needed
for algorithms to work correctly.

If you are running Linux, you just have to make sure that GRASS is correctly
installed, and that it can be run without problem from a console.

GRASS algorithms use a region for calculations. This region can be defined
manually using values similar to the ones found in the SAGA configuration, or
automatically, taking the minimum extent that covers all the input layers used
to execute the algorithm each time. If this is the behaviour you prefer, just
check the :guilabel:`Use min covering region` option in the GRASS configuration
parameters.

The last parameter that has to be configured is related to the mapset. A mapset
is needed to run GRASS, and the  processing frmaework creates a temporary one for each execution.
You have to specify if the data you are working with uses geographical
(lat/lon) coordinates or projected ones.

GDAL
----

No additional configuration is needed to run GDAL algorithms, since it is already
incorporated to |qg| and algorithms can infere its configuration from it.

Orfeo ToolBox
-------------

Orfeo ToolBox (OTB) algorithms can be run from |qg| if you have OTB installed
in your system and you have configured |qg| properly, so it can find all
necessary files (command-line tools and libraries).


As in the case of SAGA OTB binaries are included in the standalone installer for
Windows, but are not included if you are runing Linux, so you have to download
and install the software yourself. Please check the OTB website for more
information.

Once OTB is installed, start |qg|, open the processing configuration dialog and
configure the OTB algorithm provider. In the :guilabel:`Orfeo Toolbox (image analysis)`
block you will find all settings related to OTB. First ensure that algorithms are
enabled.

Then configure the path to the folder where OTB command--line tools and libraries
are installed:

* |nix| usually :guilabel:`OTB applications folder` point to ``/usr/lib/otb/applications``
  and :guilabel:`OTB command line tools folder` is ``/usr/bin``
* |win| if you use OSGeo4W installer, than install ``otb-bin`` package and enter
  ``C:\OSGeo4W\apps\orfeotoolbox\applications`` as :guilabel:`OTB applications folder`
  and ``C:\OSGeo4W\bin`` as :guilabel:`OTB command line tools folder`. This values should be
  configured by default, but if you have a different OTB installation, configure them
  to the correspondig values in your system.

TauDEM
------

To use this provider you need to install TauDEM command line tools.

Windows
.......

Please visit `TauDEM homepage <http://hydrology.usu.edu/taudem/taudem5.0/downloads.html>`_
for installation instructions and precompiled binaries for 32bit and 64bit systems.
**IMPORTANT**: you need TauDEM 5.0.6 executables, version 5.2 is currently not
supported.

Linux
.....

There are no packages for most Linux distribution, so you should compile TauDEM
by yourself. As TauDEM uses MPICH2, first install it using your favorite package
manager. Also TauDEM works fine with OpenMPI, so you can use it instead of MPICH2.

Download TauDEM 5.0.6 `source code <http://hydrology.usu.edu/taudem/taudem5.0/TauDEM5PCsrc_506.zip>`_
and extract files in some folder.

Open :file:`linearpart.h` file and add after line

::

   #include "mpi.h"

add new line with

::

   #include <stdint.h>

so you'll get

::

   #include "mpi.h"
   #include <stdlib.h>

Save changes and close file. Now open :file:`tiffIO.h`, find line ``#include "stdint.h"``
and replace quotes (``""``) with ``<>``, so you'll get

::

   #include <stdint.h>

Save changes and close file. Create build directory and cd into it

::

   mkdir build
   cd build

Configure your build with command

::

   CXX=mpicxx cmake -DCMAKE_INSTALL_PREFIX=/usr/local ..

and then compile

::

   make

Finaly, to install TauDEM into ``/usr/local/bin``, run

::

   sudo make install
