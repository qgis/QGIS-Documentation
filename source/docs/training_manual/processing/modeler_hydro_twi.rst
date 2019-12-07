A model within a model
======================

.. warning:: Beware, this chapter is not well tested, please report any issue; images are missing

.. note:: In this lesson we will see how to use a model within a bigger model.

We have already created a few models, and in this lesson we are going to see how we can combine them on a single bigger one. A model behaves like any other algorithm, which means that you can add a model that you have already created as part of another one that you create after that.

In this case, we are going to expand our hydrological model, by adding the mean TWI value in each of the basins that it generates as result. To do that, we need to calculate the TWI, and to compute the statistics. Since we have already created a model to calculate TWI from a DEM, it is a good idea to reuse that model instead of adding the algorithms it contains individually.

Let's start with the model we used as starting point for the last lesson.

.. warning:: todo: Add image

First, we will add the TWI model. For it to be available, it should have been saved on the models folder, since otherwise it will not be shown in the toolbox or the algorithms list in the modeler. Make sure you have it available.

Add it to the current model and use the input DEM as its input. The output is a temporary one, since we just want the TWI layer to compute the statistics. The only output of this model we are creating will still be the vector layer with the watersheds.

Here is the corresponding parameters dialog:

.. warning:: todo: Add image

Now we have a TWI layer that we can use along with the watersheds vector layer, to generate a new one which contains the values of the TWI corresponding to each watershed.

This calculation is done using the *Grid statistics in polygons* algorithm. Use the layers mentioned above as input, to create the final result.

.. warning:: todo: Add image

The output of the *Vectorize grid classes* algorithm was originally our final output, but now we just want it as an intermediate result. To change that, we have to edit the algorithm. Just double--click on it to see its parameters dialog, and delete the name of the output. That will make it a temporary output, as it is by default.

.. warning:: todo: Add image

This is how the final model should look like:

.. warning:: todo: Add image

As you see, using a model in another model is nothing special, and you can add it just like you add another algorithm, as long as the model is saved in the models folder and is available in the toolbox.
