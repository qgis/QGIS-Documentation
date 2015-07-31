|updatedisclaimer|

.. _`processing.results`:

Configuring external applications
=================================

The processing framework can be extended using additional applications.
Currently, SAGA, GRASS, OTB (Orfeo Toolbox) and R are supported, along
with some other command-line applications that provide spatial data analysis
functionalities. Algorithms relying on an external application are managed by
their own algorithm provider.

This section will show you how to configure the processing framework to include these additional
applications, and it will explain some particular features of the algorithms based
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
with each application, but with |qg| instead. That is, they are part of
|qg|, so you have them in your installation even if you have not installed
any other software. Running the algorithm, however, needs the application binaries
to be installed in your system.

A note for Windows users
------------------------

If you are not an advanced user and you are running |qg| on Windows, you might
not be interested in reading the rest of this chapter. Make sure you install
|qg| in your system using the standalone installer. That will automatically
install SAGA, GRASS and OTB in your system and configure them so they can be
run from |qg|. All the algorithms in the simplified view of the toolbox will
be ready to be run without needing any further configuration. If installing
through OSGeo4W application, make sure you select for insttallation SAGA and
OTB as well.

If you want to know more about how these providers work, or if you want to use some
algorithms not included in the simplified toolbox (such as R scripts), keep on
reading.

A note on file formats
----------------------

When using an external software, opening a file in |qg| does not mean that it can
be opened and processed as well in that other software. In most cases, other software can read
what you have opened in |qg|, but in some cases, that might not be true. When
using databases or uncommon file formats, whether for raster or vector layers,
problems might arise. If that happens, try to use well-known file formats that
you are sure are understood by both programs, and check the console output
(in the history and log dialog) to know more about what is going wrong.

Using GRASS raster layers is, for instance, one case in which you might have
trouble and not be able to complete your work if you call an external algorithm
using such a layer as input. For this reason, these layers will not appear as
available to algorithms.

You should, however, find no problems at all with vector layers, since |qg|
automatically converts from the original file format to one accepted by the
external application before passing the layer to it. This adds extra processing
time, which might be significant if the layer has a large size, so do not be
surprised if it takes more time to process a layer from a DB connection than it does to process one of a
similar size stored in a shapefile.

Providers not using external applications can process any layer that you can open
in |qg|, since they open it for analysis through |qg|.

Regarding output formats, all formats supported by |qg| as output can be used,
both for raster and vector layers. Some providers do not support certain formats,
but all can export to common raster layer formats that can later be transformed
by |qg| automatically. As in the case of input layers, if this conversion is
needed, that might increase the processing time.

If the extension of the filename specified when calling an algorithm does not
match the extension of any of the formats supported by |qg|, then a suffix will
be added to set a default format. In the case of raster layers, the :file:`.tif`
extension is used, while :file:`.shp` is used for vector layers.

A note on vector layer selections
---------------------------------

External applications may also be made aware of the selections that exist in vector layers
within |qg|. However, that requires rewriting all input vector layers, just as
if they were originally in a format not supported by the external application.
Only when no selection exists, or the *Use only selected features* option is not
enabled in the processing general configuration, can a layer be directly passed to
an external application.

In other cases, exporting only selected features is needed, which causes execution
times to be longer.

SAGA
----

SAGA algorithms can be run from |qg| if you have SAGA installed in your system
and you configure the processing framework properly so it can find SAGA executables. In particular,
the SAGA command-line executable is needed to run SAGA algorithms.


If you are running Windows, both the stand-alone installer and the OSGeo4W installer
include SAGA along with |qg|, and the path is automatically configured, so there is
no need to do anything else.

If you have installed SAGA yourself (remember, you need version 2.1), the path to the
SAGA executable must be configured. To do this, open the
configuration dialog. In the :guilabel:`SAGA` block, you will find a setting named
:guilabel:`SAGA Folder`. Enter the path to the folder where SAGA is installed.
Close the configuration dialog, and now you are ready to run SAGA algorithms from
|qg|.

If you are running Linux, SAGA binaries
are not included with SEXTANTE, so you have to download and install the software
yourself. Please check the SAGA website for more information. SAGA 2.1 is
needed.

