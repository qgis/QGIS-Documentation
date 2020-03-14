Raster terrain analysis
=======================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisaspect:

Aspect
------
Calculates the aspect of the Digital Terrain Model in input. The final aspect
raster layer contains values from 0 to 360 that express the slope direction:
starting from North (0°) and continuing clockwise.

.. figure:: img/aspect.png
   :align: center
   :scale: 50%


   Aspect values

The following picture shows the aspect layer reclassified with a color ramp:

.. figure:: img/aspect_2.png
   :align: center

   Aspect layer reclassified

Parameters
..........

``Elevation layer`` [raster]
  Digital Terrain Model raster layer.

``Z factor`` [number]
  Vertical exaggeration. This parameter is useful when the Z units differ from
  the X and Y ones, for example miles and meters. You can use this parameter to
  adjust the final result.

  Default: *1.0*

Outputs
.......

``Aspect`` [raster]
  Aspect raster layer.


.. _qgishillshade:

Hillshade
---------
Calculates the hillshade raster layer given a Digital Terrain Model in input.

The shading of the layer is calculated according to the sun position: you have
the options to change both the horizontal angle (azimuth) and the vertical angle
(sun elevation) of the sun.

.. figure:: img/azimuth.png
   :align: center
   :scale: 50%

   Azimuth and vertical angle

The hillshade layer contains values from 0 (complete shadow) to 255 (complete sun).
Hillshade is used usually to better understand the relief of the area.

.. figure:: img/hillshade.png
   :align: center

   Hillshade layer with azimuth 300 and vertical angle 45

Particularly interesting is to give the hillshade layer a transparency value and
overlap it with the elevation raster:

.. figure:: img/hillshade_2.png
   :align: center

   Overlapping the hillshade with the elevation layer


Parameters
..........

``Elevation layer`` [raster]
  Digital Terrain Model raster layer.

``Z factor`` [number]
  You can use this parameter to exaggerate the final result in order to give it
  a stronger output.

  Default: *1.0*

``Azimuth (horizontal angle)`` [number]
  Set the horizontal angle (in degrees) of the sun. The range of these values can
  go from 0 (North) continuing clockwise.

  Default: *300*

``Vertical angle`` [number]
  Set the vertical angle (in degrees) of the sun, that is the height of the sun.
  Values can go from 0 (minimum elevation) to 90 (maximum elevation).

  Default: *40*


Outputs
.......

``Hillshade`` [raster]
  Hillshade raster layer.


.. _qgishypsometriccurves:

Hypsometric curves
------------------
Calculates hypsometric curves for an input Digital Elevation Model.
Curves are produced as csv file in an output folder specified by the user.

Hypsometric curves are a histogram of the cumulative distribution of elevation
values in a geographical area. You can use hypsometric curves to detect differences
in the landscape due to the geomorphology of the territory.


Parameters
..........

``DEM to analyze`` [raster]
  Digital Terrain Model raster layer to use for calculating altitudes.

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

``Hypsometric curves`` [folder]
  Directory where output will be saved. For each feature from input vector layer
  CSV file with area and altitude values will be created.

  File name consists of prefix ``hystogram_`` followed by layer name and feature ID.

.. figure:: img/hypsometric.png
   :align: center
   :scale: 50%


.. _qgisrelief:

Relief
------
Creates a shaded relief layer from digital elevation data. You can specify manually
all the relief color or you can let the algorithm choose automatically all the
relief classes.

.. figure:: img/relief.png
   :align: center

   Relief layer

Parameters
..........

``Elevation layer`` [raster]
  Digital Terrain Model raster layer.

``Z factor`` [number]
  You can use this parameter to exaggerate the final result in order to give it
  a stronger output.

  Default: *1.0*

``Generate relief classes automatically`` [boolean]
  If you check this option the algorithm will create all the relief color classes
  automatically.

  Default: *False*

``Relief colors`` [table widget]
  Optional

  Use the following table widget if you want to choose the relief colors manually.
  You can add as many color classes as you want: for each class you can choose
  the lower and upper bound and finally by clicking on the color row you can choose
  the color thanks to the color widget.

  .. figure:: img/relief_table.png
     :align: center

     Manually relief color classes

  All the buttons of the right side panel give you the chance to: add or remove
  color classes, change the order of the color classes already defined, open an
  existing file with color classes and save the current classes as file.

Outputs
.......

``Relief`` [raster]
  Relief raster layer.


.. _qgisruggednessindex:

Ruggedness index
----------------
Calculates the quantitative measurement of terrain heterogeneity described by Riley
et al. (1999). It is calculated for every location, by summarizing the change in
elevation within the 3x3 pixel grid.

Each pixel contains the difference in elevation from a center cell and the 8 cells
surrounding it.

.. figure:: img/ruggedness.png
   :align: center

   Ruggedness layer from low (red) to high values (green)

Parameters
..........

``Elevation layer`` [raster]
  Digital Terrain Model raster layer.

``Z factor`` [number]
  You can use this parameter to exaggerate the final result in order to give it
  a stronger output.

  Default: *1.0*

Outputs
.......

``Ruggedness`` [raster]
  Ruggedness raster layer.


.. _qgisslope:

Slope
-----
Calculates the slope from an input raster layer. The slope is the angle of inclination
of the terrain and is expressed in **degrees**.

In the following picture you can see to the left the DTM layer with the elevation
of the terrain while to the right the calculated slope:

.. figure:: img/slope.png
   :align: center

   Flat areas in red, steep areas in blue

Parameters
..........

``Elevation raster`` [raster]
  Digital Terrain Model raster layer.

``Z factor`` [number]
  You can use this parameter to exaggerate the final result in order to give it
  a stronger output.

  Default: *1.0*

Outputs
.......

``Slope`` [raster]
  Slope raster layer.
