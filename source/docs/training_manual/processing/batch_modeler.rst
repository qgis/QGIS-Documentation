.. only:: html

   |updatedisclaimer|

Models in the batch processing interface
=========================================

.. warning:: Beware, this chapter is not well tested, please report any issue; images are missing

.. note:: This lesson shows another example of the batch processing interface, but this time using a model instead of a built-in algorithm

Models are just like any other algorithm, and they can be used in the batch processing interface. To demonstrate that, here is a brief example that we can do using our already well-known hydrological model.

Make sure you have the model added to your toolbox, and then run it in batch mode. This is what the batch processing dialog should look like.

.. warning:: todo: Add image

Add rows up to a total of 5. Select the DEM file corresponding to this lesson as the input for all of them. Then enter 5 different threshold values as shown next.

.. warning:: todo: Add image

As you see the batch processing interface can be run not just to run the same process on different datasets but also on the same dataset with different parameters.

Click on *OK* and you should get 5 new layers with watersheds corresponding to the specified 5 threshold values.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