In this case, there is no need to configure the path to the SAGA executable, and you will not
see those folders. Instead, you must make sure that SAGA is properly installed
and its folder is added to the PATH environment variable. Just open a console and
type ``saga_cmd`` to check that the system can find where the SAGA binaries are
located.

About SAGA grid system limitations
..................................

Most SAGA algorithms that require several input raster layers require them to
have the same grid system. That is, they must cover the same geographic area and have
the same cell size, so their corresponding grids match. When calling SAGA
algorithms from |qg|, you can use any layer, regardless of its cell size and
extent. When multiple raster layers are used as input for a SAGA algorithm,
|qg| resamples them to a common grid system and then passes them to SAGA
(unless the SAGA algorithm can operate with layers from different grid systems).

The definition of that common grid system is controlled by the user, and you will
find several parameters in the SAGA group of the settings window to do so. There
are two ways of setting the target grid system:

* Setting it manually. You define the extent by setting the values of the following
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
  layers will be used. The cell size of the target layer is the maximum of all
  cell sizes of the input layers.

For algorithms that do not use multiple raster layers, or for those that do not
need a unique input grid system, no resampling is performed before calling SAGA,
and those parameters are not used.

Limitations for multi-band layers
.................................

Unlike |qg|, SAGA has no support for multi-band layers. If you want to use a
multiband layer (such as an RGB or multispectral image), you first have to split
it into single-banded images. To do so, you can use the 'SAGA/Grid - Tools/Split
RGB image' algorithm (which creates three images from an RGB image) or the 'SAGA/Grid - Tools/Extract band'
algorithm (to extract a single band).

Limitations in cell size
.........................

SAGA assumes that raster layers have the same cell size in the X and Y axis. If
you are working with a layer with different values for horizontal and vertical
cell size, you might get unexpected results. In this case, a warning will be added
to the processing log, indicating that an input layer might not be suitable to be
processed by SAGA.

Logging
.......

When |qg| calls SAGA, it does so using its command-line interface, thus
passing a set of commands to perform all the required operations. SAGA shows its
progress by writing information to the console, which includes the percentage
of processing already done, along with additional content. This output is
filtered and used to update the progress bar while the algorithm
is running.

Both the commands sent by |qg| and the additional information printed by
SAGA can be logged along with other processing log messages, and you might find
them useful to track in detail what is going on when |qg| runs a SAGA
algorithm. You will find two settings, namely :guilabel:`Log console output` and
:guilabel:`Log execution commands`, to activate that logging mechanism.

Most other providers that use an external application and call it through the
command-line have similar options, so you will find them as well in other places
in the processing settings list.

R. Creating R scripts
---------------------

R integration in |qg| is different from that of SAGA in that there is not a
predefined set of algorithms you can run (except for a few examples). Instead,
you should write your scripts and call R commands, much like you would do from R,
and in a very similar manner to what we saw in the section dedicated to processing
scripts. This section shows you the syntax to use to call those R commands from
|qg| and how to use |qg| objects (layers, tables) in them.

The first thing you have to do, as we saw in the case of SAGA, is to tell |qg|
where your R binaries are located. You can do this using the :guilabel:`R folder`
entry in the processing configuration dialog. Once you have set that parameter,
you can start creating and executing your own R scripts.

Once again, this is different in Linux, and you just have to make sure that the
R folder is included in the PATH environment variable. If you can start R just
typing ``R`` in a console, then you are ready to go.

To add a new algorithm that calls an R function (or a more complex R script that
you have developed and you would like to have available from |qg|), you have
to create a script file that tells the processing framework how to perform that operation and the
corresponding R commands to do so.

R script files have the extension :file:`.rsx`, and creating them is pretty easy
if you just have a basic knowledge of R syntax and R scripting. They should be
stored in the R scripts folder. You can set this folder in the :guilabel:`R`
settings group (available from the processing settings dialog), just like you do
with the folder for regular processing scripts.

