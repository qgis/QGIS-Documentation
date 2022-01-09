Modeler tools
=============

.. only:: html

   .. contents::
      :local:
      :depth: 1

These tools are only available in the Graphical Modeler.
They are not available in the Processing Toolbox.


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

.. include:: qgis_algs_include.rst
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

**Algorithm ID**: ``qgis:loadlayer``

.. include:: qgis_algs_include.rst
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
     - ``CONDITION``
     - [expression]
     - Expression to evaluate if true

Outputs
.......

None.

Python code
...........

**Algorithm ID**: ``native:raiseexception``

.. include:: qgis_algs_include.rst
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
     - ``CONDITION``
     - [expression]
     - Expression to evaluate if true

Outputs
.......

None.

Python code
...........

**Algorithm ID**: ``native:raisewarning``

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

**Algorithm ID**: ``native:renamelayer``

.. include:: qgis_algs_include.rst
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

.. include:: qgis_algs_include.rst
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
