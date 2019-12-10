Graphics
========

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
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Category field name**
     - ``NAME_FIELD``
     - [tablefield: any]
     - Categorical field to use for grouping the bars (X axis)
   * - **Value field**
     - ``VALUE_FIELD``
     - [tablefield: any]
     - Value to use for the plot (Y axis).
   * - **Bar plot**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.

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
   * - **Bar plot**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.


.. _qgisboxplot:

Box plot
--------
Creates a box plot from a category field and a numerical layer field.

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
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Category name field**
     - ``NAME_FIELD``
     - [tablefield: any]
     - Categorical field to use for grouping the boxes (X axis)
   * - **Value field**
     - ``VALUE_FIELD``
     - [tablefield: any]
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

   * - **Box plot**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.

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
   * - **Box plot**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.


.. _qgismeanandstandarddeviationplot:

Mean and standard deviation plot
--------------------------------
Creates a box plot with mean and standard deviation values.


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
   * - **Input table**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Category name field**
     - ``NAME_FIELD``
     - [tablefield: any]
     - Categorical field to use for grouping the boxes (X axis)
   * - **Value field**
     - ``VALUE_FIELD``
     - [tablefield: any]
     - Value to use for the plot (Y axis).
   * - **Plot**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.

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
   * - **Plot**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.


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
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Category name field**
     - ``NAME_FIELD``
     - [tablefield: any]
     - Categorical field to use for grouping the features (X axis)
   * - **Value field**
     - ``VALUE_FIELD``
     - [tablefield: any]
     - Value to use for the plot (Y axis).
   * - **Polar plot**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.

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
   * - **Polar plot**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.


.. _qgisrasterlayerhistogram:

Raster layer histogram
----------------------
Generates a histogram with the values of a raster layer.

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
     - [number]

       Default: 10
     - The number of bins to use in the histogram (X axis).
       Minimum 2.
   * - **Histogram**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.

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
   * - **Histogram**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.


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
   :stub-columns: 0

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
     - [tablefield: any]
     - Value to use for the plot (Y axis).
   * - **number of bins**
     - ``BINS``
     - [number]

       Default: 10
     - The number of bins to use in the histogram (X axis).
       Minimum 2.
   * - **Histogram**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.

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
   * - **Histogram**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.


.. _qgisvectorlayerscatterplot:

Vector layer scatterplot
------------------------
Creates a simple ``X`` - ``Y`` scatter plot for a vector layer.


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
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **X attribute**
     - ``XFIELD``
     - [tablefield: any]
     - Field to use for the X axis
   * - **Y attribute**
     - ``YFIELD``
     - [tablefield: any]
     - Field to use for the Y axis
   * - **Scatterplot**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.

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
   * - **Scatterplot**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.


.. _qgisscatter3dplot:

Vector layer scatterplot 3D
---------------------------
Creates a 3D scatter plot for a vector layer.


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
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **X attribute**
     - ``XFIELD``
     - [tablefield: any]
     - Field to use for the X axis
   * - **Y attribute**
     - ``YFIELD``
     - [tablefield: any]
     - Field to use for the Y axis
   * - **Z attribute**
     - ``ZFIELD``
     - [tablefield: any]
     - Field to use for the Z axis
   * - **Histogram**
     - ``OUTPUT``
     - [html]

       Default: ``[Save to temporary file]``
     - Specify the HTML file for the plot. One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.

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
   * - **Histogram**
     - ``OUTPUT``
     - [html]
     - HTML file with the plot.
       Available in the :menuselection:`Processing --> Result Viewer`.