Let’s have a look at a very simple script file, which calls the R method
``spsample`` to create a random grid within the boundary of the polygons in a
given polygon layer. This method belongs to the ``maptools`` package. Since almost
all the algorithms that you might like to incorporate into |qg| will use or
generate spatial data, knowledge of spatial packages like ``maptools`` and,
especially, ``sp``, is mandatory.

::

    ##polyg=vector
    ##numpoints=number 10
    ##output=output vector
    ##sp=group
    pts=spsample(polyg,numpoints,type="random")
    output=SpatialPointsDataFrame(pts, as.data.frame(pts))

The first lines, which start with a double Python comment sign (``##``), tell
|qg| the inputs of the algorithm described in the file and the outputs that
it will generate. They work with exactly the same syntax as the SEXTANTE scripts
that we have already seen, so they will not be described here again.

When you declare an input parameter, |qg| uses that information for two
things: creating the user interface to ask the user for the value of that
parameter and creating a corresponding R variable that can later be used as input
for R commands.

In the above example, we are declaring an input of type ``vector`` named ``polyg``.
When executing the algorithm, |qg| will open in R the layer selected by the
user and store it in a variable also named ``polyg``. So, the name of a parameter
is also the name of the variable that we can use in R for accesing the value of
that parameter (thus, you should avoid using reserved R words as parameter names).

Spatial elements such as vector and raster layers are read using the ``readOGR()``
and ``brick()`` commands (you do not have to worry about adding those commands
to your description file -- |qg| will do it), and they are stored as ``Spatial*DataFrame``
objects. Table fields are stored as strings containing the name of the selected
field.

Tables are opened using the ``read.csv()`` command. If a table entered by the
user is not in CSV format, it will be converted prior to importing it into R.

Additionally, raster files can be read using the ``readGDAL()`` command instead
of ``brick()`` by using the ``##usereadgdal``.

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
same name that you used to declare it, and that it contains a suitable value.

In this case, the result obtained from the ``spsample`` method has to be converted
explicitly into a ``SpatialPointsDataFrame`` object, since it is itself an object
of class ``ppp``, which is not a suitable class to be returned to |qg|.

If your algorithm generates raster layers, the way they are saved will depend on
whether or not you have used the ``#dontuserasterpackage`` option. In you have
used it, layers are saved using the ``writeGDAL()`` method. If not, the
``writeRaster()`` method from the ``raster`` package will be used.

If you have used the ``#passfilename`` option, outputs are generated using the
``raster`` package (with ``writeRaster()``), even though it is not used for the
inputs.

If your algorithm does not generate any layer, but rather a text result in the console
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

The output of the last line is printed, but the output of the first is not (and
neither are the outputs from other command lines added automatically by |qg|).

If your algorithm creates any kind of graphics (using the ``plot()`` method), add
the following line:

::

    ##showplots

This will cause |qg| to redirect all R graphical outputs to a temporary file,
which will be opened once R execution has finished.

Both graphics and console results will be shown in the processing results manager.

For more information, please check the script files provided with SEXTANTE. Most
of them are rather simple and will greatly help you understand how to create your
own scripts.

.. note::

   ``rgdal`` and ``maptools`` libraries are loaded by default, so you do not have
   to add the corresponding ``library()`` commands (you just have to make sure
   that those two packages are installed in your R distribution). However, other
   additional libraries that you might need have to be explicitly loaded. Just
   add the necessary commands at the beginning of your script. You also have to
   make sure that the corresponding packages are installed in the R distribution
   used by |qg|. The processing framework will not take care of any package installation. If you
   run a script that requires a package that is not installed, the execution will fail, and
   SEXTANTE will try to detect which packages are missing. You must install those
   missing libraries manually before you can run the algorithm.

GRASS
-----

Configuring GRASS is not much different from configuring SAGA. First, the path
to the GRASS folder has to be defined, but only if you are running Windows.
Additionaly, a shell interpreter (usually :file:`msys.exe`, which can be found
in most GRASS for Windows distributions) has to be defined and its path set up
as well.

By default, the processing framework tries to configure its GRASS connector to use the GRASS
distribution that ships along with |qg|. This should work without problems in
most systems, but if you experience problems, you might have to configure the GRASS connector manually.
Also, if you want to use a different GRASS installation, you can change that setting
and point to the folder where the other version is installed. GRASS 6.4 is needed
for algorithms to work correctly.

If you are running Linux, you just have to make sure that GRASS is correctly
installed, and that it can be run without problem from a console.

GRASS algorithms use a region for calculations. This region can be defined
manually using values similar to the ones found in the SAGA configuration, or
automatically, taking the minimum extent that covers all the input layers used
to execute the algorithm each time. If the latter approach is the behaviour you prefer, just
check the :guilabel:`Use min covering region` option in the GRASS configuration
parameters.

The last parameter that has to be configured is related to the mapset. A mapset
is needed to run GRASS, and the processing framework creates a temporary one for each execution.
You have to specify if the data you are working with uses geographical
(lat/lon) coordinates or projected ones.

GDAL
----

No additional configuration is needed to run GDAL algorithms. Since they are already
incorporated into |qg|, the algorithms can infer their configuration from it.

Orfeo Toolbox
-------------

Orfeo Toolbox (OTB) algorithms can be run from |qg| if you have OTB installed
in your system and you have configured |qg| properly, so it can find all
necessary files (command-line tools and libraries).

As in the case of SAGA, OTB binaries are included in the stand-alone installer for
Windows, but they are not included if you are runing Linux, so you have to download
and install the software yourself. Please check the OTB website for more
information.

Once OTB is installed, start |qg|, open the processing configuration dialog and
configure the OTB algorithm provider. In the :guilabel:`Orfeo Toolbox (image analysis)`
block, you will find all settings related to OTB. First, ensure that algorithms are
enabled.

Then, configure the path to the folder where OTB command-line tools and libraries
are installed:

* |nix| Usually :guilabel:`OTB applications folder` points to ``/usr/lib/otb/applications``
  and :guilabel:`OTB command line tools folder` is ``/usr/bin``.
* |win| If you use the OSGeo4W installer, then install ``otb-bin`` package and enter
  ``C:\OSGeo4W\apps\orfeotoolbox\applications`` as :guilabel:`OTB applications folder`
  and ``C:\OSGeo4W\bin`` as :guilabel:`OTB command line tools folder`. These values should be
  configured by default, but if you have a different OTB installation, configure them
  to the corresponding values in your system.

TauDEM
------

TauDEM (Terrain Analysis Using Digital Elevation Models) is a tools for the
extraction and analysis of hydrologic information from Digital Elevation Models
(DEM). TauDEM can be used from |qg| if you have it installed in your system and
configured |qg| properly, so it can find all necessary files.

There are two versions of TauDEM tools: singlefile (TauDEM 5.0.6 or 5.1.2) and
multifile (TauDEM 5.2.0). The difference between these versions in the supported
inputs/outputs. Single files version accepts only single raster file and write
single file as output. Multifile version accepts a directory with rasters and
writes directory with rasters as output. Such directory should contain rasters
that will be treated as a single DEM grid.

TauDEM Processing provider supports both single- and multifile versions of TauDEM
and even allows to use them simultaneously.

.. note::
   While TauDEM Processing provider supports TauDEM 5.0.6, 5.1.2 and 5.2.0 we
   recomment to use 5.1.2 and/or 5.2.0 as this versions have some new tools
   available, like Gage Watershed and TWI.


Installing TauDEM under Windows
...............................

Please visit the `TauDEM homepage <http://hydrology.usu.edu/taudem/taudem5/downloads.html>`_
and download desired version of the precompiled binaries for your platform
(32-bit or 64-bit), usually this is "Command Line Executables". Also you need
to download `Microsoft HPC Pack 2012 MS-MPI <http://www.microsoft.com/en-us/download/details.aspx?id=36045>`_.
First install Microsoft HPC Pack 2012 MS-MPI by runing :file:`mpi_x64.Msi` for
64-bit platforms and :file:`mpi_x86.Msi` for 32-bit platforms.

.. note::
   If you want to use TauDEM 5.0.6


Installing TauDEM under Linux
.............................

Unfortunately there are no packages for most Linux distributions, so you should
compile TauDEM by yourself. As TauDEM uses MPI it is necessary to install first
any MPI implementation e.g MPICH or OpenMPI. Use your favorite package manager
to install MPICH or OpenMPI.

Download TauDEM 5.2.0 source code package from `GitHub repository <https://github.com/dtarb/TauDEM/releases>`_
and extract archive contents. Open terminal and cd into :file:`src` directory inside
extacted folder. Create build directory and cd into it

::

    mkdir build
    cd build

Configure your build (change install prefix if necessary) and compile

::

   CXX=mpicxx cmake -DCMAKE_INSTALL_PREFIX=/usr/local ..
   make

When compilation finished install TauDEM tools by running

::

    sudo make install

.. note::
   Executable files will be installed into :file:`bin` subdirectory inside
   prefix you specified at the configure stage. For example if you specified
   prefix :file:`/opt/taudem5.2` than binaries will be installed into
   :file:`/opt/taudem5.2/bin`.

To use singlefile version --- download source package `here <http://hydrology.usu.edu/taudem/taudem5/TauDEM5PCsrc_512.zip>`_
and perform abovementioned steps to compile and install it.

Old TauDEM 5.0.6 also `available <http://hydrology.usu.edu/taudem/taudem5/downloads5.0.html>`_.
But before compiling this version it is necessary to edit some source files.

Open the :file:`linearpart.h` file, and after line

::

   #include "mpi.h"

add a new line with

::

   #include <stdint.h>

so you'll get

::

   #include "mpi.h"
   #include <stdint.h>

Save the changes and close the file. Now open :file:`tiffIO.h`, find line ``#include "stdint.h"``
and replace quotes (``""``) with ``<>``, so you'll get

::

   #include <stdint.h>

Save the changes and close the file.

Now configure, compile and install TauDEM 5.0.6 using same commands as described
above.

Configuring TauDEM provider
...........................

Once TauDEM is installed, start |qg|, open the Processing options dialog from
:menuselection:`Processing --> Options...` and configure the TauDEM algorithm
provider. In the :guilabel:`Providers` group find :guilabel:`TauDEM (hydrologic analysis)`
block, and expand it. Here you will see all settings related to TauDEM.

First, ensure that algorithms are enabled, and activate provider if necessary.

Next step is to configure MPI. The :guilabel:`MPICH/OpenMPI bin directory`
setting used to define location of the :file:`mpiexec` program. In most Linux
distributions you can safely leave this empty, as :file:`mpiexec` available in
your ``PATH``.

The :guilabel:`Number of MPI parallel processes to use` is a second setting
related to MPI. It defines number of processes that will be used to execute
TauDEM commands. If you don't know which value to use, it is better to leave
this value unchanged.

Now we need to configure the path to the folder(s) where TauDEM command-line
tools are installed. As we already mention TauDEM provider supports both single-
and multifile TauDEM, so there are two settings for TauDEM folders:

* :guilabel:`TauDEM command line tools folder` used to set location of the
  singlefile tools
* :guilabel:`TauDEM multifile command line tools folder` used to set location
  of the multifile tools

If you have both TauDEM versions installed in different directories it is possible
to specify both options.

The last step is to define which TauDEM version to use:

* with :guilabel:`Enable multifile TauDEM tools` option checked you will use
  multifile TauDEM tools from directory, specified in the
  :guilabel:`TauDEM multifile command line tools folder`. Multifile tools have
  same name as singlefile with "(multifile)" suffix added
* with :guilabel:`Enable single TauDEM tools` option checked you will use
  multifile TauDEM tools from directory, specified in the
  :guilabel:`TauDEM command line tools folder`.

It is possible to enable both tools simultaneously. In this case you will have
two instances of each tool in toolbox and can use them in your analysis.

**IMPORTANT!** Be careful with developing Processing models using TauDEM. As
single- and multifile versions have different inputs, model created with
singlefile algortihms will not work if only multifile algorithms are available.
If you plan to share your model please specify which TauDEM version should be
used or, better, provide two versions of your model: for single- and multifile
TauDEM.
