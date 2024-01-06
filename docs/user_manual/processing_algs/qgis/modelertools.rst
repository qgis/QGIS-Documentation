Modeler tools
=============

.. warning::

 These tools are only available in the model designer.
 They are not available in the Processing Toolbox.

.. only:: html

   .. contents::
      :local:
      :depth: 1
      :class: toc_columns


.. _qgiscalculateexpression:

Calculate expression 
--------------------

It calculates the result of a QGIS expression and eliminates 
the need to use the same expression multiple times throughout 
a model when the same result is required more than once. 
Additionally, it enables use cases that would otherwise not be
possible. For instance, you can generate a timestamp value once
and use it multiple times within the model, if the timestamp 
were recalculated every time, the values would vary during the
model's runtime.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input**
     - ``INPUT``
     - [expression]
     - Expression to calculate 

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Value**
     - ``OUTPUT``
     - [Result Value]
     - Calculated result value, the data type of the
       output will vary based on the specific expression used 
       in the algorithm.

Python code
...........

**Algorithm ID**: ``native:calculateexpression``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**



.. _qgiscondition:

Conditional branch
------------------
Adds a conditional branch into a model,
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
     - [string]
     - Name of the condition
   * - **Field**
     - ``CONDITION``
     - [expression]
     - Expression to evaluate

Outputs
.......

None.

Python code
...........

**Algorithm ID**: ``native:condition``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscreatedirectory:

Create directory
----------------
Creates a new directory on a file system.
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
   * - **Directory path**
     - ``PATH``
     - [string]
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
     - [folder]
     - Created folder

Python code
...........

**Algorithm ID**: ``native:createdirectory``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisfilter:

Feature filter
-----------------------------
Filters features from the input layer and redirects
them to one or several outputs.
If you do not know about any attribute names that are common to all
possible input layers, filtering is only possible on the feature
geometry and general record mechanisms, such as ``$id`` and ``uuid``.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - The input layer.
   * - **Outputs and filters**

       (one or more)
     - ``OUTPUT_<name of the filter>``
     - [same as input]
     - The output layers with filters (as many as there are filters).

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

       (one or more)
     - ``native:filter_1:OUTPUT_<name of filter>``
     - [same as input]
     - The output layers with filtered features (as many as there are
       filters).

Python code
...........

**Algorithm ID**: ``native:filter``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisfilterlayersbytype:

Filter layers by type
---------------------
Filters layers by their type. Incoming layers will be directed
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
   * - **Input layer**
     - ``INPUT``
     - [layer]
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
   * - **Vector features**

       Optional
     - ``VECTOR``
     - [vector]
     - A Vector Layer of the input, if compatible
   * - **Raster layer**

       Optional
     - ``RASTER``
     - [raster]
     - A Raster Layer of the input, if compatible

Python code
...........

**Algorithm ID**: ``native:filterlayersbytype``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


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

**Algorithm ID**: ``native:loadlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisraiseexception:

Raise exception
---------------
Raises an exception and cancels a model's execution.
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
     - [string]
     - Message to display
   * - **Condition**

       Optional
     - ``CONDITION``
     - [expression]
     - Expression to evaluate if true

Outputs
.......

A message in the log panel.

Python code
...........

**Algorithm ID**: ``native:raiseexception``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisraisemessage:

Raise message
-------------

Raises an information message in the log.
The message can be customized, and optionally an expression based condition
can be specified. If an expression condition is used, then the message will only
be logged if the expression result is true. A false result indicates that no message
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
   * - **Information message**
     - ``MESSAGE``
     - [string]
     - Message to display
   * - **Condition**

       Optional
     - ``CONDITION``
     - [expression]
     - Expression to evaluate if true

Outputs
.......

A message in the log panel.

Python code
...........

**Algorithm ID**: ``native:raisemessage``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisraisewarning:

Raise warning
-------------
Raises a warning message in the log.
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
     - [string]
     - Message to display
   * - **Condition**

       Optional
     - ``CONDITION``
     - [expression]
     - Expression to evaluate if true

Outputs
.......

A message in the log panel.

Python code
...........

**Algorithm ID**: ``native:raisewarning``

.. include:: ../algs_include.rst
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

**Algorithm ID**: ``native:renamelayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgissavelog:

Save log to file
----------------
Saves the model's execution log to a file.
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

       Default: False
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
     - [string]
     - Destination of the log

Python code
...........

**Algorithm ID**: ``native:savelog``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

.. _qgissetprojectvariable:

Set project variable
--------------------
Sets an expression variable for the current project.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Variable name**
     - ``NAME``
     - [string]
     - Name of the variable
   * - **Variable value**
     - ``VALUE``
     - [string]
     - Value to be stored

Outputs
.......

None.

Python code
...........

**Algorithm ID**: ``native:setprojectvariable``

.. include:: ../algs_include.rst
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

**Algorithm ID**: ``native:stringconcatenation``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisvariabledistancebuffer:

Variable distance buffer
--------------------------------------------------

.. warning:: This algorithm is deprecated and can be removed
  anytime. Prefer using :ref:`qgisbuffer` algorithm instead.

Computes a buffer area for all the features in an input layer.

The size of the buffer for a given feature is defined by an
attribute, so it allows different features to have different buffer
sizes.

.. seealso:: :ref:`qgisbuffer`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Distance field**
     - ``DISTANCE``
     - [tablefield: numeric]
     - Attribute for the distance radius of the buffer
   * - **Segments**
     - ``SEGMENTS``
     - [number]

       Default: *5*
     - Controls the number of line segments to use to approximate a
       quarter circle when creating rounded offsets.
   * - **Dissolve result**
     - ``DISSOLVE``
     - [boolean]

       Default: *False*
     - Choose to dissolve the final buffer, resulting in a single
       feature covering all input features.

       .. figure:: img/buffer_dissolve.png
          :align: center

          Normal and dissolved buffer
   * - **End cap style**
     - ``END_CAP_STYLE``
     - [enumeration]

       Default: Round
     - Controls how line endings are handled in the buffer.

       .. figure:: img/buffer_cap_style.png
          :align: center

          Round, flat and square cap styles
   * - **Join style**
     - ``JOIN_STYLE``
     - [enumeration]

       Default: Round
     - Specifies whether round, miter or beveled joins should be used
       when offsetting corners in a line.
   * - **Miter limit**
     - ``MITER_LIMIT``
     - [number]

       Default: 2.0
     - Only applicable for mitered join styles, and controls the
       maximum distance from the offset curve to use when creating a
       mitered join.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Buffer**
     - ``OUTPUT``
     - [vector: polygon]
     - Buffer polygon vector layer.

Python code
...........

**Algorithm ID**: ``qgis:variabledistancebuffer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
