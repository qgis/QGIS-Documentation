.. only:: html

   |updatedisclaimer|

Raster terrain analysis
=======================

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgis_aspect:

Aspect
------
Calculates the aspect of a raster in input. The final aspect raster layer contains
values from 0 to 360 that express the slope direction: starting from North (0°)
and continuing clockwise to East (90°), South (180°) and West (270°):

.. figure:: /static/user_manual/processing_algs/qgis/aspect.png
 :align: center
 :scale: 50%

 Aspect values

The following pictures shows the aspect map reclassified with a color ramp:

.. figure:: /static/user_manual/processing_algs/qgis/aspect_2.png
  :align: center

  Aspect map reclassified

Parameters
..........

``Elevation layer`` [raster]
  Raster layer

``Z factor`` [number]
  Vertical exaggeration. This parameter is useful when you are working with a
  raster in **geographic coordinate system** (X and Y are in degrees) while the
  elevation information is expressed in numbers. You can use the *Z factor* to
  correctly handle the final result without reprojecting the final raster.

  Default: *1.0*

Outputs
.......

``Aspect`` [raster]
  Aspect raster layer.

Console usage
.............

.. code-block:: python

  # import the processing class
  import processing
  # define the path of the output aspect raster as string
  aspect_output = 'path_of_your_output'
  # define the parameters dictionary with all the input
  parameters = {
    'INPUT': 'path_of_your_raster',
    'Z_FACTOR': 10,
    'OUTPUT': aspect_output
  }
  # run the algorithm and load the results
  processing.runAndLoadResults('qgis:aspect', parameters)


.. _qgis_hillshade:

Hillshade
---------
Given a DTM in input calculates the hillshade raster layer.

The shading of the layer is calculated according to the sun position: you have
the options to change both the horizontal angle (azimuth) and the vertical angle
of the sun:

.. figure:: /static/user_manual/processing_algs/qgis/azimuth.png
 :align: center
 :scale: 50%

 Azimuth and vertical angle

The hillshade map contains values from 0 (complete shadow) to 255 (complete sun).

.. figure:: /static/user_manual/processing_algs/qgis/hillshade.png
 :align: center

 Hillshade map with azimuth 300 and vertical angle 45

Particularly interesting is to give the hillshade layer a transparency value and
overlap it with the elevation raster:

.. figure:: /static/user_manual/processing_algs/qgis/hillshade_2.png
 :align: center

 Overlapping the hillshade with the elevation map


Parameters
..........

``Elevation layer`` [raster]
  Raster layer

``Z factor`` [number]
  Vertical exaggeration. This parameter is useful when you are working with a
  raster in **geographic coordinate system** (X and Y are in degrees) while the
  elevation information is expressed in numbers. You can use the *Z factor* to
  correctly handle the final result without reprojecting the final raster.

  Default: *1.0*

``Azimuth (horizontal angle)`` [number]
  Set the horizontal angle of the sun. The range of these values can go from 0
  (North) through 90 (East), 180 (South), 270 (West) and finally 360 (North).

  Default: *300*

``Vertical angle`` [number]
  Set the vertical angle of the sun, that is the height of the sun. Values can
  go from 0 to 90.

  Default: *40*


Outputs
.......

``Hillshade`` [raster]
  Hillshade raster layer.

Console usage
.............

.. code-block:: python

  # import the processing class
  import processing
  # define the path of the output aspect raster as string
  hillshade_output = 'path_of_your_output'
  # define the parameters dictionary with all the input
  parameters = {
    'INPUT' : 'path_of_your_layer',
    'Z_FACTOR':1,
    'AZIMUTH':300,
    'V_ANGLE':40,
    'OUTPUT' : hillshade_output
  }
  # run the algorithm and load the results
  processing.runAndLoadResults('qgis:hillshade', parameters)


.. _qgis_hypsometric_curves:

Hypsometric curves
------------------
This algorithm computes hypsometric curves for an input Digital Elevation Model.
Curves are produced as table files in an output folder specified by the user.

Hypsometric curves are a histogram of the cumulative distribution of elevation
values in a geographical area. You can use hypsometric curves to detect differences
in the landscape due to the geomorphology of the territory.


Parameters
..........

``DEM to analyze`` [raster]
  DEM to use for calculating altitudes.

``Boundary layer``
  Polygonal vector layer with boundaries of areas used to calculate hypsometric
  curves.

``Step``
  Distance between curves.

  Default: *100.0*

``Use % of area instead of absolute value`` [boolean]
  Write area percentage to “Area” field of the CSV file instead of absolute area
  value.

  Default: *False*


Outputs
.......

``Hypsometric curves`` [directory]
  Directory where output will be saved. For each feature from input vector layer
  CSV file with area and altitude values will be created.

  File name consists of prefix ``hystogram_`` followed by layer name and feature ID.


Console usage
.............

