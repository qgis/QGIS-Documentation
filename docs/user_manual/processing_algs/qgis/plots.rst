Plots
=====

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisbarplot:

Bar plot
--------
Creates a bar plot from a category and a layer field.

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
     - [vector: geometry]
     - Input vector layer
   * - **Category field name**
     - ``NAME_FIELD``
     - [tablefield: any]
     - Categorical field to use for grouping the bars (X axis)
   * - **Value field**
     - ``VALUE_FIELD``
     - [tablefield: numeric]
     - Value to use for the plot (Y axis).
   * - **Title**

       Optional
     - ``TITLE``
     - [string]

       Default: ""
     - Title of the plot
   * - **X-axis Title**

       Optional
     - ``XAXIS_TITLE``
     - [string]

       Default: ""
     - If empty, the name of the category field is used. 
       With a single space, the axis title is hidden.
   * - **Y-axis Title**

       Optional
     - ``YAXIS_TITLE``
     - [string]
       
       Default: ""
     - If empty, the name of the value field is used.
       With a single space, the axis title is hidden.
   * - **Bar plot**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. :ref:`One of <output_parameter_widget>`:

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
   * - **Bar plot**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.

Python code
...........

**Algorithm ID**: ``qgis:barplot``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisboxplot:

Box plot
--------
Creates a box plot from a category field and a numerical layer field.

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
     - [vector: geometry]
     - Input vector layer
   * - **Category name field**
     - ``NAME_FIELD``
     - [tablefield: any]
     - Categorical field to use for grouping the boxes (X axis)
   * - **Value field**
     - ``VALUE_FIELD``
     - [tablefield: numeric]
     - Value to use for the plot (Y axis).
   * - **Additional statistic lines**
     - ``MSD``
     - [enumeration]

       Default: 0
     - Additional statistics information to add to the plot.
       One of:

       * 0 --- Show Mean
       * 1 --- Show Standard Deviation
       * 2 --- Don't show mean and standard deviation
   * - **Title**

       Optional
     - ``TITLE``
     - [string]
  
       Default: ""
     - Title of the plot
   * - **X-axis Title**

       Optional
     - ``XAXIS_TITLE``
     - [string]
           
       Default: ""
     - If empty, the name of the category field is used.
       With a single space, the axis title is not shown.
   * - **Y-axis Title**

       Optional
     - ``YAXIS_TITLE``
     - [string]

       Default: ""
     - If empty, the name of the value field is used.
       With a single space, the axis title is not shown.
   * - **Box plot**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. :ref:`One of <output_parameter_widget>`:

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
   * - **Box plot**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.

Python code
...........

**Algorithm ID**: ``qgis:boxplot``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisgenerateelevationprofileimage:

Generate elevation profile image
--------------------------------

