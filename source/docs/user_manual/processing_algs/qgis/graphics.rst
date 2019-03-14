.. only:: html

   |updatedisclaimer|

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

``Input layer`` [vector: any]
  Input vector layer to use for the plot.

``Category field name`` [tablefield: any]
  Categorical field to use for grouping the bars (X axis).

``Value field`` [tablefield: any]
  Value to use for the plot (Y axis).

Outputs
.......

``Bar plot`` [html]
  ``html`` file of the plot available in the :menuselection:`Processing --> Result Viewer`.


.. _qgisboxplot:

Box plot
--------
Creates a box plot from a category and a layer field.


Parameters
..........

``Input layer`` [vector: any]
  Input vector layer to use for the plot.

``Category field name`` [tablefield: any]
  Categorical field to use for grouping the boxes (X axis).

``Value field`` [tablefield: any]
  Value to use for the plot (Y axis).

``Additional statistic lines`` [enumeration]
  Additional statistics information to add to the plot. Options available are:

  * Show Mean
  * Show Standard Deviation
  * Don't show mean and standard deviation

  Default: *Show Mean*

Outputs
.......

``Box plot`` [html]
  ``html`` file of the plot available in the :menuselection:`Processing --> Result Viewer`.



.. _qgismeanandstandarddeviationplot:

Mean and standard deviation plot
--------------------------------
Creates a box plot with mean and standard deviation values.


Parameters
..........

``Input table`` [vector: any]
  Input vector layer to use for the plot.

``Category name field`` [tablefield: any]
  Categorical field to use for grouping the boxes (X axis).

``Value field`` [tablefield: any]
  Value to use for the plot (Y axis).

Outputs
.......

``Plot`` [html]
  ``html`` file of the plot available in the :menuselection:`Processing --> Result Viewer`.



.. _qgispolarplot:

Polar plot
----------
Generates a polar plot based on the value of an input vector layer.

Two fields must be entered as parameters: one that defines the category each feature
(to group features) and another one with the variable to plot (this has to be
a numeric one).

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer to use for the plot.

``Category field name`` [tablefield: any]
  Categorical field to group the features.

``Value field`` [tablefield: numeric]
  Value to use for the plot.

Outputs
.......

``Polar plot`` [html]
  ``html`` file of the plot available in the :menuselection:`Processing --> Result Viewer`.



.. _qgisrasterlayerhistogram:

Raster layer histogram
----------------------
Generates a histogram with the values of a raster layer.

Parameters
..........

``Input layer`` [raster]
  Input raster layer to use for the plot.

``Band number`` [raster band]
  Raster band to use for the histogram.

``number of bins`` [number]
  Total bins of the histogram.

  Default: *10*

Outputs
.......

``Histogram`` [html]
  ``html`` file of the plot available in the :menuselection:`Processing --> Result Viewer`.



.. _qgisvectorlayerhistogram:

Vector layer histogram
----------------------
Generates a histogram with the values of the attribute of a vector layer.

The attribute to use for computing the histogram must be a numeric attribute.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer to use for the plot.

``Category field name`` [tablefield: any]
  Field to use for the histogram.

``number of bins`` [number]
  Total bins of the histogram.

  Default: *10*

Outputs
.......

``Histogram`` [html]
  ``html`` file of the plot available in the :menuselection:`Processing --> Result Viewer`.



.. _qgisvectorlayerscatterplot:

Vector layer scatterplot
------------------------
Creates a simple ``X`` - ``Y`` scatter plot for a vector layer.


Parameters
..........

``Input layer`` [vector: any]
  Input vector layer to use for the plot.

``X attribute`` [tablefield: any]
  Field to use for the X axis.

``Y attribute`` [tablefield: any]
  Field to use for the Y axis.

Outputs
.......

``Scatterplot`` [html]
  ``html`` file of the plot available in the :menuselection:`Processing --> Result Viewer`.



.. _qgisscatter3dplot:

Vector layer scatterplot 3D
---------------------------
Creates a 3D scatter plot for a vector layer.


Parameters
..........

``Input layer`` [vector: any]
  Input vector layer to use for the plot.

``X attribute`` [tablefield: any]
  Field to use for the X axis.

``Y attribute`` [tablefield: any]
  Field to use for the Y axis.

``Z attribute`` [tablefield: any]
  Field to use for the Z axis.

Outputs
.......

``Scatterplot`` [html]
  ``html`` file of the plot available in the :menuselection:`Processing --> Result Viewer`.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
