Use R scripts in Processing
===========================

Module contributed by Matteo Ghetta - `Dropcode <www.dropcode.weebly.com>`_ 

Processing allows to write and run R scripts inside QGIS.

.. warning:: R has to be installed on your computer and the PATH has to correctly set up. Moreover Processing just calls the external R packages, it is not able to install them. So be sure to install external packages directly in R. See the related `chapter <http://docs.qgis.org/testing/en/docs/user_manual/processing/3rdParty.html>`_ in the training manual.

.. note:: If you have some *packages* problem, maybe it is related to missing *mandatory* packages required by Processing, like ``sp``, ``rgdal`` and ``raster``.

Adding scripts
--------------
Adding a script is very simple. Open the Processing toolbox and just click on the :menuselection:`R --> Tools --> Create new R script`.

.. image:: img/r_intro/r_intro_1.png

.. note:: If you cannot see R in Processing, you have to activate it in :menuselection:`Processing --> Options --> Providers`

It opens a *script editor window* in which you have to specify some parameters before you can add the script body.

.. image:: img/r_intro/r_intro_2.png
    :scale: 70%
    :align: center


Creating plots
^^^^^^^^^^^^^^
In this tutorial we are going to create a **boxplot** of a vector layer field.

Open the :file:`r_intro.qps` QGIS project.


Script parameters
"""""""""""""""""
Open the editor and start writing at the beginning of it. 

You **must** specify some parameters **before** the script body:

1. the name of the group in which you want to put your script::

    ##plots=group
    
so you will find your script in the **plots** group in the Processing toolbox.

2. you have to tell Processing that you want to display a plot (just in this example):: 

    ##showplots

this way in the **Result Viewer** of Processing you'll see the plot.

3. You need also to tell Processing with which kind of data you are working with. In this example we want to create a plot from a field of a vector layer::

    ##Layer=vector

Processing knows now that the input is a vector. The name *Layer* is not important, what matters is the **vector** parameter.

4. Finally, you have to specify the input field of the vector layer you want to plot::

    ##X=Field Layer

So Processing knows that you have called **X** the **Field Layer**.


Script body
"""""""""""
Now that you have set up the *heading* of the script you can add the function::

    boxplot(Layer[[X]])

Notice that **boxplot** is the name of the R function itself that calls **Layer** as dataset and **X** as the field of the dataset.

.. warning:: The parameter **X** is within a double square bracket ``[[]]``

The final script looks like this::

    ##Vector processing=group
    ##showplots
    ##Layer=vector
    ##X=Field Layer
    boxplot(Layer[[X]])

.. image:: img/r_intro/r_intro_3.png

Save the script in the default path suggested by Processing. The name you choose will be the same as the name of the script you'll find in the Processing toolbox.

.. note:: You can save the script in other paths, but Processing isn't able to upload them automatically and you have to upload all the scripts manually

Now just run it using the button on the top of the editor window:

.. image:: img/r_intro/r_intro_4.png

Otherwise, once the editor window has been closed, use the text box of Processing to find your script:

.. image:: img/r_intro/r_intro_5.png

You are now able to fill the parameters required in the Processing algorithm window:

* as **Layer** choose the *sample points* one
* fill the **X** field with the **value** parameter

Click on **Run**.

.. image:: img/r_intro/r_intro_6.png

The **Result window** should be automatically opened, if not, just click on :menuselection:`Processing --> Result Viewer...`.

This is the final result you'll see:

.. image:: img/r_intro/r_intro_7.png

.. note:: You can open, copy and save the image by right clicking on the plot

Create a vector
^^^^^^^^^^^^^^^
With an R script you can also create a vector and automatically load it in QGIS.

The following example has been taken from the ``Random sampling grid`` script that you can download from the online collection :menuselection:`R --> Tools --> Download R scripts from the on-line collection`.

The aim of this exercise is to crate a random point vector in a layer extent using the ``spsample`` function of the ``sp`` package.


Script parameters
"""""""""""""""""
As before we have to set some parameters before the script body:

1. specify the the name of the group in which you want to put your script, for example *Point pattern analysis*:: 

    ##Point pattern analysis=group
    
2. set the layer that will contain the random points::

    ##Layer=vector
    
3. set the number of points that are going to be created::

    ##Size=number 10
    
.. note:: 10 is going to be the default value. You can change this number or you can leave the parameter without a default number

4. specify that the output is a vector layer::

    ##Output= output vector 

    
Script body
"""""""""""
Now you can add the body of the function:

1. run the ``spsample`` function::

    pts=spsample(Layer,Size,type="random")
    
this way the function takes the extent of the *Layer*, the number of points is taken from the *Size* parameter and the type po point generation is *random*

2. Write the line that contains the parameters of the output:: 

    Output=SpatialPointsDataFrame(pts, as.data.frame(pts))
    
The final script should look like:

.. image:: img/r_intro/r_intro_8.png

Save it and run it, clicking on the running button. 

In the new window type in the right parameters:

.. image:: img/r_intro/r_intro_9.png

and click on run.

Resulting points will be displayed in the map canvas

.. image:: img/r_intro/r_intro_10.png


R - Processing syntax
---------------------
Beware that Processing uses some special syntax to get the results out of R:

* ``>`` before your command, as in ``>lillie.test(Layer[[Field]])`` means the result should be sent to R output (Result viewer)
* ``+`` after a plot to call overlay plots. For example ``plot(Layer[[X]], Layer[[Y]]) + abline(h=mean(Layer[[X]]))``
