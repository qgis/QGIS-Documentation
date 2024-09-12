File tools
==========

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgisfiledownloader:

Download file
--------------
Downloads a file specified using a URL (using for instance ``http:``
or ``file:``).
In other words you can copy/paste a URL and download the file.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **URL**
     - ``URL``
     - [string]
     - The URL of the file to download.
   * - **File destination**

       Optional
     - ``OUTPUT``
     - [string]

       Default: ``[Save to temporary file]``
     - Specification of the file destination.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Method**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - The HTTP method to use for the request. Options are:

       * 0 --- GET
       * 1 --- POST
   * - **Data**

       Optional
     - ``DATA``
     - [string]
     - The data to add in the body if the request is a POST.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **File destination**
     - ``OUTPUT``
     - [string]
     - The location of the downloaded file

Python code
...........

**Algorithm ID**: ``qgis:filedownloader``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisopenurl:

Open file or URL
----------------
Opens files in their default associated application, 
or URLs in the user's default web browser.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **URL or file path**
     - ``URL``
     - [string]
     - The URL or path of the file to open.

Outputs
.......

The algorithm has no output.

Python code
...........

**Algorithm ID**: ``native:openurl``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
