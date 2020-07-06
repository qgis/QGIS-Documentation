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
     - ``OUTPUT``
     - [string]

       Default: ``[Save to temporary file]``
     - Specification of the file destination.
       One of:

       * Skip Output
       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.
       

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

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


