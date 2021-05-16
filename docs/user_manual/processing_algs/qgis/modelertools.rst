Modeler tools
=============

.. only:: html

   .. contents::
      :local:
      :depth: 1

These tools are only available in the Graphical Modeler.
They are not available in the Processing Toolbox.


.. _qgisloadlayer:

Load layer into project
-----------------------
Loads a layer to the current project.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``INPUT``
     - [layer]
     - Layer to load in the legend
   * - **Loaded layer name**
     - ``NAME``
     - [string]
     - Name of the loaded layer

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``OUTPUT``
     - [same as input]
     - The (renamed) loaded layer

Python code
...........

**Algorithm ID**: ``qgis:loadlayer``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisrenamelayer:

Rename layer
------------
Renames a layer.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``INPUT``
     - [layer]
     - Layer to rename
   * - **New name**
     - ``NAME``
     - [string]
     - The new name of the layer

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``OUTPUT``
     - [same as input]
     - The (renamed) output layer

Python code
...........

**Algorithm ID**: ``qgis:renamelayer``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisstringconcatenation:

String concatenation
--------------------
Concatenates two strings into a single one in the Processing Modeler.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input 1**
     - ``INPUT_1``
     - [string]
     - First string
   * - **Input 2**
     - ``INPUT_2``
     - [string]
     - Second string

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Concatenation**
     - ``CONCATENATION``
     - [string]
     - The concatenated string

Python code
...........

**Algorithm ID**: ``qgis:stringconcatenation``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisfilterlayerbytype:

Filter layer by type
--------------------
This algorithm filters layer by their type. Incoming layers will be directed
to different outputs based on whether they are a vector or raster layer.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``INPUT``
     - [Map Layer]
     - Generic Map Layer


Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``VECTOR``
     - [Vector Layer]
     - A Vector Layer of the input, if compatible
	 * - **Layer**
     - ``RASTER``
     - [Raster Layer]
     - A Raster Layer of the input, if compatible

Python code
...........

**Algorithm ID**: ``qgis:filterlayersbytype``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisfilterbygeometry:

Filter by Geometry
------------------
This algorithm filters features by their geometry type. Incoming features will be directed
to different outputs based on whether they have a point, line or polygon geometry.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``INPUT``
     - [Vector Layer]
     - Layer to evaluate

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``POINTS``
     - [same as input]
     - Layer with points
   * - **Layer**
     - ``LINES``
     - [same as input]
     - Layer with lines
   * - **Layer**
     - ``POLYGONS``
     - [same as input]
     - Layer with polygons
   * - **Layer**
     - ``NO_GEOMETRY``
     - [same as input]
     - Geometry-less vector layer

Python code
...........

**Algorithm ID**: ``qgis:filterbygeometry``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisfeaturefilter:

Feature filter
--------------
This algorithm filters features from the input layer and redirects them to one or several outputs.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``INPUT``
     - [Vector Features]
     - Features to filter


Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Field Name
     - Type
     - Description
   * - **Field**
     - ``Ouput Name``
     - [String]
     - Name of the output
   * - **Field**
     - ``Filter Expression``
     - [Expression]
     - Expression used to filter features in the output
   * - **Field**
     - ``Final Output``
     - [Boolean]
     - Create an output node or not

Python code
...........

**Algorithm ID**: ``qgis:filter``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisconditionalbranch:

Conditional Branch
-----------------
This algorithm adds a conditional branch into a model,
allowing parts of the model to be executed based on
the result of an expression evaluation. Mostly by using
tool dependencies to control the flow of a model.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Field**
     - ``BRANCH``
     - [String]
     - Name of the condition
   * - **Field**
     - ``CONDITION``
     - [Expression]
     - Expression to evaluate

Outputs
.......

None.

Python code
...........

**Algorithm ID**: ``qgis:condition``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisraiseexception:

Raise Exception
---------------
This algorithm raises an exception and cancels a model's execution.
The exception message can be customized, and optionally an expression based condition
can be specified. If an expression condition is used, then the exception will only
be raised if the expression result is true. A false result indicates that no exception
will be raised, and the model execution can continue uninterrupted.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Message**
     - ``MESSAGE``
     - [String]
     - Message to display
   * - **Condition**
     - ``CONDITION``
     - [Expression]
     - Expression to evaluate if true

Outputs
.......

None.

Python code
...........

**Algorithm ID**: ``qgis:raiseexception``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisraisewarning:

Raise Warning
-------------
This algorithm raises a warning message in the log.
The warning message can be customized, and optionally an expression based condition
can be specified. If an expression condition is used, then the warning will only
be logged if the expression result is true. A false result indicates that no warning
will be logged.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Message**
     - ``MESSAGE``
     - [String]
     - Message to display
   * - **Condition**
     - ``CONDITION``
     - [Expression]
     - Expression to evaluate if true

Outputs
.......

None.

Python code
...........

**Algorithm ID**: ``qgis:raisewarning``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgissetprojectvariable:

Set Project Variable
--------------------
This algorithm sets an expression variable for the current project.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Name**
     - ``NAME``
     - [String]
     - Name of the variable
   * - **Value**
     - ``VALUE``
     - [String]
     - Value to be stored

Outputs
.......

None.

Python code
...........

**Algorithm ID**: ``qgis:setprojectvariable``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgissavelogtofile:

Save log to file
----------------
This algorithm saves the model's execution log to a file.
Optionally, the log can be saved in a HTML formatted version.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Use HTML**
     - ``USE_HTML``
     - [Boolean]
     - Use HTML formatting

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **File**
     - ``OUTPUT``
     - [String]
     - Destination of the log

Python code
...........

**Algorithm ID**: ``qgis:savelog``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

.. _qgiscreatedirectory:

Create Directory
----------------
This algorithm creates a new directory on a file system.
Directories will be created recursively, creating all required parent
directories in order to construct the full specified directory path.
No errors will be raised if the directory already exists.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Directory Path**
     - ``PATH``
     - [String]
     - Folder path to create

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output**
     - ``OUTPUT``
     - [Folder]
     - Created folder

Python code
...........

**Algorithm ID**: ``qgis:createdirectory``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
