GPS
========

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgisconvertgpsdata:

Convert GPS data
-----------------

Uses the `GPSBabel tool <https://www.gpsbabel.org/index.html>`_ to convert
a GPS data file from a range of formats to the GPX standard format.

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
   * - **Input file**
     - ``INPUT``
     - [file]
     - File containing the data to convert
   * - **Format**
     - ``FORMAT``
     - [enumeration]
     - Format of the file to convert,
       from `this list <https://www.gpsbabel.org/capabilities.html>`_.
   * - **Feature type**
     - ``FEATURE_TYPE``
     - [enumeration]

       Default: 0
     - The type of data to convert

       * 0 --- Waypoints
       * 1 --- Routes
       * 2 --- Tracks

   * - **Output**
     - ``OUTPUT``
     - [vector: any]

       Default: ``[Save to temporary file]``
     - Specification of the output GPX file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Output layer**
     - ``OUTPUT_LAYER``
     - [vector: any]
     - Output layer with data in GPX standard format

Python code
...........

**Algorithm ID**: ``native:convertgpsdata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisconvertgpxfeaturetype:

Convert GPX feature type
------------------------

Uses the `GPSBabel tool <https://www.gpsbabel.org/index.html>`_ to convert
GPX features from one type to another (e.g. converting all waypoint features to a route).

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
   * - **Input file**
     - ``INPUT``
     - [file]
     - File containing the data to convert
   * - **Conversion**
     - ``CONVERSION``
     - [enumeration]

       Default: 0
     - The type of conversion to apply

       * 0 --- Waypoints from a route
       * 1 --- Waypoints from a track
       * 2 --- Routes from waypoints
       * 3 --- Tracks from waypoints

   * - **Output**
     - ``OUTPUT``
     - [vector: point or line]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Output**
     - ``OUTPUT``
     - [vector: any]
     - Output layer with converted GPX features

Python code
...........

**Algorithm ID**: ``native:convertgpxfeaturetype``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisdownloadgpsdata:

Download GPS data from device
-----------------------------

Uses the `GPSBabel tool <https://www.gpsbabel.org/index.html>`_ to download
data from a GPS device into the GPX standard format.

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
   * - **Device**
     - ``DEVICE``
     - [file]
     - The GPS device used to create the data
   * - **Port**
     - ``PORT``
     - [enumeration]
     - The port the device is connected to.
   * - **Feature type**
     - ``FEATURE_TYPE``
     - [enumeration]

       Default: 0
     - The type of data to convert

       * 0 --- Waypoints
       * 1 --- Routes
       * 2 --- Tracks

   * - **Output**
     - ``OUTPUT``
     - [vector: any]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Output layer**
     - ``OUTPUT_LAYER``
     - [vector: any]
     - Output layer with data in GPX standard format

Python code
...........

**Algorithm ID**: ``native:downloadgpsdata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisuploadgpsdata:

Upload GPS data to device
-------------------------

Uses the `GPSBabel tool <https://www.gpsbabel.org/index.html>`_ to upload
data to a GPS device from the GPX standard format.

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
   * - **Input file**
     - ``INPUT``
     - [file]
     - :file:`.GPX` file containing the data to upload
   * - **Device**
     - ``DEVICE``
     - [file]
     - The GPS device to upload the data to
   * - **Port**
     - ``PORT``
     - [enumeration]
     - The port the device is connected to.
   * - **Feature type**
     - ``FEATURE_TYPE``
     - [enumeration]

       Default: 0
     - The type of data to upload

       * 0 --- Waypoints
       * 1 --- Routes
       * 2 --- Tracks

Outputs
.......

No output is provided. If successful, data are loaded to the device.

Python code
...........

**Algorithm ID**: ``native:uploadgpsdata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

