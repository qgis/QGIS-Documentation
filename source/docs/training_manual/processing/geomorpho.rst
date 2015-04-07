Predicting landslides
==========================================

Module contributed by Paolo Cavallini - `Faunalia <http://www.faunalia.eu>`_ 

.. note:: This chapter shows how to create an oversimplified model to predict the probability of landslides.

First, we calculate slope (choose among various backends; the interested reader can calculate the difference between the outputs):
 
- :menuselection:`GRASS --> r.slope`
- :menuselection:`SAGA --> Slope, Aspect, Curvature`
- :menuselection:`GDAL Slope`

Then we create a model of predicted rainfall, based on the interpolation of rainfall values at meteo stations:

- :menuselection:`GRASS --> v.surf.rst` (resolution: 500 m)

The probability of a landslide will be very roughly related to both rainfall and slope (of course a real model will use more layers, and appropriate parameters), let's say ``(rainfall * slope )/100``:

- :menuselection:`SAGA --> Raster calculator` rain, slope: ``(a*b)/100`` (or: :menuselection:`GRASS --> r.mapcalc`)
- then let's calculate what are the municipalities with the greates predicted risk of rainfall: :menuselection:`SAGA --> Grid statistics with polygons` (the parameters of interest are *Maximum* and *Mean*)