Creates an elevation profile image from a list of map layers and an optional terrain layer.

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
   * - **Profile curve**
     - ``CURVE``
     - [vector: line]
     - The line layer representing the profile curve along which the elevation profile will be generated
   * - **Map layers**
     - ``MAP_LAYERS``
     - [layer] [list]
     - The list of map layers to include in the elevation profile
   * - **Chart width (in pixels)**
     - ``WIDTH``
     - [numeric: integer]

       Default: 400

       Minimum value: 0
     - The width of the output chart in pixels.
   * - **Chart height (in pixels)**
     - ``HEIGHT``
     - [numeric: integer]

       Default: 300

       Minimum value: 0
     - The height of the output chart in pixels.
   * - **Terrain layer**

       Optional
     - ``TERRAIN_LAYER``
     - [raster]
     - A terrain layer (e.g., DEM) to use for elevation data. If not provided, elevation data will be derived from the map layers.

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Chart minimum distance (X axis)**

       Optional
     - ``MINIMUM_DISTANCE``
     - [numeric: double]
     - The minimum distance (X axis) to display on the chart. If not specified, the chart will auto-scale.
   * - **Chart maximum distance (X axis)**

       Optional
     - ``MAXIMUM_DISTANCE``
     - [numeric: double]
     - The maximum distance (X axis) to display on the chart. If not specified, the chart will auto-scale.
   * - **Chart minimum elevation (Y axis)**

       Optional
     - ``MINIMUM_ELEVATION``
     - [numeric: double]
     - The minimum elevation (Y axis) to display on the chart. If not specified, the chart will auto-scale.
   * - **Chart maximum elevation (Y axis)**

       Optional
     - ``MAXIMUM_ELEVATION``
     - [numeric: double]
     - The maximum elevation (Y axis) to display on the chart. If not specified, the chart will auto-scale.
   * - **Chart text color**

       Optional
     - ``TEXT_COLOR``
     - [color]
     - The color of the text in the chart (e.g., axis labels, titles).
   * - **Chart background color**

       Optional
     - ``BACKGROUND_COLOR``
     - [color]
     - The background color of the chart.
   * - **Chart border color**

       Optional
     - ``BORDER_COLOR``
     - [color]
     - The color of the chart border.
   * - **Profile tolerance**
     - ``TOLERANCE``
     - [numeric: double]

       Default: 5.0

       Minimum value: 0
     - Defines how far a feature (vector point, line, polygon, or point cloud)
       can be from the profile line to be included in the results. It uses map units
       and does not affect other layer types.
   * - **Chart DPI**
     - ``DPI``
     - [numeric: integer]

       Default: 96

       Minimum value: 0
     - The resolution of the output image in dots per inch (DPI).
   * - **Output image**
     - ``OUTPUT``
     - [file]

       Default: ``[Save to temporary file]``
     - Specify the image file for the plot. :ref:`One of <output_parameter_widget>`:

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
   * - **Output image**
     - ``OUTPUT``
     - [file]
     - The generated elevation profile image in the specified format.


Python code
...........

**Algorithm ID**: ``qgis:generateelevationprofileimage``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

.. _qgismeanandstandarddeviationplot:

Mean and standard deviation plot
--------------------------------
Creates a box plot with mean and standard deviation values.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input table**
     - ``INPUT``
     - [vector: geometry]
     - Input vector layer
   * - **Category name field**
     - ``NAME_FIELD``
     - [tablefield: any]
     - Categorical field to use for grouping the boxes (X axis)
   * - **Value field**
     - ``VALUE_FIELD``
     - [tablefield: numeric]
     - Value to use for the plot (Y axis).
   * - **Plot**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. :ref:`One of <output_parameter_widget>`:

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
   * - **Plot**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.

Python code
...........

**Algorithm ID**: ``qgis:meanandstandarddeviationplot``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgispolarplot:

Polar plot
----------
Generates a polar plot based on the value of an input vector layer.

Two fields must be entered as parameters: one that defines the category each feature
(to group features) and another one with the variable to plot (this has to be
a numeric one).

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
     - [vector: geometry]
     - Input vector layer
   * - **Category name field**
     - ``NAME_FIELD``
     - [tablefield: any]
     - Categorical field to use for grouping the features (X axis)
   * - **Value field**
     - ``VALUE_FIELD``
     - [tablefield: numeric]
     - Value to use for the plot (Y axis).
   * - **Polar plot**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. :ref:`One of <output_parameter_widget>`:

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
   * - **Polar plot**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.

Python code
...........

**Algorithm ID**: ``qgis:polarplot``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisrasterlayerhistogram:

Raster layer histogram
----------------------
Generates a histogram with the values of a raster layer.

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
     - [raster]
     - Input raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]
     - Raster band to use for the histogram
   * - **number of bins**
     - ``BINS``
     - [numeric: integer]

       Default: 10
     - The number of bins to use in the histogram (X axis).
       Minimum 2.
   * - **Histogram**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. :ref:`One of <output_parameter_widget>`:

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
   * - **Histogram**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.

Python code
...........

