.. _`temporal`:

****************
Temporal Support
****************

.. only:: html

   .. contents::
      :local:

QGIS can handle temporal control on loaded layers depending on the information
of the data. 

Different providers are supported:

* vector layers
* raster layers
* mesh
* WMST

Activating the temporal support means setting up the temporal options on the
layer(s) and then enabling the temporal view QGIS-wide.

The temporal support is also available in the print layout: you can export time
based maps.

Many variables are added to the Field Calculator so that you can use them to
change the appearance of the layer(s) depending on the current map time.


.. _temporal_vector:

Vector Layers
=============