.. code-block:: python

  # import the processing class
  import processing
  # define the path of the boundary layer
  boundary_layer = 'path_of_your_boundary_layer'
  # define the path of the output folder
  hypsometric_folder = 'path_of_your_output_directory'
  # define the parameters dictionary with all the input
  parameters = {
    'INPUT': 'path_of_your_layer',
    'BOUNDARY_LAYER': boundary_layer,
    'STEP': 100,
    'USE_PERCENTAGE': False ,
    'OUTPUT': hypsometric_folder
  }
  # run the algorithm
  processing.runAndLoadResults('qgis:hypsometriccurves', parameters)



.. _qgis_relief:

Relief
------
Creates a shaded relief map from digital elevation data. You can specify manually
all the relief color or you can let the algorithm choose automatically all the
relief classes.

.. figure:: /static/user_manual/processing_algs/qgis/relief.png
 :align: center

 Relief map

Parameters
..........

``Elevation layer`` [raster]
  Raster layer

``Z factor`` [number]
  Vertical exaggeration. This parameter is useful when you are working with a
  raster in **geographic coordinate system** (X and Y are in degrees) while the
  elevation information is expressed in numbers. You can use the *Z factor* to
  correctly handle the final result without reprojecting the final raster.

  Default: *1.0*

``Generate relief classes automatically`` [boolean]
  If you check this option the algorithm will create all the relief color classes
  automatically.

  Default: *False*

``Relief colors`` [table widget]
  Optional.

  Use the following table widget if you want to choose the relief colors manually.
  You can add as many color classes as you want: for each class you can choose
  the lower and upper bound and finally by clicking on the color row you can choose
  the color thanks to the color widget.

  .. figure:: /static/user_manual/processing_algs/qgis/relief_table.png
   :align: center

   Manually relief color classes

  All the buttons of the right side panel give you the chance to: add or remove
  color classes, change the order of the color classes already defined, open an
  existing file with color classes and save the current classes as file.

Outputs
.......

``Relief`` [raster]
  Relief raster layer.

Console usage
.............

.. code-block:: python

  # import the processing class
  import processing
  # define the path of the output relief raster as string
  relief_path = 'path_of_your_output'
  # define the parameters dictionary with all the input
  parameters = {
    'INPUT': 'path_of_dtm_layer',
    'Z_FACTOR': 1,
    'AUTO_COLORS': True,
    # COLORS variable is empty because colors are auto-generated
    'COLORS': '',
    'OUTPUT': relief_path
  }
  # run the algorithm
  processing.runAndLoadResults('qgis:polygonfromlayerextent', parameters)


.. _qgis_ruggedness_index:

Ruggedness index
----------------
Quantitative measurement of terrain heterogeneity described by Riley et al.
(1999). It is calculated for every location, by summarizing the change in elevation
within the 3x3 pixel grid.

Each pixel contains the difference in elevation from a center cell and the 8 cells
surrounding it.

.. figure:: /static/user_manual/processing_algs/qgis/ruggedness.png
   :align: center

   Ruggedness map from low (red) to high values (green)

Parameters
..........

``Elevation layer`` [raster]
  Raster layer

``Z factor`` [number]
  Vertical exaggeration. This parameter is useful when you are working with a
  raster in **geographic coordinate system** (X and Y are in degrees) while the
  elevation information is expressed in numbers. You can use the *Z factor* to
  correctly handle the final result without reprojecting the final raster.

  Default: *1.0*

Outputs
.......

``Ruggedness`` [raster]
  Ruggedness raster layer.

Console usage
.............

.. code-block:: python

  # import the processing class
  import processing class
  # define the path of the output aspect raster as string
  ruggedness_output = 'path_of_your_output'
  # define the parameters dictionary with all the input
  parameters = {
    'INPUT': 'path_of_your_layer',
    'Z_FACTOR': 1,
    'OUTPUT': ruggedness_output
  }
  # run the algorithm
  processing.runAndLoadResults('qgis:ruggednessindex', parameters)


.. _qgis_slope:

Slope
-----
Calculates the slope from an input raster layer. The slope is the angle of inclination
of the terrain and is expressed in **degrees**.

In the following picture you can see to the left the DTM layer with the elevation
of the terrain while to the right the calculated slope:

.. figure:: /static/user_manual/processing_algs/qgis/slope.png
   :align: center

   Left the elevation layer, right the calculated slope

Parameters
..........

``Elevation raster`` [raster]
  Raster layer

``Z factor`` [number]
  Vertical exaggeration. This parameter is useful when you are working with a
  raster in **geographic coordinate system** (X and Y are in degrees) while the
  elevation information is expressed in numbers. You can use the *Z factor* to
  correctly handle the final result without reprojecting the final raster.

  Default: *1.0*

Outputs
.......

``Slope`` [raster]
  Slope raster layer.


Console usage
.............

.. code-block:: python

  # import the processing class
  import processing
  # define the path of the output aspect raster as string
  slope_output = 'path_of_your_output'
  # define the parameters dictionary with all the input
  parameters = {
    'INPUT': 'path_of_your_layer',
    'Z_FACTOR': 1,
    'OUTPUT': slope_output
  }
  # run the algorithm
  processing.runAndLoadResults('qgis:slope', parameters)
