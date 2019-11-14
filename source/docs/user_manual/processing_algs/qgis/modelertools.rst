.. only:: html


Modeler tools
=============

.. only:: html

   .. contents::
      :local:
      :depth: 1

These tools are only available in the Graphial Modeler.
They are not available in the Processing Toolbox.


.. _qgisloadlayer:

Load layer into project
-----------------------
Loads a layer to the current project.

Parameters
..........

``Layer`` [layer: any]
  Layer to load in the legend.

``Loaded layer name`` [string]
  Name of the loaded layer.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Layer**
      - ``INPUT``
      - [layer:any]
      - Layer to load in the legend
   *  - **Loaded layer name**
      - ``NAME``
      - [string]
      - Name of the loaded layer

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Layer**
      - ``OUTPUT``
      - [vector:any]
      - The (renamed) output layer


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

   *  - Label
      - Name
      - Type
      - Description
   *  - **Layer**
      - ``INPUT``
      - [layer:any]
      - Layer to rename
   *  - **New name**
      - ``NAME``
      - [string]
      - The new name of the layer

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Layer**
      - ``OUTPUT``
      - [layer:any]
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

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input 1**
      - ``INPUT_1``
      - [string]
      - First string
   *  - **Input 2**
      - ``INPUT_2``
      - [string]
      - Second string

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Concatenation**
      - ``CONCATENATION``
      - [string]
      - The concatenated string


.. _qgisvariabledistancebuffer:

Variable distance buffer
------------------------
Computes a buffer area for all the features in an input layer.

The size of the buffer for a given feature is defined by an attribute,
so it allows different features to have different buffer sizes.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input layer**
      - ``INPUT``
      - [vector: any]
      - Input vector layer
   *  - **Distance field**
      - ``DISTANCE``
      - [tablefield: numeric]
      - Attribute for the distance radius of the buffer
   *  - **Segments**
      - ``SEGMENTS``
      - [number]
        
        Default: *5*
      - Controls the number of line segments to use to approximate a
        quarter circle when creating rounded offsets.
   *  - **Dissolve result**
      - ``DISSOLVE``
      - [boolean]
        
        Default: *False*
      - Choose to dissolve the final buffer, resulting in a single
        feature covering all input features.

        .. figure:: img/buffer_dissolve.png
           :align: center
        
           Normal and dissolved buffer
   *  - **End cap style**
      - ``END_CAP_STYLE``
      - [enumeration]
      - Controls how line endings are handled in the buffer.
        
        .. figure:: img/buffer_cap_style.png
           :align: center
        
           Round, flat and square cap styles
   *  - **Join style**
      - ``JOIN_STYLE``
      - [enumeration]
      - Specifies whether round, miter or beveled joins should be used
        when offsetting corners in a line.
   *  - **Miter limit**
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
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Buffer**
      - ``OUTPUT``
      - [vector: polygon]
      - Buffer polygon vector layer.

See also
........

:ref:`qgisbuffer`
