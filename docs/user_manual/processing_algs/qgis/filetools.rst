File tools
==========

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgisfiledownloader:

Download file via HTTP(S)
----------------------------
Downloads a URL to the file system with an HTTP(S) GET or POST request.

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
     - ``OUTPUT``
     - [string]

       Default: ``[Save to temporary file]``
     - Specification of the file destination.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

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


.. _qgishttprequest:

HTTP(S) POST/GET request
------------------------
Performs a HTTP(S) POST/GET request and returns the HTTP status code and the reply data.
If an error occurs then the error code and the message will be returned.
Optionally, the result can be written to a file on the disk.
By default the algorithm will warn on errors. Optionally, the algorithm can be set to treat HTTP errors as failures.

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
   * - **Method**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - The HTTP method to use for the request. Options are:

       * 0 --- GET
       * 1 --- POST
   * - **POST Data**

       Optional
     - ``DATA``
     - [string]

     - The data to add in the body if the request is a POST.
   * - **Authentication**

       Optional
     - ``AUTH_CONFIG``
     - [authconfig]

       Default: No authentication
     - An authentication configuration to pass
   * - **Consider HTTP errors as failures**
     - ``FAIL_ON_ERROR``
     - [boolean]

       Default: False
     - If set, the algorithm will fail on encountering an HTTP error.
   * - **File destination**

       Optional
     - ``OUTPUT``
     - [string]

       Default: ``[Skip Output]``
     - The result can be written to a file instead of being returned as a string.
       Specification of the file destination. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

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
     - [file]
     - The downloaded file with the returned result
   * - **HTTP Status**
     - ``STATUS_CODE``
     - [string]
     - The HTTP Status
   * - **Network error code**
     - ``ERROR_CODE``
     - [string]
     - The error code when it fails (like as well on 404 HTTP Status etc.)
   * - **Network error message**
     - ``ERROR_MESSAGE``
     - [string]
     - A string containing the error message in case of failure
   * - **Result data**
     - ``RESULT_DATA``
     - [string]
     - A string containing the result data in case of success

Python code
...........

**Algorithm ID**: ``native:httprequest``

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
