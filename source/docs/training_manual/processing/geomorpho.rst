.. only:: html

   |updatedisclaimer|

Predicting landslides
==========================================

Module contributed by Paolo Cavallini - `Faunalia <https://www.faunalia.eu>`_

.. note:: This chapter shows how to create an oversimplified model to predict
  the probability of landslides.

First, we calculate slope (choose among various backends; the interested reader
can calculate the difference between the outputs):

* :menuselection:`GRASS --> r.slope`
* :menuselection:`SAGA --> Slope, Aspect, Curvature`
* :menuselection:`GDAL Slope`

Then we create a model of predicted rainfall, based on the interpolation of
rainfall values at meteo stations:

* :menuselection:`GRASS --> v.surf.rst` (resolution: 500 m)

The probability of a landslide will be very roughly related to both rainfall
and slope (of course a real model will use more layers, and appropriate parameters),
let's say ``(rainfall * slope )/100``:

* :menuselection:`SAGA --> Raster calculator` rain, slope: ``(a*b)/100``
  (or: :menuselection:`GRASS --> r.mapcalc`)
* then let's calculate what are the municipalities with the greatest predicted
  risk of rainfall: :menuselection:`SAGA --> Raster statistics with polygons`
  (the parameters of interest are *Maximum* and *Mean*)


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