**Algorithm ID**: ``qgis:rasterlayerhistogram``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisvectorlayerhistogram:

Vector layer histogram
----------------------
Generates a histogram with the values of the attribute of a vector layer.

The attribute to use for computing the histogram must be numeric.

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
     - Input vector layer
   * - **Attribute**
     - ``FIELD``
     - [tablefield: numeric]
     - Value to use for the plot (Y axis).
   * - **number of bins**
     - ``BINS``
     - [numeric: integer]

       Default: 10
     - The number of bins to use in the histogram (X axis).
       Minimum 2.
   * - **Histogram**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. :ref:`One of <output_parameter_widget>`:

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
   * - **Histogram**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.

Python code
...........

**Algorithm ID**: ``qgis:vectorlayerhistogram``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisvectorlayerscatterplot:

Vector layer scatterplot
------------------------
Creates a simple ``X`` - ``Y`` scatter plot for a vector layer.


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
     - [vector: geometry]
     - Input vector layer
   * - **X attribute**
     - ``XFIELD``
     - [tablefield: numeric]
     - Field to use for the X axis
   * - **Y attribute**
     - ``YFIELD``
     - [tablefield: numeric]
     - Field to use for the Y axis
   * - **Hover text**

       Optional
     - ``HOVERTEXT``
     - [expression]

       Default: ""
     - Text to be shown when hovering with the mouse over data points.
       It can be picked from a field or based on an expression.
   * - **Title**

       Optional
     - ``TITLE``
     - [string]

       Default: ""
     - Title of the plot
   * - **X-axis Title**

       Optional
     - ``XAXIS_TITLE``
     - [string]

       Default: ""
     - If empty, the field name of the x attribute is used.
       With a single space, the axis title is not shown.
   * - **Y-axis Title**

       Optional
     - ``YAXIS_TITLE``
     - [string]

       Default: ""
     - If empty, the field name of the y attribute is used.
       With a single space, the axis title is not shown.
   * - **Use logarithmic scale for x-axis**
     - ``XAXIS_LOG``
     - [boolean]

       Default: False
     - When enabled, uses logarithmic scale for the x-axis
   * - **Use logarithmic scale for y-axis**
     - ``YAXIS_LOG``
     - [boolean]

       Default: False
     - When enabled, uses logarithmic scale for the y-axis
   * - **Scatterplot**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. :ref:`One of <output_parameter_widget>`:

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
   * - **Scatterplot**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.

Python code
...........

**Algorithm ID**: ``qgis:vectorlayerscatterplot``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisscatter3dplot:

Vector layer scatterplot 3D
---------------------------
Creates a 3D scatter plot for a vector layer.

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
     - [vector: geometry]
     - Input vector layer
   * - **X attribute**
     - ``XFIELD``
     - [tablefield: numeric]
     - Field to use for the X axis
   * - **Y attribute**
     - ``YFIELD``
     - [tablefield: numeric]
     - Field to use for the Y axis
   * - **Z attribute**
     - ``ZFIELD``
     - [tablefield: numeric]
     - Field to use for the Z axis
   * - **Title**

       Optional
     - ``TITLE``
     - [string]

       Default: ""
     - Title of the plot
   * - **X-axis Title**

       Optional
     - ``XAXIS_TITLE``
     - [string]

       Default: ""
     - If empty, the field name of the X attribute is used.
   * - **Y-axis Title**

       Optional
     - ``YAXIS_TITLE``
     - [string]

       Default: ""
     - If empty, the field name of the Y attribute is used.
   * - **Z-axis Title**

       Optional
     - ``ZAXIS_TITLE``
     - [string]

       Default: ""
     - If empty, the field name of the Z attribute is used.
   * - **Scatterplot 3D**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. :ref:`One of <output_parameter_widget>`:

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
   * - **Scatterplot 3D**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.

Python code
...........

**Algorithm ID**: ``qgis:scatter3dplot``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
