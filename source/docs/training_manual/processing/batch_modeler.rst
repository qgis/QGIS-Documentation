Models in the batch processing interface
=========================================

.. note:: This lesson shows another example of the batch processing interface, but this time using a model instead of a built-in algorithm

Model are just like any other algorithm, and they can be used in the batch processing interface. To demonstrate that, here is a brief example that we can do using our already well-known hydrological model.

Make sure you have the model added to your toolbox, and then run it in batch mode. This is what the batch processing dialog should look like.

.. image:: img/batch_modeler/dialog.png


Add rows up to a total of 5. Select the DEM file corresponding to this lesson as the input for all of them. Then enter 5 different threshold values as shown next.

.. image:: img/batch_modeler/filled.png


As you see the batch processing interface can be run not just to run the same process on different datasets but also on the same dataset with different parameters.

Click on *OK* and you should get 5 new layers with watersheds corresponding to the specified 5 threshold values.