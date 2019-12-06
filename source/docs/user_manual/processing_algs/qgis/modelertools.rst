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
   :stub-columns: 0

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
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``OUTPUT``
     - [same as input]
     - The (renamed) loaded layer


.. _qgisrenamelayer:

Rename layer
------------
This algorithm renames a layer.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

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
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Layer**
     - ``OUTPUT``
     - [same as input]
     - The (renamed) output layer


.. _qgisstringconcatenation:

String concatenation
--------------------
Concatenates two strings into a single one in the Processing Modeler

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

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
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Concatenation**
     - ``CONCATENATION``
     - [string]
     - The concatenated string
