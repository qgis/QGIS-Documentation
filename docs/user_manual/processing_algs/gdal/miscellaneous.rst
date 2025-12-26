Miscellaneous
=============

.. only:: html

   .. contents::
      :local:
      :depth: 1
      :class: toc-columns


.. _gdalidentifydatasets:

Dataset Identification
----------------------

Reports the name of GDAL drivers that can open files contained in a folder,
with optional additional details, and write the result into an output vector layer.

.. note:: This algorithm requires GDAL version 3.13.0.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input folder**
     - ``INPUT``
     - [folder]
     - Folder containing datasets to identify.
   * - **Perform recursive exploration of the input folder**
     - ``RECURSIVE``
     - [boolean]
  
       Default: ``True``
     - If checked, the algorithm will scan subfolders recursively to
       identify datasets in the entire directory tree.
       
   * - **Add details about identified datasets in the output**
     - ``DETAILS``
     - [boolean]
  
       Default: ``True``
     - If checked, reports additional information about identified
       datasets, including whether the file is a Cloud Optimized GeoTIFF
       (COG), the list of files that compose the dataset, whether it has
       georeferencing (``has_geotransform`` and ``has_crs`` fields), and
       overviews.
       
   * - **Output file**
     - ``OUTPUT``
     - [vector: any]
  
       Default: ``[Save to temporary file]``
     - Specification of the output vector layer.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output file**
     - ``OUTPUT``
     - [vector: any]

     - Vector layer containing the identification results.

Python code
...........

**Algorithm ID**: ``gdal:dataset_identify``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**