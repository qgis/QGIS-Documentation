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

.. attention:: Running this algorithm requires QGIS installed with GDAL_ >=  3.13.0
   (see :menuselection:`Help --> About` menu).

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
     - If checked, additional details about each identified dataset 
        will be added to the output vector layer.
   * - **Output file**
     - ``OUTPUT``
     - [vector: any]
  
       Default: ``[Save to temporary file]``
     - Specification of the output vector layer.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

.. _GDAL: https://gdal.org/en/stable/   

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

     - Vector layer containing the identification fields:
  
       - ``filename``: name of the file.
       - ``driver``: name of the GDAL driver that can open the file.
       - Additional fields if the **Add details about identified datasets in the output** option is checked:
  
         - ``layout``: values can be for example ``COG``.
         - ``file_list``: side-car files (files that store extra data) associated with the dataset.
         - ``has_crs``: whether the dataset has a coordinate reference system defined.
         - ``has_geotransform``: whether the dataset has geotransform defined.
         - ``has_overview``: whether the dataset has overview.

Python code
...........

**Algorithm ID**: ``gdal:dataset_identify``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**