Planning a solar farm
======================

Module contributed by Paolo Cavallini - `Faunalia <http://www.faunalia.eu>`_ 

.. note:: This chapter shows how to use several criteria to locate the areas suitable for installing a photovoltaic power station

First of all, create an aspect map from DTM:

- :menuselection:`GRASS --> r.aspect` [Data type: int; cell size:100]

In GRASS, aspect is calculated in degrees, counterclockwise starting from East. To extract only South facing slopes (270 degrees +- 45), we can reclassify it:

- :menuselection:`GRASS --> r.reclass`

with the following rules::

     225 thru 315 = 1 south
     * = NULL

You can use the text file ``reclass_south.txt`` provided. Note that with these simple text files we can create also very complex reclassifications.

We want to build a large farm, so we select only large (> 100 ha) contiguous areas:

- :menuselection:`GRASS --> r.reclass.greater`

Finally, we convert to a vector:

- :menuselection:`GRASS --> r.to.vect` [Feature type: area; Smooth corners: yes]

**Exercise for the reader**: repeat the analysis, replacing GRASS commands with analogous from other programs.
